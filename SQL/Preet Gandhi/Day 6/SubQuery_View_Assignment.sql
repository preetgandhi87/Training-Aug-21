USE Day6_SQL_View


--1--
SELECT * FROM Employee WHERE Employee_ID IN (SELECT Employee_Ref_ID FROM Incentives)

--2--
SELECT First_Name,Salary FROM Employee WHERE Salary >
(SELECT Salary FROM Employee WHERE First_Name='Roy')

--3--
CREATE VIEW Query_3
AS
SELECT e.First_Name,e.Last_Name,e.Salary, e.Joining_Date, i.Incentive_Date, i.Incentive_Amount 
FROM Employee AS e INNER JOIN Incentives AS i ON e.Employee_ID=i.Employee_Ref_ID
SELECT * FROM Query_3

--4--
CREATE VIEW Query_4
AS
SELECT e.First_Name,i.Incentive_Amount FROM Employee AS e 
INNER JOIN Incentives AS i ON e.Employee_ID=i.Employee_Ref_ID
WHERE i.Incentive_Amount>3000
SELECT * FROM Query_4

SELECT * FROM Employee
SELECT * FROM Incentives


------------------------------------------------------------------------

USE Day6_SQL_View

--1--
CREATE VIEW Que_1
AS
SELECT e.FirstName,e.LastName,e.JobId,e.DepartmentID,d.DepartmentName 
FROM Employees AS e INNER JOIN Departments AS d
ON e.DepartmentID=d.DepartmentID INNER JOIN Locations AS l
ON d.LocationID=l.LocationID WHERE l.City='London'
SELECT * FROM Que_1

--2--
CREATE VIEW Que_2
AS
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS Count
FROM   Departments AS d FULL OUTER JOIN 
Employees AS e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
SELECT * FROM Que_2

--3--
CREATE VIEW Que_3
AS
SELECT EmployeeID,JobID,DATEDIFF(dd,StartDate,EndDate) AS 'DateDifference' FROM JobHistory WHERE DepartmentID=90
SELECT * FROM  Que_3

--4--
CREATE VIEW Que_4
AS
SELECT e.FirstName,e.LastName,d.DepartmentName,l.City
FROM Departments AS d INNER JOIN Employees AS e
ON e.EmployeeID=d.ManagerID
INNER JOIN Locations AS l
ON d.LocationID=l.LocationID
SELECT * FROM Que_4

--5--
CREATE VIEW Que_5
AS
SELECT d.DepartmentName,e.FirstName,e.LastName,e.HireDate,e.Salary
FROM Departments As d INNER JOIN Employees As e
ON d.ManagerID=e.EmployeeID 
WHERE DATEDIFF(yy,e.HireDate,GETDATE())>15
SELECT * FROM Que_5


SELECT * FROM Countries
SELECT * FROM Departments
SELECT * FROM Employees
SELECT * FROM Locations
SELECT * FROM JobHistory