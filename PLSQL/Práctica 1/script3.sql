/* Autor: Adrián Dávila Guerra 
*  Práctica 1.3
*/

/**
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
**/

SET SERVEROUTPUT ON

DECLARE
	v_reg_inventario inventario%ROWTYPE;
	v_reg_controlventas controlventas%ROWTYPE;

	cod_art_ INTEGER;
	cantidad_ INTEGER;
BEGIN
	/* Se introducirá el código del artículo para que procese el orden de compra */
	cod_art_ := &cod_art;

	/* Se introducirá la cantidad solicita */
	cantidad_ := &cantidad;

	/* Hacemos una recuperación para obtener la fila de dicho artículo  */
	SELECT * INTO v_reg_inventario
	FROM inventario
	WHERE cod_art = cod_art_;

	SELECT * INTO v_reg_controlventas
	FROM controlventas
	WHERE cod_art = cod_art_;

	DBMS_OUTPUT.PUT_LINE(CHR(8)); -- Retorno de carro

	IF v_reg_inventario.stock_art >= cantidad_ THEN
		DBMS_OUTPUT.PUT_LINE('Procede el articulo: ' || v_reg_inventario.nombre_art);
		-- Actualizar el stock del articulo del inventario
		v_reg_inventario.stock_art := v_reg_inventario.stock_art - cantidad_;
		-- Actualizar la fecha de la ultima modificacion del articulo
		v_reg_inventario.fecha :=  SYSDATE;
		-- Actualizar el número de unidades vendidas
		v_reg_controlventas.num_unidades :=  cantidad_;
		-- Actualizar la fecha de la ultima solicitud (control ventas)
		v_reg_controlventas.fecha :=  SYSDATE;
		-- Actualizar comentario indicando que la venta ha sido realizada
		v_reg_controlventas.comentario := 'Venta realizada';

		UPDATE inventario SET row = v_reg_inventario WHERE cod_art = v_reg_inventario.cod_art;
		UPDATE controlventas SET row = v_reg_controlventas WHERE cod_art = v_reg_controlventas.cod_art;

	ELSIF v_reg_inventario.stock_art < cantidad_ THEN
		DBMS_OUTPUT.PUT_LINE('No hay Stock');
		-- Actualizar comentario indicando que no hay stock suficiente en el articulo del inventario
		v_reg_controlventas.comentario := 'No hay stock suficiente';
		-- Actualizar la fecha de la ultima solicitud (control ventas)
		v_reg_controlventas.fecha :=  SYSDATE;
		-- Actualizar el número de unidades solicitadas
		v_reg_controlventas.num_unidades :=  cantidad_;

		UPDATE controlventas SET row = v_reg_controlventas WHERE cod_art = v_reg_controlventas.cod_art;

	END IF;

	-- En caso de que no devuelva ninguna fila, ejecuta la siguiente excepcion
	EXCEPTION WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No se ha encontrado el cod_art ' || cod_art_);
END;
/