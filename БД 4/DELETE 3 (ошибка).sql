-- Удалить арфы из инструментов оркестра
begin tran

Insert into Instruments values (1000,'арфы')
select * from Orchestra

update Orchestra
set Instrument_ID = 1000
where Instrument_ID = 9

DELETE FROM Orchestra
WHERE Instrument_ID in 
(SELECT Orchestra.Instrument_ID
FROM Orchestra, Instruments
WHERE Orchestra.Instrument_ID = Instruments.Instrument_ID
AND Instruments.Name = 'арфы')
DELETE FROM Instruments
WHERE Instruments.Name = 'арфы'
rollback