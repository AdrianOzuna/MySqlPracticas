create database practica11;
use practica11;

#Problema propuesto 11

/*Problema: Trabaje con la tabla "alumnos" en el cual un instituto de enseñanza guarda los datos de sus alumnos.*/

/*Elimine la tabla "alumnos", si existe.*/
drop table if exists alumnos;

/*Cree la tabla:*/
create table alumnos(
	legajo int unsigned auto_increment,
	nombre varchar(30),
	documento char(8) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	provincia varchar(20),
	primary key(legajo)
);

/*Vea los indices de la tabla.*/
show index from alumnos;

/*Agregue un indice comun por los campos "ciudad" y "provincia" (que puedan repetirse)*/
alter table alumnos
	add index i_ubicacion(ciudad,provincia);

/*Agregue un índice único (no pueden repetirse los valores) por el campo "documento":*/
alter table alumnos
	add unique index i_documento(documento);
    
/*Visualice los indices:*/
show index from alumnos;

/*Otros problemas: Una clínica registra las consultas de los pacientes en una tabla llamada "consultas".*/

/*Elimine la tabla, si existe.*/
drop table if exists consultas;

/*Cree la tabla con una clave primaria compuesta (fecha y numero de consulta).*/
create table consultas(
	fecha date,
	numero int unsigned,
	documento char(8) not null,
	obrasocial varchar(30),
	medico varchar(30),
	primary key(fecha,numero)
);

/*Agregue un índice único llamado "i_consulta" compuesto por los campos "documento", "fecha" 
y "medico".*/
alter table consultas
	add unique index i_consulta(documento,fecha);
    
/*Hay 2 campos por los cuales podemos realizar consultas frecuentemente: "medico" y "obrasocial", 
cree índices comunes para esos campos.*/
alter table consultas
	add index i_medico_obra(medico,obrasocial);
    
/*Vea los indices.*/
show index from consultas;

#Problema propuesto 2

/*Problema: Trabajamos con la tabla "alumnos" en la cual un instituto de enseñanza guarda los datos de sus 
alumnos.*/

/*Elimine la tabla "alumnos", si existe.*/
drop table if exists alumnos;

/*Cree la tabla con los siguientes indices:*/
create table alumnos(
	año year not null,
	numero int unsigned not null,
	nombre varchar(30),
	documento char(8) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	provincia varchar(20),  
	primary key(año,numero),
	unique i_documento (documento),
	index i_ciudadprovincia (ciudad,provincia)
);

/*Vea los indices de la tabla.*/
show index from alumnos;

/*Elimine el indice unico.*/
alter table alumnos
	drop index i_documento;
    
/*Elimine el indice en comun.*/
alter table alumnos
	drop index i_ciudadprovincia;
    
/*Vea los indices.*/
show index from alumnos;


/*Otros problemas: Una clínica registra las consultas de los pacientes en una tabla llamada "consultas".*/

/*Elimine la tabla, si existe.*/
drop table if exists consultas;

/*Cree la tabla con la siguiente estructura.*/
create table consultas(
	fecha date,
	numero int unsigned,
	documento char(8) not null,
	obrasocial varchar(30),
	medico varchar(30),
	primary key(fecha,numero),
	unique i_consulta(documento,fecha,medico),
	index i_medico (medico),
	index i_obrasocial (obrasocial)
);

/*Vea los indices de la tabla.*/
show index from consultas;

/*Elimine el indice unico.*/
alter table consultas
	drop index i_consulta;
    
/*Elimine los indices comunes.*/
alter table consultas
	drop index i_medico;
    
alter table consultas
	drop index i_obrasocial;
    
/*Vea los indices.*/
show index from consultas;

#Problema propuesto 3

/*Problema: Trabajamos con la tabla "peliculas" de un video club.*/

/*Elimine la tabla, si existe.*/
drop table if exists peliculas;

/*Cree la tabla "peliculas".*/
create table peliculas(
	codigo int unsigned auto_increment,
	titulo varchar(40),
	duracion tinyint unsigned,
    primary key (codigo)
);

/*Cambie el nombre de la tabla por "films" con "alter table".*/
alter table peliculas rename films;

/*Vea si existen las tablas "peliculas" y "films".*/
show tables;

/*Cambie nuevamente el nombre de la tabla "films" por "peliculas" usando "rename".*/
rename table films to peliculas;

/*Vea si existen las tablas.*/
show tables;

/*Problemas 2: Una empresa tiene almacenados los datos de sus clientes en una tabla llamada "clientes" y los datos 
de sus empleados en otra tabla denominada "empleados".*/

/*Elimine ambas tablas, si existen.*/
drop table if exists clientes,empleados;

/*Cree las tablas dándoles el nombre equivocado, es decir, de el nombre "clientes" a la tabla que 
contiene los datos de los empleados y el nombre "empleados" a la tabla con la informaciómn de los 
clientes:*/
create table clientes(
	documento char(8) not null,
	nombre varchar(30),
	domicilio varchar(30),
	fechaingreso date,
	sueldo decimal(6,2) unsigned
 );

 create table empleados(
	documento char(8) not null,
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(30),
	provincia varchar(30)
);

/*Vea la estructura de ambas tablas.*/
describe clientes;
describe empleados;

/*Intercambie los nombres de las dos tablas.*/
# ARRELGAR rename table clientes to auxiliar;

/*Verifique el cambio de nombre.*/
show tables;

#Problema propuesto 4

/*Problema: Trabajamos con la tabla "empleados" de una empresa.*/

/*Elimine la tabla empleados, si existe.*/
drop table if exists empleados;

/*Cree la tabla con la siguiente estructura:*/
create table empleados(
	documento char(8),
	nombre varchar(30),
	sexo char(1),
	estadocivil enum('soltero','casado','divorciado','viudo') not null,
	sueldobasico decimal(6,2),
	primary key(documento)
);

/*Ingrese algunos registros.*/
insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
	values ('22333444','Juan Lopez','m','soltero',300);
insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
	values ('23333444','Ana Acosta','f','viudo',400);
    
/*Intente ingresar un valor "null" para el campo enumerado.*/
insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
	values ('22333434','Shiba Lopez','m',null,300);
    
/*Ingrese registros con valores de indice para el campo "estadocivil".*/
insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
	values ('22333434','Shiber Martinez','m','casado',400);
    
insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
	values ('22333634','Andres Sanchez','m','divorciado',300);
    
/*Ingrese un valor inválido, uno no presente en la lista y un valor de índice fuera de rango 
(guarda una cadena vacía).*/
insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
	values ('22333634','Johny Sanchez','m','valor invalido XD',300);

insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
	values ('22333234','Andres Perez','m','',400);
    
/*Seleccione todos los empleados solteros.*/
select * from empleados where estadocivil='soltero';

/*Seleccione todos los empleados viudos usando el número de índice de la enumeración.*/
select * from empleados where estadocivil=4;

#Problema propuesto 5

/*Otros problemas: Una empresa de turismo vende paquetes de viajes y almacena la información referente a los mismos 
en una tabla llamada "viajes".*/

/*Elimine la tabla, si existe.*/
drop table if exists viajes;

/*Cree la tabla:*/
create table viajes(
	codigo int unsigned auto_increment,
	nombre varchar(50),
	pension enum ('no','media','completa') not null,
	hotel enum ('1','2','3','4','5'),/* cantidad de estrellas*/
	dias tinyint unsigned,
	salida date,
	precioporpersona decimal(8,2) unsigned,
	primary key(codigo)
);

/*Ingrese algunos registros:*/
insert into viajes (nombre,pension,hotel,dias,salida)
	values ('Mexico mágico','completa','4',15,'2005-12-01');
insert into viajes (nombre,pension,hotel,dias,salida)
	values ('Europa fantastica','media','5',28,'2005-05-10');
insert into viajes (nombre,pension,hotel,dias,salida)
	values ('Caribe especial','no','3',7,'2005-11-25');
    
/*Intente ingresar un valor "null" para el campo "pension".*/
insert into viajes (nombre,pension,hotel,dias,salida)
	values ('Perro naranja',null,'3',7,'2005-11-25');
    
/*Ingrese el valor null para el campo "hotel".*/
insert into viajes (nombre,pension,hotel,dias,salida)
	values ('Perro amarillo','completa',null,7,'2005-11-25');
    
/*Ingrese un valor inválido, no presente en la lista de "pension" (guarda una cadena vacía).*/
insert into viajes (nombre,pension,hotel,dias,salida)
	values ('Perro rojo','tal vez','4',7,'2005-11-25');
    
/*Ingrese un valor de indice fuera de rango para el campo "hotel".*/
insert into viajes (nombre,pension,hotel,dias,salida)
	values ('Perro verde','completa','90',7,'2005-11-25');
    
/*Seleccione todos los viajes que incluyen media pension.*/
select * from viajes where pension='media';

/*Seleccione todos los viajes que incluyen un hotel de 4 estrellas.*/
select * from viajes where hotel='4';

/*Problema B: Una inmobiliaria vende inmuebles; los inmuebles pueden ser: casa, departamento, local o terreno.*/
drop table if exists inmuebles;

/*Cree la tabla "inmuebles" para registrar la siguiente información:

 - tipo de inmueble: tipo enum (casa,dpto,local,terreno), not null,

 - domicilio: varchar(30),

 - propietario: nombre del dueño,

 - precio: decimal hasta $999999.99 positivo.*/
create table inmuebles(
	tipodeinmueble enum ('casa','dpto','local','terreno') not null,
    domicilio varchar(30),
    propietario varchar(30),
    precio decimal(6,2) unsigned
);
 
/*Ingrese algunos registros.*/
insert into inmuebles values ('casa','Juan de la Cruz','Adrian Ozuna',1200.00);
insert into inmuebles values ('dpto','Zona Colonial','Juan Perez',2200.00);

/*Seleccione el domicilio y precio de todos los departamentos en alquiler.*/
select domicilio,precio from inmuebles;

/*Seleccine el domicilio, propietario y precio de todos los locales en venta*/

/*Seleccione el domicilio y precio de todas las casas disponibles.*/
#REVISARR

#Problema propuesto 6

/*Problema: Una academia de enseñanza dicta distintos cursos de informática. Los cursos se dictan por la mañana 
(de 8 a 12 hs.) o por la tarde (de 16 a 20 hs.), distintos días a la semana. La academia guarda los 
datos de los cursos en una tabla llamada "cursos" en la cual almacena el código del curso, el tema, 
los días de la semana que se dicta, el horario, por la mañana (AM) o por la tarde (PM), la cantidad 
de clases que incluye cada curso (clases), la fecha de inicio y el costo del curso.*/

/*Elimine la tabla "cursos", si existe.*/
drop table if exists cursos;

/*Cree a tabla "cursos" con la siguiente estructura:*/
create table cursos(
	codigo tinyint unsigned auto_increment,
	tema varchar(20) not null,
	dias set ('lunes','martes','miercoles','jueves','viernes','sabado') not null,
	horario enum ('AM','PM') not null,
	clases tinyint unsigned default 1,
	fechainicio date,
	costo decimal(5,2) unsigned,
	primary key(codigo)
);

/*Ingrese los siguientes registros:*/
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('PHP básico','lunes,martes,miercoles','AM',18,'2006-08-07',200);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('PHP básico','lunes,martes,miercoles','PM',18,'2006-08-14',200);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('PHP básico','sabado','AM',18,'2006-08-05',280);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('PHP avanzado','martes,jueves','AM',20,'2006-08-01',350);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('JavaScript','lunes,martes,miercoles','PM',15,'2006-09-11',150);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('Paginas web','martes,jueves','PM',10,'2006-08-08',250);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('Paginas web','sabado','AM',10,'2006-08-12',280);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('Paginas web','lunes,viernes','AM',10,'2006-08-21',200);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('Paginas web','lunes,martes,miercoles,jueves,viernes','AM',10,'2006-09-18',180);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('Paginas web','lunes,viernes','PM',10,'2006-09-25',280);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
	values('JavaScript','lunes,martes,viernes,sabado','PM',12,'2006-09-18',150);
    
/*Una persona quiere inscribirse en un curso de "PHP" y solo tiene disponibles los sabados.
Localice los cursos de "PHP" que se dictan solamente los sabados.*/
select * from cursos where dias='sabado';

/*Otra persona quiere aprender a diseñar páginas web, tiene disponibles todas las mañanas excepto 
los miércoles. Vea si existe algún curso que cumpla con sus necesidades.*/
select * from cursos where tema='Paginas web' and horario='AM' and dias!='miercoles';

/*Otra persona necesita aprender JavaScript, tiene disponibles todos las tardes excepto los jueves 
y quiere un curso que no supere las 15 clases para el mes de setiembre. Busque algún curso para 
esta persona.*/
select * from cursos where tema='JavaScript' and horario='PM' and dias!='jueves'; #ARREGLAR

/*Otros probemas A: Trabaje con la tabla "inmuebles" en la cual una inmobiliaria almacena la informacion referente a sus departamentos
en venta.*/

/*Elimine la tabla "inmuebles", si existe.*/
drop table if exists inmuebles;

/*Cree la tabla "inmuebles".*/
create table inmuebles(
	detalles set ('estacionamiento','terraza','pileta','patio','ascensor'),
	domicilio varchar(30),
	propietario varchar(30),
	precio decimal (9,2) unsigned
);

/*Ingrese algunos registros:*/
insert into inmuebles (detalles,precio) 
	values('terraza,pileta',50000);
insert into inmuebles (detalles,precio) 
	values('patio,terraza,pileta',60000);
insert into inmuebles (detalles,precio) 
	values('ascensor,terraza,pileta',80000);
insert into inmuebles (detalles,precio) 
	values('patio,estacionamiento',65000);
insert into inmuebles (detalles,precio) 
	values('estacionamiento',90000);
    
/*Seleccione todos los datos de los departamentos con terraza.*/
select * from inmuebles where find_in_set('terraza',detalles)>0;

/*Seleccione los departamentos que no tienen ascensor.*/
select * from inmuebles where not find_in_set('ascensor',detalles)>0;

/*Seleccione los inmuebles que tengan terraza y pileta solamente.*/
select * from inmuebles where detalles='terraza,pileta';

/*Muestre los inmuebles que no tengan ascensor y si estacionamineto, ademas de otros detalles.*/
select * from inmuebles where not find_in_set('ascensor',detalles)>0 and find_in_set('estacionamiento',detalles)>0;

/*Ingrese un registro cn vaor inexistente en "detalles".*/
insert into inmuebles (detalles,precio) 
	values('bruh',40000);
    
/*Ingrese un registro sin valor para "detalles".*/
insert into inmuebles (detalles,precio) 
	values(40000);
    
/*Problema B: Una empresa de turismo vende paquetes de viajes a México y almacena la información referente a 
los mismos en una tabla llamada "viajes":*/

/*Elimine la tabla, si existe.*/
drop table if exists viajes;

/*Cree la tabla:*/
create table viajes(
  codigo int unsigned auto_increment,
  nombre varchar(50),
  pension enum ('no','media','completa') not null,
  ciudades set ('Acapulco','DF','Cancun','Puerto Vallarta','Cuernavaca') not null,
  dias tinyint unsigned,
  salida date,
  precioporpersona decimal(8,2) unsigned,
  primary key(codigo)
);

/*Ingrese los siguientes registros:*/
insert into viajes (nombre,pension,ciudades,dias,salida)
	values ('Mexico mágico','completa','DF,Acapulco',15,'2005-12-01');
insert into viajes (nombre,pension,ciudades,dias,salida)
	values ('Mexico especial','media','DF,Acapulco,Cuernavaca',28,'2005-05-10');
insert into viajes (nombre,pension,ciudades,dias,salida)
	values ('Mexico unico','no','Acapulco,Puerto Vallarta',7,'2005-11-15');
insert into viajes (nombre,pension,ciudades,dias,salida)
	values ('Mexico DF','no','DF',5,'2005-10-25');
insert into viajes (nombre,pension,ciudades,dias,salida)
	values ('Mexico caribeño','completa','Cancun',15,'2005-10-25');
    
/*Ingrese un registro sin valor para el campo "ciudades".*/
insert into viajes (nombre,pension,ciudades,dias,salida)
	values ('Mexico caribeño','completa',15,'2005-10-25');
    
/*Seleccione todos los viajes que incluyan "Acapulco".*/
select * from viajes where find_in_set('Acapulco',ciudades);

/*Seleccione todos los viajes que no incluyan "Acapulco" y que incluyan pension completa.*/
select * from viajes where not find_in_set('Acapulco',ciudades) and pension='completa';

/*Muestre los viajes que incluyan "Puerto Vallarta" o "Cuernavaca".*/
select * from viajes where ciudades like '%Puerto Vallarta%' or ciudades like 'Cuernavaca';

#Problema propuesto 7:

/*Problema: Una inmobiliaria guarda los datos de sus inmuebles en venta en una tabla llamada "inmuebles".*/

/*Elimine la tabla, si existe:*/
drop table if exists inmuebles;

/*Cree la tabla.*/
create table inmuebles(
	codigo int unsigned auto_increment,
	domicilio varchar(30),
	barrio varchar(20),
	detalles text,
	primary key(codigo)
);

/*Ingrese algunos registros:*/
 insert into inmuebles 
	values(1,'Colon 123','Centro','patio, 3 dormitorios, garage doble, pileta, asador, living, cocina, comedor, escritorio, 2 baños');
 insert into inmuebles 
	values(2,'Caseros 345','Centro','patio, 2 dormitorios, cocina- comedor, living');
 insert into inmuebles 
	values(3,'Sucre 346','Alberdi','2 dormitorios, problemas de humedad');
 insert into inmuebles 
	values(4,'Sarmiento 832','Gral. Paz','3 dormitorios, garage, 2 patios');
 insert into inmuebles 
	values(5,'Avellaneda 384','Centro',' 2 patios, 2 dormitorios, garage');
    
/*Busque todos los inmubles que tengan "patio".*/
select * from inmuebles where detalles like '%patio%';

/*Otros problemas: Una libreria guara la informacion de sus libros en una tabla llamada "libros".*/

/*Elimine la tabla si existe.*/
drop table if exists libros;

/*Cree la tabla con un campo "blob" en el cual se pueda almacenar los temas principales que trata el libro.*/
create table libros(
	codigo int unsigned auto_increment,
	titulo varchar(40),
	autor varchar(30),
	editorial varchar(20),
	temas blob,
	precio decimal(5,2) unsigned,
	primary key(codigo)
);

/*Ingrese algunos registros:*/
 insert into libros values(1,'Aprenda PHP','Mario Molina','Emece',

 'Instalacion de PHP.

  Palabras reservadas.

  Sentencias basicas.

  Definicion de variables.',

 45.6);
  
 insert into libros values(2,'Java en 10 minutos','Mario Molina','Planeta',

 'Instalacion de Java en Windows.

  Instalacion de Java en Linux.

  Palabras reservadas.

  Sentencias basicas.

  Definir variables.',

 55);

 insert into libros values(3,'PHP desde cero','Joaquin Perez','Planeta',

 'Instalacion de PHP.

  Instrucciones basicas.

  Definición de variables.',

 50);
 
 /*Busque todos los libros sobre "PHP" que incluyan el tema "variables".*/
 select * from libros where temas like '%PHP%' and temas like '%variables%' ;
 
 /*Busque los libros de "Java" que incluyan el tema "Instalacion" o "Instalar".*/
 select * from libros where temas like '%Java%' and temas like '%Instalacion%' or temas like '%Instalar%';
 
 /*Otros problemas B: Una empresa registra los datos de sus empleados en una tabla llamada "empleados".*/
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
	hijos tinyint unsigned,
	primary key(documento)
 );
 
 /*Ingrese algunos registros:*/
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
	values ('22333111','Juan Perez','m','Colon 123','1990-02-01','1970-05-10',550,0);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
	values ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650,2);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
	values ('20111222','Hector Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510,1);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
	values ('30000222','Luis LUque','m','Urquiza 456','1980-09-01','1980-03-29',700,3);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
	values ('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15','1965-12-22',400,3);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
	values ('30000234','Alberto Soto','m','Peru 232','2003-08-15','1989-10-10',420,1);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
	values ('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14','1976-09-21',350,2);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
	values ('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23','1974-05-12',390,0);
insert into empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico,hijos)
	values ('30419964','Oscar Torres','m','Hernandez 1234','1996-04-10','1978-05-02',400,0);
    
/*Es política de la empresa festejar cada fin de mes, los cumpleaños de todos los empleados que 
cumplen ese mes. Si los empleados son de sexo femenino, se les regala un ramo de rosas, si son de 
sexo masculino, una corbata. La secretaria de la Gerencia necesita saber cuántos ramos de rosas y 
cuántas corbatas debe comprar para el mes de mayo.*/
select sexo,count(*) from empleados where month(fechanacimiento)='05' group by sexo;

/*Además, si el empleado cumple 10,20,30,40... años de servicio, se le regala una placa 
recordatoria. La secretaria de Gerencia necesita saber la cantidad de años de servicio que cumplen 
los empleados que ingresaron en el mes de abril para encargar dichas placas.*/
select nombre, year(current_date)-year(fechaIngreso) from empleados;

/*La empresa paga un sueldo adicional por hijos a cargos. para un sueldo básico menor o igual a 
$500 el salario familiar por hijo es de $300, para un sueldo superior, el monto es de $150 por 
hijo. Muestre el nombre del empleado, el sueldo básico, la cantidad de hijos a cargo, el valor del 
salario por hijo, el valor total del salario familiar y el sueldo final con el salario familiar 
incluido de todos los empleados con hijos a cargo.*/
#COMPLETAR

/*Otros problemas A: La empresa que provee de luz a los usuarios de un municipio, almacena en una tabla algunos datos 
de los usuarios y el monto a cobrar: 
- documento,

- domicilio, 

- monto a pagar,

- fecha de vencimiento.

Si la boleta no se paga hasta el día del vencimiento, inclusive, se incrementa al monto, un 1% del 
monto cada día de atraso.*/

/*Elimine la tabla "luz", si existe.*/
drop table if exists luz;

/*Cree la tabla:*/
create table luz(
	documento char(8) not null,
	domicilio varchar(30),
	monto decimal(5,2) unsigned,
	vencimiento date
);

/*Ingrese algunos registros con fechas de vencimiento anterior a la fecha actual (vencidas) y posteriores a la fecha actual (no vencidas).*/
insert into luz values ('A1234567','Shiba de la Cruz Perez',300.25,'20020-03-13');
insert into luz values ('A1234568','Shibo de la Cruz Perez',300.25,'20021-01-03');

/*Ingrese para el mismo usuario (igual documento) 2 boletas vencidas.*/

insert into luz values ('A1234567','Shiba de la Cruz Perez',300.25,'20020-04-15');
insert into luz values ('A1234567','Shiba de la Cruz Perez',300.25,'20020-06-12');

/*Muestre el documento del usuario, la fecha de vencimiento, la fecha actual (en que efectúa el 
pago) y si debe pagar recargo o no.*/
# Arreglar select documento,vencimiento,current_date(),if(vencimineto)

/*Si un usuario tiene más de una boleta vencida se le corta el servicio. Muestre el documento y la 
cantidad de boletas vencidas de cada usuario que tenga boletas vencidas y muestre un 
mensaje "Cortar servicio" si tiene 2 o más vencidas.*/

#Arreglar

/*Problema B: Un profesor guarda los promedios de sus alumnos de un curso en una tabla llamada "alumnos".*/

/*Elimine la tabla, si existe.*/
drop table if exists alumnos;

/*Cree la tabla:*/
create table alumnos(
	legajo char(5) not null,
	nombre varchar(30),
	promedio decimal(4,2)
);

/*Ingrese los siguientes registros:*/
insert into alumnos values(3456,'Perez Luis',8.5);
insert into alumnos values(3556,'Garcia Ana',7.0);
insert into alumnos values(3656,'Ludueña Juan',9.6);
insert into alumnos values(2756,'Moreno Gabriela',4.8);
insert into alumnos values(4856,'Morales Hugo',3.2);

/*Si el alumno tiene un promedio superior o igual a 4, muestre un mensaje "aprobado" en caso
contrario "reprobado".*/
select if(promedio>4,'aprobado','reprobado') from alumnos;

/*Es política del profesor entregar una medalla a quienes tengan un promedio igual o superior a 9. 
Muestre los nombres y promedios de los alumnos y un mensaje "medalla" a quienes cumplan con ese 
requisito.*/
select nombre,promedio,if(promedio>=9,'medalla','') from alumnos;

/*Problema B: Una playa de estacionamiento guarda cada día los datos de los vehículos que ingresan a la playa 
en una tabla llamada "vehiculos".*/

/*Elimine la tabla, si existe.*/
drop table if exists vehiculos;

/*Cree la tabla:*/
create table vehiculos(
	patente char(6) not null,
	tipo char(4),
	horallegada time not null,
	horasalida time,
	primary key(patente,horallegada)
);

/*Ingrese algunos registros:*/
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('ACD123','auto','8:30','9:40');
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('AKL098','auto','8:45','15:10');
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('HGF123','auto','9:30','18:40');
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('DRT123','auto','15:30',null);
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('FRT545','moto','19:45',null);
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('GTY154','auto','20:30','21:00');
    
/*Muestre la patente, la hora de llegada y de salida de todos los vehículos, más una columna que 
calcule la cantidad de horas que estuvo cada vehículo en la playa, sin considerar los que aún no se 
retiraron de la playa.*/
select patente,horallegada,horasalida,timediff(horasalida,horallegada) from vehiculos where horasalida is not null;

/*Se cobra 1 peso por hora. Pero si un vehículo permanece en la playa 4 horas, se le cobran 3 
pesos, es decir, no se le cobra la cuarta hora; si está 8 horas, se cobran 6 pesos, y así 
sucesivamente. Muestre la patente, la hora de llegada y de salida de todos los vehículos, más la 
columna que calcule la cantidad de horas que estuvo cada vehículo en la playa (sin considerar los 
que aún no se retiraron de la playa) y otra columna utilizando "if" que muestre la cantidad de 
horas gratis.*/
#SHIBA

/*Problema D: Un teatro con varias salas guarda la información de las entradas vendidas en una tabla 
llamada "entradas".*/
/*Elimine la tabla, si existe.*/
drop table if exists entradas;

/*Cree la tabla:*/
create table entradas(
	sala tinyint unsigned,
	fecha date,
	hora time,
	capacidad smallint unsigned,
	entradasvendidas smallint unsigned,
	primary key(sala,fecha,hora)
);

/*Ingrese algunos registros:*/
insert into entradas values(1,'2006-05-10','20:00',300,50);
insert into entradas values(1,'2006-05-10','23:00',300,250);
insert into entradas values(2,'2006-05-10','20:00',400,350);
insert into entradas values(2,'2006-05-11','20:00',400,380);
insert into entradas values(2,'2006-05-11','23:00',400,400);
insert into entradas values(3,'2006-05-12','20:00',350,350);
insert into entradas values(3,'2006-05-12','22:30',350,100);
insert into entradas values(4,'2006-05-12','20:00',250,0);

/*Muestre todos los registros y un mensaje si las entradas para una funcion estan agotadas.*/
select *,if(entradasvendidas=capacidad,'Entras agotadas!','') from entradas;

/*Muestre todos los datos de las funciones que tienen vendidas entradas y muestre un mensaje si se 
vendió más o menos de la mitad de la capacidad de la sala.*/
select *,if(entradasvendidas>capacidad/2,'Mas','Menos') from entradas where entradasvendidas>0;

#Problema propuesto 8:

/*Un profesor guarda los promedios de sus alumnos de un curso en una tabla llamada "alumnos".*/

/*Elimine la tabla, si existe.*/
drop table if exists alumnos;

/*Cree la tabla:*/
create table alumnos(
	legajo char(5) not null,
	nombre varchar(30),
	promedio decimal(4,2)
);

/*Ingrese los siguientes registros:*/
insert into alumnos values(3456,'Perez Luis',8.5);
insert into alumnos values(3556,'Garcia Ana',7.0);
insert into alumnos values(3656,'Ludueña Juan',9.6);
insert into alumnos values(2756,'Moreno Gabriela',4.8);
insert into alumnos values(4856,'Morales Hugo',3.2);
insert into alumnos values(7856,'Gomez Susana',6.4);

/*Si el alumno tiene un promedio menor a 4, muestre un mensaje "reprobado", si el promedio es 
mayor o igual a 4 y menor a 7, muestre "regular", si el promedio es mayor o igual a 7, 
muestre "promocionado", usando la primer sintaxis de "case".*/
select nombre,
case
	when promedio <4 then 'Reprobado'
    when promedio >=4 and promedio<7 then'regular'
    when promedio >=7 then 'Promocionado'
end
from alumnos;

/*Otros problemas: Una playa de estacionamiento guarda cada día los datos de los vehículos que ingresan a la playa 
en una tabla llamada "vehiculos".*/

/*Elimine la tabla, si existe.*/
drop table if exists vehiculos;

/*Cree la tabla:*/
create table vehiculos(
	patente char(6) not null,
	tipo char(4),
	horallegada time not null,
	horasalida time,
	primary key(patente,horallegada)
);

/*Ingrese algunos registros:*/
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('ACD123','auto','8:30','9:40');
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('AKL098','auto','8:45','15:10');
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('HGF123','auto','9:30','18:40');
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('DRT123','auto','15:30',null);
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('FRT545','moto','19:45',null);
insert into vehiculos (patente,tipo,horallegada,horasalida)
	values('GTY154','auto','20:30','21:00');
    
/*Se cobra 1 peso por hora. Pero si un vehículo permanece en la playa 4 horas, se le cobran 3 
pesos, es decir, no se le cobra la cuarta hora; si está 8 horas, se cobran 6 pesos, y así 
sucesivamente. Muestre la patente, la hora de llegada y de salida de todos los vehículos, más la 
columna que calcule la cantidad de horas que estuvo cada vehículo en la playa (sin considerar los 
que aún no se retiraron de la playa) y otra columna utilizando "case" que muestre la cantidad de 
horas gratis.*/
#COMPLETAR

/*Muestre la patente, la hora de llegada y de salida de todos los vehículos, más una columna que 
calcule la cantidad de horas que estuvo cada vehículo en la playa (sin considerar los que aún no se 
retiraron de la playa) y otra columna (con "case") que calcule la cantidad de horas cobradas.*/
select patente,horallegada,horasalida,timediff(horasalida,horallegada) from vehiculos where horasalida is not null;

/*En una pagina web se solicitan los siguientes datos para guardar informacion de sus visitas.*/

/*Elimine la tabla "visitas", si existe.*/
drop table if exists visitas;

/*Creela con la siguiente estructura:*/
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
	values ('Ana Maria Lopez','AnaMaria@hotmail.com','2006-02-10');
insert into visitas (nombre,mail,fecha)
	values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','2006-05-10');
insert into visitas (nombre,mail,fecha)
	values ('Juancito','JuanJosePerez@hotmail.com','2006-06-11');
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
    
/*Muestre el nombre, la fecha de ingreso y los nombres de los dias de la semana empleando un "case".*/
select nombre,fecha,
case
	when day(fecha)=1 then 'Lunes'
    when day(fecha)=2 then 'Martes'
    when day(fecha)=3 then 'Miercoles'
    when day(fecha)=4 then 'Jueves'
    when day(fecha)=5 then 'Viernes'
    when day(fecha)=6 then 'Sabado'
    when day(fecha)=7 then 'Domingo'
end
from visitas;

/*Muestre el nombre y fecha de ingreso a la página y con un "case" muestre si el nombre del mes 
corresponde al 1º, 2º o 3º cuatrimestre del año.*/
#COMPLETAR

#Problema propuesto 9

/*Problema: Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una 
tabla "provincias" donde registra los nombres de las provincias.*/

/*Elimine la tabla "clientes" y "provincias", si existen.*/
drop table if exists clientes,provincias;

/*Creelas con las siguientes estructuras:*/
create table clientes (
	codigo int unsigned auto_increment,
	nombre varchar(30) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	codigoprovincia tinyint unsigned,
	telefono varchar(11),
	primary key(codigo)
);
 
create table provincias(
	codigo tinyint unsigned auto_increment,
	nombre varchar(20),
	primary key (codigo)
);

/*Ingrese algunos registros para ambas tablas:*/
insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');
insert into provincias (nombre) values('Misiones');
insert into provincias (nombre) values('Salta');
insert into provincias (nombre) values('Buenos Aires');
insert into provincias (nombre) values('Neuquen');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Lopez Marcos', 'Colon 111', 'Córdoba',1,'null');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Perez Luis', 'Sarmiento 444', 'Rosario',2,null);
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje',1,'4253685');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Gomez Ines', 'San Martin 666', 'Santa Fe',2,'0345252525');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario',1,'4554455');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje',1,null);
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Ramos Betina', 'San Martin 999', 'Cordoba',1,'4223366');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Lopez Lucas', 'San Martin 1010', 'Posadas',4,'0457858745');
    
/*Obtenga los datos de ambas tablas, use alias.*/
select * from provincias as p
	join clientes as c
    on p.codigo=c.codigo;
    
/*Obtenga la misma informacion anterior pero ordenada por nombre del cliente.*/
select * from provincias as p
	join clientes as c
    on p.codigo=c.codigo
    order by c.nombre;
    
/*Omita la referencia a las tablas en la condición "on" para verificar que la sentencia no se 
ejecuta porque el nombre del campo "codigo" es ambiguo (ambas tablas lo tienen).*/
select * from provincias as p
	join clientes as c
    on codigo=codigo
    order by c.nombre;
    
/*Otros problemas A: Un club dicta clases de distintos deportes. En una tabla llamada "socios" guarda los datos de 
sus socios y en una tabla denominada "inscriptos" almacena la información necesaria para las 
inscripciones de los socios a los distintos deportes.*/

/*Elimine las tablas, si existen.*/
drop table if exists socios,inscriptos;

/*Cree las tablas:*/
create table socios(
	documento char(8) not null,
	nombre varchar(30),
	domicilio varchar(30),
	primary key(documento)
);

 create table inscriptos(
	documento char(8) not null, 
	deporte varchar(15) not null,
	año year,
	matricula char(1), /*si esta paga ='s' sino 'n'*/
	primary key(documento,deporte,año)
);

/*Ingrese algunos registros para ambas tablas:*/
insert into socios values('22333444','Juan Perez','Colon 234');
insert into socios values('23333444','Maria Lopez','Sarmiento 465');
insert into socios values('24333444','Antonio Juarez','Caseros 980');
insert into inscriptos values ('22333444','natacion','2005','s');
insert into inscriptos values ('22333444','natacion','2006','n');
insert into inscriptos values ('23333444','natacion','2005','s');
insert into inscriptos values ('23333444','tenis','2006','s');
insert into inscriptos values ('23333444','natacion','2006','s');
insert into inscriptos values ('24333444','tenis','2006','n');
insert into inscriptos values ('24333444','basquet','2006','n');

/*Muestre el nombre del socio y todos los campos de la tabla "inscriptos".*/
select s.nombre,i.*
	from socios as s
    join inscriptos as i
    on s.documento=i.documento;

/*Muestre el nombre de los socios y los deportes en los cuales estan inscriptos este año.*/
select s.nombre,i.deporte
	from socios as s
    join inscriptos as i
    on s.documento=i.documento
    where i.año='2020';
    
/*Muestre el nombre y todas las inscripciones del socio con número de documento='23333444'.*/
select s.nombre,i.deporte
	from socios as s
    join inscriptos as i
    on s.documento=i.documento
    where s.documento='23333444';
    
/*Una pequeña biblioteca de barrio registra los préstamos de sus libros en una tabla 
llamada "prestamos" y los datos de sus libros en una tabla llamada "libros".*/

/*Elimine las tablas, si existen.*/
drop table if exists libros;

/*Cree las tablas:*/
create table libros(
	codigo int unsigned auto_increment,
	titulo varchar(40),
	autor varchar (30),
	editorial varchar (15),
	primary key (codigo)
);

create table prestamos(
	codigolibro int unsigned not null,
	documento char(8) not null,
	fechaprestamo date not null,
	fechadevolucion date,
	primary key(codigolibro,fechaprestamo)
);

/*Ingrese algunos registros para ambas tablas.*/
insert into libros values (15,'Manual de 1º grado','Moreno Luis','Emece');
insert into libros values (28,'Manual de 2º grado','Moreno Luis','Emece');
insert into libros values (30,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
insert into libros values (35,'El aleph','Borges','Emece');
insert into prestamos
	values(15,'22333444','2006-07-10','2006-07-12');
insert into prestamos
	values(15,'22333444','2006-07-20','2006-07-21');
insert into prestamos (codigolibro,documento,fechaprestamo)
	values(15,'23333444','2006-07-25');
insert into prestamos (codigolibro,documento,fechaprestamo)
	values(30,'23333444','2006-07-28');
insert into prestamos (codigolibro,documento,fechaprestamo)
	values(28,'25333444','2006-08-10');
    
/*Muestre todos los datos de los préstamos, incluyendo el nombre del libro (join con "libros").*/
select p.*,l.titulo
	from prestamos as p
    join libros as l
    on p.codigolibro=l.codigo;
    
/*Muestre la información de los préstamos del libro "Manual de 1º grado".*/
select p.*,l.titulo
	from prestamos as p
    join libros as l
    on p.codigolibro=l.codigo
    where titulo='Manual de 1º grado';
    
/*Muestre los títulos de los libros, la fecha de préstamo y el documento del socio de todos los 
libros que no han sido devueltos.*/
select l.titulo,p.fechaprestamo,s.documento
	from prestamos as p
    join libros as l
    on p.codigolibro=l.codigo
    join socios as s
    on p.documento=s.documento
    where p.fechadevolucion is null;
    
/*Problema C: Una clínica registra las consultas de los pacientes en una tabla llamada "consultas" y en otra 
tabla denominada "obrassociales" almacena los datos de las obras sociales que atiende.*/

/*Elimine las tablas, si existen.*/
drop table if exists consultas,obrassociales;

/*Cree las tablas.*/
create table consultas(
	fecha date,
	hora time,
	documento char(8) not null,
	codigoobrasocial tinyint unsigned,
	medico varchar(30),
	primary key(fecha,hora,medico)
 );

 create table obrassociales(
	codigo tinyint unsigned auto_increment,
	nombre varchar(15),
	monto decimal(5,2) unsigned,
	primary key(codigo)
);	

/*Ingrese algunos registros:*/
insert into obrassociales (nombre,monto)
	values('PAMI',2);
insert into obrassociales (nombre,monto)
	values('IPAM',5);
insert into obrassociales (nombre,monto)
	values('OSDOP',3);
insert into consultas values('2006-08-10','8:00','22333444',1,'Perez');
insert into consultas values('2006-08-10','10:00','22333444',1,'Lopez');
insert into consultas values('2006-08-10','8:30','23333444',1,'Perez');
insert into consultas values('2006-08-10','9:00','24333444',2,'Perez');

/*Muestre la fecha,hora,documento del paciente, mÃ©dico, nombre y monto de la obra social de todas 
las consultas (join con "obrassociales").*/
select c.fecha,c.hora,c.documento,c.medico,o.nombre,o.monto
	from consultas as c
    join obrasocial as o
    on c.codigoobrasocial=o.codigo;

/*Muestre fecha,hora,documento del paciente y nombre de la obra social para las consultas del 
doctor "Perez".*/
select c.fecha,c.hora,c.documento,c.medico,o.nombre
	from consultas as c
    join obrasocial as o
    on c.codigoobrasocial=o.codigo
    where c.medico='Perez';
    
/*Muestre las obras sociales DISTINTAS que atendiÃ³ el doctor "Perez" el dÃ­a "2006-08-10".*/
select c.fecha,c.hora,c.documento,c.medico,o.nombre
	from consultas as c
    join obrasocial as o
    on c.codigoobrasocial=o.codigo
    where c.medico='Perez' and o.fecha='2006-08-10';
    
#Problema propuesto 10:

/*Problema: Una empresa tiene registrados sus clientes en una tabla llamada "clientes", tambien tiene una tabla "provincias" donde registra los nombres de las provincias.*/

/*Elimine la tabla "clientes" y "provincias", si existen.*/
drop table if exists clientes,provincias;

/*Creelas con las siguinetes estructuras:*/
create table clientes (
	codigo int unsigned auto_increment,
	nombre varchar(30) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	codigoprovincia tinyint unsigned,
	telefono varchar(11),
	primary key(codigo)
 );

 create table provincias(
	codigo tinyint unsigned auto_increment,
	nombre varchar(20),
	primary key (codigo)
);

/*En este ejemplo, el campo "codigoprovincia" de "clientes" es una clave forÃ¡nea, se emplea para 
enlazar la tabla "clientes" con "provincias".*/

/*Ingrese algunos registros para ambas tablas:*/
insert into provincias(codigo,nombre) values(1,'Cordoba');
insert into provincias(codigo,nombre) values(2,'Santa Fe');
insert into provincias(codigo,nombre) values(30,'Misiones');
insert into provincias(codigo,nombre) values(13,'Salta');
insert into provincias(codigo,nombre) values(15,'Buenos Aires');
insert into provincias(codigo,nombre) values(20,'Neuquen');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Lopez Marcos', 'Colon 111', 'CÃ³rdoba',1,'null');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Perez Luis', 'Sarmiento 444', 'Rosario',2,null);
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Ramos Betina', 'San Martin 999', 'Bahia Blanca',15,'4223366');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
	values ('Lopez Lucas', 'San Martin 1010', 'Posadas',30,'0457858745');
    
/*Enlace las tablas*/
select * 
	from clientes
    join provincias;
    
/*Modifique el campo "codigoprovincia" a "char(1)".*/
alter table clientes
	modify codigoprovincia char(1);
    
/*Vea como afecta el cambio a la tabla "clientes".*/
describe clientes;

/*El cliente de "Bahia Blanca" con cÃ³digo de provincia "15" ("Buenos Aires") ahora tiene "1" 
("Cordoba") y el cliente con cÃ³digo de provincia "30" ("Misiones") ahora almacena "3" (valor 
inexistente en "provincias").*/

/*Realice un "left join" buscando coincidencia de co0 digos en la tabla "provincias".*/
select *
	from clientes as c
    left join provincias as p
    on c.codigo=p.codigo;
    
/*Intente modificar la clave primaria en "provincias" para que se corresponda 
con "codigoprovincia" de "clientes"*/

/*Otros problemas: Un club dicta clases de distintos deportes. En una tabla llamada "deportes" guarda la informaciÃ³n 
de los distintos deportes que se enseÃ±an y en una tabla denominada "inscriptos" almacena la 
informaciÃ³n necesaria para las inscripciones a los distintos deportes.*/

/*Elimine las tablas, si existen.*/
drop table if exists deportes,inscriptos;

/*Cree las tablas:*/
create table deportes(
	codigo tinyint unsigned,
	nombre varchar(20),
	profesor varchar(30),
	primary key(codigo)
);

create table inscriptos(
	documento char(8) not null, 
	codigodeporte tinyint unsigned not null,
	aÃ±o year,
	matriculapaga char(1),/* 's' si estÃ¡ paga, 'n' si no estÃ¡ paga*/
	primary key(documento,codigodeporte,aÃ±o)
);

/*Ingrese algunos registros para ambas tablas:*/
insert into deportes values(1,'Tenis','Juan Lopez');
insert into deportes values(2,'Natacion','Maria Lopez');
insert into deportes values(3,'Basquet','Antonio Juarez');
insert into inscriptos values ('22333444',2,'2005','s');
insert into inscriptos values ('22333444',2,'2006','n');
insert into inscriptos values ('23333444',2,'2005','s');
insert into inscriptos values ('23333444',1,'2005','s');
insert into inscriptos values ('23333444',1,'2006','s');
insert into inscriptos values ('24333444',2,'2006','n');
insert into inscriptos values ('24333444',3,'2006','n');

/*Muestre el nombre del deporte y todos los campos de la tabla "inscriptos"*/
select d.nombre,i.*
	from deportes as d
    join inscriptos as i
    on d.codigo=i.codigodeporte;
    
/*Modifique el campo "codigo" de "deportes" para que almacene 1 caracter.*/
alter table deportes
	modify codigo char(1);
    
/*Actualice la tabla "deportes" almacenando en "codigo" el primer caracter del nombre del deporte.*/

/*Vea como cambia la tabla.*/
describe deportes;

/*Realice un join*/
select * from deportes join inscriptos; 
