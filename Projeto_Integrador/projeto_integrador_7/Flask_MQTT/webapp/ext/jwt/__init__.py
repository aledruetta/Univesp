from flask_jwt import JWT
from passlib.hash import pbkdf2_sha512

from webapp.ext.api.models import UserAuth


def authenticate(email, password):
    user = UserAuth.query.filter_by(email=email).first()
    if pbkdf2_sha512.verify(password, user.password):
        return user


def identity(payload):
    user_id = payload["identity"]
    return UserAuth.query.get(user_id)


def init_app(app):
    jwt = JWT(app, authenticate, identity)
