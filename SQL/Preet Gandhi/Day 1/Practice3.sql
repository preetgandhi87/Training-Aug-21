USE Day1_SQL

CREATE TABLE jobs 
(
	JobId INT PRIMARY KEY IDENTITY(1,1),
	JobTitle VARCHAR(20) NOT NULL DEFAULT '',
	MinSalary DECIMAL DEFAULT 8000,
	MaxSalary DECIMAL DEFAULT NULL
)

INSERT INTO jobs (JobTitle) VALUES ('Developer')
INSERT INTO jobs (MinSalary) VALUES (25000)

SELECT * FROM jobs
