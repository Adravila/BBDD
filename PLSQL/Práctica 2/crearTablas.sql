/* Autor: Adrián Dávila Guerra 
*  Práctica 2
*/

CREATE TABLE Cuentas(
	IDCuenta NUMBER(4),
	Valor NUMBER(11,2),
	CONSTRAINT PK_Cuentas PRIMARY KEY(IDCuenta)
);

CREATE TABLE Acciones(
	IdCuenta NUMBER(4),
	TipoOp CHAR(1),
	NuevoValor NUMBER(11,2),
	Estado VARCHAR2(45),
	FechaMod DATE,
	CONSTRAINT PK_Acciones PRIMARY KEY(IdCuenta)
);

INSERT INTO Cuentas(IDCuenta, Valor) VALUES (1,1000);
INSERT INTO Cuentas(IDCuenta, Valor) VALUES (2,2000);
INSERT INTO Cuentas(IDCuenta, Valor) VALUES (3,1500);
INSERT INTO Cuentas(IDCuenta, Valor) VALUES (4,6500);
INSERT INTO Cuentas(IDCuenta, Valor) VALUES (5,500);

INSERT INTO Acciones(IdCuenta, TipoOp, NuevoValor) VALUES (3,'a',599);
INSERT INTO Acciones(IdCuenta, TipoOp, NuevoValor) VALUES (6,'i',20999);
INSERT INTO Acciones(IdCuenta, TipoOp) VALUES (5,'B');
INSERT INTO Acciones(IdCuenta, TipoOp, NuevoValor) VALUES (7,'A',1599);
INSERT INTO Acciones(IdCuenta, TipoOp, NuevoValor) VALUES (1,'i',399);
INSERT INTO Acciones(IdCuenta, TipoOp) VALUES (9,'b');
INSERT INTO Acciones(IdCuenta, TipoOp) VALUES (10,'h');