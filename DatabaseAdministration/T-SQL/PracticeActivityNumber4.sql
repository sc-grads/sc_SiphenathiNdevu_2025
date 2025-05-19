-- 1. Original integer division (truncates fractions)
SELECT
  system_type_id,
  column_id,
  system_type_id / column_id AS Calculation
FROM sys.all_columns;

-- 1.1 Force a decimal result (to preserve fractions)
SELECT
  system_type_id,
  column_id,
  system_type_id * 1.0 / column_id AS CalculationDecimal
FROM sys.all_columns;

-- 2. Round down fractions (FLOOR)
SELECT
  system_type_id,
  column_id,
  FLOOR(system_type_id * 1.0 / column_id) AS FloorValue
FROM sys.all_columns;

-- 3. Round up fractions (CEILING)
SELECT
  system_type_id,
  column_id,
  CEILING(system_type_id * 1.0 / column_id) AS CeilingValue
FROM sys.all_columns;

-- 4. Round to one decimal place (ROUND)
SELECT
  system_type_id,
  column_id,
  ROUND(system_type_id * 1.0 / column_id, 1) AS RoundedValue
FROM sys.all_columns;

-- 5. Safe conversion to TINYINT after multiplying by 2 (TRY_CONVERT)
SELECT
  system_type_id,
  column_id,
  TRY_CONVERT(TINYINT, system_type_id * 2) AS SafeTinyValue
FROM sys.all_columns;
