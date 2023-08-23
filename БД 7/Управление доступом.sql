
DROP LOGIN test
DROP USER test
SELECT * FROM sys.dm_exec_sessions 
CREATE LOGIN test WITH PASSWORD = 'test';
CREATE USER test FOR LOGIN test

--��������, � ���� ������ ����� ������ ��������� ������������

EXECUTE AS USER = 'test';

SELECT * FROM Employee; -- �� ����� ������ �� �������

SELECT Repertoire.Name FROM Repertoire; 

UPDATE Repertoire 
	SET Name = 'qwerty' 
	WHERE Genre_ID = 1; --�� ����� ���������

INSERT INTO Genres(Genre_ID, Name) VALUES (1000, '�����'); --�� ����� ���������

DELETE FROM Genres 
	WHERE Genre_ID = 1 --�� ����� �������

REVERT

--��������� ������ ������������ ����� SELECT, INSERT, UPDATE, DELETE � ������ ������ �� ���� �������

GRANT INSERT, SELECT, UPDATE, DELETE ON Genres TO test;

EXECUTE AS USER = 'test';

SELECT * FROM Genres; --����� ������

BEGIN TRAN
UPDATE Genres 
	SET Name = '�����'
	WHERE Genre_ID = 1; --����� ���������
ROLLBACK

INSERT INTO Genres(Genre_ID, Name) VALUES (1000, '�����'); --����� ���������

DELETE FROM Genres 
	WHERE Genre_ID = 1000 --����� �������

REVERT

--��� ����� ������� ������ ������������ �������� ����� SELECT � UPDATE ������ ��������� ��������.

GRANT SELECT, UPDATE ON Repertoire (Performance_ID, Name, Genre_ID) TO test;

EXECUTE AS USER = 'test';

SELECT * FROM Repertoire; --�� �� ����� ������

SELECT Performance_ID, Name, Genre_ID FROM Repertoire; --���������� ���� ������� �����

UPDATE Repertoire 
	SET Type_ID = 1
	WHERE Genre_ID = 1; --��� ������� � ������� Type_ID, ������� �� ����� ��������

BEGIN TRAN
UPDATE Repertoire
 	SET Name = 'qwerty' 
	WHERE Performance_ID = 1; --����� ���������
ROLLBACK

REVERT;

--��� ����� ������� ������ ������������ �������� ������ ����� SELECT.

GRANT SELECT ON Employee  TO test;

EXECUTE AS USER = 'test';

SELECT * FROM List_of_characters; --��� ���� �� ��� �������, �� ������

SELECT * FROM Employee; --����� ������

UPDATE Employee 
	SET Name = 'abcd'
	WHERE Employee_ID =  2 --��� ���� �� ����������

REVERT;

--�������� ������ ������������ ����� ������� (SELECT) � �������������, ���������� � ������������ ������ �5.

GRANT SELECT ON T1 TO test;

EXECUTE AS USER = 'test';

SELECT * FROM T1;

REVERT;

--�������� ����������� ���� ������ ���� ������.

EXECUTE sp_addrole 'testrole';

--�������� �� ����� ������� (UPDATE �� ��������� �������) � �������������, ���������� � ������������ ������ �5.

GRANT UPDATE ON T1 (Name, Director) TO testrole;
GRANT SELECT ON T1 TO testrole;

--�������� ������ ������������ ��������� ����.

EXECUTE sp_addrolemember 'testrole', 'test';

--�������� ����������� ��������.

EXECUTE AS USER = 'test';

SELECT * FROM T1;

BEGIN TRAN
UPDATE T1 SET Name = 'qwerty' WHERE Director = '��������� ������� ������������';
ROLLBACK

REVERT;

--�������� ������.

EXEC sp_droprolemember 'testrole', 'test';

EXEC sp_droprole 'testrole';

EXEC sp_dropuser 'test';

EXEC sp_droplogin 'test';




