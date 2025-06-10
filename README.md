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

[Data Analysis Code](https://github.com/RITS98/Music-Store-Data-Analysis-Using-SQL/blob/main/Data%20Analysis%20(DQL%20scripts).sql)

## Results

The results for the queries as mentioned in the [Data Analysis Code](https://github.com/RITS98/Music-Store-Data-Analysis-Using-SQL/blob/main/Data%20Analysis%20(DQL%20scripts).sql) can be found in the [Results](https://github.com/RITS98/Music-Store-Data-Analysis-Using-SQL/tree/main/results) folder.


**Q1. Who is the senior most employee based on job title?**
| NAME            |
|-------------------------------------------|
| Senior General Manager Mohan Madan     |


**Q2. Which countries have the most Invoices?**
| billing_country   | tot_invoice |
|-------------------|-------------|
| USA               | 131         |
| Canada            | 76          |
| Brazil            | 61          |
| France            | 50          |
| Germany           | 41          |
| Czech Republic    | 30          |
| Portugal          | 29          |
| United Kingdom    | 28          |
| India             | 21          |
| Chile             | 13          |
| Ireland           | 13          |
| Spain             | 11          |
| Finland           | 11          |
| Australia         | 10          |
| Netherlands       | 10          |
| Sweden            | 10          |
| Poland            | 10          |
| Hungary           | 10          |
| Denmark           | 10          |
| Austria           | 9           |
| Norway            | 9           |
| Italy             | 9           |
| Belgium           | 7           |
| Argentina         | 5           |


**Q3. What are top 3 values of total invoice?**
|total             |
|------------------|
|23.759999999999998|
|19.8              |
|18.81             |

**Q4. Which city has the best customers?**
| billing_city | invoice_total       |
|--------------|--------------------|
| Prague       | 273.24000000000007 |


**Q5. Who is the best customer?**
| customer_id | Customer Name | Spending |
|------------|---------------|----------|
| 42         | Wyatt Girard  | 99.99    |


**Q6. Write query to return the email, first name, last name, & Genre of all Rock Music listeners.**
| email                              | first_name | last_name     |
|------------------------------------|------------|---------------|
| aaronmitchell@yahoo.ca             | Aaron      | Mitchell      |
| alero@uol.com.br                   | Alexandre  | Rocha         |
| astrid.gruber@apple.at             | Astrid     | Gruber        |
| bjorn.hansen@yahoo.no              | Bjørn      | Hansen        |
| camille.bernard@yahoo.fr           | Camille    | Bernard       |
| daan_peeters@apple.be              | Daan       | Peeters       |
| diego.gutierrez@yahoo.ar           | Diego      | Gutiérrez     |
| dmiller@comcast.com                | Dan        | Miller        |
| dominiquelefebvre@gmail.com        | Dominique  | Lefebvre      |
| edfrancis@yachoo.ca                | Edward     | Francis       |
| eduardo@woodstock.com.br           | Eduardo    | Martins       |
| ellie.sullivan@shaw.ca             | Ellie      | Sullivan      |
| emma_jones@hotmail.com             | Emma       | Jones         |
| enrique_munoz@yahoo.es             | Enrique    | Muñoz         |
| fernadaramos4@uol.com.br           | Fernanda   | Ramos         |
| fharris@google.com                 | Frank      | Harris        |
| fralston@gmail.com                 | Frank      | Ralston       |
| frantisekw@jetbrains.com           | František  | Wichterlová   |
| ftremblay@gmail.com                | François   | Tremblay      |
| fzimmermann@yahoo.de               | Fynn       | Zimmermann    |
| hannah.schneider@yahoo.de          | Hannah     | Schneider     |
| hholy@gmail.com                    | Helena     | Holý          |
| hleacock@gmail.com                 | Heather    | Leacock       |
| hughoreilly@apple.ie               | Hugh       | O'Reilly      |
| isabelle_mercier@apple.fr          | Isabelle   | Mercier       |
| jacksmith@microsoft.com            | Jack       | Smith         |
| jenniferp@rogers.ca                | Jennifer   | Peterson      |
| jfernandes@yahoo.pt                | João       | Fernandes     |
| joakim.johansson@yahoo.se          | Joakim     | Johansson     |
| johavanderberg@yahoo.nl            | Johannes   | Van der Berg  |
| johngordon22@yahoo.com             | John       | Gordon        |
| jubarnett@gmail.com                | Julia      | Barnett       |
| kachase@hotmail.com                | Kathy      | Chase         |
| kara.nielsen@jubii.dk              | Kara       | Nielsen       |
| ladislav_kovacs@apple.hu           | Ladislav   | Kovács        |
| leonekohler@surfeu.de              | Leonie     | Köhler        |
| lucas.mancini@yahoo.it             | Lucas      | Mancini       |
| luisg@embraer.com.br               | Luís       | Gonçalves     |
| luisrojas@yahoo.cl                 | Luis       | Rojas         |
| manoj.pareek@rediff.com            | Manoj      | Pareek        |
| marc.dubois@hotmail.com            | Marc       | Dubois        |
| mark.taylor@yahoo.au               | Mark       | Taylor        |
| marthasilk@gmail.com               | Martha     | Silk          |
| masampaio@sapo.pt                  | Madalena   | Sampaio       |
| michelleb@aol.com                  | Michelle   | Brooks        |
| mphilips12@shaw.ca                 | Mark       | Philips       |
| nschroder@surfeu.de                | Niklas     | Schröder      |
| patrick.gray@aol.com               | Patrick    | Gray          |
| phil.hughes@gmail.com              | Phil       | Hughes        |
| ricunningham@hotmail.com           | Richard    | Cunningham    |
| rishabh_mishra@yahoo.in            | Rishabh    | Mishra        |
| robbrown@shaw.ca                   | Robert     | Brown         |
| roberto.almeida@riotur.gov.br      | Roberto    | Almeida       |
| stanisław.wójcik@wp.pl             | Stanisław  | Wójcik        |
| steve.murray@yahoo.uk              | Steve      | Murray        |
| terhi.hamalainen@apple.fi          | Terhi      | Hämäläinen    |
| tgoyer@apple.com                   | Tim        | Goyer         |
| vstevens@yahoo.com                 | Victor     | Stevens       |
| wyatt.girard@yahoo.fr              | Wyatt      | Girard        |


**Q7. Write a query that returns the Artist name and total track count of the top 10 rock bands.**
| artist_id | name                        | number_of_songs |
|-----------|-----------------------------|----------------:|
| 22        | Led Zeppelin                |             114 |
| 150       | U2                          |             112 |
| 58        | Deep Purple                 |              92 |
| 90        | Iron Maiden                 |              81 |
| 118       | Pearl Jam                   |              54 |
| 152       | Van Halen                   |              52 |
| 51        | Queen                       |              45 |
| 142       | The Rolling Stones          |              41 |
| 76        | Creedence Clearwater Revival|              40 |
| 52        | Kiss                        |              35 |


**Q8. Return all the track names that have a song length longer than the average song length.**
| name                          | milliseconds |
|-------------------------------|-------------:|
| Occupation / Precipice        |      5286953 |
| Through a Looking Glass       |      5088838 |
| Greetings from Earth, Pt. 1   |      2960293 |
| The Man With Nine Lives       |      2956998 |
| Battlestar Galactica, Pt. 2   |      2956081 |
| Battlestar Galactica, Pt. 1   |      2952702 |
| Murder On the Rising Star     |      2935894 |
| Battlestar Galactica, Pt. 3   |      2927802 |
| Take the Celestra             |      2927677 |
| ............................. |      ....... |
| ............................. |      ....... |

**Q9. Find how much amount spent by each customer on best selling artists?**
| customer_id | first_name | last_name   | artist_name | amount_spent      |
|------------:|------------|-------------|-------------|------------------:|
|          46 | Hugh       | O'Reilly    | Queen       | 27.72            |
|          38 | Niklas     | Schröder    | Queen       | 18.81            |
|           3 | François   | Tremblay    | Queen       | 17.82            |
|          34 | João       | Fernandes   | Queen       | 16.83            |
|          53 | Phil       | Hughes      | Queen       | 11.88            |
|          41 | Marc       | Dubois      | Queen       | 11.88            |
|          47 | Lucas      | Mancini     | Queen       | 10.89            |
|          33 | Ellie      | Sullivan    | Queen       | 10.89            |
|          20 | Dan        | Miller      | Queen       |  3.96            |
|           5 | František  | Wichterlová | Queen       |  3.96            |
|       ..... | .........  | ........... | .......     |  ...........     |
|       ..... | .........  | ........... | .......     |  ...........     |

**Q10. Write a query that returns each country along with the top Genre.**
| country        | name              |
|----------------|-------------------|
| Argentina      | Alternative & Punk |
| Australia      | Rock              |
| Austria        | Rock              |
| Belgium        | Rock              |
| Brazil         | Rock              |
| Canada         | Rock              |
| Chile          | Rock              |
| Czech Republic | Rock              |
| Denmark        | Rock              |
| Finland        | Rock              |
| France         | Rock              |
| Germany        | Rock              |
| Hungary        | Rock              |
| India          | Rock              |
| Ireland        | Rock              |
| Italy          | Rock              |
| Netherlands    | Rock              |
| Norway         | Rock              |
| Poland         | Rock              |
| Portugal       | Rock              |
| Spain          | Rock              |
| Sweden         | Rock              |
| USA            | Rock              |
| United Kingdom | Rock              |

**Q11. Write a query that determines the customer that has spent the most on music for each country.**
| country        | Customer Name           | total_spending |
|----------------|-------------------------|---------------:|
| Argentina      | Diego Gutiérrez         |          39.60 |
| Australia      | Mark Taylor             |          81.18 |
| Austria        | Astrid Gruber           |          69.30 |
| Belgium        | Daan Peeters            |          60.39 |
| Brazil         | Luís Gonçalves          |         108.90 |
| Canada         | François Tremblay       |          99.99 |
| Chile          | Luis Rojas              |          97.02 |
| Czech Republic | František Wichterlová   |         144.54 |
| Denmark        | Kara Nielsen            |          37.62 |
| Finland        | Terhi Hämäläinen        |          79.20 |
| France         | Wyatt Girard            |          99.99 |
| Germany        | Fynn Zimmermann         |          94.05 |
| Hungary        | Ladislav Kovács         |          78.21 |
| India          | Manoj Pareek            |         111.87 |
| Ireland        | Hugh O'Reilly           |         114.84 |
| Italy          | Lucas Mancini           |          50.49 |
| Netherlands    | Johannes Van der Berg   |          65.34 |
| Norway         | Bjørn Hansen            |          72.27 |
| Poland         | Stanisław Wójcik        |          76.23 |
| Portugal       | João Fernandes          |         102.96 |
| Spain          | Enrique Muñoz           |          98.01 |
| Sweden         | Joakim Johansson        |          75.24 |
| USA            | Jack Smith              |          98.01 |
| United Kingdom | Phil Hughes             |          98.01 |