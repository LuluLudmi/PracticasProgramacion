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


use negocio_v;
-- funcion sum(arg) arg=numerico
select sum(monto) total_facturado
from facturas;
select sum(stock) total_mercaderia
from articulos;

-- valor de venta de toda la mercaderia en stock
select sum(preio*stock) valor_mercaderia_total
from articulos;

show tables; -- muestra las tablas de la BD
select * from facturas;
select * from clientes;
select * from articulos;

rename table articulos to articulos; -- renombrar la tabla 
show tables;
rename table articulos to articulos;

alter table articulos add observacion varchar(45) not null; -- agregar na columna 
show columns from articulos; -- ver las columnas de l tabla
alter table articulos drop column observacion; -- borrar una columna

-- filtrado where 
select * from clientes 
where nombre='juan';
select * from clientes
where codigo_cliente=3;

-- operador != <> (distinto)
select * from clientes
where codigo_cliente <>3; -- busco el que es distinto a 3
select * from articulos
where codigo !=2;

-- Operador < <= > >=
select * from clientes
where codigo_cliente>2;
select*from clientes
where codigo_cliente>=2;
select*from articulos
where precio<15000;

-- valores null
select*from clientes;
insert into clientes(nombre,apellido,comentarios) values
('ana', 'martinez', ''),
('javier', 'monte', null);

select* from clientes
where comentarios is null;
select * from clientes
where comentarios is not null;

-- operador logico and - or
select * from clientes
where nombre='juan' and apellido='perez';
select * from clientes
where nombre='juan' or nombre='ana';
select * from clientes
where nombre='juan' or apellido='garcia';

insert into articulos(nombre,precio, stock) values
('pintura 1 L', 3500,15),
('pintura 2 L', 5500,25),
('pintura 3 L', 7500,10),
('pintura 5 L', 9500,15),
('pintura 10 L', 17000,20),
('pintura 20 L', 32000,10);

select * from articulos
where precio>=4000 and precio<=9500;

-- Operador between not between
select * from articulos
where precio between 4000 and 9500;
select * from articulos
where precio not between 4000 and 9500;

-- Operador in - not in
select * from clientes
where codigo_cliente=2 or codigo_cliente=4 or codigo_cliente=5
or codigo_cliente=6;

select * from clientes -- busco por codigo de cliente
where codigo_cliente in(2,4,5,6);
select*from clientes -- busco clientes que no tengan ese codigo_cliente
where codigo_cliente not in (2,4,5,6);

-- busqueda con expresion like y not like

insert into clientes(nombre,apellido) values
('Maria','Perez'),
('Mariana','Perez'),
('Mario','Perez'),
('Mariana','Perez'),
('Marcela','Perez'),
('Marcelo','Perez'),
('Mirta','Perez'),
('Marta','Perez'),
('Mariana','Perez'),
('Merlina','Perez'),
('Monica','Paez'),
('Micaela','Luna'),
('Omar','Luna'),
('Armando','Lopez');

select*from clientes
where nombre like 'm%'; -- todos los nombres que empiezen con la letra m
-- el % complet el resto de los caracteres
select*from clientes
where nombre like 'ma%';
select*from clientes
where nombre like 'mar%';
select*from clientes
where nombre not like 'm%'; -- que no empiezan con la letra m
select*from clientes
where nombre like '%a';  -- todo lo que termina en a
select * from clientes 
where nombre like '%ar';
select * from clientes
where nombre like 'm_r%';
select * from clientes
where nombre like '___'; -- el gien reemplaza un caracter

-- ordenamiento con orer by
select*from clientes
order by nombre; -- lo ordena automaticamente en forma ascendente
select*from clientes
order by nombre asc;
select*from clientes
order by nombre desc;
select*from clientes
order by nombre,apellido;
select*from clientes
order by apellido desc,nombre;
select*from clientes
order by nombre  limit 1; -- el primero
select*from clientes
order by nombre desc limit 1; -- el ultimo

-- Laboratorio 3
-- 1 ingrese a la base de datos negocio
use negocio_v;
-- 2- Ingrese 5 registros aleatorios en cada tabla.
show tables; -- articulos-clientes-facturas

-- 3- basandose en la tabla articulos obtener los siguientes listados.
-- 1- articulos con precio mayor a 10000
-- 2- articulos con precio entre 5000 y 12000 (usar > y <)
-- 3- articulos con precio entre 5000 y 12000 (usar BETWEEN)
-- 4- articulos con precio = 14000 y stock mayor a 3
-- 5- articulos con precio (8000, 500, 45000) no usar IN
-- 6- articulos con precio (8000, 500, 45000) usar IN
-- 7- articulos cuyo precio no sea (12000, 14000, 16000)
-- 8- articulos ordenados por precio de mayor a menor, si hubiera precios iguales,
-- ordenarlos por nombre
-- 9- todos los articulos, incluyendo una columna denominada "precio con IVA", la cual
-- deberá tener el monto con el IVA del producto
-- 10- todos los articulos, incluyendo una columna denominada "cantidad de cuotas" y 
-- otra "valor de cuota", la cantidad es fija y es 3, el valor de la cuota corresponde
-- a 1/3 del monto con un 5% de interés
-- 11- todos los artículos cuyo nombre termine con a y tenga 21 letras
-- 12- todos los artículos cuyo nombre contenga al menos dos 's'
-- 13- todos los artículos cuyo nombre esté compuesto con al menos cuatro palabras
-- 14- los primeros 5 artículos ordenados por precio en forma descendente
-- 15- los 2 primeros artículos luego del segundo registro ordenado por stock




























