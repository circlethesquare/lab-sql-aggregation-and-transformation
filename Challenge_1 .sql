USE sakila;
-- Challenge 1

-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.

SELECT 
MAX(length) AS max_duration,
MIN(length) as min_duration
FROM sakila.film; 

-- 1.2. Express the average movie duration in hours and minutes. Don't use decimals.

SELECT CONVERT(AVG(length), TIME) 
AS avg_movie_duration
FROM sakila.film; 

-- 2.1 Calculate the number of days that the company has been operating.
-- Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.

SELECT
DATEDIFF(MAX(rental_date),MIN(rental_date))
FROM sakila.rental;

-- 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.

SELECT *,
DATE_FORMAT(rental_date, '%M') AS month,
DATE_FORMAT(rental_date, '%W') AS weekday
FROM sakila.rental
LIMIT 20;

-- 2.3 Bonus: Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week.
-- Hint: use a conditional expression.
SELECT *,
    CASE
        WHEN DATE_FORMAT(rental_date, '%W') IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') THEN 'Weekday'
        WHEN DATE_FORMAT(rental_date, '%W') IN ('Saturday', 'Sunday') THEN 'Weekend'
    END AS DAY_TYPE
FROM sakila.rental;