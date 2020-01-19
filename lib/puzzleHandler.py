import math, time
"""
0 : gem

"""
class PuzzleHandler:
    def __init__(self, client, server):
        self.server = server
        self.client = client
        self.towersqk = False

    def puzzleHandler(self, cmd, variables):
        if cmd == 'bribe':
            self.client.coins[self.client.tribe-1] -= 50
            self.client.sendCoins()
            res = {}
            res['_cmd'] = 'sceneRep'
            res['sub'] = 'bribe'
            res['res'] = True
            self.client.sendXtResObj(res)

        elif cmd == 'scrt':
            if self.towersqk:
                if variables.get('qk') == 1:
                    self.towersqk = False
            else:
                self.client.room.ChangeStat('door', 1)
                
        else:
            print(variables)
            print('new puzzle : '+cmd)

    def jungle_temple(self, cmd, variables):
        if cmd == 'gem':
            id = int(variables['id'])
            if id == 5:
                code = self.client.getInvCodeByID(id)
                if not 0 in self.client.puzzleVars and code != None:
                    self.client.inventory.pop(code)
                    self.client.sendDeleteObject(code)
                    self.client.puzzleVars.append(0)
                    self.sendUpdatePuzzleVars()

            else:
                print('new gem ???')
                print(variables)

        elif cmd == 'door':
            t = int(time.time())
            self.client.room.ChangeStat('door', 1)
            self.client.room.doorTime = t
            self.client.call_later(7, self.client.room.ChangeStat, 'door', 0, t)
            
        else:
            print('jungle_temple cmd : '+cmd)
            print(variables)


    def sendInvVars(self, id):
        res = {}
        res['_cmd'] = 'sceneRep'
        res['sub'] = 'puz'
        res['invvar'] = ",".join(map(str, self.client.invVars))
        res['id'] = str(id)
        self.client.sendXtResObj(res)

    def sendUpdatePuzzleVars(self):
        res = {}
        res['_cmd'] = 'sceneRep'
        res['sub'] = 'puz'
        res['pzlupd'] = ",".join(map(str, self.client.puzzleVars))
        self.client.sendXtResObj(res)
