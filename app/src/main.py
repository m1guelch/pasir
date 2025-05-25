# Import Flask and the functions to manage the visit counter
from flask import Flask, render_template
from db import get_visits, increment_visits

# Create the Flask app
app = Flask(__name__)

# Define the main route
@app.route('/')
def home():
    count = get_visits()
    return render_template("index.html", count=count)

# Define the visit counter route
@app.route('/visit')
def visit():
    count = increment_visits()
    return render_template("index.html", count=count)

# Define the route for K8s probes
@app.route('/health')
def health():
    return "OK", 200

# Run the app if this file is executed directly
if __name__ == '__main__':
    # Listen on all interfaces so it's reachable from outside the container
    app.run(host='0.0.0.0', port=5000)
