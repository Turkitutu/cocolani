import math, time

class ParseGames:
    def __init__(self, client, server):
        self.server = server
        self.client = client

    def handleGames(self, gid, score):
        print(gid)
        values = self.server.games[str(gid)]
        if score >= values[0]:
            medal_id = 0
            if score >= values[4]:
                medal_id = 3
            elif score >= values[3]:
                medal_id = 2
            elif score >= values[2]:
                medal_id = 1

            if medal_id != 0:
                self.sendMedals(gid, medal_id)
            pruse = math.ceil(score/values[1])
            self.client.coins[self.client.room.tribe-1] += pruse
            self.client.sendCoins()

        if not gid in self.client.games:
            self.client.games.append(gid)

        if gid == 3:
            self.client.puzzleHandler.towersqk = True



    def sendMedals(self, gid, id):
        if not (gid in self.client.medals and self.client.medals[gid] >= id):
            self.client.medals[gid] = id
            res = {}
            res['_cmd'] = 'interface'
            res['newmed'] = str(gid)+':'+str(id)
            res['sub'] = 'med'
            res['md'] = ",".join(map(lambda m: "%s:%s" %(m[0], m[1]), self.client.medals.items()))
            self.client.sendXtResObj(res)