# Ejercicios resueltos de álgebra y cálculo relacional

## Ejercicio I


**Autores**

Cod_Aut	     | Nombre 		 | Apellidos     
------------ | ------------- | ------------- 
1			 | C.J			 | Date			 
2			 | A.			 | De Miguel	 
3			 | D.J			 | Ullman		 

**Editores**

Cod_Edit	 | Nombre 		 | Cod_Aut	     
------------ | ------------- | ------------- 
1			 | S.			 | Ceri			 
2			 | A.			 | De Miguel	 
3			 | P.			 | Chen			

**Socios**
Cod_Soc Nombre Apellido
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
{t.Apellido | t € Autores}
```

```
{a | (∃c, ∃n) | Autores(c,n,a)}
```

``` SQL
SELECT Apellidos FROM Autores;
```

- Los datos del autor cuyo apellido es Ullman.
```
σ Apellido = 'Ullman' (Autores)
```

```
{t € Autores ^ t.Apellido = 'Ullman'}
```

```
{(∃c, ∃n, ∃a) | Autores(c,n,a) ^ a = 'Ullman'}
```

```SQL
SELECT * FROM Autores WHERE Apellido = 'Ullman';
```

- El nombre y el apellido de los autores con código mayor que 1.
```
π Nombre, Apellido (σ Cod_Aut > 1 (Autores))
```

```
{t.Nombre, t.Apellido | t € Autores ^ t.Cod_Autor > 1}
```

```
{n,a | ∃c | Autores(c,n,a) ^ c>1}
```

```SQL
SELECT Nombre, Apellido FROM Autores WHERE Cod_Aut > 1;
```

- Los datos de los socios y de los libros.
```
Socios x Libros
```

```SQL
SELECT * FROM Socios, Libros;
```

```
{t € Socios, r € Libros}
```

{(∃c, ∃n, ∃a) | Socios(c,n,a) ^ a = 'Ullman'}


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
{t.id_cliente, t_nom_cliente | t € Cliente ^ t.renta_anual > 30.000}
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
{t.nom_cliente | t € Cliente ^ t.id_cliente = 433}
```

```
{n | (∃i) | Cliente(i,n,r) ^ i=433}
```

3. ¿Cuál es la ciudad destino del embarque número 3244?
```
π destino (σ num_embarque = 3244 (Embarque))
```

```
{t.destino | t € Embarque ^ t.num_embarque = 3244}
```

```
{d | ∃n | E(n,i,p,c,d) ^ n = 3244}
```

4. ¿Qué camiones han transportado paquetes con un peso por encima de los 100kg?
```
π id_camión (σ peso > 100 (Embarque))
```

```
{t.id_camion | t € Embarque ^ t.peso > 100}
```

```
{c | ∃p | t € Embarque(n,i,p,c,d) ^ n = 3244}
```


5. ¿Cuáles son los nombres de los clientes que han enviado paquetes a la ciudad de Vigo?
```
A <- (π id_cliente (σ destino = 'Vigo' (Embarque)))
π nom_cliente (Cliente ⋈ A)
```

```
{t.nom_cliente | t € Cliente, r € Embarque ^ t.id_cliente = r.id_ciente ^ t.destino = 'Vigo'}
```

```
```

6. ¿A qué destinos han enviado paquetes los clientes con renta anual inferior a 6.000€?
```
A <- (π id_cliente (σ renta_anual < 6.000 (Cliente)))
π destino (Embarque ⋈ A)
```

```
{t.destino | t € Embarque, r € Cliente ^ t.id_cliente = r.id_cliente ^ r.renta_anual < 600}
```

```
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

2. Los nombres de los clientes con más de 60.000€ de renta anual.
```
π nom_cliente (σ renta_anual > 60.000 (Cliente))
```

3. El chófer del camión nº 45.
```
π nom_chofer (σ id_camion = 45 (Camion))
```

```

```

```
{(c) | (Ei) | (Camion(i,c) ^ i = 45)}
```

4. Los nombres de las ciudades que han recibido envíos que pesan más de 100kg.
```
π destino (σ peso > 100 (Embarques))
```

5. Los nombres y la renta anual de los clientes que han enviado paquetes que pesan más de 100kg.
```
A <- (π id_cliente (σ peso > 100 (Embarque)))
π nom_cliente, renta_anual (Cliente ⋈ A)
```

6. El número de los camiones que han transportado embarques que pesan más de 100kg.
```
π num_embarque (σ peso > 100 (Embarque))
```

```
```

```
{(c) | (En, Ei, Ep, Ed) | (Embarque(n,i,p,c,d) ^ p > 100)}
```

7. Los nombres de los chóferes que han distribuido envíos que pesan más de 100kg.
```
A <-(π id_camion (σ peso > 100 (Embarque)))
π nom_chófer (Camión ⋈ A)
```

8. Las ciudades que han recibido embarques de clientes que tienen una renta anual por encima de los 90.000€.
```
A <-(π id_cliente (σ renta_anual > 90.000€ (Cliente)))
π destino (Embarque ⋈ A)
```

9. Los clientes que tienen una renta anual por encima de los 90.000€ que han enviado paquetes con peso menor de un kilo.

```
A <-(σ peso < 1 (Embarque))
(σ renta_anual > 90.000 (Cliente ⋈ A))
```

```
{t.id_cliente,t.nom_cliente | t € Embarque ^ Er € Cliente 
 t.id_cliente = r.id_cliente ^ t.peso < 1 ^ r.renta_anual > 90.000}
```

10. Los clientes que tienen una renta anual por encima de los 90.000€ que han enviado paquetes con peso menor de un kilo o han enviado embarques a la ciudad de Madrid.
```
A <- (π id_cliente (σ renta_anual ) > 90.000 (Cliente))
B <- (π id_cliente (σ peso < 1 (Embarque))
C <- (π id_cliente (σ destino = 'Madrid' (Embarque)))
((A∩B)∪C) ⋈ Clientes
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
