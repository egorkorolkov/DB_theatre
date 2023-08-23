
DROP LOGIN test
DROP USER test
SELECT * FROM sys.dm_exec_sessions 
CREATE LOGIN test WITH PASSWORD = 'test';
CREATE USER test FOR LOGIN test

--Проверим, к чему сейчас имеет доступ созданный пользователь

EXECUTE AS USER = 'test';

SELECT * FROM Employee; -- не может читать из таблицы

SELECT Repertoire.Name FROM Repertoire; 

UPDATE Repertoire 
	SET Name = 'qwerty' 
	WHERE Genre_ID = 1; --не может обновлять

INSERT INTO Genres(Genre_ID, Name) VALUES (1000, 'Опера'); --не может вставлять

DELETE FROM Genres 
	WHERE Genre_ID = 1 --не может удалять

REVERT

--Присвоить новому пользователю права SELECT, INSERT, UPDATE, DELETE в полном объеме на одну таблицу

GRANT INSERT, SELECT, UPDATE, DELETE ON Genres TO test;

EXECUTE AS USER = 'test';

SELECT * FROM Genres; --может читать

BEGIN TRAN
UPDATE Genres 
	SET Name = 'Опера'
	WHERE Genre_ID = 1; --может обновлять
ROLLBACK

INSERT INTO Genres(Genre_ID, Name) VALUES (1000, 'Опера'); --может вставлять

DELETE FROM Genres 
	WHERE Genre_ID = 1000 --может удалять

REVERT

--Для одной таблицы новому пользователю присвоим права SELECT и UPDATE только избранных столбцов.

GRANT SELECT, UPDATE ON Repertoire (Performance_ID, Name, Genre_ID) TO test;

EXECUTE AS USER = 'test';

SELECT * FROM Repertoire; --всё не может читать

SELECT Performance_ID, Name, Genre_ID FROM Repertoire; --выделенные мной столбцы может

UPDATE Repertoire 
	SET Type_ID = 1
	WHERE Genre_ID = 1; --нет доступа к столбцу Type_ID, поэтому не может обновить

BEGIN TRAN
UPDATE Repertoire
 	SET Name = 'qwerty' 
	WHERE Performance_ID = 1; --может обновлять
ROLLBACK

REVERT;

--Для одной таблицы новому пользователю присвоим только право SELECT.

GRANT SELECT ON Employee  TO test;

EXECUTE AS USER = 'test';

SELECT * FROM List_of_characters; --нет прав на эту таблицу, не читает

SELECT * FROM Employee; --может читать

UPDATE Employee 
	SET Name = 'abcd'
	WHERE Employee_ID =  2 --нет прав на обновление

REVERT;

--Присвоим новому пользователю право доступа (SELECT) к представлению, созданному в лабораторной работе №5.

GRANT SELECT ON T1 TO test;

EXECUTE AS USER = 'test';

SELECT * FROM T1;

REVERT;

--Создадим стандартную роль уровня базы данных.

EXECUTE sp_addrole 'testrole';

--Присвоим ей право доступа (UPDATE на некоторые столбцы) к представлению, созданному в лабораторной работе №5.

GRANT UPDATE ON T1 (Name, Director) TO testrole;
GRANT SELECT ON T1 TO testrole;

--Назначим новому пользователю созданную роль.

EXECUTE sp_addrolemember 'testrole', 'test';

--Проверим выполненные действия.

EXECUTE AS USER = 'test';

SELECT * FROM T1;

BEGIN TRAN
UPDATE T1 SET Name = 'qwerty' WHERE Director = 'Азаданова Людмила Владимировна';
ROLLBACK

REVERT;

--Завершим работу.

EXEC sp_droprolemember 'testrole', 'test';

EXEC sp_droprole 'testrole';

EXEC sp_dropuser 'test';

EXEC sp_droplogin 'test';




