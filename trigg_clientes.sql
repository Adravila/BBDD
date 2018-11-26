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
