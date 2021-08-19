--1--
SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary>(SELECT Salary FROM Employees WHERE LastName='Bull')

--2--
SELECT FirstName,LastName FROM Employees WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

--3--
SELECT FirstName,LastName FROM Employees WHERE ManagerID IN
(SELECT EmployeeID FROM Employees WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments WHERE LocationID IN 
(SELECT LocationID FROM Locations WHERE CountryID='US')))

--4--
SELECT FirstName,LastName FROM Employees WHERE EmployeeID IN (SELECT ManagerID FROM Employees)

--5--
SELECT FirstName,LastName,Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)

--6--
SELECT FirstName,LastName, Salary FROM Employees WHERE Salary = (SELECT MIN(Salary) FROM Employees)

--7--
SELECT FirstName,LastName,Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)
AND DepartmentID IN
(SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE 'IT%')

--8--
SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary >(SELECT Salary FROM Employees WHERE LastName = 'Bell')

--9--
SELECT FirstName,LastName,Salary FROM Employees 
WHERE SALARY IN (SELECT MIN(MinSalary) FROM 
(SELECT MIN(Salary) AS 'MinSalary'
FROM Employees WHERE DepartmentID IN 
(SELECT DepartmentID FROM Employees)
GROUP BY DepartmentID)temp)

--10--
SELECT FirstName,LastName,Salary FROM Employees 
WHERE SALARY > (SELECT AVG(AvgSalary) FROM 
(SELECT AVG(Salary)  AS 'AvgSalary'
FROM Employees WHERE DepartmentID IN 
(SELECT DepartmentID FROM Employees)
GROUP BY DepartmentID)temp)

--11--
SELECT FirstName,LastName ,Salary 
FROM Employees WHERE Salary >
ALL (SELECT Salary FROM Employees WHERE JobID = 'SH_CLERK') ORDER BY Salary ASC

--12--
SELECT FirstName,LastName FROM Employees WHERE EmployeeID <>
ALL(SELECT ManagerID FROM Employees)

--13--
SELECT emp.EmployeeID,emp.FirstName,emp.LastName,dep.DepartmentName FROM Employees AS emp 
INNER JOIN Departments AS dep ON emp.DepartmentID=dep.DepartmentID

--14--
SELECT EmployeeID,FirstName,LastName,Salary,DepartmentID FROM Employees AS emp WHERE Salary >
(SELECT AVG(Salary) FROM Employees WHERE DepartmentID=emp.DepartmentID)

--15--
SELECT * FROM
(SELECT ROW_NUMBER() OVER(ORDER BY EmployeeID ASC) [RNumber],* FROM Employees)temp
WHERE RNumber % 2 = 0

--16--
SELECT Salary FROM 
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp WHERE DRANK = 5

--17--
SELECT DISTINCT Salary FROM 
(SELECT DENSE_RANK() OVER(ORDER BY Salary ASC)[DRANK],Salary FROM Employees)temp WHERE DRANK = 4

--18--
SELECT TOP 10 * FROM 
(SELECT ROW_NUMBER() OVER(ORDER BY EmployeeID DESC)[RNumber],* FROM Employees )temp 
WHERE RNumber BETWEEN '1' AND '10'

--19--
SELECT DepartmentID,DepartmentName FROM Departments 
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees)

--20--
SELECT DISTINCT Salary 
FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp 
WHERE DRANK BETWEEN '1' AND '3'

--21--
SELECT DISTINCT Salary 
FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary ASC)[DRANK],Salary FROM Employees)temp 
WHERE DRANK BETWEEN '1' AND '3'

--22--
DECLARE @nth INT
SET @nth = 4
SELECT Salary FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp 
WHERE DRANK = @nth
