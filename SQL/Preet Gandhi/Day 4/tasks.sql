USE Day3_SQL;

--1--
SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],* FROM Employees
SELECT RANK() OVER(ORDER BY Salary DESC)[DRANK],* FROM Employees

--2--
SELECT Salary FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[RANKING],* FROM Employees)temp WHERE RANKING = 4

--3--
--SELECT DepartmentID,Salary FROM Employees ORDER BY DepartmentID ASC--
SELECT DepartmentID, SUM(Salary) AS SalaryPerDept FROM Employees GROUP BY DepartmentID

--4--
SELECT DepartmentID, SUM(Salary) AS SalaryPerDept FROM Employees GROUP BY DepartmentID ORDER BY SalaryPerDept DESC

--5--
SELECT DepartmentID, MAX(Salary) AS MaxPerDept FROM Employees GROUP BY DepartmentID ORDER BY MaxPerDept ASC

--6--
SELECT DepartmentID, MIN(Salary) AS MinPerDept FROM Employees GROUP BY DepartmentID ORDER BY MinPerDept ASC

--7--
SELECT DepartmentID, TotalSalary 
  FROM (SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)temp 
  WHERE TotalSalary > 50000 
  ORDER BY TotalSalary DESC

SELECT * FROM Employees
