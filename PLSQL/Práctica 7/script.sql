-- Identifica y crea todas las relaciones de manera normalizada y en forma de referencias
db.createCollection("clients");
db.createCollection("orders");
db.createCollection("providers");
db.createCollection("products");

-- Inserta los siguientes datos (mediante inserción múltiple):
--clients

db.clients.insertMany([
    {_id: NumberInt(1),name:"Manuel",surname:"Domínguez",email:"manuel@email.com"}, 
    {_id: NumberInt(2),name:"Pedro",email:"pedro@email.com"},
    {_id: NumberInt(3),name:"María",surname:"Romero",email:"maria@email.com"}]
);

--orders
db.orders.insertMany([
	{_id:NumberInt(1),date:new Date("2017-01-05"), status:"PAGADO", note:"Comentario 1",total:18.90},
	{_id:NumberInt(2),date:new Date("2016-11-12"), status:"CANCELADO", total:70.00},
	{_id:NumberInt(3),date:new Date("2016-12-31"), status:"PAGADO",note:"Comentario 2",total:140.00}
]);

--order_items
db.order_items.insertMany([
	{_id:NumberInt(1), ref_order_id:NumberInt(1), ref_provider_id:NumberInt(1), quantity:NumberInt(1), price:18.90},
	{_id:NumberInt(2), ref_order_id:NumberInt(2), ref_provider_id:NumberInt(2), quantity:NumberInt(2), price:70.00},
	{_id:NumberInt(3), ref_order_id:NumberInt(3), ref_provider_id:NumberInt(2), quantity:NumberInt(1), price:140.00}
]);
	
--products
db.products.insert([
	{_id:NumberInt(1), ref_provider_id:NumberInt(1),name:"RATÓN",price:18.90},
	{_id:NumberInt(2), ref_provider_id:NumberInt(2),name:"MEMORIA USB",price:35.00,description:"64 GB"},
	{_id:NumberInt(3), ref_provider_id:NumberInt(3),name:"MONITOR",price:140.00,description:"17 pulgadas"}
]);

--providers
db.providers.insert([
	{_id:NumberInt(1), name:"MEGAINFORMATICA S.A"},
	{_id:NumberInt(2), name:"SUPERINFORMATICA"},
	{_id:NumberInt(3), name:"PCPROVIDER S.A"}
]);

--Apartados:
--Realiza las siguientes consultas:

-- Devuelve todos los productos
db.products.find();
-- Saca los pedidos cuyo estado sea “PAGADO”
db.orders.find({status:"PAGADO"});
-- Saca los productos que tengan descripción.
		db.products.find({description: {$exists: true}})
-- Saca los pedidos de importe menores o iguales a 70 euros
		db.orders.find({total: {$lte: 70}});
-- Saca los productos de los proveedores 1 y 2.
		db.products.find({$or:[{_id:NumberInt(1)},{_id:NumberInt(2)}]});
-- Cuenta los productos del proveedor 3.
		db.products.find({_id:NumberInt(3)}).count();
-- Actualiza el nombre del proveedor 3 a “PCONLINE”
		db.providers.update({_id:NumberInt(3)},{$set:{name:"PCONLINE"}});
-- Crea un índice ascendente al nombre de los clientes.
		db.clients.createIndex({name:1});
-- Elimina el campo apellido al cliente “María”
		db.clients.update({name:"María"},{$unset:{surname:""}});
-- Busca los clientes cuyo nombre comienza por “Ma”
		db.clients.find({name:{$regex: /^Ma/}});
-- Busca los pedidos que se hayan realizado entre el 1 de enero de 2017 y el 1 de febrero de 2017 ambos inclusive.
		db.orders.find({date:{$gte:new Date("2017-01-01"),$lt: new Date("2017-02-01")}});
-- Devuelve todos los pedidos del sistema ordenados por fecha de entrada en el mismo.
		db.orders.find({},{date:-1});
-- Devuelve el importe total de todos los pedidos cuyo estado sea “PAGADO”.
		db.orders.find({"status":"PAGADO"},{total:1})
-- Por último, para la colección “clients” tenéis que crear un esquema de validación en el que el nombre sea de tipo string 
-- obligatorio y el email sea de tipo string y cumpla con lo siguiente *@email.com. La validación la tiene que tener en cuenta tanto
-- al insertar, como al actualizar, para todos los datos, tanto existentes, como no existentes y que cuando falle la validación 
-- de un error y no realice la operación

db.createCollection("clients",
{ 
    validator: { $and:
    [
        {"name": {$type: "string"} },
        {"name": {$exists: true} },
        {"email": {$regex: /@email\.com$/} }
    ]}
 })

db.runCommand({
	collMod: "clients",
    validator: { $and:
    [
        {"name": {$type: "string"} },
        {"name": {$exists: true} },
        {"email": {$regex: /@email\.com$/} }
    ]},
	validationLevel: "strict"
})

db.clients.insertMany([
    {_id: NumberInt(33),surname:"Domínguez",email:"manuel@email.com"}, 
    {_id: NumberInt(44),email:"pedro@email.com"},
    {_id: NumberInt(55),surname:"Romero",email:"maria@email.com"}]
);


