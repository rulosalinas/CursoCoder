CREATE DATABASE  IF NOT EXISTS `colegioprimario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `colegioprimario`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: colegioprimario
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(12) NOT NULL,
  `edad` tinyint NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `fecha_Nacimiento` date NOT NULL,
  PRIMARY KEY (`id_alumno`),
  CONSTRAINT `alumno_chk_1` CHECK ((`sexo` in (_utf8mb4'M',_utf8mb4'F')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'12345678','Juan','Perez',10,'M','Calle 1','2014-05-01'),(2,'23456789','Ana','Garcia',11,'F','Calle 2','2013-06-15'),(3,'34567890','Luis','Martinez',9,'M','Calle 3','2015-07-20'),(4,'45678901','Maria','Lopez',10,'F','Calle 4','2014-08-25'),(5,'56789012','Carlos','Gonzalez',11,'M','Calle 5','2013-09-30'),(6,'67890123','Lucia','Rodriguez',9,'F','Calle 6','2015-10-05'),(7,'78901234','Jose','Fernandez',10,'M','Calle 7','2014-11-10'),(8,'89012345','Laura','Sanchez',11,'F','Calle 8','2013-12-15'),(9,'90123456','Miguel','Romero',9,'M','Calle 9','2015-01-20'),(10,'11234567','Sofia','Diaz',10,'F','Calle 10','2014-02-25');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `EvitarDuplicidadDniAlumno` BEFORE INSERT ON `alumno` FOR EACH ROW BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM alumno
    WHERE dni = NEW.dni;
    
    IF total > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El DNI ya está registrado para otro alumno';
        
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `anio_escolar`
--

DROP TABLE IF EXISTS `anio_escolar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anio_escolar` (
  `num_anio` varchar(4) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`num_anio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anio_escolar`
--

LOCK TABLES `anio_escolar` WRITE;
/*!40000 ALTER TABLE `anio_escolar` DISABLE KEYS */;
INSERT INTO `anio_escolar` VALUES ('2014','2014-03-01','2014-12-15'),('2015','2015-03-01','2015-12-15'),('2016','2016-03-01','2016-12-15'),('2017','2017-03-01','2017-12-15'),('2018','2018-03-01','2018-12-15'),('2019','2019-03-01','2019-12-15'),('2020','2020-03-01','2020-12-15'),('2021','2021-03-01','2021-12-15'),('2022','2022-03-01','2022-12-15'),('2023','2023-03-01','2023-12-15');
/*!40000 ALTER TABLE `anio_escolar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_docente`
--

DROP TABLE IF EXISTS `auditoria_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_docente` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_docente` int NOT NULL,
  `dni` varchar(8) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `edad` int NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `accion` varchar(10) NOT NULL,
  `fecha_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_docente`
--

LOCK TABLES `auditoria_docente` WRITE;
/*!40000 ALTER TABLE `auditoria_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aulas` (
  `id_aula` int NOT NULL AUTO_INCREMENT,
  `capacidad` int NOT NULL,
  `vacantes_Lib` int DEFAULT NULL,
  PRIMARY KEY (`id_aula`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
INSERT INTO `aulas` VALUES (1,30,5),(2,25,0),(3,30,10),(4,20,5),(5,25,2),(6,30,3),(7,30,4),(8,25,1),(9,20,0),(10,30,0);
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `cod_curso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Matemáticas'),(2,'Lengua'),(3,'Ciencias Naturales'),(4,'Ciencias Sociales'),(5,'Educación Física'),(6,'Inglés'),(7,'Música'),(8,'Arte'),(9,'Tecnología'),(10,'Informática');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `id_docente` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `edad` int NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_especialidad` int NOT NULL,
  PRIMARY KEY (`id_docente`),
  KEY `fk_docente_especialidad` (`id_especialidad`),
  CONSTRAINT `fk_docente_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`),
  CONSTRAINT `docente_chk_1` CHECK ((`sexo` in (_utf8mb4'M',_utf8mb4'F')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'45612378','Carlos','Mendez',45,'M','Calle 11','carlos.mendez@mail.com','111111111','1979-05-01',1),(2,'56723489','Mariana','Silva',38,'F','Calle 12','mariana.silva@mail.com','222222222','1986-06-15',2),(3,'67834590','Jose','Ramirez',42,'M','Calle 13','jose.ramirez@mail.com','333333333','1982-07-20',3),(4,'78945601','Elena','Fernandez',35,'F','Calle 14','elena.fernandez@mail.com','444444444','1989-08-25',4),(5,'89056712','Miguel','Soto',37,'M','Calle 15','miguel.soto@mail.com','555555555','1987-09-30',5),(6,'89067812','Luis','Gomez',44,'M','Calle 16','luis.gomez@mail.com','666666666','1980-10-10',1),(7,'90178923','Claudia','Lopez',37,'F','Calle 17','claudia.lopez@mail.com','777777777','1987-11-20',2),(8,'01289034','Fernando','Perez',41,'M','Calle 18','fernando.perez@mail.com','888888888','1983-12-30',3),(9,'12390145','Marta','Sanchez',34,'F','Calle 19','marta.sanchez@mail.com','999999999','1990-01-15',4),(10,'23401256','Roberto','Ruiz',39,'M','Calle 20','roberto.ruiz@mail.com','000000000','1985-02-25',5);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_docente` AFTER UPDATE ON `docente` FOR EACH ROW BEGIN
    INSERT INTO auditoria_docente (id_docente, dni, nombres, apellidos, edad, sexo, direccion, email, telefono, fecha_nacimiento, accion)
    VALUES (NEW.id_docente, NEW.dni, NEW.nombres, NEW.apellidos, NEW.edad, NEW.sexo, NEW.direccion, NEW.email, NEW.telefono, NEW.fecha_nacimiento, 'UPDATE');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `id_especialidad` int NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(30) NOT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'Matemáticas'),(2,'Lengua'),(3,'Ciencias Naturales'),(4,'Ciencias Sociales'),(5,'Educación Física'),(6,'Inglés'),(7,'Música'),(8,'Arte'),(9,'Tecnología'),(10,'Informática');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id_horario` int NOT NULL,
  `dia` varchar(12) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `seccion` varchar(1) NOT NULL,
  `id_aula` int NOT NULL,
  `id_docente` int NOT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `fk_horario_docente` (`id_docente`),
  KEY `fk_horario_curso` (`id_curso`),
  CONSTRAINT `fk_horario_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`cod_curso`),
  CONSTRAINT `fk_horario_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,'Lunes','08:00:00','09:00:00','A',1,1,1),(2,'Martes','09:00:00','10:00:00','A',2,2,2),(3,'Miércoles','10:00:00','11:00:00','B',3,3,3),(4,'Jueves','11:00:00','12:00:00','B',4,4,4),(5,'Viernes','12:00:00','13:00:00','A',5,5,5),(6,'Lunes','08:00:00','09:00:00','B',6,6,6),(7,'Martes','09:00:00','10:00:00','B',7,7,7),(8,'Miércoles','10:00:00','11:00:00','A',8,8,8),(9,'Jueves','11:00:00','12:00:00','A',9,9,9),(10,'Viernes','12:00:00','13:00:00','B',10,10,10);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripcion` (
  `num_matricula` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `monto` decimal(5,2) NOT NULL,
  `grado` int NOT NULL,
  `seccion` varchar(1) NOT NULL,
  `id_aula` int NOT NULL,
  `id_alumno` int NOT NULL,
  `num_anio` varchar(4) NOT NULL,
  PRIMARY KEY (`num_matricula`),
  KEY `fk_inscripcion_aula` (`id_aula`),
  KEY `fk_inscripcion_alumno` (`id_alumno`),
  KEY `fk_inscripcion_anioescolar` (`num_anio`),
  CONSTRAINT `fk_inscripcion_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `fk_inscripcion_anioescolar` FOREIGN KEY (`num_anio`) REFERENCES `anio_escolar` (`num_anio`),
  CONSTRAINT `fk_inscripcion_aula` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`),
  CONSTRAINT `inscripcion_chk_1` CHECK ((`monto` > 0.00)),
  CONSTRAINT `inscripcion_chk_2` CHECK ((`grado` between 1 and 6)),
  CONSTRAINT `inscripcion_chk_3` CHECK ((`seccion` in (_utf8mb4'A',_utf8mb4'B')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
INSERT INTO `inscripcion` VALUES (1,'2023-02-01',500.00,1,'A',1,1,'2023'),(2,'2023-02-02',500.00,2,'A',2,2,'2023'),(3,'2023-02-03',500.00,3,'B',3,3,'2023'),(4,'2023-02-04',500.00,4,'B',4,4,'2023'),(5,'2023-02-05',500.00,5,'A',5,5,'2023'),(6,'2023-02-06',500.00,6,'A',6,6,'2023'),(7,'2023-02-07',500.00,1,'B',7,7,'2023'),(8,'2023-02-08',500.00,2,'B',8,8,'2023'),(9,'2023-02-09',500.00,3,'A',9,9,'2023'),(10,'2023-02-10',500.00,4,'A',10,10,'2023');
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `VerificarCapacidadAula` BEFORE INSERT ON `inscripcion` FOR EACH ROW BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM inscripcion
    WHERE id_aula = NEW.id_aula;
    
    IF total >= (SELECT capacidad FROM aulas WHERE id_aula = NEW.id_aula) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay vacantes disponibles en el aula seleccionada';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ActualizarVacantesLibres` AFTER INSERT ON `inscripcion` FOR EACH ROW BEGIN
    UPDATE aulas
    SET vacantes_Lib = vacantes_Lib - 1
    WHERE id_aula = NEW.id_aula;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id_notas` int NOT NULL AUTO_INCREMENT,
  `nota` decimal(3,1) DEFAULT NULL,
  `descripcion` varchar(30) NOT NULL,
  `id_curso` int NOT NULL,
  `id_alumno` int NOT NULL,
  `id_trimestre` int NOT NULL,
  PRIMARY KEY (`id_notas`),
  KEY `fk_notas_curso` (`id_curso`),
  KEY `fk_notas_alumno` (`id_alumno`),
  KEY `fk_notas_trimestres` (`id_trimestre`),
  CONSTRAINT `fk_notas_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `fk_notas_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`cod_curso`),
  CONSTRAINT `fk_notas_trimestres` FOREIGN KEY (`id_trimestre`) REFERENCES `trimestres` (`cod_trimestre`),
  CONSTRAINT `notas_chk_1` CHECK (((`nota` >= 0) and (`nota` <= 10)))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,9.5,'Nota final',1,1,1),(2,8.0,'Nota final',2,2,2),(3,7.5,'Nota final',3,3,3),(4,9.0,'Nota final',4,4,4),(5,10.0,'Nota final',5,5,5),(6,8.5,'Nota parcial',6,6,6),(7,7.0,'Nota parcial',7,7,7),(8,9.0,'Nota parcial',8,8,8),(9,8.0,'Nota parcial',9,9,9),(10,7.5,'Nota parcial',10,10,10),(11,3.5,'Nota final',1,1,1),(12,1.0,'Nota final',2,2,2),(13,9.5,'Nota final',3,3,3),(14,9.0,'Nota final',4,4,4),(15,10.0,'Nota final',5,5,5),(16,5.5,'Nota parcial',6,6,6),(17,3.0,'Nota parcial',7,7,7),(18,9.0,'Nota parcial',8,8,8),(19,6.0,'Nota parcial',9,9,9),(20,3.5,'Nota parcial',10,10,10),(21,9.5,'Nota final',1,1,1),(22,6.0,'Nota final',2,2,2),(23,5.5,'Nota final',3,3,3),(24,1.0,'Nota final',4,4,4),(25,1.0,'Nota final',5,5,5),(26,3.5,'Nota parcial',6,6,6),(27,8.0,'Nota parcial',7,7,7),(28,7.0,'Nota parcial',8,8,8),(29,4.0,'Nota parcial',9,9,9),(30,7.5,'Nota parcial',10,10,10);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trimestres`
--

DROP TABLE IF EXISTS `trimestres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trimestres` (
  `cod_trimestre` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_trimestre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trimestres`
--

LOCK TABLES `trimestres` WRITE;
/*!40000 ALTER TABLE `trimestres` DISABLE KEYS */;
INSERT INTO `trimestres` VALUES (1,'Primer Trimestre58'),(2,'Segundo Trimestre'),(3,'Tercer Trimestre'),(4,'Primer Trimestre 2022'),(5,'Segundo Trimestre 2022'),(6,'Tercer Trimestre 2022'),(7,'Primer Trimestre 2021'),(8,'Segundo Trimestre 2021'),(9,'Tercer Trimestre 2021'),(10,'Primer Trimestre 2020');
/*!40000 ALTER TABLE `trimestres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutor` (
  `id_tutor` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `edad` int NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `fecha_Nacimiento` date NOT NULL,
  PRIMARY KEY (`id_tutor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
INSERT INTO `tutor` VALUES (1,'32145678','Pedro','Perez',35,'123456789','Calle 1','1989-05-01'),(2,'43256789','Marta','Garcia',40,'234567890','Calle 2','1984-06-15'),(3,'54367890','Javier','Martinez',38,'345678901','Calle 3','1986-07-20'),(4,'65478901','Rosa','Lopez',37,'456789012','Calle 4','1987-08-25'),(5,'76589012','Alberto','Gonzalez',36,'567890123','Calle 5','1988-09-30'),(6,'87690123','Cristina','Rodriguez',39,'678901234','Calle 6','1985-10-05'),(7,'98701234','Andres','Fernandez',34,'789012345','Calle 7','1990-11-10'),(8,'09812345','Laura','Sanchez',41,'890123456','Calle 8','1983-12-15'),(9,'10923456','Miguel','Romero',33,'901234567','Calle 9','1991-01-20'),(10,'21034567','Sofia','Diaz',42,'012345678','Calle 10','1982-02-25');
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_alumno`
--

DROP TABLE IF EXISTS `tutor_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutor_alumno` (
  `id_alumno` int NOT NULL,
  `id_tutor` int NOT NULL,
  `parentesco` varchar(30) NOT NULL,
  PRIMARY KEY (`id_alumno`,`id_tutor`),
  KEY `fk_tutoralumno_tutor` (`id_tutor`),
  CONSTRAINT `fk_tutoralumno_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `fk_tutoralumno_tutor` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_alumno`
--

LOCK TABLES `tutor_alumno` WRITE;
/*!40000 ALTER TABLE `tutor_alumno` DISABLE KEYS */;
INSERT INTO `tutor_alumno` VALUES (1,1,'Padre'),(2,2,'Tio'),(3,3,'Padre'),(4,4,'Madre'),(5,5,'Padre'),(6,6,'Abuelo'),(7,7,'Padre'),(8,8,'Madre'),(9,9,'Padre'),(10,10,'Abuela');
/*!40000 ALTER TABLE `tutor_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistaalumnostutores`
--

DROP TABLE IF EXISTS `vistaalumnostutores`;
/*!50001 DROP VIEW IF EXISTS `vistaalumnostutores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaalumnostutores` AS SELECT 
 1 AS `id_alumno`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `tutor_nombre`,
 1 AS `tutor_apellido`,
 1 AS `parentesco`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistainscripciones`
--

DROP TABLE IF EXISTS `vistainscripciones`;
/*!50001 DROP VIEW IF EXISTS `vistainscripciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistainscripciones` AS SELECT 
 1 AS `num_matricula`,
 1 AS `alumno_nombre`,
 1 AS `alumno_apellido`,
 1 AS `fecha`,
 1 AS `monto`,
 1 AS `grado`,
 1 AS `seccion`,
 1 AS `capacidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistanotasalumnos`
--

DROP TABLE IF EXISTS `vistanotasalumnos`;
/*!50001 DROP VIEW IF EXISTS `vistanotasalumnos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistanotasalumnos` AS SELECT 
 1 AS `id_notas`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `curso_nombre`,
 1 AS `nota`,
 1 AS `trimestre`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'colegioprimario'
--

--
-- Dumping routines for database 'colegioprimario'
--
/*!50003 DROP FUNCTION IF EXISTS `listaTutoresAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `listaTutoresAlumno`(id INT) RETURNS text CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE tutores TEXT;
    SELECT GROUP_CONCAT(CONCAT(nombres, ' ', apellidos) SEPARATOR ', ') INTO tutores
    FROM tutor t
    JOIN tutor_alumno ta ON t.id_tutor = ta.id_tutor
    WHERE ta.id_alumno = id;
    RETURN tutores;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtenerEdadAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtenerEdadAlumno`(id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE edad INT;
    SELECT TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) INTO edad
    FROM alumno
    WHERE id_alumno = id;
    RETURN edad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `promedioCalificacionesAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `promedioCalificacionesAlumno`(id_alumno INT, id_curso INT) RETURNS decimal(3,1)
    READS SQL DATA
BEGIN
    DECLARE promedio DECIMAL(3, 1);
    SELECT AVG(nota) INTO promedio
    FROM notas
    WHERE id_alumno = id_alumno AND id_curso = id_curso;
    RETURN promedio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `totalAlumnosInscritos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `totalAlumnosInscritos`(anio VARCHAR(4)) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(id_alumno) INTO total
    FROM inscripcion
    WHERE num_anio = anio;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `vacantesDisponiblesAula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `vacantesDisponiblesAula`(id INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE vacantes INT;
    SELECT vacantes_Lib INTO vacantes
    FROM aulas
    WHERE id_aula = id;
    RETURN vacantes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AsignarTutor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AsignarTutor`(
    IN p_id_alumno INT
    ,IN p_id_tutor INT
    ,IN p_parentesco VARCHAR(30)
)
BEGIN
    INSERT INTO tutor_alumno (id_alumno, id_tutor, parentesco)
    VALUES (p_id_alumno, p_id_tutor, p_parentesco);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InscribirAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InscribirAlumno`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAlumno`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vistaalumnostutores`
--

/*!50001 DROP VIEW IF EXISTS `vistaalumnostutores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaalumnostutores` AS select `a`.`id_alumno` AS `id_alumno`,`a`.`nombre` AS `nombre`,`a`.`apellido` AS `apellido`,`t`.`nombres` AS `tutor_nombre`,`t`.`apellidos` AS `tutor_apellido`,`ta`.`parentesco` AS `parentesco` from ((`alumno` `a` join `tutor_alumno` `ta` on((`a`.`id_alumno` = `ta`.`id_alumno`))) join `tutor` `t` on((`ta`.`id_tutor` = `t`.`id_tutor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistainscripciones`
--

/*!50001 DROP VIEW IF EXISTS `vistainscripciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistainscripciones` AS select `i`.`num_matricula` AS `num_matricula`,`a`.`nombre` AS `alumno_nombre`,`a`.`apellido` AS `alumno_apellido`,`i`.`fecha` AS `fecha`,`i`.`monto` AS `monto`,`i`.`grado` AS `grado`,`i`.`seccion` AS `seccion`,`au`.`capacidad` AS `capacidad` from ((`inscripcion` `i` join `alumno` `a` on((`i`.`id_alumno` = `a`.`id_alumno`))) join `aulas` `au` on((`i`.`id_aula` = `au`.`id_aula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistanotasalumnos`
--

/*!50001 DROP VIEW IF EXISTS `vistanotasalumnos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistanotasalumnos` AS select `n`.`id_notas` AS `id_notas`,`a`.`nombre` AS `nombre`,`a`.`apellido` AS `apellido`,`c`.`nombre` AS `curso_nombre`,`n`.`nota` AS `nota`,`t`.`descripcion` AS `trimestre` from (((`notas` `n` join `alumno` `a` on((`n`.`id_alumno` = `a`.`id_alumno`))) join `curso` `c` on((`n`.`id_curso` = `c`.`cod_curso`))) join `trimestres` `t` on((`n`.`id_trimestre` = `t`.`cod_trimestre`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 20:54:30
