-- ----------------- TRIGGERS --------------------------------------

USE colegioprimario;

-- 1: Verificar la capacidad del aula antes de la inscripción de los alunos

DROP TRIGGER IF EXISTS colegioprimario.VerificarCapacidadAula;
DELIMITER //
CREATE TRIGGER VerificarCapacidadAula
BEFORE INSERT ON inscripcion
FOR EACH ROW
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM inscripcion
    WHERE id_aula = NEW.id_aula;
    
    IF total >= (SELECT capacidad FROM aulas WHERE id_aula = NEW.id_aula) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay vacantes disponibles en el aula seleccionada';
    END IF;
END //
DELIMITER ;


-- 2: Actualizar vacantes libres al inscribir alumno

DROP TRIGGER IF EXISTS colegioprimario.ActualizarVacantesLibres;
DELIMITER //
CREATE TRIGGER ActualizarVacantesLibres
AFTER INSERT ON inscripcion
FOR EACH ROW
BEGIN
    UPDATE aulas
    SET vacantes_Lib = vacantes_Lib - 1
    WHERE id_aula = NEW.id_aula;
END //
DELIMITER ;

-- 3: Evitar duplicidad de DNI en la tabla de alumnos

DROP TRIGGER IF EXISTS colegioprimario.EvitarDuplicidadDniAlumno;
DELIMITER //
CREATE TRIGGER EvitarDuplicidadDniAlumno
BEFORE INSERT ON alumno
FOR EACH ROW
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM alumno
    WHERE dni = NEW.dni;
    
    IF total > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El DNI ya está registrado para otro alumno';
        
    END IF;
END //
DELIMITER ;

-- 4: Registrará cualquier actualización en la tabla "docente" en una tabla de auditoría llamada "auditoria_docente".

CREATE TABLE auditoria_docente (
    id_auditoria INT NOT NULL AUTO_INCREMENT,
    id_docente INT NOT NULL,
    dni VARCHAR(8) NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    edad INT NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    telefono VARCHAR(12) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    accion VARCHAR(10) NOT NULL, -- Tipo de acción (UPDATE)
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Hora de la acción
    PRIMARY KEY (id_auditoria)
);

DELIMITER //

CREATE TRIGGER after_update_docente
AFTER UPDATE ON docente
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_docente (id_docente, dni, nombres, apellidos, edad, sexo, direccion, email, telefono, fecha_nacimiento, accion)
    VALUES (NEW.id_docente, NEW.dni, NEW.nombres, NEW.apellidos, NEW.edad, NEW.sexo, NEW.direccion, NEW.email, NEW.telefono, NEW.fecha_nacimiento, 'UPDATE');
END //

DELIMITER ;
