from datetime import datetime

from flask_login import UserMixin
from sqlalchemy.sql import func

from webapp.ext.db import db


def json_datetime(dt):
    return dt.strftime("%d-%m-%Y %H:%M:%S") + " UTC"


class UserAuth(UserMixin, db.Model):
    __tablename__ = "user_auth"

    id = db.Column("id", db.Integer, primary_key=True)
    email = db.Column("email", db.String(255), nullable=False, unique=True)
    password = db.Column("password", db.String(255), nullable=False)
    created_on = db.Column(
        "created_on",
        db.DateTime(timezone=True),
        nullable=False,
        default=datetime.utcnow,
    )
    updated_on = db.Column(
        "updated_on",
        db.DateTime(timezone=True),
        nullable=False,
        default=datetime.utcnow,
        onupdate=datetime.utcnow,
    )
    is_admin = db.Column("is_admin", db.Boolean, default=False)

    def json(self) -> dict:
        return {
            "id": self.id,
            "email": self.email,
            "created_on": json_datetime(self.created_on),
            "updated_on": json_datetime(self.updated_on),
            "is_admin": self.is_admin,
        }

    def __repr__(self) -> dict:
        return f"User: {self.email} {'(Admin)' if self.is_admin else ''}"


class Thing(db.Model):
    __tablename__ = "thing"

    id = db.Column("id", db.Integer, primary_key=True)
    mac = db.Column("mac", db.String, unique=True, nullable=False)
    created_on = db.Column(
        "created_on",
        db.DateTime(timezone=True),
        nullable=False,
        default=datetime.utcnow,
    )
    updated_on = db.Column(
        "updated_on",
        db.DateTime(timezone=True),
        nullable=False,
        default=datetime.utcnow,
        onupdate=datetime.utcnow,
    )

    user_id = db.Column("user_id", db.Integer, db.ForeignKey("user_auth.id"), nullable=False)
    user = db.relationship(
        "UserAuth",
        backref=db.backref("things", cascade="all, delete-orphan", lazy=True),
    )

    def json(self) -> dict:
        return {
            "id": self.id,
            "created_on": json_datetime(self.created_on),
            "updated_on": json_datetime(self.updated_on),
            "user_id": self.user.email,
            "mac": self.mac,
        }

    def __repr__(self) -> str:
        return f"Thing: {self.mac}"
