import sqlite3
import os

DB_PATH = os.getenv("DB_PATH", "visits.db")

def init_db():
    with sqlite3.connect(DB_PATH) as conn:
        c = conn.cursor()
        c.execute("CREATE TABLE IF NOT EXISTS visits (count INTEGER)")
        c.execute("INSERT INTO visits (count) SELECT 0 WHERE NOT EXISTS (SELECT 1 FROM visits)")
        conn.commit()

def get_visits():
    with sqlite3.connect(DB_PATH) as conn:
        c = conn.cursor()
        c.execute("SELECT count FROM visits")
        return c.fetchone()[0]

def increment_visits():
    with sqlite3.connect(DB_PATH) as conn:
        c = conn.cursor()
        c.execute("UPDATE visits SET count = count + 1")
        conn.commit()
        return get_visits()

init_db()
