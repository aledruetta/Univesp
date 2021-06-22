import subprocess

from webapp.ext.api.models import Thing, UserAuth
from webapp.ext.db import db


def mqtt_reload():
    cmd = ["/usr/bin/sudo", "/usr/bin/systemctl", "reload", "mosquitto.service"]
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE)
    # output, error = process.communicate()


def mqtt_passwd(email, password):
    cmd = [
        "/usr/bin/sudo",
        "/usr/bin/mosquitto_passwd",
        "-b",
        "/etc/mosquitto/passwd",
        email,
        password,
    ]
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE)
    # output, error = process.communicate()


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


class MqttRepository:
    @staticmethod
    def save_user(email, password):
        mqtt_passwd(email, password)
        mqtt_reload()

    @staticmethod
    def save_thing(mac, email):
        acls = "/etc/mosquitto/acls"
        topic_line = f"topic readwrite {mac}/alarme\n"
        user_line = f"user {email}\n"
        index = 0

        with open(acls, "r+") as fd:
            lines = fd.readlines()

            for line in lines:
                if line.find(email) < 0:
                    index += 1
                else:
                    lines.insert(index + 1, topic_line)
                    break

            if index == len(lines):
                lines.extend([user_line, topic_line, "\n"])

            fd.seek(0)
            fd.writelines(lines)

        mqtt_reload()
