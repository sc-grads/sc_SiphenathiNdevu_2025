DECLARE @chrMyCharacters as char(10)

set @chrMyCharacters = 'Hello'

select @chrMyCharacters as myString, len(@chrMyCharacters) as MyLength, DATALENGTH(@chrMyCharacters) as myDataLength