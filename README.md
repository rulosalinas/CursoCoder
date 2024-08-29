# TRABAJO FINAL CURSO MySQL 

## Problema
Se necesita desarrollar un sistema que permita llevar el control de la información de alumnos y profesores de un
colegio Primario. Para ello el equipo de desarrollo necesita que se diseñe la base de datos para almacenar la
información necesaria de forma eficiente utilizando la tecnología que mejor se adapte a los requerimientos del
caso.

## Requisitos
* Llevar registro de los alumnos inscriptos en la institución, dar de alta a los ingresantes y del tutor/es a cargo.
* Al momento del alta del alumno se debe tener en cuenta el cupo establecido para cada aula.
* Se debe almacenar información sobre los profesores que trabajan en la institución, su especialidad, cursos y
horarios en los que dan clases.
* Se debe llevar el registro de las notas de cada alumno para cada trimestre del año lectivo.
* Se debe registrar la historial de cada alumno que pasa por la institución.

## Objetivo
Diseñar e implementar una base de datos relacional que satisfaga las necesidades de la institución sobre la gestión
de alumnos, profesores y cursos para tener un mejor control de las actividades. La base de datos deberá
cumplimentar los estándares básicos de integridad, evitar inconsistencias y debe facilitar el acceso a los datos
permitiendo una gestión ágil y precisa de todas las operaciones relacionadas con la institución.

## Descripción de las tablas de la base de datos
ALUMNO
* Contiene los datos personales de los alumnos
* Atributos: ID_ALUMNO, DNI, NOMBRE, APELLIDO, EDAD, SEXO, DIRECCIÓN, FECHA_NACIMIENTO

TUTOR
* Almacena los datos del tutor a cargo del alumno
* Atributos: ID_TUTOR, DNI, NOMBRES, APELLIDO, EDAD, TELEFONO, DIRECCION

TUTOR_ALUMNO
* Tabla intermedia, relaciona el tutor con el alumno
* Atributos: DNI_ALUMNO, DNI_APODERADO, PARENTESCO

AULAS
* Contiene los datos de las aulas que dispone la institución para el dictado de clases.
* Atributos: COD_AULA, CAPACIDAD, VACANTES_LIB

CURSOS
* Contiene información sobre los cursos
* Atributos: COD_CURSO, NOMBRE

INSCRIPCION
* Contiene los datos de inscripción del alumno
* Atributos: NUM_MATRICULA, FECHA, MONTO, GRADO, SECCIÓN, ID_AULA, ID_ALUMNO, NUM_AÑO

ANIO_ESCOLAR
* Contiene los datos sobre el año lectivo
* Atributos: NUM_ANIO, FECHA_INICIO, FECHA_FIN

TRIMESTRES
* Contienen información de los trimestres en los que se divide el año lectivo
* Atributos: COD_TRIMESTRE, DESCRIPCION

HORARIO
* Contiene la información de los horarios de los docentes en cada curso
* Atributos: DÍA, HORA_INICIO, HORA_FIN, SECCIÓN, ID_AULA, DNI_DOCENTE, ID_CURSO

NOTAS
* Contiene información sobre las notas de los alumnos
* Atributos: COD_NOTAS, NOTA, DESCRIPCIÓN, ID_CURSO, ID_ALUMNO, ID_TRIMESTRE

DOCENTE
* Contiene datos de los docentes de la institución
* Atributos: ID_DOCENTE, DNI, NOMBRES, APELLIDO, EDAD, SEXO, DIRECCIÓN, EMAIL, TELÉFONO,
FECHA_NACIMIENTO, ID_ESPECIALIDAD

ESPECIALIDAD
* Contiene datos de la espacialidad del docente
* Atributos: COD_ESPECIALIDAD, ESPECIALIDAD

DIAGRAMA ENTIDAD-RELACION
