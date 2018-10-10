CREATE TABLE IF NOT EXISTS syslog.rh_ausencia_motivo (
	id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL, 
	descr VARCHAR(100) NOT NULL, 
	id_clase INTEGER UNSIGNED NOT NULL,
	orden TINYINT UNSIGNED, 
	PRIMARY KEY(id), 
	CONSTRAINT FK_id_clase FOREIGN KEY (id_clase) REFERENCES syslog.rh_ausencia_clase(id) 
		ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci;


INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('VAO', ' VACACIONES ORDINARIAS ', VACACIONES ORDINARIAS , 4, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('VAE', ' VACACIONES EXTEMPORANEAS ', VACACIONES EXTEMPORANEAS , 12, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('150', ' PERMISO ECONOMICO ', PERMISO ECONOMICO , 1, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('151', ' PERMISO POR PATERNIDAD ', CLAUSULA POR PATERNIDAD , 13, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('147', ' PERMISO RENUNCIABLE ', PERMISO RENUNCIABLE , 3, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('148', ' PERMISO 90 DIAS ', PERMISO 90 DIAS , 14, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('149', ' PERMISO 6 AÑOS ', PERMISO 6 AÑOS , 15, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('103', ' EXAMENES MEDICO ', EXAMENES MEDICO , 6, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('104', ' ATENCION MEDICA ', ATENCION MEDICA , 16, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('106', ' INCAPACIDAD MEDICA ', INCAPACIDAD MEDICA , 5, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('COA', ' COMISION ADMINISTRATIVA ', COMISION ADMINISTRATIVA , 2, 2);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('COS', ' COMISION SINDICAL ', COMISION SINDICAL , 17, 2);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('ASD', ' ASCENSO DEFINITIVO ', ASCENSO DEFINITIVO , 18, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('AST', ' ASCENSO TEMPORAL ', ASCENSO TEMPORAL , 19, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('JUB', ' JUBILACION ', JUBILACION , 20, 6);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('LIQ', ' LIQUIDACION ', LIQUIDACION , 21, 6);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('REC', ' DESPIDO ', DESPIDO , 22, 6);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('NEG', ' PERMISO NEGOCIADO ', PERMISO NEGOCIADO , 23, 7);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('119', ' ATENCION MEDICA FORANEA ', ATENCION MEDICA FORANEA , 24, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('CAC', ' CAPACITACION CONTRACTUAL ', CAPACITACION CONTRACTUAL , 7, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('CAP', ' CAPACITACION PROFESIONAL ', CAPACITACION PROFESIONAL , 25, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('FI', ' FALTA INJUSTIFICADA ', FALTA INJUSTIFICADA , 8, 7);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('???', ' AUSENCIA DESCONOCIDA ', AUSENCIA DESCONOCIDA , 0, 7);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('SAA', ' SANCION ADMINISTRATIVA ', SANCION ADMINISTRATIVA , 26, 5);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('SAS', ' SANCION SINDICAL ', SANCION SINDICAL , 27, 5);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('VAJ', ' VACACIONES PRE-JUBILATORIAS ', VACACIONES PRE-JUBILATORIAS , 28, 1);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('DDP', ' DISPOSICION DE PERSONAL ', DISPOSICION DE PERSONAL , 11, 7);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('NUE', ' PLAZA NUEVA ', PLAZA NUEVA , 29, 3);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('VEN', ' VENCIMIENTO DE PLAZA OD ', VENCIMIENTO DE PLAZA OD , 10, 4);
INSERT INTO logistica.rh_ausencia_motivo (clave, nombre, descr, orden, id_clase) VALUES ('080', ' PERMUTA CL. 80 ', PERMUTA DEF/TEMP , 30, 1);

