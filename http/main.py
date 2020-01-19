import flask, logging, sqlite3, hashlib, time
import re
from languages import languages

app = flask.Flask(__name__)
#log = logging.getLogger('werkzeug')
#log.disabled = True

secret_key = 'HKsgs>hwk^#HyatSuKI^MaSsi.jdjdn{'

@app.route('/crossdomain.xml')
def crossdomain():
    resp = flask.make_response(flask.render_template('crossdomain.xml'))
    resp.headers['Content-type'] = 'text/xml; charset=utf-8'
    return resp


@app.route('/registrationData.php', methods=['GET', 'POST'])
def registrationData():
    resp = flask.make_response(flask.render_template('reg_data.xml'))
    resp.headers['Content-type'] = 'text/xml; charset=utf-8'
    return resp


@app.route('/checkusername.php', methods=['GET', 'POST'])
def checkusername():
    lang = getLang(flask.request.values.get('lang_id'))
    username = flask.request.values.get('username')
    if username != None:
        Cursor.execute("select * from users where lower(username) = lower(?)", [username])
        rs = Cursor.fetchone()
        if rs:
            return lang.error.username_exist
        else:
            return 'result=true'
    else:
        return lang.error.request




@app.route('/register.php', methods=['GET', 'POST'])
def register():
    lang_id = flask.request.values.get('lang_id')
    username = flask.request.values.get('username')
    password = flask.request.values.get('password')
    email = flask.request.values.get('email')
    birthdate = flask.request.values.get('birthdate')
    firstname = flask.request.values.get('firstname')
    lastname = flask.request.values.get('lastname')
    gender = flask.request.values.get('sex')
    tribe = flask.request.values.get('clan')
    mask = flask.request.values.get('mask')
    maskcl = flask.request.values.get('maskcl')

    lang = getLang(lang_id)

    if username != None and password != None and email != None and birthdate != None and firstname != None and lastname != None and gender != None and tribe != None and mask != None and maskcl:

        if re.match("^[ؠ-يa-zA-Z0-9_.-]+$", username) == None and len(username) < 2 and len(username) > 24:
            return lang.error.username_invalid
        if re.match("^[ؠ-يa-zA-Z0-9_.-]+$", firstname) == None and len(firstname) < 2 and len(firstname) > 24:
            return lang.error.firstname_invalid
        if re.match("^[ؠ-يa-zA-Z0-9_.-]+$", lastname) == None and len(lastname) < 2 and len(lastname) > 24:
            return lang.error.lastname_invalid
        if len(password) < 6:
            return lang.error.password_invalid
        if re.match("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", email) == None:
            return lang.error.email_invalid
        if re.match("^\d{4}\/\d{1,2}\/\d{1,2}$", birthdate) == None:
            return lang.error.request
        if not gender in ['M', 'F']:
            return lang.error.request
        if not tribe in ['1', '2']:
            return lang.error.request
        if re.match("^\d,\d,\d,\d$", mask) == None:
            return lang.error.request
        if re.match("^-?\d+,-?\d+,-?\d+\|-?\d+,-?\d+,-?\d+\|-?\d+,-?\d+,-?\d+\|-?\d+,-?\d+,-?\d+$", maskcl) == None:
            return lang.error.request


        tribe = 1 if tribe == '1' else 2
        room_id = 4 if tribe == '1' else 14
        password = hashlib.md5((secret_key+password).encode()).hexdigest()

        Cursor.execute("select * from users where lower(username) = lower(?)", [username])
        rs = Cursor.fetchone()
        if rs:
            return lang.error.username_exist
        else:
            Cursor.execute("insert into users(username, password, email, reg_lang, reg_date, gender, firstname, lastname, birthdate, tribe, room_id, mask, mask_color, coins) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [username, password, email, lang_id, int(time.time()), gender, firstname, lastname, birthdate, tribe, room_id, mask, maskcl, '999,999'])
            return 'response=true&reg=0'
    else:
        return lang.error.request


def getLang(id):
    if id != None:
        if hasattr(languages, '_'+str(id)):
            return getattr(languages, '_'+str(id))
    return languages._0


# Connection SQLite Players Database
Database, Cursor = None, None
Database = sqlite3.connect("../data.db", check_same_thread = False)
Database.text_factory = str
Database.isolation_level = None
Database.row_factory = sqlite3.Row
Cursor = Database.cursor()


