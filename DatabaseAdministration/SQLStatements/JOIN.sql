Select OrderID, 
OrderDate,
OrderTotal,
CustomerName,
Phone
From dbo.Orders o
Join dbo.Customers c on o.CustomerID = c.CustomerID