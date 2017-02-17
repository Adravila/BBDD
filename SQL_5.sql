REM 1) Seleccionar los artículos de color rojo y visualizar su no nombre y peso, así como el nombre del proveedor, ordenados según su peso.

SELECT art_nom, art_peso, prv_nom
FROM Articulos, Proveedores
WHERE art_num = prv_num AND art_col LIKE 'rojo'
ORDER BY art_peso;

REM 2) Hacer el producto cartesiano entre las tablas Artículos y Proveedores cuenta que el color de los artículos ha de ser rojo.
SELECT *
FROM Articulos, Proveedores
WHERE art_col LIKE 'rojo';

REM 3) Obtener una listado con los datos de los clientes que han realizado alguna compra, así como la fecha de la misma, y cuyo no de cliente sea superior o igual a 11. Si el cliente no ha efectuado todavía ninguna compra, también debe aparecer en el listado.

SELECT *
FROM Clientes
WHERE ...

REM 4) Obtener una lista con todos los artículos cuyo precio de compra sea superior al precio del artículo nº 8

SELECT A1.*
FROM Articulos A1, Articulos A2
WHERE A2.art_num = 8 AND A1.art_pc > A2.art_pc;

REM 5) Visualizar el contenido de la tabla Pesos.

SELECT *
FROM Pesos;

REM 6) Clasificar los artículos en función de las estimaciones de la tabla Pesos.
SELECT art_num, art_nom, art_peso, Peso_nom
FROM Articulos, Pesos
WHERE art_peso BETWEEN peso_min AND peso_max;

7) Efectuar una selección de todos los artículos rojos junto con todos los artículos que
pesan más de 500g.

SELECT art_num, art_nom
FROM Articulos
WHERE art_col LIKE 'rojo' OR art_peso > 500;

REM Se podría hacer de otra forma sin depender de la clave primaría respecto a la función Unión.

SELECT art_num, art_nom
FROM Articulos
WHERE art_col LIKE 'rojo' UNION
	SELECT art_num, art_nom
	FROM Articulos
	WHERE art_peso > 500; 

REM 8) Seleccionar todos los clientes que han realizado alguna compra.

REM PRODUCTO NATURAL

SELECT clt_num, clt_nom
FROM Clientes, Ventas
WHERE clt_num = vnt_clt AND vnt_cant > 0
GROUP BY clt_num, clt_nom
ORDER BY clt_num;

REM ANIDADA

SELECT clt_num, clt_nom
FROM Clientes
WHERE clt_num IN(
	SELECT vnt_clt
	FROM Ventas
);

REM EXISTENCIAL

SELECT clt_num, clt_nom
FROM Clientes A1
WHERE EXISTS(
	SELECT vnt_clt
	FROM Ventas
	WHERE A1.clt_num = vnt_clt
);

REM CORRELACIONADA

SELECT clt_num, clt_nom
FROM Clientes
WHERE 0 < (
	SELECT count(vnt_cant)
	FROM Ventas
	WHERE clt_num = vnt_clt
	);

REM 9) Seleccionar todos los clientes que no han realizado compras

REM PRODUCTO NATURAL

SELECT clt_num, clt_nom
FROM Clientes, Ventas
WHERE clt_num != vnt_clt
GROUP BY clt_num, clt_nom
ORDER BY clt_num;

REM ANIDADA

SELECT clt_num, clt_nom
FROM Clientes
WHERE clt_num NOT IN(
	SELECT vnt_clt
	FROM Ventas
);

REM EXISTENCIAL

	SELECT clt_num, clt_nom
	FROM Clientes A1
	WHERE NOT EXISTS(
		SELECT vnt_clt
		FROM Ventas
		WHERE A1.clt_num = vnt_clt
	);

REM CORRELACIONADA

SELECT clt_num, clt_nom
FROM Clientes
WHERE 0 >= (
	SELECT count(vnt_cant)
	FROM Ventas
	WHERE clt_num = vnt_clt
	);

REM 10) Visualizar, el número del artículo, el color, el peso y la mayor cantidad que se ha vendido de una sola vez, entre el 9 y el 13 de enero de 1991. Esta consulta sólo afectará a los artículos con ventas superiores a cinco unidades.

SELECT art_num, art_col, art_peso, max(vnt_cant)
FROM Articulos, Ventas
WHERE vnt_fch BETWEEN 910109 AND 910113 AND vnt_cant > 5
GROUP BY vnt_art,art_num, art_col, art_peso
ORDER BY art_num;

REM Creo que esta no es la solución ...
/** FALTA **/

REM 11) Visualizar las informaciones sobre las tiendas que han vendido el artículo no 4. Resolver
el problema de cuatro maneras distintas

REM PRODUCTO NATURAL 

SELECT Tiendas.*
FROM Tiendas, Ventas
WHERE tda_num = vnt_tda AND vnt_art = 4;

REM CONSULTA ANIDADA

SELECT *
FROM Tiendas
WHERE tda_num IN(
	SELECT vnt_tda
	FROM Ventas
	WHERE vnt_art = 4);

REM CONSULTA EXISTENCIAL

SELECT *
FROM Tiendas T
WHERE EXISTS(
	SELECT vnt_tda
	FROM Ventas
	WHERE T.tda_num = vnt_tda AND vnt_art = 4);

REM CORRELACIONADA

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

REM 12) Visualizar la cronología de las ventas de cada cliente.

SELECT clt_num, clt_nom, clt_apell, to_date(vnt_fch,'yymmdd') fecha
FROM Clientes, Ventas
WHERE clt_num = vnt_clt;

REM 13) Visualizar la información sobre las tiendas que no han vendido el artículo nº4, mediante
una consulta anidada.

SELECT *
FROM Tiendas
WHERE tda_num NOT IN
	(SELECT vnt_tda
	 FROM Ventas
	 WHERE vnt_art = 4);

REM 14) Resolver el problema nº 13 mediante una consulta existencial.

SELECT *
FROM Tiendas
WHERE NOT EXISTS(
	SELECT *
 	FROM Ventas
	WHERE tda_num = vnt_tda AND vnt_art = 4);

REM 15) Supongamos que hemos vendido un cierto número de artículos al cliente no 5. Obtener la lista de ventas de estos artículos efectuadas a los restantes clientes con posterioridad a las ventas efectuadas al cliente nº 5

SELECT *
FROM Ventas
WHERE vnt_clt != 5 AND vnt_fch >
	(SELECT max(vnt_fch)
	 FROM Ventas
	 WHERE vnt_clt = 5);

REM 16) Visualizar el nº y el nombre de los artículos que han sido vendidos por todas las tiendas. Se selecciona un artículo si no existe ninguna tienda que no haya tenido alguna compra de éste.


