import xml.etree.ElementTree as xmlET
from xml.sax.saxutils import escape
import xmltodict
import json, time

def findall(data, index):
    v = data.get(index)
    return v if type(v) == list else [] if v == None else [v]
xmltodict.findall = findall


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

class ParsePackets:
    def __init__(self, player, server):
        self.client = player
        self.server = player.server
        self.Cursor = player.Cursor
        self.gameList = "<msg t='xt'><body action='xtRes' r='-1'><![CDATA[<dataObj><var n='sub' t='s'>med</var><var n='_cmd' t='s'>interface</var><var n='list' t='s'>1%Mahjonng#2%Temple Run#3%Temple Towers#4%Lava crossing#5%Lunch with a Mole#7%Aerial Defense#8%Gem Mining#9%Cacti Sweeper#10%Racer#11%Cog Calamity#12%Sheep Shelter#13%Fishing#14%Yeknom Temple Puzzle#15%Jungle Gems#16%Coconut Catch#17%Lava Tubing#18%Volcanic Gemtwist#21%Marble Madness</var></dataObj>]]></body></msg>"

    def getXtReqObj(self, dataObj):
        obj = {}
        obj['vars'] = {}
        for o in dataObj.find('obj').findall('var'):
            t = o.get('t')
            value = ''
            if t == 'n':
                if o.text != 'NaN':
                    value = int(o.text)
                else:
                    value = -1
            elif t == 'b':
                value = bool(int(o.text))
            else:
                value = o.text
            obj['vars'][o.get('n')] = value

        vs = dataObj.findall('var')
        for v in vs:
            obj[v.get('n')] = v.text
        return obj

    def handleDict(self, packet):
        if packet['t'] == "xt":
            body = packet['b']
            if body['x'] == 'nav':
                self.handleNav(body['r'], body['c'], body['p'])
            else:
                print('[new body ] : '+body['x'])
        else:
            print('[New dict ] : '+str(packet))

    def handleXML(self, t, body, xml):
        action = body.get('action')
        r = int(body.get('r'))

        if t == 'sys':
            body = dict(xmltodict.parse(xml, force_cdata=True)['msg']['body'])
            self.handleSysActions(r, action, body)

        elif t == 'xt':
            if action == "xtReq":
                dataObj = body.text
                if dataObj != None:
                    obj = self.getXtReqObj(xmlET.fromstring(dataObj))
                    self.handleXtReqObj(r, obj['name'], obj['cmd'], obj['vars'])
                else:
                    print('[New xtReq data] '+xml)
            else:
                print('[New xt data] '+xml)
        else:
            print('[New type] : '+t+', xml : '+xml)


    def handleNav(self, room, cc, p):
        if cc == 'wlk':
            self.client.cld = p['v']['cld']
            ps = p['v']['ps']
            dst = p['v']['dst']
            self.client.pth = False if p['v'].get('pth') == None else bool(int(p['v']['pth']))
            data = '<vars>'
            data += "<var n='ps' t='s'><![CDATA["+ps+"]]></var>"
            data += "<var n='dst' t='s'><![CDATA["+dst+"]]></var>"
            data += "</vars><user id='"+str(self.client.playerCode)+"' />"
            self.client.room.sendAllOthers(self.client, 'sys', 'uVarsUpdate', room, data)

        elif cc == 'mov':
            ps = p['ps'].split(',')
            self.client.x = float(ps[0])
            self.client.y = float(ps[1])
            self.client.face = int(ps[2])

        elif cc == 'setBusy':
            self.client.isBusy = (len(p) > 0)

        elif cc == 'act':
            id = p['id']
            if p['ud']:
                ps = p['ps'].split(',')
                self.client.x = float(ps[0])
                self.client.y = float(ps[1])
                res = {}
                res['_cmd'] = 'action'
                res['usr'] = self.client.playerCode
                res['act'] = id
                res['ps'] = p['ps']
                self.client.room.sendXtResAllOthers(self.client, res)

        elif cc == 'sit':
            t = p['t']
            if len(t) == 0:
                self.client.stsid = None
                self.client.stob = None
            else:
                self.client.stsid = t['stsid']
                self.client.stob = t['stob']
            res = {}
            res['stsid'] = self.client.stsid
            res['stob'] = self.client.stob
            self.client.room.sendUpdateVarsAllOthers(self.client, res)

        else:
            print('[new cc ] : '+cc)


    def handleSysActions(self, room, action, body):
        print(body)
        if action == 'verChk':
            self.client.sendBodyNew('sys', 'apiOK', 0)

        elif action == 'rndK':
            k  = self.server.secret_key
            self.client.sendBodyNew('sys', 'rndK', -1, {'k':k})

        elif action == 'login':
            if room == 0:
                zone = body.get('login').get('@z')
                playerName = body.get('login').get('nick').get('#text')
                password = body.get('login').get('pword').get('#text')
                self.client.login(playerName, password)

        elif action == 'loadB':
            self.client.parseBuddy.sendBuddyList()

        elif action == 'getRmList':
            self.client.sendRmList()

        elif action == 'setRvars':
            # (pr:boolean) true if the variable is privte.
            # (pe:boolean) if the variable is persistent (will continue to exist when the user goes to another room).
            # always put them both false
            _vars = xmltodict.findall(body['vars'], 'var')
            for var in _vars:
                if hasattr(self.client.room, 'stats'):
                    index = var['@n']
                    value = int(var.text)
                    self.client.room.ChangeStat(index, value)
                else:
                    print('New room has setRvars')
                    print(body)


        elif action == 'autoJoin':
            data = {'pid':{'@id':'0'}, 'vars':{}, 'uLs':{'@r':str(self.client.currentRoom)}}
            self.client.sendBodyNew('sys', 'joinOK', 1, data)

        elif action == 'joinRoom':
            info = body.get('room')
            id = int(info.get('@id'))
            password = info.get('@pwd')
            spectators = int(info.get('@spec'))
            leave = int(info.get('@leave'))
            lastRoomID = int(info.get('@old'))
            if id == 18:
                data = {'pid':{'@id':'0'}, 'vars':{}, 'uLs':{'@r':'18'}}
                self.client.sendBodyNew('sys', 'joinOK', 18, data)
            else: 
                self.client.joinRoom(id)

        elif action == 'pubMsg':
            message = body.get('txt').get('#text')
            if message.startswith('/'):
                cmd = self.server.entities(message[1:], 'decode')
                self.client.testCommands(cmd)
            else:
                self.client.sendRoomMessage(message)

        elif action == 'asObj':
            asObj = xmltodict.parse(body['#text'], force_cdata=True)
            cmd = ''
            variables = {}
            vs = xmltodict.findall(asObj, 'var')
            for v in vs:
                if v.get('@n') == 'cmd':
                    cmd = v.get('#text')
                else:
                    if v.get('@t') == 'n':
                        variables[v.get('@n')] = int(v.text)
                    elif v.get('@t') == 'b':
                        variables[v.get('@n')] = bool(int(v.text))
                    else:
                        variables[v.get('@n')] = str(v.text)
            self.handleAsObj(room, cmd, variables)

        elif action == 'logout':
            self.client.close()

        elif action == 'addB':
            player = self.server.getPlayer(body.get('n').get('#text'))
            if player != None:
                self.client.parseBuddy.sendRequest(player)

        elif action == 'bPrm':
            n = body.get('n')
            res = n.get('@res')
            name = n.get('#text')

            if res == 'g':
                self.client.parseBuddy.sendAcceptRequest(name)
            elif res == 'r':
                self.client.parseBuddy.sendRejectRequest(name)

        elif action == 'remB':
            playerName = body.get('n').get('#text')
            self.client.parseBuddy.removeBuddy(playerName)

        elif action == 'prvMsg':
            playerCode = int(body.get('txt').get('@rcp'))
            message = body.get('txt').get('#text')
            if self.client.check_flood('prvmsg', 1):
                player = self.server.getPlayerByCode(playerCode)
                self.client.parseBuddy.sendPrivateMessage(player, message)
            else:
                self.client.sendServerError(13)

        else:
            print('[New sys action] : '+action)
            print(body)

    def handleXtReqObj(self, room, name, cmd, variables):
        if name == 'gameManager':
            if cmd == 'list':
                self.client.sendXML(self.gameList)

            elif cmd == 'submitHS':
                isWin = variables.get('win')
                gid = variables.get('gid')
                score = variables.get('hs')
                time = variables.get('parm1')
                md = variables.get('parm2')

                self.client.parseGames.handleGames(gid, score)

            elif cmd == 'getHS':
                res = {}
                res['_cmd'] = 'gameRep'
                res['hs'] = 'اشتغلت\x015555\x02هيثم\x0146422'
                self.client.sendXtResObj(res)

            elif cmd == 'plygame':
                print('plygame')
                print(variables)

            else:
                print('[New gameManager cmd] : '+cmd)

        elif name == 'main': 
            if cmd == 'updatePref':
                self.client.prefs = variables.get('prefs')

            elif cmd == 'getExchange':
                res = {}
                res['_cmd'] = 'exchangeRt'
                res['rt'] = '1,1'
                self.client.sendXtResObj(res)

            elif cmd == 'convertCurrency':
                if 'amt' in variables and 'cur' in variables:
                    c1 = int(variables.get('cur'))
                    count = int(variables.get('amt'))
                    c1 -= 1
                    c2 = 0 if c1 == 1 else 1
                    if self.client.coins[c2] >= count:
                        self.client.coins[c2] -= count
                        self.client.coins[c1] += count
                        self.client.sendCoins()

                        res = {}
                        res['_cmd'] = 'exchangeRsp'
                        res['rt'] = 1
                        res['ambt'] = count
                        res['crfm'] = 1
                        res['amfm'] = count
                        res['crbt'] = '1'
                        res['cr'] = ",".join(map(str, self.client.coins))

                        self.client.sendXtResObj(res)
                    else:
                        pass # hack
            elif cmd == 'profile':
                playerCode = variables['id']
                self.client.sendProfile(playerCode)

            elif cmd == 'blurb':
                self.client.profileMessage = variables['val']

            elif cmd == 'getUserCounts':
                self.client.sendMapResponse()

            elif cmd == 'getChief':
                tribeID = self.client.room.tribe
                if tribeID in [1, 2]:
                    res = {}
                    res['_cmd'] = 'sceneRep'
                    res['sub'] = 'chief'
                    res['nm'] = self.server.tribes[tribeID]['chief']
                    self.client.sendXtResObj(res)

            elif cmd == 'buyINV':
                objid = variables['objid']
                if objid in self.server.objects:
                    obj = self.server.objects[objid]
                    if obj['type'] == 0:
                        code = self.server.objectCode
                        self.server.objectCode += 1
                        data = [code, objid, obj['rid'], obj['desc'][self.client.lang], obj['label'][self.client.lang], obj['type'], obj['transfer'], obj['subtype'], obj['data']]
                        self.client.inventory[code] = objid
                        self.client.sendObjectBuy(data)
                else:
                    self.client.sendLog("يبدو أنَّ هنالك مشكلة مع هذه القطعة، من فضلك أخبر إدارة اللعبة بهذا الخطأ")


            else:
                print(variables)
                print('[New main cmd] : '+cmd)

        elif name == 'puzzle_handler':
            self.client.puzzleHandler.puzzleHandler(cmd, variables)

        elif name == 'jungle_temple':
            self.client.puzzleHandler.jungle_temple(cmd, variables)
            
        else:
            print('[New dataObj] cmd : '+cmd+', name : '+name)
            print(variables)


    def handleAsObj(self, room, cmd, variables):
        if cmd.startswith('dr'):
            res = {'cmd':cmd}
            self.client.room.sendSysAllOthers(self, res)
        else:
            print('New sys obj')
            print(cmd, variables)