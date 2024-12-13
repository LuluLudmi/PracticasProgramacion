-- Clase15

-- Crear la base de datos biblioteca de acuerdo al siguiente esquema:

-- -------------    -------------------     -------------     
-- - libros    -    - prestamos       -     - socios    -    
-- -------------    -------------------     -------------     
-- - codigo PK -    - documento   PK FK -     - documento  PK -
-- - titulo    -    - codigo_libro PK FK -     - nombre    -
-- - autor     -    - fecha_prestamo   -       - domicilio -
-- -------------    - fecha_devolucion -     -------------
--                  -------------------                

-- insertar 15 registros en cada tabla

drop database if exists biblioteca;
create database biblioteca;
use biblioteca;

create table libros(
	codigo int auto_increment,
    titulo varchar(80) not null,
    autor varchar(50) not null,
    primary key(codigo)
);

create table socios(
	documento char(8),
    nombre varchar(50) not null,
    domicilio varchar(30),
    primary key(documento)
);

create table prestamos(
	documento char(8),
    codigo_libro int,
    fecha_prestamo date not null,
    fecha_devolucion date,
    primary key(documento, codigo_libro)
);

alter table prestamos add constraint FK_prestamos_libros
foreign key(codigo_libro) references libros(codigo);

alter table prestamos add constraint FK_prestamos_socios
foreign key(documento) references socios(documento);

INSERT INTO libros (titulo, autor) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez'),
('Don Quijote de la Mancha', 'Miguel de Cervantes'),
('1984', 'George Orwell'),
('El Gran Gatsby', 'F. Scott Fitzgerald'),
('Matar a un Ruiseñor', 'Harper Lee'),
('El Hobbit', 'J.R.R. Tolkien'),
('Orgullo y Prejuicio', 'Jane Austen'),
('El Código Da Vinci', 'Dan Brown'),
('Los Miserables', 'Victor Hugo'),
('La Casa de los Espíritus', 'Isabel Allende'),
('El Retrato de Dorian Gray', 'Oscar Wilde'),
('Crimen y Castigo', 'Fiódor Dostoyevski'),
('La Sombra del Viento', 'Carlos Ruiz Zafón'),
('Fahrenheit 451', 'Ray Bradbury'),
('El Alquimista', 'Paulo Coelho');

INSERT INTO socios (documento, nombre, domicilio) VALUES
('12345678', 'Juan Pérez', 'Calle Falsa 123'),
('23456789', 'María Gómez', 'Avenida Siempre Viva 456'),
('34567890', 'Carlos Rodríguez', 'Calle del Sol 789'),
('45678901', 'Ana Martínez', 'Paseo Marítimo 101'),
('56789012', 'Luis Sánchez', 'Calle Nueva 202'),
('67890123', 'Laura López', 'Calle Principal 303'),
('78901234', 'Jorge Torres', 'Calle Secundaria 404'),
('89012345', 'Sofía Fernández', 'Calle Larga 505'),
('90123456', 'Pedro García', 'Calle Alta 606'),
('01234567', 'Elena Díaz', 'Calle Baja 707'),
('12398765', 'José Gómez', 'Calle de la Luna 808'),
('23487654', 'Paula Sánchez', 'Calle del Mar 909'),
('34576543', 'Raúl Martín', 'Calle del Viento 100'),
('45665432', 'Carmen López', 'Calle Real 200'),
('56754321', 'Diego Pérez', 'Calle del Río 300');


INSERT INTO prestamos (documento, codigo_libro, fecha_prestamo, fecha_devolucion) VALUES
('12345678', 1, '2024-10-01', '2024-10-15'),
('23456789', 2, '2024-09-15', '2024-09-29'),
('34567890', 3, '2024-08-20', NULL),
('45678901', 4, '2024-07-10', '2024-07-25'),
('56789012', 5, '2024-11-01', NULL),
('67890123', 6, '2024-05-15', '2024-05-30'),
('78901234', 7, '2024-06-12', '2024-06-26'),
('89012345', 8, '2024-10-05', '2024-10-20'),
('90123456', 9, '2024-09-01', '2024-09-14'),
('01234567', 10, '2024-08-15', NULL),
('12398765', 11, '2024-07-01', '2024-07-15'),
('23487654', 12, '2024-10-18', NULL),
('34576543', 13, '2024-06-20', '2024-07-05'),
('45665432', 14, '2024-05-10', NULL),
('56754321', 15, '2024-10-25', '2024-11-05');

-- 1- qué libros (codigo, titulo, autor) se le prestaron a cada socio?
select 		s.nombre, l.*
from 		libros l 
join		prestamos p on l.codigo=codigo_libro
join		socios s on p.documento=s.documento;

-- 2- Listar los socios (documento, nombre, domicilio) a los que se les prestaron libros de Java
select 	distinct s.documento, s.nombre, s.domicilio
from 	socios s
join	prestamos p on s.documento=p.documento
join	libros l on p.codigo_libro=l.codigo
where 	l.titulo like '%Java%';

/*
_ -> representa a un caracter cualquiera (a, x, t, 1, 8,  , @, +)
% -> representa a un caracter cualquiera, una cadena de caracteres cualquiera o nada.
*/

-- 3- Listar los libros (codigo,titulo,autor) que no fueron devueltos 
select 		l.*
from 		libros l
join		prestamos p on l.codigo=p.codigo_libro
where		fecha_devolucion is null;

-- 4- Lista de socios (documento, nombre, domicilio) que tienen libros sin devolver
select		s.*
from		prestamos p
join		socios s on p.documento=s.documento
where		p.fecha_devolucion is null
group by	s.documento;

-- 5- Lista de socios (documento, nombre, domicilio) que tienen libros sin devolver y cuáles son esos libros
select		s.*, l.titulo
from		prestamos p
join		socios s on p.documento=s.documento
join		libros l on p.codigo_libro=l.codigo
where		p.fecha_devolucion is null;

-- 6- cantidad de libros sin devolver
select 	count(*)
from	prestamos
where	fecha_devolucion is null;

-- 7. Lista de libros que fueron prestados el día de hoy.
select	l.titulo
from 	libros l
join	prestamos p on l.codigo=p.codigo_libro
where 	p.fecha_prestamo = curdate();

-- 8- Cantidad de libros que se prestaron este mes
select	count(*)
from 	prestamos p 
where	p.fecha_prestamo between 2024-11-01 and 2024-11-30;

select	count(*)
from 	prestamos 
where	year(fecha_prestamo) = 2024 and  month(fecha_prestamo) = 11;

-- 9- Cantidad de socios que tomaron libros prestados este mes
select 	count(distinct documento)
from 	prestamos 
where 	month(fecha_prestamo) = month(curdate());

select * from prestamos;

INSERT INTO prestamos (documento, codigo_libro, fecha_prestamo, fecha_devolucion) VALUES
('12345678', 3, '2024-10-01', '2024-10-15');	
