-- Clase 06
use cursomysql;
select * from clientes;

-- Ejercicios
-- 0- Insertar 10 registros en la tabla clientes.
insert into clientes (nombre, apellido, cuit, direccion) values
('Adrian', 'Rial', '29769358669', 'Murguiondo 3463'),
('Lucía', 'Coronel', '27356421541', 'Baunes 6542'),
('Tomás', 'López', '65363654333', 'Medrano 162'),
('Maikol', 'Yakson', '20634653233', 'Belgrano 2928'),
('Lucas', 'Cortez', '37704893232', 'Corrientes 54'),
('Carlos', 'Torres', '20363338125', 'Rivadavia 6728'),
('Martín', 'Fent', '78264531400', 'Charlonne 500'),
('Naoko', 'Yamanaka', '23568965487', 'Yatay 261'),
('Juan', 'Perez', '11111111111', null),
('Esteban', 'Quito', '33333333331', 'Castro Barros 777');


-- 1- Insertar 6 articulos con definición de campos
insert into articulos (codigo, nombre, precio, stock) values
(19, 'Don Satur grasa', 1500, 200),
(20, 'Guaymallén chocolate', 300, 100),
(30, 'Tic tac naranja', 12000, 150),
(89, 'Naranjú', 18000, 3),
(900, 'Algodón de azúcar', 2500, 0);

-- 2- Insertar 6 artículos sin definición de campos
insert into articulos values
(56, 'alfajor Block', 950, 20),
(68, 'marroc', 500, 50000),
(684, 'alfajor águila', 10000, 0),
(358, 'milka mousse', 25000, 1),
(35122, 'mentitas', 700, 500);

-- 3- Actualizar el nombre del cliente de codigo 10 a Jose
update clientes set nombre='Jose' where codigo=10;

-- 4- Actualizar el nombre, apellido y cuit del cliente de codigo 3
-- a Pablo Fuentes 21053119875
update clientes set nombre='Pablo', apellido='Fuentes', cuit='21053119875' where codigo=3;

-- 5- Actualizar la dirección del cliente de codigo 2 a vacío
update clientes set direccion='' where codigo=2;

-- 6- Actualizar las direcciones de los clientes de codigo 21, 23 y 26 a 'null'
update clientes set direccion=null where codigo in (21, 23, 26);

-- 7- Eliminar los clientes con apellido Perez
delete from clientes where apellido='Perez';

-- 8- Eliminar los clientes con cuit que termine en 0
delete from clientes where cuit like '%0';

-- 9- Eliminar los clientes cuyo nombre contenga un r y su apellido termine con z
delete from clientes where nombre like '%r%' and apellido like '%z';

-- 10- Aumentar un 20% los precios de los artículos que tengan precio
-- menor o igual a 500
update articulos set precio=precio*1.2 where precio<=500;

-- 11- Aumentar un 15% los precios de los artículos con precio mayor a 500
update articulos set precio=precio*1.15 where precio>500;

-- 12- Bajar un 5% los precios de los artículos con precio mayor a 2000 
-- pero menor a 100000
update articulos set precio=precio * 0.95 where precio>2000 and precio<100000;

-- 13- Bajar el 50% del precio de los artìculos que tengan precio entre 2000 y 4000
update articulos set precio=precio/2 where precio between 2000 and 4000;

-- 14- Aumentar el stock a 200 a todos aquellos productos que tengan el 
-- stock mayor a 0 y hasta 150
update articulos set stock=200 where stock>0 and stock<=150;

-- 15- Eliminar los articulos con stock menor a 0
delete from articulos where stock<0;

-- 6- Eliminar todos los articulos cuyo precio sea mayor a 50.000
delete from articulos where precio> 50000;


-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------

-- ALTER TABLE
-- modifica la estructura de una tabla

describe clientes;

-- agregar campos
alter table clientes add edad smallint unsigned not null;
-- agregué el campo edad a la tabla
select * from clientes;

update clientes set edad=25 where codigo=1;
update clientes set edad=30 where codigo>10;

-- modificar campos
alter table clientes modify edad tinyint unsigned;

-- cambiar nombre a un campo
alter table clientes change edad antiguedad tinyint unsigned; 

-- borrar campos
alter table clientes drop antiguedad;
describe clientes;

-- eliminar la PK
-- para poder eliminar una clave primaria, el campo no puede ser auto_increment
-- alter table clientes drop primary key;
alter table clientes modify codigo int;
-- al no ser más auto_incremet puedo eliminar la condición de PK
alter table clientes drop primary key;

-- agregar PK
alter table clientes add primary key (codigo);

alter table clientes modify codigo int auto_increment;

-- renombrar tablas
rename table clientes to auxiliar;
rename table auxiliar to clientes;

show tables;

-- agregar un campo en un orden específico
alter table clientes add column edad smallint not null after nombre;
describe clientes;
alter table clientes drop edad;

-- -----------------------------------------------------------

drop table facturas;

create table facturas(
	letra char(1),
    numero int,
    fecha date not null,
    monto double not null,
    primary key (letra,numero),
    check (letra in ('A', 'B', 'C', 'M'))
);


insert into facturas values
('A', 1, curdate(), 10000);

insert into facturas values
('A', 2, '2024-02-01', 5000),
('B', 1, '2024-05-06', 70000),
('C', 1, '2024-03-19', 10000);

insert into facturas values
('H', 1, curdate(), 15000);
-- no se inserta este registro porque la letra debe ser A, B, C o M

INSERT INTO facturas (letra, numero, fecha, monto) VALUES
('A', 1001, '2024-01-15', 1500.75),
('A', 1002, '2024-02-20', 2000.00),
('B', 2001, '2024-03-05', 2500.50),
('B', 2002, '2024-04-10', 1750.25),
('C', 3001, '2024-05-12', 3000.00),
('C', 3002, '2024-06-25', 2200.90),
('M', 4001, '2024-07-30', 3200.60),
('M', 4002, '2024-08-15', 2700.40),
('A', 1003, '2024-09-10', 1350.00),
('B', 2003, '2024-10-20', 1850.35);

INSERT INTO facturas (letra, numero, fecha, monto) VALUES
('A', 1004, '2024-01-22', 1450.25),
('A', 1005, '2024-02-28', 1600.40),
('A', 1006, '2024-03-15', 1700.80),
('A', 1007, '2024-04-10', 1800.90),
('B', 2004, '2024-05-05', 1900.55),
('B', 2005, '2024-06-14', 2050.75),
('B', 2006, '2024-07-20', 2200.10),
('B', 2007, '2024-08-25', 2350.25),
('C', 3003, '2024-09-10', 2500.30),
('C', 3004, '2024-10-12', 2650.45),
('C', 3005, '2024-11-05', 2800.60),
('C', 3006, '2024-12-15', 2950.75),
('M', 4003, '2024-01-08', 3100.85),
('M', 4004, '2024-02-20', 3250.90),
('M', 4005, '2024-03-18', 3400.50),
('M', 4006, '2024-04-22', 3550.65),
('A', 1008, '2024-05-15', 1900.00),
('B', 2008, '2024-06-28', 2100.35),
('C', 3007, '2024-07-30', 2300.80),
('M', 4007, '2024-08-20', 2700.95);



-- --------------------------
-- FUNCIONES DE AGRUPAMIENTO
-- --------------------------

-- Las funciones de agrupamiento devuelven un solo registro como resultado.

-- la función MAX trabaja con números, textos y fechas
-- MAX con números
select * from facturas;
describe facturas;
select max(monto) from facturas;
-- trae el mayor monto facturado
select monto from facturas order by monto desc limit 1;
select max(monto) maximo from facturas;
-- agregué un alias a la consulta
select max(monto) maximo from facturas where letra='C';
-- trae el mayor monto facturado de las facturas de letra=C

-- IMPORTANTE
-- no debe haber espacio entre el nombre de la función y el primer paréntesis
-- puede variar según el motor de base de datos

-- MAX con texto
select max(nombre) from clientes;
-- trae el mayor nombre teniendo en cuenta el orden alfabético
select * from clientes order by nombre desc;

-- MAX con fechas 
select max(fecha) from facturas;
-- trae la mayor fecha de orden cronológico 

-- la función MIN trabaja con números, texto y fechas
-- MIN con números
select min(monto) from facturas;
-- trae el mínimo monto facturado

-- MIN con texto
select min(nombre) from clientes;
-- trae el menor nombre encontrado teniendo en cuenta el orden alfabético

-- MIN con fechas
select min(fecha) from facturas;
-- trae la menor fecha encontrada teniendo en cuenta el orden cronológico

-- función AVG average (promedio) trabaja con números
select avg(monto) from facturas;
-- devuelve el monto promedio de la tabla facturas
select avg(monto) promedio from facturas;
select avg(monto) promedio from facturas where letra='A';
select round(avg(monto),2) promedio from facturas;
-- devuelve el monto promedio ajustado a 2 decimales
-- la función round() redondea. El primer parámetro es el número a redondear
-- el segundo parámetro es la cantidad de decimales que queremos mostrar.

-- la función SUM trabaja con números
select sum(monto) from facturas;
-- trae la suma total de todos los montos de la tabla facturas

-- COUNT
select count(*) from facturas;
-- trae la cantidad total de registros de la tabla facturas
select count(*) from clientes;
-- trae la cantidad total de registros de la tabla clientes
select count(nombre) from clientes;
-- trae la cantidad de registros de la tabla clientes que tengan nombre
select count(direccion) from clientes;
-- trae la cantidad de registros que tengan direccion (no cuenta los valores nulos)
select count(*) from clientes where direccion is null;
-- trae la cantidad de registros cuya direccion sea nula

-- --------------------------------
-- AGRUPAMIENTO EN MYSQL
-- --------------------------------

select letra, count(*) total, sum(monto) sumaTotal from facturas where letra='A';
select letra, count(*) total, sum(monto) sumaTotal from facturas where letra='B';
select letra, count(*) total, sum(monto) sumaTotal from facturas where letra='C';
select letra, count(*) total, sum(monto) sumaTotal from facturas where letra='M';

-- GROUP BY
-- devuelve un registro por cada valor agrupado
-- siempre debe ir como primer campo el campo por el cual agrupamos
select letra, count(*) total, sum(monto) sumaTotal from facturas group by letra;

select 		fecha, 
			count(*) total, 
            sum(monto) sumaTotal 
from 		facturas 
group by 	fecha 
order by 	sumaTotal desc;

-- uso de HAVING
-- se utiliza para filtrar campos calculados
select		letra,
			count(*) total,
            sum(monto) sumaTotal
from 		facturas
group by	letra
having		sumaTotal > 30000;


-- SUBQUERIES
select max(monto) from facturas; 
-- esta query trae el monto máximo facturado (70.000)

select * from facturas where monto = (select max(monto) from facturas);
-- trae todos los campos de todas las facturas cuyo monto sea igual al monto máximo facturado
select * from facturas where monto = 70000;
-- esto sería lo mismo, pero hardcodeado

select * from facturas where fecha = (select min(fecha) from facturas);





