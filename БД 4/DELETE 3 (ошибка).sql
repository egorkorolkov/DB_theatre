-- ������� ���� �� ������������ ��������
begin tran

Insert into Instruments values (1000,'����')
select * from Orchestra

update Orchestra
set Instrument_ID = 1000
where Instrument_ID = 9

DELETE FROM Orchestra
WHERE Instrument_ID in 
(SELECT Orchestra.Instrument_ID
FROM Orchestra, Instruments
WHERE Orchestra.Instrument_ID = Instruments.Instrument_ID
AND Instruments.Name = '����')
DELETE FROM Instruments
WHERE Instruments.Name = '����'
rollback