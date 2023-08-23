--определить имена менеджеров, у которых за пять лет работы появились в подчинении аналитики (ANALYST)

SELECT DISTINCT managers.last_name, managers.first_name
FROM employee, job, employee managers
WHERE employee.job_id = job.job_id 
AND "function" = 'ANALYST'
AND employee.manager_id = managers.employee_id
AND DATEDIFF(dd, managers.hire_date, employee.hire_date) < 1826;
--DATEDIFF
