# Import Flask and the functions to manage the visit counter
from flask import Flask, render_template
from db import get_visits, increment_visits

# Create the Flask app
app = Flask(__name__)

# Define the root route
@app.route('/')
def home():
    # Increment the visit count and pass it to the HTML template
    count = increment_visits()
    return render_template("index.html", count=count)

# Run the app if this file is executed directly
if __name__ == '__main__':
    # Listen on all interfaces so it's reachable from outside the container
    app.run(host='0.0.0.0', port=5000)
