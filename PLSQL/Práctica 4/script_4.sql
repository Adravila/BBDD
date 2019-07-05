/* Autor: Adrián Dávila Guerra 
*  Práctica 4
*/

/** Creación de la tabla Empleados

CREATE TABLE Empleados (
	Cod_Empleado INTEGER,
	Nombre VARCHAR2(20),
	Sueldo NUMBER(8),
	CONSTRAINT PK_Empleados PRIMARY KEY (Cod_Empleado)
);
*/

/** Creación de la tabla Informacion

CREATE TABLE Informacion (
	Id_Informacion INTEGER,	
	Cod_Empleado INTEGER,
	Accion VARCHAR(20),
	Atrib_Mod VARCHAR(12),
	New VARCHAR(20),
	Old VARCHAR(20),
	Usuario VARCHAR(10),
	Hora_Mod VARCHAR(20),
	CONSTRAINT PK_Informacion PRIMARY KEY (Id_Informacion)
);
*/

/** 
CREATE SEQUENCE INFO_sequence;
CREATE SEQUENCE employee_sequence;
*/

/**
INSERT INTO Empleados(Cod_Empleado, Nombre, Sueldo) VALUES (employee_sequence.NEXTVAL,'Jose Miguel', 3000);
INSERT INTO Empleados(Cod_Empleado, Nombre, Sueldo) VALUES (employee_sequence.NEXTVAL,'Vanesa', 2000);
INSERT INTO Empleados(Cod_Empleado, Nombre, Sueldo) VALUES (employee_sequence.NEXTVAL,'Carlos', 3000);
INSERT INTO Empleados(Cod_Empleado, Nombre, Sueldo) VALUES (employee_sequence.NEXTVAL,'Sandra', 3300);
INSERT INTO Empleados(Cod_Empleado, Nombre, Sueldo) VALUES (employee_sequence.NEXTVAL,'Pedro', 2300);
INSERT INTO Empleados(Cod_Empleado, Nombre, Sueldo) VALUES (employee_sequence.NEXTVAL,'Maria', 1300);
INSERT INTO Empleados(Cod_Empleado, Nombre, Sueldo) VALUES (employee_sequence.NEXTVAL,'Juan', 1300);
INSERT INTO Empleados(Cod_Empleado, Nombre, Sueldo) VALUES (employee_sequence.NEXTVAL,'Manuel', 1231);
INSERT INTO Empleados(Cod_Empleado, Nombre, Sueldo) VALUES (employee_sequence.NEXTVAL,'Manuel', 1231);
INSERT INTO Empleados(Cod_Empleado, Nombre, Sueldo) VALUES (employee_sequence.NEXTVAL,'Manuel', 1231);

**/

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER Practica4 
BEFORE INSERT OR DELETE OR UPDATE ON Empleados 
FOR EACH ROW
DECLARE
	v_accion VARCHAR2(10);
	v_clave NUMBER(6);
BEGIN	
	/* En caso de que se haga UPDATE (información específica) */
	IF UPDATING THEN
		v_accion := 'UPDATE';
		DBMS_OUTPUT.PUT('Actualizaciones: ');

		/* No hay cambios */
		IF(:OLD.Cod_Empleado = :NEW.Cod_Empleado AND :OLD.Nombre = :NEW.Nombre AND :OLD.Sueldo = :NEW.Sueldo) THEN
			DBMS_OUTPUT.PUT_LINE('Sin cambios');
		END IF;
		DBMS_OUTPUT.PUT_LINE('');
		v_clave := :NEW.Cod_Empleado;
		
		/* Actualización en el Cod_Empleado */
		IF(:OLD.Cod_Empleado <> :NEW.Cod_Empleado) THEN 
			DBMS_OUTPUT.PUT_LINE('- Cod_Empleado = ' || :OLD.Cod_Empleado || ' (old) ==> ' ||:NEW.Cod_Empleado || ' (new)');

			INSERT INTO Informacion (Id_Informacion, Cod_Empleado, Accion, Atrib_Mod, New, Old, Usuario, Hora_Mod)
			VALUES (INFO_sequence.NEXTVAL,v_clave,v_accion,'Cod_Empleado',:NEW.Cod_Empleado,:OLD.Cod_Empleado,user,to_char(sysdate, 'HH24:MI:SS'));

		END IF;
		/* Actualización en el Nombre */
		IF(:OLD.Nombre <> :NEW.Nombre) THEN 
			DBMS_OUTPUT.PUT_LINE('- Nombre: ' || :OLD.Nombre || ' (old) ==> ' ||:NEW.Nombre || ' (new)');
			INSERT INTO Informacion (Id_Informacion, Cod_Empleado, Accion, Atrib_Mod, New, Old, Usuario, Hora_Mod)
			VALUES (INFO_sequence.NEXTVAL,v_clave,v_accion,'Nombre',:NEW.Nombre,:OLD.Nombre,user,to_char(sysdate, 'HH24:MI:SS'));

		END IF;
		/* Actualización en el Precio */
		IF(:OLD.Sueldo <> :NEW.Sueldo) THEN
			DBMS_OUTPUT.PUT_LINE('- Sueldo: ' || :OLD.Sueldo || ' (old) ==> ' ||:NEW.Sueldo || ' (new)');
			INSERT INTO Informacion (Id_Informacion, Cod_Empleado, Accion, Atrib_Mod, New, Old, Usuario, Hora_Mod)
			VALUES (INFO_sequence.NEXTVAL,v_clave,v_accion,'Sueldo',:NEW.Sueldo,:OLD.Sueldo,user,to_char(sysdate, 'HH24:MI:SS'));

	END IF;

	/* En caso de que se haga INSERT */
	ELSIF INSERTING THEN
		v_clave := :NEW.Cod_Empleado;
		v_accion := 'INSERT';

		INSERT INTO Informacion (Id_Informacion, Cod_Empleado, Accion, Usuario, Hora_Mod)
		VALUES (INFO_sequence.NEXTVAL,v_clave,v_accion,user,to_char(sysdate, 'HH24:MI:SS'));

	/* En caso de que se haga DELETE */	
	ELSIF DELETING THEN
		v_clave := :OLD.Cod_Empleado;
		v_accion := 'DELETE';

		INSERT INTO Informacion (Id_Informacion, Cod_Empleado, Accion, Usuario, Hora_Mod)
		VALUES (INFO_sequence.NEXTVAL,v_clave,v_accion,user,to_char(sysdate, 'HH24:MI:SS'));

	END IF;

	/* Información común */
	DBMS_OUTPUT.PUT_LINE('Clave efectuada: ' || v_clave);
	DBMS_OUTPUT.PUT_LINE('Accion realizada: ' || v_accion);
	DBMS_OUTPUT.PUT_LINE('Modificado por: ' || user);
	DBMS_OUTPUT.PUT_LINE('Ultima modificacion: ' || to_char(sysdate, 'HH24:MI:SS'));

END;
/