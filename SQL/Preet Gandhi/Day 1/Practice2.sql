USE Day1_SQL

CREATE TABLE JobHistory
(
	EmployeeId INT PRIMARY KEY IDENTITY(1,1),
	StartDate DATE NOT NULL,
	End_Date VARCHAR(10) CONSTRAINT chk_endDate CHECK(End_Date LIKE '__/__/____'),
	Job_Id int NOT NULL,
	Department_Id int NOT NULL
)

INSERT INTO JobHistory VALUES ('02/08/2021','03/08/2021',5,10)

SELECT * FROM JobHistory
