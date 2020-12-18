create database practica7;
use practica7;

SET sql_mode = '';

#Ejercicio 1:

/*Problema 1: Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos
datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus 
productos.*/

/*Elimine la tabla "visitantes", si existe.*/
drop table if exists visitantes;

/*Créela con la siguiente estructura:*/
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

/*Solicite la cantidad de visitantes al stand. (10) registros.*/
select * from visitantes;

/*Muestre la suma de la compra de todos los visitantes de "Alta Gracia" (78.5)*/
select sum(montocompra) from visitantes where ciudad='Alta Gracia';

/*Muestre el valor máximo de las compras efectuadas (53.50).*/
select max(montocompra) from visitantes;

/*Muestre la edad menor de los visitantes (20).*/
select min(edad) from visitantes;

/*Muestre el promedio de edades de los visitantes (33.66).*/
select avg(edad) from visitantes;

/*Muestre el promedio del monto de compra (24.55).*/
select avg(montocompra) from visitantes;

/*Problema 2 (A): Una academia de informática dicta distintos cursos y almacena en una tabla 
llamada "inscripciones" la siguiente información: nombre del curso, documento del alumno, fecha en 
que se inscribe el alumno, monto del pago (algunos dejan una seña, otros pagan el curso completo).*/

/*Elimine la tabla, si existe.*/
drop table if exists inscripciones;

/*Cree la tabla.*/
create table inscripciones(
	nombre varchar(30),
	documento char(8),
	fechainscripto date,
	pago decimal(5,2) unsigned not null
);

/*Ingrese algunos registros:*/
insert into inscripciones 
	values('PHP básico', '22333444','2006-08-10',50);
insert into inscripciones 
	values('PHP básico', '23333444','2006-08-10',50);
insert into inscripciones 
	values('PHP básico', '24333444','2006-08-11',30);
insert into inscripciones 
	values('PHP experto', '25333444','2006-08-11',0);
insert into inscripciones 
	values('PHP experto', '26333444','2006-08-12',200);
insert into inscripciones 
	values('JavaScript básico', '22333444','2006-08-10',100);
insert into inscripciones 
	values('Operador de PC', '27333444','2006-08-12',10);
insert into inscripciones 
	values('Operador de PC', '28333444','2006-08-13',50); 
insert into inscripciones 
	values('Operador de PC', '29333444','2006-08-14',40);
insert into inscripciones 
	values('Operador de PC', '30333444','2006-08-14',0);
insert into inscripciones 
	values('Diseño web', '29333444','2006-08-14',200);
insert into inscripciones 
	values('Diseño web', '30333444','2006-08-14',0);

/*calcule la cantidad de inscriptos para el curso de "Operador de PC".*/
select count(*) from inscripciones where nombre='Operador de PC';

/*Calcule la suma recaudada por los pagos de los cursos el día "2006-08-10".*/
select sum(pago) from inscripciones where fechainscripto='2006-08-10';

/*Calcule el promedio de los pagos de los inscriptos.*/
select avg(pago) from inscripciones;

/*Muestre el máximo y el mínimo valor de pago, sin considerar quienes no pagan.*/
select max(pago),min(pago) from inscripciones where pago>0;

/*Vea en cuántos cursos se inscribió el alumno con documento "22333444" y cuánto abonó en total.*/
select count(*),sum(pago) from inscripciones where documento='22333444';

/*Problema 2 (B): Trabaje con la tabla "peliculas" de un video club.*/

/*Elimine la tabla "peliculas" si existe.*/
drop table if exists peliculas;

/*Créela con la siguiente estructura:*/
create table peliculas(
	codigo int unsigned auto_increment,
    titulo varchar(30) not null,
    actor varchar(30),
    duracion tinyint unsigned,
    primary key(codigo)
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
	values('Un oso rojo',null,100);
insert into peliculas (titulo,actor,duracion)
	values('Elsa y Fred','China Zorrilla',110);
insert into peliculas (titulo,actor,duracion)
	values('Mrs. Johns','Richard Gere',180);

/*Muestre el valor de duración más grande.*/
select max(duracion) from peliculas;

/*Muestre el promedio de duración de las películas.*/
select avg(duracion) from peliculas;

/*Cuente la cantidad de peliculas que comiencen con la cadena "Harry Potter".*/
select count(*) from peliculas where titulo like 'Harry Potter%';

/*Un socio alquiló todas las películas en las cuales trabaja "Richard Gere", quiere saber el total 
de minutos que duran todas sus películas.*/
select sum(duracion) from peliculas where actor='Richard Gere';

/*Problema 2 (C): Una concesionaria de autos vende autos usados y almacena la información en una tabla 
llamada "autos".*/

/*Elimine la tabla "autos", si existe.*/
drop table if exists autos;

create table autos(
	patente char(6),
	marca varchar(20),
	modelo char(4),
	precio decimal(8,2) unsigned,
	primary key(patente)
);

/*Ingrese los siguientes registros:*/
insert into autos
	values('ACD123','Fiat 128','1970',15000);
insert into autos
	values('ACG234','Renault 11','1990',40000);
insert into autos
	values('BCD333','Peugeot 505','1990',80000);
insert into autos
	values('GCD123','Renault Clio','1990',70000);
insert into autos
	values('BCC333','Renault Megane','1998',95000);
insert into autos
	values('BVF543','Fiat 128','1975',20000);
    
/*Muestre el valor del auto más caro y más barato.*/
select max(precio),min(precio) from autos;

/*Muestre el valor de auto más caro de 1990.*/
select max(precio) from autos where modelo='1990';

/*Muestre el promedio de los precios de los autos "Fiat 128".*/
select avg(precio) from autos where marca='Fiat 128';

/*Calcule el valor en dinero de todos los autos marca "Renault" con modelos menores a "1995".*/
select sum(precio) from autos where marca like 'Renault%' and modelo<'1995';

/*Problema 2 (D): Un comercio guarda la información de sus ventas en una tabla llamada "facturas" en la que 
registra el número de factura, la descripción de los items comprados, el precio por unidad de los 
items y la cantidad.*/

/*Elimine la tabla, si existe.*/
drop table if exists facturas;

/*Cree la tabla.*/
create table facturas(
	numero int(10) zerofill,
	descripcion varchar(30),
	precioporunidad decimal(5,2) unsigned,
	cantidad tinyint unsigned
);

/*Ingrese algunos registros:*/
insert into facturas 
	values(504,'escuadra 20 cm.',2.5,100);
insert into facturas 
	values(504,'escuadra 50 cm.',5,80);
insert into facturas 
	values(2002,'compas plastico',8,120);
insert into facturas 
	values(2002,'compas metal',15.4,100);
insert into facturas 
	values(2002,'escuadra 20 cm.',2.5,100);
insert into facturas 
	values(4567,'escuadra 50 cm.',5,200);

/*Cuente la cantidad de items de la factura número "2002".*/
select count(*) from facturas where numero=2002;

/*Sume la cantidad de productos de la factura número "2002".*/ 
select sum(cantidad) from facturas where numero=2002;

/*Muestre el total en dinero de la factura "504."*/
select sum(precioporunidad) from facturas where numero=504;

#Ejercicio 2:

/*Problema 1: Una empresa tiene registrados sus clientes en una tabla llamada "clientes".*/

/*Elimine la tabla "clientes", si existe.*/
drop table if exists clientes;

/*Créela con la siguiente estructura:*/
create table clientes (
	codigo int unsigned auto_increment,
	nombre varchar(30) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	provincia varchar (20),
	telefono varchar(11),
	primary key(codigo)
 );
 
 /*Ingrese algunos registros:*/
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba','null');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
insert into clientes (nombre,domicilio,ciudad,provincia,telefono) 
	values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745');
    
/*Obtenga el total de los registros (10).*/
select count(*) from clientes;

/*Obtenga el total de los registros que no tienen valor nulo en los teléfonos (8).*/
select count(telefono) from clientes;

/*Obtenga la cantidad de clientes agrupados por ciudad y provincia, ordenados por provincia.*/
select count(*) from clientes group by ciudad,provincia order by provincia;

/*Problema 2 (A): En una página web se solicitan los siguientes datos para guardar información de sus visitas.*/

/*Elimine la tabla "visitas", si existe.*/
drop table if exists visitas;

/*Créela con la siguiente estructura:*/
create table visitas (
	numero int unsigned auto_increment,
	nombre varchar(30) not null,
	mail varchar(50),
	pais varchar (20),
	fecha date,
	primary key(numero)
);

/*Ingrese algunos registros:*/
insert into visitas (nombre,mail,fecha)
	values ('Ana Maria Lopez','AnaMaria@hotmail.com','2006-10-10');
insert into visitas (nombre,mail,fecha)
	values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','2006-10-10');
insert into visitas (nombre,mail,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','2006-10-11');
insert into visitas (nombre,mail,fecha)
	values ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-10-12');
insert into visitas (nombre,mail,fecha)
	values ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-09-12');
insert into visitas (nombre,mail,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','2006-09-12');
insert into visitas (nombre,mail,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','2006-09-15');
    
/*Obtenga el total de visitas.*/
select count(*) from visitas;

/*Cantidad de visitas agrupadas por fecha.*/
select count(*) from visitas group by fecha;

/*Cantidad de visitas agrupadas por nombre y mes.*/
select count(*) from visitas group by nombre,month(fecha);

/*Problema 2 (B): Una empresa registra los datos de sus empleados en una tabla llamada "empleados".*/

/*Elimine la tabla "empleados" si existe.*/
drop table if exists empleados;

/*Cree la tabla.*/
 create table empleados(
	documento char(8) not null,
	nombre varchar(30) not null,
	sexo char(1),
	domicilio varchar(30),
	fechaingreso date,
	fechanacimiento date,
	sueldobasico decimal(5,2) unsigned,
	primary key(documento)
);

/*Ingrese algunos registros:*/
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
	values ('22333111','Juan Perez','m','Colon 123','1990-02-01','1970-05-10',550);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
	values ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
	values ('20111222','Hector Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
	values ('30000222','Luis Luque','m','Urquiza 456','1980-09-01','1980-03-29',700);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
	values ('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15','1965-12-22',700);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
	values ('30000234','Alberto Soto','m','Peru 232','2003-08-15','1989-10-10',420);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
	values ('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14','1976-09-21',350);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
	values ('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23','1974-05-12',390);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
	values ('30154269','Oscar Mendez','m','Colon 1245','2004-06-23','1984-05-14',300);

/*Es política de la empresa festejar cada fin de mes, los cumpleaños de todos los empleados que 
cumplen ese mes. Si los empleados son de sexo femenino, se les regala un ramo de rosas, si son de 
sexo masculino, una corbata. La secretaria de la Gerencia necesita saber cuántos ramos de rosas y 
cuántas corbatas debe comprar para el mes de mayo.*/


/*ARREGLAR*/
#select sexo,count(*) from empleados group by sexo having right(date(fechanacimiento),5)=right(current_date,5);

/*Se necesita conocer la cantidad de empleados agrupados por año de ingreso a la empresa.*/
select count(*) from empleados group by fechaingreso;

/*Problema 2 (C): Un comercio guarda la información de sus ventas en una tabla llamada "facturas" en la que 
registra el número de factura, la descripción de los items comprados, el precio por unidad de los 
items y la cantidad.*/

/*Elimine la tabla, si existe*/
drop table if exists facturas;

/*Cree la tabla.*/
 create table facturas(
	numero int(10) zerofill,
	descripcion varchar(30),	
	precioporunidad decimal(5,2) unsigned,
	cantidad tinyint unsigned
);

/*Ingrese algunos registros:*/
insert into facturas values(504,'escuadra 20 cm.',2.5,100);
insert into facturas values(504,'escuadra 50 cm.',5,80);
insert into facturas values(2002,'compas plastico',8,120);
insert into facturas values(2002,'compas metal',15.4,100);
insert into facturas values(2002,'escuadra 20 cm.',2.5,100);
insert into facturas values(4567,'escuadra 50 cm.',5,200);

/*Cuente la cantidad de items por factura.*/
select count(*) from facturas group by numero;

/*Sume la cantidad de productos de las facturas.*/
select sum(cantidad) from facturas group by numero;

/*Muestre el total en dinero de las facturas.*/
select sum(precioporunidad) from facturas group by numero;

#Ejercicio 3:

/*Problema 1: Una empresa tiene registrados sus clientes en una tabla llamada "clientes".*/

/*Elimine la tabla "clientes", si existe.*/
drop table if exists clientes;

/*Créela con la siguiente estructura:*/
create table clientes (
	codigo int unsigned auto_increment,
	nombre varchar(30) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	provincia varchar (20),
	telefono varchar(11),
	primary key(codigo)
);

/*Ingrese algunos registros.*/
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba','null');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745');
    
/*Obtenga el total de los registros agrupados por provincia.*/
select provincia,count(*) from clientes group by provincia;

/*Obtenga el total de los registros agrupados por ciudad y provincia.*/
select ciudad,provincia,count(*) from clientes group by ciudad,provincia;

/*Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen menos de 2 clientes*/
select ciudad,provincia,count(*) from clientes group by ciudad,provincia having count(*)>2;

/*Problema 2 (A): Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos 
datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus 
productos.*/

/*Elimine la tabla "visitantes", si existe.*/
drop table if exists visitantes;

/*Créela con la siguiente estructura:*/
create table visitantes(
	nombre varchar(30),
	edad tinyint unsigned,
	sexo char(1),
	domicilio varchar(30),
	ciudad varchar(20),
	telefono varchar(11),
	montocompra decimal(6,2)
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

/*Obtenga el total de las compras agrupados por ciudad y sexo.*/
select ciudad,sexo,count(*) from visitantes group by ciudad,sexo;

/*Obtenga el total de las compras agrupados por ciudad y sexo, considerando sólo las sumas 
superiores a 50 pesos..*/
select ciudad,sexo,sum(montocompra) from visitantes group by ciudad,sexo having sum(montocompra)>50;

/*Muestre el monto mayor de compra agrupado por ciudad, siempre que el valor supere los 30 pesos, 
considerando sólo los visitantes con telefono no nulo.*/
select ciudad,max(montocompra) from visitantes where telefono is not null group by ciudad having sum(montocompra)>30;

/*Agrupe por ciudad y muestre para cada grupo (ciudad) el total de visitantes, la suma de sus 
compras y el promedio de compras.*/
select ciudad,count(*),sum(montocompra),avg(montocompra) from visitantes group by ciudad;

/*Problema 2 (B): En una página web se solicitan los siguientes datos para guardar información de sus visitas.*/

/*Elimine la tabla "visitas", si existe.*/
drop table if exists visitas;

/*Créela con la siguiente estructura:*/
create table visitas (
	numero int unsigned auto_increment,
	nombre varchar(30) not null,
	mail varchar(50),
	pais varchar (20),
	puntaje tinyint unsigned,
	primary key(numero)
);

/*Ingrese algunos registros:*/
insert into visitas (nombre,mail,pais,puntaje)
	values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina',9);
insert into visitas (nombre,mail,pais,puntaje)
	values ('Gustavo Gonzalez','GustavoGGonzalez@yahoo.com','Chile',8);
insert into visitas (nombre,mail,pais,puntaje)
	values ('Juancito','JuanJosePerez@hotmail.com','Mexico',5);
insert into visitas (nombre,mail,pais,puntaje)
	values ('Fabiola Martinez','MartinezFabiolaM@hotmail.com','Chile',9);
insert into visitas (nombre,mail,pais,puntaje)
	values ('Fabiola Martinez',null,'Peru',8);
insert into visitas (nombre,mail,pais,puntaje)
	values ('Mariana Torres','MarianitaTorres','Peru',7);


/*Muestre el promedio de los puntajes agrupados por pais, considerando sólo aquellos países que 
tiene más de 1 visita.*/
select pais,avg(puntaje) from visitas group by pais having count(*)>1;

/*Muestre el promedio de los puntajes agrupados por pais, considerando sólo aquellos países cuyo 
promedio es mayor a 8.*/
select pais,avg(puntaje) from visitas group by pais having avg(puntaje)>8;

/*Problema 2 (C): Una empresa registra los datos de sus empleados en una tabla llamada "empleados".*/

/*Elimine la tabla "empleados", si existe.*/
drop table if exists empleados;

/*Cree la tabla.*/
create table empleados(
	documento char(8) not null,
	nombre varchar(30) not null,
	sexo char(1),
	domicilio varchar(30),
	fechaIngreso date,
	fechaNacimiento date,
	sueldoBasico decimal(5,2),
	primary key(documento)
);

/*Ingrese algunos registros:*/
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
	values ('22333111','Juan Perez','m','Colon 123','1990-02-01','1970-05-10',550);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
	values ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
	values ('20111222','Hector Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
	values ('30000222','Luis LUque','m','Urquiza 456','1980-09-01','1980-03-29',700);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
	values ('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15','1965-12-22',700);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
	values ('30000234','Alberto Soto','m','Peru 232','2003-08-15','1989-10-10',420);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
	values ('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14','1976-10-21',350);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
	values ('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23','1974-09-12',390);

/*La empresa festeja cada mes los cumpleaños de todos los empleados que cumplen ese mes. Queremos
saber cuántos empleados cumplen años en los meses de agosto a diciembre.*/
select month(fechanacimiento) as mes,count(*) from empleados group by mes having mes>=8;

/*Se necesita conocer la cantidad de empleados agrupados por fecha de ingreso a la empresa sólo de 
las fechas posteriores a "1990-02-01".*/
select fechaingreso,count(*) from empleados group by fechaingreso having fechaingreso>'1990-02-01';

#Ejercicio 4:

/*Problema 1: Una academia de enseñanza dicta distintos cursos de informática. Los cursos se dictan por la mañana 
o por la tarde, todos los días de lunes a viernes. La academia guarda los datos de los cursos en 
una tabla llamada "cursos" en la cual almacena el código del curso, el tema, los días de la semana 
que se dicta, el horario, por la mañana (AM) o por la tarde (PM), la cantidad de clases que incluye
cada curso (clases), la fecha de inicio y el costo del curso.*/

/*Elimine la tabla "cursos" si existe.*/
drop table if exists cursos;

/*Cree la tabla.*/
 create table cursos(
  codigo tinyint unsigned auto_increment,
  tema varchar(20) not null,
  horario char(2) not null,
  clases tinyint unsigned default 10,
  fechainicio date,
  costo decimal(5,2) unsigned,
  primary key(codigo)
);

/*Ingrese los siguientes registros:*/
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('PHP básico','AM',10,'2006-08-07',200);
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('PHP básico','PM',default,'2006-08-14',200);
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('PHP básico','AM',default,'2006-08-05',200);
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('PHP avanzado','AM',20,'2006-08-01',350);
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('JavaScript básico','PM',15,'2006-09-11',150);
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('Paginas web','PM',15,'2006-08-08',200);
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('Paginas web','AM',15,'2006-08-12',200);
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('Paginas web','AM',15,'2006-08-21',200);
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('HTML avanzado','AM',20,'2006-09-18',180);
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('HTML avanzado','PM',20,'2006-09-25',180);
insert into cursos (tema,horario,clases,fechainicio,costo)
	values('JavaScript avanzado','PM',25,'2006-09-18',150);

/*Obtenga la lista de temas de los cursos sin repetición.*/
select distinct tema from cursos;

/*Seleccione los cursos donde el tema incluya "PHP", sin repetir horario ni tema.*/
select distinct tema,horario from cursos where tema like '%PHP%';

/*Cuente la cantidad de cursos distintos agrupados por horario.*/
select horario,count(distinct tema) from cursos group by horario;

/*Problema 2 (A): Una empresa tiene registrados sus clientes en una tabla llamada "clientes".*/

/*Elimine la tabla "clientes", si existe.*/
drop table if exists clientes;

/*Créela con la siguiente estructura:*/
create table clientes (
	codigo int unsigned auto_increment,
	nombre varchar(30) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	provincia varchar (20),
	telefono varchar(11),
	primary key(codigo)
);

/*Ingrese algunos registros:*/
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba','null');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
insert into clientes (nombre,domicilio,ciudad,provincia,telefono) 
	values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
	values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745');
    
/*Muestra las distintas provincias y ciudades en las cuales la empresa tiene clientes.*/
select distinct provincia,ciudad from clientes;

/*Problema 2 (B): En una página web se solicitan los siguientes datos para guardar información de sus visitas.*/

/*Elimine la tabla "visitas", si existe.*/
drop table if exists visitas;

/*Créela con la siguiente estructura:*/
create table visitas(
	numero int unsigned auto_increment,
	nombre varchar(30) not null,
	mail varchar(50),
	pais varchar (20),
	fecha date,
	primary key(numero)
);

/*Ingrese algunos registros:*/
insert into visitas (nombre,mail,fecha)
	values ('Ana Maria Lopez','AnaMaria@hotmail.com','2006-10-10');
insert into visitas (nombre,mail,fecha)
	values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','2006-10-10');
insert into visitas (nombre,mail,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','2006-10-11');
insert into visitas (nombre,mail,fecha)
	values ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-10-12');
insert into visitas (nombre,mail,fecha)
	values ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-09-12');
insert into visitas (nombre,mail,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','2006-09-12');
insert into visitas (nombre,mail,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','2006-09-15');
insert into visitas (nombre,mail,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','2006-09-15');
    
/*Obtenga los distintos nombres de quienes visitaron la página.*/
select distinct nombre from visitas;

/*Muestre la cantidad de veces que cada persona ingresó a la página.*/
select nombre,count(nombre) from visitas group by nombre;
