-- Crear la base de datos Laboratorio_06_v, si ya existe borrarla.
drop database if exists LABORATORIO_06_V;
create database LABORATORIO_06_V;
use LABORATORIO_06_V;

-- Crear la siguiente tabla.
create table cursos(
	codigo int,
	nombre varchar(20),
	dias varchar(10),
	inscriptos int,
	primary key(codigo)
);
SHOW TABLES;
DESCRIBE cursos;


insert into cursos(codigo,nombre,dias,inscriptos) values
	(1,'PHP','lunes',10),
	(2,'Java','lunes',5),
	(3,'Corel Draw','martes',2),
	(4,'Java','martes',5),
	(5,'MySQL','martes',5),
	(6,'Oracle','miercoles',6),
	(7,'C#.net','jueves',5),
	(8,'C#.net','viernes',4),
	(9,'PHP','lunes',10),
	(10,'C#.net','lunes',5),
	(11,'Corel Draw','martes',2),
	(12,'Oracle','martes',5),
	(13,'PHP','martes',5),
	(14,'Oracle','miercoles',6),
	(15,'C#.net','jueves',5),
	(16,'Java','viernes',4);
    
    
select*from cursos;
set sql_safe_updates=0;
-- Según la tabla cursos
-- 1 - Sumar en uno la cantidad de alumnos inscriptos del curso Java de los días Lunes
update cursos set inscriptos=inscriptos+1
where nombre='java' and dias='lunes';


-- 2 - Poner en 0 la cantidad de alumnos inscriptos de los cursos de los días Martes
update cursos set inscriptos= 0
where dias='martes';
-- 3 - Borrar los cursos de Java en día Martes
delete from cursos where nombre='java' and dias='martes';
-- 4 - Sumar 5 inscriptos en los cursos que tengan menos de 5 alumnos inscriptos.
update cursos set inscriptos=inscriptos+5
where inscriptos<5;
select*from cursos;
-- 5 - Cambiar el nombre de los cursos Java por Java 2 SE.
update cursos set nombre='java 2 SE'
where nombre='java';


-- Ejercicio 2-- Crear la siguiente tabla.


create table empleados(
	codigo int auto_increment,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	seccion enum('administracion','ventas','produccion','deposito'),
	sueldo float,
	primary key (codigo)
);
show tables;


insert into empleados (nombre,apellido,seccion,sueldo) values
	('juan','perez','administracion',72000),
	('diego','torres','ventas',35200),
	('laura','gomez','ventas',46000),
	('mario','lopez','produccion',45000),
	('dario','sanchez','administracion',86000),
	('juan','boneli','administracion',72000),
	('diego','martinez','ventas',35200),
	('laura','moretti','ventas',46000),
	('sandra','lazante','produccion',45000),
	('susana','mendez','administracion',86000);
    select*from empleados;
    set sql_safe_updates=0;

-- 1 Cambiar al empleado Mario Lopes de la sección  producción a administración 
update empleados set seccion='administracion'
where nombre='mario' and apellido='lopez';

-- 2 Aplicar un aumento de sueldo básico del 15% a los empleados de ventas.
update empleados set sueldo=sueldo*1.15
where seccion='ventas';

-- 3 Aplicar un aumento del 8% a todos los empleados de producción que tengan un
-- 		sueldo básico menor a 6000 pesos.
update empleados set sueldo=sueldo-1.08
where seccion= 'produccion' and sueldo<50000;
-- 4 Dar de baja al empleado Susana Méndez.
delete from empleados 
where codigo=10;
-- 5 Aplicar un aumento de sueldo del 4% a todos los empleados que tengan un 
-- 		básico mayor o igual a 50000 pesos.
update empleados set sueldo=sueldo*1.04
where sueldo>=50000;

-- 6 Aplicar un aumento de sueldo del 8% a todos los empleados que tengan un 
-- 		básico menor a 50000 pesos.
update empleados set sueldo=sueldo*1.08
where sueldo<50000;
-- 7 Agregar el campo fecha de nacimiento (date) en la tabla empleados despues del campo apellido.
alter table empleados add fenaci date after apellido;
select*from empleados;

-- 8 Completar una fecha de nacimiento para cada empleado.
update empleados set fenaci='1985/04/06'
where codigo=1;
update empleados set fenaci='1990/10/05'
where codigo=2;
update empleados set fenaci='2002/07/16'
where codigo=3;
update empleados set fenaci='1985/04/07'
where codigo=4;
update empleados set fenaci='1996/04/06'
where codigo=5;
update empleados set fenaci='1995/04/06'
where codigo=6;
update empleados set fenaci='2001/09/16'
where codigo=7;
update empleados set fenaci='1987/05/12'
where codigo=8;
update empleados set fenaci='1997/11/26'
where codigo=9;


-- 9 Listar todos los campos de empleados + una columna que calcule la edad de cada empleado.
select nombre, apellido,round(datediff(curdate(),fenaci)/365.25,0) edad  -- datediff me permite saber la diferencia entre dos fechas
from empleados; -- curdate es la fecha de hoy 

