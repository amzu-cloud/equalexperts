import flask
import os

from flask import Flask

app = Flask(__name__)
# Respond with a simple hello message.
@app.route("/")
def index():
    return "Hello World From Python Flask - Welcome!"

if __name__ == "__main__":
    port = int(os.environ.get("PORT",8080))
    debug = bool(os.environ.get("debug",True))
    host = bool(os.environ.get("host","0.0.0.0"))
    app.run(debug=True, host="0.0.0.0",port=port)
