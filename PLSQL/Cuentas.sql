/* Autor: Adravila */

SET SERVEROUTPUT ON

DECLARE
	CURSOR c_acciones IS
		SELECT *
		FROM Acciones;

	no_tablas_creadas EXCEPTION;
BEGIN
	FOR v_acciones IN c_acciones LOOP
		v_acciones.FechaMod := SYSDATE;

		/** INSERTAR **/
		IF v_acciones.TipoOP = 'i' or  v_acciones.TipoOP = 'I' THEN

			BEGIN
				INSERT INTO Cuentas(IDCuenta, Valor) VALUES (v_acciones.IdCuenta,v_acciones.NuevoValor);
				v_acciones.Estado := 'Insertado';

				EXCEPTION WHEN DUP_VAL_ON_INDEX THEN
					UPDATE Cuentas SET Valor = v_acciones.NuevoValor WHERE IDCuenta = v_acciones.IdCuenta;
					v_acciones.Estado := 'Actualizado';
			END;
		/** ACTUALIZAR **/
		ELSIF v_acciones.TipoOP = 'a' or  v_acciones.TipoOP = 'A' THEN
			
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
		ELSIF v_acciones.TipoOP = 'b' or  v_acciones.TipoOP = 'B' THEN
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
