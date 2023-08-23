--постановочная часть, должность, дата и время работы

IF OBJECT_ID('T4') IS NOT NULL 
DROP VIEW T4
GO 

CREATE VIEW T4 AS
SELECT tmp.Name, tmp.Position, Date, Time
	FROM
	(SELECT Employee.Name, Positions.Name as Position, Playbill.Date, Playbill.Time
		FROM Employee
		JOIN Positions ON Employee.Position_ID = Positions.Position_ID
		JOIN Artistic_direction ON Employee.Employee_ID = Artistic_direction.Person
		JOIN Repertoire ON Artistic_direction.Performance_ID = Repertoire.Performance_ID
		JOIN Playbill ON Repertoire.Performance_ID = Playbill.Performance_ID
		JOIN Departments ON Employee.Department_ID = Departments.Department_ID
		WHERE Departments.Name = 'постановочная часть'
		GROUP BY Employee.Name, Positions.Name, Playbill.Date, Playbill.Time) tmp
GO


SELECT DISTINCT T4.Name, Position, STRING_AGG(CONCAT(Date, ' ', Time), ', ') AS work_time
	FROM T4
	GROUP BY T4.Name, Position
	ORDER BY Name;
	GO