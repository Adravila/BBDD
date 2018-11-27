/**
Clases colectivas:
- La duración no puede ser mayor de 45 minutos.
**/

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER TriggerClaseColectiva 
BEFORE INSERT OR UPDATE ON Clase_Colectiva 
FOR EACH ROW

DECLARE

BEGIN
	IF(:NEW.duracion < 0 || :NEW.duracion > 45) THEN
		RAISE_APPLICATION_ERROR (-20600,'Error, la duración debe ser menor o igual que 45 minutos.');
	END IF;
END;
/
