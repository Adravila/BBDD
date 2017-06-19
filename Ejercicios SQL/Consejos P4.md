## Devolución de múltiples filas
- La consulta anidada debe incluirse en una cláusula where que tenga un operador de lista (in) o uno de los operadores all (todos) o any (al menos uno).
- Ciertas subconsultas pueden retornar una lista de valores, en tales consultas deberá usarse el operador in o not in para unir la consulta del primer nivel con la lista de valores obtenidos por la subconsulta.
- El operador de comparación ' = ' es más eficiente cuando se conoce que la subconsulta devolverá una única fila. Esto ocurre siempre que utilicemos este operador con la clave primaria de una tabla.

## Devolución de múltiples columnas
Puede darse también el caso de que las subconsultas devuelvan más de una columna.
En tales subconsultas, el orden de las columnas expresadas en la cláusula where de la
consulta de primer nivel, deberá corresponder al orden de columnas seleccionadas por la
consulta de nivel inferior. Las columnas de la cláusula where del nivel superior deberán
estar situadas entre paréntesis.

Formato:
    WHERE (nom_columna1, nom_columna2)
    operador (consulta anidada)

## Operadores ALL y ANY
El operador any comprueba que al menos una columna de la tabla de la consulta principal cumpla la condición de la consulta anidada para que sea verdadero el criterio de selección de la cláusula where.
El operador all comprueba que la condición de la consulta anidada se cumpla para todas las tuplas de la consulta anidada y así el criterio de la cláusula where será verdadero.
- Con el operador all la condición se cumple si la comparación se verifica para todos los valores invocados por la consulta anidada.
- Con el operador any la condición se cumple si la comparación se verifica para uno al menos de los valores invocados por la consulta anidada.
- El empleo de any y/o all es bastante delicado y puede llevar fácilmente a cometer errores. Es preferible emplear en su lugar consultas que hagan uso de funciones sobre los grupos o sobre las consultas de existencia.
- El operador IN es equivalente a '= any'.
- El operador NOT IN es equivalente a '!= all' o '<>all'.

## Operador EXISTS
El operador existencial exists se emplea para realizar consultas de existencia, consultas
en que necesitemos utilizar el cuantificador universal 'para todo' o la operación de
división del álgebra relacional.
