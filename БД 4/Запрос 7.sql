--Определить, выпускники каких учреждений чаще всего становятся народными артистами России

SELECT	Employee.Graduated, COUNT (Employee.Graduated) AS number
FROM Employee
WHERE Awards = 'народный артист России'
GROUP BY Employee.Graduated
ORDER BY number DESC;