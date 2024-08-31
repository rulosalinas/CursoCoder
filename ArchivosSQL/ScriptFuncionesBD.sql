-- ----------------- FUNCIONES ------------------------
USE colegioprimario;
-- 1. Obtener la edad de un alumno a partir del campo id_alumno. (Deterministica)

DROP FUNCTION IF EXISTS colegioprimario.obtenerEdadAlumno;
DELIMITER //
CREATE FUNCTION obtenerEdadAlumno(id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE edad INT;
    SELECT TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) INTO edad
    FROM alumno
    WHERE id_alumno = id;
    RETURN edad;
END//

DELIMITER ;

-- 2. Obtener el número total de alumnos inscritos en un año específico 

DROP FUNCTION IF EXISTS colegioprimario.totalAlumnosInscritos;
DELIMITER //
CREATE FUNCTION totalAlumnosInscritos(anio VARCHAR(4)) 
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(id_alumno) INTO total
    FROM inscripcion
    WHERE num_anio = anio;
    RETURN total;
END//

DELIMITER ;

-- 3. Obtener la cantidad de vacantes disponibles en un aula.

DROP FUNCTION IF EXISTS colegioprimario.vacantesDisponiblesAula;
DELIMITER //
CREATE FUNCTION vacantesDisponiblesAula(id INT) 
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE vacantes INT;
    SELECT vacantes_Lib INTO vacantes
    FROM aulas
    WHERE id_aula = id;
    RETURN vacantes;
END//

DELIMITER ;


-- 4. Obtener la calificación promedio de un alumno en un curso específico

DROP FUNCTION IF EXISTS colegioprimario.promedioCalificacionesAlumno;
DELIMITER //
CREATE FUNCTION promedioCalificacionesAlumno(id_alumno INT, id_curso INT) 
RETURNS DECIMAL(3, 1)
READS SQL DATA
BEGIN
    DECLARE promedio DECIMAL(3, 1);
    SELECT AVG(nota) INTO promedio
    FROM notas
    WHERE id_alumno = id_alumno AND id_curso = id_curso;
    RETURN promedio;
END//
DELIMITER ;


-- 5. Obtener una lista de los nombres completos de los tutores de un alumno dado su id.

DROP FUNCTION IF EXISTS colegioprimario.listaTutoresAlumno;
DELIMITER //
CREATE FUNCTION listaTutoresAlumno(id INT) 
RETURNS TEXT
READS SQL DATA
BEGIN
    DECLARE tutores TEXT;
    SELECT GROUP_CONCAT(CONCAT(nombres, ' ', apellidos) SEPARATOR ', ') INTO tutores
    FROM tutor t
    JOIN tutor_alumno ta ON t.id_tutor = ta.id_tutor
    WHERE ta.id_alumno = id;
    RETURN tutores;
END//

DELIMITER ;

