-- 1- crear las tablas-
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


-- 2. Seleccionar todos los vendedores:

-- 3. Obtener productos de una categoría específica (por ejemplo, Electrónica):
select nombre_categoria from Categorias;

4. Contar cuántos productos hay en cada categoría:

5. Obtener el precio promedio de los productos:

6. Listar los vendedores con su información de contacto:

7. Buscar un producto por su nombre (por ejemplo, "Laptop"):

8. Actualizar el precio de un producto (por ejemplo, aumentar el precio de la Camisa):

9. Eliminar un vendedor (por ejemplo, Juan Pérez):

10. Si deseas actualizar la información de un vendedor, puedes usar la siguiente consulta. Por ejemplo, si quieres cambiar el teléfono de Juan Pérez:

11. Supongamos que queremos aumentar el precio de todos los productos en la categoría "Ropa" en un 10%.

Ejercicios de Consulta
1. SUM: ¿Cuál es el precio total de todos los productos?

2. MAX: ¿Cuál es el precio del producto más caro?

3. MIN: ¿Cuál es el precio del producto más barato?

4. HAVING: ¿Cuántos productos hay en cada categoría y cuáles son las categorías que tienen más de un producto?

### Ejercicios de Actualización y Eliminación
5. UPDATE: Supongamos que quieres actualizar el precio de la 'Laptop' a 750.00. ¿Cómo lo harías?

6. DELETE: Si deseas eliminar el producto 'Manzana', ¿cuál sería la consulta?

