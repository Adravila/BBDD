/*
Clases colectivas:
- La duración no puede ser mayor de 45 minutos.
*/

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER TriggerClaseColectiva 
BEFORE INSERT OR UPDATE ON Clase_Colectiva 
FOR EACH ROW

DECLARE

BEGIN
	IF(:NEW.duracion < 0 || :NEW.duracion > 45) THEN
		RAISE_APPLICATION_ERROR (-20600,'Error, la duración debe ser menor o igual que 45 minutos.');
END;
/

/**
Clientes:
- Debe de tener el número caracteres y dígitos exactos de un dni_e (9 incluyendo la letra).
- Los telefonos deben de tener exactamente 9 dígitos.
**/
SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER TriggerClientes
BEFORE INSERT OR UPDATE ON Tabla_Clientes 
FOR EACH ROW

DECLARE

BEGIN
	IF LENGTH(:NEW.telfs(1)) != 9 THEN
		RAISE_APPLICATION_ERROR (-20600,'El teléfono debe tener 9 dígitos');
	ELSIF LENGTH(:NEW.dni_e) != 9 THEN
		RAISE_APPLICATION_ERROR (-20600,'Error, se debe introducir un total de 9 caracteres (8 numéricos) y la letra');
	END IF;
END;
/

/**
Empleados:
- Los telefonos deben de tener exactamente 9 dígitos.
- El tipo debe estar en esta lista {mantenimiento, monitor, jefe}.
- Jornada laboral, sea un máximo de 5 días a la semana y 8 horas al día.
*/

CREATE OR REPLACE TRIGGER TriggerEmpleados
BEFORE INSERT OR UPDATE ON Empleados 
FOR EACH ROW
BEGIN
	IF(LENGTH(TO_CHAR(:NEW.telefonos)) != 9) THEN
		RAISE_APPLICATION_ERROR (-20600,'El teléfono debe tener 9 dígitos');
	END IF;
	IF(LENGTH(:NEW.jornada_laboral.dias > 5 OR NEW.jornada_laboral.horas > 8 ) THEN
		RAISE_APPLICATION_ERROR (-20600,'La jornada laboral no es correcta');
	END IF;
	IF (LOWER(:NEW.tipo) <> 'mantenimiento' OR LOWER(:NEW.tipo) <> 'monitor' OR LOWER(:NEW.tipo) <> 'jefe') THEN
		RAISE_APPLICATION_ERROR (-20600,'Error, no se corresponde a ninguno de estos tipos');
	END IF;
END;
/

/**
Rutinas:
- Duración: no debe ser superior a 1 año.
**/

CREATE OR REPLACE TRIGGER TriggerRutinas
BEFORE INSERT OR UPDATE ON Rutinas 
FOR EACH ROW
BEGIN
	IF(:NEW.duracion > 365) THEN
		RAISE_APPLICATION_ERROR (-20600,'La duracion no debe ser superior a 1 anno');
	END IF;
END;
/
