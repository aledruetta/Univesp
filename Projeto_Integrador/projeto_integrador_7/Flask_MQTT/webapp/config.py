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

    # MQTT_BROKER_PORT = os.getenv("PROD_MQTT_PORT")
    # MQTT_BROKER_URL = os.getenv("PROD_MQTT_BROKER_URL")
    # MQTT_USERNAME = os.getenv("PROD_MQTT_USERNAME")
    # MQTT_PASSWORD = os.getenv("PROD_MQTT_PASSWORD")

    # MQTT over TLS
    # MQTT_KEEPALIVE = 5
    # MQTT_TLS_ENABLED = True
    # MQTT_TLS_VERSION = ssl.PROTOCOL_TLSv1_2
    # MQTT_TLS_CA_CERTS = os.getenv("MQTT_TLS_CA_CERTS")


class Development(Config):
    DEBUG = True

    SQLALCHEMY_DATABASE_URI = os.getenv("DEV_DATABASE_URI")

    # MQTT_BROKER_URL = os.getenv("DEV_MQTT_URL")
    # MQTT_BROKER_PORT = os.getenv("DEV_MQTT_PORT")
    # MQTT_USERNAME = os.getenv("DEV_MQTT_USERNAME")
    # MQTT_PASSWORD = os.getenv("DEV_MQTT_PASSWORD")


class Testing(Config):
    DEBUG = True
    TESTING = True

    SQLALCHEMY_DATABASE_URI = os.getenv("TEST_DATABASE_URI")
