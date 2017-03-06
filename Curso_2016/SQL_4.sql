REM 1) Buscar todos los artículos cuyos pesos resulten inferiores al peso del artículo no 2, ordenados por peso

SELECT *
FROM Articulos
WHERE  art_peso <
	(SELECT art_peso
	 FROM Articulos
	 WHERE art_num = 2)
ORDER BY art_peso;

REM 2) Encontrar el nº y el nombre de los artículos que pesen más que el artículo calendario o sean de igual color que la impresora.

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

REM 3) Buscar los artículos del mismo color que el artículo nº 10, cuyos pesos sean mayor o igual que el peso medio de todos los artículos

SELECT art_nom
FROM Articulos
WHERE 	art_col =
		(SELECT art_col
		 FROM Articulos
		 WHERE art_num = 10 AND art_peso >= 
			(SELECT avg(art_peso)
			 FROM Articulos)
		);

REM 4) Obtener la lista de proveedores que suministran como mínimo un artículo de color
negro.

SELECT *
FROM Proveedores
WHERE prv_num IN
	(SELECT art_prv
	 FROM Articulos
	 WHERE art_col LIKE 'negro');

REM 5) Seleccionar el nombre y apellido de los clientes que sean españoles y además residan
en la misma ciudad de los que se llaman de nombre Pablo, ordenados por su no de
cliente.

SELECT clt_nom, clt_apell
FROM Clientes
WHERE clt_pais LIKE 'e' AND clt_pob IN
	(SELECT clt_pob
	 FROM Clientes
	 WHERE clt_nom LIKE lower('Pablo'))
ORDER BY clt_num;

REM 6) ¿Cuál es el artículo con el precio de venta al público más caro de cada color?
REM a) Expresado en euros.
REM b) Expresado en pesetas.

SELECT art_num, art_nom, art_pv, art_col
FROM Articulos A1
WHERE 	art_pv IN 
		(SELECT max(art_pv)
		 FROM Articulos A2
		 WHERE A1.art_col = A2.art_col
		 GROUP BY art_col)
ORDER BY art_nom;

REM 7) Alternativa al ejercicio 6 donde deben aparecer también los artículos que no tienen definido el color.
REM a) Expresado en euros.
SELECT art_num, art_nom, art_pv, nvl(art_col,'indefinido')
FROM Articulos A1
WHERE 	art_pv IN 
		(SELECT max(art_pv)
		 FROM Articulos A2
		 WHERE nvl(A1.art_col,0) = nvl(A2.art_col,0)
		 GROUP BY art_col
		)
ORDER BY art_nom;

REM 8) Obtener el nombre de los gerentes de las tiendas que han vendido al menos una unidad del artículo nº 2.

SELECT tda_ger
FROM Tiendas
WHERE tda_num IN
	(SELECT vnt_tda
	 FROM Ventas
	 WHERE vnt_cant >= 1 AND vnt_art = 2);

REM 9) Obtener una lista de los artículos cuyo precio de venta es mayor que el precio de venta del artículo más barato de color blanco.

SELECT *
FROM Articulos
WHERE art_pv > 
	(SELECT min(art_pv) 
	 FROM Articulos 
	 WHERE art_col LIKE 'blanco');

REM 10) Formulación alternativa del problema no 9.

SELECT *
FROM Articulos
WHERE art_pv >
	(SELECT min(art_pv)
	 FROM Articulos
	 GROUP BY art_col
 	 HAVING art_col LIKE 'blanco'	
	);
	 
REM 11) Resolver el problema nº 9 mediante una consulta de existencia.
REM Obtener una lista de los artículos cuyo precio de venta es mayor que el precio de venta del artículo más barato de color blanco.

SELECT *
FROM Articulos A1
WHERE EXISTS
	(SELECT min(art_pv) 
	 FROM Articulos A2 
	 GROUP BY art_col
	 HAVING A1.art_pv > min(A2.art_pv) AND art_col LIKE 'blanco');

REM 12) Obtener una lista de los clientes que han gastado más dinero que la media de gasto de todos los clientes.

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
				
REM 13) Obtener la lista con el nº y el nombre de los clientes que han comprado en dos tiendas
distintas por lo menos.

SELECT clt_num, clt_nom
FROM Clientes
WHERE clt_num IN(
	SELECT vnt_clt
	FROM Ventas
	GROUP BY vnt_clt
	HAVING count(DISTINCT vnt_tda) >= 2
);

REM 14) Obtener el nº y el nombre de los artículos cuya cantidad total vendida es superior a la media de cantidades vendidas de todos los artículos.

SELECT art_num, art_nom
FROM Articulos
WHERE art_num IN(
	SELECT vnt_art
	FROM Ventas
	GROUP BY vnt_art
	HAVING sum(vnt_cant) > avg(vnt_cant));

REM 15) Obtener los datos de los clientes que han efectuado compras al menos en tres ocasiones distintas.

SELECT *
FROM Clientes
WHERE clt_num IN(
	SELECT vnt_clt
	FROM Ventas
	GROUP BY vnt_clt
	HAVING count(vnt_clt) >= 3
);

REM 16) Listado con los datos de los artículos comprados por el cliente nº 1.

SELECT * 
FROM Articulos
WHERE art_num IN (
	SELECT vnt_art
	FROM Ventas
	WHERE vnt_clt = 1
);

REM 17) Se desea conocer los datos de los clientes que no han realizado ninguna compra durante el año 1992.

SELECT *
FROM Clientes
WHERE clt_num NOT IN(
	SELECT vnt_clt
	FROM Ventas
	WHERE vnt_fch LIKE '92%'
);

REM 18) Obtener los datos de los clientes españoles que han comprado más de 5 unidades de un artículo de una sola vez. Dicha consulta se presentará de la siguiente manera:
REM - Ancho máximo de columna de 10 caracteres.
REM - Ancho de línea no superior a 75 caracteres.
REM - Contenido de página de 10 líneas.
REM - Título del listado "Informe de clientes".
REM - A pie de página el nombre del autor del informe.

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

REM 19) Se desea conocer el número y el nombre del gerente de las tiendas cuyas ventas hayan sido superiores a la media de ventas realizadas por todas las tiendas. El listado tendra el siguiente formato:
REM - En la cabecera aparecerá el siguiente título "Nombre de los gerentes".
REM -A pie de página el nombre de la persona que ha realizado el informe.
REM -Las páginas aparecerá numeradas.
REM - Salto de página controlado por una pausa.
REM -No más de tres registros por página

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

20) Obtener la lista de los clientes de Madrid o Barcelona que por lo menos no han hecho dos compras.

SELECT *
FROM Clientes
WHERE clt_pob IN ('madrid','barcelona') AND clt_num NOT IN(
	SELECT vnt_clt
	FROM Ventas
	GROUP BY vnt_clt
	HAVING sum(vnt_cant)>=2
);


