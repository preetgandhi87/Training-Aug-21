CREATE TABLE countries 
(
	CountryId INT PRIMARY KEY IDENTITY(1,1),
	CountryName VARCHAR(20) NOT NULL CONSTRAINT coun_name CHECK (CountryName IN ('Italy','India','China')),
	RegionId INT NOT NULL
)

INSERT INTO countries VALUES ('India',10);
INSERT INTO countries VALUES ('Italy',20), ('China',30)

SELECT * FROM countries
