-- -------------- PROCEDIMIENTOS ALMACENADOS -----------------------------
USE colegioprimario;

-- 1: Insertar un nuevo alumno

DROP PROCEDURE IF EXISTS colegioprimario.InsertarAlumno;
DELIMITER //
CREATE PROCEDURE InsertarAlumno(
    IN p_dni VARCHAR(8)
    ,IN p_nombre VARCHAR(30)
    ,IN p_apellido VARCHAR(12)
    ,IN p_edad TINYINT
    ,IN p_sexo VARCHAR(1)
    ,IN p_direccion VARCHAR(50)
    ,IN p_fecha_Nacimiento DATE
)
BEGIN
    INSERT INTO alumno (dni, nombre, apellido, edad, sexo, direccion, fecha_Nacimiento)
    VALUES (p_dni, p_nombre, p_apellido, p_edad, p_sexo, p_direccion, p_fecha_Nacimiento);
END //
DELIMITER ;

-- 2: Asignar un tutor a un alumno

DROP PROCEDURE IF EXISTS colegioprimario.AsignarTutor;
DELIMITER //
CREATE PROCEDURE AsignarTutor(
    IN p_id_alumno INT
    ,IN p_id_tutor INT
    ,IN p_parentesco VARCHAR(30)
)
BEGIN
    INSERT INTO tutor_alumno (id_alumno, id_tutor, parentesco)
    VALUES (p_id_alumno, p_id_tutor, p_parentesco);
END //
DELIMITER ;


-- 3: Inscribir a un alumno

DROP PROCEDURE IF EXISTS colegioprimario.InscribirAlumno;
DELIMITER //
CREATE PROCEDURE InscribirAlumno(
    IN p_fecha DATE
    ,IN p_monto DECIMAL(5,2)
    ,IN p_grado INT
    ,IN p_seccion VARCHAR(1)
    ,IN p_id_aula INT
    ,IN p_id_alumno INT
    ,IN p_num_anio VARCHAR(4)
)
BEGIN
    INSERT INTO inscripcion (fecha, monto, grado, seccion, id_aula, id_alumno, num_anio)
    VALUES (p_fecha, p_monto, p_grado, p_seccion, p_id_aula, p_id_alumno, p_num_anio);
END //
DELIMITER ;