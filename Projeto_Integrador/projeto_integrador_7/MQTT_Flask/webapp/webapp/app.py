from flask import Flask
from flask_cors import CORS

from webapp.ext import mqtt


def create_app():
    app = Flask(__name__)
    CORS(app)
    app.config.from_object("webapp.config.DevConfig")

    mqtt.init_app(app)

    return app
