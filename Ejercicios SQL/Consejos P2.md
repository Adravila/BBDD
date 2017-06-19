## Notas del uso de la orden SELECT:
- Las cláusulas select y from son obligatorias en cada consulta SQL.
- La cláusula from deberá ir a continuación de la cláusula select.
- No es necesario seleccionar o proyectar todas las columnas de una tabla.
- Las columnas se muestran de izquierda a derecha en el orden especificado en la cláusula select.
- Si queremos proyectar todas las columnas de una tabla usaremos el asterisco (*) yéstas aparecerán en el mismo orden en que fueron creadas.
- Las filas se muestran en el orden en que están almacenadas.
- Los usuarios pueden obtener información de sus propias tablas, o bien de aquellas a las que se les haya dado permiso de acceso.
- Las cláusulas select y from aparecerán precediendo a cualquier otra cláusula.

## Notas sobre el empleo de la cláusula WHERE:
- Las columnas especificadas en la cláusula where deberán ser parte de la tabla especicada en la cláusula from.
- Las columnas utilizadas en la cláusula where no tienen que estar necesariamente en la lista de la orden select.
- Las comparaciones de series de caracteres en la cláusula where requieren que éstas estén acotadas entre comillas simples, en las comparaciones numéricas no es necesario.
- La cláusula where deberá especificar los mismos caracteres, mayúsculas o minúsculas, que hubiera en las tablas de la base de datos.

## Notas sobre el empleo de la clasificación de fila ORDER BY:
- La cláusula order by deberá ser la última cláusula en aparecer en la consulta SQL.
- Esta cláusula es el único sistema existente para ordenar los datos según el criterio que se desee, ya que las tablas almacenan las las conforme éstas han sido introducidas.
- La cláusula order by únicamente clasifica las filas obtenidas en la consulta.
- Por omisión, la secuencia será ascendente.
- Para ordenaciones descendentes se deberá especificar explícitamente.
- Puede mezclarse ordenaciones ascendentes y descendentes en la misma cláusula order by.
- Puede clasificarse por columnas que no formen parte de la consulta, siempre que formen parte de alguna de las tablas especicadas en la cláusula from.
- La secuencia de las columnas especificadas en la cláusula order by determina la secuencia de las claves de clasicación, esto es, los valores de una columna serán clasicados con valores iguales de las columnas precedentes, y así sucesivamente.
- Las columnas con valores nulos (null) se evaluarán al final de todas si el orden es asc y al principio si son desc.
