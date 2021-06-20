import sqlalchemy
from flask import request
from flask_jwt import jwt_required
from flask_restful import Resource
from passlib.hash import pbkdf2_sha512
from validate_email import validate_email

from webapp.ext.api.repository import ThingRepository as thing
from webapp.ext.api.repository import UserRepository as user
from webapp.ext.api.repository import MqttRepository as mqtt

HTTP_RESPONSE_CREATED = 201
HTTP_RESPONSE_BAD_REQUEST = 400
HTTP_RESPONSE_ANAUTHORIZE = 401
HTTP_RESPONSE_NOT_FOUND = 404


class ApiUser(Resource):
    def post(self):
        email = request.json["email"]

        if not validate_email(email, check_smtp=False):
            return {"error": "Email inválido!"}, HTTP_RESPONSE_BAD_REQUEST

        password = request.json["password"]
        hashed_password = pbkdf2_sha512.hash(password)

        try:
            user.save(email, hashed_password)
            mqtt.save_user(email, password)
        except sqlalchemy.exc.IntegrityError:
            return {"error": "A conta de usuário já existe!"}, HTTP_RESPONSE_BAD_REQUEST

        return {"resposta": "Created!"}, HTTP_RESPONSE_CREATED

    @jwt_required()
    def get(self):
        users = user.get_all()
        return {"usuarios": [user.json() for user in users]}


class ApiUserId(Resource):
    @jwt_required()
    def get(self, user_id):
        try:
            u = user.get_by_id(user_id)
            return {"usuario": u.json()}
        except AttributeError:
            return {"error": "Recurso inexistente!"}, HTTP_RESPONSE_NOT_FOUND


class ApiThing(Resource):
    @jwt_required()
    def post(self):
        mac = request.json["mac"]
        email = request.json["email"]

        try:
            u = user.get_by_email(email)
            thing.save(mac, u)
            mqtt.save_thing(mac, email)
            return {"resposta": "Created!"}, HTTP_RESPONSE_CREATED
        except AttributeError:
            return {"error": "Recurso inexistente!"}, HTTP_RESPONSE_NOT_FOUND

    @jwt_required()
    def get(self):
        things = thing.get_all()

        return {"coisas": [thing.json() for thing in things]}


class ApiThingId(Resource):
    @jwt_required()
    def get(self, thing_id):
        try:
            t = thing.get_by_id(thing_id)
            return {"thing": t.json()}

        except AttributeError:
            return {"error": "Recurso inexistente!"}, HTTP_RESPONSE_NOT_FOUND
