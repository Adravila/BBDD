DROP TABLE articulos;
CREATE TABLE articulos(
	art_num NUMBER(38),
	art_nom VARCHAR2(20),
	art_peso NUMBER(38),
	art_col VARCHAR2(7),
	art_pc NUMBER(38) NOT NULL,
	art_pv NUMBER(38) NOT NULL,
	art_prv NUMBER(38),
	PRIMARY KEY(art_num)
);

INSERT INTO articulos VALUES(1, 'impresora', 150, 'rojo', 400, 580, 4);
INSERT INTO articulos VALUES(2, 'calculadora', 150, 'negro', 4000, 4700, 1);
INSERT INTO articulos VALUES(3, 'calendario', 100, 'blanco', 420, 600, 4);
INSERT INTO articulos VALUES(4, 'lampara', 550, 'rojo', 2100, 2980, 5);
INSERT INTO articulos VALUES(5, 'lampara', 550, 'blanco', 2000, 2900, 5);
INSERT INTO articulos VALUES(6, 'lampara', 550, 'azul', 2100, 2980, 5);
INSERT INTO articulos VALUES(7, 'lampara', 550, 'verde', 2100, 2980, 5);
INSERT INTO articulos VALUES(8, 'pesacartas 1-500', NULL, NULL, 2400, 4000, 3);
INSERT INTO articulos VALUES(9, 'pesacartas 1-1000', NULL, NULL, 3000, 5000, 3);
INSERT INTO articulos VALUES(10, 'boligrafo', 20, 'rojo', 20, 40, 2);
INSERT INTO articulos VALUES(11, 'boligrafo', 20, 'azul', 20, 40, 2);
INSERT INTO articulos VALUES(12, 'boligrafo lujo', 20, 'rojo', 60, 100, 2);
INSERT INTO articulos VALUES(13, 'boligrafo lujo', 20, 'verde', 60, 100, 2);
INSERT INTO articulos VALUES(14, 'boligrafo lujo', 20, 'azul', 60, 100, 2);
INSERT INTO articulos VALUES(15, 'boligrafo lujo', 20, 'negro', 60, 100, 2);
INSERT INTO articulos VALUES(16, 'papel', 5000, 'rosa', 3500, 4000, 2);
INSERT INTO articulos VALUES(17, 'coche', 1000, 'verde', 5000, 6000, 3);
INSERT INTO articulos VALUES(18, 'impresora', 200, 'morado', 400, 800, 3);
INSERT INTO articulos VALUES(19, 'calendario', 110, 'negro', 420, 600, 4);
INSERT INTO articulos VALUES(20, 'manta', NULL, 'malva', 400, 600, 10);
INSERT INTO articulos VALUES(69, 'papel', NULL, 'rosa', 40, 50, NULL);
INSERT INTO articulos VALUES(99, 'papel', 800, 'morado', 90, 800, 1);


DROP TABLE tiendas;
CREATE TABLE tiendas(
	tda_num NUMBER(38),
	tda_pob VARCHAR2(20) NOT NULL,
	tda_ger VARCHAR2(25),
	PRIMARY KEY(tda_num)
);

INSERT INTO tiendas VALUES(1,'madrid-batan','contesfosques, jordi');
INSERT INTO tiendas VALUES(2,'madrid-centro','martinez, juan');
INSERT INTO tiendas VALUES(3,'pamplona','dominguez, julian');
INSERT INTO tiendas VALUES(4,'barcelona','pe?a, jose maria');
INSERT INTO tiendas VALUES(5,'trujillo','mendez, pedro');
INSERT INTO tiendas VALUES(6,'jaen','marin, raquel');
INSERT INTO tiendas VALUES(7,'valencia','petit, joan');
INSERT INTO tiendas VALUES(8,'requena','marcos, pilar');
INSERT INTO tiendas VALUES(9,'palencia','castroviejo, lozano');
INSERT INTO tiendas VALUES(10,'gerona','gomez, gabriel');
INSERT INTO tiendas VALUES(11,'lyon','madoux, jean');
INSERT INTO tiendas VALUES(12,'paris','fouet, paul');
INSERT INTO tiendas VALUES(13, 'Jerez', 'Messi, Leo');

DROP TABLE clientes;
CREATE TABLE clientes(
	clt_num NUMBER(38),
	clt_apell VARCHAR2(25) NOT NULL,
	clt_nom VARCHAR2(20),
	clt_pais VARCHAR2(8),
	clt_pob VARCHAR2(20),
	PRIMARY KEY(clt_num)
);

INSERT INTO clientes VALUES(1,'borras','margarita','e','madrid');
INSERT INTO clientes VALUES(2,'perez','miguel','e','madrid');
INSERT INTO clientes VALUES(3,'dupont','jean','f','paris');
INSERT INTO clientes VALUES(4,'dupret','michel','f','lyon');
INSERT INTO clientes VALUES(5,'llopis','antoni','e','barcelona');
INSERT INTO clientes VALUES(6,'souris','marcel','f','paris');
INSERT INTO clientes VALUES(7,'go?i','pablo','e','pamplona');
INSERT INTO clientes VALUES(8,'courbon","gerad','f','lyon');
INSERT INTO clientes VALUES(9,'roman','consuelo','e','jaen');
INSERT INTO clientes VALUES(10,'roca','pau','e','gerona');
INSERT INTO clientes VALUES(11,'mancha','jorge','e','valencia');
INSERT INTO clientes VALUES(12,'curro','pablo','e','barcelona');
INSERT INTO clientes VALUES(13,'cortes','diego','e','madrid');
INSERT INTO clientes VALUES(14,'fernandez','joaquin','e','madrid');
INSERT INTO clientes VALUES(15,'duran','jacinto','e','pamplona');
INSERT INTO clientes VALUES(16,'minguin','pedro','e','pamplona');
INSERT INTO clientes VALUES(17, 'ubrique', 'jesus', 'e', 'pamplona');
INSERT INTO clientes VALUES(18, 'mazapato', 'sophie', 'e', 'madrid');
INSERT INTO clientes VALUES(19, 'bigote', 'jose mari', 'p', 'oporto');
INSERT INTO clientes VALUES(20, 'dalima sorda', 'romualdo', 'b', 'san jose');
INSERT INTO clientes VALUES(21, 'clavel rojo', 'paco', 'e', 'mala');
INSERT INTO clientes VALUES(22, 'Alonso', 'Fernando', 'e', 'Gijon');
INSERT INTO clientes VALUES(23, 'Rodriguez', 'Pedrito', 'e', 'Arico');
INSERT INTO clientes VALUES(24, 'Florero', 'Mar', 'e', 'Madrid');
INSERT INTO clientes VALUES(25, 'Florero', 'Mar', 'e', 'Barcelona');
INSERT INTO clientes VALUES(26, 'Messi', 'Leo', 'a', 'Rosario');

DROP TABLE proveedores;
CREATE TABLE proveedores(
	prv_num NUMBER(38),
	prv_nom VARCHAR2(25),
	PRIMARY KEY(prv_num)
);

INSERT INTO proveedores VALUES(1,'catio electronic');
INSERT INTO proveedores VALUES(2,'estilografica reunidas');
INSERT INTO proveedores VALUES(3,'mecanica de precision');
INSERT INTO proveedores VALUES(4,'sanjita');
INSERT INTO proveedores VALUES(5,'electrolamp');
INSERT INTO proveedores VALUES(6, 'copisteria');
INSERT INTO proveedores VALUES(7, 'el corte ingles');
INSERT INTO proveedores VALUES(8, 'Mercadiz');
INSERT INTO proveedores VALUES(9, 'El ahorramas');
INSERT INTO proveedores VALUES(10, 'zara hogar');

DROP TABLE ventas;
CREATE TABLE ventas(
	vnt_clt NUMBER(38),
	vnt_tda NUMBER(38) NOT NULL,
	vnt_art NUMBER(38) NOT NULL,
	vnt_cant NUMBER(38),
	vnt_precio NUMBER(38),
	vnt_fc VARCHAR2(6) NOT NULL,
	FOREIGN KEY (vnt_clt) REFERENCES clientes (clt_num),
	FOREIGN KEY (vnt_art) REFERENCES articulos (art_num),
	FOREIGN KEY (vnt_tda) REFERENCES tiendas (tda_num)
);

INSERT INTO ventas VALUES(22, 10, 17, 1, 6000, '991231');
INSERT INTO ventas VALUES(5, 4, 4, 1, 2980, '910106');
INSERT INTO ventas VALUES(7, 3, 10, 1, 40, '910106');
INSERT INTO ventas VALUES(7, 3, 11, 2, 80, '910106');
INSERT INTO ventas VALUES(7, 3, 14, 3, 300, '910106');
INSERT INTO ventas VALUES(8, 11, 2, 1, 4700, '910109');
INSERT INTO ventas VALUES(6, 12, 3, 2, 1200, '910109');
INSERT INTO ventas VALUES(6, 12, 15, 2, 200, '910109');
INSERT INTO ventas VALUES(13, 1, 4, 1, 2980, '910109');
INSERT INTO ventas VALUES(13, 1, 3, 1, 600, '910110');
INSERT INTO ventas VALUES(1, 2, 2, 1, 4700, '910110');
INSERT INTO ventas VALUES(1, 2, 12, 1, 100, '910110');
INSERT INTO ventas VALUES(1, 2, 13, 10, 1000, '910110');
INSERT INTO ventas VALUES(4, 11, 1, 8, 4640, '910111');
INSERT INTO ventas VALUES(4, 11, 10, 7, 280, '910111');
INSERT INTO ventas VALUES(3, 7, 6, 1, 2980, '910111');
INSERT INTO ventas VALUES(3, 7, 9, 2, 10000, '910111');
INSERT INTO ventas VALUES(1, 2, 3, 3, 1800, '910120');
INSERT INTO ventas VALUES(7, 8, 3, 1, 600, '910203');
INSERT INTO ventas VALUES(4, 5, 3, 6, 3000, '910114');
INSERT INTO ventas VALUES(10, 11, 3, 1, 600, '910116');
INSERT INTO ventas VALUES(6, 7, 3, 1, 600, '910111');
INSERT INTO ventas VALUES(3, 4, 3, 2, 1200, '910206');
INSERT INTO ventas VALUES(9, 10, 3, 1, 600, '910201');
INSERT INTO ventas VALUES(2, 3, 3, 4, 2400, '910102');
INSERT INTO ventas VALUES(8, 9, 3, 1, 500, '910130');
INSERT INTO ventas VALUES(5, 6, 3, 3, 1800, '910116');
INSERT INTO ventas VALUES(26, 4, 17, 2, 12000, '990101');
INSERT INTO ventas VALUES(19, 7, 3, 1, NULL, '960601');
INSERT INTO ventas VALUES(17, 4, 3, 10, NULL, '961028');
INSERT INTO ventas VALUES(18, 1, 3, 1, NULL, '961130');
INSERT INTO ventas VALUES(10, 4, 2, NULL, NULL, '920822');
INSERT INTO ventas VALUES(3, 13, 3, NULL, NULL, '940430');

DROP TABLE pesos;
CREATE TABLE pesos(
	peso_nom VARCHAR2(9),
	peso_min NUMBER(38) NOT NULL,
	peso_max NUMBER(38) NOT NULL,
	PRIMARY KEY(peso_nom)
);

INSERT INTO pesos VALUES('leve',0,100);
INSERT INTO pesos VALUES('ligero',101,500);
INSERT INTO pesos VALUES('medio',501,2500);
INSERT INTO pesos VALUES('pesado',2501,9999);
INSERT INTO pesos VALUES('sin peso', 0, 0);
