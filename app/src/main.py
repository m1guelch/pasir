from flask import Flask, render_template
from db import get_visits, increment_visits

app = Flask(__name__)

@app.route('/')
def home():
    count = increment_visits()
    return render_template("index.html", count=count)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
