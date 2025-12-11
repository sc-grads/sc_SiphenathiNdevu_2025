--------------26
SELECT  
    d.SalesOrderID AS ordernumber,
    d.ProductID AS productid,
    d.OrderQty AS quantity,

    SUM(d.OrderQty) OVER (
        ORDER BY d.SalesOrderID, d.ProductID
    ) AS total,

    AVG(d.OrderQty * 1.0) OVER (
        ORDER BY d.SalesOrderID, d.ProductID
    ) AS avg,

    COUNT(*) OVER (
        ORDER BY d.SalesOrderID, d.ProductID
    ) AS count
FROM Sales.SalesOrderDetail AS d
JOIN Sales.SalesOrderHeader AS h ON d.SalesOrderID = h.SalesOrderID
WHERE d.SalesOrderID IN (43659, 43664) AND d.ProductID LIKE '71%'
ORDER BY d.SalesOrderID, d.ProductID;

--------------27
SELECT SalesOrderID, SUM(UnitPrice * OrderQty) AS orderidcost
FROM [Sales].[SalesOrderDetail]
GROUP BY SalesOrderID
HAVING SUM(UnitPrice * OrderQty) > 100000

--------------28
SELECT ProductID, Name
FROM [Production].[Product]
WHERE Name LIKE 'Lock Washer%'
ORDER BY ProductID ASC

--------------29
SELECT ProductID,COALESCE(Name, '') AS Name,COALESCE(Color, '') AS Color
FROM Production.Product
ORDER BY ListPrice ASC;

--------------30

SELECT BusinessEntityID, JobTitle, HireDate
FROM [HumanResources].[Employee]
ORDER BY Year(HireDate);

--------------31

SELECT  Lastname, Firstname
FROM [Person].[Person]
WHERE Lastname LIKE 'R%'
ORDER BY Firstname ASC, Lastname DESC

--------------32 (buya)
SELECT BusinessEntityID,
       SalariedFlag
FROM HumanResources.Employee
ORDER BY 
    SalariedFlag DESC,
    CASE 
        WHEN SalariedFlag = 1 THEN -BusinessEntityID
        ELSE BusinessEntityID                        
    END;

--------------33
SELECT p.BusinessEntityID,p.LastName,st.Name AS TerritoryName,cr.Name AS CountryRegionName
FROM Person.Person p
JOIN Sales.SalesPerson sp ON p.BusinessEntityID = sp.BusinessEntityID
JOIN Sales.SalesTerritory st ON sp.TerritoryID = st.TerritoryID
JOIN Person.CountryRegion cr ON st.CountryRegionCode = cr.CountryRegionCode
ORDER BY 
    CASE WHEN cr.Name = 'United States' THEN st.Name
         ELSE cr.Name
    END;

--------------34
SELECT 
    p.FirstName,
    p.LastName,
    ROW_NUMBER() OVER (ORDER BY a.PostalCode) AS [Row Number],
    RANK() OVER (ORDER BY a.PostalCode) AS [Rank],
    DENSE_RANK() OVER (ORDER BY a.PostalCode) AS [Dense Rank],
    NTILE(4) OVER (ORDER BY a.PostalCode) AS [Quartile],
    e.SalesYTD,
    a.PostalCode
FROM Sales.SalesPerson AS e
JOIN HumanResources.Employee AS hr ON e.BusinessEntityID = hr.BusinessEntityID
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
JOIN  Person.Address AS a ON e.BusinessEntityID = a.AddressID
WHERE e.TerritoryID IS NOT NULL AND e.SalesYTD <> 0
ORDER BY a.PostalCode;

--------------35
SELECT DepartmentID,Name,GroupName
FROM [HumanResources].[Department]
ORDER BY DepartmentID
OFFSET 10 ROWS;

--------------36
SELECT DepartmentID,Name,GroupName
FROM [HumanResources].[Department]
ORDER BY DepartmentID
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

--------------37
SELECT Name, Color, Listprice
FROM [Production].[Product]
WHERE Color = 'Red' OR Color = 'Blue'
ORDER BY Listprice

--------------38
SELECT p.Name AS ProductName, sod.SalesOrderID
FROM Production.Product p
FULL OUTER JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
ORDER BY ProductName ASC, sod.SalesOrderID DESC;

--------------39
SELECT p.Name AS ProductName, sod.SalesOrderID
FROM Production.Product p LEFT JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
ORDER BY p.Name;

--------------40
SELECT p.Name AS ProductName, sod.SalesOrderID
FROM Production.Product p
LEFT JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
ORDER BY p.Name;

--------------41
SELECT ISNULL(st.Name, '') AS TerritoryName, sp.BusinessEntityID
FROM Sales.SalesPerson sp
LEFT JOIN Sales.SalesTerritory st ON sp.TerritoryID = st.TerritoryID;

--------------42

SELECT p.FirstName,p.LastName,a.City
FROM HumanResources.Employee e
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID
ORDER BY p.LastName, p.FirstName;

--------------43
SELECT d.BusinessEntityID,d.FirstName,d.LastName
FROM 
    (
        SELECT 
            BusinessEntityID,
            FirstName,
            LastName,
            PersonType
        FROM 
            Person.Person
    ) AS d
WHERE 
    d.PersonType = 'IN'
    AND d.LastName = 'Adams'
ORDER BY 
    d.FirstName ASC;

--------------44
SELECT 
    BusinessEntityID,
    FirstName,
    LastName
FROM 
    Person.Person
WHERE 
    BusinessEntityID <= 1500
    AND LastName LIKE 'Al%'
    AND FirstName LIKE 'M%';

--------------44

SELECT 
    p.ProductID,
    p.Name,
    p.Color
FROM 
    Production.Product p
JOIN 
    (SELECT 'Blade' AS Name
     UNION ALL SELECT 'Crown Race'
     UNION ALL SELECT 'AWC Logo Cap') AS d
        ON p.Name = d.Name;

--------------45
SELECT 
    p.ProductID,
    p.Name,
    ISNULL(p.Color, '') AS Color
FROM 
    Production.Product p
JOIN 
    (VALUES 
        ('Blade'),
        ('Crown Race'),
        ('AWC Logo Cap')
    ) AS d(Name)
        ON p.Name = d.Name;

--------------46
SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, YEAR(OrderDate) AS SalesYear
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID, YEAR(OrderDate)
ORDER BY SalesPersonID, YEAR(OrderDate);

--------------47

SELECT 
    AVG(TotalSales) AS [Average Sales Per Person]
FROM 
    (
        SELECT 
            SalesPersonID,
            COUNT(SalesOrderID) AS TotalSales
        FROM 
            Sales.SalesOrderHeader
        WHERE 
            SalesPersonID IS NOT NULL
        GROUP BY 
            SalesPersonID
    ) AS SalesTotals;

--------------48

SELECT *
FROM Production.ProductPhoto
WHERE LargePhotoFileName LIKE '%green_%';

--------------49

SELECT 
    a.AddressLine1,
    a.AddressLine2,
    a.City,
    a.PostalCode,
    sp.CountryRegionCode
FROM 
    Person.Address a
JOIN 
    Person.StateProvince sp
        ON a.StateProvinceID = sp.StateProvinceID
JOIN 
    Person.BusinessEntityAddress bea
        ON a.AddressID = bea.AddressID
JOIN 
    Person.AddressType at
        ON bea.AddressTypeID = at.AddressTypeID
WHERE 
    sp.CountryRegionCode <> 'US'
    AND a.City LIKE 'Pa%'
    AND at.Name = 'Mailing';

--------------50

SELECT TOP 20 
    JobTitle,
    HireDate
FROM 
    HumanResources.Employee
ORDER BY 
    HireDate DESC;







