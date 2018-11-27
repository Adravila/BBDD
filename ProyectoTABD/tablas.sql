SET SERVEROUTPUT ON;

/*TABLA CLASES COLECTIVAS.*/

CREATE TABLE Tabla_ClasesColectivas OF Tipo_ClaseColectiva
(
	CONSTRAINT PK_Tabla_ClasesColectivas
	PRIMARY KEY (fecha.dia, fecha.hora),
	duracion NOT NULL,
	tipo_clase NOT NULL
)
	PCTFREE 60
	PCTUSED 40
	STORAGE( INITIAL 50000
		NEXT 50000
		PCTINCREASE 0
	)
NESTED TABLE utiliza STORE AS EquipoUtilizados;

/*TABLA EQUIPO.*/

CREATE TABLE Tabla_Equipo OF Tipo_Equipo
(
	CONSTRAINT PK_Tabla_Equipo
	PRIMARY KEY (cod_equipo),
	coste NOT NULL
)
	PCTFREE 90
	PCTUSED 10
	STORAGE( INITIAL 80K
		NEXT 80K
		PCTINCREASE 0
	)NESTED TABLE usan STORE AS Clientes_equipados;

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
	PCTFREE 60
	PCTUSED 40
	STORAGE( INITIAL 100K
		NEXT 80K
		PCTINCREASE 0
	) NESTED TABLE tiene_asignada STORE AS Rutinas_asignadas;

/*TABLA EJERCICIOS.*/

CREATE TABLE Tabla_Ejercicios OF Tipo_Ejercicio
(
	CONSTRAINT PK_Tabla_Ejercicios
	PRIMARY KEY (nombre),
	descripcion NOT NULL
)
	PCTFREE 80
	PCTUSED 20
	STORAGE( INITIAL 80K
		NEXT 50K
		PCTINCREASE 0
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
	PCTFREE 60
	PCTUSED 40
	STORAGE( INITIAL 100K
		NEXT 80K
		PCTINCREASE 0
	)
NESTED TABLE contienen STORE AS Ejercicios_de_la_rutina,
NESTED TABLE tiene_asignada STORE AS Clientes_con_rutinas;

/*TABLA EMPLEADOS.*/

CREATE TABLE Tabla_Monitor OF Tipo_Monitor
(
CONSTRAINT PK_Tabla_Monitor
	PRIMARY KEY (cod_emp),
	sueldo NOT NULL,
	jornada_laboral NOT NULL,
	nombre NOT NULL,
	apellidos NOT NULL,
	tipo NOT NULL
)
	PCTFREE 60
	PCTUSED 40
	STORAGE( INITIAL 50K
		NEXT 50K
		PCTINCREASE 0
	)
NESTED TABLE da_clase STORE AS Clases_del_monitor,
NESTED TABLE asigna STORE AS Rutinas_asignadas_monitor;


CREATE TABLE Tabla_Mantenimiento OF Tipo_Mantenimiento
(
CONSTRAINT PK_Tabla_Mantenimiento
	PRIMARY KEY (cod_emp),
	sueldo NOT NULL,
	jornada_laboral NOT NULL,
	nombre NOT NULL,
	apellidos NOT NULL,
	tipo NOT NULL
)
	PCTFREE 60
	PCTUSED 40
	STORAGE( INITIAL 50K
		NEXT 50K
		PCTINCREASE 0
	)NESTED TABLE mantiene STORE AS Equipos_mantenidos_empleado;

CREATE TABLE Tabla_Jefe OF Tipo_Jefe
(
CONSTRAINT PK_Tabla_Jefe
	PRIMARY KEY (cod_emp),
	sueldo NOT NULL,
	jornada_laboral NOT NULL,
	nombre NOT NULL,
	apellidos NOT NULL,
	tipo NOT NULL
)
	PCTFREE 60
	PCTUSED 40
	STORAGE( INITIAL 50K
		NEXT 50K
		PCTINCREASE 0
	)
NESTED TABLE supervisa_m STORE AS Monitores_supervisados,
NESTED TABLE supervisa_ma STORE AS Empleados_man_super;

/*SCOPES FOR.*/

ALTER TABLE Clientes_equipados 
    ADD (SCOPE FOR (column_value) IS Tabla_Clientes) -- SCOPE FOR.
/
ALTER TABLE Ejercicios_de_la_rutina 
     ADD (SCOPE FOR (contiene) IS Tabla_Ejercicios)-- SCOPE FOR.
/
ALTER TABLE EquipoUtilizados 
	ADD (SCOPE FOR (column_value) IS Tabla_Equipo) -- SCOPE FOR.
/
