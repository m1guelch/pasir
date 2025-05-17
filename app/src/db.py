import sqlite3
import os

# Get the database path from the environment, or default to 'visits.db'
DB_PATH = os.getenv("DB_PATH", "visits.db")

# Initialize the database: create table and row if they don't exist
def init_db():
    with sqlite3.connect(DB_PATH) as conn:
        c = conn.cursor()
        c.execute("CREATE TABLE IF NOT EXISTS visits (count INTEGER)")
        c.execute("INSERT INTO visits (count) SELECT 0 WHERE NOT EXISTS (SELECT 1 FROM visits)")
        conn.commit()

# Return the current visit count from the database
def get_visits():
    with sqlite3.connect(DB_PATH) as conn:
        c = conn.cursor()
        c.execute("SELECT count FROM visits")
        return c.fetchone()[0]

# Increment the visit count and return the new value
def increment_visits():
    with sqlite3.connect(DB_PATH) as conn:
        c = conn.cursor()
        c.execute("UPDATE visits SET count = count + 1")
        conn.commit()
        return get_visits()

# Initialize the database when this file is imported
init_db()
