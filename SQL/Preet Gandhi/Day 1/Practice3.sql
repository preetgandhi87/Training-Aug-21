USE rxweb_preetgandhi;

CREATE TABLE jobs 
(
	JobId int PRIMARY KEY IDENTITY(1,1),
	JobTitle varchar(20) NOT NULL DEFAULT '',
	MinSalary DECIMAL DEFAULT 8000,
	MaxSalary DECIMAL DEFAULT NULL
);

INSERT INTO jobs (JobTitle) VALUES ('Developer');
INSERT INTO jobs (MinSalaey) VALUES (25000);

SELECT * FROM jobs;
