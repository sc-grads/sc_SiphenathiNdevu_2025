SELECT TOP (1000) [BusinessEntityID]
      ,[RateChangeDate]
      ,[Rate]
      ,[PayFrequency]
      ,[ModifiedDate]
  FROM [AdventureWorks2022].[HumanResources].[EmployeePayHistory]

  -------------------------------

  select max(rate) from [AdventureWorks2022].[HumanResources].[EmployeePayHistory]

 --------------------------------
  select min(rate) from [AdventureWorks2022].[HumanResources].[EmployeePayHistory]

 -------------------------

  select count(rate) from [AdventureWorks2022].[HumanResources].[EmployeePayHistory]
 ---------------------------------------
  select count(rate) from [AdventureWorks2022].[HumanResources].[EmployeePayHistory]

  ------------------------------

  print upper('hehetgtAA')

  -------

   print lower('hehetgtAA')

   ------


   print convert(int,15.56)

   ------

   print getdate()

   -----
   print day(getdate())

  ------

  print month(getdate())


