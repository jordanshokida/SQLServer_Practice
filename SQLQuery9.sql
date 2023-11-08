/* DDL de Creacion de Tablas */
CREATE TABLE LIBROS (NRO_LIBRO int not null PRIMARY KEY, 
                     TITULO char(40) not null,
                     AUTOR char(30) not null,
                     TIPO char(2) not null FOREIGN KEY REFERENCES TIPOLIBROS(TIPO),
                     PRECIO_ORI smallmoney not null,
                     PRECIO_ACT smallmoney not null, 
                     EDICION smallint not null,
					 ESTADO char(1))

					
--
CREATE TABLE TIPOLIBROS (TIPO char(2) not null PRIMARY KEY,
			DESCTIPO char(40) not null UNIQUE)
--
CREATE TABLE LECTORES (NRO_LECTOR int NOT NULL PRIMARY KEY,
                     NOMBRE char(22) not null,
                     DIRECCION char(30) not null,
                     TRABAJO char(10) not null,
                     SALARIO smallmoney not null,
					 ESTADO char(1)) 
--
CREATE TABLE COPIAS (NRO_LIBRO int not null FOREIGN KEY REFERENCES LIBROS(NRO_LIBRO),
                       NRO_COPIA smallint not null,
					   CONSTRAINT PK_COPIAS PRIMARY KEY(NRO_LIBRO,NRO_COPIA),
					   ESTADO char(1)
                       )
--
CREATE TABLE PRESTAMOS (NRO_LECTOR int not null,
                       NRO_LIBRO int not null,
                       NRO_COPIA smallint not null,
					   CONSTRAINT FK_PRESTAMOS_LECTORES FOREIGN KEY(NRO_LECTOR) REFERENCES LECTORES(NRO_LECTOR),
					   CONSTRAINT FK_PRESTAMOS_COPIAS FOREIGN KEY(NRO_LIBRO,NRO_COPIA) REFERENCES COPIAS(NRO_LIBRO,NRO_COPIA),
					   CONSTRAINT PK_PRESTAMOS PRIMARY KEY(NRO_LECTOR,NRO_LIBRO,NRO_COPIA,F_PREST),
                       F_PREST datetime not null,
                       F_DEVOL datetime)





 