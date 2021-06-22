from functools import partial
from flask_sqlalchemy import SQLAlchemy
import sqlalchemy
from flask import request
from flask_jwt import jwt_required, current_identity
from flask_restful import Resource
from marshmallow import Schema, ValidationError, fields, validate
from passlib.hash import pbkdf2_sha512

from webapp.ext.api.repository import MqttRepository as mqtt
from webapp.ext.api.repository import ThingRepository as thing
from webapp.ext.api.repository import UserRepository as user

# HTTP RESPONSE CODES
CREATED = 201
BAD_REQUEST = 400
ANAUTHORIZE = 401
NOT_FOUND = 404

locales = ["pt_BR", "pt"]


class UserSchema(Schema):
    email = fields.Email(required=True)
    password = fields.Str(required=True, validate=validate.Length(min=8, max=30))


class ThingSchema(Schema):
    email = fields.Email(required=True)
    mac = fields.Str(required=True, validate=validate.Length(equal=6))


class ApiUser(Resource):
    def post(self):
        try:
            UserSchema().load(request.json)
        except ValidationError as err:
            return err.messages, BAD_REQUEST

        email = request.json["email"].lower()
        password = request.json["password"]
        hashed_password = pbkdf2_sha512.hash(password)

        try:
            user.save(email, hashed_password)
            mqtt.save_user(email, password)
        except sqlalchemy.exc.IntegrityError:
            return {"error": "O recurso já existe!"}, BAD_REQUEST

        return {"resposta": "Created!"}, CREATED

    @jwt_required()
    def get(self):
        if not current_identity.is_admin:
            return {"erro": "Erro de Autorização!"}, ANAUTHORIZE

        users = user.get_all()
        return {"usuarios": [u.json() for u in users]}


class ApiThing(Resource):
    @jwt_required()
    def post(self):
        try:
            ThingSchema().load(request.json, partial=("email",))
        except ValidationError as err:
            return err.messages, BAD_REQUEST

        mac = request.json["mac"].upper()
        email = current_identity.email

        try:
            u = user.get_by_email(email)
            thing.save(mac, u)
            mqtt.save_thing(mac, email)
            return {"resposta": "Created!"}, CREATED
        except AttributeError:
            return {"error": "Recurso inexistente!"}, NOT_FOUND
        except sqlalchemy.exc.IntegrityError:
            return {"error": "O recurso já existe!"}, BAD_REQUEST

    @jwt_required()
    def get(self):
        args = request.args
        if "isMy" in args and args["isMy"] == "true":
            try:
                u = user.get_by_email(current_identity.email)
                return {"cosas": [t.json() for t in u.things]}
            except AttributeError:
                return {"error": "Recurso inexistente!"}, NOT_FOUND

        if not current_identity.is_admin:
            return {"erro": "Erro de Autorização!"}, ANAUTHORIZE

        things = thing.get_all()
        return {"coisas": [t.json() for t in things]}
