/**
Clases colectivas:
- La fecha no puede ser menor que el día actual (fecha del sistema)
- La duración no puede ser mayor de 45 minutos.
- El tipo de clase tiene que ser algunos de estos tipos: {Ciclo, Step, Zumba, Body Pump, ABD, Body Combat, Yoga, Pilates, Body Balance}.
**/

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER TriggerClaseColectiva 
BEFORE INSERT OR UPDATE ON Clase_Colectiva 
FOR EACH ROW

DECLARE

BEGIN
	IF(:NEW.duracion < 0 || :NEW.duracion > 45) THEN
		RAISE_APPLICATION_ERROR (-20600,'Error, la duración debe ser menor o igual que 45 minutos.');
	ELSIF(:NEW.tipos < 0 || :NEW.tipos > 10) THEN
		RAISE_APPLICATION_ERROR (-20600,'Error, no se corresponde a ninguno de estos tipos.');
	ELSIF() THEN
		RAISE_APPLICATION_ERROR(-20600,'Error, la fecha indicada no es válida.');
END;
/