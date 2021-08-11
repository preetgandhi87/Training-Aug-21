USE rxweb_preetgandhi;


CREATE TABLE countries 
(
	CountryId int PRIMARY KEY IDENTITY(1,1),
	CountryName varchar(20) NOT NULL CONSTRAINT coun_name CHECK (CountryName IN ('Italy','India','China')),
	RegionId int NOT NULL
);

INSERT INTO countries VALUES ('India',10);
INSERT INTO countries VALUES ('Italy',20), ('China',30);

SELECT * FROM countries;
