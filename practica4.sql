use practica4;

#Ejercicio 1:

/*Problema 1:
 Una concesionaria de autos vende autos usados. Guarda los siguientes datos en la tabla "autos":
 - marca (fiat 128, renault 11, peugeot 505, etc.)
 - modelo (año)
 - dueño (nombre del dueño)
 - precio (valor con decimales positivo que puede llegar hasta 999999.99 aprox.).
*/

/*Elimine la tabla, si existe.*/
drop table if exists autos;

SET sql_mode = '';

/*Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos mencionados arriba.*/
create table autos(
	marca varchar(15),
    modelo year(4),
    dueño varchar(20),
    precio float(8,2)
);

/*Ingrese los siguientes valores:
   insert into autos values('Fiat 128','1970','Juan Lopez',50000);
   insert into autos values('Renault 11','1990','Juan Lopez',80000);
   insert into autos values('Fiat 128','1971','Ana Ferreyra',51000);
   insert into autos values('Peugeot 505','1998','Luis Luque',99000);
   insert into autos values('Peugeot 505','1997','Carola Perez',85000);
*/
insert into autos values('Fiat 128','1970','Juan Lopez',50000);
insert into autos values('Renault 11','1990','Juan Lopez',80000);
insert into autos values('Fiat 128','1971','Ana Ferreyra',51000);
insert into autos values('Peugeot 505','1998','Luis Luque',99000);
insert into autos values('Peugeot 505','1997','Carola Perez',85000);

/*Seleccione todos los autos cuyo modelo sea menor a "1995".*/
select * from autos where modelo<'1995';

/*Muestre la marca y modelo de los autos que no sean de "1970"*/
select marca, modelo from autos where modelo<>'1970';

/*Ingrese un auto con el valor para "modelo" de tipo numerico*/
insert into autos values('Peugeot 505',1995,'Carola Perez',75000);

/*Problema 2:
 Una empresa almacena los datos de sus empleados en una tabla "empleados".
*/

/*Elimine la tabla, si existe.*/
drop table if exists empleados;

/*Cree la tabla eligiendo el timpo de dato adecuado para cada campo.*/
create table empleados(
	nombre varchar(20),
    documento char(8),
    sexo char(1),
    domicilio varchar(30),
    fechaingreso date
);

/*Ingrese algunos registros:
  'Juan Perez','22333444','m','Colon 123','1990-10-08'
  'Ana Acosta','23333444','f','Caseros 987','1995-12-18'
  'Lucas Duarte','25333444','m','Sucre 235','2005-05-15'
  'Pamela Gonzalez','26333444','f','Sarmiento 873','1999-02-12
  'Marcos Juarez','30333444','m','Rivadavia 801','2002-09-22'
*/
insert into empleados values('Juan Perez','22333444','m','Colon 123','1990-10-08');
insert into empleados values('Ana Acosta','23333444','f','Caseros 987','1995-12-18');
insert into empleados values('Lucas Duarte','25333444','m','Sucre 235','2005-05-15');
insert into empleados values('Pamela Gonzalez','26333444','f','Sarmiento 873','1999-02-12');
insert into empleados values('Marcos Juarez','30333444','m','Rivadavia 801','2002-09-22');

/*seleccione todos los datos de los empleados que ingresaron a la empresa antes del 2000.*/
select * from empleados where fechaingreso<='2000-00-00';

/*Muestre solo el nomre y la fecha de ingreso de los empleados de sexo masculino.*/
select nombre, fechaingreso from empleados where sexo='m';

/*Modifique la fecha de ingreso del empleado con el documento "22333444" a "1990-10-18."*/
update empleados set fechaingreso='1990-10-18' where documento='22333444';

/*Ingrese un empleado con valor para "fechaingreso" en la cual coloque 2 digitos correspondiente
al año.*/
insert into empleados values('Susana Duarte','30123456','f','Sucre 1234','99-02-12');

/*Ingrese un empleado colocando un  solo digito en la parte de la fecha correspondiente al mes
y dia.*/
insert into empleados values('Daniel Herrero','30000001','m',null,'1980-2-3');

/*Ingrese una fecha de ingreso sin separadores.*/
insert into empleados values('Ana Juarez','31123123','f',null,'19900306');

/*Ingrese un valor de tipo fecha y hora (solo alamcena la parte de la fecha).*/
insert into empleados values('Juan Mores','32222333','m',null,'1990-03-06 00:10:15');

/*Ingrese un valor que MySql no reconozca como fecha (almacenara ceros).*/
insert into empleados values('Hector Perez','34444555','m',null,'1990036');

#Ejercicio 2:

/*Problema 1:
 Trabaje con la tabla que almacena los datos sobre peliculas, llamada "peliculas".
*/

/*Elimine la tabla, si existe.*/
drop table if exists peliculas;

/*Creela con la siguiente estructura:
 -codigo (entero sin signo, autoincrementable),
 -titulo (cadena de 30, not nulo),
 -actor (cadena de 20),
 -duracion (entero positivo hasta 200 apox.),
 -clave primaria (codigo).
*/
create table peliculas(
	codigo integer unsigned auto_increment,
    titulo varchar(30) not null,
    actor varchar(30),
    duracion tinyint unsigned,
    primary key (codigo)
);

/*Agregue los siguientes registros para ver como guarda MySql los valores no ingresados:
 'Mision imposible','Tom Cruise',120
  5,90
  'Harry Potter y la piedra filosofal','Daniel R.'
  'Harry Potter y la piedra filosofal','Daniel R.',120
*/
 insert into peliculas (titulo,actor,duracion)
	values('Mision imposible','Tom Cruise',120);
 insert into peliculas (codigo,duracion)
	values(5,90);
 insert into peliculas (titulo,actor) 
	values ('Harry Potter y la piedra filosofal','Daniel R.');
 insert into peliculas (titulo,actor,duracion) 
	values ('Harry Potter y la piedra filosofal','Daniel R.',120);
    
/*Seleccione todos los datos de las películas para ver cómo guardó MySQL los valores no 
 ingresados.
 
 -En el primer registro ingresado, en el campo "codigo" ingresará "1", el primer valor
  para campos "auto_increment". 
 -En el segundo registro ingresado se almacena una cadena vacía para 
  el título y el valor "null" para el actor. 
 -En el tercer registro guarda "6" en "codigo", el siguiente valor de la secuencia tomando 
  el valor más alto y en "duracion" almacena "0". 
 -En el cuarto registro sigue la secuencia del código.
*/
select * from peliculas;

/*Problema 2:
 Una empresa almacena los datos de sus empleados en una tabla "empleados".
*/

/*Elimine la tabla, si existe.*/
drop table if exists empleados;

/*Cree la tabla empleados.*/
create table empleados(
  nombre varchar(20),
  documento char(8) not null,
  sexo char(1),
  domicilio varchar(30),
  fechaingreso date not null,
  fechanacimiento date,
  sueldo decimal(5,2) unsigned not null
);

/*Agregue los siguientes registros para ver cómo guarda MySQL los valores no ingresados:
  Marcela Medina','22333444','f';
  Avellaneda 200','2005-08-16';
 '1970-09-26',500.90);
*/
insert into empleados (nombre,documento,sexo)
  values('Marcela Medina','22333444','f');
insert into empleados (domicilio,fechaingreso)
  values('Avellaneda 200','2005-08-16');
insert into empleados (fechanacimiento,sueldo)
  values('1970-09-26',500.90);
  
/*Seleccione todos los datos de los empleados para ver cómo guardó MySQL los valores no ingresados.*/
select * from peliculas;

#Ejercicio 3:

/*Problema 1:
 Una empresa registra los datos de sus empleados en una tabla llamada "empleados".
*/
 
/*Elimine la tabla "empleados", si existe.*/
drop table if exists empleados;
 
/*Cree la tabla:*/
create table empleados(
	documento char(8) not null,
	nombre varchar(30) not null,
	domicilio varchar(30),
	fechaingreso date not null,
	fechanacimiento date,
	primary key(documento)
);

/*Intente ingresar la fecha "20-10-2005" para la fecha de ingreso (Almacena ceros).*/
insert into empleados (documento,fechaingreso,fechanacimiento)
	values('22333444','20-10-2005',null);
    
/*Intente almacenar "null" en "fechaingreso" (muestra error).*/
insert into empleados (documento,fechaingreso,fechanacimiento)
	values('22333445',null,'2005-10-10');

/*Intente almacenar valores nulos en los campos "documento" y "nombre".*/
insert into empleados (documento,nombre,fechaingreso,fechanacimiento)
	values(null,null,'2005-10-10','1995-10-10');

/*Almacene un valor numerico en un campo de tipo caracter.*/
insert into empleados (documento,fechaingreso,fechanacimiento)
	values(7280456,'2005-10-10','1995-10-10');
    
/*Almacene en "documento" el valor "22.345.678".*/
insert into empleados (documento)
	values ("22.345.678");

/*Problema 2:
 Trabaje con la tabla que almacena los datos sobre peliculas, llamada "peliculas".
*/

/*Elimine la tabla, si existe*/
drop table if exists peliculas;

/*Cree la tabla con la siguiente estructura:
  codigo int unsigned auto_increment,
  titulo varchar(15) not null,
  actor varchar(20),
  duracion tinyint unsigned,
  primary key (codigo)
*/
create table peliculas(
  codigo int unsigned auto_increment,
  titulo varchar(15) not null,
  actor varchar(20),
  duracion tinyint unsigned,
  primary key (codigo)
);

/*Ingrese el siguiente registro:
 -10,'Mision imposible','Tom Cruise',120
*/
insert into peliculas values (-10,'Mision imposible','Tom Cruise',120);

/*Muestre los registros para ver que valor se guardo en "codigo".*/
select * from peliculas;

/*Intente ingresar el siguiente registro (error por clave duplicada)*/
insert into peliculas values (1,'Mision imposible','Tom Cruise',120);

/*Intente ingresar el siguiente registro:
  null,'Mision imposible 2','Tom Cruise',120
*/
insert into peliculas values (null,'Mision imposible 2','Tom Cruise',120);

/*Muestre los registros para ver qué valor se guardó en "codigo".*/
select * from peliculas;

/*Intente ingreser el siguiente registro (No ingresa porque titulo no admite valores nulos):
 3,null,'Tom Cruise',120
*/
insert into peliculas values (3,null,'Tom Cruise',120);

/*Ingrese el siguiente registro:
 5,'Harry Potter y la camara secreta','Daniel R.',150
*/
insert into peliculas values (5,'Harry Potter y la camara secreta','Daniel R.',150);

/*Muestre los registros para ver que se almaceno en "titulo" (cadena cortada).*/
select * from peliculas;

/*Ingrese el siguiente registro:
 10,'Elsa y Fred','China Zorrilla',12345
*/
insert into peliculas values (10,'Elsa y Fred','China Zorrilla',12345);

/*Muestre los registros para ver qué se almacenó en "duración" (el valor límite permitido por el rango más cercano al ingresado).*/
select * from peliculas;

#Ejercicio 4:

/*Problema 1:
 Un comercio que envía pizzas y empanadas a domicilio registra los pedidos diariamente en una tabla llamada "pedidos" con los siguientes datos:
 - numero de pedido, autoincrementable, entero positivo comienza en 1 y menor a 200 aprox.
 - nombre: pizza o empanada, por defecto "empanada",
 - tipo: por ejemplo, si es pizza: especial, muzarela, etc., si son empanadas: arabes, pollo, jamón y queso, criollas, etc.
 - precio: precio por unidad, valor con decimales que no supera los $99.99 y será siempre mayor a 0, por defecto "1",
 - cantidad: cantidad de articulos, entero positivo desde 1 e inferior a 200 aprox., por 
   defecto "12"
 - domicilio del cliente.
*/

/*Elimine la tabla "pedidos", si existe.*/
drop table if exists pedidos;

/*Cree la tabla eligiendo el tipo de dato adecuado para cada campo*/
create table pedidos(
	numero_pedido tinyint unsigned  auto_increment,
    nombre varchar(8) default 'empanada', 
    tipo varchar (8),
    precio float(4,2) unsigned default 1,
    cantidad tinyint unsigned default 12,
	domicilio_cliente varchar(25),
    primary key (numero_pedido)
);

/*Inserte los siguientes registros:
 'piza','muzarela','4.00',3,'Sarmiento 235'
 'arabe','1.00',24,'Urquiza 296'
 'empanada','salteña','Colon 309'
 'arabe'  ,'San Martin 444''arabe','San Martin 444'
 'piza','especial','4.00','Avellaneda 395'
*/
insert into pedidos (nombre,tipo,precio,cantidad,domicilio)
	values('piza','muzarela','4.00',3,'Sarmiento 235');
insert into pedidos (tipo,precio,cantidad,domicilio)
	values('arabe','1.00',24,'Urquiza 296');
insert into pedidos (nombre,tipo,domicilio)
	values('empanada','salteña','Colon 309');
insert into pedidos (tipo,domicilio)
	values('arabe','San Martin 444');
insert into pedidos (nombre,tipo,precio,domicilio)
	values('piza','especial','4.00','Avellaneda 395');

/*Muestre todos los campos de todos los pedidos para ver como se guardaron los datos no ingresados.*/
select * from pedidos;

#Ejercicio 5

/*Problema 1:
 Un banco tiene registradas las cuentas corrientes de sus clientes en una tabla llamada "cuentas".
*/

/*Elimine la tabla, si existe.*/
drop table if exists cuentas;

/*Cree la tabla con la siguiente estructura:
  create table cuentas(
  numero int(8) zerofill auto_increment,
  documento char(8) not null,
  nombre varchar(30),
  saldo decimal(9,2),
  primary key(numero)
*/
create table cuentas(
	numero int(8) zerofill auto_increment,
	documento char(8) not null,
	nombre varchar(30),
	saldo decimal(9,2),
	primary key(numero)
);

/*Visualice la estructura de la tabla; note que en la columna que muestra el tipo aparece "zerofill" en el campo numero.*/
describe cuentas;

/*Ingrese los siguientes registros:
 1234,'22333444','Juan Perez',2000.60
 2566,'23333444','Maria Pereyra',5050
 5987,'24333444','Marcos Torres',200
 14434,'25333444','Ana Juarez',8000.60
*/
insert into cuentas (numero,documento,nombre,saldo)
	values(1234,'22333444','Juan Perez',2000.60);
insert into cuentas (numero,documento,nombre,saldo)
	values(2566,'23333444','Maria Pereyra',5050);
insert into cuentas (numero,documento,nombre,saldo)
	values(5987,'24333444','Marcos Torres',200);
insert into cuentas (numero,documento,nombre,saldo)
	values(14434,'25333444','Ana Juarez',8000.60);

/*Vea como se guardaron los numeros de cuenta.*/
select * from cuentas;

/*ingrese un valor negativo para el numero de cuenta; note que no lo toma y sigue la secuencia*/
insert into cuentas (numero,documento,nombre,saldo)
	values(-1234,'27333444','Luis Duarte',2800);
    
/*Problema 2
 Trabaje con la tabla que almacena los datos sore peliculas, llamada "peliculas".
*/

/*Elimine la tabla si existe*/
drop table if exists peliculas;

/*Creela con la siguiente estructura:
  codigo int(4) zerofill auto_increment,
  titulo varchar(30) not null,
  actor varchar(20),
  duracion tinyint zerofill default 90,
  primary key (codigo)
*/
create table peliculas(
	codigo int(4) zerofill auto_increment,
	titulo varchar(30) not null,
	actor varchar(20),
	duracion tinyint zerofill default 90,
	primary key (codigo)
);

/*Vea la estructura de la tabla.*/
describe peliculas;

/*Ingrese algunos registros.*/
insert into peliculas (titulo, actor, duracion)values ('Spider-man homecoming','Tom Holland',120);

/*Ingrese un valor de codigo negativo.*/
insert into peliculas values (-1,'Spider-man homecoming','Tom Holland',120);

/*Ingrese un valor de duracion negativa*/
insert into peliculas (titulo, actor, duracion) values ('Spider-man homecoming','Tom Holland',-120);