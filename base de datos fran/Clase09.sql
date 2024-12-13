-- Clase 09

-- -----------------------------------------
-- COMBINACIÓN DE CONSULTAS
-- -----------------------------------------

/*
Para comparar los resultados de varias consultas y combinarlas en un único
resultado, existe el operador UNION.
Para que funcione correctamente, tenemos que tener en cuenta:
- en cada resultado tiene que haber la misma cantidad de campos
- los campos tienen que tener el mismo tipo de dato
- las primeras consultas se escriben sin el punto y coma final
- los registros duplicados se eliminan
- si queremos conservar los registros duplicados, se utiliza el 
operador UNION ALL
*/

-- supongamos que tenemos 2 tablas que representan a hombres y mujeres
-- una tabla para hombres y otra para mujeres
-- en cada tabla guardamos el nombre, la provincia y la edad

use cursomysql;

create table hombres(
	nombre varchar(50) not null,
    provincia varchar(50) not null,
    edad int not null
);

create table mujeres(
	nombre varchar(50) not null,
    provincia varchar(50) not null,
    edad int not null
);

insert into hombres values
('Juan', 'Buenos Aires', 32),
('Luis', 'Córdoba', 24),
('Mariano', 'Mendoza', 40),
('Cris', 'Mendoza', 20),
('Raul', 'San Juan', 35);

insert into mujeres values
('Malena', 'Catamarca', 22),
('Luisa', 'Formosa', 30),
('Cris', 'Buenos Aires', 61),
('Alejandra', 'Córdoba', 19),
('Mariela', 'Misiones', 50);

-- obtener el listado de todos (hombres y mujeres)
select * from hombres
UNION
select * from mujeres;

-- obtener el listado de todos los nombres
select nombre from hombres
UNION
select nombre from mujeres;

-- obtener el listado de nombres, trayendo los duplicados
select nombre from hombres
UNION ALL
select nombre from mujeres;

-- obtener todos los nombres de quienes sean de la provincia de Mendoza
select nombre from hombres where provincia='Mendoza'
UNION
select nombre from mujeres where provincia='Mendoza';

-- obtener todos los nombres de los hombres que sean de Córdoba y de
-- las mujeres que sean de Misiones
select nombre from hombres where provincia='Córdoba'
UNION
select nombre from mujeres where provincia='Misiones';

/*
Workbench permite armar gráficas de las bases de datos.
Trae incorporado un graficador. Que nos permite realizar la gráfica de la base.
Mediante un proceso que se conoce como ingeniería reversa, se analiza una base
de datos existente y se arma una representación visual de la estructura.
Esto es muy útil al momento de tener una documentación de la base de datos, un 
análisis de funcionamiento, para ver posibles fallas, errores, para generar una
optimización de rendimiento, incluso para realizar mejoras, modificaciones, o una
nueva base que suplante la actual.

A este diagrama se lo conoce como DER (Diagrama de Entidad Relacional) en inglés 
sería ERD (Entity Relationship Diagram).
Es la representación gráfica de la estructura de la base de datos que muestra las 
entidades, los atributos y las relaciones.

Hay 3 conceptos claves que figuran en un DER:
1- entidades: son las representaciones de los objetos o conceptos del mundo real.
			 Por ejemplo: clientes, facturas, articulos. Es decir, las tablas.
2- atributos: son las caraterísticas o propiedades de las entidades.
			 Por ejemplo, nombre, apellido, monto, stock, codigo. Es decir, los campos.
3- relaciones: son las relaciones entre las tablas. Es decir, cómo se relacionan entre
			   ellas. Por ejemplo, una factura pertenece a un cliente.

*/

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






