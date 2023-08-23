--���������, ��������, ������ ��������� 

IF OBJECT_ID('T1') IS NOT NULL 
DROP VIEW T1
GO 

CREATE VIEW T1 AS 
SELECT tmp1.Name, tmp1.Director, tmp2.Actor  
	FROM 
	(SELECT Repertoire.Name AS Name, Employee.Name AS Director 
		FROM Employee JOIN Artistic_direction ON Employee.Employee_ID=Artistic_direction.Person  
		JOIN Positions ON Employee.Position_ID = Positions.Position_ID
		JOIN Repertoire ON Artistic_direction.Performance_ID = Repertoire.Performance_ID
		WHERE Positions.Name = '��������') tmp1, 
	(SELECT Repertoire.Name AS Name, Employee.Name AS Actor 
		FROM Employee JOIN [Actors&Performers] ON Employee.Employee_ID = [Actors&Performers].Soloist_ID
		JOIN List_of_characters ON [Actors&Performers].Character_ID = List_of_characters.Character_ID
		JOIN Positions ON Employee.Position_ID = Positions.Position_ID
		JOIN Repertoire ON List_of_characters.Performance_ID = Repertoire.Performance_ID
		WHERE Positions.Name = '������') tmp2
		WHERE tmp1.Name = tmp2.Name 		
GO

--update T1 set Name = 'sdfvkvdjdvs' where T1.Director = '��������� ������� ������������';
--insert into T1 (Name, Director, Actor) values ('gfjjg', 'adfsg', 'fhjfgj');
--delete from T1 where T1.Actor = '������ �������� ���������';
  
 SELECT Name, Director, STRING_AGG (T1.Actor, ', ') AS Actor
 FROM T1
 GROUP BY Name, Director
 ORDER BY Name, Director
 GO