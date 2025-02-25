Select OrderID, 
OrderDate,
OrderTotal,
CustomerName,
Phone
From dbo.Orders o
INNER Join dbo.Customers c on o.CustomerID = c.CustomerID