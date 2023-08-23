--вывести имена гримеров, работающих в премьеры, и даты их работы

SELECT Employee.Name, Playbill.Date
FROM Employee, Playbill, Artistic_direction, Repertoire, Positions
WHERE Artistic_direction.Performance_ID = Repertoire.Performance_ID
AND Artistic_direction.Person = Employee.Employee_ID
AND Playbill.Performance_ID = Repertoire.Performance_ID
AND Employee.Position_ID = Positions.Position_ID
AND Positions.Name = 'гример'
AND Playbill.Premiere = 'ДА';