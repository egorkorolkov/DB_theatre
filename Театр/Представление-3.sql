IF OBJECT_ID('T3') IS NOT NULL 
DROP VIEW T3
GO 

CREATE VIEW T3 AS
SELECT DISTINCT  tmp1.name, tmp2.[Min Price], tmp2.[Max Price], tmp1.[Theatre name], tmp1.Director 
	FROM (SELECT THEATER.name AS [Theatre name],[SPECTACLE INFO].spectacle_id AS ID, [SPECTACLE INFO].spectacle_name AS Name, EMPLOYEE.original_name AS Director
			FROM EMPLOYEE INNER JOIN CREATORS ON EMPLOYEE.employee_id=CREATORS.employee_id 
			INNER JOIN ROLE ON CREATORS.role_id=ROLE.role_id 
			INNER JOIN [SPECTACLE INFO] ON CREATORS.spectacle_id=[SPECTACLE INFO].spectacle_id
			INNER JOIN THEATER ON [SPECTACLE INFO].theater_id=THEATER.theater_id
			WHERE ROLE.role_name = 'Director'
			GROUP BY [SPECTACLE INFO].spectacle_id, [SPECTACLE INFO].spectacle_name, THEATER.name, EMPLOYEE.original_name) tmp1,
		(SELECT [SPECTACLE INFO].spectacle_id AS ID, [SPECTACLE INFO].spectacle_name AS Name, AVG(PERFORMANCE.performance_min_price) AS [Min Price], AVG(PERFORMANCE.performance_max_price) AS [Max Price] 
			FROM [SPECTACLE INFO] INNER JOIN PERFORMANCE ON [SPECTACLE INFO].spectacle_id=PERFORMANCE.spectacle_id
			GROUP BY  [SPECTACLE INFO].spectacle_name, [SPECTACLE INFO].spectacle_id) tmp2 

	WHERE tmp1.ID=tmp2.ID

GO


SELECT * 
	FROM T3
	ORDER BY Name;
	GO