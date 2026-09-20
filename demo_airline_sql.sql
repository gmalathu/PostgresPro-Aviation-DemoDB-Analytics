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

-- Get row counts all tables in 'demo_1y'

select * FROM
(SELECT 'airplanes_data' as table_name, count(*) as row_count FROM demo.bookings.airplanes_data
UNION ALL
SELECT 'airports_data' as table_name, count(*) as row_count FROM demo.bookings.airports_data
UNION ALL
SELECT 'boarding_passes' as table_name, count(*) as row_count FROM demo.bookings.boarding_passes
UNION ALL
SELECT 'bookings' as table_name, count(*) as row_count FROM demo.bookings.bookings
UNION ALL
SELECT 'flights' as table_name, count(*) as row_count FROM demo.bookings.flights
UNION ALL
SELECT 'routes' as table_name, count(*) as row_count FROM demo.bookings.routes
UNION ALL
SELECT 'seats' as table_name, count(*) as row_count FROM demo.bookings.seats
UNION ALL
SELECT 'segments' as table_name, count(*) as row_count FROM demo.bookings.segments
UNION ALL
SELECT 'tickets' as table_name, count(*) as row_count FROM demo.bookings.tickets
UNION ALL
SELECT 'timetable' as table_name, count(*) as row_count FROM demo.bookings.timetable) a
order by table_name
;

/*
demo_1y
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

-- Get row counts all tables in 'demo_2y'

select * FROM
(SELECT 'airplanes_data' as table_name, count(*) as row_count FROM demo_2y.bookings.airplanes_data
UNION ALL
SELECT 'airports_data' as table_name, count(*) as row_count FROM demo_2y.bookings.airports_data
UNION ALL
SELECT 'boarding_passes' as table_name, count(*) as row_count FROM demo_2y.bookings.boarding_passes
UNION ALL
SELECT 'bookings' as table_name, count(*) as row_count FROM demo_2y.bookings.bookings
UNION ALL
SELECT 'flights' as table_name, count(*) as row_count FROM demo_2y.bookings.flights
UNION ALL
SELECT 'routes' as table_name, count(*) as row_count FROM demo_2y.bookings.routes
UNION ALL
SELECT 'seats' as table_name, count(*) as row_count FROM demo_2y.bookings.seats
UNION ALL
SELECT 'segments' as table_name, count(*) as row_count FROM demo_2y.bookings.segments
UNION ALL
SELECT 'tickets' as table_name, count(*) as row_count FROM demo_2y.bookings.tickets
UNION ALL
SELECT 'timetable' as table_name, count(*) as row_count FROM demo_2y.bookings.timetable) a
order by table_name
;

/*
demo_2y
table_name			row_count
airplanes_data		10
airports_data		5,501
boarding_passes		26,299,160
bookings			9,706,657
flights				135,571
routes				7,242
seats				1,741
segments			27,580,257
tickets				21,095,265
timetable			135,571

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
-- @4:13 PM Friday, September 11, 2026, Use 'demo_2y' data

SELECT
    MIN(DATE_TRUNC('month', book_date)::date) AS earliest_booking_date,
    MAX(DATE_TRUNC('month', book_date)::date) AS most_recent_booking_date
FROM demo_2y.bookings.bookings;

/*
earliest_booking_date	most_recent_booking_date
2025-08-01				2027-08-01

8/31/25 to 8/31/26

*/

-- Question 2: # of bookings by month/year
SELECT
    EXTRACT(YEAR FROM book_date)  AS booking_year,
    EXTRACT(MONTH FROM book_date) AS booking_month,
    COUNT(book_ref)            AS booking_count
FROM demo_2y.bookings.bookings
GROUP BY
    EXTRACT(YEAR FROM book_date),
    EXTRACT(MONTH FROM book_date)
ORDER BY
    booking_year,
    booking_month;

-- OR Alternatively (for group by DATE_TRUNC(book_date) as booking_month)

SELECT
    DATE_TRUNC('month', book_date)::date AS booking_month,
    COUNT(book_ref)                   AS booking_count
FROM demo_2y.bookings.bookings
GROUP BY DATE_TRUNC('month', book_date)
ORDER BY booking_month;

-- Question 3a: # of booking for > 1 ticket by monthy/year.

WITH booking_ticket_counts AS (
    SELECT
        b.book_ref,
        b.book_date,
        COUNT(t.ticket_no) AS ticket_count
    FROM demo_2y.bookings.bookings b
    JOIN demo_2y.bookings.tickets t
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
DROP TABLE IF EXISTS demo_2y.bookings.booking_1_plus_tkt;
CREATE TABLE demo_2y.bookings.booking_1_plus_tkt AS

WITH booking_ticket_counts AS (
    SELECT
        b.book_ref,
        DATE_TRUNC('month', b.book_date)::date AS booking_month,
        COUNT(t.ticket_no) AS ticket_count
    FROM demo_2y.bookings.bookings b
    JOIN demo_2y.bookings.tickets t
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
GROUP BY booking_month;
-- ORDER BY booking_month


-- Question 3b: # of booking for 1 ticket by monthy/year.

DROP TABLE IF EXISTS demo_2y.bookings.booking_1tkt;
CREATE TABLE demo_2y.bookings.booking_1tkt AS

WITH booking_ticket_counts AS (
    SELECT
        b.book_ref,
        DATE_TRUNC('month', b.book_date)::date AS booking_month,
        COUNT(t.ticket_no) AS ticket_count
    FROM demo_2y.bookings.bookings b
    JOIN demo_2y.bookings.tickets t
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
GROUP BY booking_month;
-- ORDER BY booking_month;

-- Validate Total # of tickets purchased

-- Total tickets for bookings w/ 2 or more vs. single ticket bookings.

WITH booking_ticket_counts AS (
    SELECT
		book_ref,
		ticket_no
    FROM demo_2y.bookings.tickets
    GROUP BY 1,2
)

select 'bookings_1plus_tickets' as booking_type
,sum(count_tix) as count_tix

from

(select book_ref
,count(ticket_no) as count_tix

from booking_ticket_counts
group by 1
having count(ticket_no) > 1) a

UNION ALL

select 'bookings_1ticket' as booking_type
,sum(count_tix) as count_tix

from

(select book_ref
,count(ticket_no) as count_tix

from booking_ticket_counts
group by 1
having count(ticket_no) = 1) a

/*

booking_type			count_tix
bookings_1plus_tickets	18,259,197
bookings_1ticket		2,836,068

*/

-- Quick Validation: Is flight_id:route_no 1:1 or 1:Many or Many:1
-- Note: Timetable rows are unique by flight_id

select count(*)
from
(select flight_id
group by 1) a
; -- 135,571 total rows/flights

select count(*)
from
(select route_no
from demo_2y.bookings.timetable
group by 1) a
; 
-- 1798 total routes in timetable. The timetable for flights reflects only those routes the flights currently serve for this 2 year period.

-- Compare to # of routes in routes table.

select count(*)
from
(select route_no
from demo_2y.bookings.routes
group by 1) a
; -- 1798 unique routes in routes AND in table: timetable (routes table includes ALL routes in the timetable)

select count(*) from demo_2y.bookings.routes; -- 7,242 total rows

select count(*)
from
(select route_no, validity
from demo_2y.bookings.routes
group by 1,2) a
; -- 7,242 total rows, reflects routes and their associated validity (date range route is in service)

-- Get random sample of 20 route_no w/ 2 or more unique values for validity...

select b.*

from

(select route_no, count(validity) as count_route_valid
from
(select route_no
,validity

from demo_2y.bookings.routes
group by 1,2) a
group by 1
having count(validity) > 1
order by random()
limit 20) as a

left join demo_2y.bookings.routes as b on a.route_no = b.route_no
order by b.route_no, b.validity, b.scheduled_time
;


/*

You are an expert postgresql SQL developer. Write the SQL query in postgresql syntax that creates a table derived from 'routes' that includes these 4 additional columns and call it 'routes_ext'

These additional columns should be populated as follows. First column calculates # of days/months indicated in 'validity' and populates column 'days_gap'. 2nd column should derive its value based on sorting the routes table by route_no and validity and be named 'suspend_start' and will be populated with the day after the previous validity period ends. Then 3rd column named 'suspend_end' will be populated with the day before the following validity period starts.

For example, refer to routes tab w/ 20 row sample of route_no's w/ > 1 row for validity with column datatype format 'tstzrange — Range of timestamp with time zone'... Route 'PG0244' with validity value of '["2025-10-31 19:00:00-05","2025-11-30 18:00:00-06")' is contiguous with previous period '["2025-09-30 19:00:00-05","2025-10-31 19:00:00-05")'. Add a 4th column called 'contiguous_ind' and populate 1 if row value for validity is contiguous with the previous row value in tstzrange format and 0 if there is a gap. If 'contiguous_ind' is 0 then 'suspend_start' and 'suspend_end' should be blank or null, and if the value is 1 then 'suspend_start' and 'suspend_end' should always be populated with the associated tstz value in date/time/timezone format.

Write the SQL query in postgresql syntax that creates a table derived from 'routes' that includes these 3 additional columns and call it 'routes_ext'

*/

BEGIN;
DROP TABLE IF EXISTS demo_2y.bookings.routes_ext;
CREATE TABLE demo_2y.bookings.routes_ext AS
WITH ordered_routes AS
(
    SELECT
        r.*,

        LAG(validity) OVER
        (
            PARTITION BY route_no
            ORDER BY lower(validity)
        ) AS prev_validity,

        LEAD(validity) OVER
        (
            PARTITION BY route_no
            ORDER BY lower(validity)
        ) AS next_validity

    FROM demo_2y.bookings.routes r
)
SELECT
    o.*,

    /* Length of validity period in days */
    EXTRACT(EPOCH FROM (upper(o.validity) - lower(o.validity))) / 86400.0
        AS days_gap,

    /* Contiguous with previous validity period */
    CASE
        WHEN o.prev_validity IS NOT NULL
         AND lower(o.validity) = upper(o.prev_validity)
        THEN 1
        ELSE 0
    END AS contiguous_ind,

    /* Day after previous validity period ends */
    CASE
        WHEN o.prev_validity IS NOT NULL
         AND lower(o.validity) = upper(o.prev_validity)
        THEN upper(o.prev_validity) + INTERVAL '1 day'
        ELSE NULL
    END AS suspend_start,

    /* Day before current validity period starts */
    CASE
        WHEN o.prev_validity IS NOT NULL
         AND lower(o.validity) = upper(o.prev_validity)
        THEN lower(o.validity) - INTERVAL '1 day'
        ELSE NULL
    END AS suspend_end

FROM ordered_routes o;
COMMIT;

select * from demo_2y.bookings.routes_ext;

-- Get sample to validate column logic was applied correctly.

select b.*

from

(select )

/*
Exploratory data analysis questions (continued):

1	Which routes are generating the most revenue per seat based on bookings/tickets?

Prompt: Generate a random sample of 100 bookings having 2 or more tickets and with each ticket having 2 or more flight ids. Each row in resulting output should be unique based on distinct book_ref, ticket_no and flight_id.  

Include these columns: book_ref, book_date, total_amount, ticket_no, flight_id, fare_conditions, price and route_no


*/