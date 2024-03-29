CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;
CREATE TABLE workers(
	WORKER_ID INT NOT NULL PRIMARY KEY auto_increment,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
INSERT INTO workers
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, "Monika", "Arora", 100000, '14-02-20 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00.','Admin'),
(003, 'Vishal', "Singhal", 300000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
(006, 'Vipu', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
(007,'Satish', 'kumar', 75000, '14-01-20 09.00.00', 'Account'),
(008, 'Geetika', 'Chaohan', 90000, '14-04-11 09.00.00', 'Admin');

SELECT * FROM workers;

CREATE TABLE bonus(
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONNUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
    REFERENCES workers(WORKER_ID)
    ON DELETE CASCADE
    );

INSERT INTO bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONNUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

CREATE TABLE Title(
		WOKRER_REF_ID INT,
        WORKER_TITLE CHAR(25),
        AFFECTED_FROM DATETIME,
        FOREIGN KEY (WOKRER_REF_ID)
        REFERENCES workers(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title
	(WOKRER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
	(001, 'Manager', '2016-02-20 00:00:00'),
    (002, 'Executive', '2016-06-11 00:00:00'),
    (008, 'Executive', '2016-06-11 00:00:00'),
    (005, 'Manger', '2016-06-11 00:00:00'),
    (004, 'Assist. Manager', '2016-06-11 00:00:00'),
    (007, 'Executive', '2016-06-11 00:00:00'),
    (006, 'Lead', '2016-06-11 00:00:00'),
    (003, 'Lead', '2016-06-11 00:00:00');

SELECT * FROM workers;
SELECT SALARY FROM workers;
SELECT FIRST_NAME, SALARY FROM workers;

SELECT 55 + 1;
SELECT NOW();
SELECT lcase('THAN WIN HLINE');
-- select worker whose salary is greater than 75k
SELECT * FROM workers WHERE SALARY > 75000;
SELECT * FROM workers WHERE DEPARTMENT = 'HR';

-- GET EMPLOYEE WHOSE SALARY IS 1LAKH TO 4LAKH
SELECT * FROM workers WHERE SALARY BETWEEN 100000 AND 400000;
-- reduce or statement
-- hr and admin
SELECT * FROM workers WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin';
-- better way to use is IN
SELECT FIRST_NAME, DEPARTMENT FROM workers WHERE DEPARTMENT IN ('HR', "Admin");

-- get workers who are not in hr and admin
SELECT * FROM workers where DEPARTMENT NOT IN ('HR', 'Admin');
SELECT * FROM workers;
-- using wildcard
SELECT * FROM workers WHERE FIRST_NAME LIKE '%ika';
SELECT * FROM workers WHERE FIRST_NAME LIKE '%ik_';

-- sort salary by ascending order
SELECT * FROM workers ORDER BY SALARY;
-- order salary by descending order
SELECT * FROM workers ORDER BY SALARY desc;
-- how many distinct deparment org have
SELECT DISTINCT DEPARTMENT FROM workers;

-- data grouping
-- get number of employees working in different department
-- GROUP BY
SELECT DEPARTMENT FROM workers GROUP BY DEPARTMENT;
-- IF WE DONT INCLUDE AGGREGATION FUNCTION, THIS STATEMENT WILL BE TREATED AS DISTINCT
SELECT DEPARTMENT, COUNT(*) FROM workers GROUP BY DEPARTMENT;
-- avg salary per department
SELECT DEPARTMENT, AVG(SALARY) FROM workers GROUP BY DEPARTMENT;
-- MIN SALARY OF EACH DEPARTMENT
SELECT DEPARTMENT, MIN(SALARY) FROM workers GROUP BY DEPARTMENT;
-- SUM EACH GROUP SALARY
SELECT DEPARTMENT, sum(SALARY) FROM workers GROUP BY DEPARTMENT;
-- GROUP BY DEPARTMENT -> COUNT -> GET ONLY THOSE DEPT HAVING WORKER MORE THAN 2
SELECT DEPARTMENT, COUNT(SALARY) FROM workers GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;
SELECT DISTINCT DEPARTMENT FROM workers;


CREATE DATABASE TEMP;
USE TEMP;

CREATE TABLE CUSTOMER ( 
	ID INT PRIMARY KEY,
    CNAME VARCHAR(255),
    ADDRESS VARCHAR(255),
    GENDER CHAR(2),
    CITY VARCHAR(255),
    PINCODE int
);

SELECT DISTINCT GENDER FROM CUSTOMER;

CREATE TABLE ORDER_DETAILS (
	ORDER_ID INT PRIMARY KEY,
    DELIVERY_DATE DATE,
    CUST_ID INT,
    FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(ID)
);

CREATE TABLE ACCOUNT (
	ID INT PRIMARY KEY,
    NAME VARCHAR(255) UNIQUE,
    BALANCE INT,
    CONSTRAINT ACC_BAL_CHECK CHECK( BALANCE > 10000)
);
INSERT INTO ACCOUNT(ID, NAME, BALANCE)
VALUES (02, "WINIIE", 2000000);
SELECT * FROM ACCOUNT;

DROP TABLE ACCOUNT;
CREATE TABLE ACCOUNT (
	ID INT PRIMARY KEY,
    NAME VARCHAR(255) UNIQUE,
    BALANCE INT NOT NULL DEFAULT 0
);
INSERT INTO ACCOUNT(ID, NAME)
VALUES (01, "WIN");
SELECT * FROM ACCOUNT;
-- DESCRIBE TABLE
DESC ACCOUNT;
-- ADD NEW COLUMN
ALTER TABLE ACCOUNT ADD INTEREST_RATE FLOAT NOT NULL DEFAULT 0;

-- MODIFY
ALTER TABLE ACCOUNT MODIFY INTEREST_RATE DOUBLE NOT NULL DEFAULT 0;

-- rename column 
-- rename INTEREST_RATE TO SAVING_INT
ALTER TABLE ACCOUNT CHANGE COLUMN INTEREST_RATE SAVING_INT FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN
ALTER TABLE ACCOUNT DROP COLUMN SAVING_INT;
-- RENAME THE TABLE
ALTER TABLE ACCOUNT RENAME TO ACCOUNT_DETAILS;

-- DML ( data manupulation language)
-- adding some customer datas
INSERT INTO CUSTOMER(ID, CNAME, ADDRESS, GENDER, CITY, PINCODE) VALUES
(1300, 'Than Win Hline', 'Goldighipar', 'M', "Cox's Bazar", 4700),
(1201, "WAN SHAY", "BAZARGHATA", "FM", "Khurushkuk", 4200),
(1208, "SEN SHAY", "RAMU", "FM", "Cox's Bazar", 141001),
(246, "Nelaabh Shukla", "Ashok Nagar", "M", "Jalandhar", 144003),
(301, "Rohan Arora", "Ludhiana H.O", "M", "Ludhiana", 141001);
-- another way to insert values
INSERT INTO CUSTOMER VALUES(102, "Winin Pin", "South Banasree", "FM", "Dhaka", 404040);
-- we can also insert few value if don't have all attribute's value
INSERT INTO CUSTOMER(ID, CNAME, GENDER) VALUES (109, "Mun Mun San", "M");
-- UPDATE

select * from customer;

-- update
UPDATE CUSTOMER SET ADDRESS = 'South Banasre', CITY = "DHAKA" WHERE ID = 109;
SET SQL_SAFE_UPDATES = 0;
UPDATE CUSTOMER SET CITY = 'Dhaka';
UPDATE CUSTOMER SET PINCODE = PINCODE + 2;

-- DELETE
DELETE FROM CUSTOMER WHERE ID = 1200;
-- WE CAN ALSO DELETE THE WHOLE TABLE, BUT WE NEED TO SET SQl_SAFE_UPDATES TO 0
DELETE FROM CUSTOMER;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDER_DETAILS;
INSERT INTO ORDER_DETAILS(ORDER_ID, DELIVERY_DATE, CUST_ID) VALUES
(008, '2022-03-10', 100);

DELETE FROM CUSTOMER WHERE ID = 301;

-- USING ON DELETE CASCADE 
CREATE DATABASE temp;
USE TEMP;
DROP DATABASE TEMP;
CREATE TABLE CUSTOMER ( 
	ID INT PRIMARY KEY,
    CNAME VARCHAR(255),
    ADDRESS VARCHAR(255),
    GENDER CHAR(2),
    CITY VARCHAR(255),
    PINCODE int
);

CREATE TABLE ORDER_DETAILS (
	ORDER_ID INT PRIMARY KEY,
    DELIVERY_DATE DATE,
    CUST_ID INT,
    FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(ID) ON DELETE CASCADE
);
INSERT INTO CUSTOMER(ID, CNAME, ADDRESS, GENDER, CITY, PINCODE) VALUES
(1300, 'Than Win Hline', 'Goldighipar', 'M', "Cox's Bazar", 4700),
(1200, "Sen Sen Won", "Tekpara", "FM", "Khurushkuk", 4200),
(1287, "Shayam Singh", "Ludhiana H.O", "M", "Ludhiana", 141001),
(301, "Rohan Arora", "Ludhiana H.O", "M", "Ludhiana", 141001);

INSERT INTO ORDER_DETAILS(ORDER_ID, DELIVERY_DATE, CUST_ID) VALUES
(008, '2022-03-10', 100),
(001, '2022-01-02', 102),
(002, '2022-01-02', 1300);

SELECT * FROM CUSTOMER;
SELECT * FROM ORDER_DETAILS;
DELETE FROM CUSTOMER WHERE ID = 1300;

-- USING ON DELETE SET NULL
DROP TABLE ORDER_DETAILS;
CREATE TABLE ORDER_DETAILS (
	ORDER_ID INT PRIMARY KEY,
    DELIVERY_DATE DATE,
    CUST_ID INT,
    FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(ID) ON DELETE SET NULL
);
INSERT INTO ORDER_DETAILS(ORDER_ID, DELIVERY_DATE, CUST_ID) VALUES
(007, '2022-03-10', 245);
DELETE FROM CUSTOMER WHERE ID = 301;
DELETE FROM ORDER_DETAILS WHERE ORDER_ID = 8;


-- using replace
SELECT * FROM CUSTOMER;
REPLACE INTO CUSTOMER (ID, CITY) VALUES(246, 'Dhaka'); 
REPLACE INTO CUSTOMER (ID, CNAME, PINCODE) VALUES (	100, 'Jeema Oo', 20201);
REPLACE INTO CUSTOMER SET ID = 102, CNAME = 'Bob Marley';
-- random exerceise 
SELECT CNAME FROM CUSTOMER ORDER BY CNAME;

select * from order_details;

CREATE DATABASE COMPANY;

USE COMPANY;

CREATE TABLE EMPLOYEE( 
	ID INT NOT NULL PRIMARY KEY,
    F_NAME VARCHAR(20),
    L_NAME VARCHAR(20),
    AGE INT,
    EMAIL_ID VARCHAR(320),
    PHONE_NO char(5),
    CITY VARCHAR(25)
);
select * from EMPLOYEE;
desc employee;
INSERT INTO EMPLOYEE(ID, F_NAME, L_NAME, AGE, EMAIL_ID, PHONE_NO, CITY) VALUES 
(10, 'Aman', 'Proto', 32, 'aman@gmail.com', '12345', 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '55231', 'Palam'),
(3, 'Rahul', 'Bd', 22, 'rahul@gmail.com', '55243', 'Kolkata'),
(4, 'Jatin', 'Helmet', 31, 'jatin@gmail.com', '65124', 'Rajpur'),
(5, 'Pk', 'Pandey', 21, 'pk@gmail.com', '76121', 'Jaipur' );

SELECT * FROM CLIENT;
CREATE TABLE CLIENT( 
	ID INT NOT NULL PRIMARY KEY,
    F_NAME VARCHAR(25),
    L_NAME VARCHAR(25),
    AGE int, 
    EMAIL_ID varchar(320),
	PHONE_NO varchar(10),
	CITY varchar(35),
    EMP_REF_ID int,
    FOREIGN KEY(EMP_REF_ID)
    references EMPLOYEE(Id)
);
DESC CLIENT;
INSERT INTO CLIENT(ID, F_NAME, L_NAME, AGE, EMAIL_ID, PHONE_NO, CITY, EMP_REF_ID) VALUES
(1, 'Mac', 'Rogers', 47, 'mac@gmail.com', '33121', 'kolkata', 3),
(2, 'Max', 'Porier', 27, 'peter@gmail.com', '12761', 'kolkata', 3),
(3, 'Peter','jain', 24, 'peter@gmail.com', '12812', 'dehli', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '62621', 'Hydrabad', 5),
(5, 'Pratap', 'singh', 36, 'p@gmail.com', '77767', 'Mumbai', 2);

select * from client;
CREATE TABLE PROJECT (
	ID INT NOT NULL PRIMARY KEY,
    EMP_REF_ID INT, 
	NAME varchar(25),
    START_DATE DATETIME,
    CLIENT_REF_ID INT,
    FOREIGN KEY(EMP_REF_ID)
    references EMPLOYEE(Id),
    FOREIGN KEY(CLIENT_REF_ID)
    references CLIENT(ID)
    );
    
SELECT * FROM EMPLOYEE;
SELECT * FROM CLIENT;
select * from project;
INSERT INTO PROJECT(ID, EMP_REF_ID, NAME, START_DATE, CLIENT_REF_ID) VALUES
(1, 1,  'A', '2021-04-21', 3),
(2, 2, 'B', '2021-03-12', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D','2021-04-27',  2),
(5, 5, 'E', '2021-05-01', 4);
-- inner join
-- enlist all the employee id's list along with project allocated to them
SELECT E.ID, E.F_NAME, E.L_NAME, P.ID, P.NAME FROM EMPLOYEE AS E
INNER JOIN PROJECT AS P ON E.ID = P.EMP_REF_ID;

-- if we want all columns
SELECT * FROM EMPLOYEE 
INNER JOIN PROJECT ON EMPLOYEE.ID = PROJECT.EMP_REF_ID;

-- fetch all employee id's and their contact details who have been working 
-- jaipur along with the clients names working in hydrabad
 SELECT E.ID, E.EMAIL_ID, E.PHONE_NO, C.F_NAME, C.L_NAME FROM EMPLOYEE AS E
 INNER JOIN CLIENT AS C ON E.ID = C.EMP_REF_ID WHERE E.CITY = 'Jaipur' AND
 C.CITY = 'Hydrabad';
 -- can we use inner join without using join?
 --  yes
 SELECT E.ID, E.EMAIL_ID, E.PHONE_NO, C.F_NAME, C.L_NAME FROM EMPLOYEE AS E, CLIENT AS C 
 WHERE E.ID = C.EMP_REF_ID AND E.CITY = 'Jaipur' AND
 C.CITY = 'Hydrabad';
 
-- left join
-- fect out each project allocated to each employee
SELECT * FROM EMPLOYEE AS E 
LEFT JOIN PROJECT AS P ON E.ID = P.EMP_REF_ID;

-- RIGHT JOIN
-- list out all the project along with the employee's name and their respective
-- allocated email id
SELECT P.ID, P.NAME, E.F_NAME, E.L_NAME FROM PROJECT AS P
RIGHT JOIN EMPLOYEE AS E ON P.EMP_REF_ID = E.ID;

-- CROSS JOIN
-- list out all the combinations of employee name and projects
SELECT E.F_NAME, P.NAME FROM EMPLOYEE AS E
CROSS JOIN PROJECT AS P;

-- USING SET OPERATIONS
CREATE TABLE DEPARTMANET_1 (
	EMP_ID INT NOT NULL PRIMARY KEY,
    NAME VARCHAR(25),
    ROLE VARCHAR(30)
);
CREATE TABLE DEPARTMANET_2 (
	EMP_ID INT NOT NULL PRIMARY KEY,
    NAME VARCHAR(25),
    ROLE VARCHAR(30)
);
ALTER TABLE DEPARTMANET_1 RENAME DEPARTMENT_1;
ALTER TABLE DEPARTMANET_2 RENAME DEPARTMENT_2;
 INSERT INTO DEPARTMENT_1(EMP_ID, NAME, ROLE) VALUES
 (1, 'A',  'engineer'),
 (2, 'B',  'salesman'),
 (3, 'C',  'manager'),
 (4, 'D',  'salesman'),
 (5, 'E',  'engineer');
 INSERT INTO DEPARTMENT_2(EMP_ID, NAME, ROLE) VALUES
 (3, 'C',  'manager'),
 (6, 'F',  'marketing'),
 (7, 'G',  'salesman');
 
 -- list out all the employess in the comapany
 SELECT * FROM DEPARTMENT_1
 UNION
 SELECT * FROM DEPARTMENT_2;
 -- list out all the employee in all department who works as salesman
SELECT * FROM DEPARTMENT_1 WHERE ROLE = 'salesman'
UNION
SELECT * FROM DEPARTMENT_2 WHERE ROLE = 'salesman';
 -- list out all the employee who work in all department
 SELECT DEPARTMENT_1.* FROM DEPARTMENT_1 
 INNER JOIN DEPARTMENT_2 USING(EMP_ID);
 
-- list out all the employee working in department_1 but not in department_2
SELECT DEPARTMENT_1.* FROM DEPARTMENT_1
LEFT JOIN DEPARTMENT_2 USING(EMP_ID) WHERE DEPARTMENT_2.EMP_ID IS NULL;

-- SUB QUERIES
--  WHER CLAUSE SAME TABLE
SELECT * FROM EMPLOYEE WHERE AGE IN(SELECT AGE FROM EMPLOYEE WHERE AGE > 30);

-- whre clause different table
SELECT * FROM PROJECT;
-- employee name who is working more than in 1 projects
SELECT * FROM EMPLOYEE WHERE ID IN (SELECT EMP_REF_ID FROM PROJECT GROUP BY EMP_REF_ID HAVING COUNT(EMP_REF_ID) > 1);
-- EPLAIN: first we filter emp_ref_id from project based on  count
-- then with this result we  filter employee 

-- single value subquery
-- employee details having age > avg(age)
SELECT * FROM EMPLOYEE WHERE AGE > (SELECT AVG(AGE) FROM EMPLOYEE);

-- from clause - derieved table
-- select max age person whose first name contains 'a'
SELECT MAX(AGE) FROM (SELECT * FROM EMPLOYEE WHERE F_NAME  LIKE '%A%') AS TEMP;

-- CREATING CUSTOMIZED VIEW SCHEMA 
-- IT WON'T CREATE A NEW TABLE
CREATE VIEW custom_employee AS SELECT F_NAME, L_NAME FROM EMPLOYEE;

-- viewing the view
SELECT * FROM custom_employee;

-- alter view
alter VIEW custom_employee AS SELECT F_NAME, L_NAME, ID FROM EMPLOYEE;
