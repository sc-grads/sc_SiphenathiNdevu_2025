SELECT TOP (1000) 
     *
  FROM [BikeStores].[production].[products] p
  INNER JOIN [BikeStores].[production].[brands] b
  ON p.brand_id = b.brand_id