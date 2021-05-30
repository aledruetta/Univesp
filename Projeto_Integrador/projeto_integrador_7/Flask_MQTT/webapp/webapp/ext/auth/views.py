from flask import Blueprint, flash, redirect, render_template, request, url_for
from flask_login import login_required, login_user, logout_user
from flask_wtf import FlaskForm
from passlib.hash import sha256_crypt
from wtforms import PasswordField
from wtforms.fields.html5 import EmailField
from wtforms.validators import DataRequired, Email, Length

from webapp.ext.auth import UserAuth
from webapp.ext.db import db

bp = Blueprint("auth", __name__)


class LoginForm(FlaskForm):
    email = EmailField("email", validators=[DataRequired(), Email(check_deliverability=True)])
    password = PasswordField("password", validators=[DataRequired(), Length(min=8)])


@bp.route("/login", methods=["GET", "POST"])
def login():
    form = LoginForm()

    if form.validate_on_submit():
        user = UserAuth.query.filter_by(email=form.email.data).first()

        if user and sha256_crypt.verify(form.password.data, user.password):
            login_user(user)
            return redirect(url_for("site.index"))

        flash("Dados inválidos!")

    return render_template("login.html", form=form, status_in='onclick="return false;" disabled')


@bp.route("/signup", methods=["GET", "POST"])
def signup():
    form = LoginForm()

    if form.validate_on_submit():
        password = sha256_crypt.hash(form.password.data)
        user = UserAuth(email=form.email.data, password=password)
        db.session.add(user)
        db.session.commit()

        return redirect(url_for("site.index"))

    if request.method == "POST":
        flash("Dados inválidos!")

    return render_template("signup.html", form=form, status_up='onclick="return false;" disabled')


@bp.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for("site.index"))
