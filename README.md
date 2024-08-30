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
![Primera entrega MySQL_pages-to-jpg-0005](https://github.com/user-attachments/assets/4717367f-cb4c-439e-9612-73b49ee7e7e4)


## Vistas
Se requiere una seri de vistas de labase de datos donde los usuarios puedan consultar subconjuntos de datos para que los usuarios puedan trabajar sin afectar la BD.

* VISTA 1: Muestra una vista de los datos de los alumnos dela institucion educativa y de sus tutores.
* VISTA 2: Muestra los datos de las inscripciones de los alumnos de la institucion.
* VISTA 3: Permite visualizar las notas de los alumnos

## Funciones
Con el objetivo de agilizar las consultas a la base de datos se necesita contar con funciones que permitan realizar consultas rutinarias en la base de datos. 

* Funcion 1. Permite Obtener la edad de un alumno determinado a partir del campo id_alumno. (Deterministica)

* Funcion 2. Permite obtener el número total de alumnos inscritos enla institucion educativa para un año específico.

* Funcion 3. Nos muestra la cantidad de vacantes disponibles en un aula en particular.

* Funcion 4. Permite obtener la calificación promedio de un alumno en un curso específico

## Procedimientos 
Con el objetivo de aligerar las aplicaciones se solicito la creacion de procedimientos que permitan simplificar la conexion de la aplicacion con la base de datos.

* Procedimiento 1: Permite insertar los datos de un nuevo alumno a la BD.
* Procedimiento 2: Permite relacionar un tutor con el alumno por el cual responde ante la institucion educativa.
* Procedimiento 3: Permite la carga de los datos para incripcion de un alumno determinado.

## Triggers
* Trigger 1: Tiene como objetivo verificar la capacidad del aula antes de la inscripción de los alunos
* Trigger 2: Actualiza las vacantes libres al momento de inscribir alumno.
* Trigger 3: Tiene como objetivo evitar que se ingrese un DNI duplicado en la tabla de alumnos
* Trigger 4: Registra cualquier actualización en la tabla "docente" en una tabla de auditoría llamada "auditoria_docente".

## Creacion de usuarios y asignacion de permisos
Con el objetivo de mantener la integridad de la BD y sus elementos es necesario restringir el acceso de los usuarios y las acciones que ellos pueden realizar sobre la BD, para ello se crearon 5 usuarios genericos y se les asignaron permisos para que solo puedan realizar acciones autorizadas por el administrador de la BD.

USUARIOS
* admin
* usuario1
* usuario2
* usuario3
* usuario4

PERMISOS
* admin: Es el usuario administrador de la base de datos, por lo tanto tiene todos los privilegios.
* usuario 1: A este usuario se le asignaron permisos para ejecutar los procedimientos almacenados y funciones que se encuentran almacenados en la BD.
* usuario 2: Este usuario solo tiene privilegios para realizar SELECT, INSERT, y UPDATE en las tablas alumno y docente
* usuario 3: El usuario solo esta habilitado para seleccionar y actualizar a través de vistas.
* usuario 4: El usuario tiene permisos completos para ejecutar todos los procedimientos almacenados y funciones, y puede consultar y modificar las vistas vw_alumnosActivos y vw_docentesPorEspecialidad. Además, tiene permisos completos sobre la tabla inscripcion, lo que le permite realizar operaciones de selección, inserción, actualización y eliminación en dicha tabla.

# Backup
Es necesario crear una copia de respaldo de los datos exixtente en la BD que puedan ser recuparados en caso de producirse un fallo de los datos principales. La copia de seguridad, incluye todas las tablas de la base de datos, sus vistas, procedimientos, funciones, triggers y permisos asignados a los usuarios.
