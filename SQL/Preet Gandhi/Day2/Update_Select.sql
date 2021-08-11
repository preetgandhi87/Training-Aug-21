#Update Queries

USE Day2_SQL;

ALTER TABLE Employees DROP CONSTRAINT ukEmail;
UPDATE Employees SET Email = 'not available';

UPDATE Employees SET Email = 'not available', CommissionPct = '0.10' ;

UPDATE Employees SET Email = 'NOT AVAILABLE' , CommissionPct = '0.10' WHERE DepartmentID = '110';

UPDATE Employees SET Email = 'Not Available' WHERE DepartmentID = '80' AND CommissionPct < 0.20;

UPDATE Employees SET Email = 'Not available' WHERE JobId LIKE '%ACCOUNT';

UPDATE Employees SET Salary = '8000' WHERE EmployeeID = '105' AND Salary < 5000;

UPDATE Employees SET JobId = 'SH_CLERK' WHERE EmployeeID = '118' AND DepartmentID = '30' AND JobId NOT LIKE 'SH%';

UPDATE Employees SET Salary += (Salary*0.25) WHERE DepartmentID = '40';
UPDATE Employees SET Salary += (Salary*0.15) WHERE DepartmentID = '90';
UPDATE Employees SET Salary += (Salary*0.10) WHERE DepartmentID = '110';


#Select Queries

USE Day2_SQL;

SELECT * FROM Employees;

SELECT FirstName,LastName FROM Employees;

SELECT FirstName AS 'EmployeeName' FROM Employees;
SELECT 'EmployeeName' = FirstName FROM Employees;

SELECT * FROM Employees WHERE FirstName = 'Neena' OR FirstName = 'Lex';

SELECT * FROM Employees WHERE NOT FirstName = 'Neena';

SELECT * FROM Employees WHERE Salary BETWEEN '5000' AND '8000';

SELECT FirstName, LastName, Salary, PF = Salary*0.12 FROM Employees;

SELECT FirstName FROM Employees WHERE FirstName LIKE 'N%';

SELECT DISTINCT DepartmentID FROM Employees;

SELECT * FROM Employees ORDER BY FirstName DESC;

SELECT EmployeeID,FirstName,LastName,Salary FROM Employees ORDER BY Salary ASC;

SELECT TOP 2 Salary FROM Employees;
