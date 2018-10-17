/* Autor: Adravila */

SET SERVEROUTPUT ON

DECLARE
	temperatura FLOAT;
	escala CHAR(1);
BEGIN
	temperatura:= &temperatura;
	escala:= '&escala';
	
	IF escala = 'C' || escala = 'c' THEN
		DBMS_OUTPUT.PUT_LINE('Mostrando temperatura en grados Celsius: ' || (5/9)*(temperatura-32));
	ELSIF escala = 'F' || escala = 'f' THEN
		DBMS_OUTPUT.PUT_LINE('Mostrando temperatura en grados Fahrenheit: ' || (9/5)*(temperatura-32));
	ELSE
		DBMS_OUTPUT.PUT_LINE('Error - Tienes que introducir C o F');
	END IF;
END;
/
