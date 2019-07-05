/* Autor: Adrián Dávila Guerra 
*  Práctica 1.3
*/

CREATE TABLE Inventario(
	cod_art INTEGER,
	nombre_art VARCHAR(20),
	stock_art INTEGER, 
	fecha DATE,
	CONSTRAINT PK_Inventaro PRIMARY KEY(cod_art)
);

CREATE TABLE ControlVentas(
	cod_art INTEGER,
	num_unidades INTEGER,
	fecha DATE,
	comentario VARCHAR(30),
	CONSTRAINT PK_ControlVentas PRIMARY KEY(cod_art),
	CONSTRAINT FK_ControlVentas FOREIGN KEY(cod_art) REFERENCES Inventario
);

INSERT INTO Inventario(cod_art, nombre_art, stock_art, fecha) VALUES(1,'Canaleta adhesiva', 0, '09/01/2018');
INSERT INTO Inventario(cod_art, nombre_art, stock_art, fecha) VALUES(2,'Caja estanca redonda 80x45', 12, '09/01/2018');
INSERT INTO Inventario(cod_art, nombre_art, stock_art, fecha) VALUES(3,'Caja estanca con conos', 53, '09/01/2018');
INSERT INTO Inventario(cod_art, nombre_art, stock_art, fecha) VALUES(4,'Rollo pasacables Simon Brico', 6, '09/01/2018');
INSERT INTO Inventario(cod_art, nombre_art, stock_art, fecha) VALUES(5,'Regleta de conexion Simon', 3, '09/01/2018');

INSERT INTO ControlVentas(cod_art) VALUES (1);
INSERT INTO ControlVentas(cod_art) VALUES (2);
INSERT INTO ControlVentas(cod_art) VALUES (3);
INSERT INTO ControlVentas(cod_art) VALUES (4);
INSERT INTO ControlVentas(cod_art) VALUES (5);