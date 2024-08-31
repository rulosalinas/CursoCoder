-- ----------- Insersion de datos ------------------
USE colegioPrimario;
-- Inserción de datos en la tabla especialidad
INSERT INTO especialidad (especialidad) VALUES
('Matemáticas')
,('Lengua')
,('Ciencias Naturales')
,('Ciencias Sociales')
,('Educación Física')
,('Inglés')
,('Música')
,('Arte')
,('Tecnología')
,('Informática');

-- Inserción de datos en la tabla aulas
INSERT INTO aulas (capacidad, vacantes_Lib) VALUES
(30, 5)
,(25, 0)
,(30, 10)
,(20, 5)
,(25, 2)
,(30, 3)
,(30, 4)
,(25, 1)
,(20, 0)
,(30, 0);

-- Inserción de datos en la tabla alumno
INSERT INTO alumno (dni, nombre, apellido, edad, sexo, direccion, fecha_Nacimiento) VALUES
('12345678', 'Juan', 'Perez', 10, 'M', 'Calle 1', '2014-05-01')
,('23456789', 'Ana', 'Garcia', 11, 'F', 'Calle 2', '2013-06-15')
,('34567890', 'Luis', 'Martinez', 9, 'M', 'Calle 3', '2015-07-20')
,('45678901', 'Maria', 'Lopez', 10, 'F', 'Calle 4', '2014-08-25')
,('56789012', 'Carlos', 'Gonzalez', 11, 'M', 'Calle 5', '2013-09-30')
,('67890123', 'Lucia', 'Rodriguez', 9, 'F', 'Calle 6', '2015-10-05')
,('78901234', 'Jose', 'Fernandez', 10, 'M', 'Calle 7', '2014-11-10')
,('89012345', 'Laura', 'Sanchez', 11, 'F', 'Calle 8', '2013-12-15')
,('90123456', 'Miguel', 'Romero', 9, 'M', 'Calle 9', '2015-01-20')
,('11234567', 'Sofia', 'Diaz', 10, 'F', 'Calle 10', '2014-02-25');

-- Inserción de datos en la tabla tutor
INSERT INTO tutor (dni, nombres, apellidos, edad, telefono, direccion, fecha_Nacimiento) VALUES
('32145678', 'Pedro', 'Perez', 35, '123456789', 'Calle 1', '1989-05-01')
,('43256789', 'Marta', 'Garcia', 40, '234567890', 'Calle 2', '1984-06-15')
,('54367890', 'Javier', 'Martinez', 38, '345678901', 'Calle 3', '1986-07-20')
,('65478901', 'Rosa', 'Lopez', 37, '456789012', 'Calle 4', '1987-08-25')
,('76589012', 'Alberto', 'Gonzalez', 36, '567890123', 'Calle 5', '1988-09-30')
,('87690123', 'Cristina', 'Rodriguez', 39, '678901234', 'Calle 6', '1985-10-05')
,('98701234', 'Andres', 'Fernandez', 34, '789012345', 'Calle 7', '1990-11-10')
,('09812345', 'Laura', 'Sanchez', 41, '890123456', 'Calle 8', '1983-12-15')
,('10923456', 'Miguel', 'Romero', 33, '901234567', 'Calle 9', '1991-01-20')
,('21034567', 'Sofia', 'Diaz', 42, '012345678', 'Calle 10', '1982-02-25');

-- Inserción de datos en la tabla tutor_alumno
INSERT INTO tutor_alumno (id_alumno, id_tutor, parentesco) VALUES
(1, 1, 'Padre')
,(2, 2, 'Tio')
,(3, 3, 'Padre')
,(4, 4, 'Madre')
,(5, 5, 'Padre')
,(6, 6, 'Abuelo')
,(7, 7, 'Padre')
,(8, 8, 'Madre')
,(9, 9, 'Padre')
,(10, 10, 'Abuela');

-- Inserción de datos en la tabla curso
INSERT INTO curso (nombre) VALUES
('Matemáticas')
,('Lengua')
,('Ciencias Naturales')
,('Ciencias Sociales')
,('Educación Física')
,('Inglés')
,('Música')
,('Arte')
,('Tecnología')
,('Informática');

-- Inserción de datos en la tabla anio_escolar
INSERT INTO anio_escolar (num_anio, fecha_inicio, fecha_fin) VALUES
('2023', '2023-03-01', '2023-12-15') 
,('2022', '2022-03-01', '2022-12-15')
,('2021', '2021-03-01', '2021-12-15')
,('2020', '2020-03-01', '2020-12-15')
,('2019', '2019-03-01', '2019-12-15')
,('2018', '2018-03-01', '2018-12-15')
,('2017', '2017-03-01', '2017-12-15')
,('2016', '2016-03-01', '2016-12-15')
,('2015', '2015-03-01', '2015-12-15')
,('2014', '2014-03-01', '2014-12-15');

-- Inserción de datos en la tabla inscripcion
INSERT INTO inscripcion (fecha, monto, grado, seccion, id_aula, id_alumno, num_anio) VALUES
('2023-02-01', 500.00, 1, 'A', 1, 1, '2023')
,('2023-02-02', 500.00, 2, 'A', 2, 2, '2023')
,('2023-02-03', 500.00, 3, 'B', 3, 3, '2023')
,('2023-02-04', 500.00, 4, 'B', 4, 4, '2023')
,('2023-02-05', 500.00, 5, 'A', 5, 5, '2023')
,('2023-02-06', 500.00, 6, 'A', 6, 6, '2023')
,('2023-02-07', 500.00, 1, 'B', 7, 7, '2023')
,('2023-02-08', 500.00, 2, 'B', 8, 8, '2023')
,('2023-02-09', 500.00, 3, 'A', 9, 9, '2023')
,('2023-02-10', 500.00, 4, 'A', 10, 10, '2023');


-- Inserción de datos en la tabla trimestres
INSERT INTO trimestres (descripcion) VALUES
('Primer Trimestre58')
, ('Segundo Trimestre')
, ('Tercer Trimestre')
, ('Primer Trimestre 2022')
, ('Segundo Trimestre 2022')
, ('Tercer Trimestre 2022')
,('Primer Trimestre 2021')
, ('Segundo Trimestre 2021')
, ('Tercer Trimestre 2021')
,('Primer Trimestre 2020');

-- Inserción de datos en la tabla docente
INSERT INTO docente (dni, nombres, apellidos, edad, sexo, direccion, email, telefono, fecha_nacimiento, id_especialidad) VALUES
('45612378', 'Carlos', 'Mendez', 45, 'M', 'Calle 11', 'carlos.mendez@mail.com', '111111111', '1979-05-01', 1)
,('56723489', 'Mariana', 'Silva', 38, 'F', 'Calle 12', 'mariana.silva@mail.com', '222222222', '1986-06-15', 2)
,('67834590', 'Jose', 'Ramirez', 42, 'M', 'Calle 13', 'jose.ramirez@mail.com', '333333333', '1982-07-20', 3)
,('78945601', 'Elena', 'Fernandez', 35, 'F', 'Calle 14', 'elena.fernandez@mail.com', '444444444', '1989-08-25', 4)
,('89056712', 'Miguel', 'Soto', 37, 'M', 'Calle 15', 'miguel.soto@mail.com', '555555555', '1987-09-30', 5)
,('89067812', 'Luis', 'Gomez', 44, 'M', 'Calle 16', 'luis.gomez@mail.com', '666666666', '1980-10-10', 1)
,('90178923', 'Claudia', 'Lopez', 37, 'F', 'Calle 17', 'claudia.lopez@mail.com', '777777777', '1987-11-20', 2)
,('01289034', 'Fernando', 'Perez', 41, 'M', 'Calle 18', 'fernando.perez@mail.com', '888888888', '1983-12-30', 3)
,('12390145', 'Marta', 'Sanchez', 34, 'F', 'Calle 19', 'marta.sanchez@mail.com', '999999999', '1990-01-15', 4)
,('23401256', 'Roberto', 'Ruiz', 39, 'M', 'Calle 20', 'roberto.ruiz@mail.com', '000000000', '1985-02-25', 5);

-- Inserción de datos en la tabla horario
INSERT INTO horario (id_horario, dia, hora_inicio, hora_fin, seccion, id_aula, id_docente, id_curso) VALUES
(1, 'Lunes', '08:00:00', '09:00:00', 'A', 1, 1, 1)
,(2, 'Martes', '09:00:00', '10:00:00', 'A', 2, 2, 2)
,(3, 'Miércoles', '10:00:00', '11:00:00', 'B', 3, 3, 3)
,(4, 'Jueves', '11:00:00', '12:00:00', 'B', 4, 4, 4)
,(5, 'Viernes', '12:00:00', '13:00:00', 'A', 5, 5, 5)
,(6, 'Lunes', '08:00:00', '09:00:00', 'B', 6, 6, 6)
,(7, 'Martes', '09:00:00', '10:00:00', 'B', 7, 7, 7)
,(8, 'Miércoles', '10:00:00', '11:00:00', 'A', 8, 8, 8)
,(9, 'Jueves', '11:00:00', '12:00:00', 'A', 9, 9, 9)
,(10, 'Viernes', '12:00:00', '13:00:00', 'B', 10, 10, 10);

-- Inserción de datos en la tabla notas
INSERT INTO notas (nota, descripcion, id_curso, id_alumno, id_trimestre) VALUES
(9.5, 'Nota final', 1, 1, 1)
,(8.0, 'Nota final', 2, 2, 2)
,(7.5, 'Nota final', 3, 3, 3)
,(9.0, 'Nota final', 4, 4, 4)
,(10.0, 'Nota final', 5, 5, 5)
,(8.5, 'Nota parcial', 6, 6, 6)
,(7.0, 'Nota parcial', 7, 7, 7)
,(9.0, 'Nota parcial', 8, 8, 8)
,(8.0, 'Nota parcial', 9, 9, 9)
,(7.5, 'Nota parcial', 10, 10, 10)
,(3.5, 'Nota final', 1, 1, 1)
,(1.0, 'Nota final', 2, 2, 2)
,(9.5, 'Nota final', 3, 3, 3)
,(9.0, 'Nota final', 4, 4, 4)
,(10.0, 'Nota final', 5, 5, 5)
,(5.5, 'Nota parcial', 6, 6, 6)
,(3.0, 'Nota parcial', 7, 7, 7)
,(9.0, 'Nota parcial', 8, 8, 8)
,(6.0, 'Nota parcial', 9, 9, 9)
,(3.5, 'Nota parcial', 10, 10, 10)
,(9.5, 'Nota final', 1, 1, 1)
,(6.0, 'Nota final', 2, 2, 2)
,(5.5, 'Nota final', 3, 3, 3)
,(1.0, 'Nota final', 4, 4, 4)
,(1.0, 'Nota final', 5, 5, 5)
,(3.5, 'Nota parcial', 6, 6, 6)
,(8.0, 'Nota parcial', 7, 7, 7)
,(7.0, 'Nota parcial', 8, 8, 8)
,(4.0, 'Nota parcial', 9, 9, 9)
,(7.5, 'Nota parcial', 10, 10, 10);