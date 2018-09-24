#! /bin/bash

cat 01-jornada.sql 02-descanso.sql 03-trab.sql 04-puesto.sql 05-plaza.sql 06-vacancia.sql 07-ausencia_clase.sql 08-ausencia_motivo.sql 09-ausencia.sql 10-movimiento.sql | mysql -u dev -p

