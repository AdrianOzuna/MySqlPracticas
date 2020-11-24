create database practica2;
use practica2;

/*
ATENCION: Variable SQL_SAFE_UPDATES se ha desactivado mediante MySql workbench
*/

#Ejercico 1

/*Problema 1: Un comercio que vende articulos de computacion registro los datos de sus articulos en
una tabla con ese nombre.*/

/*Elimine la tabla articulos si existe.*/
drop table if exists articulos;

/*
 Cree la tabla, con la siguiente estructura: 
 codigo integer, 
 nombre varchar(20), 
 descripcion varchar(30) 
 precio float, 
 cantidad integer
*/
create table articulos(
	codigo integer,
    nombre varchar(20),
    descripcion varchar(30),
    precio float,
    cantidad integer
);

/*Vea la estructura de la tabla.*/
describe articulos;

/*
 Ingrese los siguientes datos:
 Epson Stylus C45',400.80,20
 Epson Stylus C85',500,30
 Samsung 14',800,10
 4,'teclado','ingles Biswal',100,50
 5,'teclado','espaÃ±ol Biswal',90,50
*/
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','espaÃ±ol Biswal',90,50);

/*Seleccione todos los registros de la tabla.*/
select * from articulos;

/*Muestre todos los datos de las impresoras.*/
select * from articulos where nombre='impresora';

/*Seleccione los registros cuyo precio sea mayor o igual a 500.*/
select * from articulos where precio>=500;

/*Seleccione los registros cuyo precio sea menor a 30.*/
select * from articulos where precio<30;

/*Seleccione el nombre y descripcion de los articulos que no cuesten $100.*/
select nombre, descripcion from articulos where precio<>100;

/*Problema 2 (A):
 Un video club que alquila peliculas en video almacena la informacion de sus peliculas en alquiler en una tabla
 denominada "peliculas".
*/

/*Elimine la tabla peliculas, si existe.*/
drop table if exists peliculas;

/*Cree la tabla eligiendo un dato adecuado para cada campo: titulo, actor, duracion, cantidad.*/
create table peliculas(
	titulo varchar(20),
    actor varchar(20),
    duracion float,
    cantidad integer
);

/*Vea la estructura de la tabla.*/
describe peliculas;

/*
 Inserte los siguientes registros:
 'Mision imposible','Tom Cruise',120,3
 'Mision imposible 2', 'Tom Cruise', 180,2
 'Mujer bonita','Julia R.',90,3
 'Elsa y Fred','China Zorrilla',90,2
*/
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',120,3);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',180,2);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia R.',90,3);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',90,2);

/*Seleccione las peliculas cuya duracion no supere los 90 minutos.*/
select * from peliculas where duracion<=90;

/*Seleccione todas las peliculas en las que el actor no se Tom Cruise.*/
select * from peliculas where actor<>'Tom Cruise';

/*Seleccione las peliculas en las que haya mas de dos copias.*/
select * from peliculas where cantidad>2;

/*Problema 2 (B)
 Trabaje con la tabla "agenda" en la que se registra los datos de sus amigos.
*/

/*Elimine la tabla agenda, si existe.*/
drop table if exists agenda;

/*
 Cree la tabla agenda con los siguientes campos: 
 apellido varchar(30), 
 nombre varchar(20),
 domicilio varchar(30), 
 telefono varchar(11)
*/
create table agenda(
	apellido varchar(30),
    nombre varchar(20),
    domicilio varchar(30),
    telefono varchar(11)
);

/*Visualice la estructura de la tabla agenda.*/
describe agenda;

/*
 Ingrese los siguientes datos:
 Mores,Alberto,Colon 123,4234567,
 Torres,Juan,Avellaneda 135,4458787,
 Lopez,Mariana,Urquiza 333,4545454,
 Lopez,Fernando,Urquiza 333,4545454.
 Suarez,Mariana,Sarmiento 643,4445544.
 Lopez,Ana,Sucre 309,4252587.
*/
insert into agenda (apellido, nombre, domicilio, telefono) 
	values ('Mores','Alberto','Colon 123','4234567');
insert into agenda (apellido, nombre, domicilio, telefono)
    values ('Torres','Juan','Avellaneda 135','4458787');
insert into agenda (apellido, nombre, domicilio, telefono)
    values ('Lopez', 'Mariana','Urquiza 333','4545454');
insert into agenda (apellido, nombre, domicilio, telefono)
    values ('Lopez','Fernado','Urquiza 333','4545454');
insert into agenda (apellido, nombre, domicilio, telefono)
    values ('Suarez','Mariana','Sarmiento 643','4445544');
insert into agenda (apellido, nombre, domicilio, telefono)
    values ('Lopez','Ana','Sucre 309','4252587');
    
/*Seleccione todos los registros de la tabla.*/
select * from agenda;

/*Seleccione los amigos cuyo apellido sea Lopez.*/
select * from agenda where apellido='Lopez';

/*Seleccione los registros cuyo nombre no sea Mariana.*/
select * from agenda where nombre<>'Mariana';

/*Seleccione los registros cuyo domicilio sea Colon 123.*/
select * from agenda where domicilio='Colon 123';

/*Muestre todos los datos de quienes tengan el telefono 4545454.*/
select * from agenda where telefono='454545';

#Ejercicio 2

/*Problema 1:
 Trabaje con la tabla "agenda" que registra la informacion referente a sus amigos.
*/

/*Elimine la tabla agenda, si existe.*/
drop table if exists agenda;

/*Cree la tabla agenda con los siguientes campos:
  apellido(cadena de 30),
  nombre(cadena de 20),
  domicilio(varchar 30),
  telefono(cadena de 11)
*/
create table agenda(
	apellido varchar(30),
    nombre varchar(20),
    domicilio varchar(20),
    telefono varchar(11)
);

/*Visualice la estructura de la tabla agenda.*/
describe agenda;

/*Ingrese los siguientes registros:
  Mores,Alberto,Colon 123,4234567,
  Torres,Juan,Avellaneda 135,4458787,
  Lopez,Mariana,Urquiza 333,4545454,
  Lopez,Jose,Urquiza 333,4545454,
  Peralta,Susana,Gral. Paz 1234,4123456.
*/
insert into agenda (apellido, nombre, domicilio, telefono) 
	values ('Mores','Alberto','Colon 123','4234567');
insert into agenda (apellido, nombre, domicilio, telefono) 
	values ('Torres','Juan','Avellaneda 135','4458787');
insert into agenda (apellido, nombre, domicilio, telefono) 
	values ('Lopez','Mariana','Urquiza 333','4545454');
insert into agenda (apellido, nombre, domicilio, telefono) 
	values ('Lopez','Jose','Urquiza 333','4545454');
insert into agenda (apellido, nombre, domicilio, telefono) 
	values ('Peralta','Susana','Gral. Paz 1234','4123456');

/*Elimine el registro cuyo nombre sea 'Juan'.*/
delete from agenda where nombre='Juan';

/*Elimine los registros cuyo numero telefonico sea igual a '4545454'.*/
delete from agenda where telefono='4545454';

/*Problema 2 (A):
 Trabaje con la tabla "libros" en la cual almacena la informacion de sus libros una libreria.
*/

/*Elimine la tabla libros.*/
drop table if exists libros;

/*
 Cree la tabla con los siguientes campos: 
 titulo varchar(20), 
 autor varchar(30), 
 editorial varchar(15), 
 precio float
*/
create table libros (
	titulo varchar(23),
    autor varchar(30),
    editorial varchar(15),
    precio float
);

/*Visualice la estructura de la tabla libros.*/
describe libros;

/*
 Ingrese los siguientes datos:
 El aleph,Borges,Planeta,15.00;
 Martin Fierro,Jose Hernandez,Emece,25.50;
 Aprenda PHP,Mario Molina,Emece,26.80;
 Cervantes y el quijote,Borges,Paidos,45.50;
 Matematica estas ahi, Paenza, Paidos,50.00;
*/
insert into libros (titulo, autor, editorial, precio) 
	values ('El aleph','Borges','Planeta', 15.00);
insert into libros (titulo, autor, editorial, precio) 
	values ('Martin Fierro','Jose Hernandez','Emece', 25.50);
insert into libros (titulo, autor, editorial, precio) 
	values ('Aprenda PHP','Mario Molina','Emece', 26.80);
insert into libros (titulo, autor, editorial, precio) 
	values ('Cervantes y el quijote','Borges','Paidos',45.50);
insert into libros (titulo, autor, editorial, precio) 
	values ('Matematica estas ahi','Paenza','Paidos', 50.00);
    
/*Muestre todos los registros.*/
select * from libros;

/*Elimine los registros cuyo autor sea Paenza.*/
delete from libros where autor='Paenza';

/*Nuevamente elimine todos los registros cuyo autor sea Paenza.*/
delete from libros where autor='Paenza';

/*Borre todos los registros cuyo precio sea precio sea menor a 20.*/
delete from libros where precio<20;

/*Borre todos los registros cuyo precio sea mayor o igual a 40 pesos.*/
delete from libros where precio>=40;

/*Elimine todos los registros de la tabla.*/
delete from libros;

/*Problema 2 (B):
 Un comercio que vende articulos de computacion registra los datos de sus articulos en
 una tabla con ese nombre.
*/

/*Elimine articulos, si existe.*/
drop table if exists articulos;

/*
 Cree la tabla articulos con la siguiente estructura: 
 codigo integer, 
 nombre varchar(20)
 descripcion varchar(30), 
 cantidad integer
*/
create table articulos (
	codigo integer,
    nombre varchar(20),
    descripcion varchar(30),
    precio float,
    cantidad integer
);

/*Visualice la estructura de la tabla articulos.*/
describe articulos;

/*
 Inserte los siguientes datos:
 1,'impresora','Epson Stylus C45',400.80,20
 2,'impresora','Epson Stylus C85',500,30
 3,'monitor','Samsung 14',800,10
 4,'teclado','ingles Biswal',100,50
 5,'teclado','espaÃ±ol Biswal',90,50
*/
insert into articulos (codigo, nombre, descripcion, precio, cantidad)
    values (1,'impresora','Epson Stylus C45',400.80,20);
insert into articulos (codigo, nombre, descripcion, precio, cantidad)
	values (2,'impresora','Epson Stylus C85',500,30);
insert into articulos (codigo, nombre, descripcion, precio, cantidad)
	values (3,'monitor','Samsung 14',800,10);
insert into articulos (codigo, nombre, descripcion, precio, cantidad)
	values (4,'teclado','ingles Biswal',100,50);
insert into articulos (codigo, nombre, descripcion, precio, cantidad)
	values (5,'teclado','espaÃ±ol Biswal',90,50);

/*Seleccione todos los registros de la tabla.*/
select * from agenda;

/*Elimine todos los articulos cuyo precio sea mayor o igual a 500.*/
delete from articulos where precio>=500;

/*Elimine todas las impresoras.*/
delete from articulos where nombre='impresoras';

/*Elimine todos los articulos cuyo codigo sea diferente a 4.*/
delete from articulos where codigo<>4;

#Ejercio 3

/*Problema 1:
 Trabaje con la tabla "agenda" que almacena los datos de sus amigos.
*/

/*Elimine la tabla agenda, si existe.*/
drop table if exists agenda;

/*Cree la tabla agenda con la siguiente estructura: 
 apellido varchar(30), 
 nombre varchar(20), 
 domicilio varchar(20), 
*/
create table agenda (
	apellido varchar(30),
    nombre varchar(20),
    domicilio varchar(30),
    telefono varchar(11)
);

/*Visualice la estructura de la tabla agenda*/
describe agenda;

/*
 Ingrese los siguientes datos:
 Mores,Alberto,Colon 123,4234567,
 Torres,Juan,Avellaneda 135,4458787,
 Lopez,Mariana,Urquiza 333,4545454,
 Lopez,Jose,Urquiza 333,4545454,
 Peralta,Susana,Gral. Paz 1234,4123456.
*/
insert into agenda (apellido, nombre, domicilio, telefono) 
	values ('Mores','Alberto','Colon 123','4234567');
insert into agenda (apellido, nombre, domicilio, telefono)
	values ('Torres','Juan','Avellanda 135','4458787');
insert into agenda (apellido, nombre, domicilio, telefono)
	values ('Lopez','Mariana','Urquiza 333','4545454');
insert into agenda (apellido, nombre, domicilio, telefono)
	values ('Lopez','Jose','Urquiza 333','4545454');
insert into agenda (apellido, nombre, domicilio, telefono)
	values ('Peralta','Susana','Gral. Paz 1234','4123456');

/*Modifique el registro cuyo nombre sea "Juan" por "Juan Jose".*/
update agenda set nombre='Juan Jose' where nombre='Juan';

/*Actualice los registros cuyo numero numero telefonico sea igual a "4545454" por "44455566".*/
update agenda set telefono='44455566' where telefono='4545454';

/*Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose".*/
update agenda set nombre='Juan Jose' where nombre='Juan';

/*Problema 2 (A):
Trabaje con la tabla "libros" de una libreria.
*/

/*Elimine la tabla libros.*/ 
drop table libros;

/*Cree la tabla libros con la siguiente estructuras: 
 titulo varchar(20), 
 autor varchar(30), 
 editorial varchar(15), 
 precio float
*/
create table libros (
	titulo varchar(23),
    autor varchar(30),
    editorial varchar(15),
    precio float
);

/*Visualice la estructura de la tabla "libros".*/
describe libros;

/*Ingrese los siguientes datos:
 El aleph,Borges,Planeta,15.00;
 Martin Fierro,Jose Hernandez,Emece,25.50;
 Aprenda PHP,Mario Molina,Emece,25.00;
 Cervantes y el quijote,Borges,Paidos,25;
 Matematica estas ahi, Paenza, Paidos,40.80;
*/
insert into libros (titulo,autor,editorial,precio) 
	values ('El aleph','Borges','Planeta',15.00);
insert into libros (titulo,autor,editorial,precio)
	values ('Martin Fierro','Jose Hernandez','Emece',25.50);
insert into libros (titulo,autor,editorial,precio)
	values ('Aprenda PHP','Mario Molina','Emece',25.00);
insert into libros (titulo,autor,editorial,precio)
	values ('Cervantes y el quijote','Borges','Paidos',25);
insert into libros (titulo,autor,editorial,precio)
	values ('Matematica estas ahi','Paenza','Paidas',40.80);
    
/*Muestre todos los registros.*/
select * from libros;

/*Modifique los registros cuyo autor sea igual a "Paenza" por "Adrian Paenza".*/
update libros set autor='Adrian Paenza' where autor='Paenza';

/*Nuevamente modifique los registros cuyo autor sea igual a "Paenza" por "Adrian Paenza".*/
update libros set autor='Adrian Paenza' where autor='Paenza';

/*Actualice el precio del libro de "Mario Molina" a 27 pesos.*/
update libros set precio=27 where autor='Mario Molina';

/*Actualice el valor del campo "editorial" por "Emece S.A", para todos los registros cuya editorial sea igual a "Emece".*/
update libros set editorial='Emece S.A' where editorial='Emece';

/*Problema 2 (B):
 Un comercio que vende articulos de computacion registra los datos de sus articulos 
 en una tabla con ese nombre.
*/

/*Elimine la tabla articulos.*/
drop table articulos;

/*
 Cree la tabla articulos con la siguiente estructura: 
 codigo integer, 
 nombre varchar(20),
 descripcion varchar(30), 
 precio float, 
 cantidad integer
*/
create table articulos (
	codigo integer, 
    nombre varchar(20),
    descripcion varchar(30),
    precio float,
    cantidad integer
);

/*Vea la estructura de la tabla.*/
describe articulos;

/*
Ingrese los siguientes datos:
1,'impresora','Epson Stylus C45',400.80,20
2,'impresora','Epson Stylus C85',500,30
3,'monitor','Samsung 14',800,10
4,'teclado','ingles Biswal',100,50
5,'teclado','espaÃ±ol Biswal',90,50
*/
insert into articulos (codigo, nombre, descripcion, precio, cantidad) 
	values (1,'impresora','Epson Stylus C45',400.80,20);
insert into articulos (codigo, nombre, descripcion, precio, cantidad) 
	values (2,'impresora','Epson Stylus C85',500,30);
insert into articulos (codigo, nombre, descripcion, precio, cantidad) 
	values (3,'monitor','Samsung 14',800,10);
insert into articulos (codigo, nombre, descripcion, precio, cantidad) 
	values (4,'teclado','ingles Biswal',100,50);
insert into articulos (codigo, nombre, descripcion, precio, cantidad) 
	values (5,'teclado','espaÃ±ol Biswal',90,50);

/*Actualice el precio a "400" del articulo cuya descripcion sea "Epson Sylus C45".*/
update articulos set precio=400 where descripcion='Epson Stylus C45';

/*Actualice la candidad a 100 de todos los teclados.*/
update articulos set cantidad=100 where nombre='teclado';

/*Actualice la cantidad a 50 y el precio a 550 del articulo con codigo 2.*/
update articulos set cantidad=50, precio=550 where codigo=2;

/*Actualice la cantidad a 100 de todos los registros con cantidad 1000.*/
update articulos set cantidad=100 where cantidad=1000;

#Ejercicio 4:

/*Problema 1:
 Trabaje con la tabla "libros" de una libreria.
*/

/*Elimine la tabla "libros" si existe.*/
drop table if exists libros;

/*
 Cree la tabla "libros" con la siguiente estructura:
 codigo integer,
 titulo varchar(20),
 autor varchar(30),
 editorial varchar(15),
 primary key(codigo)
*/
create table libros (
	codigo integer,
    titulo varchar(23),
    autor varchar(30),
    editorial varchar(15),
    primary key(codigo)
);

/*Visualice la estructura de la tabla libros, compruebe la clave primaria.*/
describe libros;

/*
 Ingrese los siguientes registros
 1,El aleph,Borges,Planeta;
 2,Martin Fierro,Jose Hernandez,Emece;
 3,Aprenda PHP,Mario Molina,Emece;
 4,Cervantes y el quijote,Borges,Paidos;
 5,Matematica estas ahi, Paenza, Paidos;
*/
insert into libros (codigo, titulo, autor, editorial) 
	values (1,'El aleph','Borges','Planeta');
insert into libros (codigo, titulo, autor, editorial) 
	values (2,'Martin Fierro','Jose Hernandez','Emece');
insert into libros (codigo, titulo, autor, editorial) 
	values (3,'Aprenda PHP','Mario Molina','Paidos');
insert into libros (codigo, titulo, autor, editorial) 
	values (4,'Cervantes y el quijote','Borges','Paidos');
insert into libros (codigo, titulo, autor, editorial) 
	values (5,'Matematica estas ahi','Paenza','Paidos');

/*Seleccione todos los registros.*/
select * from libros;

/*Ingrese un registro con codigo no repetido y nomrbe de autor repetido.*/
insert into libros (codigo, titulo, autor, editorial)
	values (6,'El principito','Borges','Novacasa');
/*Ingrese un registro con codigo no repetido y titulo y editorial repetidos.*/
insert into libros (codigo, titulo, autor, editorial) 
	values (7,'Cervantes y el quijote','Pedro Henriquez','Paidos');
/*Intente ingresar un registro que repita el campo clave (causa error al repetir la clave).*/
insert into libros (codigo, titulo, autor, editorial)
	values (7, 'Cervantes y el quijote', 'Borges', 'Novacasa');

/*Problema 2 (A):
 Una empresa almacena los datos de sus clientes en una tabla llamada "clientes".
*/

/*Elimina la tabla clientes, si existe.*/
drop table if exists clientes;

/*
 Cree la tabla clientes con la siguiente estructura:
 documento varchar(8),
 apellido varchar(20),
 nombre varchar(20),
 domicilio varchar(30),
 telefono varchar(11),
 primary key(documento)
*/
create table clientes ( 
  documento varchar(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11),
  primary key(documento)
);

/*Visualice la estructura de la tabla para comprobar la clave primaria.*/
describe clientes;

/*
 Ingrese los siguientes datos:
 '22345678','Perez','Marcos','Colon 123','4545454'
 '23222222','Garcia','Ana','Avellaneda 1345','4252652'
 '20454545','Lopez','Susana','Urquiza 344','4522525'
 '35454545','Lopez','Susana','Urquiza 344','4522525'
*/
insert into clientes (documento,apellido,nombre,domicilio, telefono)
   values('22345678','Perez','Marcos','Colon 123','4545454');
insert into clientes (documento,apellido,nombre,domicilio, telefono)    
   values('23222222','Garcia','Ana','Avellaneda 1345','4252652');
insert into clientes (documento,apellido,nombre,domicilio, telefono)   
   values('20454545','Lopez','Susana','Urquiza 344','4522525');
insert into clientes (documento,apellido,nombre,domicilio, telefono)   
   values('35454545','Lopez','Susana','Urquiza 344','4522525');

/*Ingrese un cliente con codigo no repetido y apellido y nombre repetido.*/
insert into clientes (documento, apellido, nombre, domicilio, telefono) 
	values ('55454545','Lopez','Susana','Urquiza 344','4522525');
/*Ingrese un cliente con codigo no repetido y domicilio repetido.*/
insert into clientes (documento, apellido, nombre, domicilio, telefono)
	values ('56583344', 'Ozuna','Adrian','Urquiza 344','6464644');
/*Intente ingresar un registre con documento repetido (causa error por clave repetida).*/
insert into clientes (documento, apellido, nombre, domicilio, telefono)
	values ('56583344', 'Rosario','Carlos','Avellaneda 1245','4343433');

/*Problema 2:
Un instituto de enseñanza almacena los datos de sus estudiantes en una tabla llamada "alumnos".
*/

/*Elimine la tabla alumnos, si existe.*/
drop table if exists alumnos;

/*
 Cree la tabla alumnos con la siguiente estructura:
 legajo varchar(4) not null,
 documento varchar(8) not null,
 apellido varchar(30),
 nombre varchar(30),
 domicilio varchar(30),
 primary key (legajo)
*/
create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (legajo)
);

/*
 Ingrese los siguientes registros:
 'A233','22345345','Perez','Mariana','Colon 234'
 'A567','23545345','Morales','Marcos','Avellaneda 348'
 'B654','24356345','Gonzalez','Analia','Caseros 444'
 'A642','20254125','Torres','Ramiro','Dinamarca 209'
 'B509','20445778','Miranda','Carmen','Uspallata 999'
 'C777','28111444','Figueroa','Natalia','Sarmiento 856'
*/
insert into alumnos (legajo, documento, apellido, nombre, domicilio) 
	values ('A233','22345345','Perez','Mariana','Colon 234');
insert into alumnos (legajo, documento, apellido, nombre, domicilio) 
	values ('A567','23545345','Morales','Marcos','Avellanada 348');
insert into alumnos (legajo, documento, apellido, nombre, domicilio) 
	values ('B654','24356345','Gonzales','Analia','Caseros 444');
insert into alumnos (legajo, documento, apellido, nombre, domicilio) 
	values ('A642','20254125','Torres','Ramiro','Dinamarca 209');
insert into alumnos (legajo, documento, apellido, nombre, domicilio) 
	values ('B509','20445778','Miranda','Carmen','Uspallata 999');
insert into alumnos (legajo, documento, apellido, nombre, domicilio) 
	values ('C777','28111444','Figueroa','Natalia','Sarmiento 856');

/*Seleccione todos los registros.*/
select * from alumnos;

/*Ingrese dos alumnos con igual nombre y apellido pero distinto legajo.*/
insert into alumnos (legajo, documento, apellido, nombre, domicilio) 
	values ('C888','83745923','Putin','Vladimir','Colon 123');
insert into alumnos (legajo, documento, apellido, nombre, domicilio)
	values ('F777','94876234','Putin','Vladimir','Colon 123');

/*Intente ingresar un registro que repita el campo clave("leagajo").*/
insert into alumnos (legajo, documento, apellido, nombre, domicilio)
	values ('D777','96734576','Ozuna','Adrian','Juan de la Cruz 123');

#Ejercicio 5

/*Problema 1:
Una farmacia guarda información referente a sus medicamentos en una tabla 
llamada "medicamentos".
*/

/*Elimine la tabla medicamentos, si existe.*/
drop table if exists medicamentos;

/*
 Cree la tabla con la siguiente estructura:
 create table medicamentos(
 codigo integer auto_increment,
 nombre varchar(20),
 laboratorio varchar(20),
 precio float,
 cantidad integer,
 primary key (codigo)
*/
create table medicamentos(
  codigo integer auto_increment,
  nombre varchar(20),
  laboratorio varchar(20),
  precio float,
  cantidad integer,
  primary key (codigo)
);

/*Visualice la estructura de la tabla medicamentos.*/
describe medicamentos;

/*
 Inserte los siguientes registros
 'Sertal','Roche',5.2,100
 'Buscapina','Roche',4.10,200
 'Amoxidal 500','Bayer',15.60,100
*/
insert into medicamentos (nombre, laboratorio, precio, cantidad) 
	values ('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio, precio, cantidad) 
	values ('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio, precio, cantidad) 
	values ('Amoxidal 500','Bayer',15.60,100);
    
/*Verifique que el campo codigo genero los valores de modo automatico.*/
select codigo from medicamentos;

/*Intente ingresar un registro con un valor de clave primaria repetida.*/
insert into medicamentos (codigo, nombre, laboratorio, precio, cantidad) 
	values (3,'Aspirina','Bayer',16.60,100);
    
/*Ingrese un registro con un valor de clave primaria no repetido salteando la secuencia.*/
insert into medicamentos (codigo, nombre, laboratorio, precio, cantidad) 
	values ('5','Simvastanina','Bayer',20.00,150);
    
/*Ingrese un nuevo registro sin especificar el codigo y note que sigue la secuencia.*/
insert into medicamentos (nombre, laboratorio, precio, cantidad) 
	values ('Omeprazol','Prisolec',19.50,90);

/*Problema 2:
Un videoclub almacena información sobre sus películas en una tabla llamada "peliculas".
*/

/*Elimine la tabla peliculas si existe.*/
drop table if exists peliculas;

/*
 Cree la tabla peliculas con la siguiente estructuras:
 codigo (entero), autoincremento
 titulo (cadena de 30)
 actor (cadena de 20)
 duracion (entero)
 clave primaria: codigo
*/
create table peliculas(
	codigo int auto_increment,
    titulo varchar(35),
    actor varchar(20),
    duracion int,
    primary key (codigo)
);

/*Inserte los siguientes registros:*/
insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','xxx',180);
insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','xxx',190);
insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
  values('La vida es bella','zzz',220);

/*Seleccione todos los registros y verifique la carga automatica de los codigos.*/
select * from peliculas;

/*Actualice las peliculas cuyo codigo es 3 coloncando en "actor" Daniel R.".*/
update peliculas set actor="Daniel R." where codigo=3;

/*Elimine la pelicula "La vida es bella".*/
delete from peliculas where titulo="La vida es bella";

/*Elimine todas las peliculas cuya duracion sea igual a 120 minutos.*/
delete from peliculas where duracion=120;

/*Visualice los registros.*/
select * from peliculas;

/*Ingrese el siguiente registro, sin valor para la clave primaria.*/
insert into peliculas (titulo, actor, duracion) 
	values ('Mujer bonita','Richard Gere',120);
    
/*Inserte el siguiente registro, con valor para la clave primaria.*/
insert into peliculas (codigo, titulo, actor, duracion)
	values (7,'Tootsie','D. Hoffman',90);

/*Intente ingresar un registro con clave primaria repetida.*/
insert into peliculas (codigo, titulo,actor,duracion)
	values(7,'Spider-Man','Tom Holland',110);
  
/*Ingrese el siguiente registro, sin valor para la clave primaria.*/
insert into peliculas (titulo,actor,duracion)
	values('Un oso rojo','Julio Chavez',100);
