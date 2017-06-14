# Ejemplos de SQL - Funciones y expresiones
### 3.1. Beneficio de los artículos
```SQL
SQL> select art_num Numero, art_nom Nombre,
  2 (art_pv - art_pc) Beneficio
  3 from articulos;
  
  NUMERO     NOMBRE               BENEFICIO
  ---------- -------------------- ----------
           3 calendario           180
           2 calculadora          700
           1 impresora            180
           4 lampara              880
           5 lampara              900
           6 lampara              880
           7 lampara              880
           8 pesacartas 1-500     1600
           9 pesacartas 1-1000    2000
           10 boligrafo           20
           11 boligrafo           20
           12 boligrafo lujo      40
           13 boligrafo lujo      40
           14 boligrafo lujo      40
           15 boligrafo lujo      40
  
15 filas seleccionadas.
```

### 3.2. Descripción de la tabla dual
```SQL
SQL> describe dual

  Nombre                                ?Nulo?   Tipo
  ------------------------------------- -------- -------------------------
  DUMMY                                          VARCHAR2(1)
```

### 3.3. Raíz cuadrada de 27
```SQL
SQL> select sqrt(27) "raiz de 27"
  2 from dual;

  raiz de 27
  -----------
  5,19615242

1 fila seleccionada.
```

### 3.4. 3 elevado al cubo
```SQL
SQL> select power(3,3) "3 elevado al cubo"
  2 from dual;

  3 elevado al cubo
  -----------------
  27
  
1 fila seleccionada.
```

### 3.5. Inicial de los nombres de clientes en mayúscula
```SQL
SQL> select initcap(clt_nom) "Nombre"
  2 from clientes;
  
  Nombre
  --------------------
  Margarita
  Miguel
  Jean
  Michel
  Antoni
  Marcel
  Pablo
  Gerad
  Consuelo
  Pau
  Jorge
  Pablo
  Diego
  Joaquin
  Jacinto
  Pedro
  
16 filas seleccionadas.
```
### 3.6. ¿Qué proveedor tiene el nombre más largo?
```SQL
SQL> select prv_num numero, length(prv_nom) nombre
2 from proveedores;

  NUMERO     NOMBRE
  ---------- ----------
           1 16
           2 23
           3 21
           4 7
           5 11

5 filas seleccionadas.
```

### 3.7 ¿Quién soy?
```SQL
SQL> select user
  2 from dual;
  
  USER
  ------------------------------
  GADESCHI
  
1 fila seleccionada.
```

### 3.8. Precio máximo de los artículos por color
```SQL
SQL> select art_col Color, max(art_pc) "maximo precio compra"
  2 from articulos
  3 where art_col is not null
  4 group by art_col;

  COLOR   maximo precio compra
  ------- --------------------
  azul                    2100
  blanco                  2000
  negro                   4000
  rojo                    2100
  verde                   2100
  
5 filas seleccionadas.
``` 

### 3.9. Precio máximo de los artículos por color, contando a los indefinidos
```SQL
SQL> select nvl(art_col,'indefinido') Color,
  2 max(art_pc) "maximo precio compra"
  3 from articulos
  4 group by art_col;

  COLOR      maximo precio compra
  ---------- --------------------
  azul                      2100
  blanco                    2000
  negro                     4000
  rojo                      2100
  verde                     2100
  indefinido                3000
  
6 filas seleccionadas.
```

### 3.10. ¿Qué color lo llevan más de dos artículos?
```SQL
SQL> select nvl(art_col,'indefinido') Color,
  2 count(*) "Numero de elementos"
  3 from articulos
  4 group by art_col
  5 having count(*) > 2;
  
  COLOR      Numero de elementos
  ---------- -------------------
  azul       3
  rojo       4
  
2 filas seleccionadas.
```

### 3.11 Mostrar todos los colores de los artículos, incluido los nulos
```SQL
SQL> select distinct nvl(art_col,'indefinido') "Colores"
  2 from articulos;

  Colores
  ----------
  azul
  blanco
  indefinido
  negro
  rojo
  verde
  
6 filas seleccionadas.
```

### 3.12. Peso medio de los artículos, forma 1
```SQL
SQL> select avg(nvl(art_peso,0)) "Peso medio"
  2 from articulos;
  
  Peso medio
  ----------
  181,333333
  
1 fila seleccionada.
```

### 3.13. Peso medio de los artículos, forma 2
```SQL
SQL> select avg(art_peso) "Peso medio"
  2 from articulos;

  Peso medio
  ----------
  209,230769
  
1 fila seleccionada.
```
