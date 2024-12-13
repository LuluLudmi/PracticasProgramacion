-- Clase 05
use cursomysql;
select * from articulos;
-- Ejercicios
-- Basándose en la tabla articulos, obtener:

-- 1- articulos con precio mayor a 1000
select * from articulos where precio > 1000;

-- 2- articulos con precio entre 2000 y 40000 (usar > y <)
select * from articulos where precio > 1999 and precio < 40001;

-- 3- articulos con precio entre 4000 y 6000 (usar BETWEEN)
select * from articulos where precio between 4000 and 6000;

-- 4- articulos con precio = 2000 y stock mayor a 300
select * from articulos where precio = 2000 and stock > 300;

-- 5- articulos con precio (1200, 2000, 30000) no usar IN
select * from articulos where precio=1200 or precio=2000 or precio=30000;

-- 6- articulos con precio (1200, 2000, 30000) usar IN
select * from articulos where precio in (1200, 2000, 30000);

-- 7- articulos cuyo precio no sea (100, 200, 10000)
select * from articulos where precio not in (100, 200, 10000);

-- 8- articulos ordenados por precio de mayor a menor, si hubiera precios iguales,
-- ordenarlos por nombre
select * from articulos order by precio desc, nombre;

-- 9- todos los articulos, incluyendo una columna denominada "precio con IVA", 
-- la cual deberá tener el monto con el IVA del producto
select *, precio/100*21 + precio 'precio con IVA' from articulos;
select codigo, nombre, precio, precio*1.21 'precio con IVA', stock from articulos;

-- 10- todos los articulos, incluyendo una columna denominada "cantidad de cuotas"
-- y otra "valor de cuota", la cantidad es fija y es 3, el valor de la cuota 
-- corresponde a 1/3 del monto con un 5% de interés
select 	*, round(precio/3 * 1.05,2) as 'valor de cuota', 3 as 'cantidad de cuotas' 
from 	articulos;
-- la función round() redondea un número decimal. El primer parámetro es el
-- número a redondear y el segundo parámetro es la cantidad de decimales a mostrar

-- 11- todos los artículos cuyo nombre termine con a y tenga 19 letras
select * from articulos where nombre like '__________________a';

-- 12- todos los artículos cuyo nombre contenga al menos dos 'L'
select * from articulos where nombre like '%l%l%';

-- 13- todos los artículos cuyo nombre esté compuesto con al menos dos palabras
select * from articulos where nombre like '%_ _%';

insert into articulos values (1232, 'galletitas ', 100, 10);

-- 14- los primeros 5 artículos ordenados por precio en forma descendente
select * from articulos order by precio desc limit 5;

-- 15- los 10 primeros artículos luego del segundo registro ordenado por stock
select * from articulos order by stock limit 2,10;

-- limit con 2 parámetros, el primero indica después de qué número de registro
-- traerá la cantidad de registros que indiquemos después de la coma
-- -----------------------------------------------------------------------

-- cargar registros usando la cláusula select
create table amigos(
	nombre varchar(50),
    apellido varchar(20)
);

insert into amigos select nombre, apellido from clientes;
select * from amigos;
-- llené la tabla amigos con todos los nombres y apellidos que habían en la
-- tabla clientes

-- crear una tabla a partir de la información de otra tabla
create table nombres select nombre from clientes;
select * from nombres;

-- crear una copia de una tabla
create table clientes2 select * from clientes;
-- crea la tabla clientes2 con la misma estructura y registros 
-- de la tabla clientes
select * from clientes2;

-- tablas temporales
-- son tablas alojadas en RAM y desaparecen al cortar la conexión con el servidor
-- se la utiliza para obtener consultas muy veloces para datos temporarios
create temporary table copia select * from clientes;
select * from copia;

-- comando DELETE
delete from clientes where codigo=5;
select * from clientes;
delete from clientes where codigo>5;

set sql_safe_updates = 1; -- activa la protección de seguridad
set sql_safe_updates = 0; -- desactiva la protección de seguridad

select * from clientes;
delete from clientes where apellido like 'Go%';

delete from clientes;
-- elimina todos los registros de la tabla clientes
select * from clientes;

insert into clientes select * from clientes2;

-- delete elimina todos los registros de la tabla uno x uno

-- truncate también elimina toda la tabla, pero borrando todos los registros
-- simultáneamente. No uno por uno como el delete. Por lo tanto es más veloz.
-- También reinicia la secuencia de los auto_increment

-- actualizar registros con UPDATE
select * from clientes;
update clientes set apellido='Simpson' where codigo=5;
update clientes set nombre='Marcelo' where codigo>10;
update clientes set apellido='Castillo' where apellido='Catillo';
update clientes set nombre='Mario', apellido='Barakus', direccion= null where codigo=3;




