import os

# import ssl
from datetime import timedelta

from dotenv import load_dotenv

basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, ".env"), verbose=True)


class Config:
    TESTING = False
    DEBUG = False

    SECRET_KEY = os.getenv("SECRET_KEY")
    STATIC_FOLDER = "static"
    TEMPLATES_FOLDER = "templates"
    TEMPLATES_AUTO_RELOAD = True

    JWT_AUTH_USERNAME_KEY = "email"
    JWT_AUTH_URL_RULE = "/token"
    JWT_EXPIRATION_DELTA = timedelta(seconds=86400)  # one day

    SQLALCHEMY_TRACK_MODIFICATIONS = False


class Production(Config):
    SQLALCHEMY_DATABASE_URI = os.getenv("PROD_DATABASE_URI")

    # MQTT_BROKER_URL = "localhost"
    # MQTT_BROKER_PORT = 1883
    # MQTT_USERNAME = os.getenv("MQTT_USERNAME")
    # MQTT_PASSWORD = os.getenv("MQTT_PASSWORD")


class Development(Config):
    DEBUG = True

    SQLALCHEMY_DATABASE_URI = os.getenv("DEV_DATABASE_URI")

    # MQTT_BROKER_PORT = 8883
    # MQTT_BROKER_URL = os.getenv("MQTT_BROKER_URL")
    # MQTT_USERNAME = os.getenv("MQTT_USERNAME")
    # MQTT_PASSWORD = os.getenv("MQTT_PASSWORD")

    # MQTT over TLS
    # MQTT_KEEPALIVE = 5
    # MQTT_TLS_ENABLED = True
    # MQTT_TLS_VERSION = ssl.PROTOCOL_TLSv1_2
    # MQTT_TLS_CA_CERTS = os.getenv("MQTT_TLS_CA_CERTS")


class Testing(Config):
    DEBUG = True
    TESTING = True

    SQLALCHEMY_DATABASE_URI = os.getenv("TEST_DATABASE_URI")
