Select sum(OrderTotal) from dbo.Orders
where OrderDate >= Dateadd(month, -1,getdate())
group by CustomerID