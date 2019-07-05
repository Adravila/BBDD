/* Autor: Adrián Dávila Guerra 
*  Práctica 3.1

	Procedure - aplicarDescuentos
	Precondición:  	Número de alumnnos 
	Postcondición: 	Modifica el precio de los cursos en los que se 
				    tengan matriculados en cada edición un mínimo de n alumnos
*/

CREATE OR REPLACE PROCEDURE aplicarDescuentos (n_Alumnos NUMBER) AS

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
/