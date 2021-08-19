CREATE TABLE Employee
(
	Employee_ID INT PRIMARY KEY IDENTITY(1,1),
	First_Name VARCHAR(15) NOT NULL,
	Last_Name VARCHAR(15) NOT NULL,
	Salary MONEY NOT NULL,
	Joining_Date VARCHAR(25) NOT NULL,
	Depaerment VARCHAR(15) NOT NULL,
	Manager_ID INT 
)

CREATE TABLE Incentives
(
	Employee_Ref_ID INT CONSTRAINT chk_refId_incentive FOREIGN KEY (Employee_Ref_ID) REFERENCES Employee(Employee_ID),
	Incentive_Date VARCHAR(15),
	Incentive_Amount MONEY
)

INSERT INTO Employee VALUES
	('John','Abraham',1000000,'01-JAN-13 12.00.00 AM','Banking',NULL),
	('Michael','Clarke',800000,'01-JAN-13 12.00.00 AM', 'Insurance',1),
	('Roy','Thomas',700000,'01-FEB-13 12.00.00 AM','Banking',1),
	('Tom','Jose',600000,'01-FEB-13 12.00.00 AM','Insurance',2),
	('Jerry','Pinto',650000,'01-FEB-13 12.00.00 AM','Insurance',3),
	('Philip','Mathew',750000,'01-JAN-13 12.00.00 AM','Services',3),
	('TestName1','123',650000,'01-JAN-13 12.00.00 AM','Services',2),
	('TestName2','Lname%',600000,'01-FEB-13 12.00.00 AM','Insurance',2)

INSERT INTO Incentives VALUES
	(1,'01-FEB-13',5000),
	(2,'01-FEB-13',3000),
	(3,'01-FEB-13',4000)


ALTER TABLE Employee ALTER COLUMN Joining_Date DATETIME
ALTER TABLE Incentives ALTER COLUMN Incentive_Date DATETIME
UPDATE Employee SET Joining_Date=''
UPDATE Employee SET Joining_Date='01-FEB-13' WHERE Employee_ID=8

SELECT * FROM Employee
SELECT * FROM Incentives


--1--
SELECT DATEDIFF(dd,emp.Joining_Date , inc.Incentive_Date) 
	FROM Employee AS emp 
	INNER JOIN Incentives AS inc 
	ON emp.Employee_ID=inc.Employee_Ref_ID 
	
--2--
SELECT emp.First_Name,inc.Incentive_Amount 
	FROM Employee AS emp 
	INNER JOIN Incentives AS inc 
	ON emp.Employee_ID=inc.Employee_Ref_ID 
	WHERE inc.Incentive_Amount > 3000

--3--
SELECT emp.First_Name,inc.Incentive_Amount 
	FROM Employee AS emp 
	LEFT OUTER JOIN Incentives AS inc 
	ON emp.Employee_ID=inc.Employee_Ref_ID 

--4--
SELECT emp.First_Name AS 'emp-FirstName',
	   mgr.First_Name AS 'mgr-FirstName'
	   FROM Employee AS emp,
	   	Employee AS mgr
	   WHERE mgr.Employee_ID=emp.Manager_ID

--5--
SELECT emp.First_Name,ISNULL(inc.Incentive_Amount,0) 
	FROM Employee AS emp 
	LEFT OUTER JOIN Incentives AS inc 
	ON emp.Employee_ID=inc.Employee_Ref_ID
