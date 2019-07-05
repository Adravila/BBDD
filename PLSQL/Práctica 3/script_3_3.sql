/* Autor: Adrián Dávila Guerra 
*  Práctica 3.3
*/

SET SERVEROUTPUT ON

/** CREACIÓN DEL PAQUETE - PRÁCTICA 3.3 
	Procedure - aplicarDescuentos
	Precondición:  	Número de alumnnos 
	Postcondición: 	Modifica el precio de los cursos en los que se 
				    tengan matriculados en cada edición un mínimo de n alumnos

	Function - mostrarInformacion (NUMBER) 
	Precondición: 	Código de la edición y el código del curso
	Postcondición: 	Devuelve el número de alumnos que hay matriculados en una edición e de un curso c.
**/

CREATE OR REPLACE PACKAGE Practica3 AS
	PROCEDURE aplicarDescuentos (n_Alumnos NUMBER);
	FUNCTION numeroAlumnos (e NUMBER, c NUMBER) RETURN NUMBER;
END;
/
/** FIN CREACIÓN DEL PAQUETE - PRÁCTICA 3.3 **/

/** CREACIÓN DEL CUERPO DEL PAQUETE - PRÁCTICA 3.3 **/

CREATE OR REPLACE PACKAGE BODY Practica3 AS
	/** Procedure - aplicarDescuentos **/
	PROCEDURE aplicarDescuentos (n_Alumnos NUMBER) AS

	v_precio NUMBER(5);

	CURSOR c_cursos IS 
		SELECT * FROM Cursos WHERE cod_curso IN(
			SELECT distinct(cod_curso) 
			FROM matricula 
			GROUP BY cod_curso, cod_edicion 
			HAVING count(*) >= n_Alumnos
		)
	FOR UPDATE OF precio, descuento, descripcion;

	BEGIN
		FOR v_cursos IN c_cursos LOOP
			SELECT precio - precio *(descuento/100) INTO v_precio FROM cursos WHERE cod_curso = v_cursos.cod_curso;
			UPDATE Cursos SET 
				precio = v_precio, 
				descuento = 0,
				descripcion = 'Curso de ' || nombre || ' - Descuento aplicado.'
			WHERE CURRENT OF c_cursos;
		END LOOP;
	END aplicarDescuentos;

	/** Function - numeroAlumnos (NUMBER) **/
	FUNCTION numeroAlumnos (e NUMBER, c NUMBER) RETURN NUMBER AS
	
	n_alumnos NUMBER;
	
	BEGIN
		SELECT count(*) INTO n_alumnos
		FROM Matricula 
		WHERE cod_edicion = e AND cod_curso = c;

		return n_alumnos;

	END numeroAlumnos;
END;
/
/** FIN CREACIÓN DEL PAQUETE - PRÁCTICA 3.3 **/

/** Bloque PL/SQL anónimo **/
DECLARE
	n_Alumnos_ NUMBER(5);
	cod_edicion_ NUMBER(5);
	cod_curso_ NUMBER(5);
BEGIN
	n_Alumnos_ := &n_Alumnos;
	cod_edicion_ := &cod_edicion;
	cod_curso_ := &cod_curso;

	DBMS_OUTPUT.PUT_LINE(CHR(8)); -- Retorno de carro
	DBMS_OUTPUT.PUT_LINE('Llamando al procedimiento aplicarDescuentos('|| n_Alumnos_ ||')');
	DBMS_OUTPUT.PUT_LINE('Llamando a la funcion mostrarInformacion('|| cod_edicion_ ||', '|| cod_curso_ ||')');
	Practica3.aplicarDescuentos(n_Alumnos_);
	DBMS_OUTPUT.putline('Numero de alumnos : ' || Practica3.numeroAlumnos(cod_edicion_, cod_curso_));
END;
/