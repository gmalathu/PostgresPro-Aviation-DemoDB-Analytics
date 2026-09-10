/*
@12:59 PM Saturday, September 5, 2026

Exploratory Data Analysis - demo DATABASE

Here are the tables + count(columns):

TABLE			Column_Count
airplanes_data	4
airports_data	6
boarding_passes	5
bookings		3
flights			7
routes			8
seats			3
segments		4
tickets			5
timetable		14

*/

-- Get row counts all tables

SELECT 'airplanes_data' as table, count(*) as row_count FROM airplanes_data
UNION ALL
SELECT 'airports_data' as table, count(*) as row_count FROM airports_data
UNION ALL
SELECT 'boarding_passes' as table, count(*) as row_count FROM boarding_passes
UNION ALL
SELECT 'bookings' as table, count(*) as row_count FROM bookings
UNION ALL
SELECT 'flights' as table, count(*) as row_count FROM flights
UNION ALL
SELECT 'routes' as table, count(*) as row_count FROM routes
UNION ALL
SELECT 'seats' as table, count(*) as row_count FROM seats
UNION ALL
SELECT 'segments' as table, count(*) as row_count FROM segments
UNION ALL
SELECT 'tickets' as table, count(*) as row_count FROM tickets
UNION ALL
SELECT 'timetable' as table, count(*) as row_count FROM timetable;

/*
table				row_count
airplanes_data		10
airports_data		5,501
boarding_passes		12,785,408
bookings			4,905,238
flights				69,710
routes				3,770
seats				1,741
segments			14,210,428
tickets				10,836,563
timetable			69,710


*/

/* 
Get sample rows from each table

Large (Percentage based, ie. below pulls 1%)
SELECT * 
FROM your_table TABLESAMPLE BERNOULLI(1);

Small (<100K rows)
SELECT * 
FROM your_table 
ORDER BY random() 
LIMIT 10;

*/

select * from airplanes_data;

SELECT * from airports_data order by random() limit 20;
SELECT * from boarding_passes order by random() limit 20;
SELECT * from bookings order by random() limit 20;
SELECT * from flights order by random() limit 20;
SELECT * from routes order by random() limit 20;
SELECT * from seats order by random() limit 20;
SELECT * from segments order by random() limit 20;
SELECT * from tickets order by random() limit 20;
SELECT * from timetable order by random() limit 20;

/*
Exploratory data analysis questions:

** Grouping related data
1	Airplane related data: airports, airplanes, routes and seats
2	booking related data: bookings, tickets, boarding passes, flights and segments...

*/

/*
Upload to CoPilot
ERD diagram postgres demo bookings
pg airline 1y data workpapers

Prompt: You are a postgresql admin and SQL reporting/analytics expert. Refer to the ERD diagram of an airline flight tracking database in the uploaded PNG file illustrating relationships between tables via lines drawn between them and highlighted join key columnes in each of the tables. Also refer to the uploaded Excel file containing sample data of up to 20 rows from each of the tables in the database.

Given this context, generaate SQL using postgresql syntax that answers the following questions:

1	What is the earliest and most recent booking date based on book_date in bookings?
2	Count the # of bookings by month and year
3	For each booking month and year, how many bookings count(booking_ref) are there that are for 2 tickets or more?

Generate your output in the form of SQL queries written using correct postgresql syntax.
*/

-- Question 1: Min/Max booking date
SELECT
    MIN(DATE_TRUNC('month', book_date)::date) AS earliest_booking_date,
    MAX(DATE_TRUNC('month', book_date)::date) AS most_recent_booking_date
FROM bookings;

/*
earliest_booking_date			most_recent_booking_date
2025-08-31 19:00:06.265 -0500	2026-08-31 18:59:58.283 -0500

8/31/25 to 8/31/26

*/

-- Question 2: # of bookings by month/year
SELECT
    EXTRACT(YEAR FROM book_date)  AS booking_year,
    EXTRACT(MONTH FROM book_date) AS booking_month,
    COUNT(book_ref)            AS booking_count
FROM bookings
GROUP BY
    EXTRACT(YEAR FROM book_date),
    EXTRACT(MONTH FROM book_date)
ORDER BY
    booking_year,
    booking_month;

-- OR Alternatively (for group by DATE_TRUNC(book_date) as booking_month)

SELECT
    DATE_TRUNC('month', book_date)::date AS booking_month,
    COUNT(booking_ref)                   AS booking_count
FROM bookings
GROUP BY DATE_TRUNC('month', book_date)
ORDER BY booking_month;

-- Question 3a: # of booking for > 1 ticket by monthy/year.

WITH booking_ticket_counts AS (
    SELECT
        b.book_ref,
        b.book_date,
        COUNT(t.ticket_no) AS ticket_count
    FROM bookings b
    JOIN tickets t
        ON t.book_ref = b.book_ref
    GROUP BY
        b.book_ref,
        b.book_date
)
SELECT
    EXTRACT(YEAR FROM book_date)  AS booking_year,
    EXTRACT(MONTH FROM book_date) AS booking_month,
    COUNT(book_ref)               AS bookings_with_2plus_tickets
FROM booking_ticket_counts
WHERE ticket_count >= 2
GROUP BY
    EXTRACT(YEAR FROM book_date),
    EXTRACT(MONTH FROM book_date)
ORDER BY
    booking_year,
    booking_month;

-- OR Alternatively (for group by DATE_TRUNC(book_date) as booking_month)

WITH booking_ticket_counts AS (
    SELECT
        b.book_ref,
        DATE_TRUNC('month', b.book_date)::date AS booking_month,
        COUNT(t.ticket_no) AS ticket_count
    FROM bookings b
    JOIN tickets t
        ON t.book_ref = b.book_ref -- b:t > 1:Many
    GROUP BY
        b.book_ref,
        DATE_TRUNC('month', b.book_date)
)
SELECT
    booking_month,
    COUNT(*) AS bookings_with_2plus_tickets
FROM booking_ticket_counts
WHERE ticket_count >= 2
GROUP BY booking_month
ORDER BY booking_month;

-- Question 3b: # of booking for 1 ticket by monthy/year.

WITH booking_ticket_counts AS (
    SELECT
        b.book_ref,
        DATE_TRUNC('month', b.book_date)::date AS booking_month,
        COUNT(t.ticket_no) AS ticket_count
    FROM bookings b
    JOIN tickets t
        ON t.book_ref = b.book_ref -- b:t > 1:Many
    GROUP BY
        b.book_ref,
        DATE_TRUNC('month', b.book_date)
)
SELECT
    booking_month,
    COUNT(*) AS bookings_with_1_ticket
FROM booking_ticket_counts
WHERE ticket_count < 2
GROUP BY booking_month
ORDER BY booking_month;

-- Validate Total # of tickets purchased
select count(*) from tickets; -- 10,836,563 total tickets (OK)

-- Total tickets for bookings w/ 2 or more vs. single ticket bookings.

WITH booking_ticket_counts AS (
    SELECT
        book_ref,
        COUNT(*) AS ticket_count
    FROM tickets
    GROUP BY book_ref
    HAVING COUNT(*) >= 2
)
SELECT
    SUM(ticket_count) AS total_tickets_in_bookings_with_2plus_tickets
FROM booking_ticket_counts;

-- Quick Validation: Is flight_id:route_no 1:1 or 1:Many or Many:1
-- Note: Timetable rows are unique by flight_id

select count(*)
from
(select flight_id
from timetable
group by 1) a
; -- 69710 total rows/flights

select count(*)
from
(select route_no
from timetable
group by 1) a
; -- 1322 total routes in timetable.

-- Compare to # of routes in routes table.

select count(*)
from
(select route_no
from routes
group by 1) a
; -- 1322 unique routes in routes AND in table: timetable

select count(*) from routes; -- 3770 total rows

select count(*)
from
(select route_no, validity
from routes
group by 1,2) a
; -- 3770 total rows

-- Get random sample of 20 route_no w/ 2 or more unique values for validity...

select b.*

from

(select route_no, count(validity) as count_route_valid
from
(select route_no
,validity

from routes
group by 1,2) a
group by 1
having count(validity) > 1
order by random()
limit 20) as a

left join routes as b on a.route_no = b.route_no
order by b.route_no, b.validity, b.scheduled_time
;


/*
Exploratory data analysis questions (continued):

1	Which routes are generating the most revenue per seat based on bookings/tickets?

Prompt: Generate a random sample of 100 bookings having 2 or more tickets and with each ticket having 2 or more flight ids. Each row in resulting output should be unique based on distinct book_ref, ticket_no and flight_id.  

Include these columns: book_ref, book_date, total_amount, ticket_no, flight_id, fare_conditions, price and route_no


*/