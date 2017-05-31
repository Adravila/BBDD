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
- Los datos del autor cuyo apellido es Ullman.
- El nombre y el apellido de los autores con código mayor que 1.
- Los datos de los socios y de los libros.
- Los datos de todos los autores y de todos los editores.
- Los datos de todos los autores que no sean, a su vez editores.
- Los datos de los autores que también son editores.
- Los datos de los socios, cuyo apellido sea Manrique, y de los libros.
- Los datos de los libros que tienen en préstamo cada socio.
- Los datos de los socios que tienen en préstamo un ejemplar de todos los libros.

## Ejercicio II
	Cliente (id_cliente, nom_cliente, renta_anual)
	Embarque (num_embarque, id_cliente, peso, id_camión, destino)

Expresar en álgebra relacional las siguientes consultas:

1. ¿Qué clientes tienen una renta anual que excede de 30.000€?

2. ¿Cuál es el nombre del cliente nº 433?

3. ¿Cuál es la ciudad destino del embarque número 3244?

4. ¿Qué camiones han transportado paquetes con un peso por encima de los 100kg?

5. ¿Cuáles son los nombres de los clientes que han enviado paquetes a la ciudad de Vigo?

6. ¿A qué destinos han enviado paquetes los clientes con renta anual inferior a 6.000€?

### Solución del ejercicio II en álgebra relacional

1. 	```σ renta_anual > 30.000 (Cliente)```

2. 	```π nom_cliente (σ id_cliente = 433 (Cliente))```

3. 	```π destino (σ num_embarque = 3244 (Embarque))```

4. 	```π id_camión (σ peso > 100 (Embarque))```

5. 	```A <- (π id_cliente (σ destino = 'Vigo' (destino))) π nom_cliente (Cliente |><| A)```

```
A <- (π id_cliente (σ destino = 'Vigo' (destino)))
π nom_cliente (Cliente |><| A)
```

6.	```A <- (π id_cliente (σ renta_anual < 6.000 (Cliente)))```

	```π destino (Embarque |><| A)```

### Solución del ejercicio II en cálculo relacional

### Solución del ejercicio II en cálculo de dominio

## Ejercicio III

	Cliente (id_cliente, nom_cliente, renta_anual)
	Embarque (num_embarque, id_cliente, peso, id_camión, destino)
	Camión (id_camión, nom_chófer)
	Ciudad (nomb_ciudad, población)

Expresar en álgebra relacional las siguientes consultas:

a) Una lista con los números de los embarques que pesan más de 20kg.

b) Los nombres de los clientes con más de 60.000€ de renta anual.

c) El chófer del camión nº 45.

d) Los nombres de las ciudades que han recibido envíos que pesan más de 100kg.

e) Los nombres y la renta anual de los clientes que han enviado paquetes que pesan más de 100kg.

f) El número de los camiones que han transportado embarques que pesan más de 100kg.

g) Los nombres de los chóferes que han distribuido envíos que pesan más de 100kg.

h) Las ciudades que han recibido embarques de clientes que tienen una renta anual por encima de los 90.000€.

i) Los clientes que tienen una renta anual por encima de los 90.000€ que han enviado paquetes con peso menor de un kilo.

j) Los clientes que tienen una renta anual por encima de los 90.000€ que han enviado paquetes con peso menor de un kilo o han enviado embarques a la ciudad de Madrid.

k) Los clientes cuyos envíos han sido destribuidos por el chófer Juan.

l) Los conductores que han distribuido envíos de clientes con renta anual por encima de los 120.000€ a ciudades con población superior a un millón de habitantes.

m) Clientes que han recibido envíos distribuidos por todos los chóferes.

n) Ciudades que han recibido embarques de todos los clientes.

ñ) Chóferes que han distribuido envíos a todas las ciudades.

o) Clientes que han enviado embarques a toda ciudad con población mayor de 500.000 habitantes.

### Solución del ejercicio II en álgebra relacional

### Solución del ejercicio II en cálculo relacional

### Solución del ejercicio II en cálculo de dominio