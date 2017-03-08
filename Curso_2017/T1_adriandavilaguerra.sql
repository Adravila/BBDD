#REM TEMA 1: 1) Generar un entorno de trabajo que tenga las siguientes características:
#REM a) Indicación de la cuenta de Oracle donde estamos trabajando.
#REM b) Desactivación de las pausas.
#REM c) Contenido por página no superior a 20 líneas.
#REM d) El pie de página ha de llevar nuestro nombre completo, login del SO y el login de
#REM  Oracle, cada uno en una línea distinta.
#REM  e) Mostrar el esquema de una tabla o de una vista que le indiquemos por pantalla.

SHOW release
set pause off
set lines 20
btitle skip USER.SQL skip "Adrián Dávila Guerra"
describe tiendas

#REM TEMA 1: 2) Generar un entorno de trabajo que tenga las siguientes características:
#REM a) Las columnas de la tabla clientes tengan un ancho máximo de 10 caracteres.
#REM b) Ancho de línea de 75 caracteres.
#REM c) Contenido por página no superior a 20 líneas.
#REM d) Indicar el nombre del usuario.
#REM e) Mostrar por pantalla los valores anteriores y posteriores de las variables del sistema.

column clt_num format 10
column clt_apell format a10
column clt_nom format a10
column clt_pais format a10
column clt_pob format a10

set lines 75
set pages 20
SHOW user
SHOW all

# REM TEMA 2: 2) Visualizar por pantalla los nombres de todos los proveedores.
SELECT prv_nom FROM Proveedores;