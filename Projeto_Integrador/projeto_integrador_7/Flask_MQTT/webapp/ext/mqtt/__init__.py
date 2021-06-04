import os

from flask_mqtt import Mqtt

mqtt = Mqtt()


@mqtt.on_connect()
def handle_connect(client, userdata, flags, rc):
    mqtt.subscribe("esp32-E9:47:C0/alarme")


@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
    data = dict(topic=message.topic, payload=message.payload.decode())
    print(data)


@mqtt.on_log()
def handle_logging(client, userdata, level, buf):
    if os.environ["FLASK_ENV"] == "development":
        print(level, buf)


def init_app(app):
    mqtt.init_app(app)
