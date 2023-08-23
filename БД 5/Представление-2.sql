--пьеса, ее режиссер, количество ролей в этой пьесе, количество различных постановок

IF OBJECT_ID('T2') IS NOT NULL 
DROP VIEW T2
GO 


CREATE VIEW T2 AS
SELECT DISTINCT tmp1.Director, tmp1.Performance, quantity1, quantity2
	FROM 
		(SELECT Employee.Name AS Director, Repertoire.Performance_ID, Repertoire.Name AS Performance, COUNT(Playbill.Performance_ID) AS quantity1
			FROM Employee JOIN Artistic_direction ON Employee.Employee_ID = Artistic_direction.Person
			JOIN Positions ON Employee.Position_ID = Positions.Position_ID 
			JOIN Repertoire ON Artistic_direction.Performance_ID = Repertoire.Performance_ID
			JOIN Playbill ON Repertoire.Performance_ID = Playbill.Performance_ID
			WHERE Positions.Name = 'режиссер'
			GROUP BY Repertoire.Performance_ID, Repertoire.Name, Employee.Name) tmp1,
		(SELECT  Repertoire.Performance_ID, Repertoire.Name AS Performance, COUNT(DISTINCT List_of_characters.Name) AS quantity2
			FROM Repertoire JOIN Playbill ON Repertoire.Performance_ID = Playbill.Performance_ID
			JOIN List_of_characters ON Repertoire.Performance_ID = List_of_characters.Performance_ID
			GROUP BY Repertoire.Performance_ID, Repertoire.Name) tmp2
	WHERE tmp1.Performance=tmp2.Performance
GO


SELECT * 
 FROM T2
 ORDER BY Performance
 GO


 --выбрать 3 самых популярных постановки
SELECT TOP 3 Performance, Director, quantity1 AS Quantity 
	FROM T2
	ORDER BY quantity1 DESC