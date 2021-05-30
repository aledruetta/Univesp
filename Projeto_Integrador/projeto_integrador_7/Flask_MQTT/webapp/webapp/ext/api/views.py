from datetime import datetime

from flask_restful import Resource

from webapp.ext.auth import UserAuth
from webapp.ext.db import db

HTTP_RESPONSE_CREATED = 201
HTTP_RESPONSE_NOT_FOUND = 404


class ApiUserAll(Resource):
    def get(self):
        usuarios = UserAuth.query.all()

        return {"usuarios": [user.json() for user in usuarios]}


class ApiUser(Resource):
    def get(self, user_id):
        try:
            usuario = UserAuth.query.get(user_id)
            return {"usuario": usuario.json()}

        except AttributeError:
            return {"error": "Recurso inexistente!"}, HTTP_RESPONSE_NOT_FOUND


class ApiThingAll(Resource):
    def get(self):
        ...


class ApiThing(Resource):
    def get(self, thing_id):
        ...
