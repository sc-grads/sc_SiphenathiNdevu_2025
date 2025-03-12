CREATE TABLE [dbo].[salesstaff](
	[staffid] [int] NOT NULL PRIMARY KEY,
	[fName] [nvarchar](30) NULL,
	[lName] [nvarchar](30) NULL
	)


GO

-----------------------------------------------

INSERT INTO [dbo].[salesstaff] (STAFFID,FNAME,LNAME) VALUES (200,'Abbas','Mehmood')

------------------------------------------------------

INSERT INTO [dbo].[salesstaff] (STAFFID,FNAME,LNAME) VALUES (300,'Imran','Afzal'),(325,'John','Vick'),(314,'James','Dino')
