-- TASK 46A BY JOHN MARYANN SOPURUCHI--
-- Recreating an end-to-end task from Youtube--

-- This project involes:
--1. Building a Database
--2. Developing SQL Query
--3. Connecting the tables to Power BI
--4. Repesenting the insights in a dashboard.

--let's create our tables and import values into them using binary path--

-- Creating employee's table--

CREATE TABLE Employees (employee_id int,
						first_name varchar,
						last_name varchar,
						email	text,
						job_title varchar,
						salary int,
						hire_date text,
						department_id int


);

-- Let's call out the details of the Employees table --

SELECT * FROM Employees

-- Creating Department table--

CREATE TABLE Departments (Department_ID int,
							Department_Name	varchar,
							Department_Budget int,	
							Head_of_Department varchar,
							Number_of_Employees	int,
							Department_Goals varchar,	
							Location varchar


);

-- Let's call out the details of the Department table

SELECT * FROM Departments

-- Creating Project_assignments table--

CREATE TABLE Project_assignments (assignment_id int,
									employee_id int,
									project_id int

);
-- Let's call out the details of the Project_assignments table

SELECT * FROM Project_assignments

-- Creating Completed project table--

CREATE TABLE Completed_project (project_id int,
								project_name	varchar,
								project_budget int,
								project_start_date text,
								project_end_date	text,
								department_id int


);

-- Let's call out the details of the Completed_project table

SELECT * FROM  Completed_project

-- Creating Head shots table--

CREATE TABLE Head_shots (Employee_ID int,
						  Head_Shot text


);

-- Let's call out the details of the Head_shots table

SELECT * FROM  Head_shots 

--Creating Upcoming Project table--

CREATE TABLE Upcoming_project (project_id int,
								project_name varchar,
								project_budget int,
								project_start_date text,
								project_end_date text,
								department_id	int,
								project_lead varchar


);

-- Let's call out the details of the Upcoming_project table

SELECT * FROM Upcoming_project

-- Creating Projrct table--

CREATE TABLE Projects (project_id int,
						project_name varchar,
						project_budget int,
						start_date text,
						end_date text,
						department_id int


);

-- Let's call out the details of the Projects table

SELECT * FROM Projects

--Let's create a new table called Project_Status table
--Using some selected columns from the Upcoming_project table and the Completed_project table, 
--to know the status of the projects.

CREATE TABLE Project_Status AS (
select project_id, project_name,project_budget
FROM Upcoming_project
UNION ALL
select project_id, project_name,project_budget
FROM Completed_project

);

-- Let's Call out the Project_Status table-

SELECT * FROM project_status

--To know the Status of the projects let's add a column called Status to the project_Status table

CREATE TABLE Project_Status2 AS (
SELECT project_id, project_name,project_budget, 'upcoming' As Status
FROM Upcoming_project
UNION ALL
SELECT project_id, project_name,project_budget, 'completed' As Status
FROM Completed_project

)

--Let's call out the project_status2 table

SELECT * FROM Project_Status2

--Creating the Main Query table--

-- When you view the Employees table, you will notice that we have only the department_id column and not the department column
-- This will make it difficult to know the department each employee belongs to.
-- Let's merge the Employees table, Department table, Project_assignment table, and Project_status2 table
-- Using the Join statement.

-- This table will contain comprehensive information about all employees, including the projects they work on in the organization.

CREATE TABLE MainQuery AS (
select E.employee_id, E.first_name, E.last_name, E.job_title, E.salary, 
D.department_name, D.department_budget, PA.project_id, P.Project_name, P.status
FROM Employees AS E
JOIN 
Departments AS D
ON E.department_id=D.department_id
JOIN
Project_assignments AS PA
ON PA.employee_id=E.employee_id
JOIN
Project_Status2 AS P
ON P.Project_id=PA.project_id

)

-- Let's call out the MainQuery Table--

SELECT * FROM MainQuery

-- Let's export all the tables created and load them to Power BI for visualization.

--Task By John Maryann Sopuruchi










