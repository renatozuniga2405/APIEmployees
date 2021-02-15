

/****** Object:  Database [API_practica]    Script Date: 14/02/2021 20:07:13 ******/
CREATE DATABASE [API_practica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'API_practica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\API_practica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'API_practica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\API_practica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [API_practica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [API_practica] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [API_practica] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [API_practica] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [API_practica] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [API_practica] SET ARITHABORT OFF 
GO

ALTER DATABASE [API_practica] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [API_practica] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [API_practica] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [API_practica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [API_practica] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [API_practica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [API_practica] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [API_practica] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [API_practica] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [API_practica] SET  ENABLE_BROKER 
GO

ALTER DATABASE [API_practica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [API_practica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [API_practica] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [API_practica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [API_practica] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [API_practica] SET READ_COMMITTED_SNAPSHOT ON 
GO

ALTER DATABASE [API_practica] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [API_practica] SET RECOVERY FULL 
GO

ALTER DATABASE [API_practica] SET  MULTI_USER 
GO

ALTER DATABASE [API_practica] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [API_practica] SET DB_CHAINING OFF 
GO

ALTER DATABASE [API_practica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [API_practica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [API_practica] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [API_practica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [API_practica] SET QUERY_STORE = OFF
GO

ALTER DATABASE [API_practica] SET  READ_WRITE 
GO


USE [API_practica]
GO


CREATE TABLE [dbo].[empleados](
	[id] [int] NULL,
	[employee_name] [nvarchar](100) NULL,
	[employee_salary] [decimal](10, 2) NULL,
	[employee_age] [int] NULL,
	[profile_image] [nvarchar](50) NULL
) ON [PRIMARY]
GO



INSERT INTO [dbo].[empleados]
           ([id]
           ,[employee_name]
           ,[employee_salary]
           ,[employee_age]
           ,[profile_image])
     VALUES
           (1
           ,'Tiger Nixon'
           ,320800.00
           ,61
           ,'')
GO

create PROCEDURE [dbo].[sp_upd_empleado]
@id int, @emp_name nvarchar(100), @emp_salary decimal(10,2), @emp_age int=0, @emp_profileimg nvarchar(50)
AS
BEGIN
	
	UPDATE [dbo].[empleados]
    SET
           [employee_name] = @emp_name
           ,[employee_salary] = @emp_salary
           ,[employee_age] = @emp_age
           ,[profile_image] = @emp_profileimg
     WHERE [id] = @id
           

END
