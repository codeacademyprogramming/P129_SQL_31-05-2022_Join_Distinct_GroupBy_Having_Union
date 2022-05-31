Create Database P129ConstraintDb

Use P129ConstraintDb

Create Table Departments
(
	Id int Constraint PK_Departments_Id Primary Key Identity,
	Name nvarchar(50) Not Null Constraint UNQ_Departments_Name Unique Constraint CK_Departments_Name Check(Len(Name) > 2)
)

Truncate Table Employees

Create Table Employees
(
	Id int Constraint PK_Employees_Id Primary Key Identity,
	FullName nvarchar(100) Not Null Constraint CK_Employees_FullName Check(Len(FullName) > 3),
	Salary money Constraint CK_Employees_Salary Check(Salary > 0),
	Email nvarchar(255) Not Null Constraint UNQ_Employees_Email Unique,
	DepartmentId int Constraint FK_Departments_Employees_DepartmentId Foreign Key References Departments(Id)
)