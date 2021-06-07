import sqlalchemy
from flask import request
from flask_jwt import jwt_required
from flask_restful import Resource
from passlib.hash import sha256_crypt
from validate_email import validate_email

from webapp.ext.api.models import Thing
from webapp.ext.api.models import UserAuth
from webapp.ext.db import db

HTTP_RESPONSE_CREATED = 201
HTTP_RESPONSE_BAD_REQUEST = 400
HTTP_RESPONSE_ANAUTHORIZE = 401
HTTP_RESPONSE_NOT_FOUND = 404


class ApiUser(Resource):
    def post(self):
        email = request.json["email"]

        if not validate_email(email, check_smtp=False):
            return {"error": "Email inválido!"}, HTTP_RESPONSE_BAD_REQUEST

        password = sha256_crypt.hash(request.json["password"])

        try:
            user = UserAuth(email=email, password=password)
            db.session.add(user)
            db.session.commit()
        except sqlalchemy.exc.IntegrityError:
            return {"error": "A conta de usuário já existe!"}, HTTP_RESPONSE_BAD_REQUEST

        return {"response": "Created!"}, HTTP_RESPONSE_CREATED

    @jwt_required()
    def get(self):
        users = UserAuth.query.all()
        return {"usuarios": [user.json() for user in users]}


class ApiUserId(Resource):
    @jwt_required()
    def get(self, user_id):
        try:
            user = UserAuth.query.get(user_id)
            return {"usuario": user.json()}

        except AttributeError:
            return {"error": "Recurso inexistente!"}, HTTP_RESPONSE_NOT_FOUND


class ApiThing(Resource):
    @jwt_required()
    def post(self):
        body = request.json
        user = UserAuth.query.filter_by(email=body["email"]).first()
        thing = Thing(mac=body["mac"], user=user)
        db.session.add(thing)
        db.session.commit()

        return {"response": "Created!"}, HTTP_RESPONSE_CREATED

    @jwt_required()
    def get(self):
        things = Thing.query.all()

        return {"coisas": [thing.json() for thing in things]}


class ApiThingId(Resource):
    @jwt_required()
    def get(self, thing_id):
        try:
            thing = UserAuth.query.get(thing_id)
            return {"usuario": thing.json()}

        except AttributeError:
            return {"error": "Recurso inexistente!"}, HTTP_RESPONSE_NOT_FOUND
