# 📈 Visit Counter App

This is a simple containerized Flask web application that acts as a **visit counter**. Every time someone accesses the page, the counter increases and is saved using a local SQLite database.

## 🧩 Features

- Counts and displays visits in real-time.
- Uses SQLite for persistent storage.
- Lightweight Docker image with Python 3.13.
- Kubernetes-ready.
- Runs securely as a non-root user.

## 🚀 Technologies Used

- Python 3.13
- Flask
- Gunicorn
- SQLite
- Docker
- Kubernetes (K3s compatible)

## ☑️ Requirements

- Docker installed and running.
- Internet access to download base images and dependencies.
- Python 3.13 (only required if you want to run it locally).

## 🐳 Build and Run Locally with Docker

```bash
# Build the image
docker build -t migue/visit-counter .

# Run the container
docker run -p 5000:5000 migue/visit-counter

```

Then open http://localhost:5000 in your browser.
