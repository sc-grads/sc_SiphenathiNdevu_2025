Select OrderID, 
OrderDate,
OrderTotal,
CustomerName,
Phone
From dbo.Orders o
left outer Join dbo.Customers c on o.CustomerID = c.CustomerID
Order by OrderTotal desc
