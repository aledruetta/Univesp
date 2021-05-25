import os
import ssl

from dotenv import load_dotenv

basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, ".env"), verbose=True)


class BaseConfig:
    """Base configs"""

    DEBUG = False
    TESTING = False
    SECRET_KEY = os.getenv("SECRET_KEY")
    STATIC_FOLDER = "static"
    TEMPLATE_FOLDER = "templates"
    TEMPLATES_AUTO_RELOAD = True
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    MQTT_BROKER_URL = os.getenv("MQTT_BROKER_URL")
    MQTT_BROKER_PORT = 8883
    MQTT_USERNAME = os.getenv("MQTT_USERNAME")
    MQTT_PASSWORD = os.getenv("MQTT_PASSWORD")
    MQTT_KEEPALIVE = 5
    MQTT_TLS_ENABLED = True
    # MQTT_TLS_INSECURE = True
    MQTT_TLS_VERSION = ssl.PROTOCOL_TLSv1_2
    MQTT_TLS_CA_CERTS = os.getenv("MQTT_TLS_CA_CERTS")


class ProdConfig(BaseConfig):
    """Production configs"""

    FLASK_ENV = "production"
    SQLALCHEMY_DATABASE_URI = os.getenv("PROD_DATABASE_URI")


class DevConfig(BaseConfig):
    """Development configs"""

    FLASK_ENV = "development"
    DEBUG = True
    TESTING = True
    SQLALCHEMY_DATABASE_URI = os.getenv("DEV_DATABASE_URI")
