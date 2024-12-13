drop database if exists cursomysql;

create database cursomysql;

use cursomysql;

create table clientes(
	codigo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    cuit char(13) not null,
    direccion varchar(100),
    primary key (codigo)
);

create table facturas(
	letra char(1),
    numero int,
    fecha date not null,
    monto double not null,
    primary key (letra,numero),
    check (letra in ('A', 'B', 'C', 'M'))
);

create table articulos(
	codigo int primary key,
    nombre varchar(50) not null,
    precio double not null,
    stock int not null
);



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

insert into articulos (codigo, nombre, precio, stock) values 
(1, 'caramelos flynn paff', 200, 50);
insert into articulos (codigo, nombre, precio, stock) values 
(2, 'chupetines pico dulce', 150, 30);
insert into articulos (codigo, nombre, precio, stock) values 
(3, 'alfajores fulbito', 200, 50);
insert into articulos (codigo, nombre, precio, stock) values 
(4, 'palitos de la selva', 50, 150);
insert into articulos (codigo, nombre, precio, stock) values 
(5, 'yerba Playadito', 4000, 30);
insert into articulos (codigo, nombre, precio, stock) values 
(6, 'Danonino vainilla', 10000, 30);
insert into articulos (codigo, nombre, precio, stock) values 
(7, 'pasta de maní', 280000, 5);
insert into articulos (codigo, nombre, precio, stock) values 
(8, 'mielcitas', 100, 50);
insert into articulos (codigo, nombre, precio, stock) values 
(9, 'Aquarius pera 500cc', 1500, 20);
insert into articulos (codigo, nombre, precio, stock) values 
(10, 'cañita de azúcar', 300, 100);
insert into articulos (codigo, nombre, precio, stock) values 
(11, 'leche vegetal de almendras', 320000, 20);
insert into articulos (codigo, nombre, precio, stock) values 
(12, 'cindor 1Litro', 5000, 3);

insert into articulos (precio, stock, codigo, nombre) values
( 200, 50, 13, 'turrón de maní');

insert into articulos values
(14, 'coca-cola 2lts.', 2200, 40);

insert into articulos values
(15, 'arroz 1kg', 2000, 100);

insert into articulos values
(16, 'serenito', 500, 20),
(17, 'detergente magistral', 15000, 20),
(18, 'agua mineral 500cc', 1500, 40);

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

insert into articulos (codigo, nombre, precio, stock) values
(19, 'Don Satur grasa', 1500, 200),
(20, 'Guaymallén chocolate', 300, 100),
(30, 'Tic tac naranja', 12000, 150),
(89, 'Naranjú', 18000, 3),
(900, 'Algodón de azúcar', 2500, 0);

insert into articulos values
(56, 'alfajor Block', 950, 20),
(68, 'marroc', 500, 50000),
(684, 'alfajor águila', 10000, 0),
(358, 'milka mousse', 25000, 1),
(35122, 'mentitas', 700, 500);

insert into facturas values
('A', 1, curdate(), 10000);

insert into facturas values
('A', 2, '2024-02-01', 5000),
('B', 1, '2024-05-06', 70000),
('C', 1, '2024-03-19', 10000);

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
