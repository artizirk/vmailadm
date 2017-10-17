#!/usr/bin/env python3
from functools import wraps
from bottle import route, run, template, redirect, request
import MySQLdb

def db(f):
    wraps(f)
    def internal(*args, **kwargs):
        db = MySQLdb.connect(user='arti', db='postfix')
        resp = f(*args, **kwargs, db=db)
        db.close()
        return resp
    return internal

@route('/')
def index():
    return template('index');

@route('/users')
@db
def users(db):
    c = db.cursor()
    c.execute('SELECT id, email, active FROM addresses;')
    users = c.fetchall()
    c.close()
    return template('users', users=users);

@route('/users', method='POST')
@db
def add_users(db):
    action = request.forms.get('action')
    id = request.forms.get('id', '')
    email = request.forms.get('email')
    password = request.forms.get('password')
    active = request.forms.get('active', '0')
    c = db.cursor()
    if action == "add":
        c.execute("INSERT INTO addresses (active, email, pwd) VALUES ('1', %s, ENCRYPT(%s, CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))));", (email, password))
    elif action == "delete" and id:
        c.execute("DELETE FROM addresses WHERE id=%s;", (id))
    elif action == "update" and id and email and active != None:
        c.execute("UPDATE addresses SET active=%s, email=%s WHERE id=%s;", (active, email, id))
    db.commit()
    c.close()
    return redirect('/users#id'+id)

@route('/aliases')
def aliases():
    aliases = []
    return template('aliases', aliases=aliases);


run(host='localhost', port=8080, debug=True, reloader=True)
