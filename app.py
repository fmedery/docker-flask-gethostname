#!python
import flask
import platform

app = flask.Flask(__name__)


@app.route("/")
def home():
    return flask.render_template("index.html", hostname=platform.node())

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
