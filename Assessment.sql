CREATE DATABASE Assessment_1;
USE Assessment_1;

CREATE TABLE Worker (
    WORKER_ID INT,
    FIRST_NAME VARCHAR(30),
    LAST_NAME VARCHAR(30),
    SALARY BIGINT,
    JOINING_DATE TEXT,
    DEPARTMENT VARCHAR(20)
);

INSERT INTO Worker(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
VALUES (01,'Monika','Arora',100000,'2/20/2014 9:00','HR'),
(02,'Niharika','Verma',80000,'6/11/2014 9:00','Admin'),
(03,'Vishal','Singhal',300000,'2/20/2014 9:00','HR'),
(04,'Amitabh','Singh',500000,'2/20/2014 9:00','Admin'),
(05,'Vivek','Bhati',500000,'6/11/2014 9:00','Admin'),
(06,'Vipul','Diwan',200000,'6/11/2014 9:00','Account'),
(07,'Satish','Kumar',75000,'1/20/2014 9:00','Account'),
(08,'Geetika','Chauhan',90000,'4/11/2014 9:00','Admin');

/* ***** 1st question ***** */
/* Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. */ 
SELECT 
    *
FROM
    Worker
ORDER BY FIRST_NAME ASC , DEPARTMENT DESC;

/* ***** 2nd question ***** */
/* Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. */
 SELECT 
    *
FROM
    Worker
WHERE
    FIRST_NAME IN ('Vipul' , 'Satish');
 
/* ***** 3rd question ***** */ 
/* Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. */
SELECT 
    *
FROM
    Worker
WHERE
    FIRST_NAME LIKE '_____h';

/* ***** 4th question ***** */ 
/* Write an SQL query to print details of the Workers whose SALARY lies between 100000 to 600000.*/
SELECT 
    *
FROM
    Worker
WHERE
    salary BETWEEN 100000 AND 600000;

/* ***** 5th question ***** */
/* Write an SQL query to fetch duplicate records having matching data in some fields of a table. */
SELECT 
    WORKER_ID,
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    JOINING_DATE,
    DEPARTMENT,
    COUNT(*)
FROM
    Worker
GROUP BY WORKER_ID , FIRST_NAME , LAST_NAME , SALARY , JOINING_DATE , DEPARTMENT
HAVING COUNT(*) > 1;

/* ***** 6th question ***** */
/*  Write an SQL query to show the top 6 records of a table. */
SELECT 
    *
FROM
    Worker
ORDER BY WORKER_ID
LIMIT 6;

/* ***** 7th question ***** */
/* Write an SQL query to fetch the departments that have less than five people in them. */
SELECT 
    DEPARTMENT, COUNT(*)
FROM
    Worker
GROUP BY DEPARTMENT
HAVING COUNT(*) < 5;

/* ***** 8th question ***** */
/*  Write an SQL query to show all departments along with the number of people in there. */
SELECT 
    DEPARTMENT, COUNT(*)
FROM
    Worker
GROUP BY DEPARTMENT;

/* ***** 9th question ***** */ 
/* Write an SQL query to print the name of employees having the highest salary in each department. */
SELECT 
    CONCAT(FIRST_NAME, ' ', LAST_NAME) AS Full_Name,
    DEPARTMENT,
    salary
FROM
    Worker
WHERE
    salary IN (SELECT 
            MAX(salary)
        FROM
            Worker
        GROUP BY DEPARTMENT);

/* 2nd Table */

CREATE TABLE student (
    STDID INT,
    STDName VARCHAR(50),
    Sex VARCHAR(15),
    Percentage INT,
    Class INT,
    Sec INT,
    Stream VARCHAR(20),
    DOB VARCHAR(30)
);

alter table student change Sec Sec varchar(10);
insert into student(STDID ,STDName , Sex ,Percentage ,Class ,Sec ,Stream ,DOB)
values (1001, 'Surekha Joshi','Female',82,12,'A','Science','3/8/1998'),
(1002, 'MAAHI AGRAWAL' ,'Female',56,11,'C','Commerce','11/23/2008'),
(1003, 'Sanam Verma'   ,'Male'  ,82,11,'C','Commerce','6/28/2006'),
(1004, 'Ronit Kumar'   ,'Male'  ,82,11,'C','Commerce','11/5/1997'),
(1005, 'Dipesh Pilkit' ,'Male'  ,82,11,'B','Science','14/9/2003'),
(1006, 'JAHANVI Puri'  ,'Female',82,11,'B','Commerce','11/7/2008'),
(1007, 'Sanam Kumar'   ,'Male'  ,82,12,'F','Commerce','3/8/1998'),
(1008, 'SAHIL MISHRA'  ,'Male'  ,82,11,'C','Commerce','11/7/2008'),
(1009, 'HARSH AGRAWAL' ,'Female',72,12,'B','Commerce','10/1/1996'),
(1010, 'STUTI MISHRA'  ,'Female',39,11,'F','Science','11/23/2008'),
(1011, 'HARSH AGARWAL' ,'Male'  ,42,11,'C','Science','3/8/1998'),
(1012, 'NIKUNJ AGARWAL','Male'  ,49,12,'C','Commerce','28/06/1998'),
(1013, 'AKRITI SAXENA' ,'Female',89,12,'A','Science','11/23/2008'),
(1014, 'TANI RASTOGI'  ,'Female',82,12,'A','Science','11/23/2008');

/* ***** 1st question ***** */
/*  To display all the records form STUDENT table. */ 
select 
    *
from
    student;

/* ***** 2nd question ***** */
/*  To display any name and date of birth from the table STUDENT.  */
select 
    STDName, DOB
from
    student;
 
/* ***** 3rd question ***** */ 
/* To display all students record where percentage is greater of equal to 80 FROM student table.  */
SELECT 
    *
FROM
    student
WHERE
    percentage >= 80;

/* ***** 4th question ***** */ 
/* To display student name, stream and percentage where percentage of student is more than 80*/
SELECT 
    StdName, Stream, Percentage
FROM
    student
WHERE
    percentage > 80; 

/* ***** 5th question ***** */
/* To display all records of science students whose percentage is more than 75 form student table.  */
SELECT 
    *
FROM
    student
WHERE
    Stream = 'Science' AND percentage > 75;