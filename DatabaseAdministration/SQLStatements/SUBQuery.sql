SELECT * FROM [HumanResources].[EmployeePayHistory]
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM [HumanResources].[EmployeePayHistory] WHERE Rate > 60)



SELECT * FROM [Employee]

----------------------------------------

SELECT *
  FROM [HumanResources].[EmployeePayHistory]
  WHERE [BusinessEntityID] IN (SELECT BusinessEntityID FROM [HumanResources].[EmployeePayHistory] WHERE Rate = 39.06)

  ---------------------------------------------

 select * from [Production].[Product]
 where ProductID in ( select ProductID from [Production].[ProductInventory] where Quantity > 300)
