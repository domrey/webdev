CREATE TABLE IF NOT EXISTS syslog.rh_ausencia_motivo (
	id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	clave CHAR(3) NOT NULL, 
	nombre VARCHAR(50) NOT NULL, 
	descr VARCHAR(100) NOT NULL, 
	clave_clase CHAR(2) NOT NULL,
	orden TINYINT UNSIGNED, 
	PRIMARY KEY(id), 
	INDEX IDX_CLAVE (clave ASC),
	CONSTRAINT FK_clave_clase FOREIGN KEY (clave_clase) REFERENCES syslog.rh_ausencia_clase(clave) 
		ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci;



INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('VAO', 'VACACIONES ORDINARIAS', 'VACACIONES ORDINARIAS', 'VA', 4);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('VAE', 'VACACIONES EXTEMPORANEAS', 'VACACIONES EXTEMPORANEAS', 'VA', 12);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('150', 'PERMISO ECONOMICO', 'PERMISO ECONOMICO', 'PE', 1);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('151', 'PERMISO POR PATERNIDAD', 'CLAUSULA POR PATERNIDAD', 'PE', 13);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('147', 'PERMISO RENUNCIABLE', 'PERMISO RENUNCIABLE', 'PE', 3);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('148', 'PERMISO 90 DIAS', 'PERMISO 90 DIAS', 'PE', 14);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('149', 'PERMISO  6 AÑOS', 'PERMISO  6 AÑOS', 'PE', 15);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('103', 'EXAMENES MEDICO', 'EXAMENES MEDICO', 'ME', 6);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('104', 'ATENCION MEDICA', 'ATENCION MEDICA', 'ME', 16);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('106', 'INCAPACIDAD MEDICA', 'INCAPACIDAD MEDICA', 'ME', 5);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('COA', 'COMISION ADMINISTRATIVA', 'COMISION ADMINISTRATIVA', 'CO', 2);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('COS', 'COMISION SINDICAL', 'COMISION SINDICAL', 'CO', 17);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('ASD', 'ASCENSO DEFINITIVO', 'ASCENSO DEFINITIVO', 'AS', 18);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('AST', 'ASCENSO TEMPORAL', 'ASCENSO TEMPORAL', 'AS', 19);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('JUB', 'JUBILACION', 'JUBILACION', 'TE', 20);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('LIQ', 'LIQUIDACION', 'LIQUIDACION', 'TE', 21);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('REC', 'DESPIDO', 'DESPIDO', 'TE', 22);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('NEG', 'PERMISO NEGOCIADO', 'PERMISO NEGOCIADO', 'PE', 23);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('119', 'ATENCION MEDICA FORANEA', 'ATENCION MEDICA FORANEA', 'ME', 24);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('CAC', 'CAPACITACION CONTRACTUAL', 'CAPACITACION CONTRACTUAL', 'CA', 7);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('CAP', 'CAPACITACION PROFESIONAL', 'CAPACITACION PROFESIONAL', 'CA', 25);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('FI', 'FALTA INJUSTIFICADA', 'FALTA INJUSTIFICADA', 'FA', 8);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('???', 'AUSENCIA DESCONOCIDA', 'AUSENCIA DESCONOCIDA', 'FA', 0);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('SAA', 'SANCION ADMINISTRATIVA', 'SANCION ADMINISTRATIVA', 'SA', 26);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('SAS', 'SANCION SINDICAL', 'SANCION SINDICAL', 'SA', 27);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('VAJ', 'VACACIONES PRE-JUBILATORIAS', 'VACACIONES PRE-JUBILATORIAS', 'VA', 28);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('DDP', 'DISPOSICION DE PERSONAL', 'DISPOSICION DE PERSONAL', 'FA', 11);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('NUE', 'PLAZA NUEVA', 'PLAZA NUEVA', 'CR', 29);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('VEN', 'VENCIMIENTO DE PLAZA OD', 'VENCIMIENTO DE PLAZA OD', 'RE', 10);
INSERT INTO syslog.rh_ausencia_motivo (clave, nombre, descr, clave_clase, orden) VALUES ('080', 'PERMUTA CL. 80', 'PERMUTA DEF/TEMP', 'PM', 30);
