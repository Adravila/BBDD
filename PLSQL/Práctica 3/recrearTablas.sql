DROP TABLE matricula;
DROP TABLE alumnos;
DROP TABLE edicion;
DROP TABLE cursos;

CREATE TABLE Cursos (
Cod_Curso NUMBER(5),
Nombre VARCHAR2(50) NOT NULL,
Descripcion VARCHAR2(90) NOT NULL,
Precio NUMBER(5,2) NOT NULL,
Descuento NUMBER(4,2) NOT NULL,
CONSTRAINT PK_Cursos PRIMARY KEY (Cod_Curso));

CREATE TABLE Alumnos ( 
Cod_Alumno NUMBER(5),
Nombre VARCHAR2(50) NOT NULL,
Apellidos VARCHAR2(50) NOT NULL,
CONSTRAINT PK_Alumnos PRIMARY KEY (Cod_Alumno));

CREATE TABLE Edicion (
Cod_Curso NUMBER(5),
Cod_Edicion NUMBER(3),
Fecha_Inicio DATE NOT NULL,
Fecha_Fin DATE NOT NULL,
Lugar VARCHAR2(40) NOT NULL,
CONSTRAINT PK_Edicion PRIMARY KEY (Cod_Curso, Cod_Edicion),
CONSTRAINT FK_Edicion_Cursos FOREIGN KEY (Cod_Curso) REFERENCES Cursos(Cod_Curso));


CREATE TABLE Matricula (
Cod_Curso NUMBER(5),
Cod_Edicion NUMBER(2),
Cod_Alumno NUMBER(5),
Fecha_Matricula DATE NOT NULL,
CONSTRAINT PK_Matricula PRIMARY KEY (Cod_Curso, Cod_Edicion, Cod_Alumno),
CONSTRAINT FK_Matricula_Edicion FOREIGN KEY (Cod_Curso, Cod_Edicion) REFERENCES Edicion(Cod_Curso, Cod_Edicion),
CONSTRAINT FK_Matricula_Alumnos FOREIGN KEY (Cod_Alumno) REFERENCES Alumnos(Cod_Alumno)); 

SET LINESIZE 30000

INSERT INTO Cursos(Cod_Curso, Nombre, Descripcion, Precio, Descuento) VALUES (11111,'AAED Pro','Curso intensivo de AAED',300,50);
INSERT INTO Cursos(Cod_Curso, Nombre, Descripcion, Precio, Descuento) VALUES (22222,'PCTR Pro','Curso intensivo de PCTR',400,0);
INSERT INTO Cursos(Cod_Curso, Nombre, Descripcion, Precio, Descuento) VALUES (33333,'DA Pro', 'Curso intensivo de DA',400,50);
INSERT INTO Cursos(Cod_Curso, Nombre, Descripcion, Precio, Descuento) VALUES (44444,'TABD Pro', 'Curso intensivo de TABD',300,50);

INSERT INTO Alumnos(Cod_Alumno, Nombre, Apellidos) VALUES (00001,'Adrian', 'Davila Guerra');
INSERT INTO Alumnos(Cod_Alumno, Nombre, Apellidos) VALUES (00002,'Francisco', 'Fernandez De la Rosa');
INSERT INTO Alumnos(Cod_Alumno, Nombre, Apellidos) VALUES (00003,'Jose Miguel', 'Lopez Vazquez');
INSERT INTO Alumnos(Cod_Alumno, Nombre, Apellidos) VALUES (00004,'Ana Rosa', 'Suarez Perez');
INSERT INTO Alumnos(Cod_Alumno, Nombre, Apellidos) VALUES (00005,'Cristina', 'Lopez Lopez');
INSERT INTO Alumnos(Cod_Alumno, Nombre, Apellidos) VALUES (00006,'Julian', 'Herrera Miranda');
INSERT INTO Alumnos(Cod_Alumno, Nombre, Apellidos) VALUES (00007,'Antonio', 'Correa Sanchez');

INSERT INTO Edicion(Cod_Curso, Cod_Edicion, Fecha_Inicio, Fecha_Fin, Lugar) VALUES (11111, 00001, '03/11/2018','09/11/2018','Puerto Real');
INSERT INTO Edicion(Cod_Curso, Cod_Edicion, Fecha_Inicio, Fecha_Fin, Lugar) VALUES (11111, 00002, '10/12/2018','07/01/2019','Cádiz');
INSERT INTO Edicion(Cod_Curso, Cod_Edicion, Fecha_Inicio, Fecha_Fin, Lugar) VALUES (11111, 00003, '03/03/2019','14/04/2019','Cádiz');
INSERT INTO Edicion(Cod_Curso, Cod_Edicion, Fecha_Inicio, Fecha_Fin, Lugar) VALUES (11111, 00004, '15/05/2019','29/06/2019','Puerto Real');
INSERT INTO Edicion(Cod_Curso, Cod_Edicion, Fecha_Inicio, Fecha_Fin, Lugar) VALUES (22222, 00005, '03/11/2018','07/02/2019','Puerto Real');
INSERT INTO Edicion(Cod_Curso, Cod_Edicion, Fecha_Inicio, Fecha_Fin, Lugar) VALUES (22222, 00006, '03/03/2019','14/04/2019','Cádiz');
INSERT INTO Edicion(Cod_Curso, Cod_Edicion, Fecha_Inicio, Fecha_Fin, Lugar) VALUES (33333, 00007, '03/11/2018','08/02/2019','Cádiz');

INSERT INTO Matricula(Cod_Curso, Cod_Edicion, Cod_Alumno, Fecha_Matricula) VALUES (11111,00001,00001,'24/10/2018');
INSERT INTO Matricula(Cod_Curso, Cod_Edicion, Cod_Alumno, Fecha_Matricula) VALUES (11111,00001,00002,'25/10/2018');
INSERT INTO Matricula(Cod_Curso, Cod_Edicion, Cod_Alumno, Fecha_Matricula) VALUES (11111,00001,00003,'25/10/2018');
INSERT INTO Matricula(Cod_Curso, Cod_Edicion, Cod_Alumno, Fecha_Matricula) VALUES (11111,00002,00004,'24/10/2018');
INSERT INTO Matricula(Cod_Curso, Cod_Edicion, Cod_Alumno, Fecha_Matricula) VALUES (11111,00002,00006,'24/10/2018');
INSERT INTO Matricula(Cod_Curso, Cod_Edicion, Cod_Alumno, Fecha_Matricula) VALUES (22222,00006,00007,'24/10/2018');
INSERT INTO Matricula(Cod_Curso, Cod_Edicion, Cod_Alumno, Fecha_Matricula) VALUES (33333,00007,00005,'24/10/2018');