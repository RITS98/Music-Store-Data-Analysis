# Music Store Data Analysis Using SQL

- Tecnology Used:
    - PostgreSQL
    - Python

## Entity Relationship Diagram

![Image](https://github.com/user-attachments/assets/4171f89e-0263-4eb0-9daa-f1d0be8f28ab)

There are 11 tables in the schema. The tables store important aspects of data for extensive analysis. The tables are `employee`, `customer`, `invoice`, `invoice_line`, `track`, `playlist_track`, `playlist`, `genre`, `media_type`, `album`, `artist`

## How to build the database

1. Run the Create table commands in the `Create Table (DDL ops).sql` file
2. All the data for respective tables are in the data folder.
3. The python code to load the data from csv to database is in the `load_data` folder
4. The bulk loading of data can be done without python code too by using the below command

    `
    COPY schema_name.table_name 
    FROM '/path/to/file.csv' 
    WITH (FORMAT csv, HEADER true, DELIMITER ',');
    `

    OR using psql

    `
    psql -h hostname -U username -d dbname -c "\copy schema_name.table_name FROM '/path/to/file.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');"
    `

    Keep in mind you need to give permission to postgre server for accessing the csv file

5. Below you can find the sql code for some important analysis


## SQL Code for Data Analysis

[Data Analysis Code](https://github.com/RITS98/Music-Store-Data-Analysis-Using-SQL/blob/main/Create%20Table%20(DDL%20ops).sql)

## Results

The results for the queries as mentioned in the [Data Analysis Code](https://github.com/RITS98/Music-Store-Data-Analysis-Using-SQL/blob/main/Create%20Table%20(DDL%20ops).sql) can be found in the [Results]() folder.
    