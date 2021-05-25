from flask import Flask
from flask_cors import CORS
from flask_mqtt import Mqtt


mqtt = Mqtt()

@mqtt.on_connect()
def handle_connect(client, userdata, flags, rc):
    mqtt.subscribe('esp32/test')

@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
    data = dict(
        topic=message.topic,
        payload=message.payload.decode()
    )
    print(data)

def create_app():
    app = Flask(__name__)
    CORS(app)
    app.config.from_object("webapp.config.DevConfig")
    mqtt.init_app(app)

    return app
