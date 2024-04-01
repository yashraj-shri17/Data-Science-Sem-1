create database olympics_db;
use olympics_db;
select * from olympics; -- A. Retrieve all records from the Olympics table.
SELECT name, medal FROM olympics; -- B. Retrieve only the Athlete names and the Medals they won
SELECT COUNT(DISTINCT name) AS total_athletes FROM olympics;-- C. Count the total number of athletes in the dataset.
SELECT * FROM olympics WHERE Medal = 'Gold';-- D. Find all records of athletes who won a Gold medal
SELECT name FROM olympics WHERE medal = 'Silver' ORDER BY Year;-- E. List all athletes who won Silver, ordered by the Year they won it.
SELECT team, 
       SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
       SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
       SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM Olympics
GROUP BY team;-- F. Count how many Gold, Silver, and Bronze medals each country has won.
SELECT team, 
       SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold
FROM Olympics
GROUP BY team
HAVING Gold > 50;-- G. Identify countries that have won more than 50 Gold medals.
SELECT name, COUNT(*) AS Total_Medals
FROM Olympics
GROUP BY name
ORDER BY Total_Medals DESC
LIMIT 1;-- I. Find the athlete who has won the most medals

SELECT DISTINCT Event FROM Olympics WHERE Event LIKE '%Freestyle%';-- J. List all events that include the term 'Freestyle' in their name

SELECT name,sport, COUNT(*) AS Total_Medals
FROM Olympics
GROUP BY sport,name
ORDER BY sport,Total_Medals DESC
LIMIT 3;-- K. Find the top 3 athletes by the total number of medals won in each sport.

SELECT name, Year, COUNT(*) AS Total_Medals
FROM Olympics
GROUP BY name, Year
HAVING Total_Medals > 1;-- L. List athletes who won more than one medal in a single Olympic year.

SELECT team
FROM Olympics
WHERE Season IN ('Summer', 'Winter')
GROUP BY team
HAVING COUNT(DISTINCT Season) = 2 AND SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) > 0;-- M. Identify countries that have won gold medals in both Summer and Winter Olympics.

SELECT team, MAX(Year) - MIN(Year) AS Year_Difference
FROM Olympics
GROUP BY team;-- N. Show the year difference between the first and last medal won by each country.

 SELECT team, AVG(Total_Medals) AS Average_Medals_Per_Athlete
FROM (SELECT team, name, COUNT(*) AS Total_Medals
      FROM Olympics
      GROUP BY team, name) AS Athlete_Medals
GROUP BY team;-- O. Calculate the average number of medals won per athlete for each country.

SELECT name, Event
FROM Olympics
WHERE Event IN (SELECT Event FROM Olympics WHERE Medal = 'Silver')
  AND Medal = 'Gold';-- P. Identify athletes who have won a silver medal and then later won a gold in the same event.






