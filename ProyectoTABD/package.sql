SET SERVEROUTPUT;

CREATE OR REPLACE PACKAGE Proyecto AS
	-- Tabla Cliente --
	PROCEDURE aniadir_cliente
	(
		p_dni IN Tabla_Clientes.dni_e%TYPE,
		p_nombre IN Tabla_Clientes.nombre%TYPE,
		p_apellidos IN Tabla_Clientes.apellidos%TYPE,
		p_peso IN Tabla_Clientes.peso%TYPE,
		p_suscripcion IN Tabla_Clientes.suscripcion%TYPE,
		p_telfs IN Tabla_Clientes.telfs%TYPE,
		p_direccion IN Tabla_Clientes.direccion%TYPE
	);
	PROCEDURE eliminar_cliente
	(
		p_dni IN Tabla_Clientes.dni_e%TYPE
	);
	PROCEDURE ver_clientes;
	PROCEDURE asignar_rutina_cliente
	(
		p_dni Tabla_Clientes.dni_e%TYPE,
		p_cod_rutina Tabla_Rutinas.cod_rutina%TYPE,
		p_proposito Tabla_Rutinas.proposito%TYPE,
		p_duracion Tabla_Rutinas.duracion%TYPE,
		p_ref_monitor REF Tipo_Monitor
	)

	-- Tabla Clase Colectiva --
	PROCEDURE aniadir_clase_colectiva
	(
		p_fecha IN Tabla_ClasesColectivas.fecha%TYPE,
		p_duracion IN Tabla_ClasesColectivas.duracion%TYPE,
		p_tipo_clase IN Tabla_ClasesColectivas.tipo_clase%TYPE
	);
	PROCEDURE eliminar_clase_colectiva
	(
		p_fecha IN Tabla_ClasesColectivas.fecha%TYPE
	);
	PROCEDURE ver_clases_colectivas;

	-- Tabla Empleados --
	PROCEDURE aniadir_empleado 
	(
		p_cod_emp IN Tabla_Empleados.cod_emp%TYPE,
		p_nombre IN Tabla_Empleados.nombre%TYPE,
		p_apellidos IN Tabla_Empleados.apellidos%TYPE,
		p_sueldo IN Tabla_Empleados.sueldo%TYPE,
		p_jornada_laboral IN Tabla_Empleados.jornada_laboral%TYPE,
		p_direccion IN Tabla_Empleados.direccion%TYPE,
		p_telfs IN Tabla_Empleados.telfs%TYPE,
		p_tipo IN Tabla_Empleados.tipo%TYPE
	);
	PROCEDURE eliminar_empleado
	(
		p_cod IN Tabla_Empleados.cod_emp%TYPE,
		p_type IN Tabla_Empleados.tipo%TYPE
	);
	PROCEDURE ver_empleados;

	-- Tabla Ejercicio --
	PROCEDURE agregarEjercicio 
	(
		p_nombre IN Tabla_Ejercicios.nombre%TYPE,
		p_direccion IN Tabla_Ejercicios.descripcion%TYPE
	);
	PROCEDURE eliminarEjercicio 
	(
		p_nombre IN Tabla_Ejercicios.nombre%TYPE
	);
	PROCEDURE ver_ejercicios;

	-- Tabla Equipo --
	PROCEDURE agregarEquipo 
	(
		p_cod_equipo IN Tabla_Equipo.cod_equipo %TYPE,
		p_coste IN Tabla_Equipo.coste %TYPE
	); 
	PROCEDURE eliminarEjercicio
	(
		p_cod_equipo IN Tabla_Equipo.cod_equipo %TYPE
	);
	PROCEDURE verEjercicios;
	
	-- Tabla Rutina --
	PROCEDURE agregarRutina 
	(
		p_cod_rutina IN Tabla_rutinas.cod_rutina%TYPE,
		p_proposito IN Tabla_rutinas.proposito%TYPE,
		p_duracion IN Tabla_rutinas.duracion%TYPE,
		p_ref REF Tipo_Monitor
	);
	PROCEDURE eliminarRutina 
	(
		p_cod_rutina IN Tabla_rutinas.cod_rutina%TYPE
	);
	PROCEDURE ver_rutinas;
END Proyecto;
/
/** FIN CREACIÓN DEL PAQUETE - PROYECTO **/

/** CREACIÓN DEL CUERPO DEL PAQUETE - PROYECTO **/

CREATE OR REPLACE PACKAGE BODY Proyecto AS
	
	-- TABLA CLIENTE --
	/*
		Procedure - aniadir_cliente
		Postcondición: Agregar un cliente a la tabla de Cliente
	*/
	PROCEDURE aniadir_cliente
	(
			p_dni IN Tabla_Clientes.dni_e%TYPE,
			p_nombre IN Tabla_Clientes.nombre%TYPE,
			p_apellidos IN Tabla_Clientes.apellidos%TYPE,
			p_peso IN Tabla_Clientes.peso%TYPE,
			p_suscripcion IN Tabla_Clientes.suscripcion%TYPE,
			p_telfs IN Tabla_Clientes.telfs%TYPE,
			p_direccion IN Tabla_Clientes.direccion%TYPE
	)AS 
	BEGIN
		INSERT INTO Tabla_Clientes
		VALUES (Tipo_Cliente(p_dni,p_nombre,p_apellidos,p_telfs,p_peso,p_direccion,p_suscripcion,NULL)); -- EN principio, el cliente no tiene ningun monitor asignado.
	END aniadir_cliente;

	/*
		Procedure - eliminar_cliente
		Postcondición: Elimina un cliente de la tabla Cliente
	*/
	PROCEDURE eliminar_cliente
	(
		p_dni IN Tabla_Clientes.dni_e%TYPE
	) AS 
	BEGIN
		DELETE FROM Tabla_Clientes P
		WHERE P.dni_e = p_dni;
	END eliminar_cliente;

	/*
		Procedure - ver_clientes
		Postcondición: 	Muestra todos los detalles de los clientes de la tabla Cliente
	*/	
	PROCEDURE ver_clientes AS 

	CURSOR c_cursor IS 
		(SELECT * FROM Tabla_Clientes);
	BEGIN
		FOR r_cursor IN c_cursor LOOP
			DBMS_OUTPUT.PUT_LINE('El nombre del cliente es: '||r_cursor.nombre||' '||r_cursor.apellidos||' y su dni es '||r_cursor.dni_e||'.');
		END LOOP;
	END ver_clientes;

	/*
		Procedure - asignar_rutina_cliente
		Postcondición: 	Asigna una rutina a un cliente
	*/	
	PROCEDURE asignar_rutina_cliente
	(
		p_dni Tabla_Clientes.dni_e%TYPE,
		p_cod_rutina Tabla_Rutinas.cod_rutina%TYPE,
		p_proposito Tabla_Rutinas.proposito%TYPE,
		p_duracion Tabla_Rutinas.duracion%TYPE,
		p_ref_monitor REF Tipo_Monitor
	)
	AS 
		aux REF Tipo_Cliente;
	BEGIN
			SELECT REF(P) INTO aux
			FROM Tabla_Clientes P
			WHERE p_dni = P.dni_e;

			INSERT INTO Tabla_Rutinas -- Los ejercicios se asignan posteriormente a elección propia del cliente en otro procedimiento.
			VALUES (Tipo_Rutina(p_cod_rutina,p_proposito,p_duracion,Tipo_A_E_C(aux),NULL,p_ref_monitor));
			DBMS_OUTPUT.PUT_LINE('Rutina creada y asignada al cliente.');
			
	END asignar_rutina_cliente;

	-- TABLA CLASE COLECTIVA --

	/*
		Procedure - aniadir_clase_colectiva
		Postcondición: Agregar una clase colectiva a la tabla de Clase_Colectiva
	*/
	PROCEDURE aniadir_clase_colectiva
	(
			p_fecha IN Tabla_ClasesColectivas.fecha%TYPE,
			p_duracion IN Tabla_ClasesColectivas.duracion%TYPE,
			p_tipo_clase IN Tabla_ClasesColectivas.tipo_clase%TYPE
	) AS 
	BEGIN
		INSERT INTO Tabla_ClasesColectivas
		VALUES (Tipo_ClaseColectiva(p_fecha,p_duracion,p_tipo_clase,NULL)); -- EN principio, el cliente no tiene ningun monitor asignado.
	END aniadir_clase_colectiva;

	/*
		Procedure - eliminar_clase_colectiva
		Postcondición: Elimina una clase colectiva de la tabla Clase Colectiva
	*/
	PROCEDURE eliminar_clase_colectiva
	(
		p_fecha IN Tabla_ClasesColectivas.fecha%TYPE
	) AS 
	BEGIN
		DELETE FROM Tabla_ClasesColectivas P
		WHERE P.fecha = p_fecha;
	END eliminar_clase_colectiva;

	/*
		Procedure - ver_clases_colectivas
		Postcondición: 	Muestra todos los detalles de las clases colectiva de la tabla Clase Colectiva
	*/
	CREATE OR REPLACE PROCEDURE ver_clases_colectivas AS 
		CURSOR c_cursor IS 
		(SELECT * FROM Tabla_ClasesColectivas);
	BEGIN
		FOR r_cursor IN c_cursor LOOP
			DBMS_OUTPUT.PUT_LINE('La clase colectiva: ' || r_cursor.tipo_clase || ' tiene lugar en el día ' || r_cursor.fecha.dia || ' y la hora ' || r_cursor.fecha.hora || ' y su duracion es ' || r_cursor.duracion || '.');
		END LOOP;
	END ver_clases_colectivas;

	-- TABLA EMPLEADOS --
	/*
		Procedure - aniadir_empleado
		Postcondición: Agregar un empleado a la tabla de Empleados
	*/

	PROCEDURE aniadir_empleado (
		p_cod_emp IN Tabla_Empleados.cod_emp%TYPE,
		p_nombre IN Tabla_Empleados.nombre%TYPE,
		p_apellidos IN Tabla_Empleados.apellidos%TYPE,
		p_sueldo IN Tabla_Empleados.sueldo%TYPE,
		p_jornada_laboral IN Tabla_Empleados.jornada_laboral%TYPE,
		p_direccion IN Tabla_Empleados.direccion%TYPE,
		p_telfs IN Tabla_Empleados.telfs%TYPE,
		p_tipo IN Tabla_Empleados.tipo%TYPE
	) AS 

	BEGIN
	
		IF LOWER(p_tipo) = 'mantenimiento' THEN
	
			INSERT INTO Tabla_Empleados
			VALUES (Tipo_Mantenimiento(p_cod_emp,p_suelo,p_nombre,p_apellidos,p_jornada_laboral,p_direccion,p_telfs,p_tipo,NULL));
		
		END IF;
	
		IF LOWER(p_tipo) = 'jefe' THEN
	
			INSERT INTO Tabla_Empleados
			VALUES (Tipo_Jefe(p_cod_emp,p_suelo,p_nombre,p_apellidos,p_jornada_laboral,p_direccion,p_telfs,p_tipo,NULL));
	
		END IF;

		IF LOWER(p_tipo) = 'monitor' THEN
	
			INSERT INTO Tabla_Empleados
			VALUES (Tipo_Monitor(p_cod_emp,p_suelo,p_nombre,p_apellidos,p_jornada_laboral,p_direccion,p_telfs,p_tipo,NULL));
	
		END IF;
	
	END aniadir_empleado;

	/*
		Procedure - eliminar_empleado
		Postcondición: Elimina un empleado de la tabla de Empleados
	*/
	PROCEDURE eliminar_empleado (
		p_cod IN Tabla_Empleados.cod_emp%TYPE,
		p_type IN Tabla_Empleados.tipo%TYPE
	) AS 
	
	BEGIN
		
		DELETE FROM Tabla_Empleados P
		WHERE P.cod_emp = p_cod;
	
	END eliminar_empleado;

	/*
		Procedure - ver_empleados
		Postcondición: 	Muestra todos los detalles de los empleados de la tabla Empleados
	*/
	PROCEDURE ver_empleados AS 

	CURSOR c_cursor IS 
		(SELECT * FROM Tabla_Empleados);
	BEGIN
		FOR r_cursor IN c_cursor LOOP
			DBMS_OUTPUT.PUT_LINE('El nombre del cliente es: '||r_cursor.nombre||' '||r_cursor.apellidos||' y su tipo es '||r_cursor.tipo||'.');
		END LOOP;
	END ver_empleados;

	-- TABLA EJERCICIO --
	/* 
		Procedure - agregarEjercicio
		Postcondición: 	Agregar un ejercicio a la tabla Ejercicios
	*/
	PROCEDURE agregarEjercicio (
		p_nombre IN Tabla_Ejercicios.nombre%TYPE,
		p_direccion IN Tabla_Ejercicios.descripcion%TYPE
	) AS

	BEGIN
		INSERT INTO Tabla_Ejercicios VALUES (Tipo_Ejercicio(p_nombre, p_direccion));

	END agregarEjercicio;

	/* 
		Procedure - eliminarEjercicio
		Postcondición: 	Elimina un ejercicio de la tabla Tabla_Ejercicios
	*/
	PROCEDURE eliminarEjercicio (
		p_nombre IN Tabla_Ejercicios.nombre%TYPE
	) AS

	BEGIN

		DELETE FROM Tabla_Ejercicios WHERE nombre = p_nombre;

		EXCEPTION WHEN OTHERS THEN ROLLBACK;

	END eliminarEjercicio;

	/* 
		Procedure - ver_ejercicios
		Postcondición: 	Muestra todos los detalles de los ejercicios de la tabla Ejercicios
	*/
	PROCEDURE ver_ejercicios AS 

	CURSOR c_cursor IS 
		(SELECT * FROM Tabla_Ejercicios);
	BEGIN
		FOR r_cursor IN c_cursor LOOP
			dbms_output.put_line('El nombre del ejercicio es: '||r_cursor.nombre||' y su descripcion es '||r_cursor.descripcion||'.');
		END LOOP;
	END ver_ejercicios;

	-- TABLA RUTINA --
	/* 
		Procedure - agregarRutina
		Postcondición: 	Agrega una rutina de la tabla Tabla_Rutina
	*/
	PROCEDURE agregarRutina (
			p_cod_rutina IN Tabla_rutinas.cod_rutina%TYPE,
			p_proposito IN Tabla_rutinas.proposito%TYPE,
			p_duracion IN Tabla_rutinas.duracion%TYPE,
			p_ref REF Tipo_Monitor
	) AS

	BEGIN

		INSERT INTO Tabla_Rutinas VALUES (Tipo_Rutina(p_cod_rutina, p_proposito, p_duracion, null, null, p_ref));

		EXCEPTION WHEN OTHERS THEN
			RAISE_APPLICATION_ERROR (-20600,'Error: no se ha introducido correctamente la fila.');

	END agregarRutina;

	/* 
		Procedure - eliminarRutina
		Postcondición: 	Elimina una rutina de la tabla Tabla_Rutina
	*/
	PROCEDURE eliminarRutina (
		p_cod_rutina IN Tabla_rutinas.cod_rutina%TYPE
	) AS

	BEGIN

		DELETE FROM Tabla_Rutinas WHERE cod_rutina = p_cod_rutina;

		EXCEPTION WHEN OTHERS THEN ROLLBACK;

	END eliminarRutina;

	/* 
		Procedure - ver_rutinas
		Postcondición: 	Muestra todos los detalles de las rutinas de la tabla Rutinas
	*/
	PROCEDURE ver_rutinas AS 

	CURSOR c_cursor IS 
		(SELECT * FROM Tabla_rutinas);

	BEGIN
		FOR r_cursor IN c_cursor LOOP
			dbms_output.put_line('El código de la rutina es: '||r_cursor.cod_rutina||', cuyo propósito es ' || r_cursor.proposito ||' y su duración es de '||r_cursor.duracion||' días.');
		END LOOP;

	END ver_rutinas;

	-- TABLA EQUIPO --
	/* 
		Procedure - agregarEquipo
		Postcondición: 	Agrega un equipo de la tabla Tabla_Equipo
	*/
	PROCEDURE agregarEquipo (
		p_cod_equipo IN Tabla_Equipo.cod_equipo %TYPE,
		p_coste IN Tabla_Equipo.coste %TYPE
	) AS

	BEGIN

		INSERT INTO Tabla_Equipo VALUES (Tipo_Equipo(p_cod_equipo,p_coste,null));

		EXCEPTION WHEN OTHERS THEN
			RAISE_APPLICATION_ERROR (-20600,'Error: no se ha introducido correctamente la fila.');

	END agregarEquipo;

	/* 
		Procedure - eliminarEquipo
		Postcondición: 	Elimina un equipo de la tabla Tabla_Equipo
	*/
	PROCEDURE eliminarEquipo (
		p_cod_equipo IN Tabla_Equipo.cod_equipo%TYPE
	) AS

	BEGIN

		DELETE FROM Tabla_Equipo WHERE cod_equipo = p_cod_equipo;

		EXCEPTION WHEN OTHERS THEN ROLLBACK;

	END eliminarEquipo;

	/* 
		Procedure - ver_equipos
		Postcondición: 	Muestra todos los detalles de los equipos de la tabla Equipos
	*/
	PROCEDURE ver_equipos AS 

	CURSOR c_cursor IS 
		(SELECT * FROM Tabla_equipos);

	BEGIN
		FOR r_cursor IN c_cursor LOOP
			dbms_output.put_line('El código del equipo es: '||r_cursor.cod_equipo||', cuyo coste es ' || r_cursor.coste || ' en euros.');
		END LOOP;

	END ver_equipos;

END;
/
/** FIN CREACIÓN DEL PAQUETE - PROYECTO **/

/** Bloque PL/SQL anónimo **/

BEGIN
	Proyecto.agregarEjercicio('Ejer_5','pepe');
END;
/