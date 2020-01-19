import xml.etree.ElementTree as xmlET
import json, sqlite3
import time

from room import Room

class Server:
    def __init__(self):
        self.secret_key = 'HKsgs>hwk^#HyatSuKI^MaSsi.jdjdn{'
        self.rooms = {}
        self.players = {}
        self.tribes = {}
        self.playerCode = 1
        self.objectCode = 1
        self.maxBuddy = 200
        self.buddyTimeBetween = 120
        self.levels = []
        self.welcomeMessage = []
        self.Cursor = None
        self.roomList = self.loadConfig('rooms', method='json')
        self.objects = self.loadConfig('objectList', method='eval')
        self.games = self.loadConfig('gameList', method='json')


        rs = self.loadConfig('server', method='json')

        self.welcomeMessage = rs["welcome_message"]
        self.levels = rs["levels"]

        self.tribes[1] = {'chief':'لا يوجد أيُّ ملك ليكنوم\n في الوقت الحالي'}
        self.tribes[2] = {'chief':'لا يوجد أيُّ ملك لهوهولوا\n في وقت الحالي'}

        rooms = len(self.roomList)
        for n in range(1, rooms+1):
            self.rooms[n] = Room(self, n)


        # Connection SQLite Players Database
        Database, Cursor = None, None
        Database = sqlite3.connect("./data.db", check_same_thread = False)
        Database.text_factory = str
        Database.isolation_level = None
        Database.row_factory = sqlite3.Row
        self.Cursor = Database.cursor()
        print('[CLS]   Database Sync start successfully')

    def xmlParser(self, xml, index):
        root = xmlET.fromstring(xml)
        tags = index.split('-')
        for i in range(len(tags)-1):
            root = root.find(tags[i])
            if root == None:
                return None
        return root.findall(tags[-1])

    def entities(self, text, t):
        ascTab = {}
        ascTab["&"] = "&amp;"
        ascTab[">"] = "&gt;"
        ascTab["<"] = "&lt;"
        ascTab["'"] = "&apos;"
        ascTab['"'] = "&quot;"
        for index, value in ascTab.items():
            if t == 'encode':
                text = text.replace(index, value)
            elif t == 'decode':
                text = text.replace(value, index)
        return text

    def getPlayerByCode(self, playerCode):
        for playerName, player in self.players.items():
            if player.playerCode == playerCode:
                return player
        return None

    def getPlayerByID(self, playerID):
        for playerName, player in self.players.items():
            if player.playerID == playerID:
                return player
        return None

    def getPlayer(self, name):
        return None if not name in self.players else self.players[name]

    def checkConnectedAccount(self, name):
        for playerName, player in self.players.items():
            if playerName.lower() == name.lower():
                return True
        return False

    def loadConfig(self, file='', method='json'):
        data = None
        if file != '':
            try:
                f = open('config/'+file+'.json','r', encoding='utf-8')
                if method == 'json':
                    data = json.loads(f.read())
                elif method == 'eval':
                    data = eval(f.read())
                f.close()
            except:
                return None
        return data

