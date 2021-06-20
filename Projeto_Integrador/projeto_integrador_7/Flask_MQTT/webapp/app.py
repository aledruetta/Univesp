#!/usr/bin/env python3

import logging
import os

from flask import Flask

from webapp.ext import api, db, jwt


def create_app():
    app = Flask(__name__)
    logging.basicConfig(filename="log.txt", level=logging.DEBUG)

    if os.environ["FLASK_ENV"] == "production":
        app.config.from_object("webapp.config.Production")
    elif os.environ["FLASK_ENV"] == "development":
        app.config.from_object("webapp.config.Development")
    else:
        app.config.from_object("webapp.config.Testing")

    db.init_app(app)
    jwt.init_app(app)
    api.init_app(app)

    return app
