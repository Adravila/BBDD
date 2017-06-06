# Ejercicios resueltos de álgebra y cálculo relacional

## Ejercicio I


**Autores**

Cod_Aut	     | Nombre 		 | Apellidos     
------------ | ------------- | ------------- 
1			 | C.J			 | Date			 
2			 | A.			 | De Miguel	 
3			 | D.J			 | Ullman		 

**Editores**

Cod_Edit	 | Nombre 		 | Apellidos	     
------------ | ------------- | ------------- 
1			 | S.			 | Ceri			 
2			 | A.			 | De Miguel	 
3			 | P.			 | Chen			

**Socios**

Cod_Soc | Nombre | Apellido
----------- | ----------- | -----------
1 | E. | Manrique 
2 | M. | García

**Libros**

Cod_Lib 	| Nombre 							 | Cod_Edit   | Cod_Aut
----------- | ---------------------------------- | ---------- | ------------
1			| Introducción a los Sistemas de BD  | 1		  | 1
2 			| Fundamentos y modelos de BD 		 | 2		  | 2
3 		    | Sistema de BD 					 | 3		  | 3

**Préstamos**

Cod_Lib 	| Cod_Soc 	 | Fecha
----------- | ---------- | -----------
1 			| 1 		 | 10-04-98
2 			| 1 		 | 18-02-99
3 			| 1			 | 23-07-99
1			| 2 		 | 01-12-97

Expresar en álgebra relacional y obtener la instancia resultante de los siguientes apartados, usando las relaciones adjuntas.
- Los apellidos de todos los autores.
```
π Apellido (Autores)
```

```
{t.Apellido | t ∈ Autores}
```

```
{a | (∃(c), ∃(n)) | Autores(c,n,a)}
```

``` SQL
SELECT Apellidos FROM Autores;
```

- Los datos del autor cuyo apellido es Ullman.
```
σ Apellido = 'Ullman' (Autores)
```

```
{t ∈ Autores ^ t.Apellido = 'Ullman'}
```

```
{(∃(c), ∃(n), ∃(a)) | Autores(c,n,a) ^ a = 'Ullman'}
```

```SQL
SELECT * FROM Autores WHERE Apellido = 'Ullman';
```

- El nombre y el apellido de los autores con código mayor que 1.
```
π Nombre, Apellido (σ Cod_Aut > 1 (Autores))
```

```
{t.Nombre, t.Apellido | t ∈ Autores ^ t.Cod_Autor > 1}
```

```
{n,a | (∃(c)) | (Autores(c,n,a) ^ c>1)}
```

```SQL
SELECT Nombre, Apellido FROM Autores WHERE Cod_Aut > 1;
```

- Los datos de los socios y de los libros.
```
Socios x Libros
```

```
{t ∈ Socios, r ∈ Libros}
```

```
{(∃(c_s), ∃(n_s), ∃(a_p), ∃(c_l), ∃(n_l), ∃(c_e), ∃(c_a)) | s ∈ Socios(c_s, n_s, a_s), l ∈ Libros(c_l, n_l, c_e, c_a)}
```

```SQL
SELECT * FROM Socios, Libros;
```

- Los datos de todos los autores y de todos los editores.
```
Autores ∪ Editores
```

```SQL
SELECT * FROM Autores UNION SELECT * FROM Editores;
```

- Los datos de todos los autores que no sean, a su vez editores.
```
Autores - Editores
```

```SQL
SELECT * FROM Autores MINUS SELECT * FROM Editores;
```

- Los datos de los autores que también son editores.
```
π Nombre, Apellido (Autores) ∩ Nombre, Apellido (Editores)
```

```SQL
SELECT * FROM Autores INTERSET SELECT * FROM Editores;
```

- Los datos de los socios, cuyo apellido sea Manrique, y de los libros.
```
σ Apellido = 'Manrique' (Socios x Libros)
```

```SQL
SELECT *
FROM Socios, Libros
WHERE Apellido = 'Manrique';
```

- Los datos de los libros que tienen en préstamo cada socio.
```
π cod_lib (Préstamos) ⋈ Libros ⋈ Socios 
```

- Los datos de los socios que tienen en préstamo un ejemplar de todos los libros.
```
A <- π Cod_Soc, Cod_Libro (Préstamo) / π Cod_Libro (Libros)
A/Libros
```

## Ejercicio II
	Cliente (id_cliente, nom_cliente, renta_anual)
	Embarque (num_embarque, id_cliente, peso, id_camión, destino)

Expresar en álgebra relacional las siguientes consultas:

1. ¿Qué clientes tienen una renta anual que excede de 30.000€?
 	
```
σ renta_anual > 30.000 (Cliente)
```

```
{t.id_cliente, t_nom_cliente | t ∈ Cliente ^ t.renta_anual > 30.000}
```

```
{i,n | (∃r) | Cliente(i,n,r) ^ r > 30.000}
```

``` SQL
SELECT * FROM Cliente WHERE renta_anual > 30000;
```

2. ¿Cuál es el nombre del cliente nº 433?
```
π nom_cliente (σ id_cliente = 433 (Cliente))
```

```
{t.nom_cliente | t ∈ Cliente ^ t.id_cliente = 433}
```

```
{n | (∃i) | Cliente(i,n,r) ^ i=433}
```

``` SQL
SELECT nom_cliente
FROM Cliente
WHERE id_cliente = 433;
```

3. ¿Cuál es la ciudad destino del embarque número 3244?
```
π destino (σ num_embarque = 3244 (Embarque))
```

```
{t.destino | t ∈ Embarque ^ t.num_embarque = 3244}
```

```
{d | ∃(n) | (Embarque(n,i,p,c,d) ^ n = 3244)}
```

``` SQL
SELECT destino
FROM Embarque
WHERE num_embarque = 3244;
```

4. ¿Qué camiones han transportado paquetes con un peso por encima de los 100kg?
```
π id_camión (σ peso > 100 (Embarque))
```

```
{t.id_camion | t ∈ Embarque ^ t.peso > 100}
```

```
{c | ∃(p) | t ∈ Embarque(n,i,p,c,d) ^ p > 100}
```

``` SQL
SELECT id_camion
FROM Embarque
WHERE peso > 100;
```

5. ¿Cuáles son los nombres de los clientes que han enviado paquetes a la ciudad de Vigo?
```
A <- (π id_cliente (σ destino = 'Vigo' (Embarque)))
π nom_cliente (Cliente ⋈ A)
```

```
{t.nom_cliente | t ∈ Cliente, ∃r ∈ Embarque ^ t.id_cliente = r.id_ciente ^ t.destino = 'Vigo'}
```

```
{n | ∃(i),∃(d) | (Cliente(i,n,r)) ^ (Embarque(n,i,p,c,d) ^ d = 'Vigo')}
```

```SQL
SELECT nom_cliente
FROM Cliente
WHERE id_cliente IN(
	SELECT id_cliente
	FROM Embarque
	WHERE destino = 'Vigo');
```

6. ¿A qué destinos han enviado paquetes los clientes con renta anual inferior a 6.000€?
```
A <- (π id_cliente (σ renta_anual < 6.000 (Cliente)))
π destino (Embarque ⋈ A)
```

```
{t.destino | t ∈ Embarque, ∃r ∈ Cliente ^ t.id_cliente = r.id_cliente ^ r.renta_anual < 600}
```

```
{d | ∃(i,r) | (Embarque(n,i,p,c,d)) ^ (Cliente(i,n,r) ^ r < 6000)}
```

```SQL
SELECT destino
FROM Embarque
WHERE id_cliente IN(
	SELECT id_cliente
	FROM Cliente
	WHERE renta_anual < 6000);
```

## Ejercicio III

	Cliente (id_cliente, nom_cliente, renta_anual)
	Embarque (num_embarque, id_cliente, peso, id_camión, destino)
	Camión (id_camión, nom_chófer)
	Ciudad (nomb_ciudad, población)

Expresar en álgebra relacional las siguientes consultas:

1. Una lista con los números de los embarques que pesan más de 20kg.
```
π num_embarque (σ peso > 20 (Embarque))	
```

```
{t.num_embarque | t ∈ Embarque ^ t.peso > 20}
```

```
{n | (∃(p)) | (Embarque(n,i,p,c,d) ^ p>20)}
```

```SQL
SELECT num_embarque
FROM Embarque
WHERE peso > 20;
```

2. Los nombres de los clientes con más de 60.000€ de renta anual.
```
π nom_cliente (σ renta_anual > 60.000 (Cliente))
```

```
{t.nom_cliente | t ∈ Cliente ^ t.renta_anual > 60.000}
```

```
{n | (∃(r)) | (Cliente(i,n,r) ^ r > 60.000)}
```

```SQL
SELECT nom_cliente
FROM Cliente
WHERE renta_anual > 60000;
```

3. El chófer del camión nº 45.
```
π nom_chofer (σ id_camión = 45 (Camión))
```

```
{t.nom_chófer | t ∈ Camión ^ t.id_camión = 45}
```

```
{(c) | (∃(i)) | (Camión(i,c) ^ i = 45)}
```

```SQL
SELECT nom_chofer
FROM Camión
WHERE id_camion = 45;
```

4. Los nombres de las ciudades que han recibido envíos que pesan más de 100kg.
```
π destino (σ peso > 100 (Embarques))
```

```
{t.destino | t ∈ Embarque ^ t.peso > 100}
```

```
{d | (∃(p)) | (Embarque(n,i,p,c,d)) ^ p > 100}
```

```SQL
SELECT destino
FROM Embarque
WHERE peso > 100;
```

5. Los nombres y la renta anual de los clientes que han enviado paquetes que pesan más de 100kg.
```
A <- (π id_cliente (σ peso > 100 (Embarque)))
π nom_cliente, renta_anual (Cliente ⋈ A)
```

```
{c.nom_cliente, c.renta_anual | c € Cliente, ∃e € Embarque ^ c.id_cliente = e.id_cliente ^ e.peso > 100}
```

```
{(n,r) | (∃(n), ∃(i), ∃(p), ∃(d)) | (Cliente(i,n,r)) ^ (Embarque(n,i,p,c,d) ^ p > 100)} 
```

```SQL
SELECT C.nom_cliente, C.renta_anual
FROM Clientes C, Embarque E
WHERE C.id_cliente = E.id_cliente AND E.peso > 100;
```

6. El número de los camiones que han transportado embarques que pesan más de 100kg.
```
π id_camión (σ peso > 100 (Embarque))
```

```
{e.id_camión| e ∈ Embarque ^ e.peso > 100}
```

```
{(i) | ∃(p) | (Embarque(n,i,p,c,d) ^ p > 100)}
```

```SQL
SELECT id_camion
FROM Embarque
WHERE peso > 100;
```

7. Los nombres de los chóferes que han distribuido envíos que pesan más de 100kg.
```
A <-(π id_camión (σ peso > 100 (Embarque)))
π nom_chófer (Camión ⋈ A)
```

```
{t.nom_chófer | t € Camión, ∃r € Embarque ^ t.id_camión = r.id_camión ^ r.peso > 100}
```

```
{(n) | (∃(p), ∃(c)) | (Camión(n,c)) ^ (Embarque(i,n,p,c,d) ^ p > 100)}
```

```SQL
SELECT C.nom_chofer
FROM Camion C, Embarque E
WHERE C.id_camion = E.id_camion AND E.peso > 100;
```

8. Las ciudades que han recibido embarques de clientes que tienen una renta anual por encima de los 90.000€.
```
A <-(π id_cliente (σ renta_anual > 90.000€ (Cliente)))
π destino (Embarque ⋈ A)
```

```
{t.destino | t € Embarque, r € Cliente ^ t.id_cliente = r.id_cliente ^ r.renta_anual > 90.000}
```

```
{(d) | ∃(i), ∃(r) | (Embarque(i,n,p,c,d)) ^ (Cliente(i,n,r) ^ r > 90.000}
```

```SQL
SELECT E.destino
FROM Embarque E, Cliente C
WHERE E.id_cliente = C.id_cliente AND C.renta_anual > 90000;
```

9. Los clientes que tienen una renta anual por encima de los 90.000€ que han enviado paquetes con peso menor de un kilo.

```
A <-(π id_cliente (σ peso < 1 (Embarque))
(σ renta_anual > 90.000 (Cliente ⋈ A))
```

```
{t.id_cliente, t.nom_cliente | t ∈ Embarque ^ ∃r ∈ Cliente 
 t.id_cliente = r.id_cliente ^ t.peso < 1 ^ r.renta_anual > 90.000}
```

```
{(i,d) | (∃(r), ∃(p)) | (Cliente(i,n,r) ^ r > 90.000) ^ (Embarque(i,n,p,c,d) ^ p < 1)}
```

```SQL
SELECT C.id_cliente, C.nom_cliente
FROM Cliente C, Embarque E
WHERE C.id_cliente = E.id_cliente AND C.renta_anual > 90000 AND E.peso < 1;
```

10. Los clientes que tienen una renta anual por encima de los 90.000€ que han enviado paquetes con peso menor de un kilo o han enviado embarques a la ciudad de Madrid.
```
A <- (π id_cliente (σ renta_anual ) > 90.000 (Cliente))
B <- (π id_cliente (σ peso < 1 (Embarque))
C <- (π id_cliente (σ destino = 'Madrid' (Embarque)))
(Clientes ⋈ (A∩B)∪C))
```

```
{(t.id_cliente, t.nom_cliente) | t € Cliente, ∃r € Embarque ^ t.id_cliente = r.id_cliente ^ [(t.renta_anual > 90.000 ^ r.peso < 1) v (r.destino = 'Madrid')]}
```

```
(n,i) | (∃(r),∃(p),∃(i),∃(d) | [(Cliente(i,n,r) ^ r > 90.000) ^ (Embarque(i,n,p,c,d) ^ p < 1)] v (Embarque(i,n,p,c,d) ^ d = 'Madrid')}
```

```SQL
SELECT *
FROM Clientes C, Embarque E
WHERE C.id_cliente = E.id_cliente AND ((C.renta_anual > 90000 AND E.peso < 1) OR E.destino = 'Madrid');
```

11. Los clientes cuyos envíos han sido distribuidos por el chófer Juan.
```
A <- Camión ⋈ Embarque
B <- π id_cliente (σ nom_chofer != 'Juan' (A))
π id_cliente (Clientes) - B
```

12. Los conductores que han distribuido envíos de clientes con renta anual por encima de los 120.000€ a ciudades con población superior a un millón de habitantes.
```
```

13. Clientes que han recibido envíos distribuidos por todos los chóferes.
```
```

14. Ciudades que han recibido embarques de todos los clientes.
```
```
15. Chóferes que han distribuido envíos a todas las ciudades.
```
```

16. Clientes que han enviado embarques a toda ciudad con población mayor de 500.000 habitantes.
```
```

## Ejercicio IV

	Empleado (nombre-empleado, calle, ciudad)
	Trabaja (nombre-empleado, nombre-empresa, sueldo)
	Empresa (nombre-empresa, ciudad)
	Jefe (nombre-empleado, nombre-jefe)

Encontrar una expresión en álgebra relacional para las siguientes cuestiones:

1. Averiguar los nombres de todos los empleados que trabajan para el Banco Crédito.
```
```

2. Obtener el nombre y la ciudad de residencia de todos los empleados que trabajan para el Banco Crédito.
```
```

3. Obtener una lista con el nombre, la calle y la ciudad de residencia de todos los empleados que trabajan para el Banco Crédito y ganan más de 12.000€ anuales.
```
```

4. Sacar un listado que contenga el nombre de todos los empleados de esta base de datos que viven en la misma ciudad que la compañía para la que trabajan.
```
```

5. Averiguar el nombre de todos los empleados que viven en la misma ciudad y en la misma calle que sus jefes.
```
```

6. Obtener una lista con el nombre de todos los empleados de esta base de datos que no trabajan para el Banco Crédito.
```
```

7. Averiguar el nombre de todos los empleados que ganan más que cualquier empleado del Banco Pequeño.
```
```

## Ejercicio V

Las siguientes tablas están almacenadas en un SGBD relacional:

	Hotel (nºhotel, nombre, dirección)
	Habitación (nºhabitación, nºhotel, tipo, precio)
	Registro (nºhotel, nºhuesped, fecha-entrada, fecha-salida, nºhabitación)
	Huesped (nºhuesped, nombre, dirección)

donde Hotel contiene los datos del hotel, Habitación contiene los datos de las habitaciones de cada hotel, Registro contiene los datos de los registros realizados y Huesped contiene los datos de los huespedes que se hospedan en los diferentes hoteles.

Generar las expresiones correspondientes en álgebra relacional para las siguientes consultas:

1. Lista de todos los hoteles.
```
```

2. Lista de todas las habitaciones individuales con un precio menor de 100 ¿.
```
```

3. Obtener los nombres y direcciones de todos los huespedes.
```
```

4. Listar el precio y el tipo de todas las habitaciones del Hotel Atlantico.
```
```

5. Obtener una lista de todos los huespedes actuales del Hotel Atlantico.
```
```

6. Obtener un listado con los datos de todas las habitaciones del Hotel Atlantico, incluyendo el nombre del huesped actual de la habitación, si es que está ocupada.
```
```

## Ejercicio de examen (Febrero 2017)
Dados los esquemas relacionales de la siguiente figura:
	
	Tiendas(num, poblacion,gerente)
	Clientes(num,apellido,nombre,pais,poblacion)
	Artículos(num,nombre,peso,color,PVP,proveedor_num)
	Proveedores(num,nombre)
	Ventas(cliente_num,tienda_num,articulo_num,fecha,cantidad)
	
Expresar en álgebra relacional las siguientes consultas:
- Obtener los datos de los clientes españoles que compraron artículos de color pistacho el día 6 de febrero de 2017 en las tiendas de Cádiz (solución correcta 0,5 puntos, explicación de los resultados 0,5 puntos).

```
Tiendas1(tienda_num, poblacion,gerente) <- Tiendas(num, poblacion,gerente)
Cliente1(cliente_num,apellido,nombre,pais,poblacion) <- Clientes(num,apellido,nombre,pais,poblacion)
Artículos1(articulo_num,nombre,peso,color,PVP,proveedor_num) <- Artículos(num,nombre,peso,color,PVP,proveedor_num)

A <-(π articulo_num (σ art_col = 'pistacho' (Artículos1))
T <-(σ poblacion = 'Cádiz' (Tiendas1))
V <-(π cliente_num, articulo_num, tienda_num (σ fecha = 170206 (A ⋈ T ⋈ Ventas))
R(σ país = 'España' (V ⋈ Clientes1)
```

```

```

```
```

```SQL
# Para realizar un renombramiento en SQL tendremos que hacer:
ALTER TABLE Clientes RENAME COLUMN nun TO cliente_num;
ALTER TABLE Tiendas RENAME COLUMN nun TO tienda_num;
ALTER TABLE Articulos RENAME COLUMN nun TO articulo_num;

SELECT C.*
FROM Articulos A, Ventas V, Tiendas T, Clientes C
WHERE 	A.articulo_num = V.articulo_num AND A.art_col = 'pistacho' AND
	V.fecha = 170206 AND
	T.num_tienda = V.num_tienda AND T.poblacion = 'Cadiz' AND
	C.pais = 'España';
```


- Obtener el número y población de las tiendas que han vendido todos los artículos (solución correcta 0,5 puntos, explicación de los resultados 0,5 puntos).

```
Cliente Cl(cliente_num,apellido,nombre,pais,poblacion) # Renombramiento
A <-(π cliente_num (σ art_col = 'pistacho' (Cl))
B <-(π tienda_num (σ fecha = 170206 (Ventas ⋈ A))
Tiendas Ti(tienda_num, poblacion,gerente) # Renombramiento
C <-(σ poblacion = 'Cádiz' (Ti ⋈ B))
R(Cl ⋈ C)
```

```

```

```
```

```SQL
```
