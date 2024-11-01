drop database if exists fabrica_v; 
create database fabrica_v; 
use fabrica_v;

-- -----------------------------------------------------
-- Table mydb.Clientes
-- -----------------------------------------------------
CREATE TABLE Clientes (
  idClientes INT NULL,
  cedula VARCHAR(45) NULL,
  nombres VARCHAR(45) NULL,
  apellidos VARCHAR(45) NULL,
  PRIMARY KEY (idClientes)
  );


-- -----------------------------------------------------
-- Table mydb.Factura
-- -----------------------------------------------------
CREATE TABLE Factura (
  id INT NULL,
  iva DOUBLE NULL,
  subtotal DOUBLE NULL,
  total DOUBLE NULL,
  Clientes_idClientes INT NOT NULL,
  PRIMARY KEY (id, Clientes_idClientes),
  
  CONSTRAINT fk_Factura_Clientes
    FOREIGN KEY (Clientes_idClientes)
    REFERENCES Clientes (idClientes)
    ON DELETE NO ACTION
    );



-- -----------------------------------------------------
-- Table mydb.Detalle
-- -----------------------------------------------------
CREATE TABLE Detalle (
  id INT NOT NULL,
  cantidad DOUBLE NULL,
  total DOUBLE NULL,
  Factura_id INT NOT NULL,
 
  PRIMARY KEY (id, Factura_id),
 
  CONSTRAINT fk_Detalle_Factura1
    FOREIGN KEY (Factura_id )
    REFERENCES Factura (id )
    ON DELETE NO ACTION
   );


-- -------------    -------------------     -------------     
-- - libros    -    - prestamos       -     - socios    -    
-- -------------    -------------------     -------------     
-- - codigo PK -    - documento   PK  -     - documento -
-- - titulo    -    - codigolibro PK  -     - nombre    -
-- - autor     -    - fechaprestamo   -     - domicilio -
-- -------------    - fechadevolucion -     -------------
--                  -------------------                

drop database if exists libros_v;
create database libros_v;
use libros_v;


create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  primary key (codigo)
);

drop table if exists socios;
create table socios(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  primary key (documento)
);

drop table if exists prestamos;
create table prestamos(
  documento char(8) not null,
  codigolibro int unsigned,
  fechaprestamo date not null,
  fechadevolucion date,
  primary key (codigolibro,fechaprestamo)
);
insert into socios values('22333444','Juan Perez','Colon 345');
insert into socios values('23333444','Luis Lopez','Caseros 940');
insert into socios values('25333444','Ana Herrero','Sucre 120');

insert into libros values(1,'Manual de 2º grado','Molina Manuel');
insert into libros values(25,'Aprenda PHP','Oscar Mendez');
insert into libros values(42,'Martin Fierro','Jose Hernandez');

insert into prestamos values('22333444',1,'2006-08-10','2006-08-12');
insert into prestamos values('22333444',1,'2006-08-15',null);
insert into prestamos values('25333444',25,'2006-08-10','2006-08-13');
insert into prestamos values('25333444',42,'2006-08-10',null);
insert into prestamos values('25333444',25,'2006-08-15',null);
insert into prestamos values('30333444',42,'2006-08-02','2006-08-05');
insert into prestamos values('25333444',2,'2006-08-02','2006-08-05');
 select*from prestamos;
-- Usanso la base de datos Libros responder la siguientes consultas.

-- 1- Que libros (codigo,titulo,autor) se le prestaron a cada socio.
select distinct s.documento,s.nombre,l.codigo,l.titulo,l.autor from socios s
join prestamos p on s.documento=p.documento
join  libros l on p.codigoLibro=l.codigo;

-- 2- Lista de socios (documento,nombre,domicilio) que se le presto libros de 'java' (like '%java%')
insert into socios values 
('22252568',' juan Garcia','Colon 123');
insert into libros values 
('44','Aprenda java','Mario Dominguez');
insert into prestamos values
('22252568',44,curdate(),null);


select s.documento,s.nombre,s.domicilio from socios s 
join prestamos p on s.documento=p.documento
join libros l on p.codigoLibro=l.codigo
where l.titulo like '%java%';  
-- 3- Lista de libros (codigo,titulo,autor) que no fueron devueltos (fechadevolucion is null)
select l.codigo,l.titulo,l.autor from libros l
join prestamos p on l.codigo=p.codigoLibro
where p.fechadevolucion is null;
-- 4- Lista de socios (documento,nombre,domicilio) que tienen libros sin devolver.
select distinct s.nombre,s.documento,s.domicilio from socios s 
join prestamos p on s.documento=p.documento
where p.fechadevolucion is null;
-- 5- Lista de socios (documento,nombre,domicilio) que tienen libros sin devolver y cuales son los libros.
select  s.nombre,s.documento,s.domicilio, count(p.codigoLibro)
cantidad_libro_sin_devolver,group_concat(concat(l.codigo,':',l.titulo,'(',l.autor,')')) libros
from socios s join prestamos p on s.documento=p.documento
join libros l on p.codigoLibro=l.codigo
where p.fechadevolucion is null 
group by s.documento,s.nombre,s.domicilio;

select s.documento,s.nombre,s.domicilio,l.titulo,l.autor,l.autor
from socios s 
join prestamos p on s.documento=p.documento
join libros l on l.codigo=p.codigoLibro
where fechadevolucion is null;

-- 6- Cantidad de libros sin devolver.
select count(distinct codigoLibro) cantidad_libros_sin_devolver
from prestamos p
where fechadevolucion is null;


select distinct s.documento,s.nombre,l.codigo,l.titulo,
count(*) cantidad_libros_sin_devolver
from socios s join prestamos p on s.documento=p.documento
join libros l on l.codigo=p.codigoLibro
where fechadevolucion is null
group by s.nombre,l.codigo;

 
  

-- 7- Lista de libros que fueron prestados el día de hoy.
select l.codigo,l.titulo,l.autor from libros l
join prestamos p on l.codigo=p.codigoLibro
where p.fechaprestamo=curdate(); 
-- 8- Cantidad de libros que se prestaron en este mes.
select count(*) cantidad_libros_prestados from prestamos
where month(fechaprestamo)=month(curdate())and
year(fechaprestamo)=year(curdate());  -- le coloco el mes y el año para ser mas especifico
-- 9- Cantidad de socion que se le prestaron librs en este mes..
select s.nombre,count(*) cantidad_de_socios
from socios s 
join prestamos p on s.documento=p.documento
where month (fechaprestamo)=month(curdate()) and 
year (fechaprestamo)=year(curdate())
group by s.nombre;

drop database if exists reserva_v;
create database reserva_v;
use reserva_v;


create table habitaciones(
 habitacion_numero int primary key not null,
 precio_por_noche decimal(8,2) not null,
 piso int not null,
 max_personas TINYINT NOT NULL,
 tiene_cama_bebe TINYINT NOT NULL,
 tiene_ducha TINYINT NOT NULL,
 tiene_baño TINYINT NOT NULL,
 tiene_balcon TINYINT NOT NULL

);

create table Huespedes(
huesped_id int primary key not null,
nombres varchar(45) not null,
apellidos varchar(45) not null,
telefono double not null,
correo varchar(45) not null,
direccion varchar(45) not null,
ciudad varchar(45) not null,
pais varchar(45) not null
);


create table Reservas (
 reservas_id int primary key not null,
 inicio_fecha datetime not null,
 fin_fecha datetime NOT NULL,
 tiene_cama_bebe TINYINT NOT NULL,
 habitacion int NOT NULL,
 huesped int NOT NULL

  
);

alter table reservas
add constraint
FK_reservas_habitaciones
foreign key(habitacion)
references habitaciones(habitacion_numero)
on delete cascade ; -- si hago una modificacion la hara en las otras tablas

alter table reservas
add constraint
FK_reservas_huespedes
foreign key(huesped)
references huespedes(huesped_id)
on delete cascade;

insert into habitaciones values
(1,20000,1,3,0,1,1,1),
(2,25000,1,3,0,1,1,1),
(3,28000,1,3,0,1,1,1),
(4,32000,2,4,0,1,1,1),
(5,25000,2,4,0,1,1,1),
(6,32000,2,4,0,1,1,1);

insert into huespedes values
(1,'Lorena','Martinez','1111111','lorem@gmail.com','castillo 123','caba','argentina'),
(2,'Pablo','Gomez','2222222','pablog@gmail.com','san luis 456','caba','argentina'),
(3,'Paula','Perez','3333333','paulap@gmail.com','mendoza 789','caba','argentina'),
(4,'Mariano','Alonso','4444444','marianoa@gmail.com','Cordoba 369','caba','argentina');

insert into reservas values
(1,curtime(),'2024/11/10',1,1),
(2,curtime(),'2024/11/08',2,2),
(3,curtime(),'2024/11/04',3,3),
(4,curtime(),'2024/11/06',4,4),
(5,'2024/11/02','2024/11/07',5,3),
(6,'2024/11/03','2024/11/10',6,4);