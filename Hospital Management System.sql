USE [master]
GO
/****** Object:  Database [Hospital Management System]    Script Date: 6/12/2020 5:05:41 AM ******/
CREATE DATABASE [Hospital Management System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital Management System', FILENAME = N'D:\courses\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hospital Management System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital Management System_log', FILENAME = N'D:\courses\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hospital Management System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hospital Management System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital Management System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital Management System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital Management System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital Management System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital Management System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital Management System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital Management System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital Management System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital Management System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital Management System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital Management System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital Management System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital Management System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital Management System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital Management System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital Management System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital Management System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital Management System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital Management System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital Management System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital Management System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital Management System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital Management System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital Management System] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital Management System] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital Management System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital Management System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital Management System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital Management System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital Management System] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hospital Management System', N'ON'
GO
ALTER DATABASE [Hospital Management System] SET QUERY_STORE = OFF
GO
USE [Hospital Management System]
GO
/****** Object:  Table [dbo].[Bill 1]    Script Date: 6/12/2020 5:05:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill 1](
	[B_bill number] [nvarchar](50) NOT NULL,
	[B_room charges] [nvarchar](50) NOT NULL,
	[B_doctor charges] [nvarchar](50) NOT NULL,
	[p_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor 1]    Script Date: 6/12/2020 5:05:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor 1](
	[d_id] [int] NOT NULL,
	[d_name] [nvarchar](50) NOT NULL,
	[d_address] [nvarchar](50) NOT NULL,
	[d_gender] [nvarchar](50) NOT NULL,
	[d_phone number] [nvarchar](50) NOT NULL,
	[d_department] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Doctor 1] PRIMARY KEY CLUSTERED 
(
	[d_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient 1]    Script Date: 6/12/2020 5:05:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient 1](
	[p_id] [int] NOT NULL,
	[p_name] [nvarchar](50) NOT NULL,
	[p_age] [int] NOT NULL,
	[p_address] [nvarchar](50) NOT NULL,
	[p_gender] [nvarchar](50) NOT NULL,
	[p_phone number] [nvarchar](50) NOT NULL,
	[d_id] [int] NOT NULL,
 CONSTRAINT [PK_patient 1] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room 1]    Script Date: 6/12/2020 5:05:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room 1](
	[r_id] [int] NOT NULL,
	[r_tybe] [nvarchar](50) NOT NULL,
	[p_id] [int] NOT NULL,
 CONSTRAINT [PK_room 1] PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill 1]  WITH CHECK ADD  CONSTRAINT [FK_Bill 1_patient 1] FOREIGN KEY([p_id])
REFERENCES [dbo].[patient 1] ([p_id])
GO
ALTER TABLE [dbo].[Bill 1] CHECK CONSTRAINT [FK_Bill 1_patient 1]
GO
ALTER TABLE [dbo].[patient 1]  WITH CHECK ADD  CONSTRAINT [FK_patient 1_Doctor 1] FOREIGN KEY([d_id])
REFERENCES [dbo].[Doctor 1] ([d_id])
GO
ALTER TABLE [dbo].[patient 1] CHECK CONSTRAINT [FK_patient 1_Doctor 1]
GO
ALTER TABLE [dbo].[room 1]  WITH CHECK ADD  CONSTRAINT [FK_room 1_patient 1] FOREIGN KEY([p_id])
REFERENCES [dbo].[patient 1] ([p_id])
GO
ALTER TABLE [dbo].[room 1] CHECK CONSTRAINT [FK_room 1_patient 1]
GO
USE [master]
GO
ALTER DATABASE [Hospital Management System] SET  READ_WRITE 
GO
