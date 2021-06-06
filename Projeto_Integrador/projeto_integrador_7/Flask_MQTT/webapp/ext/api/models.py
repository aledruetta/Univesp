from datetime import datetime

from webapp.ext.db import db


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
            "created_on": datetime.timestamp(self.created_on),
            "updated_on": datetime.timestamp(self.updated_on),
            "user_id": self.user_id,
            "mac": self.mac,
        }

    def __repr__(self) -> str:
        return f"Thing: {self.mac}"
