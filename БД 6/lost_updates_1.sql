set transaction isolation level read uncommitted
begin transaction


update Employee set Birth_date = dateadd(day, 4, Birth_date)
where Employee_ID = 15



commit
select * from Employee