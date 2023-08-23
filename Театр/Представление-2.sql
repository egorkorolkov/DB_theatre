IF OBJECT_ID('T2') IS NOT NULL 
DROP VIEW T2
GO 


CREATE VIEW T2 AS
SELECT DISTINCT tmp1.original_name, tmp1.name, quantity1, quantity2
	FROM 
		(SELECT EMPLOYEE.original_name ,[SPECTACLE INFO].spectacle_id, [SPECTACLE INFO].spectacle_name AS Name, COUNT(PERFORMANCE.performance_id) AS quantity1
			FROM EMPLOYEE INNER JOIN CREATORS ON EMPLOYEE.employee_id=CREATORS.employee_id 
			INNER JOIN ROLE ON CREATORS.role_id=ROLE.role_id 
			INNER JOIN [SPECTACLE INFO] ON CREATORS.spectacle_id=[SPECTACLE INFO].spectacle_id 
			INNER JOIN PERFORMANCE ON [SPECTACLE INFO].spectacle_id=PERFORMANCE.spectacle_id
			WHERE ROLE.role_name = 'Director'
			GROUP BY [SPECTACLE INFO].spectacle_id, [SPECTACLE INFO].spectacle_name, EMPLOYEE.original_name) tmp1,
		(SELECT  [SPECTACLE INFO].spectacle_id, [SPECTACLE INFO].spectacle_name AS Name, COUNT(DISTINCT CHARACTERS.character_name) AS quantity2
			FROM [SPECTACLE INFO] INNER JOIN PERFORMANCE ON [SPECTACLE INFO].spectacle_id=PERFORMANCE.spectacle_id
			INNER JOIN CHARACTERS ON PERFORMANCE.spectacle_id=CHARACTERS.spectacle_id
			GROUP BY [SPECTACLE INFO].spectacle_id, [SPECTACLE INFO].spectacle_name) tmp2
	WHERE tmp1.name=tmp2.name
GO


SELECT * 
 FROM T2
 ORDER BY Name
 GO


 --выбрать 3 самых попул€рных постановки
SELECT TOP 3 Name, original_name, quantity1 AS Quantity --ƒлобавить режиссера 
	FROM T2
	ORDER BY quantity1 DESC