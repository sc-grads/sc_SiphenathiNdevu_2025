select CURRENT_TIMESTAMP as RightNow
select getdate() as RightNow
select SYSDATETIME() as RightNow
select dateadd(YEAR,1,'2025-05-19 15:25:01') as myYear
select datename(WEEKDAY, getdate()) as MyAnswer
select datepart(hour, '2025-05-19 15:25:01') as myHour
