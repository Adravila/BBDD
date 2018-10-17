/* Autor: Adravila */

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
