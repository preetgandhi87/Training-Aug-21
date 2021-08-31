USE Day3_SQL

--DERIVED TABLE and CTE Queries--

--1.Derived--
SELECT * FROM (SELECT RANK() OVER(ORDER BY Salary DESC)[RANK], Salary,FirstName,LastName FROM Employees)temp
--1.CTE--
WITH Salary_CTE (Ranking,Salary,FirstName,LastName)
AS (SELECT RANK() OVER(ORDER BY Salary DESC)[RANK], Salary,FirstName,LastName FROM Employees)
SELECT * FROM Salary_CTE

--2.Derived--
SELECT * FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp WHERE DRANK=4
--2.CTE--
WITH Salary_CTE(Ranking,Salary)
AS
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)
SELECT * FROM Salary_CTE WHERE Ranking=4

--3.Derived--
SELECT * FROM (SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)temp
--3.CTE--
WITH Department_CTE(DepartmentID,Dep_Wise_Salary)
AS
(SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM Department_CTE

--4.Derived--
SELECT * FROM 
(SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)temp  
ORDER BY TotalSalary DESC
--4.CTE--
WITH Department_CTE (DepartmentID,Dep_Wise_Salary)
AS
(SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM Department_CTE ORDER BY Dep_Wise_Salary DESC

--5.Derived--
SELECT * FROM 
(SELECT DepartmentId,MAX(Salary) AS MaxSalary  FROM Employees GROUP BY DepartmentId)temp
ORDER BY MaxSalary ASC
--5.CTE--
WITH Salary_CTE(DepartmentID, Dep_Wise_Max_Salary)
AS
(SELECT DepartmentId,MAX(Salary) AS MaxSalary FROM Employees GROUP BY DepartmentId)
SELECT * FROM Salary_CTE ORDER BY Dep_Wise_Max_Salary ASC

--6.Derived--
SELECT * FROM 
(SELECT DepartmentId,MIN(Salary) AS MinSalary  FROM Employees GROUP BY DepartmentId)temp
ORDER BY MinSalary ASC
--6.CTE--
WITH Salary_CTE(DepartmentID, Dep_Wise_Min_Salary)
AS
(SELECT DepartmentId,MIN(Salary) AS MinSalary  FROM Employees GROUP BY DepartmentId)
SELECT * FROM Salary_CTE ORDER BY Dep_Wise_Min_Salary ASC

--7.Derived--
SELECT * FROM 
(SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)temp
WHERE TotalSalary>50000 ORDER BY TotalSalary DESC
--7.CTE--
WITH Salary_CTE(DepartmentID,TotalSalary)
AS
(SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM Salary_CTE WHERE TotalSalary>50000 ORDER BY TotalSalary DESC  


-----------------------------------------------------------------------------------



USE Day5_SQL

--1.Derived--
SELECT * FROM
(SELECT emp.Joining_Date,inc.Incentive_Date , 
DATEDIFF(dd,emp.Joining_Date , inc.Incentive_Date) AS DayDifference 
FROM Employee AS emp 
INNER JOIN Incentives AS inc 
ON emp.Employee_ID=inc.Employee_Ref_ID)temp 
--1.CTE--
WITH CTE(JoiningDate,IncentiveDate,DayDifference)
AS
(SELECT emp.Joining_Date,inc.Incentive_Date , 
DATEDIFF(dd,emp.Joining_Date , inc.Incentive_Date) AS DateDifference 
FROM Employee AS emp 
INNER JOIN Incentives AS inc 
ON emp.Employee_ID=inc.Employee_Ref_ID)
SELECT * FROM CTE

--2.Derived--
SELECT * FROM 
(SELECT emp.First_Name,inc.Incentive_Amount 
FROM Employee AS emp 
INNER JOIN Incentives AS inc 
ON emp.Employee_ID=inc.Employee_Ref_Id
WHERE inc.Incentive_Amount > 3000)temp
--2.CTE--
WITH CTE (First_Name,Incentive_amount)
AS
(SELECT emp.First_Name,inc.Incentive_Amount 
FROM Employee AS emp 
INNER JOIN Incentives AS inc 
ON emp.Employee_ID=inc.Employee_Ref_Id
WHERE inc.Incentive_Amount > 3000)
SELECT * FROM CTE


--3.Derived--
SELECT * FROM 
(SELECT emp.First_Name,inc.Incentive_Amount FROM Employee AS emp 
LEFT OUTER JOIN Incentives AS inc ON emp.Employee_ID=inc.Employee_Ref_ID)temp 
--3.CTE--
WITH CTE(First_Name,Incentive_Amount)
AS
(SELECT emp.First_Name,inc.Incentive_Amount FROM Employee AS emp 
LEFT OUTER JOIN Incentives AS inc ON emp.Employee_ID=inc.Employee_Ref_ID)
SELECT * FROM CTE


--4.Derived--
SELECT * FROM
(SELECT emp.First_Name AS 'emp-FirstName',
	   mgr.First_Name AS 'mgr-FirstName'
	   FROM Employee AS emp,
	   Employee AS mgr
	   WHERE mgr.Employee_ID=emp.Manager_ID)temp
--4.CTE--
WITH CTE(Emp_First_Name,Mgr_First_Name)
AS
(SELECT emp.First_Name AS 'emp-FirstName',
	   mgr.First_Name AS 'mgr-FirstName'
	   FROM Employee AS emp,
	   Employee AS mgr
	   WHERE mgr.Employee_ID=emp.Manager_ID)
SELECT * FROM CTE


--5.Derived--
SELECT * FROM
(SELECT emp.First_Name ,ISNULL(inc.Incentive_Amount,0) AS 'inc-Incentive_Amount'
FROM Employee AS emp 
LEFT OUTER JOIN Incentives AS inc
ON emp.Employee_ID=inc.Employee_Ref_ID)temp
--5.CTE--
WITH CTE(emp_FirstName,inc_Incentive_Amount)
AS
(SELECT emp.First_Name ,ISNULL(inc.Incentive_Amount,0) AS 'inc-Incentive_Amount'
FROM Employee AS emp 
LEFT OUTER JOIN Incentives AS inc
ON emp.Employee_ID=inc.Employee_Ref_ID)
SELECT * FROM CTE

SELECT * FROM Employee
SELECT * FROM Incentives
