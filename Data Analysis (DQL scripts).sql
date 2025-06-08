
select * from album;
select * from artist;
select * from customer;
select * from employee;
select * from genre;
select * from invoice;
select * from invoice_line;
select * from media_type;
select * from playlist;
select * from playlist_track;
select * from track;


-- Q1. Who is the senior most employee based on job title?
select 
	title || ' ' || first_name || ' ' || last_name as "NAME"
from
	music_data_store.employee
order by
	levels desc 
limit 1;


-- Q2. Which countries have the most Invoices?
select
	billing_country, count(*) as tot_invoice
from
	music_data_store.invoice
group by 
	1
order by
	2 desc;

-- Q3. What are top 3 values of total invoice?
select 
	distinct total
from 
	music_data_store.invoice
order by 
	1 desc
limit 3;

-- Q4. Which city has the best customers?
-- We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoice totals
select
	billing_city,
	sum(total) as invoice_total
from
	music_data_Store.invoice i
group by 1
order by 2 desc
limit 1;


-- Q5. Who is the best customer?
-- The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.
select
	i.customer_id, 
	c.first_name || ' ' || c.last_name as "Customer Name",
	sum(total) as "Spending"
from
	music_data_store.invoice i
left join
	music_data_store.customer c
USING(customer_id)
group by 1, 2
order by 2 desc
limit 1;

-- Q6. Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A
select
	distinct
	c.email,
	c.first_name,
	c.last_name
from
	music_data_store.customer c 
inner join
	music_data_store.invoice i 
using(customer_id)
inner join music_data_store.invoice_line il 
using(invoice_id)
where track_id in (
	select
		track_id 
	from
		music_data_store.track t 
	inner join
		music_data_store.genre g 
	on t.genre_id = g.genre_id
	where
		g.name = 'Rock'
)
order by 1 asc;


-- Q7. Let's invite the artists who have written the most rock music in our dataset. 
-- Write a query that returns the Artist name and total track count of the top 10 rock bands.

select
	ar.artist_id,
	ar.name,
	count(ar.artist_id) as number_of_songs
from 
	music_data_store.track t 
inner join
	music_data_store.album a 
using(album_id)
inner join 
	music_data_store.artist ar
using(artist_id)
inner join
	music_data_store.genre g 
on
	t.genre_id = g.genre_id
where
	g.name = 'Rock'
group by 1, 2
order by 3 desc 
limit 10;


-- Q8. Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.
select
	t.name,
	t.milliseconds
from
	music_data_store.track t 
where
	t.milliseconds > (
		select
			AVG(t1.milliseconds)
		from
			music_data_store.track t1
	)
order by 2 desc;

-- Q9. Find how much amount spent by each customer on best selling artists? 
-- Write a query to return customer name, artist name and total spent
WITH best_selling_artist AS (
	SELECT artist.artist_id AS artist_id, artist.name AS artist_name, SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
	FROM invoice_line
	JOIN track ON track.track_id = invoice_line.track_id
	JOIN album ON album.album_id = track.album_id
	JOIN artist ON artist.artist_id = album.artist_id
	GROUP BY 1,2
	ORDER BY 3 DESC
	LIMIT 1
)
SELECT c.customer_id, c.first_name, c.last_name, bsa.artist_name, SUM(il.unit_price*il.quantity) AS amount_spent
FROM invoice i
JOIN customer c ON c.customer_id = i.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t ON t.track_id = il.track_id
JOIN album alb ON alb.album_id = t.album_id
JOIN best_selling_artist bsa ON bsa.artist_id = alb.artist_id
GROUP BY c.customer_id, c.first_name, c.last_name, bsa.artist_name
ORDER BY amount_spent DESC;


-- Q10. We want to find out the most popular music Genre for each country. 
-- We determine the most popular genre as the genre with the highest amount of purchases. 
-- Write a query that returns each country along with the top Genre. 
-- For countries where the maximum number of purchases is shared return all Genres
with popular_genre as 
(
select
	COUNT(invoice_line.quantity) as purchases,
	customer.country,
	genre.name,
	genre.genre_id, 
	row_number() over(partition by customer.country order by COUNT(invoice_line.quantity) desc) as RowNo
from
	invoice_line
join invoice on
	invoice.invoice_id = invoice_line.invoice_id
join customer on
	customer.customer_id = invoice.customer_id
join track on
	track.track_id = invoice_line.track_id
join genre on
	genre.genre_id = track.genre_id
group by
	2,3,4
order by
	2 asc,1 desc
)
select 
	country,
	name
from 
	popular_genre
where 
	RowNo <= 1;


-- Write a query that determines the customer that has spent the most on music for each country. 
-- Write a query that returns the country along with the top customer and how much they spent. 
-- For countries where the top amount spent is shared, provide all customers who spent this amount
with Customter_with_country as (
select
	customer.customer_id,
	first_name,
	last_name,
	billing_country,
	SUM(total) as total_spending,
	    row_number() over(partition by billing_country order by SUM(total) desc) as RowNo
from
	invoice
join customer on
	customer.customer_id = invoice.customer_id
group by
	1,
	2,
	3,
	4
order by
	4 asc,
	5 desc)
select
	billing_country as country,
	first_name || ' ' || last_name as "Customer Name",
	total_spending
from
	Customter_with_country
where
	RowNo <= 1;

