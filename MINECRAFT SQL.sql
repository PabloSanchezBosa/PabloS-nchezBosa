drop database if exists BD_MINECRAFT;
create database BD_MINECRAFT;
use BD_MINECRAFT;

CREATE TABLE Minecraft (
id_minecraft int not null,
m_version int not null,
primary key (id_minecraft)
);
CREATE TABLE Jugadores (
  id_jugadores INT NOT NULL auto_increment,
  nombre_usuario VARCHAR(50) NOT NULL,
  contrasena VARCHAR(50) NOT NULL,
  correo_electronico VARCHAR(50) NOT NULL,
  fecha_registro TIMESTAMP NOT NULL,
  id_mapa INT NOT NULL,
  primary key(id_jugadores)
);
CREATE TABLE Mapa (
  id_mapa INT NOT NULL auto_increment,
  nombre_mapa VARCHAR(50) NOT NULL,
  fecha_creacion TIMESTAMP NOT NULL,
  id_minecraft INT NOT NULL,
  primary key(id_mapa)
);
CREATE TABLE Bloques (
  id_bloque INT NOT NULL auto_increment,
  nombre_bloque VARCHAR(50) NOT NULL,
  tipo_bloque VARCHAR(50) NOT NULL,
  primary key (id_bloque)
);

CREATE TABLE Mapa_bloques(
id_mapa INT NOT NULL,
id_bloque INT NOT NULL,
primary key (id_mapa, id_bloque)
);

CREATE TABLE Objetos (
  id_objeto INT NOT NULL,
  nombre_objeto VARCHAR(50) NOT NULL,
  tipo_objeto VARCHAR(50) NOT NULL,
  primary key (id_objeto)
);
CREATE TABLE Criaturas (
  id_criatura INT NOT NULL,
  nombre_criatura VARCHAR(50) NOT NULL,
  tipo_criatura VARCHAR(50) NOT NULL,
  daño BOOLEAN NOT NULL,
  primary key(id_criatura)
);
CREATE TABLE Dimensiones (
  id_dimension INT NOT NULL,
  nombre_dimension VARCHAR(50) NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  id_mapa INT NOT NULL,
  primary key(id_dimension)
);
CREATE TABLE Dimensiones_criaturas(
id_dimension INT NOT NULL,
id_criatura INT NOT NULL,
primary key(id_dimension,id_criatura)
);
CREATE TABLE Biomas (
  id_bioma INT NOT NULL,
  Nombre_Bioma VARCHAR(50) NOT NULL,
  Clima VARCHAR(50) NOT NULL,
  id_mapa INT NOT NULL,
  primary key(id_bioma)
);
CREATE TABLE Materiales (
  id_material INT NOT NULL,
  nombre_material VARCHAR(50) NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  id_minecraft INT NOT NULL,
  primary key(id_material)
);
CREATE TABLE Se_fabrican (
id_material INT NOT NULL,
id_objeto INT NOT NULL,
primary key (id_material,id_objeto)
);
CREATE TABLE Plataforma (
id_plataforma INT NOT NULL,
tipo VARCHAR(50) NOT NULL,
id_minecraft INT NOT NULL,
primary key(id_plataforma)
);
CREATE TABLE Modo (
id_modo INT NOT NULL,
tipo VARCHAR(50) NOT NULL,
id_minecraft INT NOT NULL,
primary key(id_modo)
);
CREATE TABLE Servidor (
id_servidor INT NOT NULL,
tipo VARCHAR(50) NOT NULL,
id_minecraft INT NOT NULL,
primary key(id_servidor)
);
CREATE TABLE Dificultad (
id_dificultad INT NOT NULL,
tipo VARCHAR(50) NOT NULL,
resumen VARCHAR(50) NOT NULL,
id_minecraft INT NOT NULL,
primary key(id_dificultad)
);
CREATE TABLE Boss (
id_boss INT NOT NULL,
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
id_minecraft INT NOT NULL,
primary key(id_boss)
);



ALTER TABLE Biomas
ADD CONSTRAINT FOREIGN KEY (id_mapa) REFERENCES Mapa (id_mapa);

ALTER TABLE Materiales
ADD CONSTRAINT FOREIGN KEY (id_minecraft) REFERENCES Minecraft (id_minecraft);

ALTER TABLE Se_fabrican
ADD CONSTRAINT FOREIGN KEY (id_material) REFERENCES Materiales (id_material),
ADD CONSTRAINT FOREIGN KEY (id_objeto) REFERENCES Objetos (id_objeto);

ALTER TABLE Jugadores
ADD CONSTRAINT FOREIGN KEY (id_mapa) REFERENCES Mapa (id_mapa);

ALTER TABLE Boss
ADD CONSTRAINT FOREIGN KEY (id_minecraft) REFERENCES Minecraft (id_minecraft);

ALTER TABLE Dificultad
ADD CONSTRAINT FOREIGN KEY (id_minecraft) REFERENCES Minecraft (id_minecraft);

ALTER TABLE Servidor
ADD CONSTRAINT FOREIGN KEY (id_minecraft) REFERENCES Minecraft (id_minecraft);

ALTER TABLE Modo
ADD CONSTRAINT FOREIGN KEY (id_minecraft) REFERENCES Minecraft (id_minecraft);

ALTER TABLE Plataforma
ADD CONSTRAINT FOREIGN KEY (id_minecraft) REFERENCES Minecraft (id_minecraft);

ALTER TABLE Mapa
ADD CONSTRAINT FOREIGN KEY (id_minecraft) REFERENCES Minecraft (id_minecraft);

ALTER TABLE Dimensiones
ADD CONSTRAINT FOREIGN KEY (id_mapa) REFERENCES Mapa (id_mapa);

ALTER TABLE Mapa_bloques
ADD CONSTRAINT FOREIGN KEY (id_bloque) REFERENCES Bloques (id_bloque),
ADD CONSTRAINT FOREIGN KEY (id_mapa) REFERENCES Mapa (id_mapa);

ALTER TABLE Dimensiones_criaturas
ADD CONSTRAINT FOREIGN KEY (id_dimension) REFERENCES Dimensiones (id_dimension),
ADD CONSTRAINT FOREIGN KEY (id_criatura) REFERENCES Criaturas (id_criatura);


INSERT INTO Minecraft VALUES (1,'1.1');
INSERT INTO Minecraft VALUES (2,'1.72');
INSERT INTO Minecraft VALUES (3,'1.6');
INSERT INTO Minecraft VALUES (4,'1.8');
INSERT INTO Minecraft VALUES (5,'2.0');

INSERT INTO Mapa VALUES(1,'koki1','2021-06-12 21:59:59',1);
INSERT INTO Mapa VALUES(2,'koki2','2022-04-11 21:59:59',2);
INSERT INTO Mapa VALUES(3,'koki3','2019-04-10 21:59:59',3);
INSERT INTO Mapa VALUES(4,'koki4','2020-11-09 21:59:59',4);
INSERT INTO Mapa VALUES(5,'koki5','2020-05-08 21:59:59',5);

INSERT INTO Jugadores VALUES (1,'Manolito','1234','manolito@gmail.com','2001-11-15 21:59:59',1);
INSERT INTO Jugadores VALUES (2,'JoseJuanColombianito','2345','josejuan@gmail.com','2002-12-12 21:59:59',2);
INSERT INTO Jugadores VALUES (3,'MikiNadal','7263','Mikinadal@gmail.com','2002-11-07 21:59:59',3);
INSERT INTO Jugadores VALUES (4,'Ricardito12','2468','Ricardito@gmail.com','2003-01-01 21:59:59',4);
INSERT INTO Jugadores VALUES (5,'Orlandito98','1234','Orlikoki@gmail.com','2020-06-12 21:59:59',5);

INSERT INTO Objetos VALUES(20,'Espada de Madera','Defensa');
INSERT INTO Objetos VALUES(21,'Rosa','Decoración');
INSERT INTO Objetos VALUES(22,'Maceta','Deoración');
INSERT INTO Objetos VALUES(23,'Escudo de metal','Defensa');
INSERT INTO Objetos VALUES(24,'Manzana','Alimento');

INSERT INTO Criaturas VALUES(30,'Aldeano Común','Moob indefenso','0');
INSERT INTO Criaturas VALUES(31,'Creeper','Moob explosivo','1');
INSERT INTO Criaturas VALUES(32,'Blaze','Moob peligroso','1');
INSERT INTO Criaturas VALUES(33,'Aldenao Herrero','Moob indefenso','0');
INSERT INTO Criaturas VALUES(34,'Lobo','Moob defensivo','0');

INSERT INTO Dimensiones VALUES(1,'Nether','Dimensión que se accede por medio de un portal',1);
INSERT INTO Dimensiones VALUES(2,'Normal','Dimensión normal',2);

INSERT INTO Bloques VALUES(1,'Tierra','Material más común al iniciar un mundo');
INSERT INTO Bloques VALUES(2,'Diamante','Se fabrican con 10 diamantes');
INSERT INTO Bloques VALUES(3,'Madera','Se obtiene al talar un árbol');
INSERT INTO Bloques VALUES(4,'Piedra','Se obtiene al picar piedra');
INSERT INTO Bloques VALUES(5,'Arena','Se obtiene al cavar con una pala');

INSERT INTO Mapa_bloques VALUES(1,1);
INSERT INTO Mapa_bloques VALUES(2,2);
INSERT INTO Mapa_bloques VALUES(3,3);
INSERT INTO Mapa_bloques VALUES(4,4);
INSERT INTO Mapa_bloques VALUES(5,5);

INSERT INTO Biomas VALUES(1,'Desierto','Desértico','1');
INSERT INTO Biomas VALUES(2,'Junhla','Selvático','2');
INSERT INTO Biomas VALUES(3,'Nieve','Helado','3');
INSERT INTO Biomas VALUES(4,'Prado','Cálido','4');
INSERT INTO Biomas VALUES(5,'Bosque','Frondoso','5');

INSERT INTO Materiales VALUES(1,'Madera','Se obtiene talando árboles',1);
INSERT INTO Materiales VALUES(2,'Piedra','Se obtiene picando piedra',2);
INSERT INTO Materiales VALUES(3,'Metal','Se obtiene picando menas de metal',3);
INSERT INTO Materiales VALUES(4,'Diamante','e obtiene picando menas de diamante',4);
INSERT INTO Materiales VALUES(5,'Cuero','Se obtiene a partir de ciertos animales',5);

INSERT INTO Plataforma VALUES(1,'PC',1);
INSERT INTO Plataforma VALUES(2,'PLAYSTATION',2);
INSERT INTO Plataforma VALUES(3,'XBOX',3);
INSERT INTO Plataforma VALUES(4,'NINTENDO SWITCH',4);
INSERT INTO Plataforma VALUES(5,'Dispositivos Móviles',5);

INSERT INTO Modo VALUES(1,'Creativo',1);
INSERT INTO Modo VALUES(2,'Supervivencia',2);

INSERT INTO Servidor VALUES(1,'Privado',1);
INSERT INTO Servidor VALUES(2,'Público',2);

INSERT INTO Dificultad VALUES('1','Pacífico','No hay enemigos que puedan hacerte daño',1);
INSERT INTO Dificultad VALUES('2','Fácil','Hay pocos enemigos para hacerte daño',2);
INSERT INTO Dificultad VALUES('3','Normal','Ajustes predeterminados',3);
INSERT INTO Dificultad VALUES('4','Dificil','Las criaturas harán más daño',4);
INSERT INTO Dificultad VALUES('5','Hardcore','Si mueres pierdes todo y empiezas de 0',5);

INSERT INTO Boss VALUES('1','Dragón del end','Dragón que pertenece a otra dimensión',1);
INSERT INTO Boss VALUES('2','Wither','Se invoca de cierta manera para que aparezca',2);


