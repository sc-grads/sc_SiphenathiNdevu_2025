USE TimesheetDB;
GO

CREATE TABLE dbo.AuditLog
(
  AuditID       INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  PackageName   NVARCHAR(100)   NOT NULL,  -- the SSIS package name
  RunStart      DATETIME        NOT NULL,  -- when the package began
  RunEnd        DATETIME        NULL,      -- when it finished
  Status        NVARCHAR(20)    NULL,      -- e.g. 'Success','Failure'
  RowsLoaded    INT             NULL,      -- how many rows inserted
  ErrorCount    INT             NULL,      -- number of logged errors
  Messages      NVARCHAR(MAX)   NULL       -- any summary or comments
);
GO
