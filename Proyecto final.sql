-- Proyecto Final - La Academia
-- Creación de cada objeto de la base de datos
create database Academia;
use Academia;
-- Tabla Estudiantes
create table Estudiantes (
id_estudiante int primary key not null unique,
nombre varchar (50) not null,
procedencia text (30),
email varchar (50));
-- Tabla Profesores
create table Profesores (
id_profesor int primary key not null unique,
nombre varchar(50) not null,
edad int,
telefono int,
email varchar(50));
-- Tabla Asignaturas
create table Asignaturas (
id_asignatura varchar(10) primary key not null unique,
nombre varchar (20) not null,
creditos int not null,
precio int not null);
-- Tabla Sucursales
create table sucursales(
id_sucursal int primary key not null unique,
direccion varchar (50) not null,
hora_de_apertura time not null,
hora_de_cierre time not null);
-- Tabla empleados
create table tipo_de_empleados(
id_empleado int primary key not null unique,
funcion text (20) not null,
horas_de_trabajo int);
-- Tablas sueldos
create table Sueldos(
id_sueldo int primary key not null unique,
sueldo_neto int not null,
id_empleado int not null,
foreign key (id_empleado)
references tipo_de_empleados (id_empleado),
id_sucursal int not null,
foreign key (id_sucursal)
references sucursales (id_sucursal));

-- Ampliacion de tablas para el proyecto academia 
-- comentarios de los cursos 
create table comentarios(
id_comentario int primary key not null unique auto_increment,
id_asignatura varchar(10),
foreign key (id_asignatura)
references asignaturas (id_asignatura),
id_estudiante int not null,
foreign key (id_estudiante)
references estudiantes (id_estudiante),
comentario varchar (100),
fecha date);
INSERT INTO comentarios (id_comentario, id_asignatura, id_estudiante,comentario, fecha) VALUES
(1,'10',5,'el curso es muy bueno y la enseñanza didactica' ,'2024-02-14'),
(2,'1',6,'muy bueno la verdad' ,'2024-01-06'),
(3,'9',1,'me gusto tanto que la volvere a llevar' ,'2024-03-20'),
(4,'6',17,'el curso es muy lento' ,'2023-12-28'),
(5,'4',19,'mas o menos' ,'2023-12-14'),
(6,'3',14,'el curso es muy bueno y la enseñanza didactica' ,'2023-12-14'),
(7,'2',15,'bueno' ,'2024-01-17'),
(8,'1',8,'el profe se duerme en clase' ,'2024-02-14'),
(9,'1',7,'es un asco el profesor' ,'2024-03-15'),
(10,'2',6,'malo' ,'2024-03-13'),
(11,'1',5,'falta materiales' ,'2024-01-08'),
(12,'7',4,'interesante pero un poco complejo' ,'2023-12-31'),
(13,'1',3,'el curso es muy bueno y la enseñanza didactica' ,'2023-12-15'),
(14,'8',2,'se vio solo lo basico, ya sabia casi todo' ,'2023-12-19'),
(15,'1',1,'el profe no sabe nada' ,'2024-01-11'),
(16,'1',13,'vole','2024-03-14'),
(17,'4',16,'a primera vista dificil, pero si estudias esta bueno' ,'2023-12-14'),
(18,'7',12,'curso para no estudiar' ,'2024-02-14'),
(19,'3',1,'me puso a estudiar en serio' ,'2024-01-15'),
(20,'2',18,'mucho contenido' ,'2024-01-05'),
(21,'1',14,'faltan temas' ,'2023-12-28'),
(22,'8',2,'muy complejo' ,'2023-12-29'),
(23,'1',3,'el profe grita mucho' ,'2024-01-15'),
(24,'9',4,'me gusto, pero la profesora' ,'2024-01-13'),
(25,'10',1,'el curso es muy bueno y la enseñanza didactica' ,'2024-02-25'),
(26,'4',5,'muy poco contenido' ,'2024-01-17'),
(27,'10',7,'se entendio todo' ,'2024-01-26'),
(28,'3',6,'el profe no habla fuerte' ,'2024-01-18'),
(29,'2',1,'no entendi nada' ,'2024-01-24'),
(30,'5',1,'falta profundizar en los temas' ,'2024-02-28'),
(31,'1',7,'el curso es muy bueno y la enseñanza didactica' ,'2024-03-13'),
(32,'5',14,'el curso mas aburrido que hice' ,'2023-12-28'),
(33,'7',15,'el curso mas interesante que hice' ,'2024-2-07');
-- cursos completados por alumno
create table completados(
id_asignatura varchar(10) not null,
foreign key (id_asignatura)
references asignaturas (id_asignatura),
id_estudiante int not null,
foreign key (id_estudiante)
references estudiantes (id_estudiante),
completed tinyint(1));
INSERT INTO completados (id_asignatura, id_estudiante, completed) VALUES
(1, 1, 1),(2, 1, 1),(9, 1, 1),(1, 2, 1),(3, 2, 1),(7, 2, 1),(9, 2, 1),
(10, 2, 1),(1, 2, 1),(1, 3, 1),(1, 4, 1),(2, 4, 1),(9, 5, 1),(1, 6, 1),
(3, 7, 1),(1, 7, 1),(10, 7, 1),(1, 15, 1),(5, 15, 1),(2, 15, 1),(7, 15, 1),
(4, 16, 1),(5, 16, 1),(6, 16, 1),(5, 19, 1),(6, 19, 1),(7, 19, 1),(8, 19, 1),
(1,20, 1),(2,20, 1),(4,20, 1),(7, 20, 1),(8,20, 1),(9,20, 1),(10, 20, 1);

-- cursos que los alumnos abandonaron
create table incompletados(
id_asignatura varchar(10) not null,
foreign key (id_asignatura)
references asignaturas (id_asignatura),
id_estudiante int not null,
foreign key (id_estudiante)
references estudiantes (id_estudiante),
completed tinyint(1));
INSERT INTO incompletados (id_asignatura, id_estudiante, completed) VALUES
(1, 8, 0),(1, 8, 0),(2, 8, 0),(9, 11, 0),(1, 11, 0),(3, 11, 0),(7, 12, 0),
(10, 12, 0),(1, 13,0),(1, 14,0),(1, 14, 0),(2, 14, 0),(9, 15, 0),(1, 16, 0),
(3, 17, 0),(1, 18, 0),(10,18, 0),(1, 17, 0),(5, 19, 0),(2, 19, 0),(7, 2, 0),
(4, 3, 0),(5, 1,0),(6, 4,0),(5, 5,0),(6, 5, 0);

-- pagos de los estudiantes y cuantos cursos escogieron en un nuevo periodo de academia
create table pagos(
id_pago int primary key not null unique auto_increment,
id_estudiante int not null,
foreign key (id_estudiante)
references estudiantes (id_estudiante),
numero_de_cursos int,
monto_pagado int,
fecha_de_pago date);

INSERT INTO pagos (id_pago, id_estudiante, numero_de_cursos,monto_pagado,fecha_de_pago) VALUES
(1, 1, 3,330, '2024-02-12'),
(2, 2, 1,90, '2024-02-20'),
(3, 3, 2,180, '2024-02-28'),
(4, 4, 6,720, '2024-02-27'),
(5, 5, 5,600, '2024-02-02'),
(6, 6, 3,360, '2024-02-01'),
(7, 7, 3,360, '2024-02-05'),
(8, 8, 3,330, '2024-02-12'),
(9, 9, 3,330, '2024-02-11'),
(10, 10, 2,240, '2024-02-07'),
(11, 11, 1,120, '2024-02-12'),
(12, 12, 4,480, '2024-02-03'),
(13, 13, 4,540, '2024-02-12'),
(14, 14, 4,480, '2024-02-12'),
(15, 15, 3,360, '2024-02-24'),
(16, 16, 2,210, '2024-02-25'),
(17, 17, 6,660, '2024-02-09'),
(18, 18, 7,690, '2024-02-25'),
(19, 19, 7,690, '2024-02-27'),
(20, 20, 1,150, '2024-02-02');

-- Como valoraron los estudiantes el curso en un rango del uno al diez
create table valoracion(
id_valoracion int primary key not null unique auto_increment,
id_estudiante int not null,
foreign key (id_estudiante)
references estudiantes (id_estudiante),
id_asignatura varchar(10) not null,
foreign key (id_asignatura)
references asignaturas (id_asignatura),
valoracion int
);
INSERT INTO valoracion (id_valoracion, id_estudiante, id_asignatura,valoracion) VALUES
(1, 1, 2,6),(2, 1, 4,2),(3, 1, 10,3),(4, 4, 1,6),(5, 4, 3,5),
(6, 5, 7,5),(7, 6, 4,5),(8, 7, 10,10),(9, 7, 9,10),(10, 7, 7,9),
(11, 9, 3,2),(12, 9, 4,6),(13, 9, 9,5),(14, 9, 10,4),(15, 11, 5,7),
(16, 11, 6,8),(17, 12, 1,8),(18, 13, 8,9),(19, 14, 6,10),(20, 14, 7,1),
(21, 18, 1,1),(22, 18, 2,2),(23, 18, 3,3),(24, 19, 4,4),(25, 19, 7,10),
(26, 19, 8,2),(27, 20, 4,3),(28, 20, 8,5),(29, 20, 9,7),(30, 20, 10,8);

-- Tabla para ver que area que estudia el curso es una asignatura
create table tipo_de_curso(
id_tipo_curso int,
tipo char (50),
id_asignatura varchar(10) not null,
foreign key (id_asignatura)
references asignaturas (id_asignatura)
);
INSERT INTO tipo_de_curso (id_tipo_curso, tipo, id_asignatura) VALUES
(1, 'Ciencia formal', 3),(1, 'Ciencia formal', 4),(1, 'Ciencia formal', 10),
(2, 'Ciencia natural', 1),(2, 'Ciencia natural', 5),(2, 'Ciencia natural', 6),
(3, 'Ciencia social', 7),(3, 'Ciencia social', 8),(3, 'Ciencia social', 9),
(4, 'Lingüística', 2);
-- estudiantes de alto rendimiento
create table alto_rendimiento(
id_estudiante int not null,
foreign key (id_estudiante)
references estudiantes (id_estudiante),
nota int,
beca boolean
);
INSERT INTO alto_rendimiento (id_estudiante, nota, beca) VALUES
(1, 14, 0),(2, 17, 1),(3, 11, 0),(4, 12, 0),
(5, 9, 0),(6, 15, 0),(7, 18, 1),(8, 19, 1),
(9, 8, 0),(10, 10, 0),(11, 11, 0),(12, 16, 1),
(13, 17, 1),(14, 17, 1),(15, 16, 1),(16, 20, 1),
(17, 9, 0),(18, 10, 0),(19, 11, 0),(20, 12, 0);
-- Insertamos datos a las tablas
insert into asignaturas (id_asignatura, nombre, creditos, precio) values
(1,'Quimica',4,120), (2,'Lenguaje',3,90), (3,'Algebra',5,150), (4,'Aritmetica',4,120),
(5,'Fisica',5,150), (6,'Biologia',3,90), (7,'Economia',4,120), (8,'Historia',3,90),
(9,'Filosofia',2,60), (10,'Geometria',4,120);

insert into estudiantes (id_estudiante, nombre, procedencia, email) values
(1,'Alfredo','Lima','alfredo@gmail.pe'), (2,'Elizabeth','Cusco','elizabeth@gmail.com'),
(3,'Eduardo','Callao','eduardo@hotmail.com'), (4,'Alexander','Trujillo','alexander@outlook.com'),
(5,'Moises','Lima','Moi@gmail.pe'), (6,'Delia','Pisco','delicita@gmail.com'),
(7,'Pablo','Cusco','pablucha@hotmail.com'), (8,'Matias','Lima','elmati@outlook.com'),
(9,'Sandra','Puno','snadra@gmail.pe'), (10,'Elsa','Cusco','elsa@gmail.com'),
(11,'Jorge','Callao','jorgito@hotmail.com'), (12,'Camila','Trujillo','Cam@outlook.com');
insert into estudiantes (id_estudiante, nombre, procedencia, email) values
(13,'Santi','Lima','elsanti@gmail.pe'), (14,'Elvira','Arequipa','elvi@gmail.com'),
(15,'Lalo','Ica','lalito@gmail.pe'), (16,'Matias','Juliaca','mati@gmail.com'),
(17,'Paulo','Pisco','paol@gmail.pe'), (18,'Juan','Iquitos','Juannn@gmail.com'),
(19,'Sebastian','Lima','elsebas123@gmail.pe'), (20,'Joaquin','Tarapoto','joaco666@hotmail.com');

insert into profesores (id_profesor, nombre_profes, id_asignatura, edad, telefono, email) values
(1,'Sandro',3,35,936564758,'sandro@gmail.pe'), (2,'Lucia',2,40,936545268,'lucid@gmail.pe'),
(3,'Miguel',5,38,966446809,'miky@gmail.pe'), (4,'Luis',8,42,973233553,'lucho@gmail.pe'),
(5,'Karen',1,46,999222555,'karen@gmail.pe'), (6,'Juan',10,38,946895124,'juanjo@gmail.pe'),
(7,'Katya',4,50,956458743,'katy@gmail.pe'), (8,'Agustin',9,39,936895478,'agustin@gmail.pe'),
(9,'Jose',6,25,923365457,'joses@gmail.pe'), (10,'Paco',7,40,999999991,'pacooo@gmail.pe');

insert into sucursales (id_sucursal, direccion, hora_de_apertura, hora_de_cierre) values
(1, 'Av.Los Incas 512', '08:15:00', '20:00:00'),
(2, 'Av.La cultura 685', '7:00:00', '21:00:00'),
(3, 'Calle Maruri L.c-1', '11:00:00', '17:00:00');

insert into tipo_de_empleados (id_empleado, funcion, horas_de_trabajo) values
(1, 'Docente', 6), (2, 'Administracion', 4), (3, 'Limpieza', 8),
(4, 'logistica', 6), (5, 'Seguridad', 8), (6, 'Marketing', 5);

insert into sueldos (id_empleado, sueldo_neto, id_sucursal) values
(1, 1800,2), (2, 1500,3), (3, 1000,null),
(4, 2300,3), (5, 1500,null), (6, 2000,1);

-- Creacion de vistas
-- Vista para ver que estudiantes de la academia provienen del deparatamento de Cusco
Create or replace view Cusqueños as
(select nombre, procedencia
from estudiantes
where procedencia = 'cusco');
select * from cusqueños;
-- Vista para ver que estudiantes tienen un correo con direccion gmail
Create view gmail as
(select nombre, email
from estudiantes
where email like '%gmail%');
select * from gmail;

-- Vista para ver las funcion del empleado, cuantas horas trabaja y su sueldo
create or replace view descr_empleo as 
(select funcion, horas_de_trabajo, sueldo_neto
from tipo_de_empleados t join sueldos s on (t.id_empleado=s.id_empleado));
select * from descr_empleo;

-- Vista para ver que profesor enseña cada curso y su edad ordenandolos de menor a mayor
create or replace view profes as 
(select nombre, edad, nombre_profes
from profesores p join asignaturas a on (p.id_asignatura=a.id_asignatura) order by edad);
select * from profes;

-- Vista para ver que cursos son los mas caros (valen mas de 100 soles) y cuanto cuestan
Create or replace view Cursos_caros as
(select nombre, precio
from asignaturas
where precio > 100);
select * from cursos_caros;

-- Creacion de funciones
-- funcion para ver el nombre de un curso por su id 

delimiter //
create function f_curso (identificacion int) returns varchar (100) deterministic
begin
     declare curso varchar(100);
     select nombre into curso from asignaturas 
     where id_asignatura = identificacion;
     return curso;
end //
delimiter ;
select f_curso(2);

-- funcion para ver el correo de un estudiante, teniendo su id de estudiante y su nombre 
delimiter //
create function fcorreo (ide int, nom char(50)) returns varchar (100) deterministic
begin
     declare correo varchar(100);
     select email into correo from estudiantes
     where id_estudiante = ide and nombre = nom;
     return correo;
end //
delimiter ;
select fcorreo (1,'Alfredo') as correo;

-- Creacion de Stored Procedures
-- Stored procedure para ordenar los estudiantes de la academia de acuerdo al campo establecido

DELIMITER //
CREATE PROCEDURE `sp_estudiante_order` (IN field CHAR(20))
BEGIN
    DECLARE orden_alum VARCHAR(100);
    DECLARE clausula VARCHAR(200);
    IF field <> '' THEN
        SET orden_alum = CONCAT('ORDER BY ', field);
    ELSE
        SET orden_alum = '';
    END IF;
    SET @clausula = CONCAT('SELECT * FROM estudiantes ', orden_alum);
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END //
DELIMITER ;

CALL sp_estudiante_order('Procedencia');

-- Stored procedure para registrar a los nuevos alumnos en un periodo de academia nuevo
-- y ver al ultimo alumno registrado

create table Nuevos_alumnos(
id int PRIMARY KEY auto_increment,
alumno char(20));

DELIMITER $$
CREATE PROCEDURE nuevos (in Nuevoalumno char(20))
begin
    IF Nuevoalumno = "" then 
    select "ERROR NO SE PUEDE CARGAR EL REGISTRO";
    Else 
		insert into Nuevos_alumnos (alumno) values (Nuevoalumno);
	end if;
     select * from Nuevos_alumnos order by id desc;
END $$
DELIMITER ;
call nuevos("Efrain");
call nuevos("Eliazar");

-- Creacion de Triggers
/*Trigger Before Insert en la tabla sueldos: Para asegurarse de que el empleado
y la sucursal en la que trabaja existen antes de insertar un nuevo sueldo.*/
SET foreign_key_checks = 0;
DELIMITER $$
CREATE TRIGGER insert_sueldo_neto
BEFORE INSERT ON sueldos
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM tipo_de_empleados WHERE id_empleado = NEW.id_empleado) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo de empleado no existe';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM sucursales WHERE id_sucursal = NEW.id_sucursal) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal especificada no existe';
    END IF;
END $$
DELIMITER ;
INSERT INTO sueldos (id_empleado, sueldo_neto, id_sucursal)
VALUES (2, 1500, 5);

/*Trigger after Delete en la tabla estudiantes: Para observar la fecha de eliminacion de un estudiante 
y poner sus datos mas importantes en otra tabla.*/

CREATE TABLE ex_estudiantes(
id_estudiante int,
nombre varchar(25),
procedencia varchar(25),
fecha timestamp
);

delimiter $$

create trigger registro_exs
after delete on estudiantes
for each row 
begin
    insert into ex_estudiantes(id_estudiante,nombre,procedencia,fecha)
    value (old.id_estudiante, old.nombre,old.procedencia ,now());
end $$
delimiter ;

delete from estudiantes where id_estudiante = 4;