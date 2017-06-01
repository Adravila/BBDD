# Práctica 1 
1. Generar un entorno de trabajo que tenga las siguientes características:
	- Indicación de la cuenta de Oracle donde estamos trabajando.
	- Desactivación de las pausas.
	- Contenido por página no superior a 20 líneas.
	- El pie de página ha de llevar nuestro nombre completo, login del SO y el login de Oracle, cada uno en una línea distinta.
	- Mostrar el esquema de una tabla o de una vista que le indiquemos por pantalla.
	
	```SQL
	SHOW release
	set pause off
	set lines 20
	btitle skip USER.SQL skip "Adrián Dávila Guerra"
	describe tiendas
	```

2. Generar un entorno de trabajo que tenga las siguientes características:
	- Las columnas de la tabla clientes tengan un ancho máximo de 10 caracteres.
	- Ancho de línea de 75 caracteres.
	- Contenido por página no superior a 20 líneas.
	- Indicar el nombre del usuario.
	- Mostrar por pantalla los valores anteriores y posteriores de las variables del sistema.
	
	```SQL
	column clt_num format 10
	column clt_apell format a10
	column clt_nom format a10
	column clt_pais format a10
	column clt_pob format a10

	set lines 75
	set pages 20
	SHOW user
	SHOW all
	```

3. Generar un entorno de trabajo que tenga las siguientes características:
	- Mostrar el contenido de una tabla que le indiquemos.
	- Páginas no superior a 20 líneas.
	- Versión actual de Oracle .
	- Mostrar por pantalla los valores anteriores y posteriores de las variables del sistema.
	- Nombre completo del usuario a pie de página.
	
	
	```SQL
	describe tiendas
	set pages 20
	ttitle SQL.RELEASE skip
	SHOW all
	btitle "Adrian Davila Guerra"
	```

4. Se desea tener un entorno de trabajo fijo para todas las sesiones de la siguiente manera:
	- El indicativo del sistema que nos aparezca sea nuestro login del SO.
	- Ancho de línea de 60 caracteres.
	- Contenido por páginas no superior a 20 líneas.
	- Indicar nuestro nombre de usuario de Oracle .
	- Mostrar la versión actual de Oracle .
	
	```SQL
	!hostname
	set lines 60
	set pages 20
	SHOW user
	SHOW release
	```

5. Crear un entorno permanente de trabajo de la siguiente manera:
	- El editor de texto por defecto sea el Kate .
	- Nos muestre la hora actual de entrada al sistema.
	- El prompt del sistema contenga la hora actual.
	- Si una consulta se muestra en más de una página debe aparecernos el siguiente mensaje para pasar a la siguiente página: pulsa una tecla para continuar.
	
	```SQL
	DEFINE_EDITOR = Kate
	set time on
	SELECT sysdate FROM dual; #REM Muestra la fecha además de la hora.
	set pause "pulsa una tecla para continuar"
	```

6) Generar un fichero login.sql que contenga las órdenes necesarias para predefinir nuestro propio entorno de trabajo

# Práctica 2
1. Visualizar por pantalla el contenido de cada una de las siguientes tablas:
	```SQL
	SELECT * FROM Proveedores;
	SELECT * FROM Tiendas;
	SELECT * FROM Articulos;
	SELECT * FROM Clientes;
	SELECT * FROM Suministros;
	SELECT * FROM Pesos;
	```
	
2. Visualizar por pantalla los nombres de todos los proveedores.
	```SQL
	SELECT DISTINCT prv_nom
	FROM Proveedores;
	```
	
3. Obtener un listado con el nombre y el apellido de todos los clientes.
	```SQL
	SELECT clt_nom, clt_apell
	FROM Clientes;
	```
	
4. Se quiere conocer los nombres de todos los gerentes de las tiendas.
	```SQL
	SELECT DISTINCT tda_ger
	FROM Tiendas;
	```
	
5. Seleccionar el nombre de todos los gerentes y la población donde se encuentran dichas tiendas.
	```SQL
	SELECT tda_ger, tda_pob
	FROM Tiendas;
	```
	
6. Obtener una lista de las poblaciones de los clientes.
	```SQL
	SELECT DISTINCT clt_pob
	FROM Clientes;
	```
	
7. Seleccionar los nombres de los artículos.
	```SQL
	SELECT DISTINCT art_nom
	FROM Articulos;
	```
	
8. Queremos saber los colores de los artículos que vendemos.
	```SQL
	SELECT DISTINCT art_col
	FROM Articulos;
	```
	
9. Formatear el resultado del problema 6 para que la columna resultante se llame localidad.
	```SQL
	SELECT DISTINCT tda_pob AS localidad
	FROM Tiendas;
	```
	
10. Hallar todos los clientes que viven en Madrid.
	```SQL
	SELECT clt_num, clt_nom
	FROM Clientes
	WHERE clt_pob LIKE 'madrid%';
	```
	
11. Seleccionar todos los artículos que pesen más de 500g.
	```SQL
	SELECT art_num, art_nom
	FROM Articulos
	WHERE art_peso > 500;
	```
	
12. Queremos saber los datos de todos los clientes que no son españoles.
	```SQL
	SELECT *
	FROM Clientes
	WHERE clt_pais NOT LIKE 'e';
	```
	
13. Seleccionar todos los artículos que tengan precio de venta superior o igual al doble del precio de compra
	```SQL
	SELECT *
	FROM Articulos
	WHERE art_pv >= art_pc*2;
	```
14. Queremos saber los nº de los artículos que ha comprado el cliente nº 1.
	```SQL
	SELECT vnt_art AS "Compra Clt num 1" 
	FROM Ventas
	WHERE vnt_clt = 1;
	```
	
15. Seleccionar todos los artículos rojos que pesen más de 100g.
	```SQL
	SELECT art_col
	FROM Articulos
	WHERE art_peso > 100;
	```
	
16. Seleccionar todos los artículos que sean rojos o que pesen más de 500g.
	```SQL
	SELECT *
	FROM Articulos
	WHERE art_col LIKE 'rojo' OR art_peso > 500;
	```
	
17. Deseamos obtener el resultado inverso de la consulta del problema 16.
	```SQL
	SELECT *
	FROM Articulos
	WHERE art_col NOT LIKE 'rojo' AND NOT art_peso > 500;
	```
	
18. Seleccionar los artículos que sean rojos y a la vez pesen más de 100g, o bien sean de color verde.
	```SQL
	SELECT *
	FROM Articulos
	WHERE (art_col LIKE 'rojo' AND art_peso > 100) OR art_col LIKE 'verde';
	```
	
19. Necesitamos obtener un listado de aquellos artículos cuyo color no sea ni blanco ni negro.
	```SQL
	SELECT *
	FROM Articulos
	WHERE art_col NOT IN('blanco','negro');
	```
	
20. Visualizar una lista de artículos cuya compra costó entre 20 y 30, ambos precios inclusive.
	```SQL
	SELECT *
	FROM Articulos
	WHERE art_pc BETWEEN 20 And 30;
	```
	
21. Obtener un listado de los artículos que no tengan definido ni el peso ni el color.
	```SQL
	SELECT *
	FROM Articulos
	WHERE art_peso,art_col IS NULL AND art_color IS NULL;
	```
	
22. Visualizar una lista de artículos de color rojo o de color verde.
	```SQL
	SELECT *
	FROM Articulos
	WHERE art_col IN('rojo','verde');
	```SQL
	
23. Se desea saber las ventas que se realizaron el día 9 de enero de 1991.
	```SQL
	SELECT *
	FROM Ventas
	WHERE vnt_fch LIKE '910109';
	```
	
24. Buscar un cliente del que hemos olvidado el apellido exacto, pero recordamos que comienza por "ro".
	```SQL
	SELECT *
	FROM Clientes
	WHERE clt_apell LIKE 'ro%';
	```
	
25. Visualizar a todos los clientes cuyo nombre de pila no empiece por la letra "m".
	```SQL
	SELECT *
	FROM Clientes
	WHERE clt_nom NOT LIKE 'm%';
	```
	
26. Buscar un cliente cuyo apellido empieza por "du" y termina en "t". Se sabe, además, que el apellido tiene 6 letras.
	```SQL
	SELECT *
	FROM Clientes
	WHERE clt_apeLl LIKE 'dut'.
	```
	
27. Buscar todos los artículos cuyo color no esté especificado
	```SQL
	SELECT *
	FROM Articulos
	WHERE art_col IS NULL; 
	```
	
28. Clasificar los artículos por orden creciente de peso.
	```SQL
	SELECT *
	FROM Articulos
	ORDER BY art_peso;
	```
	
29. Sacar un listado de los gerentes de las distintas tiendas, por orden alfabético. 
	```SQL
	SELECT tda_ger
	FROM Tiendas
	ORDER BY  tda_ger;
	```
	
30. Clasificar los artículos que pesan menos o igual a 100g por orden creciente del peso y, cuando éste sea idéntico, clasificarlos según el precio de compra decreciente.
	```SQL
	SELECT *
	FROM Articulos
	WHERE art_peso >= 100
	ORDER BY art_peso,art_pc;
	```
31. Obtener una lista de los artículos vendidos en orden creciente a la cantidad vendida de una sola vez de dicho artículo.
	```SQL
	SELECT *
	FROM Ventas
	WHERE vnt_cant = 1
	ORDER BY vnt_art;
	```
	
32. Queremos obtener un listado de la tabla Ventas ordenado en orden creciente a las cantidades vendidas de cada artículo.
	```SQL
	SELECT *
	FROM Ventas
	ORDER BY vnt_cant;
	```
33. ¿Qué artículos los provee el proveedor nº 2?
	```SQL
	SELECT *
	FROM Articulos
	WHERE art_prv = 2;
	```
	
34. ¿Qué clientes viven en Pamplona?
	```SQL
	SELECT clt_num, clt_nom
	FROM Clientes
	WHERE clt_pob LIKE 'pamplona';
	```
