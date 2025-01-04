--olaSQLQueries

create database ola;
use ola;
select* FROM BOOKINGS;
create view successful_bookings as
select* from bookings
where Booking_Status = "success";
select * from successful_bookings;
create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;
create view canceled_rides_by_customer as
select count(*) from bookings
where Booking_Status = "Canceled by Driver";
create view top_5_customers as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;
create view Rides_canceled_by_Drivers_P_C_Issue as 
select count(*) from bookings 
where Canceled_Rides_by_Driver = "Personal & Car related issue";
create view Driver_rating as
select max(Driver_Ratings)  as max_rating,
min(Driver_Ratings) as min_rating
from bookings 
where Vehicle_Type ="Prime Sedan";
create view UPI_payment as
select * from bookings 
where Payment_Method = "UPI";
create view avg_cust_rat as
select Vehicle_Type , avg(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;
create view total_successful_value as
select sum(Booking_Value) as total_successful_value
from bookings 
where Booking_Status = "success";

