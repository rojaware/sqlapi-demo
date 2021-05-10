USE [master]
GO

/****** Object:  Database [RcsUsers]    Script Date: 2021-05-09 11:22:05 PM ******/
CREATE DATABASE [RcsUsers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RcsUsers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RcsUsers.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RcsUsers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RcsUsers_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RcsUsers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RcsUsers] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [RcsUsers] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [RcsUsers] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [RcsUsers] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [RcsUsers] SET ARITHABORT OFF 
GO

ALTER DATABASE [RcsUsers] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [RcsUsers] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [RcsUsers] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [RcsUsers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [RcsUsers] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [RcsUsers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [RcsUsers] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [RcsUsers] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [RcsUsers] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [RcsUsers] SET  DISABLE_BROKER 
GO

ALTER DATABASE [RcsUsers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [RcsUsers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [RcsUsers] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [RcsUsers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [RcsUsers] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [RcsUsers] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [RcsUsers] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [RcsUsers] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [RcsUsers] SET  MULTI_USER 
GO

ALTER DATABASE [RcsUsers] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [RcsUsers] SET DB_CHAINING OFF 
GO

ALTER DATABASE [RcsUsers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [RcsUsers] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [RcsUsers] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [RcsUsers] SET QUERY_STORE = OFF
GO

ALTER DATABASE [RcsUsers] SET  READ_WRITE 
GO

