SET SERVEROUTPUT ON;

/*Para facilitar la comprensión, se seguirá el orden del diagrama empezando por clases colectivas.*/

/*CLASES COLECTIVAS.*/

CREATE OR REPLACE TYPE Tipo_Fecha AS OBJECT
(
	dia INTEGER, /*Como máximo, el día puede tener 2 dígitos.*/
	hora CHAR(5) /*Sabemos que la hora siempre tendrá 5 caracteres: hh:ss.*/
);

CREATE OR REPLACE TYPE Tipo_Equipo; /*Declaración adelantada de Equipo.*/

CREATE OR REPLACE TYPE Tipo_A_CC_E AS /*Modelado de la asociación "utiliza" de Clasescolectivas a Equipo. Utilizamos tablas anidadas por si en un futuro, se añaden clases colectivas nuevas que utilicen equipo diferente.*/
TABLE OF REF Tipo_Equipo;

CREATE OR REPLACE TYPE Tipo_ClaseColectiva AS OBJECT
(
	fecha Tipo_Fecha,
	duracion INTEGER, /*En minutos la expresaremos.*/
	tipo_clase VARCHAR(10),
	utiliza Tipo_A_CC_E
);

/*TABLA EQUIPO.*/

CREATE OR REPLACE TYPE Tipo_Cliente; /*Declaración adelantada de clientes.*/

CREATE OR REPLACE TYPE Tipo_A_E_C --Asociación Equipo-Clientes.
AS TABLE OF REF Tipo_Cliente;

CREATE OR REPLACE TYPE Tipo_Equipo AS OBJECT
(
	cod_equipo INTEGER,
	coste INTEGER,
	usan Tipo_A_E_C
);

/*TABLA CLIENTES.*/

CREATE OR REPLACE TYPE Tipo_Direccion AS OBJECT
(
	calle VARCHAR(10),
	ciudad VARCHAR(10)
);

CREATE OR REPLACE TYPE Tipo_Telfs AS
	VARRAY(2) OF VARCHAR(9);

CREATE OR REPLACE TYPE Tipo_Rutina; /*Declaración adelantada de Rutina.*/

CREATE OR REPLACE TYPE Tipo_A_C_R /*Tipo Asociación entre Clientes y Rutinas.*/
AS TABLE OF REF Tipo_Rutina;
	
CREATE OR REPLACE TYPE Tipo_Cliente AS OBJECT
(
	dni_e VARCHAR(9), /*Suponemos que el DNI electrónico tiene 9 caracteres: 8 dígitos y la letra final.*/
	nombre VARCHAR(10),
	apellidos VARCHAR(20),
	telfs Tipo_Telfs,
	peso INTEGER,
	direccion Tipo_Direccion,
	suscripcion INTEGER,
	tiene_asignada Tipo_A_C_R
);

/*TABLA EJERCICIOS.*/

CREATE OR REPLACE TYPE Tipo_Ejercicio AS OBJECT
(
	nombre VARCHAR(10),
	descripcion VARCHAR(40)
);

/*TABLA RUTINAS.*/

CREATE OR REPLACE TYPE Tipo_Monitor;

CREATE OR REPLACE TYPE Tipo_R_E AS OBJECT --Creación del tipo que definirá la tabla anidada de la relación contiene entre Rutinas y Ejercicios.
(
	n_series INTEGER,
	n_repeticiones INTEGER,
	contiene REF Tipo_Ejercicio
);

CREATE OR REPLACE TYPE Tipo_R_E_N_T IS TABLE OF Tipo_R_E; --Creación de la tabla anidada Rutinas-Ejercicios-Nested-Table.

CREATE OR REPLACE TYPE Tipo_Rutina AS OBJECT
(
	cod_rutina INTEGER,
	proposito VARCHAR(20),
	duracion INTEGER,
	tiene_asignada Tipo_A_E_C, /*Como nos interesa una tabla anidada de referencias a Tipo_Cliente, podemos escribir dicho tipo aquí.*/
	contienen Tipo_R_E_N_T,
	asigna REF Tipo_Monitor
);

/*TABLA EMPLEADOS.*/

CREATE OR REPLACE TYPE Tipo_JornadaLaboral AS OBJECT
(
	dias INTEGER, /*Días de trabajo a la semana.*/
	horas INTEGER /*Horas al día de trabajo.*/
);

CREATE OR REPLACE TYPE Tipo_Empleado AS OBJECT
(
	cod_emp INTEGER,
	sueldo INTEGER,
	nombre VARCHAR(10),
	apellidos VARCHAR(20),
	jornada_laboral Tipo_JornadaLaboral,
	direccion Tipo_Direccion,
	telfs Tipo_Telfs,
	tipo VARCHAR(13)
)NOT FINAL;

CREATE OR REPLACE TYPE Tipo_A_M_CC AS -- Tipo asociación entre Monitores y Clases colectivas.
TABLE OF REF Tipo_ClaseColectiva;

CREATE OR REPLACE TYPE Tipo_A_J_M AS -- Tipo asociación entre Jefes y Monitores.
TABLE OF REF Tipo_Monitor;

CREATE OR REPLACE TYPE Tipo_Mantenimiento;

CREATE OR REPLACE TYPE Tipo_A_J_Ma AS -- Tipo asociación entre Jefes y Mantenimiento.
TABLE OF REF Tipo_Mantenimiento;

CREATE OR REPLACE TYPE Tipo_A_Ma_E AS -- Tipo asociación entre Mantenimiento y Equipo.
TABLE OF REF Tipo_Equipo;

CREATE TYPE Tipo_Mantenimiento UNDER Tipo_Empleado
(
	mantiene Tipo_A_Ma_E
);

CREATE OR REPLACE TYPE Tipo_Monitor UNDER Tipo_Empleado
(
	da_clase Tipo_A_M_CC,
	asigna Tipo_A_C_R 
);

CREATE OR REPLACE TYPE Tipo_Jefe UNDER Tipo_Empleado
(
	supervisa_m Tipo_A_J_M,
	supervisa_ma Tipo_A_J_Ma
);

/