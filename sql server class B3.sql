create database students;

create table classB3(
id int,
name varchar(255),
email varchar(255),
password varchar(255),
phone varchar(11),
age int,
primary key (id)
);

select * from classB3;
insert into classB3(id, name, email, password, phone, age) values (4, 'ehtisham', 'ehtisham@gmail.com', 'ehtisham123', '42347865434', 20);
alter table classB3 add designation varchar(30);
update classB3 set designation

create table students_tbl(
id int not null unique identity,
name varchar(255) not null,
email varchar(255) unique,
age varchar(255) not null
);


INSERT INTO students_tbl (name, email, age)
VALUES 
    ('Alice Johnson', 'alice.johnson@example.com', 23),
    ('Charlie Brown', 'charlie.brown@example.com', 24),
    ('David Miller', 'david.miller@example.com', 22),
    ('Eva Williams', 'eva.williams@example.com', 21),
    ('Frank White', 'frank.white@example.com', 25),
    ('Grace Davis', 'grace.davis@example.com', 20),
    ('Henry Wilson', 'henry.wilson@example.com', 23),
    ('Ivy Taylor', 'ivy.taylor@example.com', 24),
    ('Jack Martin', 'jack.martin@example.com', 22),
    ('Kelly Anderson', 'kelly.anderson@example.com', 21),
    ('Liam Moore', 'liam.moore@example.com', 25),
    ('Mia Jackson', 'mia.jackson@example.com', 20),
    ('Noah Thomas', 'noah.thomas@example.com', 23),
    ('Olivia Clark', 'olivia.clark@example.com', 24),
    ('Paula Garcia', 'paula.garcia@example.com', 22),
    ('Quinn Davis', 'quinn.davis@example.com', 21),
    ('Ryan Johnson', 'ryan.johnson@example.com', 25),
    ('Sophia Wilson', 'sophia.wilson@example.com', 20),
    ('Tyler Smith', 'tyler.smith@example.com', 23),
    ('Uma Brown', 'uma.brown@example.com', 24);

select * from students_tbl;

create table employee(
id int not null unique identity(100,2),
fname varchar(255) not null,
lname varchar(255) not null,
email varchar(255) unique,
designation varchar(255),
gender varchar(255),
age varchar(255) not null,
salary int, 
Dept int
);
create view vw_std 
as
select fname, lname, designation from employee;

select * from vw_std;

update employee  set fname = 'sufiyan' where id = 106;

INSERT INTO employee (fname, lname, email, designation, gender, age, salary, Dept)
VALUES
    ('Alice', 'Johnson', 'alice.johnson@example.com', 'Manager', 'Female', 32, 75000, 1),
    ('Bob', 'Williams', 'bob.williams@example.com', 'Engineer', 'Male', 28, 65000, 1),
    ('Charlie', 'Davis', 'charlie.davis@example.com', 'Analyst', 'Male', 35, 70000, 1),
    ('Diana', 'Miller', 'diana.miller@example.com', 'Coordinator', 'Female', 27, 60000, 3),
    ('Edward', 'Lee', 'edward.lee@example.com', 'Designer', 'Male', 29, 62000, 3),
    ('Fiona', 'Clark', 'fiona.clark@example.com', 'Developer', 'Female', 31, 68000, 3),
    ('George', 'Taylor', 'george.taylor@example.com', 'Manager', 'Male', 33, 80000,2),
    ('Hannah', 'Moore', 'hannah.moore@example.com', 'Analyst', 'Female', 26, 58000,2),
    ('Ian', 'Johnson', 'ian.johnson@example.com', 'Engineer', 'Male', 30, 67000,3),
    ('Jessica', 'Smith', 'jessica.smith@example.com', 'Coordinator', 'Female', 34, 72000,1);

select * from employee;

select gender,sum(salary) as total_salary from employee group by (gender) with rollup;
select designation,sum(salary) as Total_Salary from employee group by (designation) with rollup;
select gender,designation,sum(salary) as Total_Salary from employee group by designation,gender with rollup;


-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

select * from Departments;


create login ebad with password = 'ebad';
create login affan with password = 'affan';

-- create user affan for login employee;
CREATE USER affan FOR LOGIN affan;  
GO

grant select, update, insert on dbo.employee to affan;

select * from employee;
update employee set fname = 'talha' where id = 102;
INSERT INTO employee (fname, lname, email, designation, gender, age, salary)
VALUES
    ('moiz', 'khan', 'moiz.johnson@example.com', 'clerk', 'Male', 23, 75000);
	delete from employee where id = 118;

	-- user creation as ebad

create user ebad for login ebad;

grant select, update on dbo.employee to ebad;
delete from employee;

create login talha with password = 'talha';
create user talha for login talha;

grant select, update on dbo.students_tbl to talha;
deny delete on dbo.students_tbl to talha;

revoke update on dbo.students_tbl from talha;

delete from students_tbl where id = 2;

-- functions in SQL 

-- scalar functions
-- table-valued functions

select FLOOR(4.4);


-- scalar Functions without parameters
create function fullName()
returns varchar(255)
begin

return 'Ebad Uddin'

end

select dbo.fullName() as FullName;

-- scalar Functions with parameters

create function addition(@num1 as int, @num2 as int)
returns int
begin

return (@num1 + @num2)

end

select dbo.addition(2, 4) as addition;

-- function with variable

create function student(@age as int)
returns varchar(255)
as
begin
declare @str varchar(100)

if (@age >= 15)
begin
set @str = 'you can take admission in aptech'
end
else
begin
set @str = 'bary hoky ao'
end
return @str

end

select dbo.student(20)

-- table valued function

create function emp()
returns table
as
return select * from employee

select * from emp()

create function maleEmp(@gender as varchar(20))
returns table
as
return select * from employee where gender = @gender

select * from maleEmp('male')

alter function maleEmp()
returns table
as
return select distinct designation from employee 

select * from maleEmp()


-- stored procedure
select * from employee;

create procedure SPtableEmp
as
begin
select * from employee
end
go

exec SPtableEmp

create procedure spMaleEmp
as
begin
select fname, lname, designation, gender from employee where gender = 'Male'
end
go
exec spMaleEmp;

create procedure SpEmpwithID
@id int
as
begin
select * from employee where id = @id
end

exec SpEmpwithID @id = 2120

select * from employee

select * from Departments

select * from employee where id = (select id from employee where Salary > 70000)


select * from employee where Dept = (select DepartmentID from Departments where DepartmentName = 'IT')

create table HR_Emp(
id int,
name varchar(255),
designation varchar(255),
gender varchar(40)
);
select * from HR_Emp

insert into HR_Emp (id, name, designation, gender) 
select id,fname, designation, gender  from employee where Dept = (select DepartmentID from Departments where DepartmentName = 'HR')


select * from employee where id = ANY (select id from employee where Salary > 72000)



-- Triggers

create trigger Tr_insert_emp on employee
for insert
as
begin
print 'someone trying to access your table'
end

create trigger Tr_insert_employee on employee
after insert
as
begin
select * from inserted

end

-- Update trigger
create trigger Tr_update_employee on employee
after update
as
begin
select * from inserted
select * from deleted

end


-- inserting value in emp

INSERT INTO employee (fname, lname, email, designation, gender, age, salary, Dept)
VALUES
    ('ali', 'hassan', 'ali.ali@example.com', 'Student', 'Male', 21, 255, 1)

select * from inserted
update employee set fname = 'affan' where id = 102

-- creating audit table for insert trigger

--creating audit table
create table insert_trigger_details(
id int primary key identity,
auditInfo varchar(60)
)


alter trigger tr_insert_audit on employee
after insert
as 
begin
declare @id int, @name varchar(50)

select @id = id, @name = fname from inserted

insert into insert_trigger_details values ('user with id  ' + CAST(@id as varchar(50)) + '  with name ' + @name + '  is inserted in the table')
end
select * from insert_trigger_details





























