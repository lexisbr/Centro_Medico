-- -----------------------------------------------------
-- Esquema CENTRO_MEDICO
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS CENTRO_MEDICO;
CREATE SCHEMA IF NOT EXISTS CENTRO_MEDICO;
USE CENTRO_MEDICO;

-- -----------------------------------------------------
-- Tabla PACIENTE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PACIENTE (
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `dpi` VARCHAR(13) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `peso` VARCHAR(45) NOT NULL,
  `tipo_sangre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`codigo`)
);

-- -----------------------------------------------------
-- Tabla MEDICO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS MEDICO (
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `numero_colegiado` VARCHAR(45) NOT NULL,
  `dpi` VARCHAR(13) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `hora_entrada` TIME NOT NULL,
  `hora_salida` TIME NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`codigo`)
);

-- -----------------------------------------------------
-- Tabla EXAMEN_LABORATORIO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS EXAMEN_LABORATORIO (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `requiere_orden` TINYINT(1) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `costo` DOUBLE NOT NULL,
  `tipo_archivo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`)
);

-- -----------------------------------------------------
-- Tabla LABORATORISTA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LABORATORISTA (
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `numero_registro` VARCHAR(45) NOT NULL,
  `dpi` VARCHAR(13) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `examen_laboratorio_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
      FOREIGN KEY (`examen_laboratorio_codigo`) REFERENCES EXAMEN_LABORATORIO (`codigo`)
);

-- -----------------------------------------------------
-- Tabla ADMINISTRADOR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADMINISTRADOR (
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `dpi` VARCHAR(13) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`codigo`)
);

-- -----------------------------------------------------
-- Tabla ESPECIALIDAD
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ESPECIALIDAD (
  `nombre` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`nombre`)
);

-- -----------------------------------------------------
-- Tabla CONSULTA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTA (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `costo` DOUBLE NOT NULL,
  `nombre_especialidad` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`codigo`,`nombre_especialidad`),
    FOREIGN KEY(`nombre_especialidad`) REFERENCES ESPECIALIDAD(`nombre`)
);

-- -----------------------------------------------------
-- Tabla CITA_MEDICA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS 	CITA_MEDICA (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `paciente_codigo` VARCHAR(45) NOT NULL,
  `medico_codigo` VARCHAR(45) NOT NULL,
  `consulta_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`,`fecha`,`hora`,`medico_codigo`),
      FOREIGN KEY(`paciente_codigo`) REFERENCES PACIENTE(`codigo`),
	  FOREIGN KEY(`medico_codigo`) REFERENCES MEDICO(`codigo`),
	  FOREIGN KEY(`consulta_codigo`) REFERENCES CONSULTA(`codigo`)
);

-- -----------------------------------------------------
-- Tabla CITA_EXAMEN
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CITA_EXAMEN (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `orden_medico` LONGBLOB,
  `paciente_codigo` VARCHAR(45) NOT NULL,
  `laboratorista_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY(`codigo`),
	FOREIGN KEY (`paciente_codigo`) REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`laboratorista_codigo`) REFERENCES LABORATORISTA (`codigo`)
);

-- -----------------------------------------------------
-- Tabla INFORME_CONSULTA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS INFORME_CONSULTA (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(300) NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `consulta_codigo` INT NOT NULL,
  `paciente_codigo` VARCHAR(45) NOT NULL,
  `medico_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
	FOREIGN KEY (`consulta_codigo`) REFERENCES CONSULTA (`codigo`),
    FOREIGN KEY (`paciente_codigo`) REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`medico_codigo`) REFERENCES MEDICO (`codigo`)
);

-- -----------------------------------------------------
-- Tabla INFORME_EXAMEN 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS INFORME_EXAMEN (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(300) NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `examen_laboratorio_codigo` INT NOT NULL,
  `paciente_codigo` VARCHAR(45) NOT NULL,
  `laboratorista_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
    FOREIGN KEY (`examen_laboratorio_codigo`) REFERENCES EXAMEN_LABORATORIO (`codigo`),
    FOREIGN KEY (`paciente_codigo`) REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`laboratorista_codigo`) REFERENCES LABORATORISTA (`codigo`)
);

-- -----------------------------------------------------
-- Tabla ESPECIALIZACION
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ESPECIALIZACION (
  `especialidad_nombre` VARCHAR(150) NOT NULL,
  `medico_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`especialidad_nombre`, `medico_codigo`),
	FOREIGN KEY (`especialidad_nombre`) REFERENCES ESPECIALIDAD (`nombre`),
    FOREIGN KEY (`medico_codigo`) REFERENCES MEDICO (`codigo`)
);

-- -----------------------------------------------------
-- Tabla ORDEN_EXAMEN
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ORDEN_EXAMEN(
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(150) NOT NULL,
  `medico_codigo` VARCHAR(45) NOT NULL,
  `paciente_codigo` VARCHAR(45) NOT NULL,
  `examen_laboratorio_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
	FOREIGN KEY (`medico_codigo`) REFERENCES MEDICO (`codigo`),
    FOREIGN KEY (`paciente_codigo`) REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`examen_laboratorio_codigo`) REFERENCES EXAMEN_LABORATORIO (`codigo`)
);

-- -----------------------------------------------------
-- Tabla DIAS_TRABAJO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS DIAS_TRABAJO(
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `dias` VARCHAR(45) NOT NULL,
  `laboratorista_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
	FOREIGN KEY (`laboratorista_codigo`) REFERENCES LABORATORISTA (`codigo`)
);

