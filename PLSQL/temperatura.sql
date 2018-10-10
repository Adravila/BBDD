/* Autor: Adrián Dávila Guerra 
*  Práctica 1.1
*/

SET SERVEROUTPUT ON

DECLARE
	temperatura FLOAT;
	escala CHAR(1);
BEGIN
	temperatura:= &temperatura;
	escala:= '&escala';
	
	IF escala = 'C' THEN
		DBMS_OUTPUT.PUT_LINE('Mostrando temperatura en grados Celsius: ' || (5/9)*(temperatura-32));
	ELSIF escala = 'F' THEN
		DBMS_OUTPUT.PUT_LINE('Mostrando temperatura en grados Fahrenheit: ' || (9/5)*(temperatura-32));
	ELSE
		DBMS_OUTPUT.PUT_LINE('Error - Tienes que introducir C o F');
	END IF;
END;
/
