USE [master]
GO
/****** Object:  Database [CareMonitor]    Script Date: 08/12/2020 22:51:20 ******/
CREATE DATABASE [CareMonitor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CareMonitor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CareMonitor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CareMonitor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CareMonitor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CareMonitor] SET COMPATIBILITY_LEVEL = 150
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
/****** Object:  Table [dbo].[Alarma]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alarma](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Evolucion] [varchar](max) NULL,
	[ID_Usuario] [int] NULL,
 CONSTRAINT [PK_Alarma] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitoVerificadorVertical]    Script Date: 08/12/2020 22:51:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 08/12/2020 22:51:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enfermedad]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enfermedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Borrado] [int] NULL,
 CONSTRAINT [PK_Enfermedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enfermedad_Habitos]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enfermedad_Habitos](
	[ID] [int] NOT NULL,
	[ID_Habito] [int] NOT NULL,
 CONSTRAINT [PK_Enfermedad_Habitos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[ID_Habito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 08/12/2020 22:51:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [int] NULL,
	[Titulo] [varchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Familiar]    Script Date: 08/12/2020 22:51:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habito]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habito](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VecesXSemana] [int] NULL,
	[ID_Usuario] [int] NULL,
	[ID_TipoHabito] [int] NULL,
 CONSTRAINT [PK_Habito] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreIdioma] [varchar](50) NULL,
	[ID_Usuario] [int] NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lenguaje]    Script Date: 08/12/2020 22:51:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lenguaje_Etiqueta]    Script Date: 08/12/2020 22:51:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [int] NULL,
	[ID_TipoMedicion] [int] NULL,
	[Valor] [int] NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_Medicion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mediciones_Alarma]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mediciones_Alarma](
	[ID] [int] NOT NULL,
	[ID_Medicion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 08/12/2020 22:51:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 08/12/2020 22:51:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[ID_Rol] [int] NOT NULL,
	[ID_Permiso] [int] NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[ID_Rol] ASC,
	[ID_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_TipoServicio] [int] NULL,
	[FechaServicio] [datetime] NULL,
	[FechaPedido] [datetime] NULL,
	[ID_Usuario] [int] NULL,
	[DVH] [varchar](50) NULL,
	[ID_Empleado] [int] NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio_Cerrado]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio_Cerrado](
	[ID] [int] NOT NULL,
	[FechaCierre] [datetime] NULL,
	[TiempoServicio] [int] NULL,
 CONSTRAINT [PK_Servicio_Cerrado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sintoma]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sintoma](
	[ID_TipoMedicion] [int] NOT NULL,
	[Maximo] [int] NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_Sintoma] PRIMARY KEY CLUSTERED 
(
	[ID_TipoMedicion] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Habito]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Habito](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ValorPositivo] [int] NULL,
	[EfectoPositivo] [varchar](max) NULL,
	[EfectoNegativo] [varchar](max) NULL,
	[ValorNegativo] [int] NULL,
	[Borrado] [int] NULL,
 CONSTRAINT [PK_Tipo_Habito] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMedicion]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMedicion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](max) NULL,
	[DescripcionMaxima] [varchar](max) NULL,
	[DescripcionMinima] [varchar](max) NULL,
	[MaximoMasculino] [int] NULL,
	[MinimoMasculino] [int] NULL,
	[MaximoFemenino] [int] NULL,
	[MinimoFemenino] [int] NULL,
	[Borrado] [int] NULL,
 CONSTRAINT [PK_TipoMedicion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServicio](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreServicio] [varchar](50) NULL,
	[Descripcion] [varchar](max) NULL,
	[TiempoMedio] [int] NULL,
	[DVH] [varchar](50) NULL,
	[Borrado] [int] NULL,
 CONSTRAINT [PK_TipoServicio] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Traduccion]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traduccion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Idioma] [int] NULL,
	[NombreControl] [varchar](max) NULL,
	[Traduccion] [varchar](max) NULL,
 CONSTRAINT [PK_Traduccion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[ID_Idioma] [int] NULL,
	[DNI] [int] NULL,
	[Contraseña] [varchar](50) NULL,
	[Borrado] [int] NULL,
	[DVH] [int] NULL,
	[PrimerInicio] [int] NULL,
	[Direccion] [varchar](50) NULL,
	[FechaDeNacimiento] [date] NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Permiso]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Permiso](
	[ID_Usuario] [int] NOT NULL,
	[ID_Permiso] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_Permiso] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC,
	[ID_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alarma] ON 

INSERT [dbo].[Alarma] ([ID], [Fecha], [Evolucion], [ID_Usuario]) VALUES (1, CAST(N'2020-11-11T11:41:04.190' AS DateTime), NULL, 1)
INSERT [dbo].[Alarma] ([ID], [Fecha], [Evolucion], [ID_Usuario]) VALUES (2, CAST(N'2020-11-11T11:47:15.183' AS DateTime), N'Síntomas compatible con Dengue', 1)
INSERT [dbo].[Alarma] ([ID], [Fecha], [Evolucion], [ID_Usuario]) VALUES (3, CAST(N'2020-11-11T11:48:12.723' AS DateTime), NULL, 1)
INSERT [dbo].[Alarma] ([ID], [Fecha], [Evolucion], [ID_Usuario]) VALUES (4, CAST(N'2020-11-11T11:49:12.433' AS DateTime), NULL, 1)
INSERT [dbo].[Alarma] ([ID], [Fecha], [Evolucion], [ID_Usuario]) VALUES (5, CAST(N'2020-11-11T11:54:30.827' AS DateTime), NULL, 1)
INSERT [dbo].[Alarma] ([ID], [Fecha], [Evolucion], [ID_Usuario]) VALUES (6, CAST(N'2020-11-19T01:19:09.133' AS DateTime), NULL, 1)
INSERT [dbo].[Alarma] ([ID], [Fecha], [Evolucion], [ID_Usuario]) VALUES (7, CAST(N'2020-11-19T16:08:11.277' AS DateTime), NULL, 1)
INSERT [dbo].[Alarma] ([ID], [Fecha], [Evolucion], [ID_Usuario]) VALUES (8, CAST(N'2020-11-28T17:14:12.700' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Alarma] OFF
GO
INSERT [dbo].[DigitoVerificadorVertical] ([ID], [Nombre_Tabla], [DVV]) VALUES (1, N'Usuario', N'1892')
GO
SET IDENTITY_INSERT [dbo].[Enfermedad] ON 

INSERT [dbo].[Enfermedad] ([ID], [Nombre], [Borrado]) VALUES (5, N'Prueba', 1)
INSERT [dbo].[Enfermedad] ([ID], [Nombre], [Borrado]) VALUES (1002, N'Dengue', 0)
INSERT [dbo].[Enfermedad] ([ID], [Nombre], [Borrado]) VALUES (1003, N'Coronavirus', 0)
INSERT [dbo].[Enfermedad] ([ID], [Nombre], [Borrado]) VALUES (1004, N'Prueba', 0)
INSERT [dbo].[Enfermedad] ([ID], [Nombre], [Borrado]) VALUES (1005, N'Prueba', 1)
INSERT [dbo].[Enfermedad] ([ID], [Nombre], [Borrado]) VALUES (1006, N'Prueba', 1)
SET IDENTITY_INSERT [dbo].[Enfermedad] OFF
GO
INSERT [dbo].[Enfermedad_Habitos] ([ID], [ID_Habito]) VALUES (5, 3)
INSERT [dbo].[Enfermedad_Habitos] ([ID], [ID_Habito]) VALUES (1002, 3)
GO
SET IDENTITY_INSERT [dbo].[Evento] ON 

INSERT [dbo].[Evento] ([ID], [ID_Usuario], [Titulo], [Fecha], [Descripcion]) VALUES (1, 1, N'Servicio Solicitado: Limpieza', CAST(N'2020-11-28T14:22:00.000' AS DateTime), N'Limpieza del hogar')
INSERT [dbo].[Evento] ([ID], [ID_Usuario], [Titulo], [Fecha], [Descripcion]) VALUES (2, 1, N'Servicio Solicitado: Lavar', CAST(N'2020-11-24T10:00:00.000' AS DateTime), N'Lavar Ropa')
SET IDENTITY_INSERT [dbo].[Evento] OFF
GO
SET IDENTITY_INSERT [dbo].[Habito] ON 

INSERT [dbo].[Habito] ([ID], [VecesXSemana], [ID_Usuario], [ID_TipoHabito]) VALUES (1, 3, 1, 1)
INSERT [dbo].[Habito] ([ID], [VecesXSemana], [ID_Usuario], [ID_TipoHabito]) VALUES (2, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Habito] OFF
GO
SET IDENTITY_INSERT [dbo].[Idioma] ON 

INSERT [dbo].[Idioma] ([ID], [NombreIdioma], [ID_Usuario]) VALUES (1, N'Español', NULL)
INSERT [dbo].[Idioma] ([ID], [NombreIdioma], [ID_Usuario]) VALUES (2, N'Ingles', NULL)
INSERT [dbo].[Idioma] ([ID], [NombreIdioma], [ID_Usuario]) VALUES (7, N'Inclusivo', NULL)
INSERT [dbo].[Idioma] ([ID], [NombreIdioma], [ID_Usuario]) VALUES (8, N'Inclusivo', NULL)
SET IDENTITY_INSERT [dbo].[Idioma] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicion] ON 

INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (1, 1, 2, 80, CAST(N'2020-11-07T21:09:08.087' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (2, 1, 4, 120, CAST(N'2020-11-07T21:09:08.113' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (3, 1, 2, 80, CAST(N'2020-11-08T16:52:33.030' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (4, 1, 7, 900000, CAST(N'2020-11-08T16:52:33.033' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (5, 1, 8, 5000, CAST(N'2020-11-08T16:52:33.037' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (6, 1, 6, 38, CAST(N'2020-11-08T16:52:33.037' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (7, 1, 2, 80, CAST(N'2020-11-08T17:00:51.590' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (8, 1, 6, 38, CAST(N'2020-11-08T17:00:51.593' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (9, 1, 7, 80000000, CAST(N'2020-11-08T17:00:51.597' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (10, 1, 8, 15000, CAST(N'2020-11-08T17:00:51.600' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (11, 1, 2, 80, CAST(N'2020-11-08T17:13:46.510' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (12, 1, 6, 38, CAST(N'2020-11-08T17:13:46.513' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (13, 1, 7, 80000000, CAST(N'2020-11-08T17:13:46.517' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (14, 1, 8, 15000, CAST(N'2020-11-08T17:13:46.520' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (15, 1, 2, 80, CAST(N'2020-11-08T17:34:59.443' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (16, 1, 6, 38, CAST(N'2020-11-08T17:34:59.453' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (17, 1, 7, 500000, CAST(N'2020-11-08T17:34:59.463' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (18, 1, 8, 500000, CAST(N'2020-11-08T17:34:59.467' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (19, 1, 2, 80, CAST(N'2020-11-08T17:35:42.247' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (20, 1, 6, 38, CAST(N'2020-11-08T17:35:42.250' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (21, 1, 7, 500000, CAST(N'2020-11-08T17:35:42.253' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (22, 1, 8, 500000, CAST(N'2020-11-08T17:35:42.257' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (23, 1, 2, 80, CAST(N'2020-11-08T20:43:12.437' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (24, 1, 6, 38, CAST(N'2020-11-08T20:43:12.453' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (25, 1, 7, 800000, CAST(N'2020-11-08T20:43:12.457' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (26, 1, 8, 2000000, CAST(N'2020-11-08T20:43:12.483' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (27, 1, 7, 800000, CAST(N'2020-11-08T20:44:45.687' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (28, 1, 8, 1500000, CAST(N'2020-11-08T20:44:45.700' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (29, 1, 6, 38, CAST(N'2020-11-08T20:44:45.707' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (30, 1, 7, 800000, CAST(N'2020-11-08T20:47:46.533' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (31, 1, 8, 150, CAST(N'2020-11-08T20:47:46.537' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (32, 1, 6, 38, CAST(N'2020-11-08T20:47:46.537' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (33, 1, 6, 38, CAST(N'2020-11-08T20:52:01.063' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (34, 1, 7, 500000, CAST(N'2020-11-08T20:52:01.067' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (35, 1, 8, 150, CAST(N'2020-11-08T20:52:01.070' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (36, 1, 6, 38, CAST(N'2020-11-08T20:54:25.947' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (37, 1, 6, 38, CAST(N'2020-11-08T20:55:33.397' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (38, 1, 6, 38, CAST(N'2020-11-08T21:08:51.807' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (39, 1, 7, 80000, CAST(N'2020-11-08T21:08:51.810' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (40, 1, 8, 150, CAST(N'2020-11-08T21:08:51.817' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (41, 1, 6, 38, CAST(N'2020-11-08T21:13:56.107' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (42, 1, 7, 80200000, CAST(N'2020-11-08T21:13:56.110' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (43, 1, 8, 150, CAST(N'2020-11-08T21:13:56.120' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (44, 1, 6, 38, CAST(N'2020-11-08T21:19:07.893' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (45, 1, 7, 500000, CAST(N'2020-11-08T21:19:07.907' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (46, 1, 8, 150, CAST(N'2020-11-08T21:19:07.910' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (47, 1, 6, 38, CAST(N'2020-11-08T21:23:43.013' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (48, 1, 7, 500000, CAST(N'2020-11-08T21:23:43.020' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (49, 1, 8, 150, CAST(N'2020-11-08T21:23:43.043' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (50, 1, 6, 38, CAST(N'2020-11-08T21:23:55.130' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (51, 1, 7, 500000, CAST(N'2020-11-08T21:23:55.140' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (52, 1, 8, 150, CAST(N'2020-11-08T21:23:55.143' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (53, 1, 6, 38, CAST(N'2020-11-08T21:24:00.673' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (54, 1, 7, 500000, CAST(N'2020-11-08T21:24:00.673' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (55, 1, 8, 150, CAST(N'2020-11-08T21:24:00.677' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (56, 1, 6, 38, CAST(N'2020-11-08T21:25:06.033' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (57, 1, 7, 500000, CAST(N'2020-11-08T21:25:06.073' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (58, 1, 8, 150, CAST(N'2020-11-08T21:25:06.087' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (59, 1, 6, 38, CAST(N'2020-11-08T21:26:18.430' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (60, 1, 7, 1850000, CAST(N'2020-11-08T21:26:18.437' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (61, 1, 8, 150, CAST(N'2020-11-08T21:26:18.440' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (62, 1, 6, 38, CAST(N'2020-11-08T21:28:30.083' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (63, 1, 7, 1850000, CAST(N'2020-11-08T21:28:30.087' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (64, 1, 8, 150, CAST(N'2020-11-08T21:28:30.090' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (65, 1, 6, 38, CAST(N'2020-11-08T21:29:27.853' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (66, 1, 7, 500000, CAST(N'2020-11-08T21:29:27.857' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (67, 1, 8, 150, CAST(N'2020-11-08T21:29:27.857' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (68, 1, 6, 38, CAST(N'2020-11-11T11:39:39.167' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (69, 1, 7, 800000, CAST(N'2020-11-11T11:39:39.213' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (70, 1, 8, 150, CAST(N'2020-11-11T11:39:39.220' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (71, 1, 6, 39, CAST(N'2020-11-11T11:41:04.127' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (72, 1, 7, 800000, CAST(N'2020-11-11T11:41:04.140' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (73, 1, 8, 150, CAST(N'2020-11-11T11:41:04.147' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (74, 1, 6, 39, CAST(N'2020-11-11T11:43:13.603' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (75, 1, 7, 800000, CAST(N'2020-11-11T11:43:13.613' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (76, 1, 8, 50, CAST(N'2020-11-11T11:43:13.620' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (77, 1, 6, 38, CAST(N'2020-11-11T11:46:32.377' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (78, 1, 7, 800000, CAST(N'2020-11-11T11:46:39.783' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (79, 1, 6, 38, CAST(N'2020-11-11T11:46:32.377' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (80, 1, 7, 800000, CAST(N'2020-11-11T11:46:39.783' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (81, 1, 8, 150, CAST(N'2020-11-11T11:48:01.827' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (82, 1, 6, 39, CAST(N'2020-11-11T11:48:49.417' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (83, 1, 7, 800000, CAST(N'2020-11-11T11:48:55.117' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (84, 1, 8, 150, CAST(N'2020-11-11T11:49:00.503' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (85, 1, 6, 39, CAST(N'2020-11-11T11:52:03.100' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (86, 1, 6, 39, CAST(N'2020-11-11T11:53:19.263' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (87, 1, 7, 800000, CAST(N'2020-11-11T11:53:24.580' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (88, 1, 6, 39, CAST(N'2020-11-11T11:54:07.700' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (89, 1, 7, 398000, CAST(N'2020-11-11T11:54:12.327' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (90, 1, 6, 39, CAST(N'2020-11-11T11:54:07.700' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (91, 1, 7, 398000, CAST(N'2020-11-11T11:54:12.327' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (92, 1, 8, 150, CAST(N'2020-11-11T11:54:24.900' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (93, 1, 6, 38, CAST(N'2020-11-19T01:18:52.467' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (94, 1, 7, 800000, CAST(N'2020-11-19T01:19:01.607' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (95, 1, 8, 150, CAST(N'2020-11-19T01:19:05.247' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (96, 1, 2, 50, CAST(N'2020-11-19T16:07:22.667' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (97, 1, 4, 20, CAST(N'2020-11-19T16:08:09.357' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (98, 1, 6, 38, CAST(N'2020-11-28T17:13:47.333' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (99, 1, 8, 50000, CAST(N'2020-11-28T17:13:58.063' AS DateTime))
GO
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (100, 1, 4, 80, CAST(N'2020-11-28T17:14:04.550' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (101, 1, 7, 800000, CAST(N'2020-11-28T17:14:12.060' AS DateTime))
INSERT [dbo].[Medicion] ([ID], [ID_Usuario], [ID_TipoMedicion], [Valor], [Fecha]) VALUES (102, 1, 6, 36, CAST(N'2020-12-07T03:26:31.647' AS DateTime))
SET IDENTITY_INSERT [dbo].[Medicion] OFF
GO
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (2, 77)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (2, 78)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (4, 82)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (4, 83)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (4, 84)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (6, 93)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (6, 94)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (6, 95)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (7, 96)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (7, 97)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (8, 98)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (8, 99)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (8, 100)
INSERT [dbo].[Mediciones_Alarma] ([ID], [ID_Medicion]) VALUES (8, 101)
GO
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (1, N'Mediciones')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (2, N'Habitos')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (3, N'Eventos')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (4, N'Servicios')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (5, N'Gestion de Parametros')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (6, N'Gestion de Habitos')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (7, N'Gestion de Servicios')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (8, N'Alarmas')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (9, N'Gestion de Usuarios')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (10, N'Bitacora')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (11, N'Gestion de Permisos')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (12, N'Digito Verificador')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (13, N'Backup/Restore')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (14, N'Cierre de Servicio')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (15, N'Servicios Pedidos')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (16, N'Consultar Familiar')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (17, N'Gestion de Roles')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (18, N'Gestion de Enfermedades')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (19, N'Comprobar Integridad')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (20, N'Cola de Servicios')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (21, N'Mediciones del Usuario')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (100, N'Paciente')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (101, N'Servicio')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (102, N'Medico')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (103, N'Familiar')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (104, N'Administrador')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (105, N'Prueba Christian')
GO
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (100, 1)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (100, 2)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (100, 3)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (100, 4)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (100, 21)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (101, 7)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (101, 15)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (101, 20)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (102, 5)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (102, 6)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (102, 8)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (102, 18)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (103, 16)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (104, 10)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (104, 11)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (104, 12)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (104, 13)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (104, 17)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (104, 19)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (105, 5)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (105, 6)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (105, 8)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (105, 18)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (105, 19)
GO
SET IDENTITY_INSERT [dbo].[Servicio] ON 

INSERT [dbo].[Servicio] ([ID], [ID_TipoServicio], [FechaServicio], [FechaPedido], [ID_Usuario], [DVH], [ID_Empleado]) VALUES (2, 8, CAST(N'2020-11-24T10:00:00.000' AS DateTime), CAST(N'2020-11-23T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Servicio] ([ID], [ID_TipoServicio], [FechaServicio], [FechaPedido], [ID_Usuario], [DVH], [ID_Empleado]) VALUES (3, 7, CAST(N'2020-11-24T20:50:00.000' AS DateTime), CAST(N'2020-11-23T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Servicio] ([ID], [ID_TipoServicio], [FechaServicio], [FechaPedido], [ID_Usuario], [DVH], [ID_Empleado]) VALUES (4, 8, CAST(N'2020-11-28T01:20:00.000' AS DateTime), CAST(N'2020-11-23T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Servicio] ([ID], [ID_TipoServicio], [FechaServicio], [FechaPedido], [ID_Usuario], [DVH], [ID_Empleado]) VALUES (5, 7, CAST(N'2020-11-28T14:22:00.000' AS DateTime), CAST(N'2020-11-23T00:00:00.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Servicio] OFF
GO
INSERT [dbo].[Servicio_Cerrado] ([ID], [FechaCierre], [TiempoServicio]) VALUES (2, CAST(N'2020-11-25T21:19:08.000' AS DateTime), 40)
GO
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (2, 0, 1006)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (4, 0, 5)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (4, 0, 1004)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (4, 1, 1006)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (5, 0, 1003)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (6, 1, 1002)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (6, 1, 1003)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (6, 0, 1004)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (6, 0, 1006)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (7, 1, 1002)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (8, 0, 1002)
GO
SET IDENTITY_INSERT [dbo].[Tipo_Habito] ON 

INSERT [dbo].[Tipo_Habito] ([ID], [Nombre], [ValorPositivo], [EfectoPositivo], [EfectoNegativo], [ValorNegativo], [Borrado]) VALUES (1, N'Realizar Deporte', 5, N'Mejor condicion fisica, salud general', N'Fatiga muscular', 4, 0)
INSERT [dbo].[Tipo_Habito] ([ID], [Nombre], [ValorPositivo], [EfectoPositivo], [EfectoNegativo], [ValorNegativo], [Borrado]) VALUES (2, N'Comer Vegetales asd', 1, N'Mejores nutrientes', N'Ninguno', 1, 1)
INSERT [dbo].[Tipo_Habito] ([ID], [Nombre], [ValorPositivo], [EfectoPositivo], [EfectoNegativo], [ValorNegativo], [Borrado]) VALUES (3, N'Comer Vegetales', 0, N'Mejor condicion fisica, salud general', N'Peor Condicion fisica', 0, 0)
SET IDENTITY_INSERT [dbo].[Tipo_Habito] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMedicion] ON 

INSERT [dbo].[TipoMedicion] ([ID], [Nombre], [Descripcion], [DescripcionMaxima], [DescripcionMinima], [MaximoMasculino], [MinimoMasculino], [MaximoFemenino], [MinimoFemenino], [Borrado]) VALUES (2, N'Frecuencia Cardiaca', N'Cantidad de pulsaciones por unidad de tiempo', N'Taquicardia', N'Bradicardia', 100, 60, 100, 60, 0)
INSERT [dbo].[TipoMedicion] ([ID], [Nombre], [Descripcion], [DescripcionMaxima], [DescripcionMinima], [MaximoMasculino], [MinimoMasculino], [MaximoFemenino], [MinimoFemenino], [Borrado]) VALUES (3, N'Saturacion Oxigeno', N'Cantidad de oxigeno disponible en Sangre', N'Normal', N'Hipoxemia', 100, 90, 10, 90, 1)
INSERT [dbo].[TipoMedicion] ([ID], [Nombre], [Descripcion], [DescripcionMaxima], [DescripcionMinima], [MaximoMasculino], [MinimoMasculino], [MaximoFemenino], [MinimoFemenino], [Borrado]) VALUES (4, N'Glucosa', N'Azucar en Sangre', N'Diabetes', N'Hipoglucemia', 120, 70, 120, 70, 0)
INSERT [dbo].[TipoMedicion] ([ID], [Nombre], [Descripcion], [DescripcionMaxima], [DescripcionMinima], [MaximoMasculino], [MinimoMasculino], [MaximoFemenino], [MinimoFemenino], [Borrado]) VALUES (5, N'Saturacion de Oxigeno', N'Cantidad de oxigeno disponible en Sangre', N'Prueba', N'Prueba2', 100, 80, 100, 80, 0)
INSERT [dbo].[TipoMedicion] ([ID], [Nombre], [Descripcion], [DescripcionMaxima], [DescripcionMinima], [MaximoMasculino], [MinimoMasculino], [MaximoFemenino], [MinimoFemenino], [Borrado]) VALUES (6, N'Temperatura Corporal', N'Temperatura del cuerpo humano', N'Fiebre', N'Hipotermia', 37, 35, 37, 35, 0)
INSERT [dbo].[TipoMedicion] ([ID], [Nombre], [Descripcion], [DescripcionMaxima], [DescripcionMinima], [MaximoMasculino], [MinimoMasculino], [MaximoFemenino], [MinimoFemenino], [Borrado]) VALUES (7, N'Globulos Blancos', N'Ayudan a combatir infecciones', N'Leucocitosis', N'Leucopenia', 11000, 4000, 11000, 4000, 0)
INSERT [dbo].[TipoMedicion] ([ID], [Nombre], [Descripcion], [DescripcionMaxima], [DescripcionMinima], [MaximoMasculino], [MinimoMasculino], [MaximoFemenino], [MinimoFemenino], [Borrado]) VALUES (8, N'Globulos Rojos', N'qweasd', N'qweasd', N'qweasd', 5650000, 4350000, 5130000, 3920000, 0)
SET IDENTITY_INSERT [dbo].[TipoMedicion] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoServicio] ON 

INSERT [dbo].[TipoServicio] ([ID], [NombreServicio], [Descripcion], [TiempoMedio], [DVH], [Borrado]) VALUES (1, N'Limpieza', N'Limpieza del hogar', 40, NULL, 1)
INSERT [dbo].[TipoServicio] ([ID], [NombreServicio], [Descripcion], [TiempoMedio], [DVH], [Borrado]) VALUES (3, N'Cocinar', N'Cocinar comida', 15, NULL, 1)
INSERT [dbo].[TipoServicio] ([ID], [NombreServicio], [Descripcion], [TiempoMedio], [DVH], [Borrado]) VALUES (5, N'Limpieza', N'Limpieza del hogar', 40, NULL, 1)
INSERT [dbo].[TipoServicio] ([ID], [NombreServicio], [Descripcion], [TiempoMedio], [DVH], [Borrado]) VALUES (6, N'Limpieza', N'Limpieza del hogar', 40, NULL, 1)
INSERT [dbo].[TipoServicio] ([ID], [NombreServicio], [Descripcion], [TiempoMedio], [DVH], [Borrado]) VALUES (7, N'Limpieza', N'Limpieza del hogar', 15, NULL, 0)
INSERT [dbo].[TipoServicio] ([ID], [NombreServicio], [Descripcion], [TiempoMedio], [DVH], [Borrado]) VALUES (8, N'Lavar', N'Lavar Ropa', 75, NULL, 0)
SET IDENTITY_INSERT [dbo].[TipoServicio] OFF
GO
SET IDENTITY_INSERT [dbo].[Traduccion] ON 

INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1, 1, N'lblBitacora', N'Bitácora')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2, 2, N'lblBitacora', N'Logs')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (3, 1, N'lblBackup', N'Backup/Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1702, 2, N'lblBackup', N'Backup/Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1705, 1, N'lblUsuarios', N'Usuarios')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1706, 2, N'lblUsuarios', N'Users')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1707, 1, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1708, 2, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1709, 1, N'lblPermisos', N'Permiso')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1710, 2, N'lblPermisos', N'Permissions')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1711, 1, N'lblDigito', N'Dígito Verificador')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1712, 2, N'lblDigito', N'Check Digit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1713, 1, N'lblMedicion', N'Mediciones')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1714, 2, N'lblMedicion', N'Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1715, 1, N'lblHabitos', N'Hábitos')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1716, 2, N'lblHabitos', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1717, 1, N'lblServicios', N'Servicios')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1718, 2, N'lblServicios', N'Services')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1719, 1, N'lblEventos', N'Eventos')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1720, 2, N'lblEventos', N'Events')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1721, 1, N'lblGestionHabitos', N'Gestión de Hábitos')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1722, 2, N'lblGestionHabitos', N'Habits Management
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1723, 1, N'lblGestionParametro', N'Gestión de Parámetros')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1724, 2, N'lblGestionParametro', N'Parameters Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1725, 1, N'lblGestionServicios', N'Gestión de Servicios')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1726, 2, N'lblGestionServicios', N'Service Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1727, 1, N'lblGestionEnfermedades', N'Gestión de Enfermedades')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1728, 2, N'lblGestionEnfermedades', N'Disease Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1729, 1, N'lblAlarmas', N'Alarmas')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1730, 2, N'lblAlarmas', N'Alarms')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1731, 1, N'lblBienvenido', N'Bienvenido')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1732, 2, N'lblBienvenido', N'Welcome')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1733, 1, N'lblIdioma', N'Cambiar Idioma')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1734, 2, N'lblIdioma', N'Change Language')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1735, 1, N'btnCerrarSesion', N'Cerrar Sesión')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1736, 2, N'btnCerrarSesion', N'Sign Off')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1737, 1, N'btnFiltrar', N'Filtrar por')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1738, 2, N'btnFiltrar', N'Filter by')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1739, 1, N'btnQuitarfiltro', N'Quitar filtros')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1740, 2, N'btnQuitarfiltro', N'Remove filters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1741, 1, N'btnFecha', N'Fecha')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1742, 2, N'btnFecha', N'Date')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1743, 1, N'btnUsuario', N'Usuario')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1744, 2, N'btnUsuario', N'User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1745, 1, N'btnTipo', N'Tipo')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1746, 2, N'btnTipo', N'Type')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1747, 1, N'lblBackup', N'Copia de Seguridad')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1748, 2, N'lblBackup', N'Backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1749, 1, N'lblRestore', N'Restaurar')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1750, 2, N'lblRestore', N'Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1751, 1, N'btnBackup', N'Generar Backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1752, 2, N'btnBackup', N'Backup Database')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1753, 1, N'btnRestore', N'Restaurar Base')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1754, 2, N'btnRestore', N'Restore Database')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1755, 1, N'lblAtencion', N'Atención!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1756, 2, N'lblAtencion', N'Atención!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1757, 1, N'lblAtencionCuerpo', N'Al restaurar la base de datos se cerrará su sesión y será enviado al Login')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1758, 2, N'lblAtencionCuerpo', N'When restoring the database, your session will be closed and you will be sent to Login')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1759, 1, N'lblAltaUsuario', N'Alta de Usuario')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1760, 2, N'lblAltaUsuario', N'User Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1761, 1, N'lblNombre', N'Nombre')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1762, 2, N'lblNombre', N'First Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1763, 1, N'lblApellido', N'Apellido')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1764, 2, N'lblApellido', N'Last Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1765, 1, N'lblDNI', N'DNI')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1766, 2, N'lblDNI', N'ID')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1767, 1, N'lblDireccion', N'Dirección')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1768, 2, N'lblDireccion', N'Address')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1769, 1, N'lblFechaNacimiento', N'Fecha de Nacimiento')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1770, 2, N'lblFechaNacimiento', N'Birthdate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1771, 1, N'btnAceptar', N'Aceptar')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1772, 2, N'btnAceptar', N'Accept')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1773, 1, N'Gestion de Usuario', N'Gestión de Usuarios')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1774, 2, N'Gestion de Usuario', N'User Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1775, 1, N'btnModificar', N'Modificar')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1776, 2, N'btnModificar', N'Edit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1777, 1, N'btnBaja', N'Dar de Baja')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1778, 2, N'btnBaja', N'Unsubscribe')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1779, 1, N'btnrestore', N'Restaurar Contraseña')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1780, 2, N'btnrestore', N'Reset Password')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1781, 1, N'btnAgregarRol', N'Crear Rol')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1782, 2, N'btnAgregarRol', N'Create Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1783, 1, N'btnSeleccionarPermiso', N'Seleccionar Permiso')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1784, 2, N'btnSeleccionarPermiso', N'Select Permission')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1785, 1, N'btnSelectRol', N'Seleccionar Rol')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1786, 2, N'btnSelectRol', N'Select Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1787, 1, N'lblNombreRol', N'Nombre Rol')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1788, 2, N'lblNombreRol', N'Role Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1789, 1, N'lblGestionPermisos', N'Gestión de Permisos')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1790, 2, N'lblGestionPermisos', N'Permission Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1791, 1, N'lblGestionRoles', N'Gestión de Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1792, 2, N'lblGestionRoles', N'Role Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1793, 1, N'Permisos Asignados', N'Permisos Asignados')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1794, 2, N'Permisos Asignados', N'
Assigned Permissions')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1795, 1, N'btnSeleccionarUsuario', N'Seleccionar Usuario')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1796, 2, N'btnSeleccionarUsuario', N'Select User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1797, 1, N'btnAgregarPermiso', N'Agregar Rol')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1798, 2, N'btnAgregarPermiso', N'Add Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1799, 1, N'Agregar Permiso', N'Agregar Permiso')
GO
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1800, 2, N'Agregar Permiso', N'Add Permission')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1801, 1, N'lblTodoBien', N'Todo bien')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1802, 2, N'lblTodoBien', N'Everything is fine
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1803, 1, N'lblTextoDVV', N'La base de datos está íntegra!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1804, 2, N'lblTextoDVV', N'The database is complete!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1805, 1, N'lblTodoMal', N'Algo salió mal!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1806, 2, N'lblTodoMal', N'Something went wrong')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1807, 1, N'lblTextoDVVMal', N'La base de datos NO está íntrega')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1808, 2, N'lblTextoDVVMal', N'The database is not complete')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1809, 1, N'lblParametros', N'Parámetros')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1810, 2, N'lblParametros', N'Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1811, 1, N'lblSeleccioneParametro', N'Seleccione el parámetro')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1812, 2, N'lblSeleccioneParametro', N'Select the parameter
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1813, 1, N'lblValor', N'Valor')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1814, 2, N'lblValor', N'Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1815, 1, N'btnAgregar', N'Agregar')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1816, 2, N'btnAgregar', N'Add')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1817, 1, N'lblParametrosAgregados', N'Parámetros agregados')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1818, 2, N'lblParametrosAgregados', N'Added parameters
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1819, 1, N'btnGuardar', N'Guardar')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1820, 2, N'btnGuardar', N'Save')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1821, 1, N'Habitos', N'Hábitos')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1822, 2, N'Habitos', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1823, 1, N'lblSeleccioneHabito', N'Seleccione el Hábito')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1824, 2, N'lblSeleccioneHabito', N'Select Habit
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1825, 1, N'lblVecesPorSemana', N'Veces por semana')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1826, 2, N'lblVecesPorSemana', N'Timer per week')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1827, 1, N'lblHabitosUsuario', N'Hábitos del Usuario')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1828, 2, N'lblHabitosUsuario', N'User Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1829, 1, N'lblAltaHabito', N'Alta de Hábitos')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1830, 2, N'lblAltaHabito', N'Registration of Habits
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1831, 1, N'lblNombreParametro', N'Nombre')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1832, 2, N'lblNombreParametro', N'Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1833, 1, N'lblEfectoPositivo', N'Efecto Positivo')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1834, 2, N'lblEfectoPositivo', N'Positive Effect
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1835, 1, N'lblVecesPositivo', N'Veces por semana Positivo')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1836, 2, N'lblVecesPositivo', N'Times per week Positive')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1837, 1, N'lblEfectoNegativo', N'Efecto Negativo')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1838, 2, N'lblEfectoNegativo', N'Negative Effect')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1839, 1, N'lblVecesNegativo', N'Veces por semana Negativo')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1840, 2, N'lblVecesNegativo', N'Times per week Negative')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1841, 1, N'lblAltaParametros', N'Alta de Parámetros')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1842, 2, N'lblAltaParametros', N'Parameters Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1843, 1, N'lblDescripcion', N'Descripción')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1844, 2, N'lblDescripcion', N'Description')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1845, 1, N'lblDescripcionMax', N'Descripción de Valores Maximos')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1846, 2, N'lblDescripcionMax', N'Description of Maximum Values
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1847, 1, N'lblValMaxMasc', N'Valor Máximo Masculino')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1848, 2, N'lblValMaxMasc', N'Male Maximum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1849, 1, N'lblValMaxFem', N'Valor Máximo Femenino')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1850, 2, N'lblValMaxFem', N'Female Maximum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1851, 1, N'lblDescMin', N'Descripción de valores mínimos')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1852, 2, N'lblDescMin', N'Description of Minimum Values')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1853, 1, N'lblValMinMasc', N'Valor Mínimo Masculino')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1854, 2, N'lblValMinMasc', N'Male Minimum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1855, 1, N'lblValMinFem', N'Valor Mínimo Femenino')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1856, 2, N'lblValMinFem', N'Female Minimum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1857, 1, N'lblAltaServicio', N'Alta de Servicio')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1858, 2, N'lblAltaServicio', N'Service Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1859, 1, N'lblTiempoMedio', N'Tiempo Medio')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1860, 2, N'lblTiempoMedio', N'Average Time')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1861, 1, N'radiomax', N'Máximo')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1862, 2, N'radiomax', N'Maximum')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1863, 1, N'radiomin', N'Mínimo')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1864, 2, N'radiomin', N'Minimum')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1865, 1, N'lblParametrosSeleccionados', N'Parámetros Seleccionados')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1866, 2, N'lblParametrosSeleccionados', N'Selected Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1867, 1, N'lblHabitosSeleccionados', N'Hábitos Seleccionados')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1868, 2, N'lblHabitosSeleccionados', N'Selected Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1869, 1, N'btnSelecc', N'Seleccionar Parámetro')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1870, 2, N'btnSelecc', N'Select Parameter')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1871, 1, N'btnGuardarEnfermedad', N'Guardar Enfermedad')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1872, 2, N'btnGuardarEnfermedad', N'Save Disease')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1873, 1, N'lblAlarmasActivas', N'Alarmas Activas')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1874, 2, N'lblAlarmasActivas', N'Active Alarms')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1875, 1, N'lblMedicionesObservadas', N'Mediciones Observadas')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1876, 2, N'lblMedicionesObservadas', N'Observed Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1877, 1, N'btnEvolucionar', N'Evolucionar')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1878, 2, N'btnEvolucionar', N'Evolve')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1879, 1, N'lblEvolucion', N'Evolución')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1880, 2, N'lblEvolucion', N'Evolution')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1881, 1, N'lblUsuario', N'Usuario')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1882, 2, N'lblUsuario', N'User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1883, 1, N'btnSeleccionarUsuario', N'Seleccionar Usuario')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1884, 2, N'btnSeleccionarUsuario', N'Select User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1885, 1, N'lblPermisosAsignados', N'Permisos Asignados')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1886, 2, N'lblPermisosAsignados', N'Assigned permissions
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1887, 1, N'btnGuardarRol', N'Guardar Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1888, 2, N'btnGuardarRol', N'Save Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1889, 1, N'btnAgregarRolUsu', N'Agregar Rol')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1890, 2, N'btnAgregarRolUsu', N'Add Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1891, 1, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1892, 2, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1893, 1, N'btnRecalcular', N'Recalcular')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1894, 2, N'btnRecalcular', N'Recalculate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1895, 1, N'lblTituloCuidado', N'Cuidado!!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1896, 2, N'lblTituloCuidado', N'Look out!!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1897, 1, N'lblCuerpoCuidado', N'Los parametros ingresados condicen con la/s siguiente/s enfermedades, se ha emitido una alarma al Departamento Medico')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1898, 2, N'lblCuerpoCuidado', N'The entered parameters are related to the following disease/s, an alarm has been issued to the Medical Department')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1899, 1, N'btnAlarma', N'Aceptar')
GO
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1900, 2, N'btnAlarma', N'Agree')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1901, 1, N'btnAgregar', N'Agregar')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1902, 2, N'btnAgregar', N'Add')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1903, 1, N'lblHabitos2', N'Hábitos')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1904, 2, N'lblHabitos2', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1905, 1, N'btnGuardarModificacion', N'Guardar Modificación')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1906, 2, N'btnGuardarModificacion', N'Save Modification')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1907, 1, N'lblGestionParametros', N'Gestión de Parámetros')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1908, 2, N'lblGestionParametros', N'Parameters Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1909, 1, N'lblParametro', N'Parámetros')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1910, 2, N'lblParametro', N'Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1911, 1, N'btnSeleccHabito', N'Seleccionar Hábito')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1912, 2, N'btnSeleccHabito', N'Select Habit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1913, 1, N'lblSuccess', N'Prueba')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1914, 2, N'lblSuccess', N'Test')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1915, 1, N'btnMod', N'Modificar')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1916, 2, N'btnMod', N'Edit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1917, 1, N'lblsuccess2', N'Prueba2')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1918, 2, N'lblsuccess2', N'Test2')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1919, 1, N'lblmod', N'Usuario Modificado!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1920, 2, N'lblmod', N'User Modified!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1921, 1, N'btnFiltraUsuarios', N'Filtrar por Usuario')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1922, 2, N'btnFiltraUsuarios', N'Filter by user')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1923, 1, N'btnFiltrarTipo', N'Filtrar por Tipo')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1924, 2, N'btnFiltrarTipo', N'Filter by Type')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1925, 1, N'lblerror', N'No se encontraron registros')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1926, 2, N'lblerror', N'No records found')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1927, 1, N'lblFallo', N'Ocurrió un error!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1928, 2, N'lblFallo', N'An error occurred!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1929, 1, N'lblExito', N'Backup exitoso!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1930, 2, N'lblExito', N'
Successful backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1931, 1, N'lblCrearRol', N'Crear Rol')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1932, 2, N'lblCrearRol', N'Create Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1933, 1, N'lblCompleteNombre', N'Complete el Nombre!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1934, 2, N'lblCompleteNombre', N'Fill the name!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1935, 1, N'lblDesc', N'Descripcion')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1937, 2, N'lblDesc', N'Description')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1942, 1, N'lblEnf', N'Enfermedad')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1943, 2, N'lblEnf', N'Disease')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (1944, 1, N'btnGuardarModif', N'Guardar Modificación')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2307, 2, N'btnGuardarModif', N'Save Modification')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2308, 7, N'lblBitacora', N'Logs')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2309, 7, N'lblBackup', N'Backup/Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2310, 7, N'lblUsuarios', N'Usuaries')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2311, 7, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2312, 7, N'lblPermisos', N'Permissions')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2313, 7, N'lblDigito', N'Check Digit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2314, 7, N'lblMedicion', N'Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2315, 7, N'lblHabitos', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2316, 7, N'lblServicios', N'Services')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2317, 7, N'lblEventos', N'Events')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2318, 7, N'lblGestionHabitos', N'Habits Management
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2319, 7, N'lblGestionParametro', N'Parameters Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2320, 7, N'lblGestionServicios', N'Service Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2321, 7, N'lblGestionEnfermedades', N'Disease Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2322, 7, N'lblAlarmas', N'Alarms')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2323, 7, N'lblBienvenido', N'Welcome')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2324, 7, N'lblIdioma', N'Change Language')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2325, 7, N'btnCerrarSesion', N'Sign Off')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2326, 7, N'btnFiltrar', N'Filter by')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2327, 7, N'btnQuitarfiltro', N'Remove filters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2328, 7, N'btnFecha', N'Date')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2329, 7, N'btnUsuario', N'User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2330, 7, N'btnTipo', N'Type')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2331, 7, N'lblBackup', N'Backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2332, 7, N'lblRestore', N'Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2333, 7, N'btnBackup', N'Backup Database')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2334, 7, N'btnRestore', N'Restore Database')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2335, 7, N'lblAtencion', N'Atención!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2336, 7, N'lblAtencionCuerpo', N'When restoring the database, your session will be closed and you will be sent to Login')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2337, 7, N'lblAltaUsuario', N'User Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2338, 7, N'lblNombre', N'First Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2339, 7, N'lblApellido', N'Last Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2340, 7, N'lblDNI', N'ID')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2341, 7, N'lblDireccion', N'Address')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2342, 7, N'lblFechaNacimiento', N'Birthdate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2343, 7, N'btnAceptar', N'Accept')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2344, 7, N'Gestion de Usuario', N'User Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2345, 7, N'btnModificar', N'Edit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2346, 7, N'btnBaja', N'Unsubscribe')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2347, 7, N'btnrestore', N'Reset Password')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2348, 7, N'btnAgregarRol', N'Create Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2349, 7, N'btnSeleccionarPermiso', N'Select Permission')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2350, 7, N'btnSelectRol', N'Select Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2351, 7, N'lblNombreRol', N'Role Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2352, 7, N'lblGestionPermisos', N'Permission Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2353, 7, N'lblGestionRoles', N'Role Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2354, 7, N'Permisos Asignados', N'
Assigned Permissions')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2355, 7, N'btnSeleccionarUsuario', N'Select User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2356, 7, N'btnAgregarPermiso', N'Add Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2357, 7, N'Agregar Permiso', N'Add Permission')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2358, 7, N'lblTodoBien', N'Everything is fine
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2359, 7, N'lblTextoDVV', N'The database is complete!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2360, 7, N'lblTodoMal', N'Something went wrong')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2361, 7, N'lblTextoDVVMal', N'The database is not complete')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2362, 7, N'lblParametros', N'Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2363, 7, N'lblSeleccioneParametro', N'Select the parameter
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2364, 7, N'lblValor', N'Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2365, 7, N'btnAgregar', N'Add')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2366, 7, N'lblParametrosAgregados', N'Added parameters
')
GO
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2367, 7, N'btnGuardar', N'Save')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2368, 7, N'Habitos', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2369, 7, N'lblSeleccioneHabito', N'Select Habit
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2370, 7, N'lblVecesPorSemana', N'Timer per week')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2371, 7, N'lblHabitosUsuario', N'User Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2372, 7, N'lblAltaHabito', N'Registration of Habits
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2373, 7, N'lblNombreParametro', N'Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2374, 7, N'lblEfectoPositivo', N'Positive Effect
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2375, 7, N'lblVecesPositivo', N'Times per week Positive')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2376, 7, N'lblEfectoNegativo', N'Negative Effect')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2377, 7, N'lblVecesNegativo', N'Times per week Negative')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2378, 7, N'lblAltaParametros', N'Parameters Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2379, 7, N'lblDescripcion', N'Description')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2380, 7, N'lblDescripcionMax', N'Description of Maximum Values
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2381, 7, N'lblValMaxMasc', N'Male Maximum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2382, 7, N'lblValMaxFem', N'Female Maximum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2383, 7, N'lblDescMin', N'Description of Minimum Values')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2384, 7, N'lblValMinMasc', N'Male Minimum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2385, 7, N'lblValMinFem', N'Female Minimum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2386, 7, N'lblAltaServicio', N'Service Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2387, 7, N'lblTiempoMedio', N'Average Time')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2388, 7, N'radiomax', N'Maximum')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2389, 7, N'radiomin', N'Minimum')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2390, 7, N'lblParametrosSeleccionados', N'Selected Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2391, 7, N'lblHabitosSeleccionados', N'Selected Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2392, 7, N'btnSelecc', N'Select Parameter')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2393, 7, N'btnGuardarEnfermedad', N'Save Disease')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2394, 7, N'lblAlarmasActivas', N'Active Alarms')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2395, 7, N'lblMedicionesObservadas', N'Observed Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2396, 7, N'btnEvolucionar', N'Evolve')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2397, 7, N'lblEvolucion', N'Evolution')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2398, 7, N'lblUsuario', N'User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2399, 7, N'btnSeleccionarUsuario', N'Select User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2400, 7, N'lblPermisosAsignados', N'Assigned permissions
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2401, 7, N'btnGuardarRol', N'Save Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2402, 7, N'btnAgregarRolUsu', N'Add Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2403, 7, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2404, 7, N'btnRecalcular', N'Recalculate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2405, 7, N'lblTituloCuidado', N'Look out!!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2406, 7, N'lblCuerpoCuidado', N'The entered parameters are related to the following disease/s, an alarm has been issued to the Medical Department')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2407, 7, N'btnAlarma', N'Agree')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2408, 7, N'btnAgregar', N'Add')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2409, 7, N'lblHabitos2', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2410, 7, N'btnGuardarModificacion', N'Save Modification')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2411, 7, N'lblGestionParametros', N'Parameters Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2412, 7, N'lblParametro', N'Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2413, 7, N'btnSeleccHabito', N'Select Habit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2414, 7, N'lblSuccess', N'Test')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2415, 7, N'btnMod', N'Edit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2416, 7, N'lblsuccess2', N'Test2')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2417, 7, N'lblmod', N'User Modified!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2418, 7, N'btnFiltraUsuarios', N'Filter by user')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2419, 7, N'btnFiltrarTipo', N'Filter by Type')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2420, 7, N'lblerror', N'No records found')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2421, 7, N'lblFallo', N'An error occurred!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2422, 7, N'lblExito', N'
Successful backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2423, 7, N'lblCrearRol', N'Create Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2424, 7, N'lblCompleteNombre', N'Fill the name!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2425, 7, N'lblDesc', N'Description')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2426, 7, N'lblEnf', N'Disease')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2427, 7, N'btnGuardarModif', N'Save Modification')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2428, 7, N'lblBitacora', N'Logs')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2429, 7, N'lblBackup', N'Backup/Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2430, 7, N'lblUsuarios', N'Users')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2431, 7, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2432, 7, N'lblPermisos', N'Permissions')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2433, 7, N'lblDigito', N'Check Digit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2434, 7, N'lblMedicion', N'Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2435, 7, N'lblHabitos', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2436, 7, N'lblServicios', N'Services')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2437, 7, N'lblEventos', N'Events')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2438, 7, N'lblGestionHabitos', N'Habits Management
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2439, 7, N'lblGestionParametro', N'Parameters Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2440, 7, N'lblGestionServicios', N'Service Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2441, 7, N'lblGestionEnfermedades', N'Disease Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2442, 7, N'lblAlarmas', N'Alarms')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2443, 7, N'lblBienvenido', N'Welcome')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2444, 7, N'lblIdioma', N'Change Language')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2445, 7, N'btnCerrarSesion', N'Sign Off')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2446, 7, N'btnFiltrar', N'Filter by')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2447, 7, N'btnQuitarfiltro', N'Remove filters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2448, 7, N'btnFecha', N'Date')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2449, 7, N'btnUsuario', N'User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2450, 7, N'btnTipo', N'Type')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2451, 7, N'lblBackup', N'Backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2452, 7, N'lblRestore', N'Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2453, 7, N'btnBackup', N'Backup Database')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2454, 7, N'btnRestore', N'Restore Database')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2455, 7, N'lblAtencion', N'Atención!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2456, 7, N'lblAtencionCuerpo', N'When restoring the database, your session will be closed and you will be sent to Login')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2457, 7, N'lblAltaUsuario', N'User Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2458, 7, N'lblNombre', N'First Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2459, 7, N'lblApellido', N'Last Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2460, 7, N'lblDNI', N'ID')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2461, 7, N'lblDireccion', N'Address')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2462, 7, N'lblFechaNacimiento', N'Birthdate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2463, 7, N'btnAceptar', N'Accept')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2464, 7, N'Gestion de Usuario', N'User Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2465, 7, N'btnModificar', N'Edit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2466, 7, N'btnBaja', N'Unsubscribe')
GO
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2467, 7, N'btnrestore', N'Reset Password')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2468, 7, N'btnAgregarRol', N'Create Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2469, 7, N'btnSeleccionarPermiso', N'Select Permission')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2470, 7, N'btnSelectRol', N'Select Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2471, 7, N'lblNombreRol', N'Role Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2472, 7, N'lblGestionPermisos', N'Permission Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2473, 7, N'lblGestionRoles', N'Role Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2474, 7, N'Permisos Asignados', N'
Assigned Permissions')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2475, 7, N'btnSeleccionarUsuario', N'Select User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2476, 7, N'btnAgregarPermiso', N'Add Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2477, 7, N'Agregar Permiso', N'Add Permission')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2478, 7, N'lblTodoBien', N'Everything is fine
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2479, 7, N'lblTextoDVV', N'The database is complete!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2480, 7, N'lblTodoMal', N'Something went wrong')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2481, 7, N'lblTextoDVVMal', N'The database is not complete')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2482, 7, N'lblParametros', N'Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2483, 7, N'lblSeleccioneParametro', N'Select the parameter
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2484, 7, N'lblValor', N'Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2485, 7, N'btnAgregar', N'Add')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2486, 7, N'lblParametrosAgregados', N'Added parameters
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2487, 7, N'btnGuardar', N'Save')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2488, 7, N'Habitos', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2489, 7, N'lblSeleccioneHabito', N'Select Habit
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2490, 7, N'lblVecesPorSemana', N'Timer per week')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2491, 7, N'lblHabitosUsuario', N'User Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2492, 7, N'lblAltaHabito', N'Registration of Habits
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2493, 7, N'lblNombreParametro', N'Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2494, 7, N'lblEfectoPositivo', N'Positive Effect
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2495, 7, N'lblVecesPositivo', N'Times per week Positive')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2496, 7, N'lblEfectoNegativo', N'Negative Effect')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2497, 7, N'lblVecesNegativo', N'Times per week Negative')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2498, 7, N'lblAltaParametros', N'Parameters Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2499, 7, N'lblDescripcion', N'Description')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2500, 7, N'lblDescripcionMax', N'Description of Maximum Values
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2501, 7, N'lblValMaxMasc', N'Male Maximum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2502, 7, N'lblValMaxFem', N'Female Maximum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2503, 7, N'lblDescMin', N'Description of Minimum Values')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2504, 7, N'lblValMinMasc', N'Male Minimum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2505, 7, N'lblValMinFem', N'Female Minimum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2506, 7, N'lblAltaServicio', N'Service Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2507, 7, N'lblTiempoMedio', N'Average Time')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2508, 7, N'radiomax', N'Maximum')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2509, 7, N'radiomin', N'Minimum')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2510, 7, N'lblParametrosSeleccionados', N'Selected Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2511, 7, N'lblHabitosSeleccionados', N'Selected Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2512, 7, N'btnSelecc', N'Select Parameter')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2513, 7, N'btnGuardarEnfermedad', N'Save Disease')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2514, 7, N'lblAlarmasActivas', N'Active Alarms')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2515, 7, N'lblMedicionesObservadas', N'Observed Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2516, 7, N'btnEvolucionar', N'Evolve')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2517, 7, N'lblEvolucion', N'Evolution')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2518, 7, N'lblUsuario', N'User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2519, 7, N'btnSeleccionarUsuario', N'Select User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2520, 7, N'lblPermisosAsignados', N'Assigned permissions
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2521, 7, N'btnGuardarRol', N'Save Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2522, 7, N'btnAgregarRolUsu', N'Add Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2523, 7, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2524, 7, N'btnRecalcular', N'Recalculate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2525, 7, N'lblTituloCuidado', N'Look out!!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2526, 7, N'lblCuerpoCuidado', N'The entered parameters are related to the following disease/s, an alarm has been issued to the Medical Department')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2527, 7, N'btnAlarma', N'Agree')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2528, 7, N'btnAgregar', N'Add')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2529, 7, N'lblHabitos2', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2530, 7, N'btnGuardarModificacion', N'Save Modification')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2531, 7, N'lblGestionParametros', N'Parameters Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2532, 7, N'lblParametro', N'Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2533, 7, N'btnSeleccHabito', N'Select Habit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2534, 7, N'lblSuccess', N'Test')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2535, 7, N'btnMod', N'Edit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2536, 7, N'lblsuccess2', N'Test2')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2537, 7, N'lblmod', N'User Modified!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2538, 7, N'btnFiltraUsuarios', N'Filter by user')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2539, 7, N'btnFiltrarTipo', N'Filter by Type')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2540, 7, N'lblerror', N'No records found')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2541, 7, N'lblFallo', N'An error occurred!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2542, 7, N'lblExito', N'
Successful backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2543, 7, N'lblCrearRol', N'Create Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2544, 7, N'lblCompleteNombre', N'Fill the name!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2545, 7, N'lblDesc', N'Description')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2546, 7, N'lblEnf', N'Disease')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2547, 7, N'btnGuardarModif', N'Save Modification')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2548, 8, N'lblBitacora', N'Logs')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2549, 8, N'lblBackup', N'Backup/Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2550, 8, N'lblUsuarios', N'Usuaries')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2551, 8, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2552, 8, N'lblPermisos', N'Permissions')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2553, 8, N'lblDigito', N'Check Digit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2554, 8, N'lblMedicion', N'Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2555, 8, N'lblHabitos', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2556, 8, N'lblServicios', N'Services')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2557, 8, N'lblEventos', N'Events')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2558, 8, N'lblGestionHabitos', N'Habits Management
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2559, 8, N'lblGestionParametro', N'Parameters Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2560, 8, N'lblGestionServicios', N'Service Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2561, 8, N'lblGestionEnfermedades', N'Disease Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2562, 8, N'lblAlarmas', N'Alarms')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2563, 8, N'lblBienvenido', N'Welcome')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2564, 8, N'lblIdioma', N'Change Language')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2565, 8, N'btnCerrarSesion', N'Sign Off')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2566, 8, N'btnFiltrar', N'Filter by')
GO
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2567, 8, N'btnQuitarfiltro', N'Remove filters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2568, 8, N'btnFecha', N'Date')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2569, 8, N'btnUsuario', N'User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2570, 8, N'btnTipo', N'Type')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2571, 8, N'lblBackup', N'Backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2572, 8, N'lblRestore', N'Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2573, 8, N'btnBackup', N'Backup Database')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2574, 8, N'btnRestore', N'Restore Database')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2575, 8, N'lblAtencion', N'Atención!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2576, 8, N'lblAtencionCuerpo', N'When restoring the database, your session will be closed and you will be sent to Login')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2577, 8, N'lblAltaUsuario', N'User Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2578, 8, N'lblNombre', N'First Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2579, 8, N'lblApellido', N'Last Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2580, 8, N'lblDNI', N'ID')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2581, 8, N'lblDireccion', N'Address')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2582, 8, N'lblFechaNacimiento', N'Birthdate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2583, 8, N'btnAceptar', N'Accept')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2584, 8, N'Gestion de Usuario', N'User Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2585, 8, N'btnModificar', N'Edit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2586, 8, N'btnBaja', N'Unsubscribe')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2587, 8, N'btnrestore', N'Reset Password')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2588, 8, N'btnAgregarRol', N'Create Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2589, 8, N'btnSeleccionarPermiso', N'Select Permission')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2590, 8, N'btnSelectRol', N'Select Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2591, 8, N'lblNombreRol', N'Role Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2592, 8, N'lblGestionPermisos', N'Permission Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2593, 8, N'lblGestionRoles', N'Role Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2594, 8, N'Permisos Asignados', N'
Assigned Permissions')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2595, 8, N'btnSeleccionarUsuario', N'Select User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2596, 8, N'btnAgregarPermiso', N'Add Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2597, 8, N'Agregar Permiso', N'Add Permission')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2598, 8, N'lblTodoBien', N'Everything is fine
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2599, 8, N'lblTextoDVV', N'The database is complete!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2600, 8, N'lblTodoMal', N'Something went wrong')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2601, 8, N'lblTextoDVVMal', N'The database is not complete')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2602, 8, N'lblParametros', N'Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2603, 8, N'lblSeleccioneParametro', N'Select the parameter
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2604, 8, N'lblValor', N'Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2605, 8, N'btnAgregar', N'Add')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2606, 8, N'lblParametrosAgregados', N'Added parameters
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2607, 8, N'btnGuardar', N'Save')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2608, 8, N'Habitos', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2609, 8, N'lblSeleccioneHabito', N'Select Habit
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2610, 8, N'lblVecesPorSemana', N'Timer per week')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2611, 8, N'lblHabitosUsuario', N'User Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2612, 8, N'lblAltaHabito', N'Registration of Habits
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2613, 8, N'lblNombreParametro', N'Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2614, 8, N'lblEfectoPositivo', N'Positive Effect
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2615, 8, N'lblVecesPositivo', N'Times per week Positive')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2616, 8, N'lblEfectoNegativo', N'Negative Effect')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2617, 8, N'lblVecesNegativo', N'Times per week Negative')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2618, 8, N'lblAltaParametros', N'Parameters Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2619, 8, N'lblDescripcion', N'Description')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2620, 8, N'lblDescripcionMax', N'Description of Maximum Values
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2621, 8, N'lblValMaxMasc', N'Male Maximum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2622, 8, N'lblValMaxFem', N'Female Maximum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2623, 8, N'lblDescMin', N'Description of Minimum Values')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2624, 8, N'lblValMinMasc', N'Male Minimum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2625, 8, N'lblValMinFem', N'Female Minimum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2626, 8, N'lblAltaServicio', N'Service Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2627, 8, N'lblTiempoMedio', N'Average Time')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2628, 8, N'radiomax', N'Maximum')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2629, 8, N'radiomin', N'Minimum')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2630, 8, N'lblParametrosSeleccionados', N'Selected Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2631, 8, N'lblHabitosSeleccionados', N'Selected Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2632, 8, N'btnSelecc', N'Select Parameter')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2633, 8, N'btnGuardarEnfermedad', N'Save Disease')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2634, 8, N'lblAlarmasActivas', N'Active Alarms')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2635, 8, N'lblMedicionesObservadas', N'Observed Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2636, 8, N'btnEvolucionar', N'Evolve')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2637, 8, N'lblEvolucion', N'Evolution')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2638, 8, N'lblUsuario', N'User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2639, 8, N'btnSeleccionarUsuario', N'Select User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2640, 8, N'lblPermisosAsignados', N'Assigned permissions
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2641, 8, N'btnGuardarRol', N'Save Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2642, 8, N'btnAgregarRolUsu', N'Add Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2643, 8, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2644, 8, N'btnRecalcular', N'Recalculate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2645, 8, N'lblTituloCuidado', N'Look out!!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2646, 8, N'lblCuerpoCuidado', N'The entered parameters are related to the following disease/s, an alarm has been issued to the Medical Department')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2647, 8, N'btnAlarma', N'Agree')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2648, 8, N'btnAgregar', N'Add')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2649, 8, N'lblHabitos2', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2650, 8, N'btnGuardarModificacion', N'Save Modification')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2651, 8, N'lblGestionParametros', N'Parameters Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2652, 8, N'lblParametro', N'Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2653, 8, N'btnSeleccHabito', N'Select Habit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2654, 8, N'lblSuccess', N'Test')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2655, 8, N'btnMod', N'Edit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2656, 8, N'lblsuccess2', N'Test2')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2657, 8, N'lblmod', N'User Modified!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2658, 8, N'btnFiltraUsuarios', N'Filter by user')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2659, 8, N'btnFiltrarTipo', N'Filter by Type')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2660, 8, N'lblerror', N'No records found')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2661, 8, N'lblFallo', N'An error occurred!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2662, 8, N'lblExito', N'
Successful backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2663, 8, N'lblCrearRol', N'Create Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2664, 8, N'lblCompleteNombre', N'Fill the name!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2665, 8, N'lblDesc', N'Description')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2666, 8, N'lblEnf', N'Disease')
GO
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2667, 8, N'btnGuardarModif', N'Save Modification')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2668, 8, N'lblBitacora', N'Logs')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2669, 8, N'lblBackup', N'Backup/Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2670, 8, N'lblUsuarios', N'Users')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2671, 8, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2672, 8, N'lblPermisos', N'Permissions')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2673, 8, N'lblDigito', N'Check Digit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2674, 8, N'lblMedicion', N'Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2675, 8, N'lblHabitos', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2676, 8, N'lblServicios', N'Services')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2677, 8, N'lblEventos', N'Events')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2678, 8, N'lblGestionHabitos', N'Habits Management
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2679, 8, N'lblGestionParametro', N'Parameters Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2680, 8, N'lblGestionServicios', N'Service Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2681, 8, N'lblGestionEnfermedades', N'Disease Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2682, 8, N'lblAlarmas', N'Alarms')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2683, 8, N'lblBienvenido', N'Welcome')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2684, 8, N'lblIdioma', N'Change Language')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2685, 8, N'btnCerrarSesion', N'Sign Off')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2686, 8, N'btnFiltrar', N'Filter by')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2687, 8, N'btnQuitarfiltro', N'Remove filters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2688, 8, N'btnFecha', N'Date')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2689, 8, N'btnUsuario', N'User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2690, 8, N'btnTipo', N'Type')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2691, 8, N'lblBackup', N'Backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2692, 8, N'lblRestore', N'Restore')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2693, 8, N'btnBackup', N'Backup Database')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2694, 8, N'btnRestore', N'Restore Database')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2695, 8, N'lblAtencion', N'Atención!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2696, 8, N'lblAtencionCuerpo', N'When restoring the database, your session will be closed and you will be sent to Login')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2697, 8, N'lblAltaUsuario', N'User Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2698, 8, N'lblNombre', N'First Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2699, 8, N'lblApellido', N'Last Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2700, 8, N'lblDNI', N'ID')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2701, 8, N'lblDireccion', N'Address')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2702, 8, N'lblFechaNacimiento', N'Birthdate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2703, 8, N'btnAceptar', N'Accept')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2704, 8, N'Gestion de Usuario', N'User Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2705, 8, N'btnModificar', N'Edit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2706, 8, N'btnBaja', N'Unsubscribe')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2707, 8, N'btnrestore', N'Reset Password')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2708, 8, N'btnAgregarRol', N'Create Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2709, 8, N'btnSeleccionarPermiso', N'Select Permission')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2710, 8, N'btnSelectRol', N'Select Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2711, 8, N'lblNombreRol', N'Role Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2712, 8, N'lblGestionPermisos', N'Permission Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2713, 8, N'lblGestionRoles', N'Role Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2714, 8, N'Permisos Asignados', N'
Assigned Permissions')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2715, 8, N'btnSeleccionarUsuario', N'Select User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2716, 8, N'btnAgregarPermiso', N'Add Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2717, 8, N'Agregar Permiso', N'Add Permission')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2718, 8, N'lblTodoBien', N'Everything is fine
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2719, 8, N'lblTextoDVV', N'The database is complete!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2720, 8, N'lblTodoMal', N'Something went wrong')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2721, 8, N'lblTextoDVVMal', N'The database is not complete')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2722, 8, N'lblParametros', N'Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2723, 8, N'lblSeleccioneParametro', N'Select the parameter
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2724, 8, N'lblValor', N'Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2725, 8, N'btnAgregar', N'Add')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2726, 8, N'lblParametrosAgregados', N'Added parameters
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2727, 8, N'btnGuardar', N'Save')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2728, 8, N'Habitos', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2729, 8, N'lblSeleccioneHabito', N'Select Habit
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2730, 8, N'lblVecesPorSemana', N'Timer per week')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2731, 8, N'lblHabitosUsuario', N'User Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2732, 8, N'lblAltaHabito', N'Registration of Habits
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2733, 8, N'lblNombreParametro', N'Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2734, 8, N'lblEfectoPositivo', N'Positive Effect
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2735, 8, N'lblVecesPositivo', N'Times per week Positive')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2736, 8, N'lblEfectoNegativo', N'Negative Effect')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2737, 8, N'lblVecesNegativo', N'Times per week Negative')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2738, 8, N'lblAltaParametros', N'Parameters Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2739, 8, N'lblDescripcion', N'Description')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2740, 8, N'lblDescripcionMax', N'Description of Maximum Values
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2741, 8, N'lblValMaxMasc', N'Male Maximum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2742, 8, N'lblValMaxFem', N'Female Maximum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2743, 8, N'lblDescMin', N'Description of Minimum Values')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2744, 8, N'lblValMinMasc', N'Male Minimum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2745, 8, N'lblValMinFem', N'Female Minimum Value')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2746, 8, N'lblAltaServicio', N'Service Registration')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2747, 8, N'lblTiempoMedio', N'Average Time')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2748, 8, N'radiomax', N'Maximum')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2749, 8, N'radiomin', N'Minimum')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2750, 8, N'lblParametrosSeleccionados', N'Selected Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2751, 8, N'lblHabitosSeleccionados', N'Selected Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2752, 8, N'btnSelecc', N'Select Parameter')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2753, 8, N'btnGuardarEnfermedad', N'Save Disease')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2754, 8, N'lblAlarmasActivas', N'Active Alarms')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2755, 8, N'lblMedicionesObservadas', N'Observed Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2756, 8, N'btnEvolucionar', N'Evolve')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2757, 8, N'lblEvolucion', N'Evolution')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2758, 8, N'lblUsuario', N'User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2759, 8, N'btnSeleccionarUsuario', N'Select User')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2760, 8, N'lblPermisosAsignados', N'Assigned permissions
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2761, 8, N'btnGuardarRol', N'Save Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2762, 8, N'btnAgregarRolUsu', N'Add Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2763, 8, N'lblRoles', N'Roles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2764, 8, N'btnRecalcular', N'Recalculate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2765, 8, N'lblTituloCuidado', N'Look out!!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2766, 8, N'lblCuerpoCuidado', N'The entered parameters are related to the following disease/s, an alarm has been issued to the Medical Department')
GO
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2767, 8, N'btnAlarma', N'Agree')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2768, 8, N'btnAgregar', N'Add')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2769, 8, N'lblHabitos2', N'Habits')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2770, 8, N'btnGuardarModificacion', N'Save Modification')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2771, 8, N'lblGestionParametros', N'Parameters Management')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2772, 8, N'lblParametro', N'Parameters')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2773, 8, N'btnSeleccHabito', N'Select Habit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2774, 8, N'lblSuccess', N'Test')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2775, 8, N'btnMod', N'Edit')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2776, 8, N'lblsuccess2', N'Test2')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2777, 8, N'lblmod', N'User Modified!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2778, 8, N'btnFiltraUsuarios', N'Filter by user')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2779, 8, N'btnFiltrarTipo', N'Filter by Type')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2780, 8, N'lblerror', N'No records found')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2781, 8, N'lblFallo', N'An error occurred!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2782, 8, N'lblExito', N'
Successful backup')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2783, 8, N'lblCrearRol', N'Create Role')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2784, 8, N'lblCompleteNombre', N'Fill the name!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2785, 8, N'lblDesc', N'Description')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2786, 8, N'lblEnf', N'Disease')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2787, 8, N'btnGuardarModif', N'Save Modification')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2788, 1, N'btnSeleccionarIdioma', N'Seleccionar Idioma')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2789, 2, N'btnSeleccionarIdioma', N'Choose Language')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2790, 1, N'btnCrearIdioma', N'Crear Idioma')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2791, 2, N'btnCrearIdioma', N'Create Language')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2792, 1, N'btnGuardarModificacion', N'Guardar Modificación')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2793, 1, N'btnCrearNuevoidioma', N'Crear Nuevo Idioma')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2794, 2, N'btnCrearNuevoidioma', N'Create New Language')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2795, 1, N'lblSeleccioneIdioma', N'Seleccione el Idioma')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2796, 2, N'lblSeleccioneIdioma', N'Choose Language')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2797, 1, N'lblNombreIdioma', N'Nombre del Idioma')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2798, 2, N'lblNombreIdioma', N'Language Name')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2799, 1, N'lblTextoaTraducir', N'Texto a Traducir')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2800, 2, N'lblTextoaTraducir', N'Text to Translate')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2801, 1, N'lblExisteHabito', N'El hábito que intenta ingresar ya existe')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2802, 2, N'lblExisteHabito', N'The habit you are trying to enter already exists')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2803, 1, N'lblSolicitarServicio', N'Solicitar Servicio')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2804, 2, N'lblSolicitarServicio', N'Request Service
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2805, 1, N'lblServiciosDisponibles', N'Servicios Disponibles')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2806, 2, N'lblServiciosDisponibles', N'Available Services
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2807, 1, N'lblFecha', N'Fecha')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2808, 2, N'lblFecha', N'Date')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2809, 1, N'lblHora', N'Hora')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2810, 2, N'lblHora', N'Time')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2811, 1, N'lblSolicitarServicioOk', N'Servicio solicitado correctamente!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2812, 2, N'lblSolicitarServicioOk', N'Service requested successfully!')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2813, 1, N'lblColaServicios', N'Cola de Servicios')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2814, 2, N'lblColaServicios', N'Service Queue
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2815, 1, N'lblServiciosSolicitados', N'Servicios Solicitados')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2816, 2, N'lblServiciosSolicitados', N'Requested Services')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2817, 1, N'lblTiempoServicio', N'Duración del Servicio')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2818, 2, N'lblTiempoServicio', N'Service duration
')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2819, 1, N'lblCerrarServicio', N'Cerrar Servicio')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2820, 2, N'lblCerrarServicio', N'Close Service')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2821, 1, N'btnCerrarServicio', N'Cerrar Servicio')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2822, 2, N'btnCerrarServicio', N'Close Service')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2823, 1, N'btnGenerarReporte', N'Generar Reporte')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2824, 2, N'btnGenerarReporte', N'
Generate Report')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2825, 1, N'Reserved_AsyncLoadTarget', N'asd')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2826, 2, N'Reserved_AsyncLoadTarget', N'asd')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2827, 1, N'HttpHandlerMissingErrorMessage', N' ')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2828, 2, N'HttpHandlerMissingErrorMessage', N' ')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2829, 1, N'Wait', N' ')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2830, 2, N'Wait', N' ')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2831, 1, N'TotalPages', N'Paginas Totales')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2832, 2, N'TotalPages', N'Total Pages')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2833, 1, N'btnGenerarExcel', N'Generar Excel')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2834, 2, N'btnGenerarExcel', N'Generate Excel')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2835, 1, N'lblMedicionesUsuario', N'Mediciones del Usuario')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2836, 2, N'lblMedicionesUsuario', N'User Measurements')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2837, 1, N'lblMedicionSeleccionada', N'Medición Seleccionada')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2838, 2, N'lblMedicionSeleccionada', N'Selected Measurement')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2839, 1, N'lblMedicionHistorica', N'Medición Histórica')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2840, 2, N'lblMedicionHistorica', N'
Historical Measurement')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2841, 1, N'btnQuitarParametro', N'Quitar Parámetro')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2842, 2, N'btnQuitarParametro', N'
Remove parameter')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2843, 1, N'lblEnfermedadesCargadas', N'Enfermedades Cargadas')
INSERT [dbo].[Traduccion] ([ID], [ID_Idioma], [NombreControl], [Traduccion]) VALUES (2844, 2, N'lblEnfermedadesCargadas', N'Laden Diseases')
SET IDENTITY_INSERT [dbo].[Traduccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([ID], [Nombre], [Apellido], [ID_Idioma], [DNI], [Contraseña], [Borrado], [DVH], [PrimerInicio], [Direccion], [FechaDeNacimiento]) VALUES (1, N'Nicolas', N'Rubino', 1, 38522346, N'NieO1n26TmxDvvqXWzSUHg==', 0, 6196, 0, N'Enrique Ochoa 322, CABA', CAST(N'1994-10-11' AS Date))
INSERT [dbo].[Usuario] ([ID], [Nombre], [Apellido], [ID_Idioma], [DNI], [Contraseña], [Borrado], [DVH], [PrimerInicio], [Direccion], [FechaDeNacimiento]) VALUES (12, N'Iara', N'Giraldes', NULL, 40005394, N'/v7ogwSM4QmnNLA/5r/nXw==', 1, 5123, 0, N'Av. Boedo 1707', CAST(N'2020-09-09' AS Date))
INSERT [dbo].[Usuario] ([ID], [Nombre], [Apellido], [ID_Idioma], [DNI], [Contraseña], [Borrado], [DVH], [PrimerInicio], [Direccion], [FechaDeNacimiento]) VALUES (13, N'Lionel', N'Messi', NULL, 1234567, N'B44IW4X3d+cnkPpdDVVaSg==', 1, 4670, 0, N'Camp Nou', CAST(N'2020-09-11' AS Date))
INSERT [dbo].[Usuario] ([ID], [Nombre], [Apellido], [ID_Idioma], [DNI], [Contraseña], [Borrado], [DVH], [PrimerInicio], [Direccion], [FechaDeNacimiento]) VALUES (14, N'Cristiano', N'Ronaldo', NULL, 22, N'rJydAn5wANiphe8DCGtg3g==', 1, 5077, 1, N'Madeira', CAST(N'2020-09-18' AS Date))
INSERT [dbo].[Usuario] ([ID], [Nombre], [Apellido], [ID_Idioma], [DNI], [Contraseña], [Borrado], [DVH], [PrimerInicio], [Direccion], [FechaDeNacimiento]) VALUES (15, N'Paulo', N'Dybala', NULL, 456, N'qtGKrW1s0BdCgCC+BICvcw==', 0, 4298, 0, N'Turin', CAST(N'2020-09-12' AS Date))
INSERT [dbo].[Usuario] ([ID], [Nombre], [Apellido], [ID_Idioma], [DNI], [Contraseña], [Borrado], [DVH], [PrimerInicio], [Direccion], [FechaDeNacimiento]) VALUES (16, N'Luis', N'Suarez', NULL, 444, N'5EzbDPhJIuwUG1HfnTV44w==', 1, 4319, 1, N'Madrid', CAST(N'2020-09-02' AS Date))
INSERT [dbo].[Usuario] ([ID], [Nombre], [Apellido], [ID_Idioma], [DNI], [Contraseña], [Borrado], [DVH], [PrimerInicio], [Direccion], [FechaDeNacimiento]) VALUES (17, N'Gaston', N'Tapia', NULL, 123, N'xflMaRVPoYPAxwBQW0DS/w==', 0, 4086, 0, N'UAI', CAST(N'2020-09-11' AS Date))
INSERT [dbo].[Usuario] ([ID], [Nombre], [Apellido], [ID_Idioma], [DNI], [Contraseña], [Borrado], [DVH], [PrimerInicio], [Direccion], [FechaDeNacimiento]) VALUES (18, N'Luis', N'Suarez', NULL, 123, N'NieO1n26TmxDvvqXWzSUHg==', 0, 4838, 0, N'Av. Boedo 1707', CAST(N'2001-11-30' AS Date))
INSERT [dbo].[Usuario] ([ID], [Nombre], [Apellido], [ID_Idioma], [DNI], [Contraseña], [Borrado], [DVH], [PrimerInicio], [Direccion], [FechaDeNacimiento]) VALUES (19, N'Juan Roman', N'Riquelme', NULL, 789, N'Sl+zfgp6cRghMBOm18vLmw==', 0, 5702, 0, N'La Bombonera', CAST(N'2019-11-11' AS Date))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 1)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 2)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 3)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 4)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 5)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 6)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 7)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 8)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 9)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 10)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 11)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 12)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 13)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 14)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 15)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 16)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 17)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 18)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 19)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 20)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (1, 21)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (15, 1)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (15, 2)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (15, 3)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (15, 4)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (17, 7)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (17, 15)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (18, 16)
GO
/****** Object:  Index [IXFK_Alarma_Usuario]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Alarma_Usuario] ON [dbo].[Alarma]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Familiar_Usuario]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Familiar_Usuario] ON [dbo].[Familiar]
(
	[ID_Familiar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Habito_Tipo_Habito]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Habito_Tipo_Habito] ON [dbo].[Habito]
(
	[ID_TipoHabito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Habito_Usuario]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Habito_Usuario] ON [dbo].[Habito]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Idioma_Usuario]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Idioma_Usuario] ON [dbo].[Idioma]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Lenguaje_Etiqueta_Etiqueta]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Lenguaje_Etiqueta_Etiqueta] ON [dbo].[Lenguaje_Etiqueta]
(
	[ID_Etiqueta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Lenguaje_Etiqueta_Lenguaje]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Lenguaje_Etiqueta_Lenguaje] ON [dbo].[Lenguaje_Etiqueta]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Medicion_TipoMedicion]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Medicion_TipoMedicion] ON [dbo].[Medicion]
(
	[ID_TipoMedicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Medicion_Usuario]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Medicion_Usuario] ON [dbo].[Medicion]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Mediciones_Alarma_Alarma]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Mediciones_Alarma_Alarma] ON [dbo].[Mediciones_Alarma]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Mediciones_Alarma_Medicion]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Mediciones_Alarma_Medicion] ON [dbo].[Mediciones_Alarma]
(
	[ID_Medicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Medico_Empleado]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Medico_Empleado] ON [dbo].[Medico]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Servicio_Empleado]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Servicio_Empleado] ON [dbo].[Servicio]
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Servicio_TipoServicio]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Servicio_TipoServicio] ON [dbo].[Servicio]
(
	[ID_TipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Servicio_Usuario]    Script Date: 08/12/2020 22:51:21 ******/
CREATE NONCLUSTERED INDEX [IXFK_Servicio_Usuario] ON [dbo].[Servicio]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarDVV]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarDVV]

	@tabla varchar(max), @dvv int
AS
BEGIN
	
	Update DigitoVerificadorVertical
	set DVV = @dvv
	where ID = (SELECT ID from DigitoVerificadorVertical where Nombre_Tabla = @tabla)

END
GO
/****** Object:  StoredProcedure [dbo].[Alarma_Alta]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Alarma_Alta] 
	@fecha datetime, @idusu int
AS
BEGIN
	Insert into Alarma(Fecha,ID_Usuario) values (@fecha, @idusu)
END
GO
/****** Object:  StoredProcedure [dbo].[Alarma_Evolucionar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Alarma_Evolucionar]
	@id int, @evolucion varchar(MAX)
AS
BEGIN

Update Alarma set Evolucion = @evolucion where ID= @id

END
GO
/****** Object:  StoredProcedure [dbo].[Alarma_GuardarMedicion]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Alarma_GuardarMedicion]
	@fecha datetime, @idusu int
AS
BEGIN
	Insert into Mediciones_Alarma (ID, ID_Medicion)
	values ((Select Max(ID) from Alarma),(Select ID from Medicion where Fecha = @fecha and ID_Usuario = @idusu))
END
GO
/****** Object:  StoredProcedure [dbo].[Alarmas_Listar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Alarmas_Listar]
	@id int
AS
BEGIN

Select * from Alarma left join Mediciones_Alarma on Alarma.ID = Mediciones_Alarma.ID
inner join Medicion on Medicion.ID = Mediciones_Alarma.ID_Medicion


END
GO
/****** Object:  StoredProcedure [dbo].[Enfermedad_Agregar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Enfermedad_Agregar] 
	@nombre varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Insert into Enfermedad(Nombre, Borrado) values (@nombre, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[Enfermedad_AgregarHabito]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Enfermedad_AgregarHabito]
@idhabito int
AS
BEGIN
	Insert into Enfermedad_Habitos(ID_Habito, ID) values
	(@idhabito, (Select MAX(ID) from Enfermedad))
END
GO
/****** Object:  StoredProcedure [dbo].[Enfermedad_Baja]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Enfermedad_Baja] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update Enfermedad
	set Borrado = 1 where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Enfermedad_BajaSintomas]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Enfermedad_BajaSintomas] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Delete Sintoma from Sintoma where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Enfermedad_EnumerarSintomas]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Enfermedad_EnumerarSintomas] 
	@idenf varchar(50)
AS
BEGIN
	Select COUNT(ID) from Sintoma where ID = @idenf
END
GO
/****** Object:  StoredProcedure [dbo].[Enfermedad_ListarPorMed]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Enfermedad_ListarPorMed] 
@id int
AS
BEGIN
	Select * from Sintoma Left Join Enfermedad on Sintoma.ID = Enfermedad.ID
	where ID_TipoMedicion = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Enfermedad_Listarsintomas]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Enfermedad_Listarsintomas] 
	@idenf int
AS
BEGIN
	Select * from Sintoma where ID = @idenf
END
GO
/****** Object:  StoredProcedure [dbo].[Enfermedad_ModificarSintomas]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Enfermedad_ModificarSintomas] 
	@idenf int, @maximo int, @id int
AS
BEGIN
	Insert into Sintoma(ID_TipoMedicion, Maximo, ID)
	values(@id, @maximo, @idenf)
END
GO
/****** Object:  StoredProcedure [dbo].[Evento_Alta]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Evento_Alta]
	@idusu int, @titulo varchar(50), @desc varchar(MAX), @fecha DateTime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	Insert into Evento(ID_Usuario, Titulo, Descripcion, Fecha)
	values (@idusu, @titulo, @desc, @fecha)
END
GO
/****** Object:  StoredProcedure [dbo].[Habito_Baja]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Habito_Baja]
	-- Add the parameters for the stored procedure here
	@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	Update Tipo_Habito
	set Borrado = 1
	where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Habito_Guardar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Habito_Guardar]

@nom varchar(50), @valorneg int, @valorpos int, @efeneg varchar(50), @efepos varchar(50)

AS
BEGIN
	
	Insert into Tipo_Habito(Nombre, ValorNegativo, ValorPositivo, EfectoNegativo, EfectoPositivo, Borrado)
	values( @nom, @valorneg, @valorneg, @efeneg, @efepos, 0)

END
GO
/****** Object:  StoredProcedure [dbo].[Habito_ListarID]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Habito_ListarID] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	Select * from Tipo_Habito where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Habito_Modificar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Habito_Modificar]
	-- Add the parameters for the stored procedure here
	@nom varchar(50), @valorneg int, @valorpos int, @efeneg varchar(50), @efepos varchar(50), @id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	Update Tipo_Habito
	set Nombre = @nom, ValorNegativo = @valorneg, ValorPositivo = @valorpos, EfectoNegativo = @efeneg, EfectoPositivo = @efepos
	where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Habitos_ListarUsuario]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Habitos_ListarUsuario] 
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	Select * from Habito where ID_Usuario = @id
END
GO
/****** Object:  StoredProcedure [dbo].[HabitoUsuario_Guardar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HabitoUsuario_Guardar]

@idhab int, @valor int, @idusu int

AS
BEGIN
	
	INSERT INTO Habito(ID_TipoHabito, ID_Usuario, VecesXSemana)
	values (@idhab, @idusu, @valor)

END
GO
/****** Object:  StoredProcedure [dbo].[HabitoUsuario_Modificar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HabitoUsuario_Modificar]

@id int, @valor int

AS
BEGIN
	
	Update Habito set VecesXSemana = @valor where ID = @id

END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_Agregar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Idioma_Agregar] 
	@nombre varchar(50)
AS
BEGIN
	Insert into Idioma(NombreIdioma) values (@nombre)
END
GO
/****** Object:  StoredProcedure [dbo].[Idioma_AgregarEtiqueta]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Idioma_AgregarEtiqueta] 
	@nombrecontrol varchar(max), @traduccion varchar(max)
AS
BEGIN
	Insert into Traduccion(ID_Idioma, NombreControl, Traduccion)
	values ((Select MAX(ID)from Idioma), @nombrecontrol, @traduccion)
END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Traduccion]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Traduccion] 
	@ididioma int
AS
BEGIN

Select * from Traduccion Right join Idioma on Traduccion.ID_Idioma = @ididioma

END
GO
/****** Object:  StoredProcedure [dbo].[ListarEntidad]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListarEntidad] 
	 @Tabla nvarchar(100)

As

Declare @sql nvarchar(max);
Declare @parametros varchar(500);


Set @sql = 'SELECT * FROM ' + QUOTENAME(@Tabla);

exec sp_executesql @sql
        
GO
/****** Object:  StoredProcedure [dbo].[Medicion_Agregar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Medicion_Agregar]
	-- Add the parameters for the stored procedure here
	@idusu int, @idmed int, @valor int, @fecha datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Insert into Medicion(ID_Usuario,ID_TipoMedicion,Valor,Fecha) values(@idusu, @idmed, @valor, @fecha)

END
GO
/****** Object:  StoredProcedure [dbo].[Medicion_Listar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Medicion_Listar]
	@id int
AS
BEGIN
	Select * from Medicion where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Medicion_ListarID]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Medicion_ListarID]
	@id int
AS
BEGIN
	Select * from Mediciones_Alarma where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Medicion_ListarTipo]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Medicion_ListarTipo]
	@id int
AS
BEGIN
	Select * from TipoMedicion where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Medicion_ListarUsuario]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Medicion_ListarUsuario]
	@id int
AS
BEGIN
	Select * from Medicion where ID_Usuario = @id
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEntidadID]    Script Date: 08/12/2020 22:51:21 ******/
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
/****** Object:  StoredProcedure [dbo].[Parametro_Agregar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Parametro_Agregar] 

@nombre varchar(50), @desc varchar(max), @descmax varchar(50), @descmin varchar(50), @maxmasc int, @maxfem int, @minfem int, @minmasc int
AS
BEGIN
	Insert into TipoMedicion(Nombre, Descripcion, DescripcionMaxima, DescripcionMinima, MinimoFemenino, MinimoMasculino, MaximoFemenino, MaximoMasculino, Borrado)
	values (@nombre, @desc, @descmax, @descmin, @minfem, @minmasc, @maxfem, @maxmasc, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[Parametro_Baja]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Parametro_Baja]
	-- Add the parameters for the stored procedure here
	@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	Update TipoMedicion
	set Borrado = 1
	where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Parametro_Modificar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Parametro_Modificar]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50), @desc varchar(max), @descmax varchar(50), @descmin varchar(50), @maxmasc int, @maxfem int, @minfem int, @minmasc int, @id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	Update TipoMedicion
	set Nombre = @nombre, Descripcion = @desc, DescripcionMaxima = @descmax,
	DescripcionMinima = @descmin, MaximoFemenino = @maxfem, MaximoMasculino = @maxmasc, MinimoFemenino = @minfem,
	MinimoMasculino = @minmasc
	where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Permiso_Insertar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Permiso_Insertar]
@nombre varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Insert into Permiso(ID,Nombre) values (((Select MAX(ID) from Permiso where id < 100)+1),@nombre)
END
GO
/****** Object:  StoredProcedure [dbo].[Permiso_Listar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Permiso_Listar] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Permiso where ID < 100
END
GO
/****** Object:  StoredProcedure [dbo].[Prueba2]    Script Date: 08/12/2020 22:51:21 ******/
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
/****** Object:  StoredProcedure [dbo].[Rol_GuardarPermiso]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Rol_GuardarPermiso] 
	@idper int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.


  Insert into Rol(ID_Rol,ID_Permiso) values ((Select MAX(ID) from Permiso where id > 100) , @idper)
END
GO
/****** Object:  StoredProcedure [dbo].[Rol_Insertar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Rol_Insertar]
@nombre varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Insert into Permiso(ID,Nombre) values (((Select MAX(ID) from Permiso where id > 100)+1),@nombre)
END
GO
/****** Object:  StoredProcedure [dbo].[Rol_Listar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Rol_Listar] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Permiso where ID >= 100
END
GO
/****** Object:  StoredProcedure [dbo].[Rol_ObtenerPermisos]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Rol_ObtenerPermisos]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Rol where ID_Rol = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Servicio_Agregar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Servicio_Agregar]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50), @desc varchar(max), @tiempo int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Insert into TipoServicio(NombreServicio, Descripcion, TiempoMedio, Borrado) values(@nombre, @desc, @tiempo, 0)

END
GO
/****** Object:  StoredProcedure [dbo].[Servicio_Baja]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Servicio_Baja]
	-- Add the parameters for the stored procedure here
	@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	Update TipoServicio
	set Borrado = 1
	where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Servicio_Cerrar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Servicio_Cerrar] 
	@idserv int, @fechacierre DateTime, @Tiempo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	Insert into Servicio_Cerrado(ID, FechaCierre, TiempoServicio)
	values (@idserv, @fechacierre, @Tiempo)
END
GO
/****** Object:  StoredProcedure [dbo].[Servicio_Modificacion]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Servicio_Modificacion]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50), @desc varchar(max), @tiempo int, @id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	Update TipoServicio
	set NombreServicio=@nombre, Descripcion = @desc, TiempoMedio = @tiempo
	where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Servicio_Solicitar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Servicio_Solicitar]
	@idusu int, @fechapedido Datetime, @fechaserv DateTime, @idserv int
AS
BEGIN

	Insert into Servicio (ID_Usuario, FechaPedido, FechaServicio, ID_TipoServicio)
	values (@idusu, @fechapedido, @fechaserv, @idserv)
END
GO
/****** Object:  StoredProcedure [dbo].[Sintoma_Agregar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sintoma_Agregar] 
@idsintoma int, @maximo int
AS
BEGIN
	Insert into Sintoma(ID_TipoMedicion, Maximo, ID) values
	(@idsintoma, @maximo, (Select MAX(ID) from Enfermedad))
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Agregar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Agregar]
	@nombre varchar(50), @apellido varchar(50), @dni int, @pass varchar(max), @borrado int, @dvh varchar(50), @dir varchar(MAX), @fechanac date
AS
BEGIN

	Insert into Usuario(Nombre, Apellido, DNI, Contraseña, Borrado, DVH, Direccion, PrimerInicio, FechaDeNacimiento) values (@nombre, @apellido, @dni, @pass, @borrado, @dvh, @dir, 1, @fechanac)
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Baja]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Baja] 
@id int, @dvh varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Update Usuario
	set Borrado = 1, DVH = @dvh
	where ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_BorrarPermisos]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_BorrarPermisos]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
DELETE from Usuario_Permiso where ID_Usuario = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_CambiarContraseña]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_CambiarContraseña]
	 @id int, @dvh varchar(50), @contra varchar(Max)
AS
BEGIN

	
	update Usuario
	set DVH = @dvh, Contraseña = @contra, PrimerInicio = 0
	where ID=@id

END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_GuardarPermisos]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_GuardarPermisos]
@idusu int, @idper int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Insert into Usuario_Permiso(ID_Usuario, ID_Permiso) values (@idusu, @idper)
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Modificar]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Modificar]
	@nombre varchar(50), @apellido varchar(50), @dni int, @borrado int, @dvh varchar(50), @dir varchar(MAX), @fechanac date, @id int
AS
BEGIN

	
	update Usuario
	set Nombre=@nombre, Apellido = @apellido, DNI = @dni, Borrado = @borrado, FechaDeNacimiento = @fechanac, DVH = @dvh
	where ID=@id

END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Obtener]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Obtener]
@dni int,
@pass varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	SELECT * from Usuario where DNI = @dni and Contraseña = @pass
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_ObtenerPermisos]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_ObtenerPermisos] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Usuario_Permiso where ID_Usuario = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_RestaurarContraseña]    Script Date: 08/12/2020 22:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_RestaurarContraseña]
	 @id int, @dvh varchar(50), @contra varchar(Max)
AS
BEGIN

	
	update Usuario
	set DVH = @dvh, Contraseña = @contra, PrimerInicio = 1
	where ID=@id

END
GO
USE [master]
GO
ALTER DATABASE [CareMonitor] SET  READ_WRITE 
GO
