import subprocess

from webapp.ext.api.models import Thing, UserAuth
from webapp.ext.db import db


class UserRepository:
    @staticmethod
    def get_all():
        return UserAuth.query.all()

    @staticmethod
    def get_by_id(user_id):
        return UserAuth.query.get(user_id)

    @staticmethod
    def get_by_email(email):
        return UserAuth.query.filter_by(email=email).first()

    @staticmethod
    def save(email, hashed_password):
        user = UserAuth(email=email, password=hashed_password)
        db.session.add(user)
        db.session.commit()


class ThingRepository:
    @staticmethod
    def get_all():
        return Thing.query.all()

    @staticmethod
    def get_by_id(thing_id):
        return Thing.query.get(thing_id)

    @staticmethod
    def save(mac, user):
        thing = Thing(mac=mac, user=user)
        db.session.add(thing)
        db.session.commit()


def mqtt_reload():
    cmd = ["/usr/bin/sudo", "/usr/bin/systemctl", "reload", "mosquitto.service"]
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE)
    # output, error = process.communicate()


def mqtt_passwd(cmd):
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE)
    # output, error = process.communicate()


class MqttRepository:
    @staticmethod
    def save_user(email, password):
        cmd = [
            "/usr/bin/sudo",
            "/usr/bin/mosquitto_passwd",
            "-b",
            "/etc/mosquitto/passwd",
            email,
            password,
        ]
        mqtt_passwd(cmd)
        mqtt_reload()

    @staticmethod
    def save_thing(mac, email):
        acls = "/etc/mosquitto/acls"
        exist = False

        with open(acls, "r") as f:
            for line in f:
                if line[:-1] == f"user {email}":
                    exist = True
                    break

        if not exist:
            lines = [f"user {email}\n", f"topic readwrite {mac}/alarme\n", "\n"]

            with open(acls, "a") as f:
                f.writelines(lines)

            mqtt_reload()
