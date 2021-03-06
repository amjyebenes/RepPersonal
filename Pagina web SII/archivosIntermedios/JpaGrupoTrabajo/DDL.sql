CREATE TABLE ACTIVIDAD (ID BIGINT NOT NULL, ACTIVO SMALLINT DEFAULT 0, ASIGNATURACONVALIDABLE VARCHAR(15), DIRECCION VARCHAR(30), FECHACREACION DATE NOT NULL, FECHAREALIZACION DATE NOT NULL, INFORMACION VARCHAR(50), TITULO VARCHAR(20) NOT NULL, ORGANIZACION_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE EVALUACION (ID BIGINT NOT NULL, COMENTARIO VARCHAR(50), EVALUADO BIGINT NOT NULL, FECHASUBIDA DATE, PUNTUACION FLOAT NOT NULL, ACTIVIDAD_ID BIGINT, USUARIO_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE USUARIO (ID BIGINT NOT NULL, DTYPE VARCHAR(31), CONTRASEÑA VARCHAR(15) NOT NULL, DIRECCION VARCHAR(30), DNI VARCHAR(9) NOT NULL, EMAIL VARCHAR(30) NOT NULL, FECHANACIMIENTO DATE NOT NULL, HORARIOS VARCHAR(50), INTERESES VARCHAR(50), NOMBRE VARCHAR(20) NOT NULL, NIVEL INTEGER NOT NULL, CIF VARCHAR(9) NOT NULL, PRIMARY KEY (ID))
CREATE TABLE ARCHIVO (ID BIGINT NOT NULL, COMENTARIO VARCHAR(50), FECHASUBIDA DATE, NOMBRE VARCHAR(15) NOT NULL, TIPO VARCHAR(15), URL VARCHAR(50) NOT NULL, ACTIVIDAD_ID BIGINT, USUARIO_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE INSCRIPCION (ID BIGINT NOT NULL, COMENTARIO VARCHAR(50), ESTADO SMALLINT DEFAULT 0 NOT NULL, FECHAREALIZACION DATE, ACTIVIDAD_ID BIGINT, USUARIO_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE COMENTARIO (ID BIGINT NOT NULL, CONTENIDO VARCHAR(200) NOT NULL, FECHASUBIDA DATE NOT NULL, ACTIVIDAD_ID BIGINT, USUARIO_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE INFORME (ID BIGINT NOT NULL, CONTENIDO VARCHAR(200) NOT NULL, FECHASUBIDA DATE NOT NULL, TITULO VARCHAR(20) NOT NULL, ACTIVIDAD_ID BIGINT, ORGANIZACION_ID BIGINT, PRIMARY KEY (ID))
ALTER TABLE ACTIVIDAD ADD CONSTRAINT CTVDADRGNIZACIONID FOREIGN KEY (ORGANIZACION_ID) REFERENCES USUARIO (ID)
ALTER TABLE EVALUACION ADD CONSTRAINT VLUACIONCTIVIDADID FOREIGN KEY (ACTIVIDAD_ID) REFERENCES ACTIVIDAD (ID)
ALTER TABLE EVALUACION ADD CONSTRAINT VALUACIONUSUARIOID FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO (ID)
ALTER TABLE ARCHIVO ADD CONSTRAINT ARCHIVO_USUARIO_ID FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO (ID)
ALTER TABLE ARCHIVO ADD CONSTRAINT ARCHIVOACTIVIDADID FOREIGN KEY (ACTIVIDAD_ID) REFERENCES ACTIVIDAD (ID)
ALTER TABLE INSCRIPCION ADD CONSTRAINT NSCRIPCIONSUARIOID FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO (ID)
ALTER TABLE INSCRIPCION ADD CONSTRAINT NSCRPCIONCTVIDADID FOREIGN KEY (ACTIVIDAD_ID) REFERENCES ACTIVIDAD (ID)
ALTER TABLE COMENTARIO ADD CONSTRAINT COMENTARIOSUARIOID FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO (ID)
ALTER TABLE COMENTARIO ADD CONSTRAINT CMNTARIOCTIVIDADID FOREIGN KEY (ACTIVIDAD_ID) REFERENCES ACTIVIDAD (ID)
ALTER TABLE INFORME ADD CONSTRAINT NFRMERGANIZACIONID FOREIGN KEY (ORGANIZACION_ID) REFERENCES USUARIO (ID)
ALTER TABLE INFORME ADD CONSTRAINT INFORMEACTIVIDADID FOREIGN KEY (ACTIVIDAD_ID) REFERENCES ACTIVIDAD (ID)
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT DECIMAL(15), PRIMARY KEY (SEQ_NAME))
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('SEQ_GEN', 0)
