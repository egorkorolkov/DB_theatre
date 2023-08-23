IF OBJECT_ID('T4') IS NOT NULL 
DROP VIEW T4
GO 
CREATE VIEW T4 AS 
SELECT tmp1.Name, tmp2.Actor, tmp2.Achievement   
	FROM 
	(SELECT THEATER.name AS Name
		FROM THEATER) tmp1, 
	(SELECT DISTINCT THEATER.name AS Name, EMPLOYEE.original_name AS Actor, COUNT([RECEIVED ACHIEVEMENTS].employee_id) AS Achievement 
		FROM EMPLOYEE INNER JOIN CREATORS ON EMPLOYEE.employee_id=CREATORS.employee_id
		INNER JOIN ROLE ON CREATORS.role_id=ROLE.role_id
		INNER JOIN [RECEIVED ACHIEVEMENTS] ON EMPLOYEE.employee_id=[RECEIVED ACHIEVEMENTS].employee_id
		INNER JOIN [SPECTACLE INFO] ON CREATORS.spectacle_id=[SPECTACLE INFO].spectacle_id
		INNER JOIN THEATER ON [SPECTACLE INFO].theater_id=THEATER.theater_id
		WHERE ROLE.role_name= 'Actor'
		GROUP BY THEATER.name, [SPECTACLE INFO].spectacle_id, [SPECTACLE INFO].spectacle_name, EMPLOYEE.original_name) tmp2
		WHERE tmp1.Name = tmp2.Name 	
			
GO


SELECT * 
 FROM T4
 ORDER BY Name, Actor, Achievement;
 GO


 -- Топ 5 театров, отранжированных по количеству достижений у актеров
 SELECT TOP 5 SUM(Achievement) AS SUMM, Name
 FROM T4
 GROUP BY Name
 ORDER BY SUMM DESC