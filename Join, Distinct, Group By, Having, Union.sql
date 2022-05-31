--Joins
--1. Inner Join (Join)
Select FullName, Salary, Email, Name From Departments Inner Join Employees On Employees.DepartmentId = Departments.Id
Select FullName, Salary, Email, Name From Employees Join Departments On Employees.DepartmentId = Departments.Id

--2. Right Outer Join (Right Join)
Select FullName, Salary, Email, Name From Departments Right Outer Join Employees On Employees.DepartmentId = Departments.Id
Select FullName, Salary, Email, Name From Employees Right Join Departments On Employees.DepartmentId = Departments.Id

--3. Left Outer Join (Left Join)
Select FullName, Salary, Email, Name From Employees Left Outer Join Departments On Employees.DepartmentId = Departments.Id
Select FullName, Salary, Email, Name From Departments Left Join Employees On Employees.DepartmentId = Departments.Id

--4. Full Outer Join (Full Join)
Select FullName, Salary, Email, Name From Departments Full Join Employees On Employees.DepartmentId = Departments.Id
Select FullName, Salary, Email, Name From Departments Full Outer Join Employees On Employees.DepartmentId = Departments.Id


Alter Table Departments
Add ParentId int Foreign Key References Departments(Id)

--5. Self Join
Select p.Name 'Ust', c.Name 'Alt' From Departments p
Left Join Departments c
On p.Id = c.ParentId

Create Table SalaryTypes
(
	Id	int primary key identity,
	Name nvarchar(50),
	Min money,
	Max money
)

--6. Non Equal Join
Select FullName, Email, d.Name,Salary,s.Name From Employees e
Join Departments d
On e.DepartmentId = d.Id
Join SalaryTypes s
On e.Salary Between s.Min And s.Max

--7. Cross Join
Create Table Products
(
	Id int primary key identity,
	Name nvarchar(50)
)

Create Table Sizes
(
	Id int primary key identity,
	Name nvarchar(50)
)

Select * From Products
cross join Sizes

----------------------------------------------------

Select Distinct DepartmentId, FullName, Salary, Email From Employees

Select COUNT(Distinct DepartmentId) From Employees

Select Distinct FullName From Employees
Select FullName, COUNT(FullName) From Employees Group By FullName Having COUNT(FullName) > 1

Select * From Employees Where Exists(Select * From Departments where ParentId = 10 And Id = Employees.DepartmentId)

Select Name From Departments
Union All
Select Name From SalaryTypes