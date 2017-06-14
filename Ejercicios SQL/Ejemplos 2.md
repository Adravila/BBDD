# Ejemplos de SQL - Manipulación de datos
### 2.1. Proyección de datos de los proveedores
```SQL
SQL> select prv_num, prv_nom
  2 from proveedores;

  PRV_NUM    PRV_NOM
  ---------- -------------------------
           1 catio electronic
           2 estilograficas reunidas
           3 mecanica de precision
           4 sanjita
           5 electrolamp

5 filas seleccionadas.
```

### 2.2. Proyección de todos los datos de los proveedores
```SQL
SQL> select *
  2 from proveedores;
  
  PRV_NUM    PRV_NOM
  ---------- -------------------------
           1 catio electronic
           2 estilograficas reunidas
           3 mecanica de precision
           4 sanjita
           5 electrolamp

5 filas seleccionadas.
```

### 2.3. Artículos que pesan más de 100g ó el número de su proveedor es igual a 5
```SQL
SQL> select art_num, art_nom
  2 from articulos
  3 where art_peso > 100 and art_prv = 5;

  ART_NUM    ART_NOM
  ---------- --------------------
           4 lampara
           5 lampara
           6 lampara
           7 lampara
  
4 filas seleccionadas.
```

### 2.4 Los proveedores cuyo número esté entre 2 y 5
```SQL
SQL> select *
  2 from proveedores
  3 where prv_num between 2 and 5;

  PRV_NUM    PRV_NOM
  ---------- -------------------------
           2 estilograficas reunidas
           3 mecanica de precision
           4 sanjita
           5 electrolamp

4 filas seleccionadas.
  ```

### 2.5 Datos de las tiendas que no están en las ciudades indicadas
```SQL
SQL> select *
  2 from tiendas
  3 where tda_pob not in
  4 ('paris', 'barcelona', 'palencia', 'lyon');

  TDA_NUM    TDA_POB              TDA_GER
  ---------- -------------------- -------------------------
           1 madrid-batan         contesfosques, jordi
           2 madrid-centro        martinez, juan
           3 pamplona             dominguez, julian
           5 trujillo             mendez, pedro
           6 jaen                 marin, raquel
           7 valencia             petit, joan
           8 requena              marcos, pilar
           10 gerona              gomez, gabriel

8 filas seleccionadas.
```

### 2.6. Datos de los gerentes de las tiendas de Madrid
```SQL
SQL> select tda_num, tda_ger
  2 from tiendas
  3 where tda_pob like 'madrid%';
  
  TDA_NUM    TDA_GER
  ---------- -------------------------
  1          contesfosques, jordi
  2          martinez, juan
  
2 filas seleccionadas.
```

### 2.7. Datos de los artículos que no tienen definido el color
```SQL
SQL> select art_num, art_nom
  2 from articulos
  3 where art_col is null;
  
  ART_NUM    ART_NOM
  ---------- --------------------
  8          pesacartas 1-500
  9          pesacartas 1-1000
 
2 filas seleccionadas.
```

### 2.8. Mostrar todos los colores de los artículos
```SQL
SQL> select distinct art_col
  2 from articulos
  3 where art_col is not null;

  ART_COL
  -------
  azul
  blanco
  negro
  rojo
  verde
  
5 filas seleccionadas.
```

### 2.9. Mostrar todos los colores de los artículos
```SQL
SQL> select distinct art_col "Colores"
  2 from articulos
  3 where art_col is not null;
  
  Colores
  -------
  azul
  blanco
  negro
  rojo
  verde
  
5 filas seleccionadas.
```

### 2.10. Datos de los artículos ordenados ascendente por su precio de compra
```SQL
SQL> select art_num Numero, art_nom Nombre
  2 from articulos
  3 where art_num < 10
  4 order by art_pc;
  
  NUMERO     NOMBRE
  ---------- --------------------
           1 impresora
           3 calendario
           5 lampara
           4 lampara
           7 lampara
           6 lampara
           8 pesacartas 1-500
           9 pesacartas 1-1000
           2 calculadora

9 filas seleccionadas.

SQL> select distinct art_nom Nombre
  2 from articulos
  3 where art_num < 10
  4 order by art_pc;

order by art_pc
         *
ERROR en linea 4:
ORA-01791: no es una expresion obtenida bajo SELECT
```

### 2.11. Inserción de tuplas en una tabla
```SQL
SQL> insert into tiendas
  2 values (16, 'Pto. Real', 'Martin, Luis');
1 fila creada.
...
SQL> insert into tiendas (tda_num, tda_ger, tda_pob)
2 values (16,' Martin, Luis', 'Pto. Real');
1 fila creada.
...
SQL> insert into tiendas
  2 values (16, 'Pto. Real', null);
1 fila creada.
```

### 2.12. Actualización del peso de un artículo
```SQL
SQL> update articulos
  2 set art_peso = (select art_peso
  3 from articulos
  4 where art_num = 27)
  5 where art_num = 24;
  
1 fila actualizada.
```

### 2.13. Eliminación de algunas tuplas de la tabla art_2
```SQL
SQL> delete from art_2
  2 where art_num > 20;
  
6 filas suprimidas.
```
