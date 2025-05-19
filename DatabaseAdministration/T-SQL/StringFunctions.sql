-- Declare sample strings
DECLARE @asciiStr  VARCHAR(20)  = '  hello world  ';
DECLARE @unicodeStr NVARCHAR(20) = N'?????';
DECLARE @maxVarchar VARCHAR(MAX) = REPLICATE('A', 20000);

-- 2. LEFT, RIGHT, SUBSTRING
SELECT 
  LEFT(@asciiStr, 2)          AS Left2,
  RIGHT(@asciiStr, 2)         AS Right2,
  SUBSTRING('Hello ammo',3,2) AS SubstrAmmo;

-- 3. LTRIM, RTRIM
SELECT
  LTRIM(@asciiStr)               AS LTrimmed,
  RTRIM(@asciiStr)               AS RTrimmed,
  LTRIM(RTRIM(@asciiStr))        AS Trimmed;

-- 4. REPLACE, UPPER, LOWER
SELECT
  REPLACE(@asciiStr, 'l', 'L') AS Replaced,
  UPPER(@asciiStr)             AS Uppered,
  LOWER(@asciiStr)             AS Lowered;

-- 5. REVERSE, SPACE
SELECT
  REVERSE(@asciiStr)        AS Reversed,
  SPACE(5) + 'Hello'        AS SpacedHello;

-- 6. ASCII, UNICODE
SELECT
  ASCII('A')        AS Ascii_A,
  UNICODE(N'?')     AS Unicode_Omega;
