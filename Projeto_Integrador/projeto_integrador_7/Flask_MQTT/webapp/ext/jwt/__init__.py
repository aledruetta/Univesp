from flask_jwt import JWT
from passlib.hash import pbkdf2_sha512

from webapp.ext.api.models import UserAuth


def authenticate(email, password):
    user = UserAuth.query.filter(UserAuth.email == email).scalar()
    if pbkdf2_sha512.verify(password, user.password):
        return user


def identity(payload):
    return UserAuth.query.filter(UserAuth.id == payload["identity"]).scalar()


def init_app(app):
    jwt = JWT()
    jwt.authentication_handler(authenticate)
    jwt.identity_handler(identity)
    jwt.init_app(app)
