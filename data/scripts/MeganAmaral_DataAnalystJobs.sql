-- How many rows are in the data_analyst_jobs table?
Select count (*) from data_analyst_jobs;
--1793 rows

--Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
Select * from data_analyst_jobs LIMIT 10;
--ExxonMobil

--How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
Select Count(*) from data_analyst_jobs where location = 'TN';
--21
Select Count(*) from data_analyst_jobs where location in ('TN','KY');
--27

--How many postings in Tennessee have a star rating above 4?
Select Count(*) from data_analyst_jobs where location = 'TN' AND star_rating > 4;
--3

--How many postings in the dataset have a review count between 500 and 1000?
Select Count(*) from data_analyst_jobs where review_count BETWEEN 500 AND 1000;
--151

/*Show the average star rating for companies in each state. 
The output should show the state as state and the average rating for the state as avg_rating. 
Which state shows the highest average rating? */

