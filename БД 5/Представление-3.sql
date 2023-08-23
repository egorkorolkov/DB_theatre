--роль, количество актеров, исполняющих эту роль, пол исполнителей ролей

IF OBJECT_ID('T3') IS NOT NULL 
DROP VIEW T3
GO 

CREATE VIEW T3 AS
SELECT tmp1.Name, quantity, Gender
	FROM (SELECT DISTINCT List_of_characters.Name AS Name, COUNT(List_of_characters.Name) AS quantity
			FROM Employee JOIN [Actors&Performers] ON Employee.Employee_ID = [Actors&Performers].Soloist_ID
			JOIN List_of_characters ON List_of_characters.Character_ID=[Actors&Performers].Character_ID	
			JOIN Positions ON Employee.Position_ID=Positions.Position_ID
			WHERE Positions.Name = 'солист'
			GROUP BY List_of_characters.Name) tmp1,
		(SELECT DISTINCT List_of_characters.Name AS Name, Employee.Gender
			FROM Employee JOIN [Actors&Performers] ON Employee.Employee_ID=[Actors&Performers].Soloist_ID
			JOIN List_of_characters ON List_of_characters.Character_ID=[Actors&Performers].Character_ID) tmp2
	WHERE tmp1.Name=tmp2.Name

GO


SELECT DISTINCT * 
	FROM T3
	ORDER BY Name;
	GO