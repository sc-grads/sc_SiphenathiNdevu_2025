Create table salesstaff
(
staffID int not null primary key,
firstname nvarchar(50) not null,
lastname nvarchar(50) not null,
countryregion nvarchar(50) not null
)

select * from salesstaff

insert into salesstaff
select businessentityid,firstname,lastname,countryregionname from sales.vsalesperson

delete salesstaff;

delete from salesstaff where countryregion = 'united states'

----------------
begin tran
delete from salesstaff where countryregion =  'united states'

rollback tran
------------------------------

begin tran
delete from salesstaff where countryregion =  'united states'

commit

------------------------

delete from salesstaff where staffid in (select [BusinessEntityID] from [Sales].[vSalesPerson] where SalesLastYear = 0)

-------------------------------------

delete salesstaff 
from  [Sales].[vSalesPerson] sp
inner join salesstaff ss
on sp.[BusinessEntityID] = ss.staffid
where sp.saleslastyear = 0