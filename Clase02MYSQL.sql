-- 1-Borrar si existe la base de datos Agenda_v.
drop database if exists agenda_v; -- ctrl + enter
-- 2-Crear la base de datos Agenda_V.
create database agenda_v; -- crear una base de datos
-- 3- Ingresar a la base de datos creada.
use agenda_v;
-- 4- Crear una tabla llamada "datos". Dabe tener los siguientes campo

--	nombre(cadena de 20),
--	domicilio (cadena de 30)
--	telefono(cadena de 11)
create table datos(
nombre	varchar(20),
apellido	varchar(20),
domicilio	varchar(30),
telefono	varchar(15)
); -- los campos de la tabla datos
--	5-visualizar las tablas existentes en la base d datos praverificar
show tables;	-- visualizo las tablas de la base de datos

-- 6- visualizar la estructura de cmpos de la tabla "datos".
describe datos;
-- 7- Ingresar 10 registros con valores aleatorios.
insert into datos(nombre,apellido,domicilio,telefono) values 
('Maria','Garcia','Tucuman 456', '478958963'),
('Lucas', 'Martinez', 'La Rioja 123', '2356-8956'),
('Pablo', 'Marin', 'jujuy 235', '5678-1256'),
('Marina', 'Gascon', 'Catamarca 56', '4576-9564'),
('Marisa','Perez', 'Cordoba 254', '4576-6321'),
('Cristian', 'Romano', 'Salta 786', '5689-1234'),
('Santiago', 'Costa', 'Rosario 693', '4723-1589'),
('Lucia', 'Mendez', 'Santiago del Estero 326', '5623-8945');
-- ingresar registros
-- 8- Selecione y muestre todos los registros de la tabla:
select * from datos; -- muestra los registros de la tabla datos
-- Felicitaciones usted ha armado su agnda personal!!!!

-- LABORATORIO 2
-- 1-Borrar si existe la base de datos Negocio_v
drop database if exists negocio_v; -- Borra la base de datos
-- 2- Crear la base de datos Negocio_v.
create database negocio_v;
-- 3- Ingresar a la base de datos creada.
use negocio_v;
-- 4- Crear la tabla Clientes dentro de la base de datos con el siguiente detalle:
-- pk significa Primary Key
create table clientes(
codigo_cliente	int auto_increment,
nombre		varchar(20) not null,
apellido		varchar(20) not null,
cuit			char(13),
direccion	varchar(50),
comentarios 	varchar(140),
primary Key(codigo_cliente)
 );
show tables;
-- 5- Crear la tabla Facturas dentro de la base de datos con el siguiente detalle:

-- Letra		char y PK
-- Numero		integer y PK
-- Fecha		date
-- Monto		double
create table facturas(
letra	char(1),
numero	int,
fecha	date,
monto	double,
primary key(letra,numero)
);
-- observar que esta declarando una clave primaria compuesta
-- es decir primary key(letra, numero)
-- cada campo por si solo no es clave, ni tampoo identifica un ragistro
-- pero la suma de los dos forman la clave primaria

-- 6- Crear la tabla Articulos dentro de la base de datos con el siguiente detalle:

create table articulos(

codigo		integer auto_increment,
nombre 		varchar(50),
precio		double,
stock		int,
primary key(codigo)
);
show tables;
-- 7- Cargar 5 registros aleatorios en cada tabla.
insert into clientes(nombre, apellido, cuit, direccion)values
('juan','perez','27-25638920-3','santa fe 587'),
('jose', 'garcia','23-21456987-9', 'colombres 1025'),
('maria','sanchez','28-23659456-0', 'jujuy 1236'),
('luis','marti','30-25698145-0','peru 1058'),
('luisa','vazquez','27-21563987-8','parana 123');

insert into facturas(letra,numero,fecha,monto)values
('a',1001,'2024/08/25',12500),
('a',1002,'2024/08/27',26000),
('a',1003,'2024/08/26',77000),
('a',1004, '2024/08/29', 73000),
('a',1005,'2024/08/30',74000);
select*from facturas;

insert into articulos(nombre,precio,stock)values
('martillo',11800,20),
('lampara led',2500,30),
('destornillador',7550,15),
('pinza',12500,20),
('serruch0 20 cm',35000,25);

-- 8- Mostrar las tablas que tiene la base de datos negocio.
show tables;

-- 9- Describir (detalle de campos - METADATO) cada una de las tablas de la base de datos.
describe clientes;
describe facturas;
describe articulos;

-- 10- Listar los registros de cada tabla.
select*from clientes;
select*from facturas;
select*from articulos;

-- Columnas calculadas
select nombre, precio precio_sin_iva
from articulos;

select nombre,precio,precio*1.21 precio_con_iva
from articulos;

select nombre precio, round(precio*1.21,2) precio_con_iva
from articulos;

select nombre,precio,round(precio*0.21) iva
from articulos;

select nombre,precio,round(precio*0.80,2) precio_con_desc
from articulos; -- descuento del 20%

select nombre,precio,round(precio*1.30,2) precio_con_aumento
from articulos; -- aumento del 30%

-- COMANDO INSERT
-- Insert sin definicion de campos (ANSI)
describe clientes;
insert into clientes values
(null,'juan','cerro','23568945','parana 547',null);
select*from clientes;
-- insert into clientes values
-- (null,'Pedro','Morron','23512563','salta 547'); falta definir un campo

-- insert con definicion de cmpos (ANSI)
insert into clientes(nombre,apellido,direccion) values
('maria','castro','uruguay 256');

-- insert set (NO ANSI)
insert clientes set nombre='Raul',apellido='ledesma';

-- insert masivo
insert into clientes (nombre,apellido) values
('juan','castro'),
('matias','juarez'),
('patricia','paz');

-- FUNCIONES DE AGRUPAMIENTO
-- funcion max() numerico, texto
select max(monto) maximo
from facturas;

select max(monto) monto_maximo
from facturas;

select max(monto) 'monto maximo'
from facturas;

select max(fecha)
from facturas;

select max(fecha) ultima_fecha
from facturas;
select max(apellido) apellido
from clientes;
select max(apellido) 'ultimo apellido'
from clientes;

-- funcion min() numerico, texto
select min(monto)
from facturas;
select min(monto) Monto_minimo
from facturas;

select min(fecha)
from facturas;
select min(facturas) 'menor fecha'
from facturas;
select min(apellido)
from clientes;
select min(apellido) 'primer apellido'
from clientes;

-- funcion avg(arg) argumento es numerico-promedio
select avg(monto)
from facturas;
select avg(monto) valor_promedio
from facturas;
select round(avg(precio),2) precio_promedio
from articulos;


















