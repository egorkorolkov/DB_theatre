------------
/*DENY SELECT ON PUBLISHER TO testorole
GRANT SELECT ON PUBLISHER TO testo
SELECT * FROM PUBLISHER

REVOKE SELECT ON PUBLISHER TO testo

DENY SELECT ON PUBLISHER TO testo
GRANT SELECT ON PUBLISHER TO testorole

EXECUTE AS USER = 'testo';
REVERT

создать пользователя, у которого роль с deny и роль с dbowner
зайти этим пользователем, добиться того, чтобы право появилось
*/

------------