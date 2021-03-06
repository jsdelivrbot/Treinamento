/*-----------------------------------------------
Autor:Nícolas Carvalho
Developer System
System: Cade meu Médico 
-----------------------------------------------*/
USE CADE_MEU_MEDICO
GO

CREATE TABLE PAISES(
	ID_PAIS INT IDENTITY(1,1) NOT NULL,
	PAIS VARCHAR(50) NOT NULL

	CONSTRAINT PK_ID_PAIS PRIMARY KEY(ID_PAIS)
);

CREATE TABLE ESTADOS(
	ID_ESTADO SMALLINT IDENTITY(1,1) NOT NULL,
	ID_PAIS INT NOT NULL,
	ESTADO VARCHAR(20) NOT NULL,
	SIGLA VARCHAR(2) NOT NULL,

	CONSTRAINT PK_ID_ESTADO PRIMARY KEY(ID_ESTADO),
	CONSTRAINT FK_ID_PAIS FOREIGN KEY (ID_PAIS) REFERENCES PAISES(ID_PAIS)
);

CREATE TABLE CIDADES(
	ID_CIDADE INT IDENTITY(1,1) NOT NULL,
	ID_ESTADO SMALLINT NOT NULL,
	CIDADE VARCHAR(100) NOT NULL

	CONSTRAINT PK_ID_CIDADE PRIMARY KEY(ID_CIDADE),
	CONSTRAINT FK_ID_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES ESTADOS(ID_ESTADO)
);

CREATE TABLE MEDICOS(
	ID_MEDICO INT IDENTITY(1,1) NOT NULL,
	ID_ESPECIALIDADE SMALLINT NOT NULL,
	CRM VARCHAR(30) NULL,
	NOME VARCHAR(300) NOT NULL,
	ENDERECO VARCHAR(100) NOT NULL,
	BAIRRO VARCHAR(60) NOT NULL,
	ID_CIDADE INT NOT NULL,
	EMAIL VARCHAR(100) NOT NULL,
	ATENDE_POR_CONVENIO BIT NULL,
	TEM_CLINICA BIT NULL,
	WEB_SITE_BLOG VARCHAR(80),

	CONSTRAINT PK_ID_MEDICO PRIMARY KEY(ID_MEDICO),
	CONSTRAINT FK_ID_CIDADE FOREIGN KEY (ID_CIDADE) REFERENCES CIDADES(ID_CIDADE)
);

CREATE TABLE ESPECIALIDADES(
	ID_ESPECIALIDADE SMALLINT NOT NULL,
	ESPECIALIDADE VARCHAR(80)

	CONSTRAINT PK_ID_ESPECIALIDADE PRIMARY KEY(ID_ESPECIALIDADE)	
);

CREATE TABLE MEDICOS_POR_ESPECIALIDADES(
	ID_MEDIDO INT IDENTITY(1,1) NOT NULL,
	ID_ESPECIALIDADE SMALLINT NOT NULL,

	CONSTRAINT PK_ID_MEDICO_ESPECIALIDADE PRIMARY KEY(ID_MEDIDO, ID_ESPECIALIDADE),
	
	CONSTRAINT  FK_ID_MEDICO FOREIGN KEY(ID_MEDIDO) REFERENCES MEDICOS(ID_MEDICO),
	CONSTRAINT  FK_ID_ESPECIALIDADE	FOREIGN KEY	(ID_ESPECIALIDADE)	REFERENCES ESPECIALIDADES(ID_ESPECIALIDADE)
);



CREATE TABLE USUARIOS(
	ID_USUARIO INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR (80) NOT NULL,
	USUARIO VARCHAR(30) NOT NULL,
	SENHA VARCHAR(10) NOT NULL,
	EMAIL VARCHAR(100) NOT NULL

	CONSTRAINT PK_ID_USUARIO PRIMARY KEY(ID_USUARIO)
);


----CORREÇÃO-----
ALTER TABLE MEDICOS
ADD CONSTRAINT fk_medicos_especialidades
FOREIGN KEY(ID_ESPECIALIDADE)
REFERENCES ESPECIALIDADES(ID_ESPECIALIDADE)
GO
