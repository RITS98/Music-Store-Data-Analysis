-- Artist Table
DROP TABLE IF EXISTS music_data_store.artist CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.artist (
	artist_id NUMERIC,
	name VARCHAR(500),
	CONSTRAINT pk_artistid PRIMARY KEY(artist_id)
);

-- Album Table
DROP TABLE IF EXISTS music_data_store.album CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.album (
	album_id NUMERIC,
	name VARCHAR(500),
	artist_id NUMERIC,
	CONSTRAINT pk_albumid PRIMARY KEY(album_id),
	CONSTRAINT fk_artistid
		FOREIGN KEY(artist_id)
		REFERENCES music_data_store.artist(artist_id)
);

-- Playlist Table
DROP TABLE IF EXISTS music_data_store.playlist CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.playlist (
	playlist_id NUMERIC,
	name VARCHAR(500),
	CONSTRAINT pk_playlistid PRIMARY KEY(playlist_id)
);

-- Genre Table
DROP TABLE IF EXISTS music_data_store.genre CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.genre (
	genre_id NUMERIC,
	name VARCHAR(500),
	CONSTRAINT pk_genreid PRIMARY KEY(genre_id)
);

-- Media Type Table
DROP TABLE IF EXISTS music_data_store.media_type CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.media_type (
	media_type_id NUMERIC,
	name VARCHAR(500),
	CONSTRAINT pk_media_type_id PRIMARY KEY(media_type_id)
);

-- Track Table
DROP TABLE IF EXISTS music_Data_store.track CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.track (
	track_id NUMERIC,
	name VARCHAR(500),
	album_id NUMERIC,
	media_type_id NUMERIC,
	genre_id NUMERIC,
	composer VARCHAR(500),
	milliseconds INT,
	bytes INT,
	unit_price FLOAT,
	CONSTRAINT pk_trackid PRIMARY KEY(track_id),
	CONSTRAINT fk_albumid FOREIGN KEY(album_id) REFERENCES music_data_store.album(album_id),
	CONSTRAINT fk_media_type_id FOREIGN KEY(media_type_id) REFERENCES music_data_store.media_type(media_type_id),
	CONSTRAINT fk_genreid FOREIGN KEY(genre_id) REFERENCES music_data_store.genre(genre_id)
);

-- Playlist Track Table
DROP TABLE IF EXISTS music_data_store.playlist_track CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.playlist_track (
	playlist_id NUMERIC REFERENCES music_data_store.playlist(playlist_id),
	track_id NUMERIC REFERENCES music_data_store.track(track_id)
);

-- Employee Table
DROP TABLE IF EXISTS music_data_store.employee CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.employee (
	employee_id NUMERIC,
	last_name VARCHAR,
	first_name VARCHAR,
	title VARCHAR,
	reports_to NUMERIC,
	levels TEXT,
	birthdate TIMESTAMP,
	hire_date TIMESTAMP,
	address VARCHAR,
	city VARCHAR,
	state VARCHAR,
	country VARCHAR,
	postal_code VARCHAR,
	phone VARCHAR,
	fax VARCHAR,
	email VARCHAR,
	CONSTRAINT pk_employee_id PRIMARY KEY(employee_id)
);

-- Customer Table
DROP TABLE IF EXISTS music_data_store.customer CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.customer (
	customer_id NUMERIC,
	first_name TEXT,
	last_name TEXT,
	company TEXT,
	address TEXT,
	city TEXT,
	state TEXT, 
	country TEXT,
	postal_code TEXT,
	phone TEXT,
	fax TEXT,
	email TEXT,
	support_rep_id NUMERIC,
	CONSTRAINT pk_customer_id PRIMARY KEY(customer_id),
	CONSTRAINT fk_suuport_id FOREIGN KEY(support_rep_id) REFERENCES music_data_store.employee(employee_id)
);

-- Invoice Table
DROP TABLE IF EXISTS music_data_store.invoice CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.invoice (
	invoice_id NUMERIC PRIMARY KEY,
	customer_id NUMERIC REFERENCES music_data_store.customer(customer_id),
	invoice_date TIMESTAMP,
	billing_address VARCHAR,
	billing_city VARCHAR,
	billing_state VARCHAR,
	billing_country VARCHAR,
	billing_postal_code VARCHAR,
	total FLOAT
);

-- Invoice  Line Table
DROP TABLE IF EXISTS music_data_store.invoice_line CASCADE;
CREATE TABLE IF NOT EXISTS music_data_store.invoice_line (
	invoice_line_id NUMERIC PRIMARY KEY,
	invoice_id NUMERIC REFERENCES music_data_store.invoice(invoice_id),
	track_id NUMERIC REFERENCES music_data_store.track(track_id),
	unit_price FLOAT,
	quantity INT
);
