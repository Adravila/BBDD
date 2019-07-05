/* Autor: Adrián Dávila Guerra 
*  Práctica 2
*/

/*

CREATE TABLE Cuentas(
	IDCuenta NUMBER(4),
	Valor NUMBER(11,2),
	CONSTRAINT PK_Cuentas PRIMARY KEY(IDCuenta)
);

CREATE TABLE Acciones(
	IdCuenta NUMBER(4),
	TipoOp CHAR(1),
	NuevoValor NUMBER(11,2),
	Estado VARCHAR2(45),
	FechaMod DATE,
	CONSTRAINT PK_Acciones PRIMARY KEY(IdCuenta).
	CONSTRAINT FK_Acciones FOREIGN KEY(IdCuenta) REFERENCES Cuentas);
);

INSERT INTO Cuentas(IDCuenta, Valor) VALUES (1,1000);
INSERT INTO Cuentas(IDCuenta, Valor) VALUES (2,2000);
INSERT INTO Cuentas(IDCuenta, Valor) VALUES (3,1500);
INSERT INTO Cuentas(IDCuenta, Valor) VALUES (4,6500);
INSERT INTO Cuentas(IDCuenta, Valor) VALUES (5,500);

INSERT INTO Acciones(IdCuenta, TipoOp, NuevoValor) VALUES (3,'a',599);
INSERT INTO Acciones(IdCuenta, TipoOp, NuevoValor) VALUES (6,'i',20999);
INSERT INTO Acciones(IdCuenta, TipoOp) VALUES (5,'B');
INSERT INTO Acciones(IdCuenta, TipoOp, NuevoValor) VALUES (7,'A',1599);
INSERT INTO Acciones(IdCuenta, TipoOp, NuevoValor) VALUES (1,'i',399);
INSERT INTO Acciones(IdCuenta, TipoOp) VALUES (9,'b');
INSERT INTO Acciones(IdCuenta, TipoOp) VALUES (10,'h');
*/

SET SERVEROUTPUT ON

DECLARE
	CURSOR c_acciones IS
		SELECT *
		FROM Acciones;
BEGIN
	FOR v_acciones IN c_acciones LOOP
		v_acciones.FechaMod := SYSDATE;

		/** INSERTAR **/
		IF UPPER(v_acciones.TipoOP) = 'I' THEN

			BEGIN
				INSERT INTO Cuentas(IDCuenta, Valor) VALUES (v_acciones.IdCuenta,v_acciones.NuevoValor);
				v_acciones.Estado := 'Insertado';

				EXCEPTION WHEN DUP_VAL_ON_INDEX THEN
					UPDATE Cuentas SET Valor = v_acciones.NuevoValor WHERE IDCuenta = v_acciones.IdCuenta;
					v_acciones.Estado := 'Actualizado';
			END;
			
		/** ACTUALIZAR **/
		ELSIF UPPER(v_acciones.TipoOP) = 'A' THEN
			
			DECLARE
				v_reg_cuentas cuentas%ROWTYPE;
			BEGIN

				SELECT * INTO v_reg_cuentas
				FROM Cuentas
				WHERE IdCuenta = v_acciones.IdCuenta;

				UPDATE Cuentas SET Valor = v_acciones.NuevoValor WHERE IdCuenta = v_acciones.IdCuenta;

				/* Cuidado aquí, dado que si no existiera ninguna cuenta con el id que indica en Cuentas no lanzará ninguna excepción,
					para ello lo mejor sería declarar v_reg_cuentas cuentas%ROWTYPE para que consiga lanzar la excepción. */

				v_acciones.Estado := 'Actualizado';

				EXCEPTION WHEN NO_DATA_FOUND THEN
					INSERT INTO Cuentas(IDCuenta, Valor) VALUES (v_acciones.IdCuenta,v_acciones.NuevoValor);
					v_acciones.Estado := 'Insertado';
			END;
		
		/** BORRAR **/
		ELSIF UPPER(v_acciones.TipoOP) = 'B' THEN
			
			DECLARE
				v_reg_cuentas cuentas%ROWTYPE;
			BEGIN

				SELECT * INTO v_reg_cuentas
				FROM Cuentas
				WHERE IdCuenta = v_acciones.IdCuenta;

				/* Cuidado aquí, dado que si no existiera ninguna cuenta con el id que indica en Cuentas no lanzará ninguna excepción,
					para ello lo mejor sería declarar v_reg_cuentas cuentas%ROWTYPE para que consiga lanzar la excepción. */
		
				DELETE FROM Cuentas WHERE IdCuenta = v_acciones.IdCuenta;
				v_acciones.Estado := 'Borrado';

				EXCEPTION WHEN NO_DATA_FOUND THEN
					v_acciones.Estado := 'Sin acciones';			
			END;

		/** Tipo OP incorrecto **/
		ELSE
			v_acciones.Estado := 'Tipo OP incorrecto';
		END IF;

		UPDATE Acciones SET row = v_acciones WHERE IDCuenta = v_acciones.IdCuenta;
	END LOOP;
	
	EXCEPTION WHEN OTHERS THEN ROLLBACK;

END;
/