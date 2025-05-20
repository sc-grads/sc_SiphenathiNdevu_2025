-- Declare a datetimeoffset value with +05:30 offset (e.g., India Standard Time)
declare @myDateOffset as datetimeoffset(2) = '2015-06-25 01:02:03.456 +05:30'
select @myDateOffset as MyDateOffset
go

-- Declare a regular datetime2 value and convert it to datetimeoffset
declare @myDate as datetime2 = '2015-06-25 01:02:03.456'
select TODATETIMEOFFSET(@myDate, '+05:30') as MyDateOffset

-- Use FROMPARTS functions to construct datetime2 and datetimeoffset values
select DATETIME2FROMPARTS(2015, 06, 25, 1, 2, 3, 456, 3)
select DATETIMEOFFSETFROMPARTS(2015, 06, 25, 1, 2, 3, 456, 5, 30, 3) as MyDateOffset

-- Current system time with offset vs UTC
select SYSDATETIMEOFFSET() as TimeNowWithOffset
select SYSUTCDATETIME() as TimeNowUTC

-- Switch the time zone offset (e.g., from +05:30 to -05:00, Texas time)
declare @myDateOffset as datetimeoffset = '2015-06-25 01:02:03.456 +05:30'
select SWITCHOFFSET(@myDateOffset, '-05:00') as MyDateOffsetTexas
