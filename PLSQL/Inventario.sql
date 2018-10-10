/* Autor: Adrián Dávila Guerra 
*  Práctica 1.3
*/

SET SERVEROUTPUT ON

DECLARE
	v_reg_inventario inventario%ROWTYPE;
	v_reg_controlventas controlventas%ROWTYPE;
	cod_art_ INTEGER;
BEGIN
	/* Se introducirá el código del artículo para que procese el orden de compra */
	cod_art_ := &cod_art;

	/* Hacemos una recuperación para obtener la fila de dicho artículo  */
	SELECT * INTO v_reg_inventario
	FROM inventario
	WHERE cod_art = cod_art_;

	SELECT * INTO v_reg_controlventas
	FROM controlventas
	WHERE cod_art = cod_art_;

	DBMS_OUTPUT.PUT_LINE(CHR(8)); -- Retorno de carro

	IF v_reg_inventario.stock_art >= v_reg_controlventas.num_unidades AND nvl(v_reg_controlventas.comentario,'Nulo') = 'Nulo' THEN
		DBMS_OUTPUT.PUT_LINE('Procede el articulo: ' || v_reg_inventario.nombre_art);
		-- Actualizar el stock del articulo del inventario
		v_reg_inventario.stock_art := v_reg_inventario.stock_art - v_reg_controlventas.num_unidades;
		-- Actualizar la fecha de la ultima modificacion del articulo
		v_reg_inventario.fecha :=  SYSDATE;
		-- Actualizar la fecha de la ultima solicitud (control ventas)
		v_reg_controlventas.fecha :=  SYSDATE;
		-- Actualizar comentario indicando que la venta ha sido realizada
		v_reg_controlventas.comentario := 'Venta realizada';

		UPDATE inventario SET row = v_reg_inventario WHERE cod_art = v_reg_inventario.cod_art;
		UPDATE controlventas SET row = v_reg_controlventas WHERE cod_art = v_reg_controlventas.cod_art;

	ELSIF v_reg_inventario.stock_art < v_reg_controlventas.num_unidades THEN
		DBMS_OUTPUT.PUT_LINE('No hay Stock');
		-- Actualizar comentario indicando que no hay stock suficiente en el articulo del inventario
		v_reg_controlventas.comentario := 'No hay stock suficiente';
		-- Actualizar la fecha de la ultima solicitud (control ventas)
		v_reg_controlventas.fecha :=  SYSDATE;

		UPDATE controlventas SET row = v_reg_controlventas WHERE cod_art = v_reg_controlventas.cod_art;
	
	ELSIF v_reg_controlventas.comentario = 'Venta realizada' THEN
		DBMS_OUTPUT.PUT_LINE('El articulo ya ha sido procedido.');

	END IF;

	-- En caso de que no devuelva ninguna fila, ejecuta la siguiente excepcion
	EXCEPTION WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No se ha encontrado el cod_art ' || cod_art_);
END;
/
