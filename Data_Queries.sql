--Create Table
create table flight_bookings (
	trip_id integer,
	customer_id integer,
	flight_number varchar(32) ,
	airline_id integer,
	aircraft_id varchar(32),
	airport_src integer,
	airport_dst integer,
	departure_time time,
	departure_date date,
	flight_duration varchar(32),
	travel_class varchar(32),
	seat_number varchar(32),
	price integer,
	primary key (trip_id, flight_number, seat_number)
);

create table airlines (
	airline_id integer,
	airline_name varchar,
	country varchar,
	airline_iata varchar,
	airline_icao varchar,
	alias varchar,
	primary key (airline_id)
);

create table airports (
	airport_id integer,
	airport_name varchar,
	city varchar,
	country varchar,
	airport_iata varchar,
	airport_icao varchar,
	latitude float,
	longitude float, 
	primary key (airport_id)
);

create table aircrafts (
	aircraft_name  varchar,
	aircraft_iata varchar,
	aircraft_icao varchar,
	aircraft_id  varchar,
	primary key (aircraft_id)
);

create table customers (
	customer_id integer, 
	customer_first_name varchar,
	customer_family_name varchar,
	customer_gender varchar,
	customer_birth_date Date,
	customer_country varchar,
	customer_phone_number integer,
	primary key (customer_id)
);

create table hotel (
	hotel_id integer,
	hotel_name varchar,
	hotel_address varchar,
	city varchar,
	country varchar,
	hotel_score float,
	primary key (hotel_id)
)

create table hotel_bookings (
	trip_id integer,
	customer_id integer,
	hotel_id integer,
	check_in_date date,
	check_out_date date,
	price integer,
	breakfast_included bool,
	primary key (trip_id)
);

--1
select AVG(price)
from flight_bookings
where airline_id = 137
;

--2
select customer_country, count(customer_id)
from customers
group by customer_country
;

--3
select airport_name
from airports
where city = 'Paris'
;

--4
select country,city, count(airport_id) num
from airports
group by city, country
order by num DESC limit 1
;

--5
select airlines.airline_name
from flight_bookings 
join airlines Using (airline_id)
join aircrafts using (aircraft_id)
where aircraft_id in ('AB3A30B', 'AB6A306', 'ABBA3ST')
group by airlines.airline_name
;

--6
select customers.customer_id, customers.customer_first_name, customers.customer_family_name
from flight_bookings 
join airports on (flight_bookings.airport_dst = airports.airport_id)
join customers on (flight_bookings.customer_id = customers.customer_id)
where airports.city = 'Sydney' and airports.country = 'Australia'
group by customers.customer_id
;

--7
select airports.airport_id, airports.airport_name, airports.city, airports.country, count(*) num
from flight_bookings 
join airports on (flight_bookings.airport_dst = airports.airport_id)
group by airports.airport_id, airports.airport_name, airports.city, airports.country
order by num DESC limit 1
;

--8
select avg(price)
from flight_bookings 
where travel_class = 'economy'
;

--9
select avg(price)
from flight_bookings 
where travel_class = 'business'
;

--10
select airports.airport_name, airports.city, airports.country
from flight_bookings 
join airports on (flight_bookings.airport_dst = airports.airport_id)
join customers on (flight_bookings.customer_id = customers.customer_id)
where customers.customer_country = 'France'
group by airports.airport_name, airports.city, airports.country
;

--11
select airports.city, airports.country
from flight_bookings 
join airports on (flight_bookings.airport_dst = airports.airport_id)
join customers on (flight_bookings.customer_id = customers.customer_id)
group by airports.city, airports.country
having sum(case when customers.customer_gender = 'M' then 1 else 0 end ) < sum(case when customers.customer_gender = 'F' then 1 else 0 end )
order by airports.city ASC
;

--12
select airports.city, airports.country
from flight_bookings 
join airports on (flight_bookings.airport_dst = airports.airport_id)
join customers on (flight_bookings.customer_id = customers.customer_id)
group by airports.city, airports.country
having sum(case when customers.customer_gender = 'M' then 1 else 0 end ) > sum(case when customers.customer_gender = 'F' then 1 else 0 end )
order by airports.city ASC
;

--13
select customers.customer_country, count(customers.customer_id) num
from flight_bookings 
join airports on (flight_bookings.airport_dst = airports.airport_id)
join customers on (flight_bookings.customer_id = customers.customer_id)
where flight_bookings.airport_dst in (1380, 1382, 1386)
group by customers.customer_country
order by num DESC
;

--14
select city, count(hotel_id)
from hotel
group by city
;

--15
select sum(flight_bookings.price)
from flight_bookings 
join customers on (flight_bookings.customer_id = customers.customer_id)
where customers.customer_first_name = 'Tatiana' and customers.customer_family_name = 'REZE'
;