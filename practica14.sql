create database practica14;
use practica14;

#Problema propuesto 1:

/*Encuentra los errores y arreglalos.*/

drop table if exists clientes;

create table clientes(
	nombre varchar(50),
	mail varchar(70),
	tarjetacredito blob,
	primary key (nombre)
);

insert into clientes 
  values ('Marcos Luis','marcosluis@gmail.com',aes_encrypt('5390700823285988','xyz123'));
insert into clientes 
  values ('Ganzalez Ana','gonzalesa@gmail.com',aes_encrypt('4567230823285445','xyz123'));
insert into clientes 
	values ('Lopez German','lopezg@yahoo.com',aes_encrypt('7840704453285443','xyz123'));

-- Si accedemos al campo tarjetacredito podemos comprobar que se encuentra cifrado.
select tarjetacredito from clientes;

-- Para descifrar la tarjeta de crédito debemos conocer la clave de cifrado: 'xyz123':
select cast(aes_decrypt(tarjetacredito, 'xyz123') as char) from clientes;

#Problema propuesto 2:

/*Elabora un problema de subconsulta tuyo propio y resuelve.*/

#Problema propuesto 3:

/*Problema: Un profesor almacena el documento, nombre y la nota final de cada alumno de su clase en una tabla 
llamada "alumnos".*/

/*Elimine la tabla si existe y luego creela.*/
drop table if exists alumnos;

 create table alumnos(
	documento char(8),
	nombre varchar(30),
	nota decimal(4,2),
	primary key(documento)
);

/*Ingrese algunos registros:*/
insert into alumnos values('30111111','Ana Algarbe',5.1);
insert into alumnos values('30222222','Bernardo Bustamante',3.2);
insert into alumnos values('30333333','Carolina Conte',4.5);
insert into alumnos values('30444444','Diana Dominguez',9.7);
insert into alumnos values('30555555','Fabian Fuentes',8.5);
insert into alumnos values('30666666','Gaston Gonzalez',9.70);

/*Obtenga todos los datos de los alumnos con la nota más alta, empleando subconsulta.*/
select (select max(nota) from alumnos) from alumnos;

/*Muestre los alumnos que tienen una nota menor al promedio, su nota, y la diferencia con el 
promedio.*/

#Problema propuesto 4:

/*Problema: Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla 
"ciudades" donde registra los nombres de las ciudades.*/

/*Cree la tabla "clientes" (codigo, nombre, domicilio, ciudad, codigociudad) y "ciudades" (codigo, 
nombre). Agregue una restricción "primary key" para el campo "codigo" de ambas tablas):*/
drop table if exists ciudades;
drop table if exists clientes;

create table ciudades(
	codigo int auto_increment,
	nombre varchar(20),
	primary key (codigo)
);

create table clientes (
	codigo int auto_increment,
	nombre varchar(30),
	domicilio varchar(30),
	codigociudad smallint not null,
	primary key(codigo)
);

insert into ciudades (nombre) values('Cordoba');
insert into ciudades (nombre) values('Cruz del Eje');
insert into ciudades (nombre) values('Carlos Paz');
insert into ciudades (nombre) values('La Falda');
insert into ciudades (nombre) values('Villa Maria');
insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Marcos','Colon 111',1);
insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Hector','San Martin 222',1);
insert into clientes(nombre,domicilio,codigociudad) values ('Perez Ana','San Martin 333',2);
insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Juan','Rivadavia 444',3);
insert into clientes(nombre,domicilio,codigociudad) values ('Perez Luis','Sarmiento 555',3);
insert into clientes(nombre,domicilio,codigociudad) values ('Gomez Ines','San Martin 666',4);
insert into clientes(nombre,domicilio,codigociudad) values ('Torres Fabiola','Alem 777',5);
insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Luis','Sucre 888',5);
 
/*Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle 
"San Martin", empleando subconsulta.*/
select nombre from ciudades where (select codigociudad from clientes);