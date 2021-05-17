USE [master]
GO
/****** Object:  Database [RcsUsers]    Script Date: 5/15/2021 3:37:59 PM ******/
CREATE DATABASE [RcsUsers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RcsUsers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.RCSDBSERVER\MSSQL\DATA\RcsUsers.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RcsUsers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.RCSDBSERVER\MSSQL\DATA\RcsUsers_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RcsUsers] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [RcsUsers] SET RECOVERY FULL 
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
ALTER DATABASE [RcsUsers] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RcsUsers', N'ON'
GO
ALTER DATABASE [RcsUsers] SET QUERY_STORE = OFF
GO
USE [RcsUsers]
GO
/****** Object:  Table [dbo].[merchants]    Script Date: 5/15/2021 3:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchants](
	[merchantId] [int] NOT NULL,
	[ordId] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[info] [varchar](1000) NULL,
	[created_on] [datetime] NULL,
 CONSTRAINT [PK_merchants] PRIMARY KEY CLUSTERED 
(
	[merchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 5/15/2021 3:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[id] [uniqueidentifier] NOT NULL,
	[info] [varchar](2000) NOT NULL,
	[created_on] [datetime] NOT NULL,
 CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partners]    Script Date: 5/15/2021 3:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partners](
	[orgId] [int] NOT NULL,
	[logo] [varchar](200) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[roles] [nvarchar](max) NULL,
	[info] [nvarchar](500) NULL,
	[created_on] [datetime] NOT NULL,
 CONSTRAINT [PK_partners] PRIMARY KEY CLUSTERED 
(
	[orgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stores]    Script Date: 5/15/2021 3:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stores](
	[storeId] [int] NOT NULL,
	[merchantId] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[info] [varchar](1000) NULL,
	[created_on] [datetime] NULL,
 CONSTRAINT [PK_stores] PRIMARY KEY CLUSTERED 
(
	[storeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/15/2021 3:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[orgId] [int] NULL,
	[username] [nchar](20) NOT NULL,
	[storeId] [int] NULL,
	[role] [varchar](20) NOT NULL,
	[password] [varchar](20) NULL,
	[info] [varchar](1000) NULL,
	[created_on] [datetime] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[merchants] ([merchantId], [ordId], [name], [info], [created_on]) VALUES (100000, 100, N'tdbank', NULL, CAST(N'2021-05-15T14:50:28.430' AS DateTime))
GO
INSERT [dbo].[merchants] ([merchantId], [ordId], [name], [info], [created_on]) VALUES (102001, 102, N'Ashuley Mississauga', NULL, CAST(N'2021-05-15T14:26:42.320' AS DateTime))
GO
INSERT [dbo].[merchants] ([merchantId], [ordId], [name], [info], [created_on]) VALUES (102002, 102, N'Ashuley Toronto', NULL, CAST(N'2021-05-15T14:26:58.950' AS DateTime))
GO
INSERT [dbo].[merchants] ([merchantId], [ordId], [name], [info], [created_on]) VALUES (103001, 103, N'KLOSS FURNITURE Mississauga', NULL, CAST(N'2021-05-15T14:26:42.320' AS DateTime))
GO
INSERT [dbo].[merchants] ([merchantId], [ordId], [name], [info], [created_on]) VALUES (103002, 103, N'KLOSS FURNITURE Toronto', NULL, CAST(N'2021-05-15T14:26:58.950' AS DateTime))
GO
INSERT [dbo].[merchants] ([merchantId], [ordId], [name], [info], [created_on]) VALUES (104001, 104, N'SAMSUNG Mississauga', NULL, CAST(N'2021-05-15T14:26:42.320' AS DateTime))
GO
INSERT [dbo].[merchants] ([merchantId], [ordId], [name], [info], [created_on]) VALUES (104002, 104, N'SAMSUNG Toronto', NULL, CAST(N'2021-05-15T14:26:58.950' AS DateTime))
GO
INSERT [dbo].[messages] ([id], [info], [created_on]) VALUES (N'14758bbf-dfa3-48c9-afe8-0a196a1fc545', N'{
    "subject": "Featured Content · International data signals brighter days ahead as COVID-19 vaccinations.",
    "body": null,
    "readers": "all",
    "effectiveDays": 4
  }', CAST(N'2021-05-15T12:01:48.300' AS DateTime))
GO
INSERT [dbo].[messages] ([id], [info], [created_on]) VALUES (N'3faba83c-8f59-43f1-8dbe-7d913cbdac17', N'{
    "subject": "COVID-19: Follow public health measures during the stay-at-home order",
    "body": null,
    "readers": "all",
    "createdOn": null,
    "effectiveDays": 4
  }', CAST(N'2021-05-15T12:01:48.300' AS DateTime))
GO
INSERT [dbo].[messages] ([id], [info], [created_on]) VALUES (N'c12a179d-2b2f-40a6-b65c-ae97aa36258b', N'{
    "subject": "Reinforcing our Commitment to Stand Against Racism.",
    "body": null,
    "readers": "all",
    "createdOn": null,
    "effectiveDays": 4
  }', CAST(N'2021-05-15T12:01:48.300' AS DateTime))
GO
INSERT [dbo].[partners] ([orgId], [logo], [name], [roles], [info], [created_on]) VALUES (100, N'assets/images/td-logo-lg.jpg', N'tdbank', N' [
          {
              "name": "TDAdmin",
              "menus": [
                  {
                      "label": "home",
                      "accessType": "O"
                  },
                  {
                      "label": "help",
                      "accessType": "O"
                  },
                  {
                      "label": "merchantweb",
                      "accessType": "O"
                  },
                  {
                      "label": "brainshark",
                      "accessType": "O"
                  },
                  {
                      "label": "marketing",
                      "accessType": "O"
                  },
                  {
                      "label": "knowledge",
                      "accessType": "O"
                  },
                  {
                      "label": "reports",
                      "accessType": "O"
                  },
                  {
                      "label": "messages",
                      "accessType": "O"
                  },
                  {
                      "label": "users",
                      "accessType": "C"
                  },
                  {
                      "label": "admin",
                      "accessType": "C"
                  }
              ]
          }
      ]', N'  "status": "Active",
			 "joined": "16/05/2018",
			 "isEdit": false,', CAST(N'2021-05-15T14:48:20.267' AS DateTime))
GO
INSERT [dbo].[partners] ([orgId], [logo], [name], [roles], [info], [created_on]) VALUES (102, N'https://i.pinimg.com/564x/39/c7/db/39c7db217992e9d89bcdbcc9d7ccb700.jpg', N'ASHLEY HOMESTORE', N'[
  {
      "name": "Admin",
      "menus": [
          {
              "label": "home",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "help",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "merchantweb",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "brainshark",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "marketing",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "knowledge",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "reports",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "messages",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "users",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "admin",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "change",
              "isChecked": true,
              "accessType": "Contributor"
          }
      ]
  },
  {
      "name": "Manager",
      "menus": [
          {
              "label": "home",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "help",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "merchantweb",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "brainshark",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "marketing",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "knowledge",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "reports",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "messages",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "users",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "change",
              "isChecked": true,
              "accessType": "Contributor"
          }
      ]
  },
  {
      "name": "Operator",
      "menus": [
          {
              "label": "home",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "help",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "merchantweb",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "brainshark",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "marketing",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "knowledge",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "reports",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "messages",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "change",
              "isChecked": true,
              "accessType": "Contributor"
          }
      ]
  }
]', N'  "status": "Active",
			 "joined": "16/05/2018",
			 "isEdit": false,', CAST(N'2021-05-15T12:31:46.347' AS DateTime))
GO
INSERT [dbo].[partners] ([orgId], [logo], [name], [roles], [info], [created_on]) VALUES (103, N'https://cdn.knorrweb.com/sites/kloss/content/logo-desktop.png', N'KLOSS FURNITURE', N'[
  {
      "name": "Admin",
      "menus": [
          {
              "label": "home",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "help",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "merchantweb",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "brainshark",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "marketing",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "knowledge",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "reports",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "messages",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "users",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "admin",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "change",
              "isChecked": true,
              "accessType": "Contributor"
          }
      ]
  },
  {
      "name": "Manager",
      "menus": [
          {
              "label": "home",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "help",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "merchantweb",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "brainshark",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "marketing",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "knowledge",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "reports",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "messages",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "users",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "change",
              "isChecked": true,
              "accessType": "Contributor"
          }
      ]
  },
  {
      "name": "Operator",
      "menus": [
          {
              "label": "home",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "help",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "merchantweb",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "brainshark",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "marketing",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "knowledge",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "reports",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "messages",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "change",
              "isChecked": true,
              "accessType": "Contributor"
          }
      ]
  }
]', NULL, CAST(N'2021-05-15T12:31:46.347' AS DateTime))
GO
INSERT [dbo].[partners] ([orgId], [logo], [name], [roles], [info], [created_on]) VALUES (104, N'https://i.pinimg.com/564x/39/c7/db/39c7db217992e9d89bcdbcc9d7ccb700.jpg', N'SAMSUNG', N'[
  {
      "name": "Admin",
      "menus": [
          {
              "label": "home",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "help",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "merchantweb",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "brainshark",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "marketing",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "knowledge",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "reports",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "messages",
              "isChecked": true,
              "accessType": "Owner"
          },
          {
              "label": "users",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "admin",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "change",
              "isChecked": true,
              "accessType": "Contributor"
          }
      ]
  },
  {
      "name": "Manager",
      "menus": [
          {
              "label": "home",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "help",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "merchantweb",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "brainshark",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "marketing",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "knowledge",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "reports",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "messages",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "users",
              "isChecked": true,
              "accessType": "Contributor"
          },
          {
              "label": "change",
              "isChecked": true,
              "accessType": "Contributor"
          }
      ]
  },
  {
      "name": "Operator",
      "menus": [
          {
              "label": "home",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "help",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "merchantweb",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "brainshark",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "marketing",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "knowledge",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "reports",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "messages",
              "isChecked": true,
              "accessType": "Viewer"
          },
          {
              "label": "change",
              "isChecked": true,
              "accessType": "Contributor"
          }
      ]
  }
]', N'  "status": "Active",
			 "joined": "16/05/2018",
			 "isEdit": false,', CAST(N'2021-05-15T12:31:46.347' AS DateTime))
GO
INSERT [dbo].[stores] ([storeId], [merchantId], [name], [info], [created_on]) VALUES (100000, 100000, N'tdbank', NULL, CAST(N'2021-05-15T14:51:23.680' AS DateTime))
GO
INSERT [dbo].[stores] ([storeId], [merchantId], [name], [info], [created_on]) VALUES (102001, 102001, N'Ashley', NULL, CAST(N'2021-05-15T14:38:50.640' AS DateTime))
GO
INSERT [dbo].[stores] ([storeId], [merchantId], [name], [info], [created_on]) VALUES (102002, 102002, N'Ashley', NULL, CAST(N'2021-05-15T14:39:13.033' AS DateTime))
GO
INSERT [dbo].[stores] ([storeId], [merchantId], [name], [info], [created_on]) VALUES (103001, 103001, N'Kloss', NULL, CAST(N'2021-05-15T14:38:50.640' AS DateTime))
GO
INSERT [dbo].[stores] ([storeId], [merchantId], [name], [info], [created_on]) VALUES (103002, 103002, N'Kloss', NULL, CAST(N'2021-05-15T14:39:13.033' AS DateTime))
GO
INSERT [dbo].[stores] ([storeId], [merchantId], [name], [info], [created_on]) VALUES (104001, 104001, N'Samsung', NULL, CAST(N'2021-05-15T14:38:50.640' AS DateTime))
GO
INSERT [dbo].[stores] ([storeId], [merchantId], [name], [info], [created_on]) VALUES (104002, 104002, N'Samsung', NULL, CAST(N'2021-05-15T14:39:13.033' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (102, N'aadmin              ', 102001, N'admin', N'1', NULL, CAST(N'2021-05-15T15:01:05.880' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (102, N'amgr                ', 102001, N'manager', N'1', NULL, CAST(N'2021-05-15T15:01:42.447' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (102, N'aop                 ', 102001, N'operator', N'1', NULL, CAST(N'2021-05-15T15:02:32.140' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (103, N'kadmin              ', 103001, N'admin', N'1', NULL, CAST(N'2021-05-15T15:02:50.273' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (103, N'kmgr                ', 103001, N'manager', N'1', NULL, CAST(N'2021-05-15T15:03:05.437' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (103, N'kop                 ', 103001, N'operator', N'1', NULL, CAST(N'2021-05-15T15:03:21.337' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (102, N'paul                ', 102001, N'admin', N'1', NULL, CAST(N'2021-05-15T14:53:07.330' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (104, N'sadmin              ', 104001, N'admin', N'1', NULL, CAST(N'2021-05-15T15:03:38.063' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (100, N'scott               ', 100000, N'admin', N'1', NULL, CAST(N'2021-05-15T14:52:27.060' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (104, N'smgr                ', 104001, N'manager', N'1', NULL, CAST(N'2021-05-15T15:03:56.860' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (104, N'sop                 ', 104001, N'operator', N'1', NULL, CAST(N'2021-05-15T15:04:13.107' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (104, N'sudha               ', 104001, N'admin', N'1', NULL, CAST(N'2021-05-15T14:53:51.723' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (100, N'tdadmin             ', 100000, N'admin', N'1', NULL, CAST(N'2021-05-15T14:59:58.603' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (100, N'tdmgr               ', 100000, N'manager', N'1', NULL, CAST(N'2021-05-15T15:00:17.593' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (100, N'tdop                ', 100000, N'operator', N'1', NULL, CAST(N'2021-05-15T15:00:41.657' AS DateTime))
GO
INSERT [dbo].[users] ([orgId], [username], [storeId], [role], [password], [info], [created_on]) VALUES (103, N'yamini              ', 103001, N'admin', N'1', NULL, CAST(N'2021-05-15T14:53:29.093' AS DateTime))
GO
ALTER TABLE [dbo].[merchants] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[messages] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[partners] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[stores] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[merchants]  WITH CHECK ADD  CONSTRAINT [FK_merchants_partners] FOREIGN KEY([ordId])
REFERENCES [dbo].[partners] ([orgId])
GO
ALTER TABLE [dbo].[merchants] CHECK CONSTRAINT [FK_merchants_partners]
GO
ALTER TABLE [dbo].[stores]  WITH CHECK ADD  CONSTRAINT [FK_stores_merchants] FOREIGN KEY([merchantId])
REFERENCES [dbo].[merchants] ([merchantId])
GO
ALTER TABLE [dbo].[stores] CHECK CONSTRAINT [FK_stores_merchants]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_partners] FOREIGN KEY([orgId])
REFERENCES [dbo].[partners] ([orgId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_partners]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_stores] FOREIGN KEY([storeId])
REFERENCES [dbo].[stores] ([storeId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_stores]
GO
USE [master]
GO
ALTER DATABASE [RcsUsers] SET  READ_WRITE 
GO
