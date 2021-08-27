USE Day1_SQL

CREATE TABLE employee
(
	EmpId INT PRIMARY KEY IDENTITY(1,1),
	EmpName VARCHAR(20) NOT NULL,
	Email VARCHAR(25) NOT NULL,
	EmpPhone NUMERIC(10) CONSTRAINT chk_phone CHECK ( EmpPhone LIKE '[6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') DEFAULT NULL,
	EmpSalary NUMERIC(7) NOT NULL,
	EmpAge INT
)


CREATE TABLE inventory
(
	ProId INT PRIMARY KEY IDENTITY(1,1),
	ProName VARCHAR(20) NOT NULL,
	ProPrice DECIMAL(8,2)
)

CREATE TABLE sales
(
	SaleId int PRIMARY KEY IDENTITY(1,1),
	SaleQuantity INT,
	Emp_Id INT CONSTRAINT chk_saleEmp REFERENCES employee(EmpId) ON UPDATE CASCADE,
	Pro_Id INT CONSTRAINT chk_SalePro REFERENCES inventory(ProId) ON UPDATE CASCADE,
	EmpCommision NUMERIC(5) DEFAULT NULL
)



INSERT INTO employee VALUES ('Dhaval', 'dhaval@gmail.com', 9375577497, 25000, 25), ('Jay', 'jay@gmail.com', 9463758497, 20000, 27)
SELECT * FROM employee

INSERT INTO inventory VALUES ('car',500000), ('bike',100000)
SELECT * FROM inventory;

INSERT INTO sales VALUES (1,7,1,2500), (2,8,2,2500)
SELECT * FROM sales
