FROM python:3.13-slim

# Create a non-privileged user and group
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Create and us working directory and set permissions
WORKDIR /app
RUN chown appuser:appgroup /app

# Install system dependencies
RUN apt-get update && apt-get install -y curl --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

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

HEALTHCHECK --interval=20s --timeout=5s --start-period=5s --retries=3 \
  CMD curl --fail http://localhost:5000/ || exit 1
