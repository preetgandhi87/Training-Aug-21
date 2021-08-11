USE rxweb_preetgandhi;

CREATE TABLE employees 
(
	Employee_Id int PRIMARY KEY IDENTITY(1,1),
	FirstName varchar(10) NOT NULL,
	LastName varchar(10) NOT NULL,
	Email varchar(20) NOT NULL,
	PhoneNumber numeric(10) DEFAULT NULL,
	Hire_Date date NOT NULL,
	Job_Id int NOT NULL FOREIGN KEY REFERENCES jobs(JobId),
	Salary numeric(6) NOT NULL,
	Commission numeric(4) DEFAULT NULL,
	Manager_Id int DEFAULT NULL ,
	Department_Id int NOT NULL FOREIGN KEY REFERENCES department(department_id),
);
