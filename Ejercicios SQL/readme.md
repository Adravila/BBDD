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
	
# Práctica 3

1. Obtener el margen de beneficio de aquellos artículos cuyo coste de adquisición superó los 20€

2. Calcular la media de peso de todos los artículos.
```SQL
SELECT avg(nvl(art_peso,0)) 
FROM articulos;
```

3. Calcular la media de peso, el margen máximo (diferencia máxima entre el precio de venta y el precio de compra) y la diferencia que se da entre el mayor precio de venta y el menor precio de compra. Estos cálculos habrán de realizarse sólo para aquellos artículos cuya columna art_col se encuentre definida.
```SQL
SELECT avg(nvl(art_peso,0)), max(art_pv - art_pc), max(art_pv) - max(art_pc)
FROM Articulos
GROUP BY art_peso;
```

4. Contar el número de colores distintos existentes en el stock.
```SQL
SELECT count(DISTINCT art_col)
FROM Articulos;
```

5. Contar cuántas ventas ha realizado cada tienda.
```SQL
SELECT vnt_tda, sum(vnt_cant)
FROM Ventas
GROUP BY vnt_tda
ORDER BY vnt_tda;
```

6. ¿Cuántos proveedores hay?
```SQL
SELECT count(*)
FROM Proveedores;
```

7. Calcular el precio de venta medio de los artículos, agrupados y ordenados por colores.
```SQL
SELECT avg(art_pv), art_col
FROM Articulos
WHERE art_col IS NOT NULL 
GROUP BY art_col
ORDER BY art_col;
```

8. Calcular el precio de venta medio de los artículos de cada color, excluyendo aquellos artículos cuyo precio de compra sea inferior a 0.6€, ordenados por colores.
```SQL
SELECT avg(art_pv), art_col
FROM Articulos
WHERE art_col IS NOT NULL AND NOT art_pc< 60
GROUP BY art_col
ORDER BY art_col;
```

9. Seleccionar el nombre y el color de los artículos, además contar cuántos artículos hay.
```SQL
#No será posible porque es no se puede realizar una función dependiendo de una columna indendiente de agrupaciones.
```

10. Indicar el número de colores diferentes que existen de cada artículo, excepto la impresora. Ordenados por nombres
```SQL
SELECT art_nom, count(DISTINCT art_col)
FROM Articulos
WHERE art_nom NOT LIKE 'impresora'
GROUP BY art_nom
ORDER BY art_nom;
```

11. Seleccionar el nombre y el color de todos los artículos, excepto la impresora, agrupados por colores y nombres.
```SQL
SELECT art_nom, art_col
FROM Articulos
WHERE art_nom NOT LIKE 'impresora'
GROUP BY art_col, art_nom;
```

12. Buscar el color de los artículos cuyo precio de venta media por color supere los 12 € ordenados por colores
```SQL
SELECT art_col, avg(art_pv)
FROM Articulos
WHERE art_col IS NOT NULL 
GROUP BY art_col
HAVING avg(art_pv)>1200
ORDER BY art_col; 
```

13. Seleccionar el nº de cada tienda que ha hecho más de 2 ventas entre el 9 y el 13 de enero de 1991. Visualizar tanto el número de ventas efectuadas como el número de artículos distintos vendidos.
```SQL
SELECT vnt_tda,sum(vnt_cant),count(DISTINCT vnt_art)
FROM Ventas
WHERE vnt_fch BETWEEN 910109 AND 910113
GROUP BY vnt_tda
HAVING sum(vnt_cant)>2
ORDER BY vnt_tda;
```

14. Visualizar el nombre, peso, precio de venta y la suma del peso y el precio de venta de todos los artículos, utilizando o no la función nvl.
```SQL
SELECT art_nom, art_peso, art_pv, (nvl(art_peso,0) + nvl(art_pv,0))
FROM Articulos
GROUP BY art_nom, art_peso, art_pv;
```

15. Clasificar las ciudades en orden decreciente respecto al número de clientes que residen en ellas.
```SQL
SELECT clt_pob, count(*)
FROM Clientes
GROUP BY clt_pob
ORDER BY count(*) DESC;
```

# Práctica 4

1. Buscar todos los artículos cuyos pesos resulten inferiores al peso del artículo no 2, ordenados por peso
```SQL
SELECT *
FROM Articulos
WHERE  art_peso <
	(SELECT art_peso
	 FROM Articulos
	 WHERE art_num = 2)
ORDER BY art_peso;
```

2. Encontrar el nº y el nombre de los artículos que pesen más que el artículo calendario o sean de igual color que la impresora.
```SQL
SELECT art_num, art_nom
FROM Articulos
WHERE 	art_peso > 
		(SELECT art_peso
 		 FROM Articulos
		 WHERE art_nom LIKE 'calendario')
	OR art_col = 
		(SELECT DISTINCT(art_col)
		 FROM Articulos
		 WHERE art_nom LIKE 'impresora');
```

3. Buscar los artículos del mismo color que el artículo nº 10, cuyos pesos sean mayor o igual que el peso medio de todos los artículos
```SQL
SELECT art_nom
FROM Articulos
WHERE 	art_col =
		(SELECT art_col
		 FROM Articulos
		 WHERE art_num = 10 AND art_peso >= 
			(SELECT avg(art_peso)
			 FROM Articulos)
		);
```

4. Obtener la lista de proveedores que suministran como mínimo un artículo de color negro.
```SQL
SELECT *
FROM Proveedores
WHERE prv_num IN
	(SELECT art_prv
	 FROM Articulos
	 WHERE art_col LIKE 'negro');
```

5. Seleccionar el nombre y apellido de los clientes que sean españoles y además residan en la misma ciudad de los que se llaman de nombre Pablo, ordenados por su no de cliente.
```SQL
SELECT clt_nom, clt_apell
FROM Clientes
WHERE clt_pais LIKE 'e' AND clt_pob IN
	(SELECT clt_pob
	 FROM Clientes
	 WHERE clt_nom LIKE lower('Pablo'))
ORDER BY clt_num;
```

6. ¿Cuál es el artículo con el precio de venta al público más caro de cada color?
-  Expresado en euros.
-  Expresado en pesetas.

```SQL
SELECT art_num, art_nom, art_pv, art_col
FROM Articulos A1
WHERE 	art_pv IN 
		(SELECT max(art_pv)
		 FROM Articulos A2
		 WHERE A1.art_col = A2.art_col
		 GROUP BY art_col)
ORDER BY art_nom;
```

7. Alternativa al ejercicio 6 donde deben aparecer también los artículos que no tienen definido el color.
- Expresado en euros.

```SQL
SELECT art_num, art_nom, art_pv, nvl(art_col,'indefinido')
FROM Articulos A1
WHERE 	art_pv IN 
		(SELECT max(art_pv)
		 FROM Articulos A2
		 WHERE nvl(A1.art_col,0) = nvl(A2.art_col,0)
		 GROUP BY art_col
		)
ORDER BY art_nom;
```

8. Obtener el nombre de los gerentes de las tiendas que han vendido al menos una unidad del artículo nº 2.
```SQL
SELECT tda_ger
FROM Tiendas
WHERE tda_num IN
	(SELECT vnt_tda
	 FROM Ventas
	 WHERE vnt_cant >= 1 AND vnt_art = 2);
```

9. Obtener una lista de los artículos cuyo precio de venta es mayor que el precio de venta del artículo más barato de color blanco.
```SQL
SELECT *
FROM Articulos
WHERE art_pv > 
	(SELECT min(art_pv) 
	 FROM Articulos 
	 WHERE art_col LIKE 'blanco');
```

10. Formulación alternativa del problema no 9.
```SQL
SELECT *
FROM Articulos
WHERE art_pv >
	(SELECT min(art_pv)
	 FROM Articulos
	 GROUP BY art_col
 	 HAVING art_col LIKE 'blanco'	
	);
```

11. Resolver el problema nº 9 mediante una consulta de existencia. Obtener una lista de los artículos cuyo precio de venta es mayor que el precio de venta del artículo más barato de color blanco.
```SQL
SELECT *
FROM Articulos A1
WHERE EXISTS
	(SELECT min(art_pv) 
	 FROM Articulos A2 
	 GROUP BY art_col
	 HAVING A1.art_pv > min(A2.art_pv) AND art_col LIKE 'blanco');
```

12. Obtener una lista de los clientes que han gastado más dinero que la media de gasto de todos los clientes.
```SQL
SELECT * 
FROM Clientes
WHERE clt_num IN(
	SELECT vnt_clt
	FROM Ventas
	GROUP BY vnt_clt
	HAVING sum(vnt_precio)  > (
		SELECT avg(sum(vnt_precio))
		FROM Ventas
		GROUP BY vnt_precio
	)
);
```

13. Obtener la lista con el nº y el nombre de los clientes que han comprado en dos tiendas distintas por lo menos.
```SQL
SELECT clt_num, clt_nom
FROM Clientes
WHERE clt_num IN(
	SELECT vnt_clt
	FROM Ventas
	GROUP BY vnt_clt
	HAVING count(DISTINCT vnt_tda) >= 2
);
```

14. Obtener el nº y el nombre de los artículos cuya cantidad total vendida es superior a la media de cantidades vendidas de todos los artículos.
```SQL
SELECT art_num, art_nom
FROM Articulos
WHERE art_num IN(
	SELECT vnt_art
	FROM Ventas
	GROUP BY vnt_art
	HAVING sum(vnt_cant) > avg(vnt_cant));
```

15. Obtener los datos de los clientes que han efectuado compras al menos en tres ocasiones distintas.
```SQL
SELECT *
FROM Clientes
WHERE clt_num IN(
	SELECT vnt_clt
	FROM Ventas
	GROUP BY vnt_clt
	HAVING count(vnt_clt) >= 3
);
```

16. Listado con los datos de los artículos comprados por el cliente nº 1.
```SQL
SELECT * 
FROM Articulos
WHERE art_num IN (
	SELECT vnt_art
	FROM Ventas
	WHERE vnt_clt = 1
);
```

17) Se desea conocer los datos de los clientes que no han realizado ninguna compra durante el año 1992.
```SQL
SELECT *
FROM Clientes
WHERE clt_num NOT IN(
	SELECT vnt_clt
	FROM Ventas
	WHERE vnt_fch LIKE '92%'
);
```

18. Obtener los datos de los clientes españoles que han comprado más de 5 unidades de un artículo de una sola vez. Dicha consulta se presentará de la siguiente manera:
- Ancho máximo de columna de 10 caracteres.
- Ancho de línea no superior a 75 caracteres.
- Contenido de página de 10 líneas.
- Título del listado "Informe de clientes".
- A pie de página el nombre del autor del informe.

```SQL
SELECT *
FROM Clientes
WHERE clt_pais LIKE 'e' AND clt_num IN(
	SELECT vnt_clt
	FROM Ventas
	WHERE vnt_cant>=5
);

col clt_num format 9999999999	 
col clt_apell format A10
col clt_nom format A10
col clt_apis format A10
col clt_pob format A10
set lines 75
set pages 10
ttitle "Informe de clientes"
btitle "Adrián Dávila Guerra"
```

19. Se desea conocer el número y el nombre del gerente de las tiendas cuyas ventas hayan sido superiores a la media de ventas realizadas por todas las tiendas. El listado tendra el siguiente formato:
- En la cabecera aparecerá el siguiente título "Nombre de los gerentes".
- A pie de página el nombre de la persona que ha realizado el informe.
- Las páginas aparecerá numeradas.
- Salto de página controlado por una pausa.
- No más de tres registros por página

```SQL
SELECT *
FROM Tiendas
WHERE tda_num IN(
	SELECT vnt_tda
	FROM Ventas	
	GROUP BY vnt_tda
	HAVING sum(vnt_cant) > avg(vnt_cant)
);

ttitle "Nombre de los gerentes"
btitle "Adrián Dávila Guerra"
set pause on
set pages 3
```

20. Obtener la lista de los clientes de Madrid o Barcelona que por lo menos no han hecho dos compras.
```SQL
SELECT *
FROM Clientes
WHERE clt_pob IN ('madrid','barcelona') AND clt_num NOT IN(
	SELECT vnt_clt
	FROM Ventas
	GROUP BY vnt_clt
	HAVING sum(vnt_cant)>=2
);
```
# Práctica 5

1. Seleccionar los artículos de color rojo y visualizar su no nombre y peso, así como el nombre del proveedor, ordenados según su peso.
```SQL
SELECT art_nom, art_peso, prv_nom
FROM Articulos, Proveedores
WHERE art_num = prv_num AND art_col LIKE 'rojo'
ORDER BY art_peso;
```
2. Hacer el producto cartesiano entre las tablas Artículos y Proveedores cuenta que el color de los artículos ha de ser rojo.
```SQL
SELECT *
FROM Articulos, Proveedores
WHERE art_col LIKE 'rojo';
```

3. Obtener una listado con los datos de los clientes que han realizado alguna compra, así como la fecha de la misma, y cuyo no de cliente sea superior o igual a 11. Si el cliente no ha efectuado todavía ninguna compra, también debe aparecer en el listado.
```SQL
SELECT *
FROM Clientes
WHERE ...
```

4. Obtener una lista con todos los artículos cuyo precio de compra sea superior al precio del artículo nº 8
```SQL
SELECT A1.*
FROM Articulos A1, Articulos A2
WHERE A2.art_num = 8 AND A1.art_pc > A2.art_pc;
```

5. Visualizar el contenido de la tabla Pesos.
```SQL
SELECT *
FROM Pesos;
```

6. Clasificar los artículos en función de las estimaciones de la tabla Pesos.
```SQL
SELECT art_num, art_nom, art_peso, Peso_nom
FROM Articulos, Pesos
WHERE art_peso BETWEEN peso_min AND peso_max;
```

7) Efectuar una selección de todos los artículos rojos junto con todos los artículos que pesan más de 500g.
```SQL
SELECT art_num, art_nom
FROM Articulos
WHERE art_col LIKE 'rojo' OR art_peso > 500;

#Se podría hacer de otra forma sin depender de la clave primaría respecto a la función Unión.

SELECT art_num, art_nom
FROM Articulos
WHERE art_col LIKE 'rojo' UNION
	SELECT art_num, art_nom
	FROM Articulos
	WHERE art_peso > 500; 
```

8. Seleccionar todos los clientes que han realizado alguna compra.
```SQL
#PRODUCTO NATURAL

SELECT clt_num, clt_nom
FROM Clientes, Ventas
WHERE clt_num = vnt_clt AND vnt_cant > 0
GROUP BY clt_num, clt_nom
ORDER BY clt_num;

#ANIDADA

SELECT clt_num, clt_nom
FROM Clientes
WHERE clt_num IN(
	SELECT vnt_clt
	FROM Ventas
);

#EXISTENCIAL

SELECT clt_num, clt_nom
FROM Clientes A1
WHERE EXISTS(
	SELECT vnt_clt
	FROM Ventas
	WHERE A1.clt_num = vnt_clt
);

#CORRELACIONADA

SELECT clt_num, clt_nom
FROM Clientes
WHERE 0 < (
	SELECT count(vnt_cant)
	FROM Ventas
	WHERE clt_num = vnt_clt
);
```

9. Seleccionar todos los clientes que no han realizado compras
```SQL
#PRODUCTO NATURAL

SELECT clt_num, clt_nom
FROM Clientes, Ventas
WHERE clt_num != vnt_clt
GROUP BY clt_num, clt_nom
ORDER BY clt_num;

#ANIDADA

SELECT clt_num, clt_nom
FROM Clientes
WHERE clt_num NOT IN(
	SELECT vnt_clt
	FROM Ventas
);

#EXISTENCIAL

	SELECT clt_num, clt_nom
	FROM Clientes A1
	WHERE NOT EXISTS(
		SELECT vnt_clt
		FROM Ventas
		WHERE A1.clt_num = vnt_clt
	);

#CORRELACIONADA

SELECT clt_num, clt_nom
FROM Clientes
WHERE 0 >= (
	SELECT count(vnt_cant)
	FROM Ventas
	WHERE clt_num = vnt_clt
);
```

10. Visualizar, el número del artículo, el color, el peso y la mayor cantidad que se ha vendido de una sola vez, entre el 9 y el 13 de enero de 1991. Esta consulta sólo afectará a los artículos con ventas superiores a cinco unidades.
```SQL
SELECT art_num, art_col, art_peso, max(vnt_cant)
FROM Articulos, Ventas
WHERE vnt_fch BETWEEN 910109 AND 910113 AND vnt_cant > 5
GROUP BY vnt_art,art_num, art_col, art_peso
ORDER BY art_num;
```

11. Visualizar las informaciones sobre las tiendas que han vendido el artículo no 4. Resolver el problema de cuatro maneras distintas
```SQL
#PRODUCTO NATURAL 

SELECT Tiendas.*
FROM Tiendas, Ventas
WHERE tda_num = vnt_tda AND vnt_art = 4;

# CONSULTA ANIDADA

SELECT *
FROM Tiendas
WHERE tda_num IN(
	SELECT vnt_tda
	FROM Ventas
	WHERE vnt_art = 4);

# CONSULTA EXISTENCIAL

SELECT *
FROM Tiendas T
WHERE EXISTS(
	SELECT vnt_tda
	FROM Ventas
	WHERE T.tda_num = vnt_tda AND vnt_art = 4);

# CORRELACIONADA

SELECT *
FROM Tiendas
WHERE 4 = (SELECT vnt_art
	   FROM Ventas
           WHERE vnt_tda = tda_num
	   GROUP BY vnt_art
	   HAVING vnt_art = 4);

SELECT *
FROM tiendas
WHERE 4 IN (SELECT vnt_art
	   FROM ventas
	   WHERE vnt_tda = tda_num);
```

12. Visualizar la cronología de las ventas de cada cliente.
```SQL
SELECT clt_num, clt_nom, clt_apell, to_date(vnt_fch,'yymmdd') fecha
FROM Clientes, Ventas
WHERE clt_num = vnt_clt;
```

13. Visualizar la información sobre las tiendas que no han vendido el artículo nº4, mediante una consulta anidada.
```SQL
SELECT *
FROM Tiendas
WHERE tda_num NOT IN
	(SELECT vnt_tda
	 FROM Ventas
	 WHERE vnt_art = 4);
```

14. Resolver el problema nº 13 mediante una consulta existencial.
```SQL
SELECT *
FROM Tiendas
WHERE NOT EXISTS(
	SELECT *
 	FROM Ventas
	WHERE tda_num = vnt_tda AND vnt_art = 4);
```

15. Supongamos que hemos vendido un cierto número de artículos al cliente no 5. Obtener la lista de ventas de estos artículos efectuadas a los restantes clientes con posterioridad a las ventas efectuadas al cliente nº 5
```SQL
SELECT *
FROM Ventas
WHERE vnt_clt != 5 AND vnt_fch >
	(SELECT max(vnt_fch)
	 FROM Ventas
	 WHERE vnt_clt = 5);
```
