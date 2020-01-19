import asyncio, time, traceback
import xml.etree.ElementTree as xmlET
from lib import *
import xmltodict
from xml.sax.saxutils import escape

def characters(self, content):
    if content:
        self._finish_pending_start_element()
        if not isinstance(content, str):
            content = str(content, self._encoding)
        if content[0] == '<' and content.strip()[-1] == '>':
            self._write("<![CDATA["+content+"]]>")
        else:
            self._write(escape(content))
        

xmltodict.XMLGenerator.characters = characters

class Client(asyncio.Protocol):
    def __init__(self, server, loop=None):
        self.server = server
        self.loop = loop or asyncio.get_event_loop()
        self.transport = None
        self.write = None
        self.close = None
        self.peername = None

        # integer
        self.port = 0
        self.rankID = 1 #??
        self.statusType = 0 
        self.playerCode = 0
        self.playerID = 0
        self.x = 0
        self.y = 0
        self.face = 0
        self.pth = None # ?? 
        self.cld = None # ??
        self.stob = None
        self.stsid = None
        self.playerCode = 0
        self.lang = 0
        self.tribe = 0
        self.currentRoom = 0
        self.previousRoom = 1
        self.previousTribe = 1
        self.happy = 0 # (max 100)
        self.battles = 0
        self.battlesWin = 0
        self.tribeMap = 0

        # string
        self.ip = ""
        self.playerName = ""
        self.gender = ""
        self.mask = "0,0,0,0"
        self.maskcl = "255,170,0|255,170,0|255,170,0|255,170,0"
        self.medals = "8:3,17:3,12:3,18:2,10:2,11:2,4:3,21:3,16:2"
        #self.inventory = "894715~229~1029~Crab chair~Chair~6~1~0~0|894716~238~1038~Explosion rug~Rug~6~1~1~0|948793~22~303~Butterfly ears~Butteryfly ears~3~1~0~0|1472887~16~15~Steel Bar~Steel Bar~0~0~0~0|1472951~34~409~Hard Hat~Hard hat~2~0~0~0|1477721~239~1039~Teeth rug~Rug~6~1~1~0|1477722~236~1036~Egg plant~Plant~6~1~2~0|1484332~705~705~Summer Camp Beach Ball~Beach Ball~4~1~0~0|1484360~51~35~Fuel~Fuel~0~0~0~0|1484364~4~3~Banana peel~Banana peel~0~0~0~0|1484365~3~2~Coconut~Coconut~0~0~0~0|1813007~48~32~Wooden stick~Wooden stick~0~0~0~0|1974963~702~702~Paddle~Paddle~4~1~0~0|1974998~756~756~Eish Safari Balloon~Balloon~4~1~0~0|1975046~705~705~Summer Camp Beach Ball~Beach Ball~4~1~0~0|3168899~50~34~Cloth~Cloth~0~0~0~0|3315338~27~300~Diamond ears~Diamond ears~3~1~0~0|3373651~712~712~Yeknom Shield~Yeknom Shield~4~1~0~0|3374524~1~1~Leaf 1~Leaf~0~0~0~0|3374538~2~1~Leaf 2~Leaf~0~0~0~0|3374571~60~41~Lever~Lever~0~0~0~0|3610071~229~1029~Crab chair~Chair~6~1~0~0|3613052~21~203~Flame Hair~Flame Hair~1~1~0~0|3614824~500~500~Punk Hair~Punk Hair~1~1~0~0|3615354~101~441~Green Emperor Hat~Emperor Hat~2~1~0~0"
        self.inventory = {}
        self.puzzleVars = []
        self.invVars = []
        self.profileMessage = ""
        self.regDate = ''
        self.email = ""
        self.prefs = "1,1,1" # audio / quality / toggle

        #boolean
        self.isSpectator = False
        self.isChief = False
        self.isBusy = False
        self.isVisitor = False

        # dict
        self.mails = {0:[]}
        self.medals = {}
        self.buddyReqsTime = {}
        self.antiFlood = {}

        # list
        self.coins = [0, 0]
        self.clothes = ["","","",""] #["500","409","300","702"]
        self.games = []
        self.buddy = []
        self.ignoredList = []

        self.room = None
        self.Cursor = self.server.Cursor

    def data_received(self, _packet):
        if _packet.startswith(b'<policy-file-request/>'):
            self.write(b"<cross-domain-policy><allow-access-from domain='*' to-ports='9339' /></cross-domain-policy>\x00")
        else:
            packets = _packet.split(b'\x00')
            if packets[-1] == b'':
                del packets[-1]

            for n in packets:
                packet = n.decode('utf-8')
                try:
                    t = xmlET.fromstring(packet).get('t')
                    body = self.server.xmlParser(packet, 'body')
                    if len(body) != 1:
                        print(body)
                    else:
                        self.parsePackets.handleXML(t, body[0], packet)
                except xmlET.ParseError:
                    j = json.loads(packet)
                    self.parsePackets.handleDict(j)
                except json.decoder.JSONDecodeError:
                    print('error decode json')
                except Exception as error:
                    print(str(traceback.format_exc()))

    def connection_made(self, transport):
        self.transport = transport
        self.close = transport.close
        self.write = transport.write
        self.peername = transport.get_extra_info("peername")
        self.port = self.peername[1]
        self.ip = self.peername[0]

        self.parsePackets = ParsePackets(self, self.server)
        self.parseGames = ParseGames(self, self.server)
        self.puzzleHandler = PuzzleHandler(self, self.server)
        self.parseBuddy = ParseBuddy(self, self.server)
        self.playerCode = self.server.playerCode
        self.server.playerCode += 1

    def connection_lost(self, ex):
        if self.room != None:
            self.room.removePlayer(self)
        if self.playerName in self.server.players:
            self.parseBuddy.sendDisconnected()
            self.updateDatabase()
            del self.server.players[self.playerName]

    async def _call_later(self, delay, coro, *args):
        await asyncio.sleep(delay)
        coro(*args)

    def call_later(self, delay, coro, *args):
        self.loop.create_task(self._call_later(delay, coro, *args))

    def sendXML(self, xml):
        self.write(b''+xml.encode()+b'\x00')
 
    def sendBody(self, t, action, r, body='', x=False):
        if x:
            body = xmlET.tostring(body, method='xml').decode()
        self.sendXML("<msg t='"+t+"'><body action='"+action+"' r='"+str(r)+"' >"+body+"</body></msg>")

    def sendBodyNew(self, t, action, r, body={}, x=False):
        if x:
            body = xmltodict.parse(body)
        data = {
            'msg':{
                '@t':str(t),
                'body':{
                    '@action':str(action),
                    '@r':str(r),
                    **body
                }
            }
        }
        self.sendXML(xmltodict.unparse(data, full_document=False))

    def getVar(self, index, value):
        types = {}
        types[str] = 's'
        types[int] = 'n'
        types[bool] = 'b'
        if value == None:
            return "<var n='"+str(index)+"' t='x' />"
        elif type(value) == list:
            v = "<obj o='"+index+"' t='a'>"
            for n in range(0, len(value)):
                v += self.getVar(n, value[n])
            v += "</obj>"
            return v
        else:
            t = types[type(value)]
            if t == 'b':
                value = str(int(value))
            return "<var n='"+str(index)+"' t='"+t+"'>"+str(value)+"</var>"

    def getVarNew(self, index, value):
        types = {str:'s', int:'n', bool:'b'}
        if value == None:
            return {'var':{'@n':str(index), '@t':'x'}}
        elif type(value) == list:
            array = {'@o':str(index), '@t':'a', 'var':[]}
            for n in range(0, len(value)):
                array['var'].append(self.getVarNew(n, value[n])['var'])
            return {'obj':array}
        else:
            t = types[type(value)]
            if t == 'b':
                value = str(int(value))
            return {'var':{'@n':str(index), '@t':t, '#text':str(value)}}

    def sendXtResObj(self, res, xml=''):
        v = ""
        for index, value in res.items():
            v += self.getVar(index, value)
        self.sendBody('xt', 'xtRes', -1, "<![CDATA[<dataObj>"+v+xml+"</dataObj>]]>")

    def sendXtResObjNew(self, res, xml=''):
        v = {'var':[], 'obj':[]}
        for index, value in res.items():
            var = self.getVarNew(index, value)
            if var.get('var') != None:
                v['var'].append(var['var'])
            if var.get('obj') != None:
                v['obj'].append(var['obj'])
        text = xmltodict.unparse({'dataObj':{**v}}, full_document=False)
        self.sendBodyNew('xt', 'xtRes', -1, {'#text':text})

    def sendSysObj(self, res, xml=''):
        v = "<user id='"+str(self.playerCode)+"' />"
        v += "<dataObj><![CDATA[<dataObj>"
        for index, value in res.items():
            v += self.getVar(index, value)
        v += "</dataObj>]]></dataObj>"
        self.sendBody('sys', 'dataObj', self.room.id, v+xml)

    def sendSysObjNew(res, xml=''):
        dataObj = {'var':[], 'obj':[]}
        for index, value in res.items():
            v = getVarNew(index, value)
            if v.get('var') != None:
                dataObj['var'].append(v['var'])
            if v.get('obj') != None:
                dataObj['obj'].append(v['obj'])

        text = xmltodict.unparse({'dataObj':dataObj}, full_document=False)
        v = {'user':{'@id':str(self.playerCode)}, 'dataObj':{'#text':text}}
        self.sendBodyNew('sys', 'dataObj', self.room.id, v, xml)

    def login(self, playerName, password):
        print(playerName, password)
        if not password == "" and not playerName == "":
            if self.server.checkConnectedAccount(playerName):
                self.sendServerError(12)
            else:
                self.Cursor.execute("select * from users where lower(username) = lower(?) and password = ?", [playerName, password])
                rs = self.Cursor.fetchone()
                if rs:
                    self.playerName = rs["username"]
                    self.playerID = rs["id"]
                    self.email = rs["email"]
                    self.statusType = int(rs["status_type"])
                    self.lang = int(rs["reg_lang"])
                    self.regDate = int(rs["reg_date"])
                    self.gender = rs["gender"]
                    self.firstname = rs["firstname"]
                    self.lastname = rs["lastname"]
                    self.birthdate = rs["birthdate"]
                    self.tribe = int(rs["tribe"])
                    self.isChief = bool(rs["is_chief"])
                    self.currentRoom = rs["room_id"]
                    self.mask = rs["mask"]
                    self.maskcl = rs["mask_color"]
                    self.happy = rs["happy_level"]
                    self.battles = rs["battles"]
                    self.battlesWin = rs["battles_win"]
                    self.prefs = rs["prefs"]
                    self.profileMessage = rs["profile_msg"]
                    self.coins = list(map(int, filter(None, rs["coins"].split(',')))) 
                    self.clothes = rs["clothes"].split(',')
                    for med in list(map(str, filter(None, str(rs["medals"]).split(',')))):
                        v = med.split(":")
                        self.medals[int(v[0])] = int(v[1])
                    self.games = list(map(int, filter(None, str(rs["games"]).split(',')))) 
                    for inv in list(map(int, filter(None, str(rs["inventory"]).split(',')))):
                        self.inventory[self.server.objectCode] = inv
                        self.server.objectCode += 1
                    prtb = int(rs['prtb'])
                    self.previousTribe = self.tribe if prtb == 0 else prtb
                    self.buddy = list(map(int, filter(None, str(rs["buddy"]).split(',')))) 
                    self.ignoredList = list(map(int, filter(None, str(rs["ignored"]).split(',')))) 
                    self.puzzleVars = list(map(int, filter(None, str(rs["puzzle_vars"]).split(',')))) 
                    self.invVars = list(map(int, filter(None, str(rs["inv_vars"]).split(',')))) 
                    self.server.players[self.playerName] = self
                    login = xmlET.Element('login')
                    login.set('id', str(self.playerCode))
                    login.set('mod', str(self.rankID))
                    login.set('n', self.playerName)
                    self.sendBody('sys', 'logOK', '-1', login, True)
                    self.sendXTInitResponse()
                    self.parseBuddy.sendConnected()
                    print(playerName+' logged')
                else:
                    self.sendServerError(1)

    def joinRoom(self, id):
        if id in self.server.rooms:
            if self.room != None:
                self.room.removePlayer(self)
            self.server.rooms[id].addPlayer(self)
            self.previousRoom = self.currentRoom
            self.currentRoom = id
            self.tribeMap = self.tribe if self.room.tribe == 0 else self.room.tribe
            if self.isVisitor:
                if self.tribeMap == self.tribe:
                    self.isVisitor = False
            else:
                if self.tribeMap != self.tribe:
                    self.isVisitor = True
            self.sendPlayerList()
            self.antiFlood = {}
        else:
            # warnings message
            self.close()

    def sendPlayerList(self):
        stats = ""
        if hasattr(self.room, 'stats'):
            for index, value in self.room.stats.items():
                stats += "<var n='"+str(index)+"' t='n'><![CDATA["+str(value)+"]]></var>"

        body = "<pid id='"+str(self.playerCode)+"'/><vars>"+stats
        body += "<var n='tb' t='n'><![CDATA["+str(self.tribeMap)+"]]></var></vars>"
        body += self.room.getPlayerList(self)
        self.sendBody('sys', 'joinOK', str(self.room.id), body)


    def sendRmList(self):
        rmList = ""
        for id, room in self.server.rooms.items():
            rmList += room.getRmXml(self.lang)
        self.sendBody('sys', 'rmList', '0', '<rmList>'+rmList+'</rmList>')


    def sendXTInitResponse(self):

        # unknown xml
        unknown = "<obj o='skill' t='a'><var n='0' t='s'>1</var><var n='1' t='s'>5</var></obj><obj o='tribeData' t='a'><obj o='0' t='a'><var n='chief' t='s'>1</var><var n='name' t='s'>Yeknom</var><var n='id' t='s'>1</var></obj><obj o='1' t='a'><var n='chief' t='s'>1</var><var n='name' t='s'>Huhuloa</var><var n='id' t='s'>2</var></obj></obj>"  

        res = {}
        res['_cmd'] = 'init'
        res['mail'] = str(len(self.mails))
        res['prtb'] = str(self.previousTribe)
        res['gam'] = str(",".join(map(str, self.games)))
        res['hp'] = str(self.happy)
        res['maskc'] = self.maskcl
        res['btl'] = str(self.battlesWin)+";"+str(self.battles)
        res['lang'] = str(self.lang)
        res['mask'] = self.mask
        res['motd'] = self.server.welcomeMessage[self.lang]
        res['st'] = self.statusType
        res['medals'] = ",".join(map(lambda m: "%s:%s" %(m[0], m[1]), self.medals.items()))
        res['lvl'] = ",".join(map(str, self.server.levels))
        #res['invars'] = "14,13,11,12,15,9,10,55,8,7,6,58,56,47,46,54,42,45,43" # ??
        res['invars'] = ",".join(map(str, self.invVars))
        res['sex'] = self.gender
        res['prm'] = str(self.currentRoom)
        res['tb'] = str(self.tribe)
        res['cr'] = ",".join(map(str, self.coins))
        res['prefs'] = str(self.prefs)
        inventory = []
        for iid, objId in self.inventory.items():
            obj = self.server.objects[objId]
            inventory.append(str(iid)+'~'+str(objId)+'~'+str(obj['rid'])+'~'+str(obj['desc'][self.lang])+'~'+str(obj['label'][self.lang])+'~'+str(obj['type'])+'~'+str(obj['transfer'])+'~'+str(obj['subtype'])+'~'+str(obj['data']))
        res['inv'] = "|".join(map(str, inventory))
        if self.isChief:
            res['chief'] = '1'
        res['abt'] = self.profileMessage
        res['mgam'] = "1" #??
        res['jd'] = time.strftime('%d-%m-%Y', time.localtime(self.regDate))
        res['mbr'] = "0,Visitor|1,Banned|2,Unconfirmed|3,Explorer|7,Moderator|8,Super Moderator|4,Resident" # ??
        #res['pvars'] = "2,3,4,6,5,7,8,10,9,11,21,22,13,16,15,0" # ??
        res['pvars'] = ",".join(map(str, self.puzzleVars))

        self.sendXtResObjNew(res, unknown)


    def sendRoomMessage(self, message):
        txt = {'user':{'@id':self.playerCode}, 'txt':message}
        for player in list(self.room.players.values()):
            player.sendBodyNew('sys', 'pubMsg', self.room.id, txt)

    def testCommands(self, cmd):
        if cmd.startswith("admin"):
            res={}
            res['_cmd'] = 'adminFn'
            res['sub'] = 'userList'  
            res['users'] = ['test\x013\x01hhhh\x01hhhh\x01hhhh\x01hhhh\x01hhhh\x01hhhh\x01hhhh']
            self.sendXtResObj(res)
        elif cmd == 'room':
            print(self.room.id)
        elif cmd.startswith("open"):
            self.sendBody('sys', 'rVarsUpdate', self.room.id, "<vars><var n='door' t='n'><![CDATA[1]]></var></vars>")
        elif cmd.startswith("close"):
            self.sendBody('sys', 'rVarsUpdate', self.room.id, "<vars><var n='door' t='n'><![CDATA[0]]></var></vars>")
        elif cmd == 'buddy':
            self.sendBody('sys', 'bUpd', -1, "<err><![CDATA[An identical request]]></err>")
        elif cmd.startswith("c"):
            message = cmd[1:]
            self.sendLog(message)
        elif cmd.startswith("m"):
            message = cmd[1:]
            args = message.split(' ')
            self.parseGames.sendMedals(int(args[1]), int(args[2]))

    def sendLog(self, message):
        txt = "<user id='"+str(self.playerCode)+"' /><txt><![CDATA["+message+"]]></txt>"
        self.sendBody('sys', 'dmnMsg', str(self.room.id), txt)

    def sendServerError(self, id):
        res = {}
        res['_cmd'] = 'logKO'
        res['err'] = "#ERR"+str(id)
        self.sendXtResObj(res)


    def updateDatabase(self):
        self.Cursor.execute("update users set email = ?, status_type = ?, reg_date = ?, reg_lang = ?, gender = ?, firstname = ?, lastname = ?, birthdate = ?, tribe = ?, is_chief = ?, room_id = ?, mask = ?, mask_color = ?, happy_level = ?, battles = ?, battles_win = ?, prefs = ?, profile_msg = ?, coins = ?, clothes = ?, games = ?, medals = ?, inventory = ?, prtb = ?, buddy = ?, ignored = ?, puzzle_vars = ?, inv_vars = ? where username = ?", [self.email, self.statusType, self.regDate, self.lang, self.gender, self.firstname, self.lastname, self.birthdate, self.tribe, int(self.isChief), self.currentRoom, self.mask, self.maskcl, self.happy, self.battles, self.battlesWin, self.prefs, self.profileMessage, ",".join(map(str, self.coins)), ",".join(map(str, self.clothes)), str(",".join(map(str, self.games))), ",".join(map(lambda m: "%s:%s" %(m[0], m[1]), self.medals.items())), ",".join(map(lambda inv: "%s" %inv[1], self.inventory.items())), self.tribeMap, ",".join(map(str, self.buddy)), ",".join(map(str, self.ignoredList)), ",".join(map(str, self.puzzleVars)), ",".join(map(str, self.invVars)), self.playerName])

    def sendCoins(self):
        res = {}
        res['_cmd'] = 'purse'
        res['cr'] = ",".join(map(str, self.coins))
        self.sendXtResObj(res)

    def sendProfile(self, playerCode):
        player = self.server.getPlayerByCode(playerCode)
        if player != None:
            res = {}
            res['_cmd'] = 'profile'
            res['uid'] = playerCode
            res['abt'] = player.profileMessage
            res['gam'] = ",".join(map(str, player.games))
            res['rdt'] = time.strftime('%d-%m-%Y', time.localtime(player.regDate))
            res['skl'] = '0,5'
            res['btl'] = [str(player.battlesWin), str(player.battles)]
            res['med'] = list(map(lambda m: "%s:%s" %(m[0], m[1]), (player.medals).items()))
            self.sendXtResObj(res)

    def sendMapResponse(self):
        v = 0
        l = 0
        for id, room in self.server.rooms.items():
            if room.tribe == self.tribeMap and room.tribe != 0:
                for playerName, player in room.players.items():
                    if player.tribe != room.tribe:
                        v += 1
                    else:
                        l += 1
        res = {}
        res['_cmd'] = 'interface'
        res['sub'] = 'mapResponse'
        res['data'] = [v, l]
        self.sendXtResObj(res)

    def sendObjectBuy(self, data):
        res = {}
        res['_cmd'] = 'buy'
        res['hp'] = self.happy
        res['adinv'] = "~".join(map(str, data))
        self.sendXtResObj(res)

    def sendDeleteObject(self, id):
        res = {}
        res['_cmd'] = 'dinv'
        res['id'] = id
        self.sendXtResObj(res)

    def getInvCodeByID(self, id):
        for cid, iid in self.inventory.items():
            if iid == id:
                return cid
        return None

    def sendVarsUpdate(self, player, variables):
        data = "<vars>"
        for index, value in variables.items():
            data += self.getVar(index, value)
        data += "</vars>"
        data += "<user id='"+str(player.playerCode)+"' />"
        print(data)
        self.sendBody('sys', 'uVarsUpdate', self.room.id, data)


    def check_flood(self, _type, *args):
        if _type == 'brequest':
            if not 'brequest' in self.antiFlood:
                self.antiFlood['brequest'] = {}
            if args[0].playerCode in self.antiFlood[_type]:
                if args[1] > time.time() - self.antiFlood[_type][args[0].playerCode]:
                    return False
            self.antiFlood[_type][args[0].playerCode] = time.time()
            return True
        elif _type == 'prvmsg':
            if _type in self.antiFlood:
                if args[0] > time.time() - self.antiFlood[_type]:
                    return False
            self.antiFlood[_type] = time.time()
            return True