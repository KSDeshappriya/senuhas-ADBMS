"""
Database initialization script for Senuka's Colour Mart

This script initializes the MySQL database for the Senuka's Colour Mart system.
It creates the database, tables, functions, procedures, triggers, views, and loads sample data.
"""

import os
import mysql.connector
import argparse
from mysql.connector import Error

# No need to force Python implementation, let mysql.connector choose the appropriate implementation
def read_sql_file(file_path):
    """Read SQL file and return its content"""
    with open(file_path, 'r', encoding='utf-8') as f:
        return f.read()

def execute_sql_script(connection, sql_script):
    """Execute SQL script with support for multiple statements"""
    cursor = connection.cursor(buffered=True)
    try:
        # Split script by semicolons to execute multiple statements
        statements = sql_script.split(';')
        for statement in statements:
            if statement.strip():
                cursor.execute(statement)
        connection.commit()
    except Error as e:
        print(f"Error executing script: {e}")
    finally:
        cursor.close()


def initialize_database(host, user, password, database, force=False):
    """Initialize database with schema and sample data"""
    try:
        # Connect to MySQL server
        connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Check if database exists
            cursor.execute(f"SHOW DATABASES LIKE '{database}'")
            result = cursor.fetchone()
            
            if result:
                if force:
                    print(f"Database '{database}' already exists. Dropping and recreating...")
                    cursor.execute(f"DROP DATABASE {database}")
                else:
                    print(f"Database '{database}' already exists. Use --force to recreate.")
                    cursor.close()
                    return False
            
            # Create database
            print(f"Creating database '{database}'...")
            cursor.execute(f"CREATE DATABASE {database}")
            cursor.execute(f"USE {database}")
            cursor.close()

            # Reconnect to newly created database
            connection.database = database

            # Get base directory
            base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
            
            # Define SQL files to execute in order
            sql_files = [
                os.path.join(base_dir, 'db', 'schema', 'create_tables_mysql.sql'),
                os.path.join(base_dir, 'db', 'schema', 'functions_mysql.sql'),
                os.path.join(base_dir, 'db', 'schema', 'procedures_mysql.sql'),
                os.path.join(base_dir, 'db', 'schema', 'triggers_mysql.sql'),
                os.path.join(base_dir, 'db', 'schema', 'views_mysql.sql'),
                # os.path.join(base_dir, 'db', 'data', 'sample_data_mysql.sql')
                os.path.join(base_dir, 'db', 'data', 'sample_data.sql')
            ]
            
            # Execute SQL files
            for sql_file in sql_files:
                if os.path.exists(sql_file):
                    print(f"Executing {os.path.basename(sql_file)}...")
                    sql_script = read_sql_file(sql_file)
                    execute_sql_script(connection, sql_script)
                else:
                    print(f"SQL file not found: {sql_file}")
            
            print(f"Database '{database}' initialized successfully!")
            return True
            
    except Error as e:
        print(f"Error initializing database: {e}")
        return False
    finally:
        if 'connection' in locals() and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Initialize Senukas Colour Mart database')
    parser.add_argument('--host', default='localhost', help='MySQL host')
    parser.add_argument('--user', default='root', help='MySQL user')
    parser.add_argument('--password', default='', help='MySQL password')
    parser.add_argument('--database', default='senukas_db', help='MySQL database name')
    parser.add_argument('--force', action='store_true', help='Force recreation of database if it exists')
    
    args = parser.parse_args()
    
    initialize_database(args.host, args.user, args.password, args.database, args.force)
