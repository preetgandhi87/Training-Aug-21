USE Additional_Practice
--Main Database--

--1--
SELECT CONCAT(FirstName, ' ',Lastname) AS 'Name', Salary FROM Employees 
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bull')

--2--
SELECT CONCAT(FirstName, ' ',Lastname) AS 'Name' FROM Employees WHERE DepartmentID =
(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

--3--
SELECT CONCAT(FirstName, ' ',Lastname) AS 'Name' FROM Employees WHERE ManagerID IN
(SELECT EmployeeID FROM Employees WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments WHERE LocationID IN
(SELECT LocationID FROM Locations WHERE CountryID = 'US')))

--4--
SELECT CONCAT(FirstName, ' ',Lastname) AS 'Name' FROM Employees 
WHERE EmployeeID IN (SELECT ManagerID FROM Employees)

--5--
SELECT CONCAT(FirstName, ' ',Lastname) AS 'Name',Salary FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees)

--6--
SELECT CONCAT(FirstName, ' ',Lastname) AS 'Name',Salary FROM Employees WHERE Salary =
(SELECT MIN(Salary) AS 'MinSalary' FROM Employees) 

--7--
SELECT CONCAT(FirstName, ' ',Lastname) AS 'Name',Salary FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees) AND DepartmentID 
IN (SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE 'IT%')

--8--
SELECT CONCAT(FirstName, ' ', LastName) AS 'Name', Salary FROM Employees 
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName='Bell')

--9--
SELECT CONCAT(FirstName, ' ', LastName) AS 'Name', Salary FROM Employees WHERE Salary =
(SELECT MIN(MinSalary) AS 'LowestSalary' 
FROM (SELECT MIN(Salary) AS 'MinSalary' FROM Employees GROUP BY DepartmentID)temp)

--10--
SELECT CONCAT(FirstName, ' ', LastName) AS 'Name', Salary FROM Employees WHERE Salary >
(SELECT AVG(AvgSalary) AS 'AvgSalary' 
FROM (SELECT AVG(Salary) AS 'AvgSalary' FROM Employees GROUP BY DepartmentID)temp)

--11--
SELECT CONCAT(FirstName, ' ', LastName) AS 'Name', Salary FROM Employees WHERE Salary > ALL
(SELECT Salary FROM Employees WHERE JobId  = 'SH_CLERK') ORDER BY Salary ASC

--12--
SELECT CONCAT(FirstName, ' ', LastName) AS 'Name' FROM Employees
WHERE EmployeeID NOT IN (SELECT ManagerID FROM Employees)

--13--
SELECT EmployeeID,FirstName,LastName,
(SELECT DepartmentName FROM Departments AS d WHERE d.DepartmentID=e.DepartmentID) AS 'DepartmentName'
FROM Employees AS e

--14--
SELECT EmployeeID,FirstName,LastName,Salary FROM Employees AS emp WHERE Salary >
(SELECT AVG(Salary) FROM Employees WHERE DepartmentID=emp.DepartmentID)

--15--
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY EmployeeID ASC)[RNUMBER], * FROM Employees)temp
WHERE RNUMBER % 2 = 0

--16--
SELECT * FROM 
(SELECT DENSE_RANK() OVER(ORDER  BY Salary ASC)[DRANK],Salary FROM Employees)temp
WHERE DRANK = 5

--17--
SELECT * FROM 
(SELECT DENSE_RANK() OVER(ORDER  BY Salary DESC)[DRANK],Salary FROM Employees)temp
WHERE DRANK = 4

--18--
SELECT TOP 10 * FROM
(SELECT ROW_NUMBER() OVER(ORDER BY EmployeeId DESC)[RNUMBER],* FROM Employees)temp

--19--
SELECT DepartmentID,DepartmentName FROM Departments 
WHERE DepartmentID NOT IN (SELECT DISTINCT DepartmentID FROM Employees)

--20--
SELECT DISTINCT Salary FROM
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp
WHERE DRANK BETWEEN 1 AND 3 

--21--
SELECT DISTINCT Salary FROM
(SELECT DENSE_RANK() OVER(ORDER BY Salary ASC)[DRANK],Salary FROM Employees)temp
WHERE DRANK BETWEEN 1 AND 3 

--22--
DECLARE @nth INT
SET @nth = 5
SELECT DISTINCT Salary FROM
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp
WHERE DRANK = @nth


SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations
SELECT * FROM Countries
