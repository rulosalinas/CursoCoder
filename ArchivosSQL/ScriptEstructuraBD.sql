-- ----------- Estructura de la BD --------------------

DROP DATABASE IF EXISTS colegioPrimario;
CREATE DATABASE colegioPrimario; 

USE colegioPrimario;


CREATE TABLE alumno(
	id_alumno INT NOT NULL AUTO_INCREMENT
	,dni VARCHAR(8) NOT NULL
	,nombre VARCHAR(30) NOT NULL
	,apellido VARCHAR(12) NOT NULL
	,edad TINYINT NOT NULL
	,sexo VARCHAR(1) NOT NULL CHECK(sexo IN('M','F')) -- evita que en el campo se ingrese un valor diferente a M o F
	,direccion VARCHAR(50) NOT NULL
	,fecha_Nacimiento DATE NOT NULL
,PRIMARY KEY(id_alumno)
);

CREATE TABLE tutor (
	id_tutor INT NOT NULL AUTO_INCREMENT
	,dni VARCHAR(8) NOT NULL
	,nombres VARCHAR(30) NOT NULL
	,apellidos VARCHAR(30) NOT NULL
	,edad INT NOT NULL
	,telefono VARCHAR(12) NOT NULL
	,direccion VARCHAR(50) NOT NULL
	,fecha_Nacimiento DATE NOT NULL
,PRIMARY KEY(id_tutor)
);

CREATE TABLE tutor_alumno(
	id_alumno INT NOT NULL
	,id_tutor INT NOT NULL
	,parentesco VARCHAR(30) NOT NULL
,PRIMARY KEY (id_alumno, id_tutor) 
);

CREATE TABLE aulas(
	id_aula INT NOT NULL AUTO_INCREMENT
	,capacidad INT NOT NULL
	,vacantes_Lib INT
,PRIMARY KEY (id_aula)
);

CREATE TABLE curso(
	cod_curso INT NOT NULL AUTO_INCREMENT
	,nombre VARCHAR(45) NOT NULL
,PRIMARY KEY(cod_curso)
);

CREATE TABLE inscripcion(
	num_matricula INT NOT NULL AUTO_INCREMENT
	,fecha DATE NOT NULL
	,monto DECIMAL(5,2) CHECK(monto>0.00)NOT NULL -- acepta valores positivos para el pago
	,grado INT CHECK(grado BETWEEN 1 AND 6) NOT NULL -- solo acepta valores entre 1° y 6° grado
	,seccion VARCHAR(1)NOT NULL CHECK(seccion IN('A','B'))
	,id_aula INT NOT NULL
	,id_alumno INT NOT NULL
	,num_anio VARCHAR(4) NOT NULL
,PRIMARY KEY (num_matricula)
);

CREATE TABLE anio_escolar(
	num_anio VARCHAR(4) NOT NULL
	,fecha_inicio DATE NOT NULL
	,fecha_fin DATE NOT NULL
,PRIMARY KEY (num_anio)
);

CREATE TABLE trimestres(
	cod_trimestre INT NOT NULL AUTO_INCREMENT
	,descripcion VARCHAR (30) NOT NULL
,PRIMARY KEY (cod_trimestre)
);

CREATE TABLE horario(
	id_horario INT NOT NULL
	,dia VARCHAR(12) NOT NULL
	,hora_inicio TIME NOT NULL
	,hora_fin TIME NOT NULL
	,seccion VARCHAR(1)NOT NULL
	,id_aula INT NOT NULL
	,id_docente INT NOT NULL
	,id_curso INT NOT NULL
,PRIMARY KEY (id_horario)
);

CREATE TABLE notas(
	id_notas INT NOT NULL AUTO_INCREMENT
	,nota DECIMAL(3, 1) CHECK(nota>=0 AND nota<=10 )
	,descripcion VARCHAR (30) NOT NULL
	,id_curso INTEGER NOT NULL
	,id_alumno INTEGER NOT NULL
	,id_trimestre INT NOT NULL
,PRIMARY KEY (id_notas)
);

CREATE TABLE docente(
	id_docente INT NOT NULL AUTO_INCREMENT
	,dni VARCHAR(8) NOT NULL
	,nombres VARCHAR(30) NOT NULL
	,apellidos VARCHAR (30) NOT NULL
	,edad INT NOT NULL
	,sexo VARCHAR(1) NOT NULL CHECK(Sexo IN('M','F'))
	,direccion VARCHAR(50) NOT NULL
	,email VARCHAR (30) NOT NULL
	,telefono VARCHAR (12) NOT NULL
	,fecha_nacimiento DATE NOT NULL
	,id_especialidad INT NOT NULL
,PRIMARY KEY (id_docente)
);

CREATE TABLE especialidad(
	id_especialidad INT NOT NULL AUTO_INCREMENT
	,especialidad VARCHAR (30) NOT NULL
,PRIMARY KEY (id_especialidad)
);

-- -------------- definicion de claves foraneas ------------------

-- tabla tutor_alumno
ALTER TABLE tutor_alumno
	ADD CONSTRAINT fk_tutoralumno_alumno
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno);

ALTER TABLE tutor_alumno
	ADD CONSTRAINT fk_tutoralumno_tutor
    FOREIGN KEY (id_tutor) REFERENCES tutor(id_tutor);

-- tabla inscripcion
ALTER TABLE inscripcion
	ADD CONSTRAINT fk_inscripcion_aula
    FOREIGN KEY (id_aula) REFERENCES aulas(id_aula);

ALTER TABLE inscripcion
	ADD CONSTRAINT fk_inscripcion_alumno
    FOREIGN KEY (id_alumno) REFERENCES alumno (id_alumno);

ALTER TABLE inscripcion
	ADD CONSTRAINT fk_inscripcion_anioescolar
    FOREIGN KEY (num_anio) REFERENCES anio_escolar(num_anio);

-- tabla notas
ALTER TABLE notas
	ADD CONSTRAINT fk_notas_curso
    FOREIGN KEY (id_curso) REFERENCES curso(cod_curso);

ALTER TABLE notas
	ADD CONSTRAINT fk_notas_alumno
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno);

ALTER TABLE notas
	ADD CONSTRAINT fk_notas_trimestres
    FOREIGN KEY (id_trimestre) REFERENCES trimestres(cod_trimestre);

-- tabla docente
ALTER TABLE docente
	ADD CONSTRAINT fk_docente_especialidad
    FOREIGN KEY (id_especialidad) REFERENCES especialidad (id_especialidad);
    
-- tabla horario
ALTER TABLE horario
	ADD CONSTRAINT fk_horario_docente
    FOREIGN KEY (id_docente) REFERENCES docente(id_docente);

ALTER TABLE horario
	ADD CONSTRAINT fk_horario_curso
    FOREIGN KEY (id_curso) REFERENCES curso(cod_curso);
    