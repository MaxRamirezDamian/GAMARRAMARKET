/*Script de implementación de estructura (tablas y relaciones)*/

/* Crear tabla PERSONA */
CREATE TABLE persona
(
   IDPER INT GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 200 INCREMENT BY 1,
   DNIPER CHAR(8),
   NOMPER VARCHAR2(60),
   APEPER VARCHAR2(80),
   EMAPER VARCHAR2(80),
   CELPER CHAR(9),
   TIPPER CHAR(1),
   ESTPER CHAR(1) DEFAULT 'A',
   FECNACPER DATE,
   CONSTRAINT PER_PK PRIMARY KEY (IDPER)       
);
COMMIT;

/* Ver la estructura de la tabla PERSONA */
SELECT *
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'PERSONA';

/* Listar tablas del schema de base de datos */
select table_name from user_tables;

/* Agregar una columna ESTADO CIVIL en la tabla PERSONA */
ALTER TABLE persona
    ADD ECIV CHAR(1);
COMMIT;

/* Ver estructura de tabla PERSONA con nueva columna */
DESCRIBE persona;

/* Eliminar una columna ESTADO CIVIL en la tabla PERSONA */
ALTER TABLE persona
    DROP COLUMN ECIV;
COMMIT;

/* Ver estructura de tabla PERSONA sin columna ECIV */
DESCRIBE persona;

/* Crear tabla VENTA */
CREATE TABLE venta
(
   IDVEN INT GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 200 INCREMENT BY 1,
   FECVEN DATE,
   IDVENDET INTEGER,
   IDCLI INT,
   IDVEND INT,
   TIPPAGVEN CHAR(1),
   ESTVEN CHAR(1) DEFAULT 'A',
   CONSTRAINT VEN_PK PRIMARY KEY (IDVEN)       
);
COMMIT;

/* Crear tabla VENTADETALLE */
CREATE TABLE venta_detalle
(
   IDVENDET INT GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 200 INCREMENT BY 1,
   IDVEN INTEGER,
   CODPROD CHAR(3),
   CANVENDET INTEGER,
   CONSTRAINT VENDT_PK PRIMARY KEY (IDVENDET)       
);
COMMIT;

/* Crear tabla PRODUCTO */
CREATE TABLE producto
(
   CODPROD CHAR(3),
   NOMPRO VARCHAR2(50),
   IDCAT INTEGER,
   PREPRO NUMBER(8,2),
   STOCKPRO INTEGER,
   ESTPRO CHAR(1),
   CONSTRAINT PRO_PK PRIMARY KEY (CODPROD)       
);
COMMIT;

/* Crear tabla CATEGORIA */
CREATE TABLE categoria
(
   IDCAT INT GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 200 INCREMENT BY 1,
   NOMCAT VARCHAR2(60),
   CONSTRAINT CAT_PK PRIMARY KEY (IDCAT)       
);
COMMIT;

/* Relacionar tabla VENTA con PERSONA (Cliente) */
ALTER TABLE VENTA 
      ADD CONSTRAINT IDCLI_FK FOREIGN KEY (IDCLI)
      REFERENCES USER_ORACLE.PERSONA (IDPER);
COMMIT;

/* Eliminar tabla */
DROP TABLE VENTA;
COMMIT;






