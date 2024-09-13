-- Clase 04

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
--			(9)					F			F			v			F
select * from clientes where codigo not in (3, 7, 9, 11);
-- trae todos los campos de todos los registros cuyo codigo no sea igual a 3, ni a 7, ni a 9, ni a 11
select * from clientes where codigo<>3 and codigo<>7 and codigo<>9 and codigo<>11;
--          (3)                F             V             V             V



select * from clientes; 
-- parámetro LIKE, NOT LIKE Y operadores % y _
-- % significa cualquier cosa
-- _ significa un caracter cualquiera
select * from clientes where nombre like 'juan';
-- trae todos los registros que comiencen on 'juan', esto incluye 'Juan Pablo', por ejemplo.

select * from clientes where nombre like 'mar%';
-- trae todos los registros que comiencen con 'mar'

select * from clientes where nombre like 'mari_';
-- el _ ocupa un espacio si o si, con los cual, en este casolos nombres deben tener siempre 5 cracteres

select * from clientes where apellido like '%';
-- trae todos los registros cuyo apellido finalice con z

select * from clientes where apellido like 'g%z';
-- trae todos los registros cuyo apellido comience con g y finalice con z

select * from clientes where apellido like'_____';
-- trae todos los apellidos que temgo 5 caracteres


-- parámetro ORDER BY asc y desc
select * from clientes order by apellido asc;
-- ordena los registros teniendo en cuenta el apellido en orden alfabetico ascenete
select * from clientes order by apellido;
-- no es necesario colocar el asc
select * from clientes order by apellido desc;
-- el desc indica que el ordem debe ser desendente
select * from clientes order by apellido, codigo;
-- ordena los registros por apellido en forma ascedentes y luego por codigo en caso de encontrar apellidos duplicados
select * from clientes order by apellido, codigo desc;
-- ordena por apellido en forman ascendente y luego por codígo en forma descendente en caso de encontrar apellido duplicados

-- clausula linit
select * from clientes limit 5;
-- trae los primeros 5 regisstros

select * from clientes order by apellido limit 5;
-- trea los primeros 5 los clientes ordenados por apellido

select * from clientes where apellido like '%z' and codigo > 3 order by apellido limit 5;
-- trae los priemeros 5 registros cuyo apellido finalice con 'z' y que el código sea mayor a 3
-- ordenados por apellido


-- inserción de registros en la tabla articulos
-- con definició de campos:
insert into articulos (codigo, nombre, precio, stock) values
(1, 'caramelos fliynn paff', 200, 50);
insert into articulos (codigo, nombre, precio, stock) values
(2, 'chupetines pico dulce', 150, 30);
insert into articulos (codigo, nombre, precio, stock) values
(3, 'alfajores fulbito', 200, 50);
insert into articulos (codigo, nombre, precio, stock) values
(4, 'palitos de la seva', 50, 150);
insert into articulos (codigo, nombre, precio, stock) values
(5, 'yerba playadito', 4000, 30);
insert into articulos (codigo, nombre, precio, stock) values
(6, 'Danonino vainilla', 10000, 30);
insert into articulos (codigo, nombre, precio, stock) values
(7,'pasta de mani', 280000, 5);
insert into articulos (codigo, nombre, precio, stock) values
(8, 'mielcitas', 100, 50);
insert into articulos (codigo, nombre, precio, stock) values
(9, 'Aquarius pera 500cc', 1500,20);
insert into articulos (codigo, nombre, precio, stock) values
(10, 'cañita de azúcar', 300, 100);
insert into articulos (codigo, nombre, precio, stock) values
(11, 'leche vegetal de almendras', 320000,20);
insert into articulos (codigo, nombre, precio, stock) values
(12,'cindor 1Litro', 500, 3);
-- puede cambiar el orden de los campos, respetando luego el orden de los valores
insert into articulos (precio, stock, codigo, nombre) values
(200, 50, 13, 'turrón de maní');

-- sin definición de campos
insert into articulos values
(14, 'coca-cola 2lts.',2200,40);
-- cuando vamos a completar todos los campos en orden, no es necesario declaralos antes

insert into articulos values
(15, 'arroz 1kg', 2000, 100);

insert into articulos values
(16, 'serenito', 500, 20),
(17, 'detergente magistral', 15000, 20),
(18,'agua mineral 500cc', 1500, 40);

select * from articulos;





select * from articulos where precio > 1000;
select * from articulos where codigo < 2000 or codigo > 400000;
select * from articulos where codigo between 4000 and 6000;
select * from articulos where precio = 2000 and stock > 300;
select * from articulos where codigo=1200 or codigo=2000 or codigo=30000;
select * from articulos where codigo in (1200, 2000, 30000);
select * from articulos where codigo not in (100, 200, 10000);
select * from articulos order by apellido, codigo desc;
select * from articulos order by precio desc, nombre;


select * from clientes where apellido like '%a'and '___________________';
select * from clientes where nombre like 'L%';


-- 1 - Ingrese a la base de datos negocio.
use negocio_v;
-- 2 - Ingrese 5 registros aleatorios en cada tabla.
show tables; -- articulos-clientes-facturas
insert into articulos(nombre,precio,stock) values
('alicate chico',1500,25),
('destornillaor',4500,20),
('pincel 15 mm', 2500,30),
('martillo',5600,30),
('pinza grande', 12000,10);


insert into clientes(nombre,apellido,cuit,direccion) values
('lautaro','martinez','23-235689-2','salta 12'),
('julia','martin','27-23540078-3','jujuy 456'),
('hector','urquiza','20-12450786-6','cordoba 4589'),
('paula','mora','27-12547834-9', 'castro 1025'),
('mario','calderon','23-78452145-0','san juan 562');


insert into facturas(letra,numero,fecha,monto)values
('a',1006,'2024/09/03',16500),
('a',1007,curdate(),23456),
('a',1008,curdate(),14789),
('a',1009,curdate(),28950),
('a',1010,curdate(),17850);
select*from facturas;

-- 3 - Basándose en la tabla artículos obtener los siguientes listados.

-- a-	artículos con precio mayor a 5000
select*from articulos
where precio> 5000;
-- b-	artículos con precio entre 2500 y 4000 (usar < y >)
select*from articulos
where precio >2500 and precio<4000;

-- c-	artículos con precio entre 4000 y 6000 (usar BETWEEN)
select*from articulos
where precio between 4000 and 6000;
-- d-	artículos con precio = 3500 y stock mayor a 30

-- e-	artículos con precio (3500,4000,9500) no usar IN
-- f-	artículos con precio (3500,4000,9500) usar el IN
select*from articulos
where precio in(3500,4000,9500);
select*from articulos
where precio in(3500,4000,9500);
-- g-	artículos que su precio no sea (3500,4000,9500)
select*from articulos
where precio not in(3500,4000,9500);

-- h-   artículos que su precio mas iva(21 %) sea mayor a 1000
select precio*1.21 precio_con_iva
from articulos where precio>10000;
select nombre,precio,round(precio*1.21,2)precio_con_iva
from articulos where precio>10000;
-- i-   listar nombre y descripción de los artículos que no cuesten $7500
select nombre,precio
from articulos where precio<>7500;
use negocio_v;
-- j- 	artículos con nombre que contengan la cadena 'lampara' (usar like)
insert into articulos(nombre,precio,stock)values
('lampara led 5w',1250,20),
('lampara led 10w',2050,15),
('lampara led 12w',2250,10),
('lampara led 15w',2450,20),
('lampara led 5w',2690,20);
select*from articulos 
where nombre like'%lampara%';

-- k-   artículos que su precio sea menor que 7500 y en su nombre no contenga la letra 'a'
select*from articulos
where precio<7500 and nombre not like'%a%';


-- 	2- Listar los artículos ordenados por precio de mayor a menor, 
-- y si hubiera precio iguales deben quedar ordenados por nombre.
select*from articulos
order by precio desc,nombre;
-- 	3- Listar todos los artículos incluyendo una columna denominada precio con IVA,
--  la cual deberá tener el monto con el iva del producto.
select nombre,precio, round(precio*1.21,2)'precio con iva'
from articulos;
-- 	4- Listar todos los artículos incluyendo una columna denominada 'cantidad de cuotas' y
--  otra 'valor de cuota', la cantidad es fija y es 3,  
--  el valor de cuota corresponde a 1/3 del monto con un 5% de interés.
select nombre, precio 'cantidad de cuotas 3',
round(precio/3*1.05,2)'valor cuota'
from articulos;

use negocio_v;
show tables;

-- comando delete(ANSI)
select*from clientes;
delete from clientes
where codigo_cliente=3;

delete from clientes
where nombre='patricia';


-- comando update (ANSI) modificar los datos
update clientes set nombre= 'gabriel' , apellido='martinez'
where codigo_cliente=2; -- modifico o actualizo datos

update clientes set cuit='20-25689458-0'
where codigo_cliente=5;

-- updte masivo
update clientes set nombre='Mario';

-- alter table
describe clientes;
alter table clientes add edad int;

update clientes set edad=25
 where codigo_cliente=8;
 
 alter table clientes add telefono varchar(20) after cuit;
 
 -- colocar en primer lugar
 alter table clientes add dni char(8) first;
 
 -- alter table modify
 alter table clientes modify edad tinyint unsigned;
 
 -- alter table drop 
 alter table clientes drop telefono;
 alter table clientes drop dni;
 alter table clientes drop edad;
 describe clientes;
 select*from clientes;
 select*from clientes;
 
 -- Usando la base de datos negocio.
 
use negocio_v;
show tables;
-- Basándose en la tabla clientes realizar los siguientes puntos.

-- 1- 	Insertar 5 clientes en la tabla clientes utilizando el insert into sin utilizar campos como parte de la sentencias,
--  es decir de la forma simplificada.
insert into clientes values
(null,'juana','canteros','21-25689451-3','parana 587',''),
(null,'juanito','castro barros','20-33568945-0','ramon falcon 529',''),
(null,'marisa','corrientes','21-35689461-3','lisandro de la torres 123',''),
(null,'juancho','crisologo larralde','25-35688451-0','acha 675',''),
(null,'jimena','catamarca','27-35679451-0','madariaga 890','');


-- 2-	Insertar 5 clientes en la tabla clientes utilizando los campos como parte de la sentencias, es decir de la forma extendida.
insert into clientes(nombre, apellido,cuit)values
('miguel','funes','23-25879456-3'),
('marisa','fuentes','27-21009456-2'),
('paola','gascon','25-35449456-5'),
('jose','fernandez','23-40870450-0'),
('lucia','neiva','27-40872256-2');
select*from clientes;

-- Completar solo los campos nombre, apellido y CUIT.
-- 3-	Actualizar el nombre del cliente 1 a Jose.
update clientes set nombre='jose'
where codigo_cliente=1;
-- 4-	Actualizar el nombre apellido y cuit del cliente 3 a Pablo Fuentes 20-21053119-0.
update clientes set nombre='pablo',apellido='fuentes',cuit='20-21053119-0'
where codigo_cliente=3;
-- 5-	Actualizar todos los comentarios NULL  a ''.
update clientes set comentarios= ''
where comentarios is null;
-- 6-	Eliminar los clientes con apellido Perez.
delete from clientes
where apellido='perez';
-- 7-	Eliminar los clientes con CUIT Terminan en 0.
delete from clientes
where cuit like '%0';

-- Basando se en la tabla artículos, realizar los siguientes puntos.
-- 	8- Aumentar un 20% los precios de los artículos con precio menor igual a 5000.
update articulos set precio=precio*1.20
where precio <=5000;

-- 	9- Aumentar un 15% los precios de los artículos con precio mayor a 5000.
update articulos set precio=precio*1.15
where precio > 5000;

-- 	10- Bajar un 5% los precios de los artículos con precio mayor a 1500.
update articulos set precio=precio*0.95
where precio>15000;
-- 	11- Eliminar los artículos con stock menor a 0.
delete from articulos
where stock=0;
insert into articulos(nombre,precio,stock)values
('pintura 15 1','25000',0);
select*from articulos;

-- 	12- Agregar a la tabla articulos, los campos stockMinimo y stockMaximo. (usar alter table add)
alter table articulos add StockMinimo int, add StockMaximo int;
describe articulos;

--  13- Completar en los registros los valores de los campos stockMinimo y stockMaximo (usar update)
--      teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
update articulos set stockMinimo=40,StockMaximo=100
where codigo=1;
update articulos set stockMinimo=40,StockMaximo=100
where codigo=2;
update articulos set stockMinimo=40,StockMaximo=100
where codigo=3;
update articulos set stockMinimo=40,StockMaximo=100
where codigo=4;
update articulos set stockMinimo=40,StockMaximo=100
where codigo=5;
update articulos set stockMinimo=40,StockMaximo=100
where codigo=6;
update articulos set stockMinimo=40,StockMaximo=100
where codigo=7;
update articulos set stockMinimo=40,StockMaximo=100
where codigo=8;
update articulos set stockMinimo=40,StockMaximo=100
where codigo=9;
update articulos set stockMinimo=40,StockMaximo=100
where codigo=10;
select*from articulos;


--  14- Lista los articulos que se deben reponer y que cantidad se debe reponer de cada articulos.
--      Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad de articulos a 
--      reponer es stockMaximo - stock.
select codigo, precio(round(precio,2))precio, stock,stockMaximo-stock cantidad_a_reponer,
StockMinimo
from articulos where stock=StockMinimo;
--  15- Calcular el valor de venta de toda la mercaderia que hay en stock.
select sum(precio*stock) valor_venta_total
from ariculos;

--  16- Calcular el valor de venta + iva de toda la mercaderia que hay en stock.
select sum(round(precio*stock*1.21,2)) venta_con_iva
from articulos;

-- funcion count() --cantidad
select count(*) cantidad from facturas; -- 10
select count(*) cantidad from clientes; -- 22
select count(*) cantidad from articulos; -- 21

select count(*) cantidad from clientes
where direccion is null;   -- 13

-- subconsultas (subquieries)
select max(monto)maximo from facturas;

select*from facturas
where monto=(select max(monto) from facturas);
select*from facturas;

-- sumar cantidad de facturas letra A + letra B + letra C
insert into facturas(letra,numero,monto)values
('b',1007,25600),
('b',1008,35900),
('b',1009,45600),
('b',1010,65400),
('c',1007,15300),
('c',1008,55200);

select count(*) cantidad from facturas where letra='a';
select count(*) cantidad from facturas where letra='b';
select count(*) cantidad from facturas where letra='c';

select (select count(*)from facturas where letra='a')+
(select count(*)from facturas where letra='b') cantidad;

-- suma las cantidades de la facturas que le indique

-- agrupamiento group by 
select letra, sum(monto) total  from facturas where letra='a';
select letra, sum(monto) total  from facturas where letra='b';
select letra, sum(monto) total  from facturas where letra='c';

-- letra     monto
-- a          364045
-- b          172500
-- c          70500

select letra,sum(monto) total
from facturas group by  letra;

select fecha,sum(monto) total
from facturas group by fecha;

-- filtrado po having
select letra, sum(monto) total from facturas
group by letra having total>90000;

insert into facturas(letra,numero,fecha,monto)values
('c',2001,curdate(),15000),
('c',2002,curdate(),12000),
('c',2003,'2024/09/06',25000),
('c',2004,'2024/09/02','35000'),
('c',2005,curdate(),18000);

-- total facturado por mes
select letra, concat(year(fecha),'/',month(fecha))mes,
count(letra) letra from facturas
group by mes;



 
 
 








 

















