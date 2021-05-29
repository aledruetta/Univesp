#!/usr/bin/env python3

import os

from flask import Flask
from flask_cors import CORS

from .ext import api, mqtt


def create_app():
    app = Flask(__name__)

    if os.environ["FLASK_ENV"] == "development":
        app.config.from_object("webapp.config.Development")
    else:
        app.config.from_object("webapp.config.Production")

    CORS(app)

    mqtt.init_app(app)
    api.init_app(app)

    return app
