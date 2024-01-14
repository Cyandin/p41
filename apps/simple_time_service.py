from flask import Flask, jsonify, request
from datetime import datetime
#from urllib.parse import quote as url_quote
from werkzeug.urls import url_quote

app = Flask(__name__)

@app.route('/')
def get_time_and_ip():
    current_time = datetime.now().strftime("%Y-%m-%dT%H:%M:%S")
    user_ip = request.remote_addr
    response = {
        "timestamp": current_time,
        "ip": user_ip
    }
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=False)
