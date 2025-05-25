FROM python:3.13-slim

# Create a non-privileged user and group with permissions
RUN addgroup --system appgroup && \
    adduser --system --ingroup appgroup appuser && \
    mkdir /app && \
    chown appuser:appgroup /app

# Set working directory
WORKDIR /app

# Install system dependencies and requirements
COPY requirements.txt .
RUN apt-get update && \
    pip install --no-cache-dir -r requirements.txt

# Copy files to container
COPY src/ .

# Give user permissions
RUN chown -R appuser:appgroup /app

# Change to non-privileged user
USER appuser

# Env variables
ENV DB_PATH=visits.db

# Expose the port the app runs on
EXPOSE 5000

# Run the application with Gunicorn as production server
CMD ["gunicorn", "-b", "0.0.0.0:5000", "main:app"]

# Healthcheck to ensure the application is running
HEALTHCHECK --interval=20s --timeout=5s --start-period=5s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/health')" || exit 1
