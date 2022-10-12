USE ORG;

CREATE TABLE IT_Employee(
EID int,
EFName varchar(20),
ELName varchar(30),
ESAL int
);

select * from  IT_Employee

--SEQUENCE
create sequence ID as int start with 1 increment by 1
insert into IT_Employee values(NEXT VALUE FOR ID,'jan', 'lin',2500)
insert into IT_Employee values(NEXT VALUE FOR ID,'ami', 'S',6500)
insert into IT_Employee values(NEXT VALUE FOR ID,'Sai', 'lin',4500)
insert into IT_Employee values(NEXT VALUE FOR ID,'Rohan','lin',5500)

--INDEX
create Index IX_IT_Employee_ESAL
on IT_Employee (ESAL ASC)

--SYNONYM
CREATE SYNONYM IE for IT_Employee
select * from IE where EFName='jan'

select * from Worker
select * from Title
select * from Bonus


--simple views
create view dept
as
select * from Worker where DEPARTMENT ='HR'

select * from dept

insert into dept values(10,'Mike', 'John',2500, 2010-01-08, 'Trainee')

select * from Worker

--complex views
select w.worker_id,w.first_name,w.salary,w.DEPARTMENT,b.WORKER_TITLE
from Worker as w inner join Title as b on w.WORKER_ID=b.WORKER_REF_ID;

create view HEAD
as
select w.worker_id,w.first_name,w.salary,w.DEPARTMENT,b.WORKER_TITLE
from Worker as w inner join Title as b on w.WORKER_ID=b.WORKER_REF_ID;

select * from HEAD

--String functions
SELECT CONCAT('Lingutla', 'Jahnavi') as Concat; --concat

SELECT LEN('TIETO EVRY') as Length; --Length

SELECT SUBSTRING('.NET', 1, 3) AS substring; --substring

SELECT TRIM('    Tietoevry     ') AS TrimmedString;  --Remove leading and trailing spaces from a string

SELECT UPPER(' Trainee software Engineer') as ToUpper; --to upper case

SELECT REVERSE('Tietoevry Training')as Reverse; --reverse

SELECT REPLICATE('SQL Tutorial ', 4) as Replicate; --replicate 3 times

--MATH FUNCTIONS
SELECT ABS(-200) as AbsOutput

SELECT LOG10(1000) as Log10Output

SELECT POWER(2,10) as PowerOutput

SELECT SIN(2.5) as SinOutput

SELECT CEILING(3.986) as CeilingOutput

SELECT FLOOR(0.976) as FloorOutput

SELECT ROUND(8.7945,1) as RoundOutput

SELECT SQUARE(8) as SquareOutput

SELECT RADIANS(120) as Radian_Output

--DATE AND TIME FUNCTIONS


--print the only date of given value
SELECT DAY('2000-06-18 04:10:11') as Day_Output --as Month_Output, as Year_Output

--add the 2 year to the given year
SELECT DATEADD(year, 2, '2000/06/18') as DateAdd_Output

--Find the difference between the year
SELECT DATEDIFF(year, '2000/06/18', '2022/06/18') as DateDiff_Output

--Check if the enter date is valid or not
SELECT ISDATE('2022-10-07') as Valid_dateOutput --1
SELECT ISDATE('Invalid!') as Invalid_dateOutput --0

--Gives the specific part of date
SELECT DATEPART(MONTH, '2022/06/18') as DatePart_Output

--Gives the date from its part
SELECT DATEFROMPARTS(2000, 06, 18) as DateFrom_Output

--Gives the date and time of SQL server
SELECT SYSDATETIME() as SysDateTime_Output

--print the current date with time
SELECT CURRENT_TIMESTAMP as Current_Date_Time