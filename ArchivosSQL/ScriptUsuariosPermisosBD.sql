-- --------------------------- USUARIOS Y PERMISOS ----------------------
-- Crear 5 usuarios
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY '11111111';
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY '22222222';
CREATE USER 'usuario3'@'localhost' IDENTIFIED BY '33333333';
CREATE USER 'usuario4'@'localhost' IDENTIFIED BY '44444444';

-- PERMISOS

-- Admin: Tiene todos los privilegios en la base de datos
GRANT ALL PRIVILEGES ON colegioPrimario.* TO 'admin'@'localhost';

-- Usuario 1: Permisos para ejecutar procedimientos almacenados y funciones
GRANT EXECUTE ON PROCEDURE colegioPrimario.AsignarTutor TO 'usuario1'@'localhost';
GRANT EXECUTE ON PROCEDURE colegioPrimario.InscribirAlumno TO 'usuario1'@'localhost';
GRANT EXECUTE ON FUNCTION colegioPrimario.obtenerEdadAlumno TO 'usuario1'@'localhost';
GRANT EXECUTE ON FUNCTION colegioPrimario.totalAlumnosInscritos TO 'usuario1'@'localhost';

-- Usuario 2: SELECT, INSERT, y UPDATE en las tablas alumno y docente
GRANT SELECT, INSERT, UPDATE ON colegioPrimario.alumno TO 'usuario2'@'localhost';
GRANT SELECT, INSERT, UPDATE ON colegioPrimario.docente TO 'usuario2'@'localhost';

-- Usuario 3: Permisos para seleccionar y actualizar a través de vistas
GRANT SELECT, UPDATE ON colegioPrimario.VistaAlumnosTutores TO 'usuario3'@'localhost';
GRANT SELECT, UPDATE ON colegioPrimario.VistaInscripciones TO 'usuario3'@'localhost';

-- Usuario 4: El usuario tiene permisos completos para ejecutar todos los procedimientos almacenados y funciones, y puede consultar y modificar las vistas vw_alumnosActivos y vw_docentesPorEspecialidad. Además, tiene permisos completos sobre la tabla inscripcion.
GRANT EXECUTE ON PROCEDURE colegioPrimario.* TO 'usuario4'@'localhost';
GRANT EXECUTE ON FUNCTION colegioPrimario.* TO 'usuario4'@'localhost';

-- Permisos para consultar y modificar las vistas
GRANT SELECT, INSERT, UPDATE, DELETE ON colegioPrimario.VistaInscripciones TO 'usuario4'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON colegioPrimario.VistaAlumnosTutores TO 'usuario4'@'localhost';

-- Permisos para modificar la tabla 'inscripcion'
GRANT SELECT, INSERT, UPDATE, DELETE ON colegioPrimario.inscripcion TO 'usuario4'@'localhost';

-- Aplicar los cambios
FLUSH PRIVILEGES;