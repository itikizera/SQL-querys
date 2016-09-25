USE DADOSADV;
GO
-- Truncate the log by changing the database recovery model to SIMPLE.
ALTER DATABASE DADOSADV
SET RECOVERY SIMPLE;
GO
-- Shrink the truncated log file to 1 MB.
DBCC SHRINKFILE (DADOSADV_LOG, 1);  -- here 2 is the file ID for trasaction log file,you can also mention the log file name (dbname_log)
GO
-- Reset the database recovery model.
ALTER DATABASE DADOSADV
SET RECOVERY FULL;
GO

----------------------

USE dbaudit_trail;
GO
-- Truncate the log by changing the database recovery model to SIMPLE.
ALTER DATABASE dbaudit_trail SET RECOVERY SIMPLE;
GO
-- Shrink the truncated log file to 1 MB.
DBCC SHRINKFILE (dbaudit_trail_LOG, 1);  -- here 2 is the file ID for trasaction log file,you can also mention the log file name (dbname_log)
GO
-- Reset the database recovery model.
ALTER DATABASE dbaudit_trail
SET RECOVERY FULL;
GO