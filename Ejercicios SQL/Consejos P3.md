## Consultas por grupos y la cláusula GROUP BY
- La cláusula group by reordena la tabla que resulta de una consulta select en un número mínimo de grupos tales que, en el interior de cada uno, la columna especificada tenga el mismo valor para cada fila. Este tratamiento no afecta a la organización física de
la tabla.
- Cuando se emplea una cláusula group by, las funciones de grupo se calculan para cada grupo. Esta cláusula permite, generalmente, la visualización del valor de la columna
común, seguida de aquellos valores de las funciones aplicadas a cada grupo.
- La cláusula group by se utiliza para definir múltiples grupos de filas dentro de una consulta con la orden select.

### Resumen:
- Un grupo se define como las filas que tienen un valor común en una o más columnas. Estas columnas se muestran en la cláusula group by.
- Se devuelve una fila por cada grupo formado. Por ejemplo, si se agrupa por colores, se obtendrá una fila resumen de información por cada uno de los colores diferentes que hubiera.
- Todos los ítems de la lista especificada en la cláusula select deberán ser del mismo nivel de agrupación.
- Las columnas que no aparezcan en la cláusula group by no podrán aparecer en la cláusula select, excepto como argumentos para agrupar funciones.

## La cláusula having
La cláusula having equivale a la cláusula where pero aplicada a grupos. Esta cláusula generalmente no puede emplearse si antes no ha sido especificada la cláusula group by. De
hecho, el criterio especificado en la cláusula having afecta al valor de una función calculada sobre un grupo. La cláusula having se utiliza para restringir los grupos seleccionados en el resultado de la consulta una vez ejecutada ésta con la cláusula group by.
Los grupos que no cumplen el criterio especificado en la cláusula having no se incluyen en el resultado.

## Los valores null y la función nvl
- El valor null es un valor indeterminado; por tanto, los valores nulos no se utilizan
cuando se evalúan expresiones o funciones. Si un valor null se emplea, por ejemplo, en
un cálculo aritmético, el resultado será siempre nulo (null).
- Algunas veces se podría desear sustituir temporalmente el valor nulo por otro valor
sobre todo cuando se realizan cálculos aritméticos. Para sustituir temporalmente el valor
nulo por cualquier otro se deberá usar la función nvl
