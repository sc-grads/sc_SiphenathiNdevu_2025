-- Version 1: SMALLINT supports up to 32,767
DECLARE @v SMALLINT = 20000;
SELECT @v AS Value;

-- Version 2: SMALLINT cannot hold 200,000 ? Arithmetic overflow
DECLARE @v SMALLINT = 200000;
SELECT @v AS Value;

-- Version 3: Change to INT (supports up to ~2 billion) so 200,000 works
DECLARE @v INT = 200000;
SELECT @v AS Value;

-- Version 4: Use TINYINT (max 255) and assign 20,000 ? Arithmetic overflow
DECLARE @v TINYINT = 20000;
SELECT @v AS Value;
