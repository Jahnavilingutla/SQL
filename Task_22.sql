use ORG

--1. Scalar Function with 2 parameters - any concept
create function mul1(@a int,@b int)
returns int
as
begin
	return @a  *  @b
end

select dbo.mul1(2,4) as Result

--2. Procedure with OUTPUT parameter
SELECT * FROM Worker

--Creating Procedure for calculating number of employee in ADMIN department

create procedure sp_Totalcount(@total int OUTPUT)
as
Begin
	Select @total=count(WORKER_ID) from Worker
End

Declare @Result int
exec sp_Totalcount @Result OUTPUT --OUPUT is mandatory
Print @Result

select * from Worker

--3. Trigger to restrict DML access between 6:00PM to 10.00AM
select * from Bonus

create trigger dmlTrigger5
on bonus -- table name
FOR INSERT, UPDATE, DELETE
as
begin
	if ((DATEPART(HH,GETDATE())>17) or (DATEPART(HH,GETDATE())<10))
	BEGIN
		print 'You cannot perform DML into the Bonus table between 4:00AM to 5:00PM'
		Rollback transaction 
	END
end
--Restricting the access for DML operations 
update Bonus set BONUS_AMOUNT=4500 where WORKER_REF_ID=3
insert into Bonus values(8,5500,'15/09/2022')
delete from Bonus where WORKER_REF_ID=2



--4. Server-scope trigger to restrict DDL access
create trigger server_DDL
on ALL Server
For Create_Table,Alter_Table,Drop_Table
as
Begin
	Print 'You cannot perform DDL on any Database'
	Rollback Transaction
End

--Inside same database
create table trainee(
	tid int
)

--Change to another database
create database IT
use IT
create table demo2
(
TID int,
Salary int
)


--disable trigger
Disable trigger server_DDL on ALL SERVER



--5. Working of explicit transaction with Save transaction
BEGIN TRANSACTION
	insert into Worker values(28,'Anna','gilbert');
	update Worker set FIRST_NAME='Jan' where WORKER_ID=11;
	--SAVEPOINT
	SAVE TRANSACTION insertUpdate
	delete from Worker where WORKER_ID=24;
	ROLLBACK TRANSACTION insertUpdate
COMMIT TRANSACTION

select * from Worker

--6. Difference between throw and Raiserror in exception handling
create procedure DivideByZero
@num1 int,
@num2 int
as
BEGIN	
	Declare @Result int
	SET @Result = 0
	IF(@num2=0)
	BEGIN
		RAISERROR('Cannot Divide By Zero',16,127) --RaiseError
	END
	ELSE
	BEGIN
		SET @Result=@num1/@num2
		PRINT 'Value is:' + CAST(@Result as varchar)
	END
END

--execute a procedure
EXEC DivideByZero 10,0


create procedure DivideByZeroTryCatch
@num1 int,
@num2 int
as
BEGIN	
	Declare @Result int
	SET @Result = 0
	BEGIN TRY
		BEGIN
			IF(@num2=0)
			THROW 50001,'Cannot Divide By Zero',1 -- Throw
			SET @Result=@num1/@num2
			PRINT 'Value is:' + CAST(@Result as varchar)
		END
	END TRY
	BEGIN CATCH
		PRINT ERROR_NUMBER()
		PRINT ERROR_MESSAGE()
		PRINT ERROR_SEVERITY()
		PRINT ERROR_STATE()		
	END CATCH
END
--execute
execute DivideByZeroTryCatch 10,0