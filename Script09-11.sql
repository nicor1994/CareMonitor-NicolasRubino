USE [master]
GO
/****** Object:  Database [CareMonitor]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Alarma]    Script Date: 09/11/2020 22:56:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitoVerificadorVertical]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Enfermedad]    Script Date: 09/11/2020 22:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enfermedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Enfermedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enfermedad_Habitos]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Evento]    Script Date: 09/11/2020 22:56:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Familiar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Habito]    Script Date: 09/11/2020 22:56:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 09/11/2020 22:56:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lenguaje]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Lenguaje_Etiqueta]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Medicion]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Mediciones_Alarma]    Script Date: 09/11/2020 22:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mediciones_Alarma](
	[ID] [int] NOT NULL,
	[ID_Medicion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Permiso]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Servicio]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Sintoma]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Tipo_Habito]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[TipoMedicion]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  Table [dbo].[Usuario_Permiso]    Script Date: 09/11/2020 22:56:12 ******/
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
INSERT [dbo].[DigitoVerificadorVertical] ([ID], [Nombre_Tabla], [DVV]) VALUES (1, N'Usuario', N'1686')
GO
SET IDENTITY_INSERT [dbo].[Enfermedad] ON 

INSERT [dbo].[Enfermedad] ([ID], [Nombre]) VALUES (5, N'Prueba')
INSERT [dbo].[Enfermedad] ([ID], [Nombre]) VALUES (1002, N'Dengue')
INSERT [dbo].[Enfermedad] ([ID], [Nombre]) VALUES (1003, N'Coronavirus')
INSERT [dbo].[Enfermedad] ([ID], [Nombre]) VALUES (1004, N'Prueba')
SET IDENTITY_INSERT [dbo].[Enfermedad] OFF
GO
INSERT [dbo].[Enfermedad_Habitos] ([ID], [ID_Habito]) VALUES (5, 3)
INSERT [dbo].[Enfermedad_Habitos] ([ID], [ID_Habito]) VALUES (1002, 3)
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
SET IDENTITY_INSERT [dbo].[Medicion] OFF
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
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (100, N'Paciente')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (101, N'Servicio')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (102, N'Medico')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (103, N'Familiar')
INSERT [dbo].[Permiso] ([ID], [Nombre]) VALUES (104, N'Administrador')
GO
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (100, 1)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (100, 2)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (100, 3)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (100, 4)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (101, 7)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (101, 15)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (102, 5)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (102, 6)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (102, 8)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (103, 16)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (104, 10)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (104, 11)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (104, 12)
INSERT [dbo].[Rol] ([ID_Rol], [ID_Permiso]) VALUES (104, 13)
GO
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (4, 0, 5)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (5, 0, 1003)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (6, 1, 1002)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (6, 1, 1003)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (6, 0, 1004)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (7, 1, 1002)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (7, 0, 1004)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (8, 0, 1002)
INSERT [dbo].[Sintoma] ([ID_TipoMedicion], [Maximo], [ID]) VALUES (8, 1, 1004)
GO
SET IDENTITY_INSERT [dbo].[Tipo_Habito] ON 

INSERT [dbo].[Tipo_Habito] ([ID], [Nombre], [ValorPositivo], [EfectoPositivo], [EfectoNegativo], [ValorNegativo], [Borrado]) VALUES (1, N'Realizar Deporte', 7, N'Mejor condicion fisica, salud general', N'Fatiga muscular', 7, 0)
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
INSERT [dbo].[TipoServicio] ([ID], [NombreServicio], [Descripcion], [TiempoMedio], [DVH], [Borrado]) VALUES (7, N'Limpieza', N'Limpieza del hogar', 20, NULL, 0)
INSERT [dbo].[TipoServicio] ([ID], [NombreServicio], [Descripcion], [TiempoMedio], [DVH], [Borrado]) VALUES (8, N'Lavar', N'Lavar Ropa', 60, NULL, 0)
SET IDENTITY_INSERT [dbo].[TipoServicio] OFF
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
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (15, 1)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (15, 2)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (15, 3)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (15, 4)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (17, 7)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (17, 15)
INSERT [dbo].[Usuario_Permiso] ([ID_Usuario], [ID_Permiso]) VALUES (18, 16)
GO
/****** Object:  Index [IXFK_Alarma_Usuario]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Alarma_Usuario] ON [dbo].[Alarma]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Familiar_Usuario]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Familiar_Usuario] ON [dbo].[Familiar]
(
	[ID_Familiar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Habito_Tipo_Habito]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Habito_Tipo_Habito] ON [dbo].[Habito]
(
	[ID_TipoHabito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Habito_Usuario]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Habito_Usuario] ON [dbo].[Habito]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Idioma_Usuario]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Idioma_Usuario] ON [dbo].[Idioma]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Lenguaje_Etiqueta_Etiqueta]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Lenguaje_Etiqueta_Etiqueta] ON [dbo].[Lenguaje_Etiqueta]
(
	[ID_Etiqueta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Lenguaje_Etiqueta_Lenguaje]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Lenguaje_Etiqueta_Lenguaje] ON [dbo].[Lenguaje_Etiqueta]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Medicion_TipoMedicion]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Medicion_TipoMedicion] ON [dbo].[Medicion]
(
	[ID_TipoMedicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Medicion_Usuario]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Medicion_Usuario] ON [dbo].[Medicion]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Mediciones_Alarma_Alarma]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Mediciones_Alarma_Alarma] ON [dbo].[Mediciones_Alarma]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Mediciones_Alarma_Medicion]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Mediciones_Alarma_Medicion] ON [dbo].[Mediciones_Alarma]
(
	[ID_Medicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Medico_Empleado]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Medico_Empleado] ON [dbo].[Medico]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Servicio_Empleado]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Servicio_Empleado] ON [dbo].[Servicio]
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Servicio_TipoServicio]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Servicio_TipoServicio] ON [dbo].[Servicio]
(
	[ID_TipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Servicio_Usuario]    Script Date: 09/11/2020 22:56:12 ******/
CREATE NONCLUSTERED INDEX [IXFK_Servicio_Usuario] ON [dbo].[Servicio]
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarDVV]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Enfermedad_Agregar]    Script Date: 09/11/2020 22:56:12 ******/
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
	Insert into Enfermedad(Nombre) values (@nombre)
END
GO
/****** Object:  StoredProcedure [dbo].[Enfermedad_AgregarHabito]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Enfermedad_EnumerarSintomas]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Enfermedad_ListarPorMed]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Habito_Baja]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Habito_Guardar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Habito_Modificar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarEntidad]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Medicion_Agregar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerEntidadID]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Parametro_Agregar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Parametro_Baja]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Parametro_Modificar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Permiso_Insertar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Permiso_Listar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Prueba2]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Rol_GuardarPermiso]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Rol_Insertar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Rol_Listar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Rol_ObtenerPermisos]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Servicio_Agregar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Servicio_Baja]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Servicio_Modificacion]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Sintoma_Agregar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_Agregar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_Baja]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_BorrarPermisos]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_CambiarContraseña]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_GuardarPermisos]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_Modificar]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_Obtener]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_ObtenerPermisos]    Script Date: 09/11/2020 22:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_RestaurarContraseña]    Script Date: 09/11/2020 22:56:12 ******/
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
