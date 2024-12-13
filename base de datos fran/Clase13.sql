-- Clase 13

drop database if exists negocio_matutino;
create database negocio_matutino;
use negocio_matutino;

create table clientes(
	codigo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni char(8) not null,
    direccion varchar(100),
    primary key(codigo)
);

create table facturas(
	letra char(1),
    numero int,
    codigo_cliente int not null,
    fecha date not null,
    monto double not null,
    check(letra in('A', 'B', 'C', 'M')),
    primary key(letra, numero)
);

insert into clientes (nombre, apellido, dni, direccion) values
('Juan', 'Perez', '22222222', 'La Paz 2042'),
('Marcelo', 'Lopez', '33333333', 'Larrea 2532'),
('Julia', 'Gonzalez', '44444444', 'Laprida 25'),
('Violeta', 'Gutierrez', '55555555', 'Bilbao 1500'),
('Victor', 'Espíndola', '66666666', 'Soler 47'),
('Mario', 'Ramos', '77777777', null),
('Troy', 'Maclure', '88888888', ''),
('Cosme', 'Fulanito', '99999999', 'Calle False 232'),
('Mariana', 'Flores', '10101010', 'Siempre Viva 123'),
('Carlos', 'Ríos', '11111010', 'Medrano 162'),
('Jorge', 'Sanchez', '12121212', 'Medrano 162');

insert into facturas values
('A', 1, 1, '2024-01-14', 77000),
('A', 2, 2, '2024-02-10', 100000),
('B', 1, 1, '2023-12-12', 50000),
('C', 1, 1, '2024-03-10', 150000),
('A', 3, 3, curdate(), 10000),
('M', 1, 10, curdate(), 170000),
('A', 4, 7, '2023-07-17', 68000),
('A', 5, 7, '2023-07-18', 68000),
('C', 2, 2, curdate(), 79000),
('C', 3, 4, '2024-10-10', 125000),
('M', 2, 9, '2024-09-09', 1700);

-- el producto cartesiano, es la unión de todos los registros
-- por lo que va a traer las relaciones de todos con todos
select * from clientes; -- 11 registros
select * from facturas; -- 11 registros
select * from clientes, facturas; -- 121
-- el producto cartesiano es la multiplicación de todos los registros de ambas tablas
-- en este caso sería 11 x 11 = 121

-- para obtener el producto relacionado
select 	* from 	clientes, facturas where facturas.codigo_cliente=clientes.codigo;
-- el producto relacionado es la representación de las relaciones entre las tablas
-- para obtener el producto relacionado, primero se tiene que obtener el producto
-- cartesiano y luego filtrar por la relación.

-- uso de alias para las tablas
select 	c.nombre, c.apellido, f.fecha, f.monto
from 	clientes c, facturas f
where	c.codigo = f.codigo_cliente;
-- los alias sirven para identificar a las tablas y que sea más cómodo poder nombrarlas
-- por lo general el alias es la primera letra del nombre de la tabla
-- si hubieran varias tablas que comiencen con la misma letra, se puede agregar la segunda
-- el alias nos sirve para identificar la tabla a la que pertenece el campo al cual se está
-- haciendo referencia.
-- no es obligatorio poner el nombre de la tabla ni el alias antes del nombre del campo, si
-- el nombre del campo no se repite en las tablas.
select 	nombre, apellido, fecha, monto
from 	clientes, facturas
where	codigo=codigo_cliente;



select 	*
from 	clientes, facturas
where	clientes.codigo = facturas.codigo_cliente;

select 	*
from	clientes c, facturas f
where	c.codigo = f.codigo_cliente;

select 		*
from		clientes c
INNER JOIN	facturas f
on			c.codigo = f.codigo_cliente;
-- ////////////// INNER JOIN //////////////
-- un JOIN es una operación que permite combinar filas de dos o más tablas basándose en una
-- condición de relación.
-- El JOIN que utilizamos recién, se lo conoce como INNER JOIN
-- une dos tablas por medio de una columna en común
-- Compara los valores y si encuentra coincidencia, los selecciona
-- en la actualidad a este JOIN se lo puede llamar simplemente JOIN, no es necesario
-- colocar la palabra INNER

-- cualquiera de las anteriores formas de obtener el producto relacionado, es válida
-- pero se recomienda el uso del JOIN como buena práctica

-- ////////////// LEFT JOIN //////////////
-- Otro JOIN que se utiliza para cruzar datos de tablas, es el LEFT JOIN
-- es similar al INNER JOIN, solo que en este caso, además de las coincidencias, va a traer
-- todos los valores de la tabla de la izquierda.
-- Por más que no se crucen con la tabla de la derecha.
-- Cuando hablamos de tablas de la derecha o izquierda, nos referimos a la posición en la
-- que hayamos escrito los nombres de las tablas con respecto al JOIN
select 		c.nombre, c.apellido, f.*
from		clientes c
LEFT JOIN	facturas f
on			c.codigo=f.codigo_cliente;

-- a qué clientes no se le facturó nada
select 		c.*
from		clientes c
LEFT JOIN	facturas f
on			c.codigo=f.codigo_cliente
where		f.letra is null;

-- ////////////// RIGHT JOIN //////////////
-- RIGHT JOIN es similar al LEFT JOIN. Solo que en este caso trae, además de las relaciones
-- existentes, todos los registros de la tabla de la derecha, aunque no tengan relación.
select		c.nombre, c.apellido, f.*
from		clientes c
RIGHT JOIN	facturas f
on			c.codigo=f.codigo_cliente;

select * from facturas;
insert into facturas values
('B', 2, 30, curdate(), 10000);

insert into facturas values
('B', 3, 31, sysdate(), 22000);

-- mostrar la fecha en la que se facturó a clientes que no existen
select		distinct(f.fecha)
from		clientes c
right join	facturas f
on			c.codigo = f.codigo_cliente
where 		c.nombre is null;

describe facturas;

select sysdate(); -- MySQL // Oracle
select current_timestamp(); -- ANSI
-- son funciones que devuelve la fecha y la hora actual

-- ////////////// FULL OUTER JOIN //////////////
-- Trae todas lass relaciones posibles entre las tablas, si la relación no existiera, completa
-- con valores nulos.
-- En MySQL no existe la cláusula FULL OUTER JOIN como tal, pero podemos simular su funcionamiento,
-- es decir, traer el mismo resultado, de la siguiente manera
select		c.nombre, c.apellido, f.*
from		clientes c
left join	facturas f
on			c.codigo=f.codigo_cliente
UNION
select 		c.nombre, c.apellido, f.*
from 		clientes c
right join	facturas f
on 			c.codigo=f.codigo_cliente;

-- ////////////// CROSS JOIN //////////////
-- trae el producto cartesiano, es decir, todas las combinaciones posibles
select 		c.nombre, c.apellido, f.*
from		clientes c
CROSS JOIN	facturas f;

-- ////////////// FOREIGN KEY //////////////
/*
Al trabajar con bases de datos, debemos proteger los datos para que la base quede libre de
inconsistencias.
Con los comandos UPDATE y DELETE podemos perder esa integridad.
Tenemos distintas herramientas que nos permiten asegurar la integridad de los datos:
Tipos de datos, definiciones NOT NULL, definiciones DEFAULT, CHECK, PRIMARY KEY, etc.
Las CONSTRAINTS nos definen reglas en base a los valores permitidos en las columnas y son
los mecanismos standard para asegurar la integridad.
La integridad referencial, preserva las relaciones definidas entre las tablas. Cuando se
ingresan, modifican o eliminan registros.
Se implementan con claves PRIMARIAS y FORÁNEAS.
Esto nos va a permitir evitar que se agreguen registros a una tabla relacionada con otra tabla
si no hay registros asociados en la tabla correspondiente.
También evita que se borren registros desde una tabla si existen registros relacionados en 
la otra tabla de la relación.
Una clave foránea (FOREIGN KEY) es una restricción que cuida la integridad referencial de los 
datos entre dos tablas.
La FOREIGN KEY establece la relación entre un campo o un conjunto de campos con otro campo o
conjunto de campos de otra tabla.
Garantizan que los datos de una tabla estén correctamente relacionados con los datos de otra
tabla.
*/
alter table 	facturas
add constraint 	FK_facturas_clientes
foreign key		(codigo_cliente)
references 		clientes(codigo);

delete from facturas where codigo_cliente in (30,31);

insert into facturas values
('B', 5, 40, curdate(), 10000);
-- no se inserta el registo porque rompe la integridad referencial

-- //////////// Ejemplos de consultas con JOIN /////////////////
use negocio_matutino;
-- ¿Quiénes compraron hoy? (nombre, apellido)
select 	nombre, apellido
from 	clientes
join	facturas
on		codigo=codigo_cliente
where	fecha=curdate();

insert into facturas values
('B', 6, 10, curdate(), 10000);

-- ¿qué compras (facturas) realizó Juan Perez?
select 		f.*
from	facturas f
join 	clientes c
on		f.codigo_cliente=c.codigo
where	nombre='Juan' and apellido='Perez';

-- ¿cuánto se le facturó a cada cliente?
select		codigo, nombre, apellido, sum(monto) total
from		clientes
join		facturas
on			codigo=codigo_cliente
group by	codigo;

-- ¿cuál es el cliente que más ha comprado (codigo, nombre, apellido)?
select		codigo, nombre, apellido, sum(monto) total_comprado
from 		clientes c
join		facturas f
on			c.codigo=f.codigo_cliente
group by	codigo
order by	total_comprado desc
limit 		1;
-- esta query me va a traer un solo registro, aunque hubiera más que cumplan la condición
insert into facturas values
('B', 7, 10, curdate(), 97000);
-- para resolver eso utilizamos las subconsultas

-- ¿cuáles son los clientes que más han comprado (codigo, nombre, apellido)?
select		codigo, nombre, apellido, sum(monto) total_comprado
from 		clientes c
join		facturas f
on			c.codigo=f.codigo_cliente
group by	c.codigo, c.nombre, c.apellido
having		total_comprado = (
	select max(total_comprado)
    from (
		select sum(monto) total_comprado
        from clientes c
        join facturas f on c.codigo=f.codigo_cliente
        group by c.codigo
    )sub
);

-- cantidad de facturas de cada cliente (codigo, nombre, apellido, cantidad_facturas)
select		codigo, nombre, apellido, count(*) cantidad_facturas
from 		clientes c
join		facturas f
on			codigo=codigo_cliente
group by	codigo;

-- ¿quiénes compraron el primer día de ventas? (codigo, nombre, apellido, fecha)
select 		codigo, nombre, apellido, fecha
from		clientes
join		facturas
on			codigo=codigo_cliente
where		fecha = (select min(fecha) from facturas);

-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

-- creamos la tabla articulos
create table articulos(
	codigo int primary key,
    nombre varchar(50) not null,
    precio double not null,
    stock int not null
);

insert into articulos values 
(1,'destornillador philips',1500,100),
(2, 'tornillo', 100, 2000),
(50, 'pinza amperométrica', 30000,20),
(20, 'martillo Hammer', 15000,200),
(25, 'cable x mt', 500,5000),
(51,'pinza', 2000,500),
(52, 'soldador', 5000, 200),
(53, 'pala', 1500, 400),
(54, 'tijera', 500, 10),
(55, 'foco de luz', 1700, 50),
(56, 'maza', 8000, 1000),
(57, 'cinta métrica', 3001, 2),
(100,'destornillador punta plana',2500,500),
(200,'tenaza',3500,22),
(300,'martillo',150,2800),
(400,'cemento',35,1800),
(500,'balde',55,130),
(600, 'alicate', 2500, 150),
(700, 'llave inglesa', 4500, 75),
(800, 'cinta aisladora', 200, 1000),
(900, 'taladro', 25000, 30),
(1000, 'nivel de burbuja', 3500, 60),
(11, 'serrucho', 4000, 40),
(12, 'espátula', 1500, 200),
(13, 'tijera de podar', 3000, 90),
(14, 'guantes de trabajo', 1200, 500),
(15, 'sierra circular', 45000, 15);

-- creamos la tabla detalles
create table detalles(
	letra char(1),
    numero int,
    codigo int,
    primary key (letra, numero, codigo)
);

-- establecemos la restricción de clave foránea
alter table		detalles
add constraint 	FK_detalles_facturas
foreign key		(letra, numero)
references		facturas(letra, numero);

alter table 	detalles
add constraint	FK_detalles_articulos
foreign key		(codigo)
references		articulos(codigo);

insert into detalles values 
('A', 1, 1),
('A', 1, 15),
('A', 2, 100),
('A', 3, 2),
('A', 4, 200),
('A', 5, 300),
('B', 6, 51),
('B', 7, 52),
('C', 1, 57),
('C', 2, 11),
('C', 3, 20),
('M', 1, 11),
('M', 2, 200);

insert into detalles values 
('M', 1, 11); -- no se inserta porque está repetida la PK

insert into detalles values
('M', 2, 52);

-- consulta de producto relacionado
select 	c.nombre, c.apellido, a.codigo, a.nombre, f.letra, f.numero, f.fecha
from	clientes c
join	facturas f
on		c.codigo=f.codigo_cliente
join	detalles d
on		f.letra=d.letra and f.numero=d.numero
join	articulos a
on		d.codigo=a.codigo;

-- ¿Qué artículos compró Juan Perez?
select		c.nombre 'Nombre del cliente', c.apellido 'Apellido del cliente', a.nombre 'Artículo'
from		clientes c
join		facturas f
on			c.codigo=f.codigo_cliente
join		detalles d
on			f.letra=d.letra and f.numero=d.numero
join		articulos a
on			d.codigo=a.codigo
where 		c.nombre='Juan' and c.apellido='Perez';

-- informar quiénes (nombre, apellido) compraron 'martillo hammer'
select		distinct concat(c.nombre, ' ', c.apellido) nombre_cliente
from 		clientes c
join		facturas f on c.codigo=f.codigo_cliente
join		detalles d on f.letra=d.letra and f.numero=d.numero
join		articulos a on d.codigo=a.codigo
where		a.nombre='martillo hammer';


select		concat(c.nombre, ' ', c.apellido) nombre_cliente
from 		clientes c
join		facturas f on c.codigo=f.codigo_cliente
join		detalles d on f.letra=d.letra and f.numero=d.numero
join		articulos a on d.codigo=a.codigo
where		a.nombre='martillo hammer'
group by	c.codigo;

insert into facturas values
('A', 6, 4, curdate(), 10000);

insert into detalles values
('A', 6, 20);

-- listar los artículos vendidos en el día de hoy
select		distinct a.codigo, a.nombre, a.precio
from		facturas f
join		detalles d on f.letra=d.letra and f.numero=d.numero
join		articulos a on d.codigo=a.codigo
where		fecha=curdate();



