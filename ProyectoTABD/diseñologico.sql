SET SERVEROUTPUT;

/*CLASES COLECTIVAS.*/
CREATE OR REPLACE TYPE Tipo_Fecha AS
(
	dia	INTEGER, /*Como máximo, el día puede tener 2 dígitos.*/
	hora CHAR(5) /*Sabemos que la hora siempre tendrá 5 caracteres: hh:ss.*/
);
CREATE OR REPLACE TYPE Tipo_ClaseColectiva AS OBJECT
(
	fecha Tipo_Fecha,
	duracion INTEGER, /*En minutos la expresaremos.*/
	tipo_clase VARCHAR(10)
);

CREATE TABLE Tabla_ClasesColectivas OF Tipo_ClaseColectiva
(
	CONTRAINT PK_Tabla_ClasesColectivas
	PRIMARY KEY (fecha),
	duracion NOT NULL,
	tipo_clase NOT NULL
);

/*TABLA EQUIPO.*/

CREATE OR REPLACE TYPE Tipo_Equipo AS OBJECT
(
	cod_equipo INTEGER,
	coste INTEGER
);

CREATE TABLE Tabla_Equipo OF Tipo_Equipo
(
	CONSTRAINT PK_Tabla_Equipo
	PRIMARY KEY (cod_equipo),
	coste NOT NULL
);

/*Tabla de clientes. */

CREATE OR REPLACE TYPE Tipo_Direccion AS OBJECT
(
	calle VARCHAR(10),
	ciudad VARCHAR(10)
);

CREATE OR REPLACE TYPE Tipo_Telfs AS OBJECT
(
	VARRAY(2) OF VARCHAR(9)
);

CREATE OR REPLACE TYPE Tipo_Cliente AS OBJECT
(
	dni_e VARCHAR(9), /*Suponemos que el DNI electrónico tiene 9 caracteres: 8 dígitos y la letra final.*/
	nombre VARCHAR(10),
	apellidos VARCHAR(20),
	telfs Tipo_Telfs,
	peso INTEGER,
	suscripcion INTEGER
);

CREATE TABLE Tabla_Clientes OF Tipo_Cliente
(
	CONSTRAINT PK_Tabla_Clientes
	PRIMARY KEY (dni_e),
	nombre NOT NULL,
	apellidos NOT NULL,
	direccion NOT NULL,
	telfs NOT NULL,
	suscripcion NOT NULL
);

/*TABLA RUTINAS.*/

CREATE OR REPLACE TYPE Tipo_Rutina AS OBJECT
(
	cod_rutina INTEGER,
	coste INTEGER
);

CREATE TABLE Tabla_Rutinas AS OBJECT
(
	CONSTRAINT PK_Tabla_Rutinas
	PRIMARY KEY (cod_equipo),
	coste NOT NULL
);

/*TABLA EMPLEADOS.*/

CREATE OR REPLACE TYPE Tipo_


/