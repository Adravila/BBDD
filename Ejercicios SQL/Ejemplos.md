# Ejemplos de SQL
## 1.1. Identificación ante el producto
```SQL
  > sqlplus
  SQL*Plus: Release 9.2.0.1.0 - Production on Tue Apr 13 16:28:13 2004
  Copyright (c) 1982, 2002, Oracle Corporation. All rights reserved.
  Enter user-name: nombre_usuario@juno
  Enter password:
  SQL>
```

```SQL
  > sqlplus nombre_usuario@juno
  SQL*Plus: Release 9.2.0.1.0 - Production on Tue Apr 13 16:35:01 2004
  Copyright (c) 1982, 2002, Oracle Corporation. All rights reserved.
  Enter password:
  SQL>
```

## 1.2. Conexión con usuario
```SQL
SQL> conn nombre_usuario@juno
Introduzca la clave:
Connected.
SQL>
```

```SQL
SQL> conn
Enter user-name: nombre_usuario@juno
Enter password:
Connected.
SQL>
```

## 1.3. Desconexión con usuario
```
SQL> disconnect
SQL>
Disconnected from Oracle9i Enterprise Edition Release 9.2.0.1.0 - Production
JServer Release 9.2.0.1.0 - Production
SQL>
```

## 1.4. Mostrar el contenido del buffer
```SQL
SQL> l
1 select *
2* from proveedores
SQL>
```

## 1.5. Añadir una línea a la orden del buffer
```SQL

SQL> i where prv_num > 2
SQL> l
1 select *
2 from proveedores
3* where prv_num > 2
SQL>
```

## 1.6. Borrar línea y cambiar texto
```SQL
SQL> del
SQL> l
1 select *
2* from proveedores
SQL> c/proveedores/tiendas
2* from tiendas
SQL>
```

## 1.7. Manera de mostrar un error
```SQL
SQL> select art_num
2 from proveedores;
select art_num
*
ERROR en linea 1:
ORA-00904: "ART_NUM": identificador no valido
SQL>
```

## 1.8. Salvar el buffer y guardar la ejecución en un fichero
```SQL
SQL> l
1 select *
2* from proveedores
SQL> save fich-con
Creado archivo fich-con.sql
SQL> spool resul
SQL> @fich-con

PRV_NUM | PRV_NOM
------- | -------------------------
1       | catio electronic
2       | estilograficas reunidas
3       | mecanica de precision
4       | sanjita
5       | electrolamp
5       | filas seleccionadas.

SQL> spool off
SQL> !less resul.lst
SQL>
```

## 1.9. Definición de editor
```SQL
SQL> define_editor = jed
SQL>
```

## 1.10. Edición de fichero
```SQL
SQL> edit consulta
```

## 1.11. Edición del buffer
```SQL
SQL> edit afiedt
```

o bien, simplemente:

```SQL
SQL> edit
```

## 1.12. Descripción de un objeto
```SQL
SQL> describe proveedores

Nombre  | ?Nulo?   | Tipo
------------------------------------------
PRV_NUM | NOT NULL | NUMBER(38)
PRV_NOM | NOT NULL | VARCHAR2(25)
```

## 1.13. Ayuda de una orden
```SQL
SQL> help save
SAVE
----
Saves the contents of the SQL buffer in a host operating system
script.
In iSQL*Plus, click the Save Script button to save the Input area
contents to a script.
SAV[E] file_name[.ext] [CRE[ATE] | REP[LACE] | APP[END]]
Not available in iSQL*Plus
```

## 1.14. Título y pie de página
```SQL
SQL> ttitle center 'Informe del dia'
SQL> btitle skip SQL.USER skip 'UCA'
SQL> select *
2 from proveedores;
                              Informe del dia
  PRV_NUM  PRV_NOM
---------- -------------------------
1          catio electronic
2          estilograficas reunidas
3          mecanica de precision
4          sanjita
5          electrolamp

GADESCHI
UCA

5 filas seleccionadas.
```

## 1.15. Formateo de columnas
```SQL
SQL> column art_nom alias nombre
SQL> column nombre format a6
SQL> column art_pv format 99999
SQL> select *
2 from articulos
3 where art_num < 4;

   ART_NUM ART_NO   ART_PESO ART_COL     ART_PC ART_PV    ART_PRV
---------- ------ ---------- ------- ---------- ------ ----------
         1 impres        150 rojo           400    580          4
           ora
         2 calcul        150 negro         4000   4700          1
           adora
         3 calend        100 blanco         420    600          4
           ario

3 filas seleccionadas.
```

## 1.16. Establecer variables
```SQL
SQL> set pages 20
SQL> set echo on
SQL> set pause off
SQL>
```

## 1.17. Valores de variables 
```SQL
SQL> show pages
pagesize 20
SQL> show user
USER es "GADESCHI"
SQL>
```

## 1.18. Eliminar valor de variable
```SQL
SQL> undefine var1
SQL> define var1
SP2-0135: el simbolo var1 es UNDEFINED (INDEFINIDO)
SQL>
```

## 1.19. Uso de variables con &
```SQL
SQL> select *
2 from &var1;
Introduzca un valor para var1: proveedores
antiguo 2: from &var1
nuevo 2: from proveedores

   PRV_NUM PRV_NOM
---------- -------------------------
         1 catio electronic
         2 estilograficas reunidas
         3 mecanica de precision
         4 sanjita
         5 electrolamp
 
5 filas seleccionadas.
```

## 1.20 Uso de variables con & (cont.)
```SQL
SQL> describe &tab
Introduzca un valor para tab: proveedores

Nombre                ?Nulo?   Tipo
--------------------- -------- ----------------------------
PRV_NUM               NOT NULL NUMBER(38)
PRV_NOM               NOT NULL VARCHAR2(25)

## 1.21 Redefinición de operador
```SQL
SQL> set define #
SQL> select *
2 from #var1;
Introduzca un valor para var1: proveedores
antiguo 2: from #var1
nuevo 2: from proveedores
PRV_NUM PRV_NOM
---------- -------------------------
1 catio electronic
2 estilograficas reunidas
3 mecanica de precision
4 sanjita
5 electrolamp
5 filas seleccionadas.
```

## 1.22 Contenido del fichero nombre_fichero
```SQL
SELECT &1
FROM &2;
```

## 1.23 Uso del operador & con órdenes de SQL*Plus
```SQL
SQL> describe &var
Introduzca un valor para var: proveedores

Nombre              ?Nulo?   Tipo
------------------- -------- --------------------
PRV_NUM             NOT NULL NUMBER(38)
PRV_NOM             NOT NULL VARCHAR2(25)
```

## 1.24 Uso de variables con & y &&
```SQL
SQL> select *
2 from &&var1;
Introduzca un valor para var1: proveedores
antiguo 2: from &&var1
nuevo 2: from proveedores

PRV_NUM    PRV_NOM
---------- -------------------------
         1 catio electronic
         2 estilograficas reunidas
         3 mecanica de precision
         4 sanjita
         5 electrolamp
         5 filas seleccionadas.
         
SQL> run
1 select *
2* from &&var1
antiguo 2: from &&var1
nuevo 2: from proveedores

PRV_NUM PRV_NOM
---------- -------------------------
         1 catio electronic
         2 estilograficas reunidas
         3 mecanica de precision
         4 sanjita
         5 electrolamp
         
5 filas seleccionadas.

SQL> delete from &var1;
SQL>
```

## 1.25. Fichero de órdenes: login.sql
```SQL
REM nos muestra el nombre del usuario
SHOW user
REM establecemos a 16 el número máximo de registros por página
SET pages 16
REM nos mostrará la versión del Oracle
SHOW release
REM establecemos el editor por defecto
DEFINE_EDITOR = jed
/* activamos la pausa y hacemos que nos muestre el mensaje
'pulsa return ' después de cada página */
SET PAUSE ON
SET PAUSE 'pulsa return '
REM nos mostrará la fecha de hoy con formato por defecto
SELECT sysdate
FROM dual;
```

## 1.33 Listado de órdenes del SQL*Plus
```SQL
SQL> help index
Enter Help [topic] for help.
@             DISCONNECT      RESERVED WORDS(SQL)
@@            EDIT            RESERVED WORDS (PL/SQL)
/             EXECUTE         RUN
ACCEPT        EXIT            SAVE
APPEND        GET             SET
ARCHIVE LOG   HELP            SHOW
ATTRIBUTE     HOST            SHUTDOWN
BREAK         INPUT           SPOOL
BTITLE        LIST            SQLPLUS
CHANGE        PASSWORD        START
CLEAR         PAUSE           STARTUP
COLUMN        PRINT           STORE
COMPUTE       PROMPT          TIMING
CONNECT       QUIT            TTITLE
COPY          RECOVER         UNDEFINE
DEFINE        REMARK          VARIABLE
DEL           REPFOOTER       WHENEVER OSERROR
DESCRIBE      REPHEADER       WHENEVER SQLERROR
```
