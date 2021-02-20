-- How many rows are in the data_analyst_jobs table?
SELECT count (*) from data_analyst_jobs;
--1793 rows

--Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT * from data_analyst_jobs LIMIT 10;
--ExxonMobil

--How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT Count(*) from data_analyst_jobs where location = 'TN';
--21 postings
SELECT Count(*) from data_analyst_jobs where location in ('TN','KY');
--27 postings

--How many postings in Tennessee have a star rating above 4?
SELECT Count(*) from data_analyst_jobs where location = 'TN' AND star_rating > 4;
--3

--How many postings in the dataset have a review count between 500 and 1000?
SELECT Count(*) FROM data_analyst_jobs WHERE review_count BETWEEN 500 AND 1000;
--151 postings between 500 and 1000 reviews

/*Show the average star rating for companies in each state. 
The output should show the state as state and the average rating for the state as avg_rating. 
Which state shows the highest average rating? */
SELECT AVG(star_rating) as avg_rating, location FROM data_analyst_jobs 
GROUP BY location
ORDER BY avg_rating desc;
--My averages do not look like averages

--Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT title) FROM data_analyst_jobs;
--881 job titles

--How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title) FROM data_analyst_jobs WHERE location='CA';
--230 job titles in California 

/*MEGAN COME FIX THIS Find the name of each company and its average star rating for all companies that have 
more than 5000 reviews across all locations. 
How many companies are there with more that 5000 reviews across all locations?*/
--SELECT company, AVG(star_rating) FROM data_analyst_jobs WHERE SUM(review_count) > 5000;

/*Add the code to order the query in #9 from highest to lowest average star rating. 
Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
What is that rating?*/

--Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
SELECT COUNT(*) FROM data_analyst_jobs WHERE title LIKE '%Analyst%'; 
--1636 job titles

/*How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
What word do these positions have in common?*/
SELECT * FROM data_analyst_jobs WHERE title NOT LIKE '%Analyst%';
--it's returning all caps ANALYST and analyst/

