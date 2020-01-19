import time
import xmltodict

class ParseBuddy:
    def __init__(self, client, server):
        self.server = server
        self.client = client
        self.Cursor = client.Cursor

    def sendBuddyList(self):
        trb = '<v n="$trb"><![CDATA['+str(self.client.tribe)+']]></v>'
        chrc = '<v n="$chr"><![CDATA['+str(self.client.gender)+'!'+self.client.mask+'!'+self.client.maskcl+']]></v>'
        a = '<mv>'+trb+chrc+'</mv>'
        self.client.sendBody('sys', 'bList', '-1', a+self.getBListEl())

    def getBListEl(self):
        bd = []
        for pid in self.client.buddy:
            player = self.server.getPlayerByID(pid)
            if player != None:
                bd.append([player.playerName, True, player.playerCode, pid in self.client.ignoredList, player.tribe, str(player.gender)+'!'+player.mask+'!'+player.maskcl])
            else:
                self.Cursor.execute("select username, tribe, gender, mask, mask_color from users where id = ?", [pid])
                rs = self.Cursor.fetchone()
                if rs:
                    bd.append([rs['username'], False, -1, pid in self.client.ignoredList, rs['tribe'], str(rs['gender'])+'!'+rs['mask']+'!'+rs['mask_color']])

        blist = "<bList>"
        for b in bd:
            blist += "<b s='"+str(int(b[1]))+"' i='"+str(b[2])+"' x='1'>"
            blist += "<n><![CDATA["+b[0]+"]]></n>"
            blist += "<vs><v n='$trb'><![CDATA["+str(b[4])+"]]></v><v n='$chr'><![CDATA["+str(b[5])+"]]></v></vs>"
            blist += "</b>"
        blist += "</bList>"
        return blist

    def sendDisconnected(self):
        for pid in self.client.buddy:
            player = self.server.getPlayerByID(pid)
            if player != None:
                b = "<b s='0' i='-1'>"
                b += "<n><![CDATA["+self.client.playerName+"]]></n>"
                b += "</b>"
                player.sendBody('sys', 'bUpd', -1, b)

    def sendConnected(self):
        for pid in self.client.buddy:
            player = self.server.getPlayerByID(pid)
            if player != None:
                b = "<b s='1' i='"+str(self.client.playerCode)+"'>"
                b += "<n><![CDATA["+self.client.playerName+"]]></n><vs>"
                b += "<v n='$trb'><![CDATA["+str(self.client.tribe)+"]]></v>"
                b += "<v n='$chr'><![CDATA["+str(self.client.gender)+"!"+self.client.mask+"!"+self.client.maskcl+"]]></v>"
                b += "</vs></b>"
                player.sendBody('sys', 'bUpd', -1, b)

    def sendAddedBuddy(self, playerName):
        player = self.server.getPlayer(playerName)
        info = []
        if player != None:
            info.append(player.playerName)
            info.append(True)
            info.append(player.playerCode)
            info.append(player.tribe)
            info.append(str(player.gender)+'!'+player.mask+'!'+player.maskcl)
        else:
            self.Cursor.execute("select username, tribe, gender, mask, mask_color from users where id = ?", [pid])
            rs = self.Cursor.fetchone()
            if rs:
                info.append(rs['username'])
                info.append(False)
                info.append(-1)
                info.append(rs['tribe'])
                info.append(str(rs['gender'])+'!'+rs['mask']+'!'+rs['mask_color'])
            else:
                return

        b = "<b s='"+str(int(info[1]))+"' i='"+str(info[2])+"'>"
        b += "<n><![CDATA["+info[0]+"]]></n><vs>"
        b += "<v n='$trb'><![CDATA["+str(info[3])+"]]></v>"
        b += "<v n='$chr'><![CDATA["+str(info[4])+"]]></v>"
        b += "</vs></b>"
        self.client.sendBody('sys', 'bAdd', -1, b)

    def sendRemovedBuddy(self, playerName):
        n = "<n><![CDATA["+playerName+"]]></n>"
        self.client.sendBody('sys', 'remB', -1, n)


    def sendRequest(self, player):
        if player.room.id == self.client.room.id:
            if self.client.check_flood('brequest', player, self.server.buddyTimeBetween):
                if len(self.client.buddy) >= self.server.maxBuddy:
                    self.client.sendServerError(9)
                    return 
                if len(player.buddy) >= self.server.maxBuddy:
                    self.client.sendServerError(10)
                    player.sendServerError(9)
                    return
                player.sendBody('sys', 'bPrm', -1, "<n><![CDATA["+self.client.playerName+"]]></n>")
            else:
                self.client.sendBody('sys', 'bUpd', -1, "<err><![CDATA[An identical request]]></err>")

    def sendAcceptRequest(self, playerName):
        player = self.server.getPlayer(playerName)

        if player != None:
            if len(self.client.buddy) >= self.server.maxBuddy or len(player.buddy) >= self.server.maxBuddy:
                return

            self.client.buddy.append(player.playerID)
            self.sendAddedBuddy(playerName)
            player.buddy.append(self.client.playerID)
            player.parseBuddy.sendAddedBuddy(self.client.playerName)
        else:
            self.Cursor.execute("select id, buddy from users where lower(username) = lower(?)", [playerName])
            rs = self.Cursor.fetchone()
            if rs:
                playerID = rs['id']
                buddy = list(map(int, filter(None, str(rs["buddy"]).split(',')))) 
                if not self.client.playerID in buddy:
                    buddy.append(self.client.playerID)
                    self.Cursor.execute("update users set buddy = ? where username = ?", [",".join(map(str, buddy)), playerName])

                if not playerID in self.client.buddy:
                    self.client.buddy.append(playerID)
                    self.sendAddedBuddy(playerName)

    def sendRejectRequest(self, player):
        pass# reject message

    def removeBuddy(self, playerName):
        player = self.server.getPlayer(playerName)
        if player != None:
            if player.playerID in self.client.buddy:
                self.client.buddy.remove(player.playerID)
                self.sendRemovedBuddy(player.playerName)

            if self.client.playerID in player.buddy:
                player.buddy.remove(self.client.playerID)
                player.parseBuddy.sendRemovedBuddy(self.client.playerName)
        else:
            self.Cursor.execute("select id, buddy from users where lower(username) = lower(?)", [playerName])
            rs = self.Cursor.fetchone()
            if rs:
                playerID = rs['id']
                buddy = list(map(int, filter(None, str(rs["buddy"]).split(',')))) 
                if self.client.playerID in buddy:
                    buddy.remove(self.client.playerID)
                    self.Cursor.execute("update users set buddy = ? where username = ?", [",".join(map(str, buddy)), playerName])

                if playerID in self.client.buddy:
                    self.client.buddy.remove(playerID)
                    self.sendRemovedBuddy(playerName)

    def checkCanRequest(self, player):
        if player.playerCode in self.client.buddyReqsTime:
            if self.server.buddyTimeBetween > int(time.time()) - self.client.buddyReqsTime[player.playerCode]:
                return False
        self.client.buddyReqsTime[player.playerCode] = int(time.time())
        return True

    def sendPrivateMessage(self, player, message):
        if player != None:
            if player.playerID in self.client.buddy:
                data = {}
                data['user'] = {'@id':self.client.playerCode}
                data['txt'] = {'#text':message}
                body = xmltodict.unparse(data, full_document=False)
                player.sendBody('sys', 'prvMsg', self.client.room.id, body)
                self.client.sendBody('sys', 'prvMsg', self.client.room.id, body)
            else:
                pass# send warning or ban




