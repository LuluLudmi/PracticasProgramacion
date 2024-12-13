
-- Tp 3
drop database if exists ferreteria_v; 
create database ferreteria_v;
use ferreteria_v;
create table PIEZAS (
    codigo int primary key,
    nombre varchar(100) not null
 );
 
 
create table SUMINISTRA(
    CodigoPieza int,
	IdProveedor char(4),
    Precio int,
    primary key(CodigoPieza,IdProveedor)
);

create table PROVEEDORES(
    Id char(4) primary key ,
	Nombre varchar(100) 
);
INSERT INTO Piezas (codigo, nombre) VALUES
(1, 'tuercas'),
(2, 'tornillos'),
(3, 'arandelas'),
(4, 'clavos');
 
 INSERT INTO Piezas (codigo, nombre) VALUES
 (5,'lija');


INSERT INTO Proveedores (id, nombre) VALUES
('HAL', 'HAL Corp.'),
('RBT', 'Susan Calvin Corp.');

INSERT INTO Suministra VALUES
(1, 'HAL', 10),
(2, 'HAL', 15),
(3, 'RBT', 20),
(4, 'RBT', 25);

show tables;
alter table SUMINISTRA
add constraint fk_codigo_pieza
foreign key (CodigoPieza) references PIEZAS(codigo);
-- 1.Seleccionar todas las piezas con sus respectivos proveedores y precios
select PIEZAS.nombre as nombre_pieza, PROVEEDORES.Nombre as nombre_proveedor, SUMINISTRA.Precio
from SUMINISTRA
join PIEZAS on SUMINISTRA.CodigoPieza = PIEZAS.codigo
join PROVEEDORES on SUMINISTRA.IdProveedor = PROVEEDORES.Id
order by PIEZAS.nombre;

-- 2 Consultar todos los proveedores que suministran una pieza específica

select  P.nombre as nombre_pieza, PROVEEDORES.Nombre as nombre_proveedor   
from SUMINISTRA S
join  PIEZAS P on S.CodigoPieza = P.codigo
join PROVEEDORES PROVEEDORES on S.IdProveedor = PROVEEDORES.Id
where P.nombre;
-- 3. Ver el precio más bajo para cada pieza
select PIEZAS.nombre as nombre_pieza, min(SUMINISTRA.Precio) as precio_minimo
from SUMINISTRA
join PIEZAS on SUMINISTRA.CodigoPieza = PIEZAS.codigo
group by PIEZAS.nombre
order by PIEZAS.nombre;
-- 4. Consultar los proveedores que tienen un precio mayor que un valor específico
select PROVEEDORES.Nombre as nombre_proveedor,SUMINISTRA.Precio
from SUMINISTRA
join PROVEEDORES on SUMINISTRA.IdProveedor= PROVEEDORES.Id
where SUMINISTRA.Precio >18
order by SUMINISTRA.Precio desc;
-- 5. Obtener las piezas que no están siendo suministradas por ningún proveedor
SELECT PIEZAS.nombre
FROM PIEZAS
LEFT JOIN SUMINISTRA ON PIEZAS.codigo = SUMINISTRA.CodigoPieza
WHERE SUMINISTRA.CodigoPieza IS NULL; -- Agregue una pieza nueva para que me salta en la tabla una que no es suministrada por ningun proveedor
-- 6. Contar cuántos proveedores suministran cada pieza
SELECT PIEZAS.nombre, COUNT(SUMINISTRA.IdProveedor) AS num_proveedores
FROM PIEZAS
LEFT JOIN SUMINISTRA ON PIEZAS.codigo = SUMINISTRA.CodigoPieza
GROUP BY PIEZAS.nombre;

-- 7. Obtener los proveedores con más piezas suministradas
SELECT PROVEEDORES.Nombre, COUNT(SUMINISTRA.CodigoPieza) AS num_piezas
FROM PROVEEDORES
JOIN SUMINISTRA ON PROVEEDORES.Id = SUMINISTRA.IdProveedor
GROUP BY PROVEEDORES.Nombre
ORDER BY num_piezas DESC;

-- 8. Actualizar el precio de una pieza específica de un proveedor
UPDATE SUMINISTRA
SET Precio = 7
WHERE CodigoPieza = 1 AND IdProveedor = 'HAL';

-- 9. Eliminar una pieza y sus registros relacionados
DELETE FROM SUMINISTRA
WHERE CodigoPieza = 1;

DELETE FROM PIEZAS
WHERE codigo = 1;

-- 10. Hacer constar en la base de datos que la empresa ”Skellington Supplies”(código TNBC) va a empezar a suministrarnos tuercas (código 1) a 7 dolares cada tuerca.
INSERT INTO PROVEEDORES (Id, Nombre) VALUES ('TNBC', 'Skellington Supplies');

INSERT INTO SUMINISTRA (CodigoPieza, IdProveedor, Precio) VALUES (1, 'TNBC', 7);





