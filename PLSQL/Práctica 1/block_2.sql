/* Autor: Adrián Dávila Guerra 
*  Práctica 1.2
*/

/*
- En el primer bloque realizará la condición de ELSE porque no se puede cumplir la condición v_num > 0 
dado que v_num es nulo y no se puede determinar como condición booleana.
- En el segundo bloque no se podrá realizar ninguna condición como ocurre anteriormente en el primer bloque.
- Si quisieramos tomar v_num que al ser NULL tome por defecto otro valor, como 0, se le añade nvl(v_num,0).
	Si esto ocurriera, entonces en el segundo bloque imprimirá 'v_num is not greater than 0'.
*/

-- Block 2

SET SERVEROUTPUT ON

DECLARE v_num NUMBER := NULL;

BEGIN

 IF v_num > 0 THEN

 DBMS_OUTPUT.PUT_LINE ('v_num is greater than 0');

 END IF; 

 IF NOT (v_num > 0) THEN 

 DBMS_OUTPUT.PUT_LINE ('v_num is not greater than 0');

 END IF;

END; 