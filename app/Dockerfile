FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY src/ .

ENV DB_PATH=visits.db
EXPOSE 5000

CMD ["python", "main.py"]
