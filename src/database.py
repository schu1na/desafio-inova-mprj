import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
import psycopg2
import pandas as pd

# Load environment variables
load_dotenv()

def get_db_connection():
    """
    Establishes a connection to the database using psycopg2.
    Returns:
        psycopg2 connection object
    """
    try:
        conn = psycopg2.connect(
            host=os.getenv("DB_HOST"),
            database=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASS"),
            port=os.getenv("DB_PORT", "5432")
        )
        return conn
    except Exception as e:
        print(f"Error connecting to database: {e}")
        return None

from urllib.parse import quote_plus

def get_db_engine():
    """
    Creates a SQLAlchemy engine for the database.
    Returns:
        sqlalchemy engine object
    """
    try:
        # Construct connection string
        # format: postgresql+psycopg2://user:password@host:port/database
        # URL encode user and password to handle special characters
        db_user = quote_plus(os.getenv('DB_USER') or '')
        db_pass = quote_plus(os.getenv('DB_PASS') or '')
        db_host = os.getenv('DB_HOST')
        db_port = os.getenv('DB_PORT', '5432')
        db_name = os.getenv('DB_NAME')

        connection_str = f"postgresql+psycopg2://{db_user}:{db_pass}@{db_host}:{db_port}/{db_name}"
        engine = create_engine(connection_str)
        return engine
    except Exception as e:
        print(f"Error creating engine: {e}")
        return None

def run_query(query, engine=None):
    """
    Executes a SQL query and returns a pandas DataFrame.
    """
    if engine is None:
        engine = get_db_engine()
    
    if engine:
        try:
            return pd.read_sql(query, engine)
        except Exception as e:
            print(f"Error executing query: {e}")
            return None
    return None

def load_query(query_name):
    """
    Reads a SQL query from a file in the sql/ directory.
    Args:
        query_name (str): Relative path to the sql file (e.g. 'queries_base/contratos.sql')
    Returns:
        str: Content of the SQL file
    """
    # Assuming the project root is 2 levels up from this file (src/database.py)
    # Adjust logic if structure changes
    current_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(current_dir)
    sql_path = os.path.join(project_root, 'sql', query_name)
    
    try:
        with open(sql_path, 'r', encoding='utf-8') as f:
            return f.read()
    except FileNotFoundError:
        print(f"Error: Query file not found at {sql_path}")
        return ""

