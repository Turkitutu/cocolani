import requests

def registe(username):
    url = 'http://www.safariserver.ga/php/req/register.php'
    data = {
        'birthdate':'1955/5/1',
        'firstname':'ffff',
        'lastname':'dfggf',
        'email':'g@gmai.com',
        'sex':'M',
        'mask':'0,0,0,0',
        'clan':'2',
        'password':'123456789',
        'maskcl':'46,23,18|255,170,0|255,5,6|255,170,0',
        'lang_id':'1',
        'username':username
    }

    r = requests.post(url, data=data)
    print(r.text)


for n in range(2):
    registe('هيثم'+str(n))