# Ejercicios de Modelo conceptual E/R
1. Realizar el diseño de una base de datos para una compañía de seguros de coches cuyos clientes poseen uno o más vehículos. Cada coche tiene un número de cero a cualquier valor que almacena el números de partes de accidentes.

![](http://i.imgur.com/1nqtdkC.png)

2. Se necesita diseñar una base de datos para un centro de enseñanza que contenga información sobre los alumnos, las asignaturas y las calificaciones que se obtienen en cada una de las mismas.
```
Se supone que los nombres de convocatorias son únicos: septiembre-2016, febrero-2017, junio-2017, etc
```

![](http://i.imgur.com/ytGHqyS.png)

4. Se desea diseñar una base de datos para la Universidad que contenga información sobre los Alumnos, las Asignaturas y los Profesores, teniendo en cuenta las siguientes restricciones:
- Una asignatura puede estar impartida por muchos profesores ya que pueden existir diferentes grupos.
- Un profesor puede dar clases de muchas asignaturas.
- Un alumno puede estar matriculado en muchas asignaturas.
- Se necesita tener constancia de las asignaturas en las que está matriculado un alumno, la nota obtenida y el profesor que le ha evaluado.
- También es necesario tener constancia de las asignaturas que imparten todos los profesores (independientemente de si tienen algún alumno matriculado en su grupo).
- No existen dos asignaturas distintas con el mismo nombre.
- A un alumno matriculado de una asignatura solamente le puede dar clase un profesor.

```
Faltaría añadir en la relación matricula un atributo "nota" 
```

![](http://i.imgur.com/dzO3B9v.png)

5. Se desea diseñar una base de datos para una sucursal bancaria que contenga información sobre los Clientes, las Cuentas, las Sucursales y las Transacciones producidas,
teniendo en cuenta las siguientes restricciones:
- Una transacción viene determinada por su número de transacción, la fecha en que se realizó y la cantidad.
- Un cliente puede tener muchas cuentas.
- Una cuenta puede pertenecer a varios clientes.
- Una cuenta solamente puede estar asignada en una sucursal.

![](http://i.imgur.com/LbMqD8w.png)
![](http://i.imgur.com/0E5bI7a.png)

```
Faltaría poner atributos a las diferentes entidades pero las he omitido para no sobrecargar el diagrama. 
El único atributo marcado es la de fecha (h/m/s - d/m/a) en la relación "venta". Ésto condiciona la relación de 
las entidades que intervienen, si omitiera dicho atributo la relación pasaría a ser M:N:Ñ ya que, por parejas, 
una clienta puede comprar un tipo de producto a muchas vendedoras (en momentos diferentes), una vendedora puede 
vender un tipo de producto a muchas clientas (al igual que antes, en momentos diferentes) y una clienta le puede 
comprar a una vendedora muchos productos diferentes. (Lo mismo.) Al añadir el atributo fecha a la relación una 
clienta puede comprar un tipo de producto en una fecha concreta sólo a una vendedora (igual con las otras) y 
como en el ejercicio nos piden que sólo un producto por venta por eso añadimos dicho atributo.
Por otra parte existe la entidad "trabajadoras" que contendrá los diferentes atributos que heredarán tanto gerente, como jefas como vendedoras. (Las tres, por tanto, se encuentran al mismo nivel.) Sin embargo pongo una relación diferente entre gerente y departamento ya que es una de las restricciones que nos da el enunciado del ejercicio.
Y por último en la relación departamento-gerente he marcado una participación total de éste último ya que entiendo que toda persona con el cargo de gerente pertenece siempre a un departamento, en ningún momento habrá un gerente que no esté asignado a un departamento ya que aunque dicho cargo lo ostenta una persona va asociado con el departamento, es decir, puede ser que en cierto momento un departamento no tenga gerente alguno pero todo gerente pertenecerá siempre a un departamento.
```
