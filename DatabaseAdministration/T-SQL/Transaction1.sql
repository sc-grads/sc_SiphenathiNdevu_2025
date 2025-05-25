begin transaction 

select *
from [dbo].[tblEmployee]
update [dbo].[tblEmployee]
set EmployeeNumber = 122
where EmployeeNumber = 123

rollback tran 