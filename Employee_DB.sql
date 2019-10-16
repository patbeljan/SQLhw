

create table Departments(
	departmentID varchar(30) Primary Key,
	department_name varchar(30)
	);

create table Employees(
	Employee_no int Primary Key,
	birth_date date,
	first_name varchar(30),
	last_name varchar(30),
	gender varchar(1),
	hire_date date
	);

create table Department_Employee(
	Employee_no int,
	department_no varchar(30),
	from_date date,
	to_date date,
	Foreign Key(department_no) References Departments(departmentID),
	Foreign Key(Employee_no) References Employees(Employee_no)
	);
	
create table Department_Manager(
	department_no varchar(30),
	Employee_no int,
	from_date date,
	to_date date,
	Foreign key(department_no) References Departments(departmentID),
	Foreign Key(Employee_no) References Employees(Employee_no)
	);
	
create table Titles(
	Employee_no int Not Null,
	Title varchar(30) Not Null,
	from_date date Not Null,
	to_date date,
	Foreign Key (Employee_no) References Employees(Employee_no)
	);
	
create table Salaries(
	Employee_no int Not Null,
	Salary int Not Null,
	from_date date Not Null,
	to_date date,
	Foreign Key (Employee_no) References Employees(Employee_no)
	);
	
SELECT Employees.*, Salaries.Salary FROM EMPLOYEES INNER JOIN Salaries ON Employees.Employee_no = Salaries.Employee_no;

SELECT * From Employees WHERE hire_date >= '1/1/1986' AND hire_date <= '12/31/1986';

SELECT DM.department_no, D.department_name, DM.Employee_no, E.first_name, E.last_name, DM.from_date, DM.to_date
	FROM Department_Manager AS DM INNER JOIN Departments AS D ON DM.department_no = D.departmentID
	INNER JOIN Employees AS E ON DM.Employee_no = E.Employee_no;
	
SELECT DM.department_no, D.department_name, DM.Employee_no, E.first_name, E.last_name, DM.from_date, DM.to_date
	FROM Department_Manager AS DM, Departments AS D, Employees AS E
	WHERE DM.department_no = D.departmentID AND DM.Employee_no = E.Employee_no;
	
SELECT E.Employee_no, E.first_name, E.last_name, D.department_name
	From Employees AS E,  Departments As D, Department_Employee AS DE
	WHERE E.Employee_no = DE.Employee_no AND DE.department_no = D.departmentID;
	
SELECT * FROM Employees E
	WHERE E.first_name = 'Hercules' AND E.last_name LIKE 'B%';
	
SELECT E.Employee_no, E.last_name, E.First_name, D.department_name 
	From Employees As E, Departments As D, Department_Employee AS DE
	WHERE E.Employee_no = DE.Employee_no AND DE.department_no = D.departmentID AND D.department_name = 'Sales';

SELECT E.Employee_no, E.last_name, E.First_name, D.department_name 
	From Employees As E, Departments As D, Department_Employee AS DE
	WHERE E.Employee_no = DE.Employee_no AND DE.department_no = D.departmentID AND D.department_name = 'Sales' 
	OR E.Employee_no = DE.Employee_no AND DE.department_no = D.departmentID AnD D.department_name = 'Development';

 Select E.last_name, count(*)
 	From   Employees as E
 	Group By E.last_name
	Order By count DESC;
 
	
