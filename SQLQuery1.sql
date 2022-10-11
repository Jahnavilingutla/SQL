CREATE DATABASE ORG;
USE ORG;

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001,'JAHNAVI', 'LINGUTLA', 40000, '2013-02-25 09:00:00', 'HR'),
(002,'SAI', 'LEKHYA', 5000, '2015-02-10 09:00:00', 'ADMIN'),
(003,'SAI', 'ROHAN', 25000, '2014-05-16 09:00:00', 'HR'),
(004,'SAI', 'RAHUL', 8000, '2016-12-20 09:00:00', 'ADMIN'),
(005,'AMITHA', 'S', 21000, '2015-08-29 09:00:00', 'ADMIN'),
( 006,'HEMALATHA', 'L', 20000, '2017-02-12 09:00:00', 'ACCOUNT'),
(007,'PRABHAKAR', 'L', 15000, '2018-03-23 09:00:00', 'ADMIN'),
(008,'DHARANI', 'C', 18000, '2014-05-02 09:00:00', 'ACCOUNT');

Select * from Worker;


CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
       ON DELETE CASCADE
);

INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '2015-04-20 09:00:00'),
(002, 3000, '2015-08-11 09:00:00'),
(003, 4000, '2015-04-20 09:00:00'),
(001, 4500, '2015-04-20 09:00:00'),
(002, 3500, '2015-08-11 09:00:00');

select * from Bonus;

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
       ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

select * from Title;

Q-1). Write an SQL query to fetch �FIRST_NAME� from Worker table
using the alias name as &lt;WORKER_NAME&gt

A)Select FIRST_NAME AS WORKER_NAME from Worker;

Q-2). Write an SQL query to fetch %FIRST_NAME% from Worker table in upper case.

A)Select upper(FIRST_NAME) from Worker;

Q-3). Write an SQL query to fetch unique values of DEPARTMENT from Workers table.

A)Select distinct DEPARTMENT from Worker;

Q-4.) Write an SQL query to print the first three characters of% FIRST_NAME from Worker table.

A)Select substring(FIRST_NAME,1,3) from Worker;

Q-5.) Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

A)Select distinct len(DEPARTMENT) from Worker;


Q-6. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

A)Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Worker;

Q-7.) Write an SQL query to print details for Workers with the first name as %Vipul% and %Satish% from Worker table.

A)Select * from Worker where FIRST_NAME in ('VIPUL','SATISH');

UPDATE Worker set FIRST_NAME='SATISH' where WORKER_ID=001;
UPDATE Worker set FIRST_NAME='VIPUL' where WORKER_ID=002;

Q-8.) Write an SQL query to print details of Workers with DEPARTMENT name as %Admin%.

A)Select * from Worker where DEPARTMENT like 'Admin%';

Q-9.) Write an SQL query to print details of the Workers whose FIRST_NAME ends with %a%.

A)Select * from Worker where FIRST_NAME like '%a';

Q-10.) Write an SQL query to print details of the Workers whose FIRST_NAME contains %a%.

A)Select * from Worker where FIRST_NAME like '%a%';

