CREATE TABLE dbo.LeaveStaging
(
  Consultant        NVARCHAR(100)  NULL,  -- e.g. “Siphenathi”
  DateFrom          NVARCHAR(20)   NULL,  -- raw text “2025/05/08”
  DateTo            NVARCHAR(20)   NULL,  -- raw text “2025/05/09”
  LeaveType         NVARCHAR(50)   NULL,  -- “Annual Leave”, etc.
  NumberOfDays      NVARCHAR(20)   NULL,  -- raw text in Excel
  ApprovalObtained  NVARCHAR(10)   NULL,  -- “Yes” / “No”
  SickNote          NVARCHAR(10)   NULL,  -- maybe “Yes” / blank
  Comments          NVARCHAR(MAX)  NULL,  -- any free-form notes
  FileName          NVARCHAR(260)  NOT NULL,  -- source file
  InsertedAt        DATETIME       NOT NULL 
    CONSTRAINT DF_Stg_Leave_InsertedAt DEFAULT GETDATE()
);
GO
