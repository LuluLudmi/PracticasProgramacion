-- Clase 03

-- -------------------------
-- -------- Ejercicio 1
-- -------------------------


-- 1- Crear la tabla facturas dentro de la base de datos con el siguiente detalle:

-- letra		char y PK
-- numero		int y PK
-- fecha		date
-- monto		double

-- PK significa Primary Key
-- observar que se esta declarando una clave primaria compuesta
-- es decir (letra,codigo)
-- cada campo por si solo no es clave, ni tampoco identifica al registro
-- pero la suma de los dos forman la clave

use cursomysql;

create table facturas(
	letra char(1),
    numero int,
    fecha date not null,
    monto double not null,
    primary key(letra, numero)
);

describe facturas;

create table articulos(
	codigo int primary key,
    nombre varchar(50) not null,
    precio double not null,
    stock int not null
);

-- insertamos más registros a la tabla clientes
insert into clientes (nombre, apellido, cuit, direccion) values
('Homero', 'Thompson', '22336655487', 'Calle Falsa 123'),
('Fabián', 'Sanchez', '88665544985', 'Medrano 12345'),
('Luisana', 'Verón', '66554499875', 'Medrano 37'),
('Adolfina', 'Conti', '45653215478', 'Diaz Velez 123'),
('Otto', 'Wendell', '45687452159', 'Riglos 156'),
('Marcos', 'Gonzalez', '12346578965', null),
('Grecia', 'Huequi', '53626589457', 'Baigorria 42583'),
('Juan', 'Perez', '42358547569', 'Rosales 235'),
('Marcelo', 'Lopez', '12365666325', 'Salta 12'),
('María', 'Gonzalez', '23659874523', 'Lanús 123'),
('Juan', 'Catillo', '12356849753', null),
('Mario', 'Canteros', '23658585857', 'Mendoza 123'),
('Mariano', 'Pecollio', '12365478542', 'Belgrano 234');

select * from clientes;
-- el * es un comodín
select nombre from clientes;
-- muestra solo los nombres de todos los registros

select nombre, apellido from clientes;
-- listar los nombres y apellidos de todos los clientes

select nombre from clientes; -- 17

select distinct nombre from clientes;
-- no muestra los duplicados


-- Operadores relacionales
/*
=	igual
!=	no igual
<>	distinto
>	mayor
<	menor
>=	mayor o igual
<=	menor o igual
*/

-- filtrado con where
select * from clientes where nombre = 'Juan';
-- muestra todos los campos de todos los registros cuyo nombre sea igual a Juan

select * from clientes where nombre = 'JUAN';
-- trae los mimos resultados de la consulta anterior

insert into clientes (nombre, apellido, cuit) values
('Juan Carlos', 'Mendieta', '77885544123');

select * from clientes where codigo = 3;
-- lista los registros que tengan código igual a 3

select * from clientes where codigo > 3;
-- trae todos los campos de todos los clientes cuyo código sea mayor a 3

select * from clientes where codigo >= 3;
-- trae todos los campos de todos los registros cuyo código sea mayor o igual a 3

select * from clientes where codigo <> 3;
-- trae todos los campos de todos los registros cuyo código no sea igual a 3

-- operadores lógicos AND y OR
select * from clientes where codigo < 3 or codigo > 5;
-- lista todos los campos de todos los registros cuyo código sea menor a 3
-- o mayor a 5.

select * from clientes where codigo >= 3 and codigo <= 5; 
-- lista todos los campos de todos los registros cuyo código sea mayor o igual a 3
-- y menor o igual a 5.  

-- valores NULL
-- NULL significa desconocido, es una ausencia de valor
-- y no debe interpretarse como vacío o 0
-- Los valores nulos no ocupan espacio y son distintos al 0 o al espacio en blanco.
-- Hay que tener cuidado con los valores nulos en las operaciones, ya que 1 * NULL
-- es igual a NULL

select * from clientes;
select * from clientes where direccion='';
select * from clientes where direccion is null;
select * from clientes where direccion is not null;
-- para buscar valores nulos lo hacemos con is null
-- is not null trae los registros que no sean nulos

-- parámatero between y not between
select * from clientes where codigo between 4 and 12;
-- el between trae todos los registros que estén comprendidos entre los límites indicados
select * from clientes where codigo not between 4 and 12;
-- el not between trae todos los registros que no estén comprendidos entre los límites indicados

-- parámetro in y not in
select * from clientes where codigo in (3, 7, 9, 11);
-- esto es similar a poner
select * from clientes where codigo=3 or codigo=7 or codigo=9 or codigo=11;
--								F			F			v			F
select * from clientes where codigo not in (3, 7, 9, 11);
-- trae todos los campos de todos los registros cuyo codigo no sea igual a 3, ni a 7, ni a 9, ni a 11