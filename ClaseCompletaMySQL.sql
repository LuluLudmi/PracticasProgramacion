drop database if exists blog_v;
create database blog_v; 
use blog_v;
-- postead 
-- post 
-- comentariosestados
-- comentario
-- perfil 
-- usuario
create table perfil(
    id int  AUTO_INCREMENT PRIMARY KEY,
    detalle varchar(45)
);

create table post (
    id int  AUTO_INCREMENT PRIMARY KEY,
    usuario_id int,
    titulo varchar(200) ,
    cuerpo text, 
    postestado_id int,
    fechacreacion datetime
 );
 
 
create table usuario (
    id int primary key auto_increment,
    perfil_id int not null,
    nombre varchar(45)not null,
    apellido varchar(45)not null,
    email varchar (150) not null,
    fechacreacion datetime
);
 
create table comentario(
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT not null,
    post_id INT not null,
    comentario text,
    comentarioestado_id INT not null,
	fechacreacion datetime
);

create table postestado (
    id int  AUTO_INCREMENT PRIMARY KEY,
    detalle varchar(45)
);

create table comentarioestado (
    id int  AUTO_INCREMENT PRIMARY KEY,
    detalle varchar(45)
);
show tables;
-- alter table me permite hacer las relaiones entre tablas


alter table usuario
add constraint
FK_perfil_id
foreign key(perfil_id)
references perfil(id);

ALTER TABLE post
ADD CONSTRAINT fk_post_usuario
FOREIGN KEY (postestado_id) REFERENCES usuario(id);

ALTER TABLE post
ADD CONSTRAINT fk_post_postestado
FOREIGN KEY (postestado_id) REFERENCES postestado(id);

ALTER TABLE comentario
ADD CONSTRAINT fk_comentario_usuario
FOREIGN KEY (usuario_id) REFERENCES usuario(id);

ALTER TABLE comentario
ADD CONSTRAINT fk_comentario_post
FOREIGN KEY (post_id) REFERENCES post(id);

ALTER TABLE comentario
ADD CONSTRAINT fk_comentario_comentarioestado
FOREIGN KEY (comentarioestado_id) REFERENCES comentarioestado(id);

insert into comentarioestado values
(1,'Enviado'),
(2,'Publicado'),
(3,'Eliminado');



insert into perfil(detalle) values
('Adminstrador'),
('Programador'),
('Usuario'),
('Invitado');
select*from perfil;
insert usuario(perfil_id,nombre,apellido,email,fechacreacion) values
(1,'Jose','Mendoza','jose@gmail.com',curdate()),
(2,'Ana','Lopez','ana@gmail.com',curdate()),
(2,'Claudia','Marin','claudia@gmail.com',2024/06/30),
(3,'Franco','Pergamino','franco@gmail.com',curdate());
select*from usuario;
insert into postestado(detalle) values
('enviado'),
('publicado'),
('Eliminado');
insert into post(usuario_id,titulo,cuerpo,postestado_id,fechacreacion)value
(4,'Fin de curso','Cuando termina el curso',2, curdate()),
(3,'faltas','Cuantas faltas puede tener',1, curdate()),
(2,'Ausentes','Cuantas faltas tengo?',2, curdate());
select*from post;
insert into  comentario (usuario_id,post_id,comentario,comentarioestado_id,fechacreacion)values
(2,1,'Termina el 13 al 20 de diciembre','1','02/12/2024'),
(3,2,'Termina el 13 al 20 de diciembre','2',curdate()),
(4,3,'Termina el 13 al 20 de diciembre','3',curdate()),
(4,4,'Termina el 13 al 20 de diciembre','1',curdate());
select*from comentario;
-- Consultas básicas de selección (SELECT)
-- Mostrar todos los posts con su estado y el nombre del usuario que los creó:
 SELECT post.titulo, post.cuerpo, post.fechacreacion, postestado.detalle 
 AS estado, usuario.nombre, usuario.apellido
FROM post
JOIN postestado ON post.postestado_id = postestado.id 
JOIN usuario ON post.usuario_id = usuario.id;
-- Mostrar todos los comentarios de un post específico (por ejemplo, el post con ID = 1):

SELECT comentario.comentario, comentario.fechacreacion, usuario.nombre, usuario.apellido
FROM comentario
JOIN usuario ON comentario.usuario_id = usuario.id
WHERE comentario.post_id = 1;
-- Consultas de actualización (UPDATE)
-- Actualizar el estado de un post (por ejemplo, cambiar el estado de un post con ID = 1 a 'Publicado'):
UPDATE post set postestado_id= (select id from postestado where detalle='publicado')
where id=1;
select*from post;
-- Actualizar el estado de un comentario (por ejemplo, cambiar el estado de un comentario con ID = 2 a 'Eliminado'):
update comentario
set comentarioestado_id = (select id from comentarioestado where detalle = "Eliminado")
where id = 2;
select*from comentario;


-- Actualizar el correo electrónico de un usuario (por ejemplo, cambiar el correo de un usuario con ID = 4):
update usuario
set email = "nuevocorreo@servidor.com"
where id = 4;
select * from usuario;

-- Consultas avanzadas con agregación y filtros
-- Contar cuántos comentarios tiene un post (por ejemplo, el post con ID = 1):
select count(*) total_comentarios
from comentario
where post_id=1;
-- Obtener el número de posts publicados por cada usuario:
select u.nombre,count(p.id) total_post
from usuario u
left join post p on u.id=p.usuario_id
group by u.id;

-- Obtener los posts que fueron creados en una fecha específica (por ejemplo, hoy):
select* from post
where fechacreacion = curdate();
-- Mostrar los usuarios que han comentado en un post (por ejemplo, el post con ID = 1):
select u.nombre, u.apellido, u.email, u.fechacreacion from comentario c
join usuario u on u.id = c.usuario_id
where post_id = 1;

