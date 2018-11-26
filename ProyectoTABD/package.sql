CREATE OR REPLACE PACKAGE Proyecto AS
	-- Tabla Ejercicio --
	PROCEDURE agregarEjercicio (nombre VARCHAR2, descripcion VARCHAR2);
	PROCEDURE eliminarEjercicio (nombre VARCHAR2);
	PROCEDURE verEjercicios;
	-- Tabla Equipo --
	PROCEDURE agregarEquipo (coste NUMBER);
	PROCEDURE eliminarEjercicio (cod_equipo NUMBER);
	PROCEDURE verEjercicios;
	-- Tabla Rutina --
	PROCEDURE agregarRutina (nombre VARCHAR2, descripcion VARCHAR2);
	PROCEDURE eliminarEjercicio (cod_rutina NUMBER);
	PROCEDURE verEjercicios;

END;
/
/** FIN CREACIÓN DEL PAQUETE - PROYECTO **/

/** CREACIÓN DEL CUERPO DEL PAQUETE - PROYECTO **/

CREATE OR REPLACE PACKAGE BODY Proyecto AS

	-- TABLA EJERCICIO --
	/* 
		Procedure - agregarEjercicio
		Postcondición: 	Agregar un ejercicio a la tabla Ejercicios
	*/
	PROCEDURE agregarEjercicio (nombre VARCHAR2, descripcion VARCHAR2) AS

		v_nombre VARCHAR2(20);
		v_descripcion VARCHAR2(20);

	BEGIN
		v_nombre := nombre;
		v_descripcion := descripcion;
		INSERT INTO Tabla_Ejercicios (nombre, descripcion) VALUES (nombre,descripcion);

	END agregarEjercicio;

	/* 
		Procedure - eliminarEjercicio
		Postcondición: 	Elimina un ejercicio de la tabla Tabla_Ejercicio
	*/
	PROCEDURE eliminarEjercicio (nombre VARCHAR2) AS

		v_nombre VARCHAR2;

	BEGIN

		v_nombre := nombre;

		DELETE FROM Tabla_Ejercicio WHERE nombre = v_nombre;

		EXCEPTION WHEN OTHERS THEN ROLLBACK;

	END eliminarEjercicio;

	-- TABLA RUTINA --
	/* 
		Procedure - agregarRutina
		Postcondición: 	Agrega una rutina de la tabla Tabla_Rutina
	*/
	PROCEDURE agregarRutina (proposito VARCHAR2, duracion NUMBER) AS

		v_proposito VARCHAR2(20);
		v_duracion NUMBER(38);

	BEGIN

		v_proposito := proposito;
		v_duracion := duracion;

		INSERT INTO Tabla_Ejercicios (proposito, duracion) VALUES (v_proposito, v_duracions);

		EXCEPTION WHEN OTHERS THEN
			RAISE_APPLICATION_ERROR (-20600,'Error: no se ha introducido correctamente la fila.');

	END agregarRutina;

	/* 
		Procedure - eliminarRutina
		Postcondición: 	Elimina una rutina de la tabla Tabla_Rutina
	*/
	PROCEDURE eliminarRutina (cod_rutina NUMBER) AS

		v_cod_rutina NUMBER(38);

	BEGIN

		v_cod_rutina := cod_rutina;

		DELETE FROM Tabla_Rutinas WHERE cod_rutina = v_cod_rutina;

		EXCEPTION WHEN OTHERS THEN ROLLBACK;

	END eliminarRutina
	;

	-- TABLA EQUIPO --
	/* 
		Procedure - agregarEquipo
		Postcondición: 	Agrega un equipo de la tabla Tabla_Equipo
	*/
	PROCEDURE agregarEquipo (coste NUMBER) AS

		v_coste NUMBER(38);

	BEGIN

		v_coste := coste;

		INSERT INTO Tabla_Ejercicios (coste) VALUES (v_coste);

		EXCEPTION WHEN OTHERS THEN
			RAISE_APPLICATION_ERROR (-20600,'Error: no se ha introducido correctamente la fila.');

	END agregarEquipo;

	/* 
		Procedure - eliminarEquipo
		Postcondición: 	Elimina un equipo de la tabla Tabla_Equipo
	*/
	PROCEDURE eliminarEquipo (cod_equipo NUMBER) AS

		v_cod_equipo NUMBER(38);

	BEGIN

		v_cod_equipo := cod_equipo;

		DELETE FROM Tabla_Equipo WHERE cod_equipo = v_cod_equipo;

		EXCEPTION WHEN OTHERS THEN ROLLBACK;

	END eliminarEquipo;

END;
/
/** FIN CREACIÓN DEL PAQUETE - PROYECTO **/

/** Bloque PL/SQL anónimo **/

BEGIN
	Proyecto.agregarEjercicio('Ejer_5','pepe');
END;
/