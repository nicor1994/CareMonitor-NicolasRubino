USE [master]
GO
/****** Object:  Database [CareMonitor]    Script Date: 19/08/2020 22:40:48 ******/
CREATE DATABASE [CareMonitor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CareMonitor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CareMonitor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CareMonitor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CareMonitor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CareMonitor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CareMonitor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CareMonitor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CareMonitor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CareMonitor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CareMonitor] SET ARITHABORT OFF 
GO
ALTER DATABASE [CareMonitor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CareMonitor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CareMonitor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CareMonitor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CareMonitor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CareMonitor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CareMonitor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CareMonitor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CareMonitor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CareMonitor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CareMonitor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CareMonitor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CareMonitor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CareMonitor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CareMonitor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CareMonitor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CareMonitor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CareMonitor] SET RECOVERY FULL 
GO
ALTER DATABASE [CareMonitor] SET  MULTI_USER 
GO
ALTER DATABASE [CareMonitor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CareMonitor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CareMonitor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CareMonitor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CareMonitor] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CareMonitor', N'ON'
GO
ALTER DATABASE [CareMonitor] SET QUERY_STORE = OFF
GO
USE [CareMonitor]
GO
/****** Object:  Table [dbo].[Alarma]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alarma](
	[ID] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Evolucion] [varchar](max) NULL,
	[ID_Usuario] [int] NULL,
 CONSTRAINT [PK_Alarma] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitoVerificadorVertical]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigitoVerificadorVertical](
	[ID] [int] NOT NULL,
	[Nombre_Tabla] [varchar](50) NULL,
	[DVV] [varchar](50) NULL,
 CONSTRAINT [PK_DigitoVerificadorVertical] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[DNI] [int] NULL,
	[DVH] [varchar](50) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiqueta](
	[ID] [int] NOT NULL,
	[NombreEtiqueta] [varchar](50) NULL,
 CONSTRAINT [PK_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[ID] [int] NOT NULL,
	[ID_Usuario] [int] NULL,
	[Titulo] [varchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Familiar]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Familiar](
	[ID] [int] NOT NULL,
	[ID_Familiar] [int] NULL,
 CONSTRAINT [PK_Familiar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habito]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habito](
	[ID] [int] NOT NULL,
	[VecesXSemana] [int] NULL,
	[ID_Usuario] [int] NULL,
	[ID_TipoHabito] [int] NULL,
 CONSTRAINT [PK_Habito] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[ID] [int] NOT NULL,
	[NombreIdioma] [varchar](50) NULL,
	[ID_Usuario] [int] NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lenguaje]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lenguaje](
	[ID] [int] NOT NULL,
	[NombreLenguaje] [varchar](50) NULL,
 CONSTRAINT [PK_Lenguaje] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lenguaje_Etiqueta]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lenguaje_Etiqueta](
	[ID] [int] NOT NULL,
	[ID_Etiqueta] [int] NOT NULL,
	[Traduccion] [varchar](50) NULL,
 CONSTRAINT [PK_Lenguaje_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[ID_Etiqueta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion](
	[ID] [int] NOT NULL,
	[ID_Usuario] [int] NULL,
	[ID_TipoMedicion] [int] NULL,
	[Valor] [int] NULL,
 CONSTRAINT [PK_Medicion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mediciones_Alarma]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mediciones_Alarma](
	[ID] [int] NOT NULL,
	[ID_Medicion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[ID] [int] NOT NULL,
	[Matricula] [int] NULL,
	[DVH] [varchar](50) NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[ID] [int] NOT NULL,
	[ID_Permiso] [int] NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[ID_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[ID] [int] NOT NULL,
	[ID_TipoServicio] [int] NULL,
	[FechaServicio] [datetime] NULL,
	[FechaPedido] [datetime] NULL,
	[ID_Usuario] [int] NULL,
	[DVH] [varchar](50) NULL,
	[ID_Empleado] [int] NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Habito]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Habito](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ValorReferencia] [int] NULL,
	[EfectoAfirmativo] [varchar](max) NULL,
	[EfectoNegativo] [varchar](max) NULL,
 CONSTRAINT [PK_Tipo_Habito] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMedicion]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMedicion](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](max) NULL,
	[DescripcionMaxima] [varchar](max) NULL,
	[DescripcionMinima] [varchar](max) NULL,
	[MaximoMasculino] [int] NULL,
	[MinimoMasculino] [int] NULL,
	[MaximoFemenino] [int] NULL,
	[MinimoFemenino] [int] NULL,
 CONSTRAINT [PK_TipoMedicion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServicio](
	[ID] [int] NOT NULL,
	[NombreServicio] [varchar](50) NULL,
	[Descripcion] [varchar](max) NULL,
	[TiempoMedio] [int] NULL,
	[DVH] [varchar](50) NULL,
 CONSTRAINT [PK_TipoServicio] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[ID_Idioma] [int] NULL,
	[Usuario] [varchar](50) NULL,
	[Contraseña] [varchar](50) NULL,
	[Borrado] [int] NULL,
	[DVH] [varchar](50) NULL,
	[ID_Evento] [int] NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Permiso]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Permiso](
	[ID_Permiso] [int] NOT NULL,
	[ID_Usuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_Permiso] PRIMARY KEY CLUSTERED 
(
	[ID_Permiso] ASC,
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Alarma_Usuario]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Alarma_Usuario] ON [dbo].[Alarma]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Familiar_Usuario]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Familiar_Usuario] ON [dbo].[Familiar]
(
	[ID_Familiar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Habito_Tipo_Habito]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Habito_Tipo_Habito] ON [dbo].[Habito]
(
	[ID_TipoHabito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Habito_Usuario]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Habito_Usuario] ON [dbo].[Habito]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Idioma_Usuario]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Idioma_Usuario] ON [dbo].[Idioma]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Lenguaje_Etiqueta_Etiqueta]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Lenguaje_Etiqueta_Etiqueta] ON [dbo].[Lenguaje_Etiqueta]
(
	[ID_Etiqueta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Lenguaje_Etiqueta_Lenguaje]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Lenguaje_Etiqueta_Lenguaje] ON [dbo].[Lenguaje_Etiqueta]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Medicion_TipoMedicion]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Medicion_TipoMedicion] ON [dbo].[Medicion]
(
	[ID_TipoMedicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Medicion_Usuario]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Medicion_Usuario] ON [dbo].[Medicion]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Mediciones_Alarma_Alarma]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Mediciones_Alarma_Alarma] ON [dbo].[Mediciones_Alarma]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Mediciones_Alarma_Medicion]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Mediciones_Alarma_Medicion] ON [dbo].[Mediciones_Alarma]
(
	[ID_Medicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Medico_Empleado]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Medico_Empleado] ON [dbo].[Medico]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Rol_Permiso_02]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Rol_Permiso_02] ON [dbo].[Rol]
(
	[ID_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Rol_Permiso_03]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Rol_Permiso_03] ON [dbo].[Rol]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Servicio_Empleado]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Servicio_Empleado] ON [dbo].[Servicio]
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Servicio_TipoServicio]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Servicio_TipoServicio] ON [dbo].[Servicio]
(
	[ID_TipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Servicio_Usuario]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Servicio_Usuario] ON [dbo].[Servicio]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Usuario_Evento]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Usuario_Evento] ON [dbo].[Usuario]
(
	[ID_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Usuario_Permiso_Permiso]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Usuario_Permiso_Permiso] ON [dbo].[Usuario_Permiso]
(
	[ID_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Usuario_Permiso_Usuario]    Script Date: 19/08/2020 22:40:48 ******/
CREATE NONCLUSTERED INDEX [IXFK_Usuario_Permiso_Usuario] ON [dbo].[Usuario_Permiso]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEntidadID]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE Procedure [dbo].[ObtenerEntidadID]
(
 @Tabla nvarchar(100),
 @id nvarchar(10)
)

As

Declare @sql nvarchar(max);
Declare @parametros varchar(500);


Set @sql = 'SELECT * FROM ' + QUOTENAME(@Tabla) + N' WHERE ID ='+ @id;

exec sp_executesql @sql
          
        
GO
/****** Object:  StoredProcedure [dbo].[Prueba2]    Script Date: 19/08/2020 22:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create Procedure [dbo].[Prueba2]
(
 @Tabla nvarchar(100),
 @id int
)

As

Declare @sql nvarchar(max);
Declare @parametros nvarchar(500);


Set @sql = 'SELECT * FROM ' + QUOTENAME(@Tabla) + N' WHERE ID = @id';

exec sp_executesql @sql
          
        
GO
USE [master]
GO
ALTER DATABASE [CareMonitor] SET  READ_WRITE 
GO
