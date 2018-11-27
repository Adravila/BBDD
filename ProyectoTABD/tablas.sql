SET SERVEROUTPUT ON;

/*TABLA CLASES COLECTIVAS.*/

CREATE TABLE Tabla_ClasesColectivas OF Tipo_ClaseColectiva
(
	CONSTRAINT PK_Tabla_ClasesColectivas
	PRIMARY KEY (fecha.dia, fecha.hora),
	duracion NOT NULL,
	tipo_clase NOT NULL
)
NESTED TABLE utiliza STORE AS EquipoUtilizados;

/*TABLA EQUIPO.*/

CREATE TABLE Tabla_Equipo OF Tipo_Equipo
(
	CONSTRAINT PK_Tabla_Equipo
	PRIMARY KEY (cod_equipo),
	coste NOT NULL
)
NESTED TABLE usan STORE AS Clientes_equipados;

/*TABLA TABLA CLIENTES.*/


CREATE TABLE Tabla_Clientes OF Tipo_Cliente
(
	CONSTRAINT PK_Tabla_Clientes
	PRIMARY KEY (dni_e),
	nombre NOT NULL,
	apellidos NOT NULL,
	direccion NOT NULL,
	telfs NOT NULL,
	suscripcion NOT NULL
)
NESTED TABLE tiene_asignada STORE AS Rutinas_asignadas;

/*TABLA EJERCICIOS.*/

CREATE TABLE Tabla_Ejercicios OF Tipo_Ejercicio
(
	CONSTRAINT PK_Tabla_Ejercicios
	PRIMARY KEY (nombre),
	descripcion NOT NULL
);

/*TABLA RUTINAS.*/

CREATE TABLE Tabla_Rutinas OF Tipo_Rutina
(
	CONSTRAINT PK_Tabla_Rutinas
	PRIMARY KEY (cod_rutina),
	proposito NOT NULL,
	duracion NOT NULL,
	asigna NOT NULL
)
NESTED TABLE contienen STORE AS Ejercicios_de_la_rutina,
NESTED TABLE tiene_asignada STORE AS Clientes_con_rutinas;

/*TABLA EMPLEADOS.*/

CREATE TABLE Tabla_Empleados OF Tipo_Empleado
(
	CONSTRAINT PK_Tabla_Empleados
	PRIMARY KEY (cod_emp),
	sueldo NOT NULL,
	jornada_laboral NOT NULL,
	nombre NOT NULL,
	apellidos NOT NULL,
	tipo NOT NULL
);

/*SCOPES FOR.*/

ALTER TABLE Clientes_equipados 
    ADD (SCOPE FOR (column_value) IS Tabla_Clientes) -- SCOPE FOR.
ALTER TABLE Ejercicios_de_la_rutina 
     ADD (SCOPE FOR (contiene) IS Tabla_Ejercicios)-- SCOPE FOR.
ALTER TABLE EquipoUtilizados 
	ADD (SCOPE FOR (column_value) IS Tabla_Equipo) -- SCOPE FOR.
/