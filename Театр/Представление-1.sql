IF OBJECT_ID('T1') IS NOT NULL 
DROP VIEW T1
GO 
 
CREATE VIEW T1 AS 
SELECT tmp1.Name, tmp1.Director, tmp2.Actor  
	FROM 
	(SELECT [SPECTACLE INFO].spectacle_name AS Name, EMPLOYEE.original_name AS Director 
		FROM EMPLOYEE INNER JOIN CREATORS ON EMPLOYEE.employee_id=CREATORS.employee_id 
		INNER JOIN ROLE ON CREATORS.role_id=ROLE.role_id 
		INNER JOIN [SPECTACLE INFO] ON CREATORS.spectacle_id=[SPECTACLE INFO].spectacle_id
		WHERE ROLE.role_name = 'Director') tmp1, 
	(SELECT [SPECTACLE INFO].spectacle_name AS Name, EMPLOYEE.original_name AS Actor 
		FROM EMPLOYEE INNER JOIN CREATORS ON EMPLOYEE.employee_id=CREATORS.employee_id
		INNER JOIN ROLE ON CREATORS.role_id=ROLE.role_id
		INNER JOIN [SPECTACLE INFO] ON CREATORS.spectacle_id=[SPECTACLE INFO].spectacle_id
		WHERE ROLE.role_name= 'Actor') tmp2
		WHERE tmp1.Name = tmp2.Name 		
GO

  
 SELECT Name, Director, Actor /*stuff((select ', ' + Actor from T1 for xml path('')), 1, 2, '')*/
 FROM T1
 GROUP BY Name, Director, Actor
 ORDER BY Name, Director
 GO