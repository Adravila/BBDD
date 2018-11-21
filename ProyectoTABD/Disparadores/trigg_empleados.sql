/**
Empleados:
- El sueldo del jefe debe ser mayor o igual que el del resto de los empleados.
- Los telefonos deben de tener exactamente 9 dígitos.
- El tipo debe estar en esta lista {Mantenimiento, Monitor, Jefe}.
- Jornada laboral, sea un máximo de 5 días a la semana y 8 horas al día.

CREATE OR REPLACE TYPE Tipo_Direccion AS OBJECT(
	calle VARCHAR(30),
	ciudad VARCHAR(30)
);

CREATE OR REPLACE TYPE Tipo_JornadaLaboral AS OBJECT(
	dias INTEGER,
	horas INTEGER
);

CREATE OR REPLACE TYPE Tipo_Telfs AS VARRAY(2) OF VARCHAR(9);

CREATE TABLE Empleados (
	cod_emp VARCHAR2(30),
	sueldo INTEGER,
	jornada_laboral Tipo_JornadaLaboral,
	nombre VARCHAR2(30),
	telefonos Tipo_Telfs,
	direccion Tipo_Direccion,
	tipo VARCHAR2(30),
	CONSTRAINT PK_cod_emp PRIMARY KEY (cod_emp)
);

INSERT INTO Rutinas(Nombre, Duracion) VALUES ('Rutina 1',35);

**/

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER TriggerEmpleados
BEFORE INSERT OR UPDATE ON Empleados 
FOR EACH ROW
BEGIN
	IF(:NEW.sueldo < 0 OR :NEW.sueldo > 45) THEN
		RAISE_APPLICATION_ERROR (-20600,'El teléfono debe tener 9 dígitos');
	ELSIF(LENGTH(TO_CHAR(:NEW.telefonos)) != 9) THEN
		RAISE_APPLICATION_ERROR (-20600,'El teléfono debe tener 9 dígitos');
	ELSIF(LENGTH(:NEW.jornada_laboral.dias > 8 OR NEW.jornada_laboral.horas > 8 ) THEN
		RAISE_APPLICATION_ERROR (-20600,'La jornada laboral no es correcta');
	ELSIF(:NEW.tipo = 'Mantenimiento' OR :NEW.tipo = 'Monitor' OR :NEW.tipo = 'Jefe') THEN
		RAISE_APPLICATION_ERROR (-20600,'Error, no se corresponde a ninguno de estos tipos');
	END IF;
END;
/
