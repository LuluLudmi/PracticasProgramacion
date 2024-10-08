

drop database if exists articulos_v; -- Esto se utiliza en caso que la tabla exista
create database articulos_v;
use articulos_v;

CREATE TABLE articulos (
  codigo int(10) unsigned NOT NULL,
  descripcion varchar(50) NOT NULL,
  nombre varchar(45) NOT NULL,
  precio float NOT NULL,
  stock int(10) unsigned NOT NULL,
  marca varchar(45) NOT NULL
);
show tables;
describe articulos;

INSERT INTO articulos (codigo,descripcion,nombre,precio,stock,marca) VALUES
(1,'Televisores','TV LCD 19\" MODELO PFL3403',2199,40,'PHILIPS'),
(2,'Televisores','TV LCD22\" MODELO LN22A450',2399,30,'SAMSUNG'),
(3,'Televisores','TV LCD 32\" MODELO LC813H ',2999,25,'NOBLEX'),
(4,'Televisores','TV LCD 26\" MODELO 26LG30R',2999,25,'LG'),
(5,'Televisores','TV LCD 26\" MODELO CDH-L26S02',3099,20,'HITACHI'),
(6,'Televisores','TV LCD 32\" MODELO PL3219 ',3399,20,'PHILCO'),
(7,'Computadoras','CPU LE1250DVD2GB160VS',2199,15,'ADMIRAL'),
(8,'Computadoras','CPU A64X246DV2G160VBOF ',2499,8,'ADMIRAL'),
(9,'Computadoras','CPU E5200DVDR2GB320VB ',2699,5,'ADMIRAL'),
(10,'Computadoras','CPU SG3308LA ',3099,5,'COMPAQ PRESARIO'),
(11,'Impresoras','IMPRESORA T23 ',219,18,'EPSON'),
(12,'Impresoras','IMPRESORA DJ-6940 ',349,20,'HEWLETT PACKARD'),
(13,'Impresoras','IMPRESORA T33',399,12,'EPSON'),
(14,'Impresoras','IMPRESORA K5400  ',499,8,'HEWLETT PACKARD'),
(15,'Home Theater','HOME CINEMA SPH70 ',319,0,'PHILCO'),
(16,'Home Theater','HOME CINEMA AMX115 ',419,0,'NOBLEX'),
(17,'Home Theater','HOME CINEMA HT E 860 ',599,0,'X-VIEW'),
(18,'Home Theater','HOME CINEMA DC-T990 ',759,5,'SANYO'),
(19,'Home Theater','HOME CINEMA HT-1105U',829,18,'NOBLEX'),
(20,'Home Theater','HOME CINEMA HT304SL-A2 ',949,6,'LG'),
(21,'Home Theater','HOME CINEMA HT-Z110 ',999,22,'SAMSUNG'),
(22,'Home Theater','HOME CINEMA HTS3011/55',1099,18,'PHILIPS'),
(23,'Home Theater','HOME CINEMA HT503SH',1299,15,'LG'),
(24,'Home Theater','HOME CINEMA HT503SH-AM',1299,12,'LG'),
(25,'Home Theater','HOME CINEMA HT-IS10',1499,7,'SONY'),
(26,'Home Theater','HOME CINEMA HTS3365/55',1599,5,'PHILIPS'),
(27,'Radio','RADIO PORT RP 299  ',49,5,'NOBLEX'),
(28,'Radio','RADIO DX-365',79,15,'KEN BROWN'),
(29,'Radio','RADIO ICF-S10MK2/SCE',79,15,'SONY'),
(30,'Radio','RADIO ICF-18  ',99,15,'SONY'),
(31,'Radio','RADIO ICF-303/304 AM-FM ',129,8,'SONY'),
(32,'Radio','RADIO SRF-59/SC E ',129,10,'SONY'),
(33,'Notebooks','NOTEBOOK C2D2VB250WC14',3699,12,'ADMIRAL'),
(34,'Notebooks','NOTEBOOK CQ40-300',2999,9,'COMPAQ PRESARIO'),
(35,'Notebooks','NOTEBOOK DV2-1010',3999,7,'HEWLETT PACKARD'),
(36,'Notebooks','NOTEBOOK DV4-1212',4199,9,'HEWLETT PACKARD'),
(37,'Notebooks','NOTEBOOK DV4-1212',4199,10,'HEWLETT PACKARD'),
(38,'Telefonos','TELEFONO DECT1221S INALAMBRICO',169,15,'PHILIPS'),
(39,'Telefonos','TELEFONO CD1401B INALAMBRICO',169,8,'PHILIPS'),
(40,'Telefonos','TELEFONO CD2401S INALAMBRICO',239,8,'PHILIPS'),
(41,'Telefonos','TELEFONO CD1302S INALAMBRICO',249,8,'PHILIPS'),
(42,'Telefonos','TELEFONO SANYO HNS-3300 ',69,10,'SANYO'),
(43,'Lavarropas','LAVARROPA GAFA 7000 DIG PROGR 7KG',1679,7,'GAFA'),
(44,'Lavarropas','LAVARROPA GAFA 7500 T750 7,5K ',1839,4,'GAFA'),
(45,'Lavarropas','LAVARROPA GAFA ACQ7500 GRAFT750 7,5K ',1939,12,'GAFA'),
(46,'Lavarropas','LAVARROPA LG WF-T1202TP 12KG C/S',2449,10,'LG'),
(47,'Lavarropas','LAVARROPA LG WF-T1205TP 12K TITANIUM',2499,10,'LG'),
(48,'Camaras digitales','CAMARA DIGITAL KODAK C813',549,10,'KODAK'),
(49,'Camaras digitales','CAMARA DIGITAL VPCS-870EX ',579,15,'SANYO'),
(50,'Camaras digitales','CAMARA DIGITAL C913',599,15,'KODAK'),
(51,'Camaras digitales','CAMARA DIGITAL 760+KIT',649,15,'SAMSUNG'),
(52,'Camaras digitales','CAMARA DIGITAL ES10',749,20,'SAMSUNG'),
(53,'Camaras digitales','CAMARA DIGITAL ES15 ',799,40,'SAMSUNG'),
(54,'Video camaras','CAMARA VIDEO DCR-DVD650',2749,15,'SONY'),
(55,'Video camaras','CAMARA VIDEO DCR-DVD810 ',2999,10,'SONY'),
(56,'Estufas','CALEFACTOR TB 2400 GN',459,12,'SIGMA'),
(57,'Estufas','CALEFACTOR TB 3000 GN',699,12,'SIGMA'),
(58,'Estufas','CALEFACTOR TB 5000 GN',1999,15,'SIGMA'),
(59,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C096EMAO 2200FS',1999,15,'LG'),
(60,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C096EMAO 2200FS ',1999,10,'LG'),
(61,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C126EMAO 3000FS',2249,10,'LG'),
(62,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C1865DLO 4500FS',3049,20,'LG'),
(63,'Aire acondicionado','AIRE ACONDICIONADOR SP LS-C1863RMO 4500FS',3349,20,'LG'),
(64,'Aire acondicionado','AIRE ACONDICIONADOR SP WSX09CG5R 2500WFS',1599,15,'WESTINGHOUSE');
select*from articulos;
-- Usando la base de datos articulos.
-- 1 Informar cantidad de televisores.
-- contar cuantos autos hay de cada marca.
select descripcion,count(*) cantidad_televisores from articulos 
where descripcion='televisores';

-- 2- Informar cantidad de televisores segun marca.
select descripcion,marca,count(*) cantidad_televisores from articulos 
where descripcion='televisores'
group by marca;
-- 3- Informar cual es el televisor más barato.
select descripcion_televisores from articulos
where precio=(select min(precio) precio_minimo
from articulos);

-- 4- Aumentar un 15% los articulos de la marca 'LG'.
-- 5- Bajar un 4% los aires acondicionados.
-- 6- Listar los articulos ordenaros por marca,descripción,nombre,precio.
-- 7- Cantidad de articulos según marca y descripción.
-- 8- Mostrar el producto mas caro de la marca 'LG'