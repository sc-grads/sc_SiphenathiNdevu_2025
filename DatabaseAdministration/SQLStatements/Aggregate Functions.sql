SELECT 
    SUM(list_price) as Sum,
	AVG(list_price) as Avg,
	MAX(list_price) as Max,
	MIN(list_price) as Min

	FROM [BikeStores].[sales].[order_items]
