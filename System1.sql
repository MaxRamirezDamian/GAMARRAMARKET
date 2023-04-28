/* OVERVIEW OF SQL (DDL) 
Script de implementación de tablespace y usuario */

/* Crear tablespace TBSGAMARK */
CREATE TABLESPACE TBSGAMARK
DATAFILE 'tbsgamark.dbf'
SIZE 300M;

/* Listar tablespaces del servidor de base de datos */
SELECT TABLESPACE_NAME, STATUS, CONTENTS
FROM USER_TABLESPACES;


/* Crear un usuario con el nombre gmarket cuya clave de acceso será ORCL1234 dentro del tablespace TBSGAMARK */
CREATE USER gmarket
IDENTIFIED BY ORCL1234
DEFAULT TABLESPACE TBSGAMARK
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON TBSGAMARK;

/* Asignando permisos para la gestión de tablespace */
GRANT CREATE SESSION TO gmarket;
GRANT CREATE TABLE TO gmarket;
GRANT CREATE VIEW TO gmarket;
GRANT CREATE PROCEDURE TO gmarket;
GRANT CREATE TRIGGER TO gmarket;
GRANT CREATE SEQUENCE TO gmarket;
GRANT CREATE JOB TO gmarket;
GRANT UNLIMITED TABLESPACE TO gmarket;

/* Listar usuarios de la base de datos */
SELECT * FROM DBA_USERS;











