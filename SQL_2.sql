REM 1) Visualizar por pantalla el contenido de cada una de las siguientes tablas:

SELECT * FROM Proveedores;
SELECT * FROM Tiendas;
SELECT * FROM Articulos;
SELECT * FROM Clientes;
SELECT * FROM Suministros;
SELECT * FROM Pesos;

REM 2) Visualizar por pantalla los nombres de todos los proveedores.

SELECT DISTINCT prv_nom
FROM Proveedores;

REM 3) Obtener un listado con el nombre y el apellido de todos los clientes.
SELECT clt_nom, clt_apell
FROM Clientes;

REM 4) Se quiere conocer los nombres de todos los gerentes de las tiendas.
SELECT DISTINCT tda_ger
FROM Tiendas;

REM 5) Seleccionar el nombre de todos los gerentes y la población donde se encuentran dichas
tiendas.

SELECT tda_ger, tda_pob
FROM Tiendas;

REM 6) Obtener una lista de las poblaciones de los clientes.
SELECT DISTINCT clt_pob
FROM Clientes;

REM 7) Seleccionar los nombres de los artículos.
SELECT DISTINCT art_nom
FROM Articulos;

REM 8) Queremos saber los colores de los artículos que vendemos.
SELECT DISTINCT art_col
FROM Articulos;

REM 9) Formatear el resultado del problema 6 para que la columna resultante se llame localidad.
SELECT DISTINCT tda_pob AS localidad
FROM Tiendas;

REM 10) Hallar todos los clientes que viven en Madrid.
SELECT clt_num, clt_nom
FROM Clientes
WHERE clt_pob LIKE 'madrid%';

REM 11) Seleccionar todos los artículos que pesen más de 500g.
SELECT art_num, art_nom
FROM Articulos
WHERE art_peso > 500;

REM 12) Queremos saber los datos de todos los clientes que no son españoles.
SELECT *
FROM Clientes
WHERE clt_pais NOT LIKE 'e';

REM 13) Seleccionar todos los artículos que tengan precio de venta superior o igual al doble del
precio de compra
SELECT *
FROM Articulos
WHERE art_pv >= art_pc*2;

REM 14) Queremos saber los nº de los artículos que ha comprado el cliente nº 1.
SELECT vnt_art AS "Compra Clt num 1" 
FROM Ventas
WHERE vnt_clt = 1;

REM 15) Seleccionar todos los artículos rojos que pesen más de 100g.
SELECT art_col
FROM Articulos
WHERE art_peso > 100;

REM 16) Seleccionar todos los artículos que sean rojos o que pesen más de 500g.
SELECT *
FROM Articulos
WHERE art_col LIKE 'rojo' OR art_peso > 500;

REM 17) Deseamos obtener el resultado inverso de la consulta del problema 16.
SELECT *
FROM Articulos
WHERE art_col NOT LIKE 'rojo' AND NOT art_peso > 500;

REM 18) Seleccionar los artículos que sean rojos y a la vez pesen más de 100g, o bien sean de color verde.
SELECT *
FROM Articulos
WHERE (art_col LIKE 'rojo' AND art_peso > 100) OR art_col LIKE 'verde';

REM 19) Necesitamos obtener un listado de aquellos artículos cuyo color no sea ni blanco ni
negro.
SELECT *
FROM Articulos
WHERE art_col NOT IN('blanco','negro');

REM 20) Visualizar una lista de artículos cuya compra costó entre 20 y 30, ambos precios inclusive.
SELECT *
FROM Articulos
WHERE art_pc BETWEEN 20 And 30;

REM 21) Obtener un listado de los artículos que no tengan definido ni el peso ni el color.
SELECT *
FROM Articulos
WHERE art_peso,art_col IS NULL AND art_color IS NULL;

REM 22) Visualizar una lista de artículos de color rojo o de color verde.
SELECT *
FROM Articulos
WHERE art_col IN('rojo','verde');

REM 23) Se desea saber las ventas que se realizaron el día 9 de enero de 1991.
SELECT *
FROM Ventas
WHERE vnt_fch LIKE '910109';

REM 24) Buscar un cliente del que hemos olvidado el apellido exacto, pero recordamos que
comienza por "ro".
SELECT *
FROM Clientes
WHERE clt_apell LIKE 'ro%';

REM 25) Visualizar a todos los clientes cuyo nombre de pila no empiece por la letra "m".
SELECT *
FROM Clientes
WHERE clt_nom NOT LIKE 'm%';

REM 26) Buscar un cliente cuyo apellido empieza por "du" y termina en "t". Se sabe, además,
que el apellido tiene 6 letras.
SELECT *
FROM Clientes
WHERE clt_apell LIKE 'du%__%t';

REM 27) Buscar todos los artículos cuyo color no esté especificado
SELECT *
FROM Articulos
WHERE art_col IS NULL; 

REM 28) Clasificar los artículos por orden creciente de peso.
SELECT *
FROM Articulos
ORDER BY art_peso;

REM 29) Sacar un listado de los gerentes de las distintas tiendas, por orden alfabético.
SELECT tda_ger
FROM Tiendas
ORDER BY  tda_ger;

REM 30) Clasificar los artículos que pesan menos o igual a 100g por orden creciente del peso y,
cuando éste sea idéntico, clasificarlos según el precio de compra decreciente.

SELECT *
FROM Articulos
WHERE art_peso >= 100
ORDER BY art_peso,art_pc;

REM 31) Obtener una lista de los artículos vendidos en orden creciente a la cantidad vendida de una sola vez de dicho artículo.
SELECT *
FROM Ventas
WHERE vnt_cant = 1
ORDER BY vnt_art;

REM 32) Queremos obtener un listado de la tabla Ventas ordenado en orden creciente a las cantidades vendidas de cada artículo.
SELECT *
FROM Ventas
ORDER BY vnt_cant;

REM 33) ¿Qué artículos los provee el proveedor nº 2?
SELECT *
FROM Articulos
WHERE art_prv = 1;

REM 34) ¿Qué clientes viven en Pamplona?
SELECT clt_num, clt_nom
FROM Clientes
WHERE clt_pob LIKE 'pamplona';

select art_peso from articulos group by art_peso;
