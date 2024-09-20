-- 1- Crear la tabla 'autos' en una nueva base de datos (Vehiculos) 
-- con el siguiente detalle:
drop database if exists vehiculos_v;
create database vehiculos_v;
use vehiculos_v;
create table autos(
codigo int primary key,
 	marca	VARCHAR(25) not null,
	modelo	VARCHAR(25) not null,
 	color	VARCHAR(25),
	año	INT,
	precio	DOUBLE
    );
    show tables;
describe autos;

-- 2- Agregar el campo patente despues del campo modelo.
alter table autos add patente varchar(7) after modelo;

-- 3- Cargar la tabla con 15 autos (hacerlo con MySQL WorkBench o el INSERT INTO).
insert into autos(codigo,marca,modelo,patente,color,año,precio) values 
(1001,'ford','fiesta','dtf402','negro',2015,5000),
(1002,'toyota','corolla','aa245k1','gris',2022,15000),
(1003,'ford','focus','pty256','gris',2006,6000),
(1004,'audi','a4','adu456lo','rojo',2015,5000),
(1005,'ford','frente','aty476','naranja',2020,3300),
(1006,'fiat','palio','btn145','rojo',2005,4500),
(1007,'renault','arkane','ag456lo','rojo',2024,32000),
(1008,'renault','kangoo','igo125','gris',2010,75000),
(1009,'mercedes benz','clase a','nopo12','negro',2020,3800),
(1010,'mercedes  benz','smart four too','saq4558','verde',2008,12500),
(1011,'volkswagen','golf','aa457lp','verde',2018,22000),
(1012,'hyndai','elantra','nto890','gris',2020,16000),
(1013,'bmw','serie 3','bmw901','negro',2021,35000);

select * from autos;
-- 4- Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
select max(precio) precio_maximo
from autos;
select marca,modelo,precio from autos
where precio=(select max(precio) precio_maximo
from autos);
-- 	b. obtener el precio mínimo.
select min(precio) precio_minimo
from autos;
select marca,modelo,precio from autos
where precio=(select min(precio) precio_minimo
from autos);

-- 	c. obtener el precio mínimo entre los años 2010 y 2018.
select min (precio) precio_minimo
from autos where año between 2010 and 2018;
select marca, modelo,min(precio) precio_minimo
from autos where año between 2010 and 2018;
select*from autos
where precio=5000;
-- 	d. obtener el precio promedio.
select round(avg(precio),2)precio_promedio
from autos;
-- 	e. obtener el precio promedio del año 2016.
select round(avg(precio),2) precio_promedio
from autos where año=2020;
-- 	f. obtener la cantidad de autos.
select count(*) cantidad_autos
from autos;
-- 	g. obtener la cantidad de autos que tienen un precio entre $5.000 y $20.000.
select count(*) cantidad_autos
from autos where precio between 5000 and 20000;
-- 	h. obtener la cantidad de autos que hay en cada año.
select año,count(*) cantidad_de_autos from autos -- para agrupar por año 
group by año;
-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
select año,count(*) cantidad_de_autos, avg(precio)precio_promedio from autos
group by año;
-- 	j. obtener la suma de precios y el promedio de precios según marca.
select marca,sum(precio)total_precio,avg(precio)promedio
from autos group by marca;
--  k. informar los autos con el menor precio.

--  l. informar los autos con el menor precio entre los años 2016 y 2018.
select*from autos 
where precio=(select min(precio) precio_minimo
from autos
where año between 2016 and 2018);
--  m. listar los autos ordenados ascendentemente por marca,modelo,año.
select * from autos order by marca,modelo,año ;
--  n. contar cuantos autos hay de cada marca.
select marca,count(*) cantidad_de_autos from autos -- para agrupar por año 
group by marca;
--  o. borrar los autos del siglo pasado.
insert into autos(codigo,marca,modelo,patente,color,año,precio) values
(1014,'fiat','palio','btr789','blanco',1998,3000);
select*from autos;
delete from autos
where año<2000;
set sql_safe_updates=0; -- activar para poder eliminar datos


