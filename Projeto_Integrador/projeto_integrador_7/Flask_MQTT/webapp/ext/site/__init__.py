from flask import Blueprint, render_template
from flask_login import login_required

from webapp.ext.api.models import Thing
from webapp.ext.auth.models import UserAuth

bp = Blueprint("site", __name__)


def init_app(app):
    app.register_blueprint(bp)


@bp.route("/things")
def index():
    things = Thing.query.all()
    return render_template("things.html", title="Coisas", things=things)


@bp.route("/users")
@login_required
def protected():
    users = UserAuth.query.all()
    return render_template("users.html", title="Usuarios", users=users)
