# Ejercicios resueltos de cálculo relacional y de dominio

## Ejercicio I

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

expresar en álgebra relacional las siguientes consultas:

a) ¿Qué clientes tienen una renta anual que excede de 30.000€?
b) ¿Cuál es el nombre del cliente nº 433?
c) ¿Cuál es la ciudad destino del embarque número 3244?
d) ¿Qué camiones han transportado paquetes con un peso por encima de los 100kg?
e) ¿Cuáles son los nombres de los clientes que han enviado paquetes a la ciudad de Vigo?
f) A qué destinos han enviado paquetes los clientes con renta anual inferior a 6.000€?

## Solución del ejercicio II en álgebra relacional

a) σ renta_anual > 30.000 (Cliente)

b) π nom_cliente (σ id_cliente = 433 (Cliente))

c) π destino (σ num_embarque = 3244 (Embarque))

d) π id_camión (σ peso > 100 (Embarque))

e) 	A <- (π id_cliente (σ destino = 'Vigo' (destino)))
	π nom_cliente (Cliente |><| A)

f)	A <- (π id_cliente (σ renta_anual < 6.000 (Cliente)))
	π destino (Embarque |><| A)

