#!/usr/bin/env python3

from flask import Flask
from flask_cors import CORS

from .ext import mqtt, api


def create_app():
    app = Flask(__name__)
    CORS(app)
    app.config.from_object("webapp.config.Development")

    mqtt.init_app(app)
    api.init_app(app)

    return app
