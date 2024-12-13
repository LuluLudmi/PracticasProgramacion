-- ---------------------------------
-- Curso Base de Datos con MySQL
-- Trayecto Formativo Programador
-- ---------------------------------

-- comentarios
-- es necesario que haya un espacio libre después los guiones

/*
bloque
de 
comentarios
*/

# también es para comentarios, pero no es ANSI
# significa, que solo sirve para MySQL

-- SQL: Structure Query Languaje (lenguaje de consulta estructurada)

/*
DDL: Data Definition Language (Lenguaje de definición de datos)
- CREATE
- ALTER
- DROP
*/

/*
DML: Data Manipulation Language (Lenguaje de manipulación de datos)
- SELECT
- INSERT
- DELETE
- UPDATE
*/

-- -----------------------------------------
-- Tipos de datos más comunes en MySQL
-- -----------------------------------------

/*
Tipos de datos de texto más utilizados
CHAR -> este tipo de dato lo utilizamos cuando sabemos de antemano
cuántos carecteres se guardarán.
Si declaramos un tipo de dato CHAR de 20 posiciones
Ej. nombre CHAR(20)
siempre va a estar utilizando 20 bytes para guardar el dato
|--------------------| -> 20 bytes
|maximiliano---------| -> 20 bytes
|carlos--------------| -> 20 bytes
|ana-----------------| -> 20 bytes

VARCHAR -> este tipo de dato lo utilizamos cuando no sabemos de antemano
la longitud del dato que se va a ingresar
Ej. nombre VARCHAR(20)
|--------------------| -> 20 bytes
|maximiliano---------| -> 11 + 1 bytes
|carlos--------------| -> 6 + 1 bytes
|ana-----------------| -> 3 + 1 bytes
*/

/*
Tipos de datos numéricos

BIT o BOOL
representa un número entero que a su vez representa un valor de verdad.
Sirve para almacenar valores lógicos. El 0 representa el valor falso,
y cualquier otro número representa el valor de verdad.

TINYINT almacena 1 byte
|--------|--------|
-128     0        127

TINYINT unsigned
|-----------------|
0				  255

SMALLINT 
|--------|--------|
-32.768  0	    32.767

SMALLINT unsigned
|-----------------|
0				 65.535

INT (32 bits)
|--------|--------|
-2.147.483.648   2.147.483.647

INT unsigned
|--------|--------|
0			4.294.967.295

BIGINT es el valor más grande, son 64 bits.

FLOAT (son decimales de 32 bits)
almacena hasta 8 dígitos
Por ejemplo, si quisiera hacer
10/3
3.333333 (el punto se cuenta como un dígito)
si hiciera
100/3
33.33333 (se desplazó el punto, por eso decimos que es de punto flotante)
se achica la posición decimal.

DOUBLE (son decimales de 64 bits)
almacena 17 dígitos (esto puede variar según distintos factores)

DECIMAL
representa números decimales de precisión fija, es una precisión exacta.
la estructura es 
DECIMAL(n,m)
en donde n es la cantidad de dígitos que tendrá el número en total
y m es la cantidad de dígitos que se utilizarán para representar los decimales
Ej. 
DECIMAL(10,2)
xxxxxxxx.xx (el punto no se considera un dígito en este caso)
en esta estructura, el mayor número que puedo almacenar
99999999.99 
*/

/*
Tipos de datos de fecha y hora

DATE
ocupa 3 bytes y almacena una fecha (por defecto es YYYY-MM-DD)
ej: 2024-08-13

DATETIME
ocupa 8 bytes y almacena la fecha y la hora
(el formato es YYYY-MM-DD HH:MM:SS)

TIME
ocupa 3 bytes y almacena la hora
(formato HH:MM:SS)

YEAR (no es un standard)
ocupa 1 solo byte y almacena valores de años. Puede ser con 2 o 4 dígitos.
*/

-- --------------------------
-- Comando SELECT
-- --------------------------

-- el comando SELECT sirve para traer registros de una tabla,
-- pero también lo podemos utilizar para imprimir mensajes en la consola
-- como por ejemplo:
SELECT 'Hola Mundo!';
-- también puedo hacer cálculos matemáticos
-- como por ejemplo:
select 2 + 2;
-- se pueden agregar alias a las consultas select
select 2 + 2 as 'suma';
-- ya no es necesario el uso del as ni de las comillas
select 2 + 2 suma;
-- no podemos escribir con espacios sin comillas
select 2 + 2 'resultado de la suma';
select 2 + 2 resultado_de_la_suma;
-- para resolver el tema de los espacios podemos encerrar todo el texto
-- entre comillas o escribir todo junto con el estilo de escritura
-- snake_case












