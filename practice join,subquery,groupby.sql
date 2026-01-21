use regex;
CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- -------------------------
-- Create table: ticket_sales
-- -------------------------
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- -------------------------
-- Insert data: events
-- -------------------------
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

-- -------------------------
-- Insert data: ticket_sales
-- -------------------------
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);

-- Quick check
SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;

-- Find the total quantity sold per event_id. 
select e.event_id , sum(t.qty) from events e join ticket_sales t
on e.event_id = t.event_id group by e.event_id;


/* Find the total revenue per event_id. 
event_id total_revenue 
1          8000 
2          12000 
3          9000 
4          6000 */
select e.event_id , sum(t.qty * t.price_per_ticket) as total_revenue from events e join ticket_sales t
on e.event_id = t.event_id group by e.event_id;

/* Find monthly total revenue (group by month of sale_date). 
sale_month total_revenue 
1           18800 
2           13200 
3           9000       */
select month(sale_date) , sum(qty * price_per_ticket) as total_revenue 
from ticket_sales group by month(sale_date);

/* find the maximum price_per_ticket per event_id. 
event_id max_price 
1         5000 
2         6000 
3         2500 
4         1200 */
select e.event_id , MAX(t.price_per_ticket) as max_price from events e join ticket_sales t
on e.event_id = t.event_id group by e.event_id;
 
/* Find total revenue per month and ticket_type. 
sale_month ticket_type total_revenue 
1 Regular 7800 
1 VIP 11000 
2 Regular 7200 
2 VIP 6000 
3 Regular 4000 
3 VIP 5000 */
select 
 
/* List all sales with event_name and sale_date. 
sale_id event_name sale_date 
101 Music Fest 2025-01-05 
102 Music Fest 2025-01-10 
103 Tech Summit 2025-02-03 
104 Tech Summit 2025-02-10 
105 Food Carnival 2025-03-01 
106 Food Carnival 2025-03-15 
107 Startup Meetup 2025-01-20 
108 Startup Meetup 2025-02-05 */


/* Show event_name, ticket_type, qty for each sale. 
event_name ticket_type qty 
Music Fest Regular 2 
Music Fest VIP 1 
Tech Summit Regular 3 
Tech Summit VIP 1
event_name ticket_type qty 
Food Carnival Regular 5 
Food Carnival VIP 2 
Startup Meetup Regular 4 
Startup Meetup Regular 1 */



-- Show sales where the event city is Mumbai. 


/* Show all events and matching sales 
event_name sale_id sale_date 
Music Fest 101 2025-01-05 
Music Fest 102 2025-01-10 
Tech Summit 103 2025-02-03 
Tech Summit 104 2025-02-10 
Food Carnival 105 2025-03-01 
Food Carnival 106 2025-03-15 
Startup Meetup 107 2025-01-20 
Startup Meetup 108 2025-02-05 */



/* Show distinct event names that have at least one sale. 
event_name 
Music Fest 
Tech Summit 
Food Carnival 
Startup Meetup */



/* Show each sale’s computed revenue with event name. 
sale_id event_name revenue 
101 Music Fest 3000 
102 Music Fest 5000 
103 Tech Summit 6000 
104 Tech Summit 6000 
105 Food Carnival 4000 
106 Food Carnival 5000 
107 Startup Meetup 4800 
108 Startup Meetup 1200 */



/* Find total quantity per event_name. 
event_name total_qty 
Music Fest 3 
Tech Summit 4 
Food Carnival 7 
Startup Meetup 5 
*/


/* Find total VIP revenue per event_name. 
event_name vip_revenue 
Food Carnival 5000 
Music Fest 5000 
Tech Summit 6000 */


/* Find monthly revenue per city. 
city sale_month total_revenue 
Bengaluru 2 12000 Delhi 3 9000 Mumbai 1 12800 Mumbai 2 1200 */



/* Find total quantity per city and ticket_type. 
city ticket_type total_qty 
Bengaluru Regular 3 
Bengaluru VIP 1 
Delhi Regular 5 
Delhi VIP 2 
Mumbai Regular 7 
Mumbai VIP 1 */



/* Find sales that happened on the latest sale_date in the table. 
sale_id event_id sale_date ticket_type qty price_per_ticket 106 3 2025-03-15 VIP 2 2500 
*/



/* Find sales where revenue is greater than the overall average sale revenue. 
sale_id event_id revenue 
102 1 5000 
103 2 6000 
104 2 6000 
106 3 5000 
107 4 4800 */



/* Find events that have at least one VIP sale. 
event_id event_name 
1 Music Fest 
2 Tech Summit 
3 Food Carnival */



/* Find events in cities that have at least one VIP sale. Hint: subquery will use the joins
event_id event_name city 
1 Music Fest Mumbai 
2 Tech Summit Bengaluru 
3 Food Carnival Delhi 
4 Startup Meetup Mumbai */



/* Find events that have at least one sale in February 2025. 
event_id event_name city 
2 Tech Summit Bengaluru 
4 Startup Meetup Mumbai */



/* For each event, return the highest price_per_ticket sale row. 
Hint: read the question twice 
sale_id event_id sale_date ticket_type qty price_per_ticket 102 1 2025-01-10 VIP 1 5000 104 2 2025-02-10 VIP 1 6000 106 3 2025-03-15 VIP 2 2500 107 4 2025-01-20 Regular 4 1200 108 4 2025-02-05 Regular 1 1200 
/* Show monthly total revenue and monthly total quantity, but only include months where total revenue is at least 10,000. 
sale_month total_qty total_revenue 
1 7 18800 
2 5 13200 */



/* Show month-wise count of sales rows, but only include months that have at least 3sales rows. 
sale_month sales_rows 
2 3 */


 
/* Show average revenue per sale row per month, but only include months where average sale revenue is above 4000. 
sale_month avg_sale_revenue
sale_month avg_sale_revenue 
1 6266.6667 
2 4400 */



/* Show revenue per month and ticket_type, but only include groups where total revenue is at least 5000. 
sale_month ticket_type total_revenue 
1 Regular 7800 
1 VIP 11000 
2 Regular 7200 
2 VIP 6000 
3 VIP 5000
*/ 
