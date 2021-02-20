--1. How many rows are in the data_analyst_jobs table?
SELECT count (*) from data_analyst_jobs;
--1793 rows

--2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT * from data_analyst_jobs LIMIT 10;
--ExxonMobil

--3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT Count(*) from data_analyst_jobs where location = 'TN';
--21 postings
SELECT Count(*) from data_analyst_jobs where location in ('TN','KY');
--27 postings

--4. How many postings in Tennessee have a star rating above 4?
SELECT Count(*) from data_analyst_jobs where location = 'TN' AND star_rating > 4;
--3

--5. How many postings in the dataset have a review count between 500 and 1000?
SELECT Count(*) FROM data_analyst_jobs WHERE review_count BETWEEN 500 AND 1000;
--151 postings between 500 and 1000 reviews

/*6. Show the average star rating for companies in each state. 
The output should show the state as state and the average rating for the state as avg_rating. 
Which state shows the highest average rating? */
SELECT ROUND(AVG(star_rating),2) as avg_rating, location FROM data_analyst_jobs 
WHERE star_rating IS NOT NULL
AND location IS NOT NULL
GROUP BY location
ORDER BY avg_rating desc;
--Nebraska has the highest average rating


--7. Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT title) FROM data_analyst_jobs;
--881 job titles

--8. How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title) FROM data_analyst_jobs WHERE location='CA';
--230 job titles in California 

/*9. Find the name of each company and its average star rating for all companies that have 
more than 5000 reviews across all locations. 
How many companies are there with more that 5000 reviews across all locations?*/
SELECT company, ROUND(AVG(star_rating),2) AS avg_rating, review_count FROM data_analyst_jobs 
	WHERE review_count > 5000
	GROUP BY company, review_count;
--40 companies 

/*10. Add the code to order the query in #9 from highest to lowest average star rating. 
Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
What is that rating?*/
SELECT company, AVG(star_rating) AS avg_rating, review_count FROM data_analyst_jobs 
	WHERE review_count > 5000
	GROUP BY company, review_count
	ORDER BY avg_rating desc;
/*Companies with the highest star rating of 4.20 (4.199999 when not rounded): Microsoft, Unilever, Nike, 
Kaiser Permanente, American Express, General Motors*/

--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
SELECT COUNT(DISTINCT title) FROM data_analyst_jobs WHERE title ILIKE '%Analyst%'; 
--774 distinct job titles

/*12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
What word do these positions have in common?*/
SELECT DISTINCT title FROM data_analyst_jobs WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';
--4 distinct job titles in this data set don't have both the words ‘Analyst’ or the word ‘Analytics’
--These job titles all include the word Tableau

/*BONUS 