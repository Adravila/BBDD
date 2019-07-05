create KEYSPACE myecommerce with replication = {'class':'SimpleStrategy','replication_factor':1};
USE myecommerce;

create table clientes(
	nombre text,
	apellidos text,
	email text,
	edad tinyint,
	zona text,
	primary key (zona, edad, email)
) with comment = 'Clientes' and CLUSTERING order by (edad asc, email desc);

create index nombreIdx on clientes(nombre);

begin batch
	insert into clientes (nombre, apellidos, email, edad, zona) values ('Juan','Martínez','juan@email.com',28,'Norte');
	insert into clientes (nombre, apellidos, email, edad, zona) values ('María','García','maria@email.com',25,'Sur');
	insert into clientes (nombre, apellidos, email, edad, zona) values ('Domingo','','domingo@email.com',32,'Norte');
	insert into clientes (nombre, apellidos, email, edad, zona) values ('Roberto','Luján','roberto@email.com',21,'Norte');
	insert into clientes (nombre, apellidos, email, edad, zona) values ('Mario','García','mario@email.com',25,'Sur');
apply batch


/******************************************/

/** Consulta todos los clientes que tengan menos de 25 años y cuyo email sea 'juan@email.com' */
select * from clientes where email = 'juan@email.com' and edad < 25 allow filtering;

/** Consulta todos los clientes de la zona â€˜Norteâ€™ que tengan mÃ¡s de25 aÃ±os */ 
select * from clientes where zona = 'Norte' and edad > 25;

/** Saca el cliente que sea mayor y menor de cada una de las zonas por separado */
select zona, max(edad), min(edad)
from clientes
where zona = 'Norte';

select zona, max(edad), min(edad)
from clientes
where zona = 'Sur';

/** Calcula la media de edad de los clientes de cada una de las zonas */
select zona, avg(edad)
from clientes
group by zona;

/** Consulta los clientes de la zona 'Sur' cuyo nombre sea 'Mario' */
select *
from clientes
where zona = 'Sur' and nombre = 'Mario';

/** Actualiza los apellidos a 'Alarcón' de un cliente que tengan
* exactamente 21 años, cuya zona sea 'Norte' y el email sea
* 'roberto@email.com'.
*/

update clientes set apellidos = 'Alarcón' where edad = 21 and zona = 'Norte' and email = 'roberto@email.com'

/**
*Elimina el cliente de la zona 'Sur' cuyo email sea
* 'mario@email.com' y la edad sea de 25 años.
*/

delete from clientes where zona = 'Sur' and email = 'mario@email.com' and edad = 25;

/**
* Crea una MV que almacene los clientes mayores o iguales de 18 
* años y menores o iguales de 30 años 
*/

create materialized view clientes_by_edad as 
	select * from clientes
	where edad >= 18 and edad <= 30 and email is not NULL
	primary key (zona, edad,email)
	with comment = 'Clientes jovenes';

select * from clientes_by_edad;