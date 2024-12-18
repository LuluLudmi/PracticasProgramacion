
drop database if exists mayorista_01_v;
create database mayorista_01_v;
use mayorista_01_v;


CREATE TABLE Categorias (
id_categoria INT PRIMARY KEY,
nombre_categoria VARCHAR(50)
);
show tables;
describe Categorias;

CREATE TABLE Productos (
id_producto INT PRIMARY KEY,
nombre VARCHAR(50),
precio DECIMAL(10, 2)
);
show tables;

CREATE TABLE Vendedores (
VendedorID INT PRIMARY KEY,
Nombre VARCHAR (100),
Email VARCHAR (100),
Telefono VARCHAR(15)
);
show tables;

-- 2. Insertar datos:

INSERT INTO Categorias (id_categoria, nombre_categoria) VALUES
(1, 'Electrónica'),
(2, 'Ropa'),
(3, 'Alimentos');
select*from Categorias;

INSERT INTO Productos (id_producto, nombre, precio) VALUES
(1, 'Televisor', 300.00),
(2, 'Laptop', 800.00),
(3, 'Camisa', 20.00),
(4, 'Pantalón', 25.00),
(5, 'Manzana', 1.00),
(6, 'Plátano', 0.50);
select*from Productos;

INSERT INTO Vendedores (VendedorID, Nombre, Email, Telefono) VALUES
(1, 'Juan Pérez', 'juan.perez@example.com', '555-1234'),
(2, 'María López', 'maria.lopez@example.com', '555-5678');
select*from Vendedores;


-- 1. Seleccionar todos los productos:
select nombre from productos;

-- 2. Seleccionar todos los vendedores:
select nombre from vendedores;
-- 3. Obtener productos de una categoría específica (por ejemplo, Electrónica)
select *from categorias
where id_categoria=1;

-- 4. Contar cuántos productos hay en cada categoría:
select count(*) cantidad_productos
from productos;

-- 5. Obtener el precio promedio de los productos:
select  round(avg(precio),2) precio_promedio
from productos;

-- 6. Listar los vendedores con su información de contacto:
select nombre,email,telefono 
from vendedores;

-- 7. Buscar un producto por su nombre (por ejemplo, "Laptop"):
select*from  productos
where nombre='laptop';

-- 8. Actualizar el precio de un producto (por ejemplo, aumentar el precio de la Camisa):
update productos set precio=25.00
where nombre='camisa';
select * from productos;
-- 9. Eliminar un vendedor (por ejemplo, Juan Pérez):
delete from vendedores
where vendedorid=1;

-- 10. Si deseas actualizar la información de un vendedor, puedes usar la siguiente consulta.
--  Por ejemplo, si quieres cambiar el teléfono de Juan Pérez:
update vendedores set telefono= '2346-7890'
where vendedorid=2;
select*from vendedores;

-- 11. Supongamos que queremos aumentar el precio de todos los productos en la categoría "Ropa" en un 10%.
update productos set precio=precio*1.10;
select*from productos;

-- Ejercicios de Consulta
-- 1. SUM: ¿Cuál es el precio total de todos los productos?
select sum(precio) precio_total
from productos;

-- 2. MAX: ¿Cuál es el precio del producto más caro?
select max(precio) precio_maximo
from productos;


-- 3. MIN: ¿Cuál es el precio del producto más barato?
select min(precio) precio_minimo
from productos;
-- 4. HAVING: ¿Cuántos productos hay en cada categoría y cuáles son las categorías que tienen más de un producto?

### Ejercicios de Actualización y Eliminación
-- 5. UPDATE: Supongamos que quieres actualizar el precio de la 'Laptop'
--  a 750.00. ¿Cómo lo harías?
update productos set precio=750.00
where nombre='laptop';
select*from productos;
-- 6. DELETE: Si deseas eliminar el producto 'Manzana', ¿cuál sería la consulta?
delete from  productos
 where nombre='manzana';
 select*from productos;
 -- sentencia Join
 use negocio_v;
 show  tables;
 describe articulos;
 describe clientes;
 describe facturas;
 select*from articulos;
 select*from clientes;
 select*from facturas;
 
 select*from clientes,facturas; -- relaciono dos tablas asignandole un CodigoCliente.
 select count(*) cantidad from clientes;
 select count(*) cantidad from facturas;
 
 alter table  facturas add CodigoCliente int not null;
 update facturas set CodigoCliente=2
 where numero =1001;
 update facturas set CodigoCliente=7
 where numero =1021;
 update facturas set CodigoCliente=10
 where numero =1003;
 update facturas set CodigoCliente=12
 where numero =1004;
 update facturas set CodigoCliente=15
 where numero =1005;
 update facturas set CodigoCliente=17
 where numero =1006;
 update facturas set CodigoCliente=20
 where numero =1007;
 
 select*from clientes,facturas
 where clientes.codigo_cliente=facturas.CodigoCliente;
 select*from clientes c,facturas f
 where c.codigo_cliente=f.CodigoCliente;
 
 -- sentencia join para unir tablas   
 select*from clientes c join facturas f 
 on c.codigo_cliente=f.CodigoCliente;
 
 -- left join 
 select*from clientes c left join facturas f
  on c.codigo_cliente=f.CodigoCliente;
  
  -- right join
  select * from clientes c right join facturas f
  on c.codigo_cliente=f.CodigoCliente;
  drop database if exists kiosco_v;
create database kiosco_v;
use kiosco_V;

create table CLIENTE(
id_cliente int primary key,
nombre varchar(50),
direccion varchar(50),
telefono varchar(50),
ciudad varchar(50)
);
show tables;
describe CLIENTE;

create table PRODUCTO(
id_producto int primary key,
descripcion varchar(45) not null,
precio double not null
);
create table VENTA(
id_venta int primary key,
cantidad int not null,
id_cliente int not null references cliente,
id_producto int not null references producto
);


describe CLIENTE;
show tables;
SELECT * FROM CLIENTE;

INSERT INTO CLIENTE VALUES(123,'Simon Bolivar', 'Kra11#9-56', '7702291', 'Cali');
INSERT INTO CLIENTE VALUES(456,'Mark Zuckerberg', 'Cll 21#95-52', '+57-315291', 'Medellin');
INSERT INTO CLIENTE VALUES(789,'Drew Barrymore', 'Kra52#65-05', '3125359456', 'Cali');
INSERT INTO CLIENTE VALUES(741,'Larry Page', 'Cll 05#52-95', '7872296', 'Tunja');
INSERT INTO CLIENTE VALUES(147,'Tom Delonge', 'Cll 52#65-56', '7992293', 'Medellin');
INSERT INTO CLIENTE VALUES(852,'Simon Bolivar', 'Kra 21#65-52', '982295', 'Bogota');
INSERT INTO CLIENTE VALUES(258,'Mark Hoppus', 'Cll 11#95-9', '8952294', 'Bogota');
INSERT INTO CLIENTE VALUES(963,'Britney Spears', 'Cll 05#52-56', '7705295', 'Tunja');
INSERT INTO CLIENTE VALUES(369,'John Forbes Nash', 'Kra 21#05-56', '776622966', 'Cali');
INSERT INTO CLIENTE VALUES(159,'Tom Delonge', 'Kra05#65-05', '6702293','Medellin');
INSERT INTO CLIENTE VALUES(753,'Sergey Brin', 'Cll 11#65-11', '9702299', 'Medellin');
INSERT INTO CLIENTE VALUES(153,'Emma Watson', 'Kra 9#9-95', '31569638', 'Tunja');


INSERT INTO PRODUCTO VALUES(1,'Coca-Cola 2L',24);
INSERT INTO PRODUCTO VALUES(2,'Doritos',95);
INSERT INTO PRODUCTO VALUES(3,'Salchicha',55);
INSERT INTO PRODUCTO VALUES(4,'Pan',50);
INSERT INTO PRODUCTO VALUES(5,'Queso',100);
INSERT INTO PRODUCTO VALUES(6,'Sandia',80);
INSERT INTO PRODUCTO VALUES(7,'Leche 1L',45);
INSERT INTO PRODUCTO VALUES(8,'Atun',180);
INSERT INTO PRODUCTO VALUES(9,'Pescado',78);
INSERT INTO PRODUCTO VALUES(10,'Cinta Estatica',180);
INSERT INTO PRODUCTO VALUES(11,'Camiseta',1200);
INSERT INTO PRODUCTO VALUES(12,'Blue-Jean',780);
INSERT INTO PRODUCTO VALUES(13,'Papaya',50);
INSERT INTO PRODUCTO VALUES(14,'Agua',30);
INSERT INTO PRODUCTO VALUES(15,'Red Bull',55);


INSERT INTO VENTA VALUES(1,5,123,1);
INSERT INTO VENTA VALUES(2,6,123,2);
INSERT INTO VENTA VALUES(3,7,123,3);
INSERT INTO VENTA VALUES(4,8,123,4);
INSERT INTO VENTA VALUES(5,2,456,5);
INSERT INTO VENTA VALUES(6,4,741,6);
INSERT INTO VENTA VALUES(7,5,456,7);
INSERT INTO VENTA VALUES(8,600,741,8);
INSERT INTO VENTA VALUES(9,69,852,9);
INSERT INTO VENTA VALUES(10,15,789,10);
INSERT INTO VENTA VALUES(11,11,456,5);
INSERT INTO VENTA VALUES(12,22,789,6);
INSERT INTO VENTA VALUES(13,11,753,7);
INSERT INTO VENTA VALUES(14,10,963,12);
INSERT INTO VENTA VALUES(15,65,963,11);
INSERT INTO VENTA VALUES(16,12,852,10);
INSERT INTO VENTA VALUES(17,65,741,9);
INSERT INTO VENTA VALUES(18,78,147,8);
INSERT INTO VENTA VALUES(19,92,258,9);
INSERT INTO VENTA VALUES(20,12,258,6);
INSERT INTO VENTA VALUES(21,32,147,3);
INSERT INTO VENTA VALUES(22,3,789,1);
INSERT INTO VENTA VALUES(23,45,456,2);
INSERT INTO VENTA VALUES(24,5,123,3);
INSERT INTO VENTA VALUES(25,5,789,4);
INSERT INTO VENTA VALUES(26,6,456,1);
INSERT INTO VENTA VALUES(27,4,123,2);
INSERT INTO VENTA VALUES(28,7,789,12);
INSERT INTO VENTA VALUES(29,8,258,13);
INSERT INTO VENTA VALUES(30,9,852,14);
INSERT INTO VENTA VALUES(31,9,753,15);
INSERT INTO VENTA VALUES(32,6,753,10);
INSERT INTO VENTA VALUES(33,7,159,9);
INSERT INTO VENTA VALUES(34,8,963,10);
INSERT INTO VENTA VALUES(35,9,369,8);
INSERT INTO VENTA VALUES(36,15,369,7);
INSERT INTO VENTA VALUES(37,5,123,5);
INSERT INTO VENTA VALUES(38,6,123,6);
INSERT INTO VENTA VALUES(39,7,123,7);
INSERT INTO VENTA VALUES(40,8,123,8);
INSERT INTO VENTA VALUES(41,5,123,9);
INSERT INTO VENTA VALUES(42,6,123,10);
INSERT INTO VENTA VALUES(43,7,123,11);
INSERT INTO VENTA VALUES(44,8,123,12);
INSERT INTO VENTA VALUES(45,5,123,13);
INSERT INTO VENTA VALUES(46,6,123,14);
INSERT INTO VENTA VALUES(47,7,123,15);
select*from cliente;
select*from producto;
select*from venta;


-- 1. Id de los clientes de Cali.
select id_cliente from cliente
where ciudad = 'Cali';

-- 2. Id y la descripción de los productos que cuesten menos de $150 pesos.
select id_producto,descripcion from producto
where precio<150;

-- 3. Id y nombre de los clientes, cantidad vendida y la descripción del producto, 
-- en las ventas en las cuales se vendieron más de 10 unidades.
select c.id_cliente,c.nombre,v.cantidad,p.descripcion from venta v
join cliente c 
on v.id_cliente=c.id_cliente
join producto p on v.id_producto= p.id_producto
where v.cantidad >10;

-- natural join
select id_cliente,nombre,cantidad,descripcion
from venta
natural join producto
natural join cliente
where cantidad > 10;

-- 4. Id y nombre de los clientes que no aparecen en la tabla de ventas 
-- (Clientes que no han comprado productos).
select c.id_cliente,c.nombre from cliente c 
left join venta v on c.id_cliente= v.id_cliente
where v.id_cliente is null;

select id_cliente,nombre from cliente
where id_cliente not in(select distinct id_cliente
from venta);

-- 5. Id y nombre de los clientes que han comprado todos los productos de la empresa.
select c.id_cliente,c.nombre from cliente c 
join venta v on c.id_cliente=v.id_cliente
group by c.id_cliente,c.nombre
having count(distinct v.id_producto)=(select count(*) from producto);
select*from cliente;


-- 6. Id, nombre de cada cliente y la suma total (suma de cantidad) 
-- de los productos que ha comprado.
select c.id_cliente,c.nombre,sum(v.cantidad) total_cantidad
from cliente c join venta v on c.id_cliente=v.id_cliente
group by c.id_cliente,c.nombre;

select id_cliente, nombre, sum(cantidad) total_cantidad
from cliente natural join venta
group by id_cliente,nombre;

-- 7. Id de los productos que no han sido comprados por clientes de Tunja.
select p.id_producto from producto p
where p.id_producto not in (select v.id_producto from venta v 
join cliente c on v.id_cliente = c.id_cliente
where c.ciudad ='tunja');

select p.id_producto from producto p
where p.id_producto not in (select id_producto from cliente
natural join venta
where ciudad='tunja');

-- 8. Id de los productos que se han vendido a clientes de Medellín y que 
-- también se han vendido a clientes de Bogotá.
select distinct p.id_producto,p.descripcion from producto p,cliente c, venta v
where v.id_cliente= c.id_cliente and v.id_producto = p.id_producto
and c.ciudad in ('medellin', 'bogota');

select distinct id_producto,descripcion from cliente
natural join venta
natural join producto
where ciudad = 'Medellin' in(select distinct  id_producto from cliente
natural join venta
natural join producto
where  ciudad = 'bogota');

select distinct p.id_producto,p.descripcion from venta v 
join producto p on v.id_producto = p.id_producto
join cliente c on v.id_cliente = c.id_cliente
where c.ciudad in ('medellin','bogota');

-- 9. Nombre de las ciudades en las que se han vendido todos los productos.
  
  select c.ciudad from cliente c join venta v 
  on c.id_cliente = v.id_cliente
  group by c.ciudad 
  having count(distinct v.id_producto)=(select count(*) from producto);
  
  


-- -----------------------------------------------------
-- Tablemydb`.`FABRICANTES`
-- ----------------------------------------------------
drop database if exists ejemplo_v;
create database ejemplo_v;
use ejemplo_v;

CREATE TABLE FABRICANTES (
 Codigo INT NOT NULL,
 Nombre VARCHAR(100) NULL,
  PRIMARY KEY (Codigo))
;


-- -----------------------------------------------------
-- Tablemydb`.`ARTICULOS`
-- -----------------------------------------------------
CREATE TABLE ARTICULOS (
 codigo INT NOT NULL,
 nombre VARCHAR(100) NULL,
 precio INT NULL,
 fabricante INT NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_ARTICULOS_FABRICANTES
    FOREIGN KEY (fabricante)
    REFERENCES  FABRICANTES (Codigo)
  );


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO FABRICANTES (codigo, nombre) VALUES
(1, 'Fabricante A'),
(2, 'Fabricante B'),
(3, 'Fabricante C');

INSERT INTO ARTICULOS (codigo, nombre, precio, fabricante) VALUES
(1, 'Producto 1', 100, 1),
(2, 'Producto 2', 150, 1),
(3, 'Producto 3', 200, 2),
(4, 'Producto 4', 50, 2),
(5, 'Producto 5', 80, 3),
(6, 'Producto 6', 180, 3),
(7, 'Producto 7', 220, 1),
(8, 'Producto 8', 120, 2),
(9, 'Producto 9', 90, 3);


-- 1 Obtener los nombres de los productos de la tienda.
select nombre from productos;
-- 2 Obtener los nombres y los precios de los productos de la tienda.
select nombre,precios from productos;
-- 3 Obtener el nombre de los productos cuyo precio sea menor o igual a $ 20000.
select 
-- 4 Obtener todos los datos de los artículos cuyo precio este entre los $ 60  y los $120 (Ambas cantidades incluidas).
-- 5 Obtener el nombre y el precio en dólares (es decir, el precio peso multiplicado por 1000)
-- 6 Seleccionar el precio medio de todos los productos.
-- 7 Obtener el precio medio de los  artículos  cuyo código de  fabricante  sea 2.
-- 8 Obtener el número de artículos cuyo precio sea mayor o igual a $ 180.
-- 9 Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a $ 180 y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
-- 10 Obtener un listado completo de artículos, incluyendo por cada artículo los datos del artículo y de su fabricante.
-- 11 Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante.
-- 12 Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos  de  fabricante.
-- 13 Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
-- 14 Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a $150.
-- 15 Obtener el nombre y precio  del artículo más barato.
-- 16 Obtener  una  lista  con  el  nombre  y  precio  de  los  artículos  más  caros  de  cada  proveedor (incluyendo el nombre del proveedor).
-- 17 Añadir un nuevo producto: Altavoces de  $ 70   (del fabricante 2)
-- 18 Cambiar el nombre del producto 8 a Impresora Láser
-- 19 Aplicar un descuento del 10 % (multiplicar el precio por 0,9) a todos los productos. 
  
  
