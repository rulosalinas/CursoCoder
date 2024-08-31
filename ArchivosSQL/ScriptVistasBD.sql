-- ----------------- VISTAS --------------------------

USE colegioprimario;

-- 1: Vista de alumnos con sus tutores

DROP VIEW IF EXISTS colegioprimario.VistaAlumnosTutores;
CREATE VIEW VistaAlumnosTutores AS
SELECT a.id_alumno, a.nombre, a.apellido, t.nombres AS tutor_nombre, t.apellidos AS tutor_apellido, ta.parentesco
FROM alumno a
JOIN tutor_alumno ta ON a.id_alumno = ta.id_alumno
JOIN tutor t ON ta.id_tutor = t.id_tutor;

-- 2: Vista de inscripciones

DROP VIEW IF EXISTS colegioprimario.VistaInscripciones;
CREATE VIEW VistaInscripciones AS
SELECT i.num_matricula, a.nombre AS alumno_nombre, a.apellido AS alumno_apellido, i.fecha, i.monto, i.grado, i.seccion, au.capacidad
FROM inscripcion i
JOIN alumno a ON i.id_alumno = a.id_alumno
JOIN aulas au ON i.id_aula = au.id_aula;


-- 3: Vista de notas de alumnos--


DROP VIEW IF EXISTS colegioprimario.VistaNotasAlumnos;
CREATE VIEW VistaNotasAlumnos AS
SELECT n.id_notas, a.nombre, a.apellido, c.nombre AS curso_nombre, n.nota, t.descripcion AS trimestre
FROM notas n
JOIN alumno a ON n.id_alumno = a.id_alumno
JOIN curso c ON n.id_curso = c.cod_curso
JOIN trimestres t ON n.id_trimestre = t.cod_trimestre;