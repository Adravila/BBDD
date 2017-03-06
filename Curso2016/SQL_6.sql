REM 1) Indicar el resultado de 4^3
SELECT power(4,3) FROM DUAL 

REM 2) ¿Cuánto falta para que sea mañana?

SELECT 	('23'-(to_char(sysdate,'hh24'))) AS Horas,
	('59'-(to_char(sysdate,'mi'))) AS Minutos,
	('59'-(to_char(sysdate,'ss'))) AS Segundos
FROM DUAL; 

REM 3) Redondear el número de días que hay entre hoy y mañana.
SELECT 	round(((to_char(sysdate,'hh24'))/'24'))
FROM DUAL;

REM 4) ¿Qué día será dentro de 5 meses y un día?

REM 5) Redondea el resultado de la operación √10.
SELECT round(sqrt(10)) FROM DUAL;

REM 
