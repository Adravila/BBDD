# Ejemplos de SQL - Consultas anidadas
### 4.1. Clientes que viven en el mismo pais que el nº 3
```SQL
SQL> select clt_num numero, clt_nom nombre, clt_apell apellido
  2  from clientes
  3  where clt_pais =
  4  (select clt_pais
  5  from clientes
  6  where clt_num = 3);
  
  NUMERO     NOMBRE               APELLIDO
  ---------- -------------------- -------------------------
  3         jean                  dupont
  4         michel                dupret
  6         marcel                souris
  8         gerad                 courbon

4 filas seleccionadas.
```

### 4.2. Articulos con el mismo color que el nº 15 o el peso igual al nº 3
```SQL
SQL> select art_num numero, art_nom nombre
  2  from articulos
  3  where art_col =
  4  (select art_col
  5  from articulos
  6  where art_num = 15)
  7  or art_peso =
  8  (select art_peso
  9  from articulos
  10 where art_num = 3);
  
  NUMERO     NOMBRE
  ---------- --------------------
  2          calculadora
  3          calendario
  15         boligrafo lujo

3 filas seleccionadas.
```

### 4.3. Artículos con el mismo color que el nº 15 o un peso superior al del nº 3
```SQL
SQL> select art_num numero, art_nom nombre
  2  from articulos
  3  where art_col =
  4  (select art_col
  5  from articulos
  6  where art_num = 15)
  7  or art_peso >
  8  (select art_peso
  9  from articulos
  10 where art_num = 3);
  
  NUMERO     NOMBRE
  ---------- --------------------
  1          impresora
  2          calculadora
  4          lampara
  5          lampara
  6          lampara
  7          lampara
  15         boligrafo lujo
  
7 filas seleccionadas.
```

### 4.4. Articulos que tengan el mismo color y el mismo peso que el nº 10
```SQL
SQL> select art_num numero, art_nom nombre
  2  from articulos
  3  where (art_col,art_peso) =
  4  (select art_col, art_peso
  5  from articulos
  6  where art_num = 10);
  
  NUMERO     NOMBRE
  ---------- --------------------
  10         boligrafo
  12         boligrafo lujo

2 filas seleccionadas.
```

### 4.5. Datos de los artículos que tienen el mismo color de los que pesan más de 10g
```SQL
SQL> select art_num numero, art_nom nombre
  2  from articulos t1
  3  where art_num in
  4  (select art_num
  5  from articulos t2
  6  where t1.art_col = t2.art_col and t2.art_peso > 10);
  
  NUMERO     NOMBRE
  ---------- --------------------
  1          impresora
  2          calculadora
  3          calendario
  4          lampara
  5          lampara
  6          lampara
  7          lampara
  10         boligrafo
  11         boligrafo
  12         boligrafo lujo
  13         boligrafo lujo
  14         boligrafo lujo
  15         boligrafo lujo

13 filas seleccionadas.
```

### 4.6. Artículos que pesen más que cualquiera de los de color blanco
```SQL
SQL> select art_num numero, art_nom nombre
  2  from articulos
  3  where art_peso > any
  4  (select art_peso
  5  from articulos
  6  where art_col = 'blanco');
  
  NUMERO NOMBRE
  ---------- --------------------
  3          calendario
  2          calculadora
  1          impresora
  4          lampara
  5          lampara
  6          lampara
  7          lampara
  10         boligrafo
  11         boligrafo
  12         boligrafo lujo
  13         boligrafo lujo
  14         boligrafo lujo
  15         boligrafo lujo
  
13 filas seleccionadas.
```

### 4.7. Si tenemos un proveedor que se llame «sanjita» muestra todos los proveedores
```SQL
SQL> select prv_num numero, prv_nom nombre
  2  from proveedores
  3  where exists
  4  (select *
  5  from proveedores
  6  where prv_nom = 'sanjita');
  
  NUMERO     NOMBRE
  ---------- -------------------------
  1          catio electronic
  2          estilograficas reunidas
  3          mecanica de precision
  4          sanjita
  5          electrolamp

5 filas seleccionadas.
 ```
 
### 4.8 Colores de los artículos cuya media de pesos es superior a la media de todos los artículos
```SQL
SQL> select art_col color
  2  from articulos
  3  group by art_col
  4  having avg(art_peso) >=
  5  (select avg(art_peso)
  6  from articulos);

  COLOR
  -------
  blanco
  verde
  
2 filas seleccionadas.
```
