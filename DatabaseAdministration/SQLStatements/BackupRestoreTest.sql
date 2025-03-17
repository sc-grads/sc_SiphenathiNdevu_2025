CREATE TABLE SQLBackupRestorTest (
    ID INT NOT NULL PRIMARY KEY,
    loginname VARCHAR(100) NOT NULL,
    logindate DATETIME NOT NULL DEFAULT GETDATE()
);
GO

SELECT * FROM SQLBackupRestorTest;
GO

INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (1, 'test1');
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (2, 'test2');
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (3, 'test3');
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (4, 'test4');
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (5, 'test5');
GO

-- FULL Backup (Inserting 5 rows)
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (6, 'test6');
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (7, 'test7');
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (8, 'test8');
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (9, 'test9');
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (10, 'test10');
GO

-- Differential Backup (Inserting 3 more rows, total: 10 rows)
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (11, 'test11');
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (12, 'test12');
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (13, 'test13');
GO

-- Transaction Log Backup 1 (Inserting 4 more rows, total: 13 rows)
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (14, 'test14'); --Mar 17 2025  2:38PM
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (15, 'test15'); --Mar 17 2025  2:39PM
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (16, 'test16');  --Mar 17 2025  2:39PM
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (17, 'test17');  --Mar 17 2025  2:40PM
GO

-- FULL and Differential Backup Done

-- Transaction Log Backup 2 (Inserting 4 more rows, total: 17+ rows)
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (114, 'test114'); 
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (115, 'test115'); 
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (116, 'test116'); 
INSERT INTO SQLBackupRestorTest (ID, loginname) VALUES (117, 'test117');
GO

-- Print the current date/time
PRINT GETDATE();  
GO



