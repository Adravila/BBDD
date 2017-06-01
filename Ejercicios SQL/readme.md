1. Generar un entorno de trabajo que tenga las siguientes características:
	a) Indicación de la cuenta de Oracle donde estamos trabajando.
	b) Desactivación de las pausas.
	c) Contenido por página no superior a 20 líneas.
	d) El pie de página ha de llevar nuestro nombre completo, login del SO y el login de Oracle, cada uno en una línea distinta.
	e) Mostrar el esquema de una tabla o de una vista que le indiquemos por pantalla.
	´´´SQL
	SHOW release
	set pause off
	set lines 20
	btitle skip USER.SQL skip "Adrián Dávila Guerra"
	describe tiendas
	´´´

2. Generar un entorno de trabajo que tenga las siguientes características:
	a) Las columnas de la tabla clientes tengan un ancho máximo de 10 caracteres.
	b) Ancho de línea de 75 caracteres.
	c) Contenido por página no superior a 20 líneas.
	d) Indicar el nombre del usuario.
	e) Mostrar por pantalla los valores anteriores y posteriores de las variables del sistema.
	´´´SQL
	column clt_num format 10
	column clt_apell format a10
	column clt_nom format a10
	column clt_pais format a10
	column clt_pob format a10
	´´´

	set lines 75
	set pages 20
	SHOW user
	SHOW all

3. Generar un entorno de trabajo que tenga las siguientes características:
	a) Mostrar el contenido de una tabla que le indiquemos.
	b) Páginas no superior a 20 líneas.
	c) Versión actual de Oracle .
	d) Mostrar por pantalla los valores anteriores y posteriores de las variables del sistema.
	e) Nombre completo del usuario a pie de página.

	´´´SQL
	describe tiendas
	set pages 20
	ttitle SQL.RELEASE skip
	SHOW all
	btitle "Adrian Davila Guerra"
	´´´

4. Se desea tener un entorno de trabajo fijo para todas las sesiones de la siguiente manera:
	a) El indicativo del sistema que nos aparezca sea nuestro login del SO.
	b) Ancho de línea de 60 caracteres.
	c) Contenido por páginas no superior a 20 líneas.
	d) Indicar nuestro nombre de usuario de Oracle .
	e) Mostrar la versión actual de Oracle .

	´´´SQL
	!hostname
	set lines 60
	set pages 20
	SHOW user
	SHOW release
	´´´

5. Crear un entorno permanente de trabajo de la siguiente manera:
	a) El editor de texto por defecto sea el Kate .
	b) Nos muestre la hora actual de entrada al sistema.
	c) El prompt del sistema contenga la hora actual.
	d) Si una consulta se muestra en más de una página debe aparecernos el siguiente mensaje para pasar a la siguiente página: pulsa una tecla para continuar .

	´´´SQL
	DEFINE_EDITOR = Kate
	set time on
	SELECT sysdate FROM dual; #REM Muestra la fecha además de la hora.
	set pause "pulsa una tecla para continuar"
	´´´

6) Generar un fichero login.sql que contenga las órdenes necesarias para predefinir nuestro propio entorno de trabajo