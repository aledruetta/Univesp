from datetime import datetime

from webapp.ext.db import db


class Thing(db.Model):
    __tablename__ = "thing"

    id = db.Column("id", db.Integer, primary_key=True)
    created_on = db.Column("created_on", db.DateTime, default=datetime.now)
    updated_on = db.Column("updated_on", db.DateTime, default=datetime.now, onupdate=datetime.now)

    user_id = db.Column("user_id", db.Integer, db.ForeignKey("user_auth.id"), nullable=False)
    user = db.relationship(
        "UserAuth",
        backref=db.backref("things", cascade="all, delete-orphan", lazy=True),
    )

    def json(self) -> dict:
        return {"id": self.id, "created_on": self.created_on, "user_id": self.user_id}

    def __repr__(self) -> str:
        return f"ThingId: {self.id}"
