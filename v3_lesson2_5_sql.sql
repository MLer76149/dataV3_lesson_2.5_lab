use sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.
select * from actor;

select first_name, last_name from actor
where first_name = "Scarlett";

-- 2. How many films (movies) are available for rent and how many films have been rented?
select count(*) as movies_rented from rental;

select count(*) as movies_available from film;

select * from rental;

select * from inventory;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select max(length) as max_duration, min(length) as min_duration from film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
select avg(length) from film;
select floor(avg(length)/60) as hours, floor(avg(length) - 60 * floor(avg(length)/60)) as minutes  from film;

-- 5. How many distinct (different) actors' last names are there?
select count(*) from actor;

select count(distinct(last_name)) from actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
select * from store;

select DATEDIFF(CURDATE(), min(rental_date)) AS 'Number of Days' from rental;
select * from film;

select * from rental
having rental_date = min(rental_date);

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
select * from rental;

select *, dayname(rental_date), monthname(rental_date),
dayname(return_date), monthname(return_date) from rental;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, dayname(rental_date) as rentalday, monthname(rental_date) as rentalmonth,
dayname(return_date), monthname(return_date),
case
when dayname(rental_date) in ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday") then "workday"
else "weekend"
end as day_type
from rental;

-- 9. Get release years.

select distinct(release_year) from film;

-- 10. Get all films with ARMAGEDDON in the title.

select * from film
where title like "%ARMAGEDDON%";

-- 11. Get all films which title ends with APOLLO.

select * from film
where title like "%APOLLO";

-- 12. Get 10 the longest films.

select * from film
order by length DESC
Limit 10;

-- 13. How many films include Behind the Scenes content?

select count(*) as "Films with behind the scenes" from film
where special_features like "%Behind the Scenes%";

