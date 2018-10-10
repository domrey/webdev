CREATE TABLE IF NOT EXISTS syslog.rh_ausencia_clase (
	id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL, 
	descr VARCHAR(100), 
	PRIMARY KEY(id), 
	INDEX IDX_nombre(nombre ASC),
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO syslog.rh_ausencia_clase (nombre, descr) VALUES ('CLAUSULA', 'CLAUSULA CONTRACTUAL');
INSERT INTO syslog.rh_ausencia_clase (nombre, descr) VALUES ('COMISION', '');
INSERT INTO syslog.rh_ausencia_clase (nombre, descr) VALUES ('CREACION', '');
INSERT INTO syslog.rh_ausencia_clase (nombre, descr) VALUES ('RENOVACION', '');
INSERT INTO syslog.rh_ausencia_clase (nombre, descr) VALUES ('SANCION', '');
INSERT INTO syslog.rh_ausencia_clase (nombre, descr) VALUES ('TERMINACION', '');

