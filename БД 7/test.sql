use theatre

DROP LOGIN testlogin
DROP USER test
SELECT * FROM sys.dm_exec_sessions 
CREATE LOGIN [testlogin] 
	WITH PASSWORD = 'test',
	DEFAULT_DATABASE=[theatre];
CREATE USER test FOR LOGIN testlogin