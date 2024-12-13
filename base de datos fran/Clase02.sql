-- Clase02

-- algunos comandos para trabajar con fecha y hora:

select curdate();
-- devuelve la fecha actual

select curtime();
-- devuelve la hora actual

select sysdate();
-- devuelve la fecha y la hora

-- ------------------------------
-- Cómo crear una Base de Datos
-- ------------------------------

show databases; -- muestra las bases de datos del sistema (servidor)
-- el ; es el terminador de instrucciones

SHOW DATABASES; -- se pueden escribir las instrucciones en mayúscula
-- el lenguaje es NO CASE SENSITIVE

drop database if exists cursomysql;
-- elimina la base de datos cursomysql si es que existe

create database cursomysql;
-- crea la base de datos cursomysql

create database if not exists cursomysql;
-- crea la base de datos si es que no existe

show databases;

/*
Los objetos creados en Windows no diferencian mayúsculas de minúsculas.
Pero los objetos creados en Linux o Unix son case sensitive, es decir que,
create database administracion;
create database ADMINISTRACION;
bajo Windows estaríamos creando la misma BD, 
pero en Linux serían dos bases distintas.
*/

use cursomysql;
-- nos posiciona dentro de la BD

show tables;
-- lista las tablas de la BD

-- ------------------------------
-- Cómo crear una tabla de MySQL
-- ------------------------------

-- creamos la tabla clientes
create table clientes(
	codigo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    cuit char(13) not null,
    direccion varchar(100),
    primary key (codigo)
);

-- PK significa Primary Key, identifica como único al registro dentro de
-- una tabla. Su valor no puede ser repetido.
-- auto_increment permite que el contenido de dicho campo sea ingresado
-- automáticamente y de forma autonumerada. Esta cláusula es solo aplicable
-- a la PK.
-- La cláusula NOT NULL indica que ese campo es de ingreso obligatorio

show tables;
-- verifico si existe la tabla que acabo de crear

describe clientes;
-- muestra la estructura de la tabla, es decir, una descripción de sus campos

drop table clientes;
-- elimina la tabla clientes

drop table if exists clientes;
-- elimina la tabla si es que existe

create table if not exists clientes(
	codigo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    cuit char(11) not null,
    direccion varchar(100),
    primary key (codigo)
);
-- en caso de que ya exista la tabla, se omite la creación

select * from clientes;
-- lista todos los campos de todos los registros de la tabla

-- Ingresar registros a una tabla

insert into clientes (nombre, apellido, cuit, direccion) values
('Juan', 'Gardoni', '22335566891', 'Medrano 162');
insert into clientes (nombre, apellido, cuit, direccion) values
('Maria', 'Gonzalez', '33226655998', 'Lavalle 22');
insert into clientes (nombre, apellido, cuit, direccion) values
('Marcelo', 'López', '89653525642', 'Laprida 241');
insert into clientes (nombre, apellido, cuit, direccion) values
('Juana', 'Gutierrez', '77445588216', 'San Juan 2309');
insert into clientes (nombre, apellido, cuit, direccion) values
('Marcela', 'Díaz', '23845658213', 'Belgrano 122');




