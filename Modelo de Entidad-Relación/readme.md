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

5. Se desea diseñar una base de datos para una sucursal bancaria que contenga información sobre los Clientes, las Cuentas, las Sucursales y las Transacciones producidas, teniendo en cuenta las siguientes restricciones:
- Una transacción viene determinada por su número de transacción, la fecha en que se realizó y la cantidad.
- Un cliente puede tener muchas cuentas.
- Una cuenta puede pertenecer a varios clientes.
- Una cuenta solamente puede estar asignada en una sucursal

6. Se desea diseñar una base de datos para una sucursal bancaria que contenga información sobre los Clientes, las Cuentas, las Sucursales y las Transacciones producidas,
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
Por otra parte existe la entidad "trabajadoras" que contendrá los diferentes atributos que heredarán tanto 
gerente, como jefas como vendedoras. (Las tres, por tanto, se encuentran al mismo nivel.) 
Sin embargo pongo una relación diferente entre gerente y departamento ya que es una de las restricciones 
que nos da el enunciado del ejercicio. Y por último en la relación departamento-gerente he marcado una 
participación total de éste último ya que entiendo que toda persona con el cargo de gerente pertenece 
siempre a un departamento, en ningún momento habrá un gerente que no esté asignado a un departamento 
ya que aunque dicho cargo lo ostenta una persona va asociado con el departamento, es decir, puede ser que en
cierto momento un departamento no tenga gerente alguno pero todo gerente pertenecerá siempre a un departamento.
```
8. Deseamos diseñar una base de datos que recoja la organización de una universidad. Se considera que:
- Los departamentos pueden estar en una sola facultad o ser interfacultativos, agrupando en este caso áreas de conocimiento.
- Un área de conocimiento se encuentra en un único departamento.
- Un profesor está siempre asignado a una única área de conocimiento, pudiendo cambiar de área en cualquier momento; interesa la fecha en que un profesor se adscribe a un área de conocimiento.
- Todo departamento tendrá una o varias área de conocimiento.

9. Se desea diseñar una base de datos que contenga la información relativa a las carreteras de un determinado país, sabiendo que:
- En dicho país las carreteras se encuentran divididas en tramos.
- Un tramo siempre pertenece a una única carretera y no puede cambiar de carretera.
- Un tramo puede pasar por varios términos municipales, siendo un dato de interés el kilómetro del tramo por el que entra en dicho término municipal y el kilómetro por el que sale.
- Existen una serie de áreas en las que se agrupan los tramos y cada uno de ellos no puede pertenecer a más de un área.

10. Se desea diseñar una base de datos para una agencia de viajes que, para ofrecer mejor servicio a sus clientes, considera de interés tener registrada la información referente a los diferentes tour que puede ofrecer. Tenemos que tener en cuenta lo siguiente:
- Un tour, según su finalidad, cultural, histórica, deportiva . . . , tiene unos determinados puntos de ruta y puede repetirse varias veces en un año.
- Definimos por viaje un tour concreto a realizar a partir de una fecha determinada.
- Los puntos de ruta de un tour pueden ser ciudades, monumentos, zonas geográficas, etc., y se consideran de visita solamente o de visita y estancia. En este último caso el punto de ruta tiene asignado uno o varios hoteles.
- Entendemos por cliente de un viaje a la persona que ha decidido hacerlo y ha hecho efectiva una señal.
- Un cliente puede confirmar su participación en más de un viaje (se sobreentiende que las fechas son diferentes).
- Las personas que participan en un viaje pueden ser alojadas en los mismos o en diferentes hoteles.

![](http://i.imgur.com/ZXq4qma.png)

11. La base de datos Empresa se ocupa de los empleados, departamentos y proyectos de una empresa. Vamos a suponer que una vez concluida la fase de obtención y análisis de requisitos, los diseñadores de la base de datos redactaron la siguiente descripción del minimundo, la parte de la empresa que se representará en la base de datos 2:
- La empresa está organizada en departamentos. Cada departamento tiene un nombre único, un número único y un cierto empleado que lo dirige. Nos interesa la fecha en que dicho empleado comenzó a dirigir el departamento. Un departamento puede estar distribuido en varios lugares.
- Cada departamento controla un cierto número de proyectos, cada uno de los cuales tiene un nombre y un número únicos, y se efectúa en un solo lugar.
- Almacenaremos el nombre, número de la seguridad social 3, dirección, salario, sexo y fecha de nacimiento de cada empleado. Todo empleado está asignado a un departamento, pero puede trabajar en varios proyectos, que no necesariamente estarán controlados por el mismo departamento. Nos interesa el número de horas por semana que un empleado trabaja en cada proyecto, y también quién es el supervisor directo de cada empleado.
- Queremos mantenernos al tanto de los familiares de cada empleado para administrar sus seguros. De cada familiar almacenaremos el nombre, sexo, fecha de nacimiento y parentesco con el empleado.

14. Se desea diseñar una base de datos para una agencia matrimonial, que contenga información de las personas, tanto hombres como mujeres, que desean casarse, empleados (divididos en tres categorías socios, directores y administrativos), citas realizadas, donde debe constar, además de los nombres de las personas de la cita, la fecha y el director que la promovió, y los matrimonios celebrados. Debemos tener en cuenta que:
- Una persona puede tener cita con diferentes personas.
- Una persona puede casarse con varias personas pero no puede estar casado con más de una en la misma fecha.
- Sólo los directores pueden promover citas
- Un socio tiene a su cargo varios directores y éstos a su vez a varios administrativos.

### Ejercicio examen de Febrero 2017

1. El Centro de Salud “Puerta de la Sal” desea generar un banco de datos para conservar el histórico de todos los pacientes que han ingresado. El Centro de Salud se divide en varias unidades médicas, cada una de las cuales tiene un código único, un nombre y la planta en la que se sitúa dentro del edificio del Centro de Salud. Cada unidad tiene un médico responsable. El personal lo forman médicos y enfermeros, de los que se desea almacenar sus datos principales como son el código, nombre y especialidad. A todo paciente que llega al Centro de Salud se le ingresa en una unidad y se registran sus datos personales, como son número de la Seguridad Social, nombre, fecha de nacimiento y fecha de ingreso. Durante todo el periodo que un paciente está ingresado, los médicos les realizan diferentes intervenciones. De cada una de estas intervenciones se almacenarán los siguientes datos: síntoma observado, tratamiento prescrito y fecha. De cada revisión que haga un enfermero se almacenará fecha y tratamiento. En todo momento se necesita saber los datos de cualquier persona que trabaja en el Centro de Salud, los datos personales y clínicos de los pacientes que han sido ingresados alguna vez o estén ingresados en este momento. Contestar, justificando las respuestas, a las siguientes preguntas:
- Descripción de todos los atributos necesarios para generar esta bases de datos (0,5 puntos).
- Diseño conceptual utilizando el modelo Entidad-Relación extendido (1 punto).
- Estudio de las dependencias funcionales existentes (1 punto).
- Obtención del correspondiente diseño lógico para esta base de datos, utilizando el proceso de normalización y detallando cada uno de sus pasos (2 puntos).

![](http://i.imgur.com/qtrY7WP.png)

Se puede entender que:
* Hay completitud total en la especialización (es decir, consideramos que el personal es necesariamente médico o enfermero). Se pondría una línea doble de "Persona" al círculo de la "d"
* No se limita que los médicos sean responsables de una Unidad como máximo (en un hospital pequeño, un médico con varias especialidades podría ser responsable de N unidades)
* La relación "Trabaja en" no se explicita en el enunciado , por lo que no tiene porqué ponerse.
* Hay quien considera que las revisiones de los enfermeros son consecuencia de los tratamientos que indican los médicos. En ese caso se complicaría el modelo con una entidad "Tratamiento" que estaría relacionada con "Revisa" y con "Interviene"

Añadir
* falta doble raya entre unidad médica y "responsable de" (para obligar a que 
* fecha alta en "ingresa en" para saber a quien ha salido (y quien no)



