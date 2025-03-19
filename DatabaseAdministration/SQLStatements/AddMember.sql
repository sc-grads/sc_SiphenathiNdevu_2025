  USE [AdventureWorks2022]
  GO
  ALTER ROLE [dbdev] ADD MEMBER [LABMSSQL\winuser01]
  GO
  USE [AdventureWorks2022]
  GO
  ALTER ROLE [dbdev] ADD MEMBER [sqluser01]
  GO
