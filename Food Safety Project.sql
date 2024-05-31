Create database Project;
use Project;

-- 1) Create a query to display all columns from the excel_project table.
SELECT 
    *
FROM
    excel_project;

-- 2) Create a query to display the Restaurent_ID, Restaurent_Name, Location, Score, and Grade columns from the excel_project table.
SELECT 
    Restaurant_ID, Restaurant_Name, Location, SCORE, GRADE
FROM
    excel_project;

-- 3) Create a query to count the total number of inspections in the excel_project table.
SELECT 
    COUNT(DISTINCT (INSPECTION_TYPE))
FROM
    excel_project;

-- 4) Create a query to find all unique locations in the excel_project table.
SELECT DISTINCT
    (Location)
FROM
    excel_project;

 -- 5) Create a query to retrieve all inspections for a restaurant named 'Restaurant XYZ' from the excel_project table.
 SELECT 
    CONCAT(Restaurant_Name, ' ', INSPECTION_TYPE)
FROM
    excel_project;
 
 -- 6) Create a query to count the number of inspections conducted for each restaurant in the excel_project table.
 SELECT 
    INSPECTION_TYPE, COUNT(Restaurant_Name)
FROM
    excel_project
GROUP BY INSPECTION_TYPE;
 
 -- 7) Create a query to calculate the average score for each restaurant in the excel_project table.
 SELECT 
    AVG(SCORE)
FROM
    excel_project;
 
 -- 8) Create a query to find the highest score received by each restaurant in the excel_project table.
SELECT 
    Restaurant_Name, SCORE
FROM
    excel_project
ORDER BY SCORE DESC
LIMIT 1;
 
-- 9) Create a query to list all restaurants in the excel_project table that have received critical flags.
SELECT 
    Restaurant_Name, CRITICAL_FLAG
FROM
    excel_project
WHERE
    CRITICAL_FLAG = 'Critical';

-- 10) Create a query to find all restaurants in the excel_project table with scores below 70.
SELECT 
    Restaurant_Name, SCORE
FROM
    excel_project
WHERE
    SCORE < 70;

-- 11) Create a query to list all restaurants in the excel_project table that have received a specific grade. 
SELECT 
    *
FROM
    excel_project
WHERE
    GRADE = 'A';

-- 12) Create a query to count the number of critical flags for each location in the excel_project table.
SELECT 
    Location, COUNT(CRITICAL_FLAG)
FROM
    excel_project
GROUP BY Location;

-- 13) Create a query to find the distribution of grades among the restaurants in the excel_project table.
SELECT 
    GRADE, COUNT(Restaurant_Name)
FROM
    excel_project
GROUP BY GRADE;

-- 14) Create a query to calculate the percentage of inspections that received a critical flag in the excel_project table.
SELECT 
    INSPECTION_TYPE, COUNT(CRITICAL_FLAG) / 100 AS Percentage
FROM
    excel_project
GROUP BY INSPECTION_TYPE;

-- 15) Create a query to calculate the average score for each location in the excel_project table.
SELECT 
    Location, AVG(SCORE)
FROM
    excel_project
GROUP BY Location;

-- 16) Create a query to calculate the average score for each grade in the excel_project table.
SELECT 
    GRADE, AVG(SCORE)
FROM
    excel_project
GROUP BY GRADE;

-- 17) Create a query to list the top 10 restaurants with the highest average scores in the excel_project table.
SELECT 
    Restaurant_Name, SCORE
FROM
    excel_project
ORDER BY SCORE DESC
LIMIT 10;


-- 18) Create a query to find the average score per inspection type for each location in the excel_project table.
SELECT 
    INSPECTION_TYPE, Location, AVG(SCORE)
FROM
    excel_project
GROUP BY INSPECTION_TYPE , Location;


-- 19) Create a query to find the names of restaurants that have received an 'A' grade but also have not critical flag.
SELECT 
    Restaurant_Name, CRITICAL_FLAG, GRADE
FROM
    excel_project
WHERE
    GRADE = 'A'
        AND CRITICAL_FLAG = 'Not Critical';

