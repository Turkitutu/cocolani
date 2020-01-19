import xml.etree.ElementTree as xmlET
import xmltodict

class Room(object):
    def __init__(self, server, id):
        self.server = server
        self.id = id
        self.tribe = 0
        self.maxPlayers = 0
        self.maxSpectators = 0
        self.temp = 1 #??
        self.lmb = 1 #??
        self.isPrivate = False
        self.game = False #??
        self.doorTime = 0

        self.name = {}

        self.players = {}

        r = self.server.roomList[str(self.id)]
        self.maxPlayers = r['maxPlayers']
        self.maxSpectators = r['maxSpectators']
        self.name[0] = r['name']['EN']
        self.name[1] = r['name']['AR']
        self.tribe = r['tribe']
        if r.get('stats') != None:
            self.stats = r['stats'].copy()

    def addPlayer(self, player):
        if not player.playerName in self.players:
            self.players[player.playerName] = player
            player.room = self
            self.sendPlayerEnter(player)

    def removePlayer(self, player):
        if player.playerName in self.players:
            self.sendPlayerGone(player)
            del self.players[player.playerName]


    def sendAllOthers(self, senderPlayer, t, action, r, body='', x=False):
        for player in list(self.players.values()):
            if not player == senderPlayer:
                player.sendBody(t, action, r, body, x)

    def sendXtResAllOthers(self, senderPlayer, res, xml=''):
        for player in list(self.players.values()):
            if not player == senderPlayer:
                player.sendXtResObj(res, xml)

    def sendSysAllOthers(self, senderPlayer, res, xml=''):
        for player in list(self.players.values()):
            if not player == senderPlayer:
                player.sendSysObjNew(res, xml)

    def sendUpdateVarsAllOthers(self, senderPlayer, variables):
        for player in list(self.players.values()):
            if not player == senderPlayer:
                player.sendVarsUpdate(senderPlayer, variables)


    def sendAll(self, senderPlayer, t, action, r, body='', x=False):
        for player in list(self.players.values()):
            player.sendBody(t, action, r, body, x)

    def sendPlayerEnter(self, player):
        info = self.getPlayerInformation(player)
        self.sendAllOthers(player, 'sys', 'uER', str(self.id), info, x=False)

    def sendPlayerGone(self, player):
        user = "<user id='"+str(player.playerCode)+"' />"
        self.sendAllOthers(player, 'sys', 'userGone', str(self.id), user, x=False)

    def getPlayerList(self, senderPlayer):
        uLs = "<uLs>"
        for player in list(self.players.values()):
            uLs += self.getPlayerInformation(player, senderPlayer)
        uLs += '</uLs>'
        return uLs

    def getPlayerInformation(self, player, senderPlayer=None):
        u = "<u i='"+str(player.playerCode)+"' m='"+str(player.rankID)+"' s='"+str(int(player.isSpectator))+"'>"
        u += "<n><![CDATA["+player.playerName+"]]></n>"
        u += "<vars>"
        u += "<var n='hpy' t='s'><![CDATA["+str(player.happy)+"]]></var>"
        if player.pth != None and player.cld != None:
            u += "<var n='pth' t='b'><![CDATA["+str(int(player.pth))+"]]></var>"
            u += "<var n='cld' t='b'><![CDATA["+str(int(player.pth))+"]]></var>"
        clothes = ",".join(map(str, player.clothes))
        u += "<var n='clth' t='s'><![CDATA["+clothes+"]]></var>"
        if not player == senderPlayer:
            ps = ",".join(map(str, [player.x, player.y, player.face]))
            u += "<var n='ps' t='s'><![CDATA["+ps+"]]></var>"
        if player.stsid != None:
            u += "<var n='stsid' t='n'><![CDATA["+str(player.stsid)+"]]></var>"
        if player.stob != None:
            u += "<var n='stob' t='n'><![CDATA["+str(player.stob)+"]]></var>"
        u += "<var n='usr' t='n'><![CDATA[7]]></var>" # rank in profile maybe
        u += "<var n='trb' t='n'><![CDATA["+str(player.tribe)+"]]></var>"
        chrc = str(player.gender)+'!'+player.mask+'!'+player.maskcl
        u += "<var n='chr' t='s'><![CDATA["+chrc+"]]></var>"
        if player.isChief:
            u += "<var n='chief' t='s'><![CDATA[1]]></var>"
        u += "<var n='abt' t='s'><![CDATA["+player.profileMessage+"]]></var>"
        u += "<var n='cr' t='n'><![CDATA["+str(player.previousRoom)+"]]></var>"
        u += "</vars></u>"
        return u

    def getRmXml(self, lang=0):
        element = xmlET.Element('rm')
        element.set('id', str(self.id))
        element.set('priv', '1' if self.isPrivate else '0')
        element.set('temp', str(self.temp))
        element.set('game', str(self.game))
        element.set('ucnt', str(len(self.players)))
        element.set('lmb', str(self.lmb))
        scnt = 0
        for playerName, player in self.players.items():
            if player.isSpectator:
                scnt += 1
        element.set('scnt', str(scnt))
        element.set('maxu', str(self.maxPlayers))
        element.set('maxs', str(self.maxSpectators))

        name = xmlET.SubElement(element, 'n')
        name.text = self.name[lang]
        return xmlET.tostring(element, method='xml').decode('utf-8')

    def ChangeStat(self, index, value, _time=None):
        if hasattr(self, 'stats'):
            if self.stats.get(index) != None:
                if (index != 'door') or (_time == self.doorTime or _time == None):
                    self.stats[index] = str(value)
                    for name, player in self.players.items():
                        data = {}
                        data['vars'] = {'var':{'@n':index, '@t':'n', '#text':str(value)}}
                        body = xmltodict.unparse(data, full_document=False)
                        player.sendBody('sys', 'rVarsUpdate', self.id, body)
