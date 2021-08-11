USE rxweb_preetgandhi;

CREATE TABLE JobHistory
(
	EmployeeId int PRIMARY KEY IDENTITY(1,1),
	StartDate date not null,
	End_Date date CONSTRAINT chk_endDate CHECK(End_Date LIKE '--/--/----'),
	Job_Id int not null,
	Department_Id int not null
);

INSERT INTO JobHistory VALUES ('02/08/2021','03/08/2021',5,10);

SELECT * FROM JobHistory;
