USE Day3_SQL;

--1--
SELECT FirstName, LEN(FirstName) AS FName_Length FROM Employees WHERE FirstName LIKE '[AJM]%' ORDER BY FirstName ASC;
SELECT FirstName, LEN(FirstName) AS FName_Length FROM Employees WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%' ORDER BY FirstName ASC;

--2--
SELECT FirstName,CONCAT('$',CAST(salary AS varchar(20)),REPLICATE(0,(10-LEN(Salary)))) AS 'SALARY'  FROM Employees;

--3--
SELECT FirstName,LastName,HireDate FROM Employees WHERE DATEPART(dd,HireDate) = 07 OR DATEPART(MM,HireDate) = 07;


--4--
SELECT LEN(FirstName) FROM Employees WHERE CHARINDEX('c',LastName)>2;

--5--
SELECT RIGHT(PhoneNumber,4) FROM Employees;

--6--
UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber,'124','999');

--7--
SELECT DATEDIFF(year, HireDate, GETDATE()) AS AGE FROM Employees;

--8--
SELECT HireDate FROM Employees WHERE DATENAME(weekday,HireDate) = 'Monday';

--9--
SELECT FirstName, HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30';

--10--
DECLARE @ZONE VARCHAR(2);
IF(DATENAME(hh,SYSDATETIME()) <12)
                SET @ZONE = 'AM';
            ELSE 
                SET @ZONE = 'PM';
PRINT CONCAT(DATENAME(hh,SYSDATETIME()),':',DATENAME(n,SYSDATETIME()),' ',@ZONE,' ',LEFT(DATENAME(MM,SYSDATETIME()),3),' ',DATENAME(dd,SYSDATETIME()),', ',DATENAME(YYYY,SYSDATETIME()));

--11--
SELECT FirstName, LastName FROM Employees WHERE DATEPART(mm,HireDate) = 07;

--12--
SELECT FirstName,HireDate, DATEDIFF(year, HireDate, GETDATE()) AS Field_EXP FROM Employees;

--13--
SELECT FirstName FROM Employees WHERE DATEPART(year,HireDate) = 1987;
