# Ejemplos de SQL - Consultas a múltiples tablas
### 5.1. Producto cartesiano entre proveedores y pesos
```SQL
SQL> select art_num numero, art_nom nombre, proveedores.*
  2  from articulos, proveedores
  3  where art_num < 4;
  
    NUMERO   NOMBRE               PRV_NUM    PRV_NOM
  ---------- -------------------- ---------- -------------------------
           1 impresora            1          catio electronic
           2 calculadora          1          catio electronic
           3 calendario           1          catio electronic
           1 impresora            2          estilograficas reunidas
           2 calculadora          2          estilograficas reunidas
           3 calendario           2          estilograficas reunidas
           1 impresora            3          mecanica de precision
           2 calculadora          3          mecanica de precision
           3 calendario           3          mecanica de precision
           1 impresora            4          sanjita
           2 calculadora          4          sanjita
           3 calendario           4          sanjita
           1 impresora            5          electrolamp
           2 calculadora          5          electrolamp
           3 calendario           5          electrolamp
           
15 filas seleccionadas.
```

### 5.2. Datos de los artículos y del proveedor que lo suministra
```SQL
SQL> select art_num numero, art_nom nombre, proveedores.*
  2  from articulos, proveedores
  3  where art_prv = prv_num;
  
  NUMERO     NOMBRE               PRV_NUM    PRV_NOM
  ---------- -------------------- ---------- -------------------------
  2          calculadora          1          catio electronic
  10         boligrafo            2          estilograficas reunidas
  11         boligrafo            2          estilograficas reunidas
  12         boligrafo lujo       2          estilograficas reunidas
  15         boligrafo lujo       2          estilograficas reunidas
  14         boligrafo lujo       2          estilograficas reunidas
  13         boligrafo lujo       2          estilograficas reunidas
  8          pesacartas 1-500     3          mecanica de precision
  9          pesacartas 1-1000    3          mecanica de precision
  1          impresora            4          sanjita
  3          calendario           4          sanjita
  4          lampara              5          electrolamp
  5          lampara              5          electrolamp
  6          lampara              5          electrolamp
  7          lampara              5          electrolamp

15 filas seleccionadas.
```

### 5.3. Datos de los artículos y sus proveedores cuyos no son menores que 4
```SQL
SQL> select art_num numero, art_nom nombre, proveedores.*
  2  from articulos, proveedores
  3  where art_prv = prv_num and art_num < 4;
  
  NUMERO     NOMBRE               PRV_NUM    PRV_NOM
  ---------- -------------------- ---------- -------------------------
  2          calculadora          1          catio electronic
  1          impresora            4          sanjita
  3          calendario           4          sanjita

3 filas seleccionadas.
```

### 5.4. Datos de artículos cuyos no es mayor que 4 que se han vendido o no
```SQL
SQL> select art_num numero, art_nom nombre,
  2  to_date(vnt_fch,'yymmdd') fecha
  3  from articulos,ventas
  4  where art_num = vnt_art(+) and art_num > 3;
  
  NUMERO     NOMBRE               FECHA
  ---------- -------------------- --------
  4          lampara              06/01/91
  4          lampara              09/01/91
  5          lampara
  6          lampara              11/01/91
  7          lampara
  8          pesacartas 1-500
  9          pesacartas 1-1000    11/01/91
  10         boligrafo            06/01/91
  10         boligrafo            11/01/91
  11         boligrafo            06/01/91
  12         boligrafo lujo       10/01/91
  13         boligrafo lujo       10/01/91
  13         boligrafo lujo       22/02/92
  14         boligrafo lujo       06/01/91
  15         boligrafo lujo       09/01/91
  15         boligrafo lujo       09/05/01
  
16 filas seleccionadas.
```

### 5.5. Autouniones
```SQL
SQL> select t1.clt_num numero, t1.clt_nom nombre, t1.clt_apell
  2  from clientes t1, clientes t2
  3  where t1.clt_pais = t2.clt_pais and t2.clt_nom like 'm%'
  4  and t2.clt_num > 10;

  NUMERO     NOMBRE               CLT_APELL
  ---------- -------------------- -------------------------
  1         margarita             borras
  2         miguel                perez
  5         antoni                llopis
  7         pablo                 goqi
  9         consuelo              roman
  10        pau                   roca
  11        jorge                 mancha
  12        pablo                 curro
  13        diego                 cortes
  14        joaquin               fernandez
  15        jacinto               duran
  
11 filas seleccionadas.
```

### 5.6 Clasificar los artículos cuyos no estén comprendidos entre 2 y 10, según su peso
```SQL
SQL> select art_num numero, art_nom nombre, peso_nom tipo
  2  from articulos, pesos
  3  where art_peso between peso_min and peso_max
  4  and art_num between 2 and 10;
  
  NUMERO     NOMBRE               TIPO
  ---------- -------------------- ---------
  3         calendario            leve
  10        boligrafo             leve
  2         calculadora           ligero
  4         lampara               medio
  5         lampara               medio
  6         lampara               medio
  7         lampara               medio

7 filas seleccionadas.
```

### 5.7 Los números de todos los artículos que se han vendido o no
```SQL
SQL> select art_num numero
  2  from articulos
  3  union
  4  select vnt_art
  5  from ventas;

  NUMERO
  ----------
  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  11
  12
  13
  14
  15
  
15 filas seleccionadas.
```

### 5.8 Los números de todos los artículos que se han vendido
```SQL
SQL> select art_num numero
  2  from articulos
  3  intersect
  4  select vnt_art
  5  from ventas;

  NUMERO
  ----------
  1
  2
  3
  4
  6
  9
  10
  11
  12
  13
  14
  15

12 filas seleccionadas.
```

### 5.9. Los números de todos los artículos que no se han vendido
```SQL
SQL> select art_num numero
  2  from articulos
  3  minus
  4  select vnt_art
  5  from ventas;
  
  NUMERO
  ----------
  5
  7
  8
  
3 filas seleccionadas.
```

### 5.10. Producto natural
```SQL
SQL> select clt_num numero, clt_nom nombre, clt_apell apellido
  2  from clientes, ventas
  3  where clt_num = vnt_clt and vnt_art = 3;
  
  NUMERO     NOMBRE               APELLIDO
  ---------- -------------------- -------------------------
  6          marcel               souris
  13         diego                cortes

2 filas seleccionadas.
```

### 5.11. Consulta anidada
```SQL
SQL> select clt_num numero, clt_nom nombre, clt_apell apellido
  2  from clientes
  3  where clt_num in
  4  (select vnt_clt
  5  from ventas
  6  where vnt_art = 3);

  NUMERO     NOMBRE               APELLIDO
  ---------- -------------------- -------------------------
  6          marcel               souris
  13         diego                cortes
  
2 filas seleccionadas.
```

### 5.12. Consulta correlacionada
```SQL
SQL> select clt_num numero, clt_nom nombre, clt_apell apellido
  2  from clientes
  3  where 3 in
  4  (select vnt_art
  5  from ventas
  6  where vnt_clt = clt_num);
  
NUMERO     NOMBRE               APELLIDO
---------- -------------------- -------------------------
6          marcel               souris
13         diego                cortes

2 filas seleccionadas.
```

### 5.13. Consulta de existencia
```SQL
SQL> select clt_num numero, clt_nom nombre, clt_apell apellido
  2  from clientes
  3  where exists
  4  (select *
  5  from ventas
  6  where vnt_clt = clt_num and vnt_art = 3);
  
  NUMERO     NOMBRE               APELLIDO
  ---------- -------------------- -------------------------
  6          marcel               souris
  13        diego                 cortes
  
2 filas seleccionadas.
```
