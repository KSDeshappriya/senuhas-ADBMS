# senuhas_dashboard/database.py
import mysql.connector
import pandas as pd
from db_config import DB_CONFIG
import streamlit as st

@st.cache_resource # Cache the connection resource
def get_connection():
    """Establishes a connection to the MySQL database."""
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        return conn
    except mysql.connector.Error as err:
        st.error(f"Error connecting to database: {err}")
        return None

@st.cache_data(ttl=600) # Cache data for 10 minutes
def fetch_data(_conn, query, params=None):
    """Fetches data from the database using a given query."""
    if _conn is None:
        return pd.DataFrame()
    try:
        cursor = _conn.cursor(dictionary=True) # Fetch as dictionaries
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        
        result = cursor.fetchall()
        cursor.close()
        return pd.DataFrame(result)
    except mysql.connector.Error as err:
        st.error(f"Error executing query: {err}")
        st.code(query) # Show the problematic query
        return pd.DataFrame()
    except Exception as e:
        st.error(f"An unexpected error occurred: {e}")
        return pd.DataFrame()

def execute_query(_conn, query, params=None):
    """Executes a query that doesn't return data (e.g., INSERT, UPDATE)."""
    if _conn is None:
        return False
    try:
        cursor = _conn.cursor()
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        _conn.commit()
        cursor.close()
        return True
    except mysql.connector.Error as err:
        st.error(f"Error executing query: {err}")
        return False

def get_table_names(_conn):
    """Gets a list of table names from the database."""
    if _conn is None:
        return []
    df = fetch_data(_conn, "SHOW TABLES;")
    if not df.empty:
        # The column name might be 'Tables_in_senuhas_db' or similar
        return df.iloc[:, 0].tolist()
    return []