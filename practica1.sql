use practica_db;

/*Ejercicio 1.*/

/*Problema 1.*/

#Elimine la tabla agenda si existe.
drop table if exists agenda;

#Cree la tabla agenda.
create table agenda(
	nombre varchar(20),
    domicilio varchar(30),
    telefono varchar(11)
);

#Bloque de codigo que causa error al intentar crear la tabla de nuevo.
create table agenda(
	nombre varchar(20),
    domicilio varchar(30),
    telefono varchar(11)
);

#Visualice las tablas existentes.
show tables;

#Visualice la estructura de la tabla agenda.
describe agenda;

#Elimine la tabla, si existe.
drop table if exists agenda;

#Linea de codigo que causa error al intentar borrar una tabla inexistente.
drop table agenda;

/*Problema 2:*/

#Elimine la tabla libros, si existe.
drop table if exists libros;
create table libros(
	titulo varchar(20),
    autor varchar(30),
    editorial varchar(15)
);

#Bloque de codigo que causa error al intentar crear una tabla ya existente.
create table libros(
	titulo varchar(20),
    autor varchar(30),
    editorial varchar(15)
);

#Visualice las tablas existentes.
show tables;

#Elimine la tabla libros, si existe.
drop table if exists libros;
#Intente eliminar la tabla (causa error al intentar borrar una tabla no existente).
drop table libros;

/*Ejercicio 2.*/

/*Problema 1.*/

#Elimine la tabla agenda, si existe.
drop table if exists agenda;

#Cree la tabla agenda.
create table agenda(
   nombre varchar(20),
   domicilio varchar(30),
   telefono varchar(11)
);

#Visualice las tablas existentes.
show tables;

#Visualice la estructura de la tabla agenda.
describe agenda;

#Ingrese registros en los campos nombre, domicilio, telefono.
insert into agenda (nombre, domicilio, telefono) 
	values ('Alberto Mores','Colon 123','4234567');
insert into agenda (nombre, domicilio, telefono) 
	values ('Juan Torres','Avellaneda 135','4458787');

#Muestre todos los registros de la tabla.
select nombre, domicilio, telefono from agenda;

#Elimine la tabla agenda, si existe.
drop table if exists agenda;
#Elimine la tabla agenda.
drop table agenda;

/*Problema 2.*/

#Elimine la tabla libros, si existe.
drop table if exists libros;

#Cree la tabla libros.
create table libros(
	titulo varchar(20),
    autor varchar(30),
    editorial varchar(15)
);

#Muestre las tablas existentes.
show tables;

#Visualice la estructura de la tabla libros.
describe libros;

#Inserte registros en los campos titulo, autor, editorial.
insert into libros (titulo, autor, editorial) 
	values ('El aleph', 'Borges', 'Planeta');
insert into libros (titulo, autor, editorial) 
	values ('Martin Fierro', 'Jose Hernandez', 'Emece');
insert into libros (titulo, autor, editorial) 
	values ('Aprende PHP', 'Mario Molina', 'Emece');

#Muestre todos los registros.
select titulo, autor, editorial from libros;

/*Ejercicio 3.*/

/*Problema 1.*/

#Elimine la tabla peliculas, si existe.
drop table if exists peliculas;

#Cree la tabla peliculas.
create table peliculas(
	 nombre varchar(20),
     actor varchar(20),
     duracion integer,
     cantidad integer
);

#Visualice la estructura de la tabla peliculas.
describe peliculas;

insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',120,3);
insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',180,2);
insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mujer bonita','Julia R.',90,3);
insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',90,2);

#Muestre todos los registro.
select * from peliculas;

/*Problema 2:*/

#Elimine la tabla empleados, si existe.
drop table if exists empleados;

#Cree la tabla empleados.
create table empleados(
	  nombre varchar(20),
      documento varchar(8),
      sexo varchar(1),
      domicilio varchar(30),
      sueldobasico float
);

#Visualice la estructura de la tabla empleados.
describe empleados;

#Seleccione todos los registros.
select * from empleados;

/*Ejercicio 4:*/

/*Problema 1.*/

#Elimine la tabla peliculas, si existe.
drop table if exists peliculas;

#Cree la tabla peliculas.
create table peliculas(
	titulo varchar(20),
    actor varchar(20),
    duracion integer,
    cantidad integer
);

#Visualice la estrucutra de la tabla peliculas.
describe peliculas;

#Inserte registros en los campos titulo, actor, duracion, cantidad.
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',120,3);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',180,2);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia R.',90,3);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',90,2);

#Muestre solamente el titulo y actor de las peliculas.
select titulo, actor from peliculas;

#Muestre solamente el titulo y cantidad de copias.
select titulo, duracion from peliculas;

#Muestre el titulo y la cantidad de copias.
select titulo, cantidad from peliculas;

/*Problema 2:*/

#Elimine la tabla empleados, si existe.
drop table if exists empleados;

#Cree la tabla empleados.
create table empleados(
	nombre varchar(20),
    documento varchar(8), 
    sexo varchar(1),
    domicilio varchar(30),
    sueldobasico float
);

#Visualice la tabla empleados.
describe empleados;

#Inserte registros en los campos nombre, documento, sexo y domicilio.
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Perez','22345678','m','Sarmiento 123',300);
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','24345678','f','Colon 134',500);
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Marcos Torres','27345678','m','Urquiza 479',800);

#Muestre todos los registros de la tabla empleados.
select * from empleados;

#Muestre el nombre y documento de los empleados.
select nombre, documento from empleados;

#Muestre el nombre, documento y sueldobasico de los empleados.
select nombre, documento, sueldobasico from empleados;

/*Problema 3.*/

#Elimine la tabla articulos, si existe.
drop table if exists articulos;

#Cree la tabla articulos.
create table articulos(
	codigo_articulo integer,
    nombre_articulo varchar(20),
    descripcion varchar(30),
    precio float

);

#Visualice la estructura de la tabla articulos.
describe articulos;

#Inserte registros en los campos codigo, nombre, descripcion, precio.

insert into articulos (codigo_articulo, nombre_articulo, descripcion, precio)
  values (1,'impresora','Epson Stylus C45',400.80);
insert into articulos (codigo_articulo, nombre_articulo, descripcion, precio)
  values (2,'impresora','Epson Stylus C85',500);
insert into articulos (codigo_articulo, nombre_articulo, descripcion, precio)
  values (3,'monitor','Samsung 14',800);

#Muestre todos los campos de todos los registros.
select * from articulos;

#Muestre solo el nombre, descripcion y precio de los articulos.
select nombre_articulo, descripcion, precio from articulos;

/*Ejercicio 5:*/

/*Problema 1:*/

#Elimine la table agenda, si existe.
drop table if exists agenda;

#Cree la tabla agenda.
create table agenda(
	nombre varchar(20),
    domicilio varchar(30),
    telefono varchar(11)
);

#Visualice la estructura de la tabla agenda.
describe agenda;

#Inserte registros en los campos nombre, domicilio y telefono.
insert into agenda (nombre, domicilio, telefono) 
	values ('Alberto Mores','Colon 123','4234567');
insert into agenda (nombre, domicilio, telefono) 
	values ('Juan Torres','Avellaneda 135','4458787');
insert into agenda (nombre, domicilio, telefono)
	values ('Mariana Lopez','Urquiza 333','4545454');
insert into agenda (nombre, domicilio, telefono) 
	values ('Fernando Lopez','Urquiza 333','4545454');

#Seleccione todos los registros de la tabla.
select * from agenda;

#Seleccione el registro cuyo nombre sea 'Juan Torres'.
select * from agenda where nombre='Juan Torres';

#Seleccione el registro cuyo domicilio sea 'Colon 123'.
select * from agenda where domicilio='Colon 123';

#Seleccione el registro cuyo telefono sea '4545454'.
select * from agenda where telefono='4545454';

#Elimine la tabla agenda.
drop table agenda;

/*Problema 2:*/

#Elimine la tabla libros, si existe.
drop table if exists libros;

#Cree la tabla libros.
create table libros(
	titulo varchar(20),
    autor varchar(30),
    editorial varchar(15)
);

#Visualice la estructura de la tabla libros.
describe libros;

#Inserte registros en los campos titulo, autor, editorial
insert into libros (titulo, autor, editorial) 
	values ('El aleph', 'Borges', 'Planeta');
insert into libros (titulo, autor, editorial) 
	values ('Martin Fierro', 'Jose Hernandez', 'Emece');
insert into libros (titulo, autor, editorial) 
	values ('Aprende PHP', 'Mario Molina', 'Emece');
insert into libros (titulo, autor, editorial) 
	values ('Cervantes', 'Borges', 'Paidos');

#Seleccione todos los registros
select * from libros;

#Seleccione todos los registros cuyo autor sea 'Borges'
select * from libros where autor='Borges';

#Seleccione todos los registros cuyo editorial sea 'Emece'
select * from libros where editorial='Emece';

#Seleccione todos los registros cuyo titulo sea 'Martin Fierro'
select * from libros where titulo='Martin Fierro';

#Elimine la tabla libros
drop table libros;

/*Problema 3*/
#Elimine la tabla articulos, si existe
drop table if exists articulos;

#Cree la tabla articulos
create table articulos(
	codigo integer,
    nombre varchar(20),
    descripcion varchar(30),
    precio float
);

#Visualice la estructura de la tabla articulos
describe articulos;

#Inserte registros en los campos codigo, nombre, descripcion, nombre
insert into articulos (codigo, nombre, descripcion, precio)
  values (1,'impresora','Epson Stylus C45',400.80);
insert into articulos (codigo, nombre, descripcion, precio)
  values (2,'impresora','Epson Stylus C85',500);
insert into articulos (codigo, nombre, descripcion, precio)
  values (3,'monitor','Samsung 14',800);
insert into articulos (codigo, nombre, descripcion, precio)
  values (4,'teclado','ingles Biswal',100);
insert into articulos (codigo, nombre, descripcion, precio)
  values (5,'teclado','español Biswal',90);

#Seleccione todos los registros cuyo nombre sea 'impresora'
select * from articulos where nombre='impresora';

#Muestre solamente el codigo, descripcion y precio de los teclados
select codigo, descripcion, precio where nombre='teclado';