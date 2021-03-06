USE [master]
GO
/****** Object:  Database [CareMonitorBitacora]    Script Date: 17/12/2020 21:14:41 ******/
CREATE DATABASE [CareMonitorBitacora]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CareMonitorBitacora', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CareMonitorBitacora.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CareMonitorBitacora_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CareMonitorBitacora_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CareMonitorBitacora] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CareMonitorBitacora].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CareMonitorBitacora] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET ARITHABORT OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CareMonitorBitacora] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CareMonitorBitacora] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CareMonitorBitacora] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CareMonitorBitacora] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET RECOVERY FULL 
GO
ALTER DATABASE [CareMonitorBitacora] SET  MULTI_USER 
GO
ALTER DATABASE [CareMonitorBitacora] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CareMonitorBitacora] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CareMonitorBitacora] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CareMonitorBitacora] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CareMonitorBitacora] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CareMonitorBitacora', N'ON'
GO
ALTER DATABASE [CareMonitorBitacora] SET QUERY_STORE = OFF
GO
USE [CareMonitorBitacora]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 17/12/2020 21:14:41 ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Schema [IIS APPPOOL\DefaultAppPool]    Script Date: 17/12/2020 21:14:41 ******/
CREATE SCHEMA [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 17/12/2020 21:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[ID_Bitacora] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Accion] [varchar](200) NULL,
	[Tipo] [varchar](50) NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[ID_Bitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_Insertar]    Script Date: 17/12/2020 21:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Bitacora_Insertar] 
	-- Add the parameters for the stored procedure here
	@usu varchar(50), @fecha datetime, @acc varchar(max), @tipo varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Bitacora(Usuario, Fecha, Accion, Tipo) values (@usu, @fecha, @acc, @tipo)
END
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_Listar]    Script Date: 17/12/2020 21:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Bitacora_Listar] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Bitacora
	Order by ID_Bitacora DESC;
END
GO
USE [master]
GO
ALTER DATABASE [CareMonitorBitacora] SET  READ_WRITE 
GO
