CREATE TRIGGER tr_tblDepartment
    ON dbo.tblDepartment
	AFTER DELETE, INSERT, UPDATE
	AS
	BEGIN
	SET NOCOUNT ON
	END
SET NOCOUNT ON
select * from tblDepartment
SET NOCOUNT OFF