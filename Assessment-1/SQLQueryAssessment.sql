
-------------------------------------1
SELECT *
FROM [HumanResources].[Employee]
ORDER BY jobtitle ASC;

-------------------------------------2
SELECT e.*
FROM HumanResources.Employee AS e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
ORDER BY p.LastName ASC;
-------------------------------------3
SELECT firstName, lastName, businessentityid AS Employee_id
FROM [Person].[Person]
Order By lastName ASC;

-------------------------------------4
SELECT  productid, productnumber, name
FROM [Production].[Product]
WHERE SellStartDate IS NOT NULL AND ProductLine = 'T'
ORDER BY name ASC;

-------------------------------------5
SELECT  SalesOrderID, customerid, orderdate, subtotal, (TaxAmt / SubTotal) * 100 AS tax_percent
FROM [Sales].[SalesOrderHeader]
ORDER BY subtotal DESC

-------------------------------------6
SELECT Distinct JobTitle
FROM [HumanResources].[Employee]
ORDER BY [JobTitle] ASC;
--------------------------------------7

SELECT  customerid, SUM(Freight) AS total_freight
FROM [Sales].[SalesOrderHeader]
GROUP BY customerid
ORDER BY customerid ASC;

--------------------------------------8

SELECT  customerid, salespersonid, AVG(SubTotal) AS avg_subtotal, SUM(SubTotal) as sum_subtotal
FROM [Sales].[SalesOrderHeader]
GROUP By customerid, salespersonid
ORDER BY customerid DESC;

---------------------------------------9

SELECT productid, SUM(quantity) AS total_quantity
FROM [Production].[ProductInventory]
WHERE shelf = 'A' OR shelf = 'C' OR shelf = 'H'
GROUP BY productid
HAVING SUM(quantity) > 500
ORDER BY productid ASC;

----------------------------------------10.

SELECT SUM(quantity) * 10 AS total_quantity
FROM [Production].[ProductInventory]
GROUP BY locationID

----------------------------------------11
SELECT Person.BusinessEntityID, Person.FirstName, Person.LastName, PersonPhone.PhoneNumber
FROM [Person].[Person]
JOIN [Person].[PersonPhone] ON Person.BusinessEntityID = PersonPhone.BusinessEntityID
WHERE Person.LastName LIKE 'L%'
ORDER BY Person.LastName, Person.FirstName;

-----------------------------------------12
SELECT salespersonid, Customerid, sum(subtotal) AS sum_subtotal
FROM [Sales].[SalesOrderHeader]
WHERE salespersonid IS NOT NULL
GROUP BY ROLLUP (salespersonid, Customerid);

-----------------------------------------13
SELECT locationid, shelf, sum(quantity) AS totalquantity
FROM [Production].[ProductInventory]
GROUP BY ROLLUP (locationid, shelf)
ORDER BY locationid, shelf

-----------------------------------------14
SELECT locationid, shelf, SUM(quantity) AS totalquantity
FROM Production.ProductInventory
GROUP BY ROLLUP (locationid,shelf)
ORDER BY locationid,shelf;

-----------------------------------------15
SELECT  locationid, SUM(quantity) AS totalquantity
FROM [Production].[ProductInventory]
GROUP BY ROLLUP (locationid)
ORDER BY locationid;

-----------------------------------------16
SELECT city,COUNT(*) AS noofemployees 
FROM [Person].[Address]
GROUP BY city
ORDER BY city Asc
-----------------------------------------17
SELECT YEAR(orderdate) AS Year, sum(totaldue) AS orderAmount
FROM [Sales].[SalesOrderHeader]
GROUP BY YEAR(orderdate)
ORDER BY YEAR(orderdate);

-----------------------------------------18
SELECT YEAR(orderdate) AS yearoforderdate, SUM(totaldue) AS totaldueorder
FROM [Sales].[SalesOrderHeader]
WHERE YEAR(orderdate) <= 2016
GROUP BY YEAR(orderdate)
ORDER BY YEAR(orderdate)

-----------------------------------------19
SELECT contacttypeid, name
FROM [Person].[ContactType]
WHERE name LIKE '%Manager%'
--GROUP BY contacttypeid
ORDER BY contacttypeid DESC;

-----------------------------------------20
SELECT p.businessentityid, p.lastName, p.firstName
FROM [Person].[Person] as p
INNER JOIN [Person].[BusinessEntityContact] as pb ON p.[BusinessEntityID] = pb.[PersonID]  
INNER JOIN [Person].[ContactType] as pc ON pb.[ContactTypeID] = pc.[ContactTypeID]
WHERE pc.Name = 'Purchasing Manager'
-----------------------------------------21
SELECT ROW_NUMBER() OVER (
        PARTITION BY a.PostalCode 
        ORDER BY sp.SalesYTD DESC
    ) AS RowNum,
    p.LastName,
    sp.SalesYTD,
    a.PostalCode
FROM Sales.SalesPerson sp
INNER JOIN Person.Person p 
    ON sp.BusinessEntityID = p.BusinessEntityID
INNER JOIN Person.Address a
    ON p.BusinessEntityID = a.AddressID
INNER JOIN Sales.SalesTerritory st
    ON sp.TerritoryID = st.TerritoryID
WHERE 
    sp.SalesYTD <> 0
    AND a.PostalCode IS NOT NULL
ORDER BY 
    a.PostalCode ASC,
    sp.SalesYTD DESC;

-----------------------------------------22
SELECT ct.ContactTypeID, ct.Name AS ContactTypeName, COUNT(*) AS NoContacts 
FROM Person.ContactType AS ct
JOIN Person.BusinessEntityContact AS bec ON ct.ContactTypeID = bec.ContactTypeID
GROUP BY ct.ContactTypeID, ct.Name HAVING COUNT(*) >= 100
ORDER BY NoContacts DESC

-----------------------------------------23
SELECT CONVERT(date, eph.RateChangeDate) AS fromdate, p.LastName + ', ' + p.FirstName + COALESCE(' ' + LEFT(p.MiddleName, 1), '') AS nameinfull,
CAST(eph.Rate * 40 AS decimal(18,4)) AS salaryinaweek 
FROM HumanResources.EmployeePayHistory AS eph
INNER JOIN HumanResources.Employee AS e ON e.BusinessEntityID = eph.BusinessEntityID
INNER JOIN Person.Person AS p ON p.BusinessEntityID = e.BusinessEntityID
ORDER BY nameinfull ASC

-----------------------------------------24
SELECT CONVERT(date, eph.RateChangeDate) AS fromdate, p.LastName + ', ' + p.FirstName + COALESCE(' ' + LEFT(p.MiddleName, 1), '') AS nameinfull,
CAST(eph.Rate * 40 AS decimal(18,4)) AS salaryinaweek 
FROM HumanResources.EmployeePayHistory AS eph
INNER JOIN HumanResources.Employee AS e ON e.BusinessEntityID = eph.BusinessEntityID
INNER JOIN Person.Person AS p ON p.BusinessEntityID = e.BusinessEntityID
INNER JOIN (SELECT BusinessEntityID, MAX(RateChangeDate) AS LatestChange 
FROM HumanResources.EmployeePayHistory
GROUP BY BusinessEntityID
) AS latest ON latest.BusinessEntityID = eph.BusinessEntityID AND latest.LatestChange = eph.RateChangeDate
ORDER BY nameinfull ASC

-----------------------------------------25
SELECT d.SalesOrderID, d.ProductID, d.OrderQty, agg.TotalQty AS [Total Quantity], agg.AvgQty AS [Avg Quantity], agg.OrderCount AS [No of Orders],
agg.MinQty AS [Min Quantity], agg.MaxQty AS [Max Quantity] 
FROM Sales.SalesOrderDetail AS d
CROSS JOIN (SELECT SUM(d2.OrderQty) AS TotalQty, AVG(CAST(d2.OrderQty AS decimal(18,6))) AS AvgQty, COUNT(*) AS OrderCount, MIN(d2.OrderQty) AS MinQty,
MAX(d2.OrderQty) AS MaxQty 
FROM Sales.SalesOrderDetail AS d2
WHERE d2.SalesOrderID IN (43659, 43664)) AS agg
WHERE d.SalesOrderID IN (43659, 43664)
ORDER BY d.SalesOrderID, d.ProductID
