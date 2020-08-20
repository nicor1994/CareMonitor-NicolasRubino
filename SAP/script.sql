USE [CareMonitor]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Usuario_Permiso_Permiso]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Usuario_Permiso] DROP CONSTRAINT [FK_Usuario_Permiso_Permiso]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Usuario_Permiso_Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Usuario_Permiso] DROP CONSTRAINT [FK_Usuario_Permiso_Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Lenguaje_Etiqueta_Etiqueta]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Lenguaje_Etiqueta] DROP CONSTRAINT [FK_Lenguaje_Etiqueta_Etiqueta]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Lenguaje_Etiqueta_Lenguaje]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Lenguaje_Etiqueta] DROP CONSTRAINT [FK_Lenguaje_Etiqueta_Lenguaje]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Usuario_Evento]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Usuario] DROP CONSTRAINT [FK_Usuario_Evento]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Servicio_Empleado]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Servicio] DROP CONSTRAINT [FK_Servicio_Empleado]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Servicio_TipoServicio]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Servicio] DROP CONSTRAINT [FK_Servicio_TipoServicio]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Servicio_Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Servicio] DROP CONSTRAINT [FK_Servicio_Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Rol_Permiso_02]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Rol] DROP CONSTRAINT [FK_Rol_Permiso_02]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Rol_Permiso_03]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Rol] DROP CONSTRAINT [FK_Rol_Permiso_03]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Medico_Empleado]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Medico] DROP CONSTRAINT [FK_Medico_Empleado]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Medicion_TipoMedicion]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Medicion] DROP CONSTRAINT [FK_Medicion_TipoMedicion]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Medicion_Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Medicion] DROP CONSTRAINT [FK_Medicion_Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Idioma_Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Idioma] DROP CONSTRAINT [FK_Idioma_Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Habito_Tipo_Habito]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Habito] DROP CONSTRAINT [FK_Habito_Tipo_Habito]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Habito_Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Habito] DROP CONSTRAINT [FK_Habito_Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Familiar_Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Familiar] DROP CONSTRAINT [FK_Familiar_Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Bitacora_Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Bitacora] DROP CONSTRAINT [FK_Bitacora_Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Alarma_Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Alarma] DROP CONSTRAINT [FK_Alarma_Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Mediciones_Alarma_Alarma]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Mediciones_Alarma] DROP CONSTRAINT [FK_Mediciones_Alarma_Alarma]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Mediciones_Alarma_Medicion]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Mediciones_Alarma] DROP CONSTRAINT [FK_Mediciones_Alarma_Medicion]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Usuario_Permiso]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Usuario_Permiso]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Lenguaje_Etiqueta]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Lenguaje_Etiqueta]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Lenguaje]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Lenguaje]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Etiqueta]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Etiqueta]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Usuario]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Tipo_Habito]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Tipo_Habito]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[TipoServicio]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [TipoServicio]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[TipoMedicion]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [TipoMedicion]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Servicio]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Servicio]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Rol]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Rol]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Permiso]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Permiso]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Medico]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Medico]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Medicion]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Medicion]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Idioma]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Idioma]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Habito]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Habito]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Familiar]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Familiar]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Evento]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Evento]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Empleado]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Empleado]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[DigitoVerificadorVertical]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [DigitoVerificadorVertical]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Bitacora]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Bitacora]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Alarma]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Alarma]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Mediciones_Alarma]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Mediciones_Alarma]
;

CREATE TABLE [Usuario_Permiso]
(
	[ID_Permiso] int NOT NULL,
	[ID_Usuario] int NOT NULL
)
;

CREATE TABLE [Lenguaje_Etiqueta]
(
	[ID_Lenguaje] int NOT NULL,
	[ID_Etiqueta] int NOT NULL,
	[Traduccion] varchar(50)
)
;

CREATE TABLE [Lenguaje]
(
	[ID_Lenguaje] int NOT NULL,
	[NombreLenguaje] varchar(50)
)
;

CREATE TABLE [Etiqueta]
(
	[ID_Etiqueta] int NOT NULL,
	[NombreEtiqueta] varchar(50)
)
;

CREATE TABLE [Usuario]
(
	[ID_Usuario] int NOT NULL,
	[Nombre] varchar(50),
	[Apellido] varchar(50),
	[ID_Idioma] int,
	[Usuario] varchar(50),
	[Contraseña] varchar(50),
	[Borrado] int,
	[DVH] varchar(50),
	[ID_Evento] int
)
;

CREATE TABLE [Tipo_Habito]
(
	[ID_TipoHabito] int NOT NULL,
	[Nombre] varchar(50),
	[ValorReferencia] int,
	[EfectoAfirmativo] varchar(max),
	[EfectoNegativo] varchar(max)
)
;

CREATE TABLE [TipoServicio]
(
	[ID_TipoServicio] int NOT NULL,
	[NombreServicio] varchar(50),
	[Descripcion] varchar(max),
	[TiempoMedio] int,
	[DVH] varchar(50)
)
;

CREATE TABLE [TipoMedicion]
(
	[ID_TipoMedicion] int NOT NULL,
	[Nombre] varchar(50),
	[Descripcion] varchar(max),
	[DescripcionMaxima] varchar(max),
	[DescripcionMinima] varchar(max),
	[MaximoMasculino] int,
	[MinimoMasculino] int,
	[MaximoFemenino] int,
	[MinimoFemenino] int
)
;

CREATE TABLE [Servicio]
(
	[ID_Servicio] int NOT NULL,
	[ID_TipoServicio] int,
	[FechaServicio] datetime,
	[FechaPedido] datetime,
	[ID_Usuario] int,
	[DVH] varchar(50),
	[ID_Empleado] int
)
;

CREATE TABLE [Rol]
(
	[ID_Rol] int NOT NULL,
	[ID_Permiso] int NOT NULL
)
;

CREATE TABLE [Permiso]
(
	[ID] int NOT NULL,
	[Nombre] varchar(50)
)
;

CREATE TABLE [Medico]
(
	[ID_Medico] int NOT NULL,
	[Matricula] int,
	[DVH] varchar(50)
)
;

CREATE TABLE [Medicion]
(
	[ID_Medicion] int NOT NULL,
	[ID_Usuario] int,
	[ID_TipoMedicion] int,
	[Valor] int
)
;

CREATE TABLE [Idioma]
(
	[ID_Idioma] int NOT NULL,
	[NombreIdioma] varchar(50),
	[ID_Usuario] int
)
;

CREATE TABLE [Habito]
(
	[ID_Habito] int NOT NULL,
	[VecesXSemana] int,
	[ID_Usuario] int,
	[ID_TipoHabito] int
)
;

CREATE TABLE [Familiar]
(
	[ID_Usuario] int NOT NULL,
	[ID_Familiar] int
)
;

CREATE TABLE [Evento]
(
	[ID_Evento] int NOT NULL,
	[ID_Usuario] int,
	[Titulo] varchar(50),
	[Fecha] datetime,
	[Descripcion] varchar(max)
)
;

CREATE TABLE [Empleado]
(
	[ID_Empleado] int NOT NULL,
	[Nombre] varchar(50),
	[Apellido] varchar(50),
	[DNI] int,
	[DVH] varchar(50)
)
;

CREATE TABLE [DigitoVerificadorVertical]
(
	[ID_DVV] int NOT NULL,
	[Nombre_Tabla] varchar(50),
	[DVV] varchar(50)
)
;

CREATE TABLE [Bitacora]
(
	[ID_Bitacora] int NOT NULL,
	[ID_Usuario] int,
	[Fecha] datetime,
	[Accion] varchar(200)
)
;

CREATE TABLE [Alarma]
(
	[ID_Alarma] int NOT NULL,
	[Fecha] datetime,
	[Evolucion] varchar(max),
	[ID_Usuario] int
)
;

CREATE TABLE [Mediciones_Alarma]
(
	[ID_Alarma] int NOT NULL,
	[ID_Medicion] int NOT NULL
)
;

CREATE INDEX [IXFK_Usuario_Permiso_Permiso] 
 ON [Usuario_Permiso] ([ID_Permiso] ASC)
;

CREATE INDEX [IXFK_Usuario_Permiso_Usuario] 
 ON [Usuario_Permiso] ([ID_Usuario] ASC)
;

ALTER TABLE [Usuario_Permiso] 
 ADD CONSTRAINT [PK_Usuario_Permiso]
	PRIMARY KEY CLUSTERED ([ID_Permiso],[ID_Usuario])
;

CREATE INDEX [IXFK_Lenguaje_Etiqueta_Etiqueta] 
 ON [Lenguaje_Etiqueta] ([ID_Etiqueta] ASC)
;

CREATE INDEX [IXFK_Lenguaje_Etiqueta_Lenguaje] 
 ON [Lenguaje_Etiqueta] ([ID_Lenguaje] ASC)
;

ALTER TABLE [Lenguaje_Etiqueta] 
 ADD CONSTRAINT [PK_Lenguaje_Etiqueta]
	PRIMARY KEY CLUSTERED ([ID_Lenguaje],[ID_Etiqueta])
;

ALTER TABLE [Lenguaje] 
 ADD CONSTRAINT [PK_Lenguaje]
	PRIMARY KEY CLUSTERED ([ID_Lenguaje])
;

ALTER TABLE [Etiqueta] 
 ADD CONSTRAINT [PK_Etiqueta]
	PRIMARY KEY CLUSTERED ([ID_Etiqueta])
;

CREATE INDEX [IXFK_Usuario_Evento] 
 ON [Usuario] ([ID_Evento] ASC)
;

ALTER TABLE [Usuario] 
 ADD CONSTRAINT [PK_Table1]
	PRIMARY KEY CLUSTERED ([ID_Usuario])
;

CREATE INDEX [IXFK_Tipo_Habito_Habito] 
 ON [Tipo_Habito] ()
;

ALTER TABLE [Tipo_Habito] 
 ADD CONSTRAINT [PK_Tipo_Habito]
	PRIMARY KEY CLUSTERED ([ID_TipoHabito])
;

ALTER TABLE [TipoServicio] 
 ADD CONSTRAINT [PK_TipoServicio]
	PRIMARY KEY CLUSTERED ([ID_TipoServicio])
;

ALTER TABLE [TipoMedicion] 
 ADD CONSTRAINT [PK_TipoMedicion]
	PRIMARY KEY CLUSTERED ([ID_TipoMedicion])
;

CREATE INDEX [IXFK_Servicio_Empleado] 
 ON [Servicio] ([ID_Empleado] ASC)
;

CREATE INDEX [IXFK_Servicio_TipoServicio] 
 ON [Servicio] ([ID_TipoServicio] ASC)
;

CREATE INDEX [IXFK_Servicio_Usuario] 
 ON [Servicio] ([ID_Usuario] ASC)
;

ALTER TABLE [Servicio] 
 ADD CONSTRAINT [PK_Servicio]
	PRIMARY KEY CLUSTERED ([ID_Servicio])
;

CREATE INDEX [IXFK_Rol_Permiso] 
 ON [Rol] ()
;

CREATE INDEX [IXFK_Rol_Permiso_02] 
 ON [Rol] ([ID_Permiso] ASC)
;

CREATE INDEX [IXFK_Rol_Permiso_03] 
 ON [Rol] ([ID_Rol] ASC)
;

ALTER TABLE [Rol] 
 ADD CONSTRAINT [PK_Rol]
	PRIMARY KEY CLUSTERED ([ID_Rol],[ID_Permiso])
;

ALTER TABLE [Permiso] 
 ADD CONSTRAINT [PK_Permiso]
	PRIMARY KEY CLUSTERED ([ID])
;

CREATE INDEX [IXFK_Medico_Empleado] 
 ON [Medico] ([ID_Medico] ASC)
;

ALTER TABLE [Medico] 
 ADD CONSTRAINT [PK_Medico]
	PRIMARY KEY CLUSTERED ([ID_Medico])
;

CREATE INDEX [IXFK_Medicion_TipoMedicion] 
 ON [Medicion] ([ID_TipoMedicion] ASC)
;

CREATE INDEX [IXFK_Medicion_Usuario] 
 ON [Medicion] ([ID_Usuario] ASC)
;

ALTER TABLE [Medicion] 
 ADD CONSTRAINT [PK_Medicion]
	PRIMARY KEY CLUSTERED ([ID_Medicion])
;

CREATE INDEX [IXFK_Idioma_Usuario] 
 ON [Idioma] ([ID_Usuario] ASC)
;

ALTER TABLE [Idioma] 
 ADD CONSTRAINT [PK_Idioma]
	PRIMARY KEY CLUSTERED ([ID_Idioma])
;

CREATE INDEX [IXFK_Habito_Tipo_Habito] 
 ON [Habito] ([ID_TipoHabito] ASC)
;

CREATE INDEX [IXFK_Habito_Usuario] 
 ON [Habito] ([ID_Usuario] ASC)
;

ALTER TABLE [Habito] 
 ADD CONSTRAINT [PK_Habito]
	PRIMARY KEY CLUSTERED ([ID_Habito])
;

CREATE INDEX [IXFK_Familiar_Usuario] 
 ON [Familiar] ([ID_Familiar] ASC)
;

ALTER TABLE [Familiar] 
 ADD CONSTRAINT [PK_Familiar]
	PRIMARY KEY CLUSTERED ([ID_Usuario])
;

ALTER TABLE [Evento] 
 ADD CONSTRAINT [PK_Evento]
	PRIMARY KEY CLUSTERED ([ID_Evento])
;

ALTER TABLE [Empleado] 
 ADD CONSTRAINT [PK_Empleado]
	PRIMARY KEY CLUSTERED ([ID_Empleado])
;

ALTER TABLE [DigitoVerificadorVertical] 
 ADD CONSTRAINT [PK_DigitoVerificadorVertical]
	PRIMARY KEY CLUSTERED ([ID_DVV])
;

CREATE INDEX [IXFK_Bitacora_Usuario] 
 ON [Bitacora] ([ID_Usuario] ASC)
;

ALTER TABLE [Bitacora] 
 ADD CONSTRAINT [PK_Bitacora]
	PRIMARY KEY CLUSTERED ([ID_Bitacora])
;

CREATE INDEX [IXFK_Alarma_Usuario] 
 ON [Alarma] ([ID_Usuario] ASC)
;

ALTER TABLE [Alarma] 
 ADD CONSTRAINT [PK_Alarma]
	PRIMARY KEY CLUSTERED ([ID_Alarma])
;

CREATE INDEX [IXFK_Mediciones_Alarma_Alarma] 
 ON [Mediciones_Alarma] ([ID_Alarma] ASC)
;

CREATE INDEX [IXFK_Mediciones_Alarma_Medicion] 
 ON [Mediciones_Alarma] ([ID_Medicion] ASC)
;

ALTER TABLE [Mediciones_Alarma] 
 ADD CONSTRAINT [PK_Table1]
	PRIMARY KEY CLUSTERED ([ID_Alarma],[ID_Medicion])
;

ALTER TABLE [Usuario_Permiso] ADD CONSTRAINT [FK_Usuario_Permiso_Permiso]
	FOREIGN KEY ([ID_Permiso]) REFERENCES [Permiso] ([ID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Usuario_Permiso] ADD CONSTRAINT [FK_Usuario_Permiso_Usuario]
	FOREIGN KEY ([ID_Usuario]) REFERENCES [Usuario] ([ID_Usuario]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Lenguaje_Etiqueta] ADD CONSTRAINT [FK_Lenguaje_Etiqueta_Etiqueta]
	FOREIGN KEY ([ID_Etiqueta]) REFERENCES [Etiqueta] ([ID_Etiqueta]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Lenguaje_Etiqueta] ADD CONSTRAINT [FK_Lenguaje_Etiqueta_Lenguaje]
	FOREIGN KEY ([ID_Lenguaje]) REFERENCES [Lenguaje] ([ID_Lenguaje]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Usuario] ADD CONSTRAINT [FK_Usuario_Evento]
	FOREIGN KEY ([ID_Evento]) REFERENCES [Evento] ([ID_Evento]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Servicio] ADD CONSTRAINT [FK_Servicio_Empleado]
	FOREIGN KEY ([ID_Empleado]) REFERENCES [Empleado] ([ID_Empleado]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Servicio] ADD CONSTRAINT [FK_Servicio_TipoServicio]
	FOREIGN KEY ([ID_TipoServicio]) REFERENCES [TipoServicio] ([ID_TipoServicio]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Servicio] ADD CONSTRAINT [FK_Servicio_Usuario]
	FOREIGN KEY ([ID_Usuario]) REFERENCES [Usuario] ([ID_Usuario]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Rol] ADD CONSTRAINT [FK_Rol_Permiso_02]
	FOREIGN KEY ([ID_Permiso]) REFERENCES [Permiso] ([ID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Rol] ADD CONSTRAINT [FK_Rol_Permiso_03]
	FOREIGN KEY ([ID_Rol]) REFERENCES [Permiso] ([ID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Medico] ADD CONSTRAINT [FK_Medico_Empleado]
	FOREIGN KEY ([ID_Medico]) REFERENCES [Empleado] ([ID_Empleado]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Medicion] ADD CONSTRAINT [FK_Medicion_TipoMedicion]
	FOREIGN KEY ([ID_TipoMedicion]) REFERENCES [TipoMedicion] ([ID_TipoMedicion]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Medicion] ADD CONSTRAINT [FK_Medicion_Usuario]
	FOREIGN KEY ([ID_Usuario]) REFERENCES [Usuario] ([ID_Usuario]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Idioma] ADD CONSTRAINT [FK_Idioma_Usuario]
	FOREIGN KEY ([ID_Usuario]) REFERENCES [Usuario] ([ID_Usuario]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Habito] ADD CONSTRAINT [FK_Habito_Tipo_Habito]
	FOREIGN KEY ([ID_TipoHabito]) REFERENCES [Tipo_Habito] ([ID_TipoHabito]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Habito] ADD CONSTRAINT [FK_Habito_Usuario]
	FOREIGN KEY ([ID_Usuario]) REFERENCES [Usuario] ([ID_Usuario]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Familiar] ADD CONSTRAINT [FK_Familiar_Usuario]
	FOREIGN KEY ([ID_Familiar]) REFERENCES [Usuario] ([ID_Usuario]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Bitacora] ADD CONSTRAINT [FK_Bitacora_Usuario]
	FOREIGN KEY ([ID_Usuario]) REFERENCES [Usuario] ([ID_Usuario]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Alarma] ADD CONSTRAINT [FK_Alarma_Usuario]
	FOREIGN KEY ([ID_Usuario]) REFERENCES [Usuario] ([ID_Usuario]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Mediciones_Alarma] ADD CONSTRAINT [FK_Mediciones_Alarma_Alarma]
	FOREIGN KEY ([ID_Alarma]) REFERENCES [Alarma] ([ID_Alarma]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Mediciones_Alarma] ADD CONSTRAINT [FK_Mediciones_Alarma_Medicion]
	FOREIGN KEY ([ID_Medicion]) REFERENCES [Medicion] ([ID_Medicion]) ON DELETE No Action ON UPDATE No Action
;
