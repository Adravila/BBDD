## Producto cartesiano
La operación de 'producto cartesiano' une cada la de una tabla con cada una de las las de la otra tabla.

## Producto natural
Esta operación se realizará sobre las columnas que contienen la misma información en tablas distintas ya que si esto no lo tenemos en cuenta, lo que realizaremos es un 'producto cartesiano' con las consecuencias de pérdida de información, información redundante e inconsistencia de los datos.

## Búsquedas multitabla:
- Las tablas que van a formar parte de un producto natural se especifican en la cláusula from.
- La cláusula where especifica los criterios para unir las tablas, así como el de selección de los registros.
- Las columnas que se quieren proyectar de una u otra tabla irán en la cláusula select.
- Puede utilizarse la expresión nom_tabla.* para obtener todas las columnas de una tabla en los productos cartesiano y natural.
- Las columnas con igual nombre en ambas tablas deberán llevar un prefijo con el nombre de la tabla a la que pertenece, o bien un 'alias', separado por un punto.
- Si los nombres de las columnas son únicos en todas las tablas del producto, no será necesario usar como prefijo el nombre de su tabla.
- Pueden realizarse tantos productos sobre tablas como se desee.
- El 'criterio de correspondencia'para las tablas se denomina predicado de unión o criterio de unión.
- Pueden utilizarse más de un par de columnas para especificar la condición de unión entre dos tablas cualquiera.
- Cuando se quiere realizar el producto natural entre n tablas, es necesario tener al menos n-1 condiciones de unión para evitar productos cartesianos.

## Unión externa:
Esta unión, también llamada outer-joins, permite resolver problemas del siguiente tipo:
se desea obtener una lista de filas en función de un criterio que es función de la unión
con otra tabla, si la condición de unión no se cumple, la fila normalmente no aparece en
el resultado. Pues bien, para visualizar todas las filas, incluidas las que no cumplen este
criterio, es preciso realizar una unión 'externa'.

En Oracle una unión 'externa' se identifica mediante la presencia del símbolo (+) en la cláusula where, después del nombre de la columna donde pueden no darse valores
determinados.

## Autouniones:
  A veces queremos realizar una unión entre dos tablas que no son distintas, es decir, las
dos tablas que queremos unir son, en realidad, la misma tabla. Esto se produce cuando
el criterio de unión afecta al valor de una columna en relación al valor de esta misma
columna en otra fila de la misma tabla. Una tabla puede estar unida dentro de sí misma
en columnas que contengan el mismo tipo de información. Una autounión une filas de una
tabla con ella misma o con otras filas en la misma tabla.

Cuando realizamos este tipo de unión es necesario utilizar 'alias' pues tenemos que
diferenciar cuando estamos haciendo referencia a una tabla y cuando hacemos referencia
a la otra tabla, sabiendo que las dos tablas son la misma.

### Resumen:
- Una tabla puede unirse consigo misma como si fueran dos tablas separadas.
- La autounión es útil para unir una fila de una tabla con otra de la misma tabla.
- Al igual que en cualquier otra unión, la unión se realiza entre columnas que contienen el mismo tipo de información.
- A la tabla se deberá asignar un 'alias' para sincronizar qué columnas van a ser obtenidas de la tabla.

## Consejos prácticos para escribir una consulta:
- Determinar las tablas que han de participar, e incluirlas en la cláusula from.
- Decidir qué columnas se desean visualizar o proyectar y su orden de aparición para incluirlas en la cláusula select.
- Si la cláusula select conlleva funciones sobre grupos, será necesario una cláusula group by que agrupe todas las columnas citadas en la cláusula select, salvo las funciones en cuestión.
- Determinar las condiciones de selección que limitan la consulta. Las condiciones con proyección sobre grupos deben figurar en una cláusula having; las que se refieren a valores individuales, aparecerán en una cláusula where.
- Cuando se tenga que emplear una función sobre grupos en una cláusula where, o cuando haya necesidad de un valor de una columna de otra tabla distinta, hay que realizar una consulta anidada
- Para fusionar los resultados procedentes de dos cláusulas select, basta con emplear el operador union.
- Hay que precisar el orden de aparición de las filas del resultado de una consulta con una cláusula order by.
- Los posibles 'alias' que demos a las columnas, deberán estar en la primera consulta cuando usamos los operadores conjuntistas.

## Empleo del cuantificador existencial
Recordemos que la expresión "exists (select * from ...)" es un predicado que vale
verdadero (true) si la consulta tiene resultado no vacío. Por lo tanto, una fila de la consulta
exterior forma parte del resultado "si existe" en la tabla interior "al menos una" fila que
satisface las condiciones de la cláusula where de la subconsulta.

Cuando la expresión está precedida de not, el predicado se evalua como verdadero si no existe ninguna fila de la
tabla interior que satisface las condiciones exigidas.
Examinando las consultas que se pueden hacer a una base de datos, se llega fácilmente
a la conclusión de que toda subconsulta precedida por el operador in puede ser expresada
con el operador exists. Pero lo inverso no es verdad; algunas consultas no pueden
expresarse sino con la ayuda del operador exists.

Como conclusión, el operador in ante una subconsulta puede ser sustituido por exists.
El operador in es, pues, redundante en SQL, si se exceptúa el hecho de que permite expresar
una consulta de manera conjuntista, algo que algunos usuarios prefieren en lugar
del enfoque predicativo de exists. El operador in a veces es necesario, porque los optimizadores
no son perfectos y el tiempo de ejecución de la consulta con exists puede ser
mucho mayor en algunos casos.

Por otra parte, exists es necesario para expresar el cuantificador universal for all,
muy conocido en lógica, pero que no está representado directamente en SQL. En general,
la expresión "para todo" puede formularse con la ayuda de uno o dos not exists.
