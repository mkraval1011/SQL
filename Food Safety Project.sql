Create database Project;
use Project;

-- 1) Create a query to display all columns from the excel_project table.
SELECT 
    *
FROM
    excel_project;
-- Conclusion: This query retrieves all data columns and all rows from the excel_project table.

-- 2) Create a query to display the Restaurent_ID, Restaurent_Name, Location, Score, and Grade columns from the excel_project table.
SELECT 
    Restaurant_ID, Restaurant_Name, Location, SCORE, GRADE
FROM
    excel_project;
-- Conclusion: This query retrieves specific columns (Restaurant_ID, Restaurant_Name, Location, Score, and Grade) from all rows of the excel_project table.

-- 3) Create a query to count the total number of inspections in the excel_project table.
SELECT 
    COUNT(DISTINCT (INSPECTION_TYPE))
FROM
    excel_project;
-- Conclusion: This query counts the distinct number of inspection types present in the excel_project table.

-- 4) Create a query to find all unique locations in the excel_project table.
SELECT DISTINCT
    (Location)
FROM
    excel_project;
-- Conclusion: This query retrieves a list of all unique locations found within the excel_project table.

 -- 5) Create a query to retrieve all inspections for a restaurant named 'Restaurant XYZ' from the excel_project table.
 SELECT 
    CONCAT(Restaurant_Name, ' ', INSPECTION_TYPE)
FROM
    excel_project;
 -- Conclusion: This query retrieves a list combining Restaurant Name and Inspection Type for each record in the excel_project table. 
 
 -- 6) Create a query to count the number of inspections conducted for each restaurant in the excel_project table.
 SELECT 
    INSPECTION_TYPE, COUNT(Restaurant_Name)
FROM
    excel_project
GROUP BY INSPECTION_TYPE;
-- Conclusion: This query groups inspections by type and counts the number of inspections conducted for each type.
 
 -- 7) Create a query to calculate the average score for each restaurant in the excel_project table.
 SELECT 
    AVG(SCORE)
FROM
    excel_project;
-- Conclusion: This query calculates the average score across all inspections in the excel_project table.
 
 -- 8) Create a query to find the highest score received by each restaurant in the excel_project table.
SELECT 
    Restaurant_Name, SCORE
FROM
    excel_project
ORDER BY SCORE DESC
LIMIT 1;
-- Conclusion: This query identifies the restaurant with the highest score and displays its name and score.
 
-- 9) Create a query to list all restaurants in the excel_project table that have received critical flags.
SELECT 
    Restaurant_Name, CRITICAL_FLAG
FROM
    excel_project
WHERE
    CRITICAL_FLAG = 'Critical';
-- Conclusion: This query retrieves a list of restaurants with a 'Critical' flag in the CRITICAL_FLAG column.

-- 10) Create a query to find all restaurants in the excel_project table with scores below 70.
SELECT 
    Restaurant_Name, SCORE
FROM
    excel_project
WHERE
    SCORE < 70;
-- Conclusion: This query retrieves a list of restaurants with scores lower than 70.

-- 11) Create a query to list all restaurants in the excel_project table that have received a specific grade. 
SELECT 
    *
FROM
    excel_project
WHERE
    GRADE = 'A';
-- Conclusion: This query retrieves all details from restaurants that have a specific grade (replace 'A' with the desired grade).

-- 12) Create a query to count the number of critical flags for each location in the excel_project table.
SELECT 
    Location, COUNT(CRITICAL_FLAG)
FROM
    excel_project
GROUP BY Location;
-- Conclusion: This query groups locations and counts the number of critical flags associated with each location.

-- 13) Create a query to find the distribution of grades among the restaurants in the excel_project table.
SELECT 
    GRADE, COUNT(Restaurant_Name)
FROM
    excel_project
GROUP BY GRADE;
-- Conclusion: This query groups restaurant grades and counts the number of restaurants for each grade.

-- 14) Create a query to calculate the percentage of inspections that received a critical flag in the excel_project table.
SELECT 
    INSPECTION_TYPE, COUNT(CRITICAL_FLAG) / 100 AS Percentage
FROM
    excel_project
GROUP BY INSPECTION_TYPE;
-- Conclusion: This query calculates the percentage of inspections with a critical flag for each inspection type.

-- 15) Create a query to calculate the average score for each location in the excel_project table.
SELECT 
    Location, AVG(SCORE)
FROM
    excel_project
GROUP BY Location;
-- Conclusion: This query groups locations and calculates the average score for inspections at each location.

-- 16) Create a query to calculate the average score for each grade in the excel_project table.
SELECT 
    GRADE, AVG(SCORE)
FROM
    excel_project
GROUP BY GRADE;
-- Conclusion: This query groups restaurant grades and calculates the average score for each grade.

-- 17) Create a query to list the top 10 restaurants with the highest average scores in the excel_project table.
SELECT 
    Restaurant_Name, SCORE
FROM
    excel_project
ORDER BY SCORE DESC
LIMIT 10;
-- Conclusion: This query retrieves the top 10 restaurants with the highest scores, ordered by score in descending order.

-- 18) Create a query to find the average score per inspection type for each location in the excel_project table.
SELECT 
    INSPECTION_TYPE, Location, AVG(SCORE)
FROM
    excel_project
GROUP BY INSPECTION_TYPE , Location;
-- Conclusion: This query groups inspections by location and type, then calculates the average score for each combination.

-- 19) Create a query to find the names of restaurants that have received an 'A' grade but also have not critical flag.
SELECT 
    Restaurant_Name, CRITICAL_FLAG, GRADE
FROM
    excel_project
WHERE
    GRADE = 'A'
        AND CRITICAL_FLAG = 'Not Critical';
-- Conclusion: This query retrieves names of restaurants with an 'A' grade and a 'Not Critical' flag in the CRITICAL_FLAG column.
