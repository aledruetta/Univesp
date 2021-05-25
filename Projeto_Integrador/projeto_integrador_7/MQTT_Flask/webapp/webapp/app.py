from flask import Flask
# from flask_cors import CORS
from flask_mqtt import Mqtt


mqtt = Mqtt()

def create_app():
    app = Flask(__name__)
    # CORS(app)
    mqtt.init_app(app)

    return app
