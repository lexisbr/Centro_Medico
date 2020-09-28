DROP SCHEMA IF EXISTS CENTRO_MEDICO;
CREATE SCHEMA IF NOT EXISTS CENTRO_MEDICO;
USE CENTRO_MEDICO;

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

CREATE TABLE IF NOT EXISTS LABORATORISTA (
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `numero_registro` VARCHAR(45) NOT NULL,
  `dpi` VARCHAR(13) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`codigo`)
);

CREATE TABLE IF NOT EXISTS ADMINISTRADOR (
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `dpi` VARCHAR(13) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`codigo`)
);

CREATE TABLE IF NOT EXISTS ESPECIALIDAD (
  `nombre` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`nombre`)
);

CREATE TABLE IF NOT EXISTS 	CONSULTA (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `costo` DOUBLE NOT NULL,
  `nombre_especialidad` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`codigo`,`nombre_especialidad`),
    FOREIGN KEY(`nombre_especialidad`) REFERENCES ESPECIALIDAD(`nombre`)
);

CREATE TABLE IF NOT EXISTS 	CITA_MEDICA (
  `codigo` VARCHAR(45) NOT NULL,
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

CREATE TABLE IF NOT EXISTS EXAMEN_LABORATORIO (
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `requiere_orden` BIT NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `costo` DOUBLE NOT NULL,
  `tipo_archivo` VARCHAR(45) NOT NULL,
  `laboratorista_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
    FOREIGN KEY (`laboratorista_codigo`) REFERENCES LABORATORISTA (`codigo`)
);

CREATE TABLE IF NOT EXISTS CITA_EXAMEN (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `orden_medico` LONGBLOB,
  `paciente_codigo` VARCHAR(45) NOT NULL,
  `examen_laboratorio_codigo` VARCHAR(45) NOT NULL,
  `laboratorista_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY(`codigo`),
	FOREIGN KEY (`paciente_codigo`) REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`examen_laboratorio_codigo`) REFERENCES EXAMEN_LABORATORIO (`codigo`),
    FOREIGN KEY (`laboratorista_codigo`) REFERENCES LABORATORISTA (`codigo`)
);

CREATE TABLE IF NOT EXISTS INFORME_CONSULTA (
  `codigo` VARCHAR(45) NOT NULL,
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
         
CREATE TABLE IF NOT EXISTS INFORME_EXAMEN (
  `codigo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `examen_laboratorio_codigo` VARCHAR(45) NOT NULL,
  `paciente_codigo` VARCHAR(45) NOT NULL,
  `laboratorista_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
    FOREIGN KEY (`examen_laboratorio_codigo`) REFERENCES EXAMEN_LABORATORIO (`codigo`),
    FOREIGN KEY (`paciente_codigo`) REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`laboratorista_codigo`) REFERENCES LABORATORISTA (`codigo`)
);

CREATE TABLE IF NOT EXISTS ARCHIVO_INFORME(
	`archivo` LONGBLOB NOT NULL,
    `informe_examen_codigo` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`informe_examen_codigo`),
		FOREIGN KEY (`informe_examen_codigo`) REFERENCES INFORME_EXAMEN(`codigo`)
); 

CREATE TABLE IF NOT EXISTS ESPECIALIZACION (
  `especialidad_nombre` VARCHAR(150) NOT NULL,
  `medico_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`especialidad_nombre`, `medico_codigo`),
	FOREIGN KEY (`especialidad_nombre`) REFERENCES ESPECIALIDAD (`nombre`),
    FOREIGN KEY (`medico_codigo`) REFERENCES MEDICO (`codigo`)
);

CREATE TABLE IF NOT EXISTS ORDEN_EXAMEN(
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(150) NOT NULL,
  `medico_codigo` VARCHAR(45) NOT NULL,
  `paciente_codigo` VARCHAR(45) NOT NULL,
  `examen_laboratorio_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
	FOREIGN KEY (`medico_codigo`) REFERENCES MEDICO (`codigo`),
    FOREIGN KEY (`paciente_codigo`) REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`examen_laboratorio_codigo`) REFERENCES EXAMEN_LABORATORIO (`codigo`)
);

CREATE TABLE IF NOT EXISTS ARCHIVO_ORDEN(
	`archivo` LONGBLOB NOT NULL,
    `orden_examen_codigo` INT NOT NULL,
    PRIMARY KEY (`orden_examen_codigo`),
		FOREIGN KEY (`orden_examen_codigo`) REFERENCES ORDEN_EXAMEN(`codigo`)
);

CREATE TABLE IF NOT EXISTS DIAS_TRABAJO(
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `dias` VARCHAR(45) NOT NULL,
  `laboratorista_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
	FOREIGN KEY (`laboratorista_codigo`) REFERENCES LABORATORISTA (`codigo`)
);