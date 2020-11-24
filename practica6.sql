create database practica6;
use practica6;

SET sql_mode = '';

#Ejercicio 1:

/*Problema 1: Trabaje con la tabla "medicamentos" de una farmacia.*/

/*Elimine la tabla, si existe.*/
drop table if exists medicamentos;

/*Cree la tabla con la siguiente estructura:*/
create table medicamentos(
	codigo int unsigned auto_increment,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(5,2),
	cantidad int unsigned,
	primary key(codigo)
);

/*Visualice la estructura de la tabla "medicamentos"*/
describe medicamentos;

/*Ingrese los siguientes registros:*/
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Paracetamol 500','Bago',1.90,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Bayaspirina','Bayer',2.10,150); 
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Amoxidal jarabe','Bayer',5.10,250);

/*Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio 
sea menor a 5.*/
select codigo,nombre from medicamentos where laboratorio='Roche' and precio=5;

/*Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5.*/
select codigo,nombre from medicamentos where laboratorio='Roche' or precio=5;

/*Muestre todos los registros que no sean de "Bayer" usando el operador "not".*/
select * from medicamentos where not laboratorio='Bayer';

/*Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100.*/
select * from medicamentos where not laboratorio='Bayer' and cantidad=100;

/*Muestre todos los medicamentos cuyo laboratorio sea 'Bayer' y cuya cantidad NO sea 100.*/
select * from medicamentos where laboratorio='Bayer' and not cantidad=100;

/*Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10*/
delete from medicamentos where laboratorio='Bayer' and precio>10;

/*Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5*/
update medicamentos set cantidad=200 where laboratorio='Roche' and precio>5;

/*Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3. Antes veamos 
cuáles cumplen con la condición, los registros 5 y 6 son de "Bayer, cumplen con la primera 
condición, los registros 4 y 5 cumplen con la segunda condición, es decir, se borrarán 3 registros: 
el 4 porque cumple con la segunda condición, el 5 porque cumple con ambas y el 6 porque cumple con 
la primera.*/
delete from medicamentos where laboratorio='Bayer' or precio<3;

/*Problema 2 (A): Trabajamos con la tabla "Peliculas" de un video club que alquila peliculas en video*/

/*Elimine la tabla, si existe*/
drop table if exists peliculas;

/*Créela con la siguiente estructura:*/
create table peliculas(
	codigo int unsigned auto_increment,
    titulo varchar(30),
    actor varchar(20),
    duracion tinyint unsigned,
    primary key (codigo)
);

/*Ingrese los siguientes registros:*/
insert into peliculas (titulo,actor,duracion)
	values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
	values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas (titulo,actor,duracion)
	values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas (titulo,actor,duracion)
	values('Mision imposible 2','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
	values('Mujer bonita','Richard Gere',120);
insert into peliculas (titulo,actor,duracion)
	values('Tootsie','D. Hoffman',90);
insert into peliculas (titulo,actor,duracion)
	values('Un oso rojo','Julio Chavez',100);
insert into peliculas (titulo,actor,duracion)
	values('Elsa y Fred','China Zorrilla',110);
    
/*Recupere los registros cuyo actor sea "Tom Cruise" or "Richard Gere".*/
select * from peliculas where (actor='Tom Cruise') or (actor='Richard Gere');

/*Recupere los registros cuyo actor sea "Tom Cruise" y "Richard Gere".*/
select * from peliculas where (actor='Tom Cruise') and (actor='Richard Gere');

/*Cambie la duracion a 200, de las peliculas cuyo actor sea "Daniel R." y cura duracion sea 180.*/
update peliculas set duracion=200 where (actor='Daniel R.') and (duracion=180);

/*Borre todas las películas donde el actor NO sea "Tom Cruise" y cuya duración sea mayor o igual a 
100.*/
delete from peliculas where not (actor='Tom Cruise') and (duracion>=100);

/*Problema 2 (B): En una página web se solicitan los siguientes datos para guardar información de sus visitas:
nombre, mail, pais.*/

/*Elimine la tabla "visitas", si existe.*/
drop table if exists visitas;

/*Créela con la siguiente estructura:*/
create table visitas(
	numero int unsigned auto_increment,
	nombre varchar(30) not null,
	mail varchar(50),
	pais varchar (20),
	fecha datetime,
	primary key(numero)
);

/*Ingrese algunos registros:*/
insert into visitas (nombre,mail,pais,fecha)
	values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
insert into visitas (nombre,mail,pais,fecha)
	values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
insert into visitas (nombre,mail,pais,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
insert into visitas (nombre,mail,pais,fecha)
	values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
insert into visitas (nombre,mail,pais,fecha)
	values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
insert into visitas (nombre,mail,pais,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
insert into visitas (nombre,mail,pais,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
    
/*Muestre los datos de las visitas de "Argentina" que hayan ingresado después del mes de 
septiembre (9).*/
select * from visitas where month(fecha)>'09';

/*Elimine todos los registros cuyo pais no sea "Mexico" y que hayan visitado la página antes de 
las 16 hs.*/
delete from visitas where not (pais='Mexico') and (hour(fecha)<'16');

#Ejercicio 2:

/*Problema 1: Trabaje con la tabla llamada "medicamentos" de una farmacia.*/

/*Elimine la tabla, si existe.*/
drop table if exists medicamentos;

/*Cree la tabla con la siguiente estructura:*/
create table medicamentos(
	codigo int unsigned auto_increment,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(5,2) unsigned,
	cantidad int unsigned,
	primary key(codigo)
);

/*Visualice la estructura de la tabla "medicamentos".*/
describe medicamentos;

/*Ingrese los siguientes registros:*/
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Paracetamol 500','Bago',1.90,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Bayaspirina','Bayer',2.10,150); 
insert into medicamentos (nombre,laboratorio,precio,cantidad)
	values('Amoxidal jarabe','Bayer',5.10,250); 
    
/*Recupere los nombres y precios de los medicamentos cuyo precio esté entre 5 y 15.*/
select nombre,precio from medicamentos where precio between 20 and 40;

/*Seleccione los registros cuyo laboratorio sea "Bayer" o "Bago".*/
select * from medicamentos where laboratorio='Bayer' or laboratorio='Bago';

/*Elimine los registros cuya cantidad esté entre 100 y 200.*/
delete from medicamentos where cantidad between 100 and 200;

/*Problema 2: Una concesionaria de autos vende autos usados y almacena la información en una tabla
llamada "autos".*/

/*Elimine la tabla "autos" si existe.*/
drop table if exists autos;

/*Cree la tabla con la siguiente estructura*/
create table autos(
	patente char(6),
	marca varchar(20),
	modelo char(4),
	precio decimal(8,2) unsigned,
	primary key(patente)
);

/*Ingrese los siguientes registros:*/
insert into autos(patente,marca,modelo,precio)
	values('ACD123','Fiat 128','1970',15000);

insert into autos(patente,marca,modelo,precio)
	values('ACG234','Renault 11','1990',40000);

insert into autos(patente,marca,modelo,precio)
	values('BCD333','Peugeot 505','1990',80000);

insert into autos(patente,marca,modelo,precio)
	values('GCD123','Renault Clio','1990',70000);

insert into autos(patente,marca,modelo,precio)
	values('BCC333','Renault Megane','1998',95000);

insert into autos(patente,marca,modelo,precio)
	values('BVF543','Fiat 128','1975',20000);

/*Seleccione todos los autos cuyo año sea '1970' o '1975' usando el operador "in".*/
select * from autos where modelo in ('1970','1975');

/*Seleccione todos los autos cuyo precio esté entre 50000 y 100000.*/
select * from autos where precio between 50000 and 100000;

#Ejercicio 3:

/*Problema 1: Trabaje con la tabla llamada "medicamentos" de una farmacia.*/

/*Elimine la tabla, si existe*/
drop table if exists medicamentos;

/*Cree la tabla con la siguiente estructura:*/
create table medicamentos(
	codigo int unsigned auto_increment,
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio decimal(6,2) unsigned,
	cantidad int unsigned,
	primary key(codigo)
);

/*Visualice la estructura de la tabla "medicamentos"*/
describe medicamentos;

/*Ingrese los siguientes registros:*/
insert into medicamentos (nombre, laboratorio,precio)
	values('Sertal gotas','Roche',5.2);
insert into medicamentos (nombre, laboratorio,precio)
	values('Buscapina','Roche',4.10);
insert into medicamentos (nombre, laboratorio,precio)
	values('Amoxidal 500','Bayer',15.60);
insert into medicamentos (nombre, laboratorio,precio)
	values('Paracetamol 500','Bago',1.90);
insert into medicamentos (nombre, laboratorio,precio)
	values('Bayaspirina','Bayer',2.10); 
insert into medicamentos (nombre, laboratorio,precio)
	values('Amoxidal jarabe','Bayer',5.10); 
insert into medicamentos (nombre, laboratorio,precio)
	values('Sertal compuesto','Bayer',5.10); 
insert into medicamentos (nombre, laboratorio,precio)
	values('Paracetamol 1000','Bago',2.90);
insert into medicamentos (nombre, laboratorio,precio)
	values('Amoxinil','Roche',17.80);
    
/*Recupere los medicamentos cuyo nombre comiencen con "Amox".*/
select * from medicamentos where nombre like 'Amox%';

/*Recupere los medicamentos "Paracetamol" cuyo precio sea menor a 2.*/
select * from medicamentos where nombre='Paracetamol' and precio<2;

/*Busque todois los medicamentos cuyo precio tenga .10 centavos.*/
select * from medicamentos where precio like '%.10';

/*Muestre todos los medicamentos que no contengan la cadena "compuesto"*/
select * from medicamentos where nombre not like '%compuesto%';

/*Elimine todos los registros cuyo laboratorio contenga la letra "y"*/
delete from medicamentos where nombre like '%y%';

/*Cambie el precio por 5, al "Paracetamol" cuyo precio es mayor a 2.*/
update medicamentos set precio=5 where nombre like 'Paracetamol%';

/*Problema 2 (A): Trabaje con la tabla "peliculas" de un video club.*/

/*Elimine la tabla, si existe.*/
drop table if exists peliculas;

/*Créela con la siguiente estructura*/
create table peliculas(
	codigo int unsigned auto_increment,
    titulo varchar(30) not null,
    actor varchar(20),
    duracion tinyint unsigned,
    primary key (codigo)
);

/*Visualice la estructura de la tabla peliculas.*/
describe peliculas;

/*Ingrese los siguientes registros:*/
insert into peliculas (titulo,actor,duracion)
	values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)  
	values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas (titulo,actor,duracion)
	values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas (titulo,actor,duracion)
	values('Mision imposible 2','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
	values('Mujer bonita','Richard Gere',120);
insert into peliculas (titulo,actor,duracion)
	values('Tootsie','D. Hoffman',90);
insert into peliculas (titulo,actor,duracion)
	values('Un oso rojo',null,100);
insert into peliculas (titulo,actor,duracion)
	values('Elsa y Fred','China Zorrilla',110);
insert into peliculas (titulo,actor,duracion)
	values('Mrs. Johns','Richard Gere',180);
    
/*Actualice el valor del campo "actor" cambiando por 'R. Gere- J. Roberts', de la película cuyo 
código es 5.*/
update peliculas set actor='R. Gere- J. Roberts' where codigo=5;

/*Seleccione todas las peliculas en las cuales trabaje el actor "Gere". Use "like".*/
select * from peliculas where actor like '%Gere%';

/*Recupere los registros que NO contengan la letra "y" en el título y contenga "ch" en el 
campo "actor".*/
select * from peliculas where titulo not like 'y' and actor like '%ch%';

/*Seleccione las películas que comiencen con "M" y cuya duración sea menor a 150.*/
select * from peliculas where titulo like 'M%' and duracion<150;

/*Cambie el valor de la duración a 100 en las películas en las cuales el campo "actor" comience 
con "D".*/
update peliculas set duracion=100 where actor like 'D%';

/* Recupere los registros que cumplan la condición del punto anterior, para verificar el cambio de 
la duración.*/
select * from peliculas where duracion=100 and actor like 'D%';

/*Vea si existen peliculas con titulos nulos.*/
select * from peliculas where titulo=null;

/*Vea si existen peliculas con valor nulo en el campo "actor".*/
select * from peliculas where actor is null;

/*Problema 2 (B): Trabaje con la tabla "usuarios" que almacena el nombre y clave de cada usuario.*/

/*Elimine la tabla, si existe.*/
drop table if exists usuarios;

/*Créela con la siguiente estructura:*/
create table usuarios(
	nombre varchar(20),
    clave varchar(10),
    primary key (clave)
);

/*Visualice la estructura de la tabla "usuarios".*/
describe usuarios;

/*Ingrese los siguientes registros:*/
insert into usuarios (nombre, clave) values ('Leonardo','payaso');
insert into usuarios (nombre, clave) values ('MarioPerez','Marito');
insert into usuarios (nombre, clave) values ('Marcelo','River');
insert into usuarios (nombre, clave) values ('Gustavo','Boca');
insert into usuarios (nombre, clave) values ('MarcosMercado','RealMadrid');
insert into usuarios (nombre, clave) values ('Susana','chapita');
insert into usuarios (nombre, clave) values ('Gonzalo','Z80');
insert into usuarios (nombre, clave) values ('GustavoPereyra','RealMMadrid');

/*Busque los registros cuya clave contenga sólo 5 letras.*/
select * from usuarios where clave regexp '^.....$';

/*Busque los registros cuyo nombre de usuario termine con "o".*/
select * from usuarios where nombre like '%o';

#Ejercicio 4:

/*Problema: Trabaje con la tabla "agenda" que registra la informacion referente a sus amigos.*/

/*Elimine la tabla, si existe.*/
drop table if exists agenda;

/*Cree la tabla con la siguiente estructura:*/
create table agenda(
	apellido varchar(30),
	nombre varchar(20) not null,
	domicilio varchar(30),
	telefono varchar(11),
	mail varchar(30)
 );
 
 /*Ingrese los siguientes registros:*/
insert into agenda 
	values('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
insert into agenda 
	values('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
insert into agenda 
	values('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
insert into agenda 
	values('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
insert into agenda 
	values('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
insert into agenda 
	values('Ferreyra','Patricia','Colon 1534','4585858',null);
insert into agenda 
	values('Perez','Susana','San Martin 333',null,null);
insert into agenda 
	values('Perez','Luis','Urquiza 444','0354545256','perezluisalberto@hotmail.com');
insert into agenda 
	values('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');
    
/*Busque todos los mails que contengan la cadena "gmail".*/
select mail from agenda where mail regexp 'gmail';

/*Busque los nombres que no tienen "z" ni "g".*/
select nombre from agenda where nombre not like 'z' and nombre not like 'g';

/*Busque los apellidos que tienen por lo menos una de las letras de la "v" hasta la "z"*/
select apellido from agenda where apellido regexp '[v-z]';

/*Seleccione todos los apellidos que terminen en "ez"*/
select apellido from agenda where apellido like '%ez';

/*Seleccione los apellidos, nombres y domicilios de los amigos cuyos apellidos contengan 2 letras "i".*/
select apellido, nombre, domicilio from agenda where apellido regexp 'i.*i';

/*Seleccione los teléfonos que tengan 7 caracteres exactamente.*/
select telefono from agenda where telefono regexp '^.......$';

/*Seleccione el nombre y mail de todos los amigos cuyos mails tengan al menos 20 caracteres.*/
select nombre,mail from agenda where mail regexp '....................';

#Ejercicio 5:

/*Problema 1: Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos 
datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus 
productos.*/

/*Elimine la tabla, si existe.*/
drop table if exists visistantes;

/*Créela con la siguiente estructura.*/
create table visitantes(
	nombre varchar(30),
	edad tinyint unsigned,
	sexo char(1),
	domicilio varchar(30),
	ciudad varchar(20),
	telefono varchar(11),
	montocompra decimal (6,2) unsigned
);

/*Ingrese algunos registros:*/
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
	values ('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
	values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
	values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
	values ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
	values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
	values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
	values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
	values ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
	values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
	values ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);

/*Solicite la cantidad de visitantes al stand.*/
select count(*) from visitantes;

/*Solicite la cantidad de visitantes que tienen teléfono (valor no nulo).*/
select count(*) from visitantes where telefono is not null;

/*Muestre la cantidad de visitantes de sexo masculino que acudieron al stand (3).*/
select count(*) from visitantes where sexo='m';

/*Muestre la cantidad de mujeres mayores de 25 años que acudieron al stand (4).*/
select count(*) from visitantes where sexo='f' and edad>25;

/*Muestre la cantidad de visistantes que no son de "Cordoba" (5).*/
select count(*) from visitantes where ciudad<>'Cordoba';

/*Muestre la cantidad de visitantes que realizaron alguna compra (7).*/
select count(*) from visitantes where montocompra>=1;

/*Muestre la cantidad de visitantes que no realizaron compras (3).*/
select count(*) from visitantes where montocompra=0;

/*Problema 2 (A): Una pequeña biblioteca de barrio registra los préstamos de sus libros en una tabla 
llamada "prestamos".*/

/*Elimine la tabla "prestamos", si existe.*/
drop table if exists prestamos;

/*Cree la tabla:*/
create table prestamos(
	titulo varchar(40) not null,
	documento char(8) not null,
	fechaprestamo date not null,
	fechadevuelto date
);

insert into prestamos (titulo,documento,fechaprestamo,fechadevuelto)
	values ('Manual de 1 grado','23456789','2006-07-10','2006-07-12');
insert into prestamos (titulo,documento,fechaprestamo,fechadevuelto)
	values ('El aleph','22245679','2006-07-15',null);
insert into prestamos (titulo,documento,fechaprestamo,fechadevuelto)
	values ('Alicia en el pais de las maravillas','24456789','2006-07-20','2006-07-22');
insert into prestamos (titulo,documento,fechaprestamo,fechadevuelto)
	values ('Manual de biologia','25456789','2006-08-14',null);
insert into prestamos (titulo,documento,fechaprestamo,fechadevuelto)
	values ('Manual de geografia 5 grado','27456789','2006-08-21','2006-08-25');
insert into prestamos (titulo,documento,fechaprestamo,fechadevuelto)
	values ('Antologia poetica','28456789','2006-08-26','2006-08-27');
insert into prestamos (titulo,documento,fechaprestamo,fechadevuelto)
	values ('Manual de 1 grado','23456789','2006-08-26','2006-08-28');
insert into prestamos (titulo,documento,fechaprestamo,fechadevuelto)
	values ('Manual de 1 grado','30456789','2006-09-01','2006-09-03');
    
/*Cuente la cantidad de veces que se prestó el libro "Manual de 1 grado".*/
select count(*) from prestamos where titulo='Manual de 1 grado';

/*Cuente la cantidad de libros devueltos (contando por fechadevuelto)*/
select count(fechadevuelto) from prestamos;

/*Cuente la cantidad de veces que se le prestaron libros a la persona con documento "23456789".*/
select count(*) from prestamos where documento='23456789';

/*Cuente la cantidad de libros prestados en el mes de agosto.*/
select count(*) from prestamos where month(fechaprestamo)='08';

/*Problema 2 (B): Trabaje con la tabla "agenda" que registra la informacion referente a sus amigos.*/

/*Elimine la tabla, si existe.*/
drop table if exists agenda;

/*Cree la tabla con la siguiente estructura.*/
create table agenda( 
	apellido varchar(30),
	nombre varchar(20) not null,
	domicilio varchar(30),
	telefono varchar(11),
	mail varchar(30)
);

/*Ingrese los siguientes registros:*/
insert into agenda 
	values('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
insert into agenda 
	values('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
insert into agenda 
	values('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
insert into agenda 
	values('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
insert into agenda 
	values('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
insert into agenda 
	values('Ferreyra','Patricia','Colon 1534','4585858',null);
insert into agenda 
	values('Perez','Susana','San Martin 333',null,null);
insert into agenda 
	values('Perez','Luis','Urquiza 444','0354545256','perezluisalberto@hotmail.com');
insert into agenda 
	values('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');

/*Cuente cuántos de sus amigos tienen mail.*/
select count(*) from agenda where mail is not null;

/*Cuente cuántos de sus amigos tienen teléfono.*/
select count(*) from agenda where telefono is not null;

/*Cuente cuántos se apellidan "Perez".*/Créela
select count(*) from agenda where apellido='Perez';