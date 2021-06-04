#!/usr/bin/env python3

import os

from flask import Flask
from flask_cors import CORS

from webapp.ext import api, auth, db, jwt, mqtt, site


def create_app():
    app = Flask(__name__)
    CORS(app)

    if os.environ["FLASK_ENV"] == "development":
        app.config.from_object("webapp.config.Development")
    else:
        app.config.from_object("webapp.config.Production")

    db.init_app(app)
    jwt.init_app(app)
    auth.init_app(app)
    mqtt.init_app(app)
    api.init_app(app)
    site.init_app(app)

    return app
