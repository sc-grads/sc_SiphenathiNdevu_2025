-- 1. Simple concatenation with +
DECLARE @first as nvarchar(20)
DECLARE @middle as nvarchar(20)
DECLARE @last as nvarchar(20)

Set @first = 'Sarah'
Set @last = 'Milligan'

---select @first + '' ....
SELECT 
  @first
  + IIF(@middle IS NULL, '', ' ' + @middle)
  + ' ' + @last AS FullName;