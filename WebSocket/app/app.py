from flask import Flask, render_template
from flask_socketio import SocketIO

app = Flask(__name__)
app.config["SECRET_KEY"] = "ultra-secret-key"
socketio = SocketIO(app)


# Unnamed event (send)
@socketio.on("message")
def handle_message(message):
    print(message)


# Named event (emit)
@socketio.on("my event")
def handle_json(json):
    print(str(json))


@app.route("/")
def index():
    return render_template("index.html")


if __name__ == "__main__":
    socketio.run(app)
