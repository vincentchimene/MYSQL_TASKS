-- Question 1
SELECT trip_id, rider_name, fare, city FROM trips WHERE city = 'Lagos';

-- Question 2
SELECT rider_name, city, fare FROM trips ORDER BY fare DESC LIMIT 5;

-- Question 3
SELECT DISTINCT city FROM trips;

-- Question 4
SELECT * FROM trips WHERE payment_method = 'Card' and fare > 5000; 

-- Question 5
SELECT * FROM trips WHERE distance_km BETWEEN 5 AND 10;

-- Question 6
SELECT * FROM trips WHERE rider_name LIKE 'A%';

-- Question 7
SELECT * FROM trips WHERE payment_method IN ('Card', 'Wallet');

-- Question 8
SELECT * FROM trips WHERE rating IS NULL;

-- Question 9
SELECT city, max(fare) as highest_fare FROM trips 
WHERE status = 'Completed' GROUP BY city ORDER BY highest_fare DESC;

-- Question 10

SELECT * FROM trips WHERE status = 'Completed' ORDER BY city ASC, fare DESC;

-- Question 11
select sum(fare),avg(fare),max(fare), min(fare) from trips where status = 'completed';

-- Question 12
select count(*) as total_trips,vehicle_type from trips group by vehicle_type;

-- Question 13
select city, sum(fare) as total_revenue from trips where  status= 'completed' group by city order by total_revenue desc;

-- Question 14

select city,avg_rating from (select city, avg(rating) as avg_rating from trips group by city) as city_ratings where avg_rating < 4;

-- Question 15
select driver_name,home_city from trips join drivers on trips.driver_id =drivers.driver_id;

-- Question 16
select driver_name,number_of_trips from (select count(*) as number_of_trips,driver_name from trips join drivers group by driver_name) as driver_trips where number_of_trips >6