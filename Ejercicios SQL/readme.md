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
