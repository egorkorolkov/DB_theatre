------------
/*DENY SELECT ON PUBLISHER TO testorole
GRANT SELECT ON PUBLISHER TO testo
SELECT * FROM PUBLISHER

REVOKE SELECT ON PUBLISHER TO testo

DENY SELECT ON PUBLISHER TO testo
GRANT SELECT ON PUBLISHER TO testorole

EXECUTE AS USER = 'testo';
REVERT

������� ������������, � �������� ���� � deny � ���� � dbowner
����� ���� �������������, �������� ����, ����� ����� ���������
*/

------------