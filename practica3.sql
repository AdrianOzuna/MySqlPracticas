#create database practica3;
use practica3;

#Ejercicio 1:

/*
 Problema 1: Una farmacia guarda informacion referente a sus medicamentos en una tabla llamada "medicamentos".
*/

/*Elimine la tabla medicamentos, si existe.*/
drop table if exists medicamentos;

/*
 Cree la tabla peliculas con la siguiente estructura: 
 codigo entero autoincremento, 
 titulo cadena de 50, 
 actor cadena de 40, 
 duracion entero, 
 clave primaria: codigo.
*/
create table medicamentos(
  codigo integer auto_increment,
  nombre varchar(20),
  laboratorio varchar(20),
  precio float,
  cantidad integer,
  primary key (codigo)
 );
 
/*
 Ingrese los siguientes registros:
 'Sertal','Roche',5.2,100
 'Buscapina','Roche',4.10,200
 'Amoxidal 500','Bayer',15.60,100
*/
insert into medicamentos (nombre, laboratorio, precio, cantidad) 
	values ('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos (nombre, laboratorio, precio, cantidad) 
	values ('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio, precio, cantidad) 
	values ('Amoxidal 500','Bayer',15.60,100);
    
/*Elimine todos los registros con "delete".*/
delete from medicamentos;

/*
 Ingrese dos registros:
 'Sertal','Roche',5.2,100
 'Amoxidal 500','Bayer',15.60,100
*/
insert into medicamentos (nombre, laboratorio, precio, cantidad) 
	values ('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
	values ('Amoxidal 500','Bayer',15.60,100);
    
/*Vea los registros para verificar que continuo la secuencia al generar el valor para codigo.*/
select * from medicamentos;

/*Vacie la tabla.*/
truncate table medicamentos;

/*
 Ingrese el siguiente registro:
 'Buscapina','Roche',4.10,200
*/
insert into medicamentos (nombre, laboratorio, precio, cantidad) 
	values ('Buscapina','Roche',4.10,200);
    
/*Vea los registros para verificar que al cargar el codigo reinicio la secuencia en 1.*/
select * from medicamentos;

/*
 Problema 2: 
 Un videoclub almacena informacion sobre sus peliculas en una tabla llamada "peliculas".
*/

/*Elimine la tabla peliculas, si existe.*/
drop table if exists peliculas;

/*Cree la tabla peliculas con la siguiente estructura: 
 codigo entero autoincremento, 
 titulo cadena de 50, 
 actor cadena de 40, 
 duracion entero, 
 clave primaria: codigo
*/
create table peliculas(
	codigo integer auto_increment,
    titulo varchar(50),
    actor varchar(40),
    duracion integer,
    primary key (codigo)
);

/*
 Ingrese los siguientes registros:
 'Mision imposible','Tom Cruise',120
 'Harry Potter y la piedra filosofal','xxx',180
 'Harry Potter y la camara secreta','xxx',190
 'Mision imposible 2','Tom Cruise',120
 'La vida es bella','zzz',220
*/
insert into peliculas (titulo, actor, duracion) 
	values ('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo, actor, duracion) 
	values ('Harry Potter y la piedra filosofal','xxx',180);
insert into peliculas (titulo, actor, duracion) 
	values ('Harry Potter y la camara secreta','xxx',190);
insert into peliculas (titulo, actor, duracion) 
	values ('Mision imposible 2','Tom Cruise',120);
insert into peliculas (titulo, actor, duracion) 
	values ('La vida es bella','zzz',220);
    
/*Seleccione todos los registros y verifique la carga automatica de los codigos.*/
select * from peliculas;

/*Elimine todos los registros.*/
delete from peliculas;

/*
 Ingrese el siguiente registro, sin valor para la clave primaria:
 'Mujer bonita','Richard Gere','120'
*/
insert into peliculas (titulo, actor, duracion) 
	values ('Mujer bonita','Richard Gere','120');

/*Vea los registros para verificar que al generar el valor para "codigo" continuo la secuencia.*/
select * from peliculas;

/*Elimine todos los registros vaciando la tabla.*/
truncate table peliculas;

/*
 Ingrese el siguiente registro:
 'Elsa y Fred','China Zorilla',90
*/
insert into peliculas (titulo, actor, duracion) 
	values ('Elsa y Fred','China Zorilla',90);
    
/*Muestre el registro ingresado para verificar que inicio la secuencia nuevamente para el campo codigo.*/
select * from peliculas;

#Ejercicio 2

/*
 Problema 1:
 Retome la tabla llamada "medicamentos" que almacena la informacion de los productos que se venden en la farmacia.
*/

/*Elimine la tabla medicamentos, si existe.*/
drop table if exists medicamentos;

/*
 Cree la tabla "medicamentos" con la siguiente estructura:
 codigo integer auto_increment, 
 nombre varchar(20) not null,
 laboratorio varchar(20),
 precio float,
 cantidad integer not null,
 primary key (codigo)
*/
create table medicamentos(
	codigo integer auto_increment,
    nombre varchar(20) not null,
    laboratorio varchar(20),
    precio float,
    cantidad integer not null,
    primary key (codigo)
);

/*
 Ingrese los siguientes registros:
 'Sertal gotas','Roche',5.2,100
 'Sertal compuesto','Roche',7.1,150
 'Buscapina','Roche',null,200
 'Amoxidal 500','Bayer',15.60,0
 'Amoxidal jarabe','Bayer',25,120
 'Amoxinil',null,25,120
 'Bayaspirina','',0,150
*/
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Sertal gotas','Roche',5.2,100); 
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Sertal compuesto','Roche',7.1,150);
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Buscapina','Roche',null,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Amoxidal 500','Bayer',15.60,0);
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Amoxidal jarabe','Bayer',25,120);
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Amoxinil',null,25,120);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Bayaspirina','',0,150);

/*Verifique que el campo "codigo" genero los valores de modo automatico.*/
select * from medicamentos;

/*
 Recupere los registros que contengan el valor "null" en el campo laboratorio,
 luego los que tengan una cadena vacia en el mismo campo.
*/
select * from medicamentos where laboratorio is null;
select * from medicamentos where laboratorio='';

/*
 Recupere los registros que contengan el valor "null" en el campo "precio",
 luego los que tengan el valor 0 en el mismo campo.
*/
select * from medicamentos where precio is null;
select * from medicamentos where precio=0;

/*
 Intente ingresar el siguiente registro con valor "null" para el campo nombre (Muestra error):
 'Benadryl comprimidos','Bayer',10.20,null
*/
insert into medicamentos (nombre, laboratorio, precio, cantidad)
	values ('Benadryl comprimidos','Bayer',10.20,null);

/*Ingrese el siguiente registro con valor "null" para el campo correspondienteal codigo (No muestra error):
 null,'Benadryl comprimidos','Bayer',10.20,null
*/
insert into medicamentos (codigo, nombre, laboratorio, precio, cantidad)
	values (null,'Benadryl comprimidos','Bayer',10.20,120);


/*Muestre los registros cuyo precio sea distinto de 0, luego los que sean distintos de null.*/
select * from medicamentos where precio<>0;
select * from medicamentos where precio is not null;

/*Recupere los registros en los cuales el laboratorio no contenga una cadena vacia,
 luego los que sean distintos de "null".
*/
select * from medicamentos where laboratorio<>'';
select * from medicamentos where laboratorio is not null;

/*Problema 2:
 Trabaje con la tabla que almacena los datos sobre peliculas, llamada "peliculas".
*/

/*Elimine la tabla.*/
drop table if exists peliculas;

/*Cree la tabla peliculas con la siguiente estructura:
 codigo (entero, autoincremento)
 titulo (cadena de 30, not null)
 actor (cadena de 20),
 duracion (entero)
 clave primaria (codigo)
*/
create table peliculas(
	codigo integer auto_increment,
    titulo varchar(35) not null,
    actor varchar(20),
    duracion integer,
    primary key (codigo)
);

/*Visualice la estructura de la tabla peliculas.*/
describe peliculas;

/*Ingrese los siguientes registros
 'Mision imposible','Tom Cruise',120
 'Harry Potter y la piedra filosofal','Daniel R.',180
 'Harry Potter y la camara secreta','Daniel R.',190
 'Mision imposible 2','Tom Cruise',150 
 'Titanic','L. Di Caprio',220
 'Mujer bonita','R. Gere-J. Roberts',200
*/
insert into peliculas (titulo, actor, duracion) 
	values ('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo, actor, duracion) 
	values ('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas (titulo, actor, duracion) 
	values ('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas (titulo, actor, duracion) 
	values ('Mision imposible 2','Tom Cruise',150);
insert into peliculas (titulo, actor, duracion) 
	values ('Titanic','L. Di Caprio',220);
insert into peliculas (titulo, actor, duracion) 
	values ('Mujer bonita','R. Gere-J. Roberts',200);

/*Recupere todos los registros para verificar la carga automatica de los codigos.*/ 
select * from peliculas;

/*Inserte un registro con valor nulo para el campo clave primaria.
 Verifique que acepta el registro pero pasa por alto el dato ingresado para el codigo.
*/
insert into peliculas (codigo, titulo, actor, duracion)
	values (null,'Elsa y Fred','China Zorilla',90);

/*Intente ingresar un registro con valor nulo para el campo "titulo".
 Verifique que no realiza la accion.
*/

insert into peliculas (titulo, actor, duracion)
	values (null, 'China Zorilla',90);

/*Ingrese un registro con cadenas vacias para los campos varchar y valor 0 para los campos numericos.*/
insert into peliculas (codigo, titulo, actor, duracion) 
	values (0,'','',0);
    
/*Visualice el registro para ver como almaceno MySql el registro ingresado anteriormente.*/
select * from peliculas;

/*Coloque 120 en la duracion de la pelicula cuyo valor de duracion sea nulo.*/
update peliculas set duracion=120 where duracion is null;

/*Coloque "Desconocido" en el campo "actor" en los registros que tengan valor nulo en dicho campo.*/
update peliculas set actor="Desconocido" where actor is null;

/*Muestre todos los registros. Note que el cambio anterior no afecto al registro con valor nulo en 
 el campo "actor".
*/
select * from peliculas;

/*Coloque "Desconocido" en el campo "actor" en los registros que tengan cadena vacia en dicho campo.*/
update peliculas set actor="Desconocido" where actor='';

#Ejercicio 3

/*Problema 1:
 Trabaje con la tabla que almacena los datos sobre peliculas.
*/

/*Elimine la tabla peliculas si existe.*/
drop table if exists peliculas;

/*Tenga en cuenta el rango el rango de valores que almacenara cada campo.*/
create table peliculas(
	codigo integer unsigned auto_increment,
    titulo varchar(40) not null,
    actor varchar(20),
    duracion integer unsigned,
    primary key (codigo)
);

/*Visualice la estructura de la tabla.*/
describe peliculas;

/*Problema 2:
 Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes"
 algunos datos de las personas que visitan o compran en su stand para luego enviarle
 publicidad de sus productos.
*/

/*Elimine la tabla visitantes, si existe.*/
drop table if exists visitantes;

/*Cree la tabla y al definir los campos tenga en cuenta el rango de valores que almacenara
 cada campo:
 nombre: cadena de 30 caracteres
 edad: entero positivo
 sexo: 'f' o 'm'
 domicilio: cadena de 30,
 ciudad: cadena de 30,
 telefono: cadena de 11,
 monto compra: Valor con decimales mayor o igual a cero. No hay compras con monto negativo
*/
create table visitantes(
	nombre varchar(30),
    edad integer unsigned,
    sexo char(1),
    domicilio varchar(30),
    ciudad varchar(30),
    telefono varchar(11),
    monto_compra float unsigned
);

/*Visualice la estructura de la tabla.*/
describe visitantes;

#Ejercicio 4:

/*Problema 1:
 Una concesionaria de autos vende autos usados y almacena los datos de los autos en
 una tabla llamada autos
*/

/*Elimine la tabla "autos" si existe.*/
drop table if exists autos;

/*Cree la tabla con la siguiente estructura.*/
create table autos(
	patente char(6),
    marca varchar(20),
    modelo char(4),
    precio float unsigned,
    primary key (patente)
);

/*Inserte los siguientes registros:
 'ACD123','Fiat 128','1970',15000
 'ACG234','Renault 11','1990',40000
 'BCD333','Peugeot 505','1990',80000
 'GCD123','Renault Clio','1990',70000
 'BCC333','Renault Megane','1998',95000
 'BVF543','Fiat 128','1975',20000
*/
insert into autos (patente, marca, modelo, precio) 
	values ('ACD123','Fiat 128','1970',15000);
insert into autos (patente, marca, modelo, precio) 
	values ('ACG234','Renault 11','1990',40000);
insert into autos (patente, marca, modelo, precio) 
	values ('BCD333','Peugeot 505','1990',80000);
insert into autos (patente, marca, modelo, precio) 
	values ('GCD123','Renault Clio','1990',70000);
insert into autos (patente, marca, modelo, precio) 
	values ('BCC333','Renault Megane','1998',95000);
insert into autos (patente, marca, modelo, precio) 
	values ('BVF543','Fiat 128','1975',20000);
    
/*Seleccione todos los autos del año 1990.*/
select * from autos where modelo='1990';

/*Seleccione todos los autos con precio superior a 50000.*/
select * from autos where precio>50000;

/*Problema 2:
 Una empresa almacena los datos de sus clientes en una tabla llamada clientes.
*/

/*Elimine la tabla "clientes, si existe".*/
drop table if exists clientes;

/*Cree la tabla clientes con los siguientes campos y clave:
 documento char(8),
 apellido varchar(20),
 nombre varchar(20),
 domicilio varchar(30),
 telefono varchar (11),
 primary key(documento)
*/
create table clientes(
	documento char(8),
    apellido varchar(20),
    nombre varchar(20),
    domicilio varchar(30),
    telefono varchar(11),
    primary key (documento)
);

/*Ingrese los siguientes registros:
 '2233344','Perez','Juan','Sarmiento 980','4342345'
 '2333344','Perez','Ana','Colon 234'
 '2433344','Garcia','Luis','Avellaneda 1454','4558877'
 '2533344','Juarez','Ana','Urquiza 444','4789900'
*/
insert into clientes (documento, apellido, nombre, domicilio, telefono) 
	values ('2233344','Perez','Juan','Sarmiento 980','4342345');
insert into clientes (documento, apellido, nombre, domicilio) 
	values ('2333344','Perez','Ana','Colon 234');
insert into clientes (documento, apellido, nombre, domicilio, telefono) 
	values ('2433344','Garcia','Luis','Avellaneda 1454','4558877');
insert into clientes (documento, apellido, nombre, domicilio, telefono) 
	values ('2533344','Juarez','Ana','Urquiza 444','4789900');

/*Seleccione todos los clientes de apellido 'Perez'.*/
select * from clientes where apellido='Perez';

/*Seleccione el apellido, domicilio y telefono de todas las 'Ana'.*/
select apellido, domicilio, telefono from clientes where nombre='Ana';

#Ejercicio 5:

/*Problema 1
 Un comercio que envia pizzas y empanadas a domicilio registra los pedidos diariamente en una tabla llamada
 "pedidos" con los siguientes datos:
 -Numero de pedido, autoincrementable, entero positivo comienza en 1 y menor a 200 aprox
 -Nombre: pizza o empanada
 -Tipo
 -Precio: precio por unidad, valor con decimales que no supera los $99.99 y sera siempre mayor a 0
 -Cantidad: cantidad de articulos, entero positivo desde 1 e inferior a 200 aprox
 -Domicilio del cliente
*/

/*Elimine la tabla pedidos, si existe.*/
drop table if exists pedidos;

/*Cree la tabla eligiendo el tipo de dato adecuado para cada campo.*/
create table pedidos(
	numero_pedido tinyint unsigned auto_increment,
    nombre varchar(10),
    tipo varchar(10),
    precio decimal(4,2) unsigned,
    cantidad tinyint unsigned,
    domicilio varchar(30),
    primary key (numero_pedido)
);

/*Problema 2 (A):
 El departamento de Metereologia de una ciudad tiene almacenados en una tabla las estadisticas de
 temperatura y precipitaciones de varias ciudades del mundo.
*/

/*Elimine la tabla estadisticas.*/
drop table if exists estadisticas;

/*Cree la tabla eligiendo el tipo de dato adecuado siguiendo la siguiente estructura
 ciudad y pais: cadena de caracteres
 temperaturas (maxima y minima):entero desde -20 hasta 40
 precipitaciones media anual: desde 0 a 2000 aprox.
*/
create table estadisticas(
	pais varchar(25),
    ciudad varchar(25),
    temperatura_minima tinyint signed,
    temperatura_maxima tinyint signed,
    precipitaciones smallint
);

/*Problema 2 (B):
 Un instituto de física que realiza investigaciones acerca de los gases guarda en una tabla las 
 temperaturas críticas y la presión crítica de los mismos.
*/

/*Elimine la tabla "gases" si existe.*/
drop table if exists gases;

/*Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos:
 Gas: cadena
 Temperatura critica: valores decimales desde -300 hasta 400 aprox.,
 Presion critica: valores decimales positivos hasta 300px
*/
create table gases (
	gas varchar(15),
    temperatura_critica float,
    presion_Critica float
);

/*Problema 2 (C):
 Un banco tiene registrados las cuentas corrientes de sus clientes en una tabla llamada "cuentas".
*/

/*Elimine la tabla "cuentas" si existe.*/
drop table if exists cuentas;

/*Cree la tabla eligiendo el tipo de dato adecuado con la siguiente estructura:
 Número de cuenta: entero positivo, no nulo, 
 Documento del propietario de la cuenta: cadena de caracteres de 8 de longitud (siempre 8) no nulo,
 Nombre del propietario de la cuenta: cadena de caracteres,
 Saldo de la cuenta: valores positivos y anegativos altos.
*/
create table cuentas(
	numero_cuenta integer unsigned not null,
	documento_propietario char(8) not null,
	nombre_propietario varchar(20),
	saldo_cuenta float
);