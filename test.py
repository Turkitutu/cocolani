import atexit


def exit_handler():
    f = open('text.txt','a+')
    f.write('fffff')
    f.close()



#atexit.register(exit_handler)




