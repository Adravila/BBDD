/* Autor: Adrián Dávila Guerra 
*  Práctica 3.2

Escribe una función PL/SQL que devuelva el número de alumnos que hay matriculados en una edición e de un curso c,
valores que se reciben como parámetros de entrada.

SELECT count(*) FROM Matricula WHERE cod_edicion = e AND cod_curso = c;

Ejemplo:
	SELECT count(*) FROM Matricula WHERE cod_edicion = 1 AND cod_curso = 11111;

	  COUNT(*)
	----------
	         3

A continuación, utiliza esta función para escribir una consulta que devuelva para un curso concreto c, 
su información general y la información de cada edición programada, incluyendo para cada edición
el número total de alumnos matriculados en ella.

	Devuelva esto:
		Informacion general => Nombre, Descripcion, Precio, Descuento
		Información edición => Fecha_Inicio, Fecha_Fin, Lugar
		n_alumnos matriculados
**/

SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION numeroAlumnos(e NUMBER, c NUMBER) RETURN NUMBER AS

	n_alumnos NUMBER;

BEGIN
	SELECT count(*) INTO n_alumnos
	FROM Matricula 
	WHERE cod_edicion = e AND cod_curso = c;

	return n_alumnos;

END numeroAlumnos;
/

/* Segunda parte del problema */

DECLARE
	v_cod_curso NUMBER(5);
	v_cod_edicion NUMBER(5);

	CURSOR c_informacion IS
	SELECT c.cod_curso, e.cod_edicion, c.nombre, c.descripcion, c.precio, e.fecha_inicio, e.fecha_fin, e.lugar, numeroAlumnos(e.cod_edicion,e.cod_curso) AS nAlumnos
	FROM Cursos c, Edicion e
	WHERE c.cod_curso = e.cod_curso AND c.cod_curso =  v_cod_curso;
BEGIN
	v_cod_curso := &cod_curso;
	v_cod_edicion := &cod_edicion;

	FOR v_informacion IN c_informacion LOOP
		DBMS_OUTPUT.PUT_LINE(
				' | Cod curso: ' || v_informacion.cod_curso ||
				' | Cod edicion: ' || v_informacion.cod_edicion ||
				' | Nombre curso: ' || v_informacion.nombre ||
				' | Descripcion: ' || v_informacion.descripcion ||
				' | Precio: ' || v_informacion.precio ||
				' | Fecha inicio: ' ||  v_informacion.fecha_inicio || 
				' | Fecha fin: ' ||  v_informacion.fecha_fin || 
				' | Lugar: ' ||  v_informacion.lugar || 
				' | Numero alumnos: ' || v_informacion.nAlumnos);
	END LOOP;
END;
/