-- Clase 08

-- Ejercicios

-- Basándose en la tabla articulos, realizar los siguientes puntos:
-- 1) Agregar a la tabla articulos, los campos stockMinimo y stockMaximo.
alter table articulos add stockMinimo int unsigned, add stockMaximo int unsigned;

-- 2) Completar en los registros los valores de los campos stockMinimo y stockMaximo
-- 	teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
update articulos set stockMinimo=143, stockMaximo=1000;

-- 3) Listar los articulos que se deben reponer y qué cantidad se debe reponer de cada artículo.
-- Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad
-- de articulos a reponer es stockMaximo - stock.
select 	codigo, 
		nombre, 
        stock,
        stockMinimo, 
        stockMaximo, 
        (stockMaximo - stock) reponer
from 	articulos
where	stock < stockMinimo;

-- 4) Calcular el valor de venta de toda la mercaderia que hay en stock.
select sum(precio * stock) sumaTotal from articulos;

-- 5) Calcular el valor de venta + IVA de toda la mercaderia que hay en stock.
select sum(precio * stock * 1.21) sumaTotalConIva from articulos;

-- 1. Crear la tabla 'autos' dentro de la base de datos 'intro' con el siguiente detalle:

-- 	codigo	INTEGER y PK
-- 	marca	VARCHAR(255)
-- 	modelo	VARCHAR(255)
-- 	color	VARCHAR(255)
-- 	anio	INTEGER
-- 	precio	DOUBLE

create database intro;
use intro;
create table autos(
	codigo int primary key,
    marca varchar(255) not null,
    modelo varchar(255) not null,
    color varchar(255) not null,
    anio int not null, 
    precio double not null
);

alter table autos modify codigo int auto_increment;
alter table autos modify codigo int;
describe autos;

-- 2. Cargar la tabla con 20 autos
INSERT INTO autos (codigo, marca, modelo, color, anio, precio) VALUES
(1, 'Toyota', 'Corolla', 'Rojo', 2020, 700000.00),
(2, 'Honda', 'Civic', 'Azul', 2019, 770000.00),
(3, 'Ford', 'Focus', 'Negro', 2021, 735000.00),
(4, 'Chevrolet', 'Malibu', 'Blanco', 2018, 630000.00),
(5, 'Nissan', 'Altima', 'Gris', 2022, 805000.00),
(6, 'Hyundai', 'Elantra', 'Verde', 2016, 590000.00),
(7, 'Kia', 'Forte', 'Rojo', 2021, 700000.00),
(8, 'Volkswagen', 'Jetta', 'Negro', 2019, 840000.00),
(9, 'Subaru', 'Impreza', 'Azul', 2017, 720000.00),
(10, 'Mazda', '3', 'Blanco', 2021, 750000.00),
(11, 'Chrysler', '300', 'Gris', 2015, 900000.00),
(12, 'Dodge', 'Charger', 'Rojo', 2019, 945000.00),
(13, 'BMW', '3 Series', 'Negro', 2020, 1225000.00),
(14, 'Audi', 'A4', 'Blanco', 2018, 1400000.00),
(15, 'Mercedes-Benz', 'C-Class', 'Azul', 2021, 1575000.00),
(16, 'Lexus', 'IS', 'Rojo', 2017, 1450000.00),
(17, 'Porsche', 'Cayman', 'Verde', 2021, 2100000.00),
(18, 'Tesla', 'Model 3', 'Gris', 2022, 1750000.00),
(19, 'Volvo', 'S60', 'Negro', 2020, 1300000.00),
(20, 'Land Rover', 'Evoque', 'Blanco', 2019, 1800000.00),
(21, 'Fiat', 'Punto', 'Rojo', 2014, 400000.00),
(22, 'Renault', 'Clio', 'Azul', 2015, 350000.00),
(23, 'Peugeot', '208', 'Negro', 2016, 470000.00),
(24, 'Citroën', 'C3', 'Blanco', 2013, 320000.00),
(25, 'Chevrolet', 'Onix', 'Gris', 2017, 500000.00),
(26, 'Ford', 'Ka', 'Verde', 2018, 550000.00),
(27, 'Nissan', 'March', 'Rojo', 2015, 380000.00),
(28, 'Hyundai', 'i30', 'Azul', 2019, 720000.00),
(29, 'Kia', 'Picanto', 'Negro', 2020, 620000.00),
(30, 'Toyota', 'Yaris', 'Blanco', 2022, 780000.00);

update autos set precio = precio * 10;
-- 3. Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
select max(precio) from autos;

-- 	b. obtener el precio mínimo.
select min(precio) from autos;

-- 	c. obtener el precio mínimo entre los años 2010 y 2020.
select min(precio) precioMinimo from autos where anio between 2010 and 2020;

-- 	d. obtener el precio promedio.
select avg(precio) promedio from autos;

-- 	e. obtener el precio promedio del año 2024.
select avg(precio) promedio from autos where anio=2024;

-- 	f. obtener la cantidad de autos.
select count(*) from autos;

-- 	g. obtener la cantidad de autos que tienen un precio entre $30.500.000 y $40.000.000
select count(*) cantidad_de_autos from autos where precio between 30500000 and 40000000;

-- 	h. obtener la cantidad de autos que hay en cada año.
select anio, count(*) cantidad_de_autos from autos group by anio;

-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
select anio, count(*) cantidad_de_autos, avg(precio) promedio from autos group by anio;

-- 	j. obtener la suma de precios y el promedio de precios según marca.
select marca, sum(precio) sumaTotal, avg(precio) promedio from autos group by marca;

--  	k. informar los autos con el menor precio.
select * from autos where precio = (select min(precio) from autos) ;

--  	l. informar los autos con el menor precio entre los años 2014 y 2023
select 		* 
from 		autos 
where 		precio = (select min(precio) from autos where anio between 2014 and 2023) 
and 		anio between 2014 and 2023 ;

--  	m. listar los autos ordenados ascendentemente por marca,modelo, 
-- y el año en forma descendente.
select * from autos order by marca, modelo, anio desc;

--  	n. contar cuantos autos hay de cada marca.
select marca, count(*) cantidad_de_autos from autos group by marca;

--  	o. borrar los autos del siglo pasado.
delete from autos where anio < 2000;
