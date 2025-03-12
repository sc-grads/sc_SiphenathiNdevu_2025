SELECT * FROM Person.Address Where PostalCode = '98011'

SELECT * FROM Person.Address Where PostalCode != '98011' 

SELECT count(*) FROM Person.Address Where PostalCode <> '98011'

SELECT * FROM Person.Address WHERE ModifiedDate <= '2012-11-08 00:00:00:00'

SELECT * FROM [Person].[Person] WHERE FirstName LIKE  '%ew'

SELECT * FROM [HumanResources].[EmployeePayHistory]

SELECT max(rate) FROM [HumanResources].[EmployeePayHistory]

SELECT max(rate) AS MaxPayrate FROM [HumanResources].[EmployeePayHistory]

SELECT min(rate) AS [Min Pay rate] FROM [HumanResources].[EmployeePayHistory]


SELECT * FROM [Production].[ProductCostHistory] WHERE startdate = '2013-05-30 00:00:00'


SELECT * FROM [Production].[ProductCostHistory] WHERE startdate = '2013-05-30 00:00:00' and StandardCost >= 200

SELECT * FROM [Production].[ProductCostHistory] WHERE( startdate = '2013-05-30 00:00:00' and StandardCost >= 200) or ProductID >800

SELECT * FROM [Production].[ProductCostHistory] WHERE( startdate = '2013-05-30 00:00:00' and StandardCost >= 200) and ProductID >800

SELECT * FROM [Production].[ProductCostHistory] WHERE ProductID in (802,803,820,900)

SELECT * FROM [Production].[ProductCostHistory] WHERE EndDate is null

SELECT * FROM [Production].[ProductCostHistory] WHERE EndDate is not null

-----------------------------------------
SELECT * FROM [HumanResources].[EmployeePayHistory] order by rate 

SELECT * FROM [HumanResources].[EmployeePayHistory] order by rate asc

SELECT * FROM [HumanResources].[EmployeePayHistory] order by rate desc


SELECT * FROM [HumanResources].[EmployeePayHistory] WHERE  ModifiedDate >= '2010-06-30 00:00:00' order by ModifiedDate desc

SELECT * FROM [HumanResources].[EmployeePayHistory] WHERE  year(ModifiedDate) >= '2014' order by ModifiedDate desc

SELECT * FROM [HumanResources].[EmployeePayHistory] WHERE month(ModifiedDate) = '06' order by ModifiedDate desc

---------------------------------------------

SELECT count(*),postalcode FROM Person.address group by PostalCode

SELECT count(*) as NoOfAddresses,postalcode FROM Person.address group by PostalCode

SELECT count(*) as NoOfAddresses,postalcode FROM Person.address group by PostalCode order by PostalCode

SELECT count(*),City FROM Person.address group by City

SELECT count(*),City,PostalCode FROM Person.address group by City,PostalCode
----------------------------------------------
SELECT * FROM Production.product

SELECT count(*) countofproduct,Color FROM Production.product where color = 'yellow' group by Color

SELECT count(*) countofproduct,Color FROM Production.product group by Color having Color = 'yellow'


SELECT count(*) countofproduct,Color,Size FROM Production.product group by Color,size having Size >= '44'
