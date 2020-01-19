import asyncio, os
from colorama import Fore, Back, Style, init
init(convert=True)

from client import Client
from server import Server




"""
from aioconsole import *
async def commandLoop():
    while True:
        a = await ainput('>>')
        print(a)
"""

if __name__ == '__main__':
    os.system('title Cocolani server v1.0')
    text =  '   ______                 __            _                                      '.center(115)+'\n'
    text += '  / ____/___  _________  / /___ _____  (_)  ________  ______   _____  _____    '.center(115)+'\n'
    text += ' / /   / __ \\/ ___/ __ \\/ / __ `/ __ \\/ /  / ___/ _ \\/ ___/ | / / _ \\/ ___/    '.center(115)+'\n'
    text += '/ /___/ /_/ / /__/ /_/ / / /_/ / / / / /  (__  )  __/ /   | |/ /  __/ /        '.center(115)+'\n'
    text += '\\____/\\____/\\___/\\____/_/\\__,_/_/ /_/_/  /____/\\___/_/    |___/\\___/_/         '.center(115)+'\n'

    print(text.center(20))  
    print("\n")
    print('[CLS]   -> This server is made by yatsuki and massi !')
    print('[CLS]   -> Cocolani server is starting...')     
    print('\n')                                                      

    server_ = Server()
    loop = asyncio.get_event_loop()
    coro = loop.create_server(lambda: Client(server_, loop), port=9339)
    try:
        #loop.create_task(commandLoop())
        server = loop.run_until_complete(coro)
        for socket in server.sockets:
            print('[CLS]   Gateway started on {}'.format(socket.getsockname()))
    except:
        print("[CLS]   "+Fore.RED+"Gateway failed to start on port 9339 !"+Style.RESET_ALL)

    loop.run_forever()


