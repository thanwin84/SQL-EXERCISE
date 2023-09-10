-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT F_NAME AS WORKER_NAME FROM WORKER;
-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT ucase(F_NAME) FROM WORKER;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM WORKER;
-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT substring(F_NAME, 1, 3) FROM WORKER;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(F_NAME, 'B') FROM WORKER WHERE F_NAME = 'AMITABH';
-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(F_NAME) FROM WORKER;
-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(DEPARTMENT) FROM WORKER;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) FROM WORKER;
-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(F_NAME, 'a', 'A') FROM WORKER;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
SELECT CONCAT(F_NAME," ", L_NAME) AS COMPLETE_NAME FROM WORKER;
-- A space char should separate them.

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM WORKER ORDER BY F_NAME;
-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM WORKER ORDER BY F_NAME, DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE F_NAME IN ('VIPUL', 'SATISH');
-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE F_NAME NOT IN ('VIPUL', 'SATISH');
-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM WORKER WHERE DEPARTMENT = 'ADMIN';
-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM WORKER WHERE F_NAME LIKE '%A%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM WORKER WHERE F_NAME LIKE '%A';
-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM WORKER WHERE F_NAME LIKE '%H' AND LENGTH(F_NAME) = 6;
SELECT * FROM WORKER WHERE F_NAME LIKE '_____H';
-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;
-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT DEPARTMENT, COUNT(*) FROM WORKER WHERE DEPARTMENT = 'ADMIN';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT CONCAT(F_NAME, ' ', L_NAME) AS COMPLETE_NAME, SALARY FROM WORKER 
WHERE SALARY BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(WORKER_ID) FROM WORKER 
GROUP BY DEPARTMENT
ORDER BY COUNT(WORKER_ID);

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT W.WORKER_ID, W.F_NAME FROM WORKER AS W
INNER JOIN
TITLE AS T ON W.WORKER_ID = T.WORKER_REF_ID AND T.WORKER_TITLE = 'Manager';
SELECT W.WORKER_ID, W.F_NAME FROM WORKER AS W
INNER JOIN
TITLE AS T ON W.WORKER_ID = T.WORKER_REF_ID WHERE T.WORKER_TITLE = 'Manager';
-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT WORKER_TITLE, COUNT(*) AS NUMBER FROM TITLE GROUP BY WORKER_TITLE HAVING COUNT(*) > 1;
-- Q-26. Write an SQL query to show only odd rows from a table.
-- select * from worker where MOD (WORKER_ID, 2) != 0; 
SELECT * FROM WORKER WHERE MOD (WORKER_ID, 2) != 0;
SELECT * FROM WORKER WHERE MOD (WORKER_ID, 2) <> 0;

-- Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM WORKER WHERE MOD (WORKER_ID, 2) = 0;
-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE WORKER_CLONE LIKE WORKER;
INSERT INTO WORKER_CLONE SELECT * FROM WORKER;
SELECT * FROM WORKER_CLONE;
-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT W.* FROM WORKER AS W INNER JOIN WORKER_CLONE AS WC USING(WORKER_ID);
-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT W.* FROM WORKER AS W 
LEFT JOIN WORKER_CLONE AS WC USING(WORKER_ID) 
WHERE WC.WORKER_ID IS NULL;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
SELECT curdate();
SELECT NOW();
-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
-- USING LIMIT
-- SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 5;
--USING CORELATED SUBQUERY
SELECT DISTINCT SALARY FROM WORKER AS W
WHERE (
    SELECT COUNT(DISTINCT SALARY) FROM WORKER AS W2
    WHERE W2.SALARY >= W.SALARY
) <= 5 ORDER BY SALARY DESC;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT F_NAME, SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 4, 1;


SELECT * FROM WORKER ORDER BY SALARY;
-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.

 SELECT SALARY FROM WORKER AS W 
WHERE 5 = (
SELECT COUNT(DISTINCT W2.SALARY) FROM WORKER AS W2 WHERE W2.SALARY >= W.SALARY);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
-- USING SUBQUERY
SELECT * FROM WORKER WHERE SALARY IN (SELECT SALARY FROM WORKER GROUP BY SALARY HAVING COUNT(SALARY) > 1);
SELECT * FROM WORKER WHERE SALARY = (
     SELECT DISTINCT SALARY FROM WORKER GROUP BY SALARY HAVING COUNT(*) > 1
 );
-- USING INNER JOIN
SELECT * FROM WORKER W, WORKER W2 WHERE W.SALARY = W2.SALARY AND W.WORKER_ID != W2.WORKER_ID;
-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
-- using sub-query.
SELECT DISTINCT SALARY FROM WORKER WHERE SALARY = 
(SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 1, 1);

-- @BLOCK
-- USING CORERELATED SUBQUERY
SELECT DISTINCT SALARY FROM WORKER AS W WHERE 2 = (
    SELECT COUNT(DISTINCT SALARY) FROM WORKER AS W2 WHERE W.SALARY <= W2.SALARY
);
-- @BLOCK
SELECT MAX(SALARY) FROM WORKER WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM WORKER);


-- Q-37. Write an SQL query to show one row twice in results from a table.
SELECT * FROM WORKER
UNION ALL
SELECT * FROM WORKER;
-- Q-38. Write an SQL query to list worker_id who does not get bonus.
SELECT * FROM BONUS;
SELECT * FROM WORKER WHERE WORKER_ID NOT IN (SELECT WORKER_REF_ID FROM BONUS);
-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT COUNT(*) / 2 FROM WORKER);
-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT DEPARTMENT, COUNT(*) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(*) < 4;


-- Q-41. Write an SQL query to show all departments along with the number of people in there.

SELECT DEPARTMENT, COUNT(*) FROM WORKER GROUP BY DEPARTMENT;
-- Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM WORKER WHERE WORKER_ID IN (SELECT MAX(WORKER_ID) FROM WORKER);
SELECT * FROM WORKER WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM WORKER);

-- Q-43. Write an SQL query to fetch the first row of a table.

SELECT * FROM WORKER LIMIT 1;
SELECT * FROM WORKER WHERE WORKER_ID = (SELECT MIN(WORKER_ID) FROM WORKER);

-- Q-44. Write an SQL query to fetch the last five records from a table.

(SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID;
-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT W.F_NAME, W.SALARY, W.DEPARTMENT FROM 
(SELECT DEPARTMENT, MAX(SALARY) AS SALARY FROM WORKER GROUP BY DEPARTMENT) AS TEMP
INNER JOIN WORKER AS W ON W.DEPARTMENT = TEMP.DEPARTMENT AND W.SALARY = TEMP.SALARY;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
SELECT DISTINCT SALARY FROM WORKER AS W 
WHERE 3 >= (SELECT COUNT(DISTINCT SALARY) FROM WORKER AS W2 WHERE W.SALARY <= W2.SALARY) ORDER BY SALARY DESC;
SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 3;
-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery


-- Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT SALARY FROM WORKER AS W 
WHERE 3 = (SELECT COUNT(DISTINCT SALARY) FROM WORKER AS W2 WHERE W.SALARY <= W2.SALARY);
SELECT MIN(SALARY) FROM (SELECT DISTINCT SALARY FROM WORKER ORDER BY  SALARY DESC LIMIT 3) AS TEMP;
-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY FROM WORKER GROUP BY DEPARTMENT;
-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT F_NAME, L_NAME, SALARY FROM WORKER WHERE SALARY IN (SELECT MAX(SALARY) FROM WORKER);

CREATE TABLE PAIRS(
	A INT,
    B INT
);

INSERT INTO PAIRS(A, B) VALUES
(1, 2), (2, 4), (2, 1), (3, 2), (4, 2), (5, 6), (6, 5), (7, 8);
SELECT * FROM PAIRS;
-- FILTER REVERSED PAIR
-- USING JOINS
SELECT L.* FROM PAIRS AS L
LEFT JOIN
PAIRS AS R ON L.A = R.B AND L.B = R.A WHERE R.A IS NULL OR L.A < R.A;

-- USING CORELATED SUBQUERY
SELECT * FROM PAIRS AS L WHERE NOT EXISTS (SELECT * FROM PAIRS AS R WHERE L.A = R.B AND L.B = R.A AND L.A > R.A);
