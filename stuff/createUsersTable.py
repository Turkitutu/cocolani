import sqlite3

# Connection SQLite Players Database
Database, Cursor = None, None
Database = sqlite3.connect("./data.db", check_same_thread = False)
Database.text_factory = str
Database.isolation_level = None
Database.row_factory = sqlite3.Row
Cursor = Database.cursor()


Cursor.execute('''create table users (
    `id` integer primary key autoincrement not null,
    `username` string (24) not null,
    `password` string not null,
    `email` string not null,
    `status_type` integer (2) not null default (3), 
    `reg_lang` integer (2) not null, 
    `reg_date` integer (11) not null, 
    `gender` char (1) not null, 
    `firstname` string (24) not null, 
    `lastname` string not null, 
    `birthdate` string (15) not null, 
    `tribe` integer (1) not null, 
    `is_chief` integer (2) not null default 0, 
    `room_id` integer (11) not null, 
    `mask` string not null, 
    `mask_color` string not null, 
    `happy_level` integer (11) not null default (0), 
    `battles` integer (11) not null default (0), 
    `battles_win` integer (11) not null default (0), 
    `prefs` string not null default '1,1,0', 
    `profile_msg` text not null default ',,,', 
    `coins` string not null,
    `clothes` string not null default ''
    `medals` string not null default '');
''')

