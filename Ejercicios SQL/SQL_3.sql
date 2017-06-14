# 1) Obtener el margen de beneficio de aquellos artículos cuyo coste de adquisición superó los 20€
SELECT sum(art_pv - art_pc) AS 'Margen de Beneficio'
FROM Articulos
WHERE art_pc > 20;

# 2) Calcular la media de peso de todos los artículos.
SELECT avg(nvl(art_peso,0)) 
FROM articulos;

# 3) Calcular la media de peso, el margen máximo (diferencia máxima entre el precio de venta y el precio de compra) y 
# la diferencia que se da entre el mayor precio de venta y el menor precio de compra. 
# Estos cálculos habrán de realizarse sólo para aquellos artículos cuya columna art_col se encuentre definida.
SELECT avg(nvl(art_peso,0)), max(art_pv - art_pc), max(art_pv) - max(art_pc)
FROM Articulos
GROUP BY art_peso;

# 4) Contar el número de colores distintos existentes en el stock.
SELECT count(DISTINCT art_col)
FROM Articulos;

# 5) Contar cuántas ventas ha realizado cada tienda.
SELECT vnt_tda, sum(vnt_cant)
FROM Ventas
GROUP BY vnt_tda
ORDER BY vnt_tda;

# 6) ¿Cuántos proveedores hay?
SELECT count(*)
FROM Proveedores;

# 7) Calcular el precio de venta medio de los artículos, agrupados y ordenados por colores.
SELECT avg(art_pv), art_col
FROM Articulos
WHERE art_col IS NOT NULL 
GROUP BY art_col
ORDER BY art_col;

# 8) Calcular el precio de venta medio de los artículos de cada color, excluyendo aquellos artículos 
# cuyo precio de compra sea inferior a 0.6€, ordenados por colores.
SELECT avg(art_pv), art_col
FROM Articulos
WHERE art_col IS NOT NULL AND NOT art_pc< 60
GROUP BY art_col
ORDER BY art_col;

# 9) Seleccionar el nombre y el color de los artículos, además contar cuántos artículos hay.
# No será posible porque es no se puede realizar una función dependiendo de una columna indendiente de agrupaciones.

# 10) Indicar el número de colores diferentes que existen de cada artículo, excepto la impresora. Ordenados por nombres
SELECT art_nom, count(DISTINCT art_col)
FROM Articulos
WHERE art_nom NOT LIKE 'impresora'
GROUP BY art_nom
ORDER BY art_nom;

# 11) Seleccionar el nombre y el color de todos los artículos, excepto la impresora, agrupados por colores y nombres.
SELECT art_nom, art_col
FROM Articulos
WHERE art_nom NOT LIKE 'impresora'
GROUP BY art_col, art_nom;

# 12) Buscar el color de los artículos cuyo precio de venta media por color supere los 12 € ordenados por colores
SELECT art_col, avg(art_pv)
FROM Articulos
WHERE art_col IS NOT NULL 
GROUP BY art_col
HAVING avg(art_pv)>1200
ORDER BY art_col; 

# 13) Seleccionar el nº de cada tienda que ha hecho más de 2 ventas entre el 9 y el 13 de enero de 1991. 
# Visualizar tanto el número de ventas efectuadas como el número de artículos distintos vendidos.
SELECT vnt_tda,sum(vnt_cant),count(DISTINCT vnt_art)
FROM Ventas
WHERE vnt_fch BETWEEN 910109 AND 910113
GROUP BY vnt_tda
HAVING sum(vnt_cant)>2
ORDER BY vnt_tda;

# 14) Visualizar el nombre, peso, precio de venta y la suma del peso y el precio de venta de todos los artículos,
# utilizando o no la función nvl.
SELECT art_nom, art_peso, art_pv, (ifnull(art_peso,0) + ifnull(art_pv,0))
FROM Articulos
GROUP BY art_nom, art_peso, art_pv;

# NOTA: En SQLPlus se utiliza nvl(), en cambio HeidiSQL utiliza las sintáxis de MySQL que sería ifnull().

# 15) Clasificar las ciudades en orden decreciente respecto al número de clientes que residen en ellas.
SELECT clt_pob, count(*)
FROM Clientes
GROUP BY clt_pob
ORDER BY count(*) DESC;
