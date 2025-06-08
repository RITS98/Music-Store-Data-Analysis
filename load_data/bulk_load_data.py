import pandas as pd
import psycopg2
import os
from dotenv import load_dotenv
from psycopg2 import sql

load_dotenv()

class BulkLoadData:
    def __init__(self, db_params, csv_file_path, schema_name, table_name):
        self.db_params = db_params
        self.csv_file_path = csv_file_path
        self.schema_name = schema_name
        self.table_name = table_name
        self.conn = None
        self.cursor = None

    def connect_to_db(self):
        try:
            self.conn = psycopg2.connect(**db_params)
            self.cursor = self.conn.cursor()
        except Exception as e:
            print(f"Error connecting to database: {e}")

    def load_data(self):
        try:
            with open(self.csv_file_path, 'r') as f:
                next(f)                                                       # Skip header row if exists
                # First set the datestyle to DMY format
                self.cursor.execute("SET datestyle = 'ISO, DMY';")
                self.cursor.copy_expert(
                    sql.SQL("COPY {}.{} FROM STDIN WITH CSV").format(
                        sql.Identifier(self.schema_name),
                        sql.Identifier(self.table_name)
                    ),
                    f
                )
            self.conn.commit()
            print(f"Successfully loaded data into {self.schema_name}.{self.table_name}")
        
        except Exception as e:
            self.conn.rollback()
            print(f"Error loading data: {e}")
        finally:
            self.close_connection()

    def close_connection(self):
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()


if __name__ == "__main__":
    db_params = {
        'host': os.getenv('DB_HOST', 'localhost'),
        'database': os.getenv('DB_NAME', 'grow_data_skills'),
        'user': os.getenv('DB_USER', 'postgres'),
        'password': os.getenv('DB_PASSWORD', 'pass0321'),
        'port': os.getenv('DB_PORT', '5432')
    }

    schema_name = os.getenv('DB_SCHEMA')
    data_path = os.getenv('DATA_PATH')
    file_list = ['media_type.csv', 'genre.csv', 'artist.csv', 'album.csv', 'track.csv', 'playlist.csv', 'playlist_track.csv', 'employee.csv', 'customer.csv', 'invoice.csv', 'invoice_line.csv']
    for file in file_list:
        if file.endswith('.csv'):
            csv_file_path = os.path.join(data_path, file)
            table_name = file.split('.')[0]
            bulk_loader = BulkLoadData(db_params, csv_file_path, schema_name, table_name)
            bulk_loader.connect_to_db()
            bulk_loader.load_data()
    
    print("\n\nBulk data loading completed.")
            



