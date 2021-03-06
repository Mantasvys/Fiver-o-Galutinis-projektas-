USE [master]
GO
/****** Object:  Database [Fiver]    Script Date: 2021-06-15 12:25:05 ******/
CREATE DATABASE [Fiver]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fiver', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Fiver.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fiver_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Fiver_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Fiver] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fiver].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fiver] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fiver] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fiver] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fiver] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fiver] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fiver] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fiver] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fiver] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fiver] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fiver] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fiver] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fiver] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fiver] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fiver] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fiver] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fiver] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fiver] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fiver] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fiver] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fiver] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fiver] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fiver] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fiver] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fiver] SET  MULTI_USER 
GO
ALTER DATABASE [Fiver] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fiver] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fiver] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fiver] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fiver] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fiver] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Fiver] SET QUERY_STORE = OFF
GO
USE [Fiver]

/****** Object:  Table [dbo].[Bought_Products]    Script Date: 2021-06-15 12:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bought_Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Product_Name] [varchar](100) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Cost] [float] NOT NULL,
 CONSTRAINT [PK_Bought_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 2021-06-15 12:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Profile_Id] [int] NOT NULL,
	[Bussiness_Email] [varchar](100) NOT NULL,
	[Phone_Number] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Profile_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2021-06-15 12:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[User_Id] [int] NULL,
	[Product_Name] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
	[Cost] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_User]    Script Date: 2021-06-15 12:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_User](
	[Product_Id] [int] NOT NULL,
	[Nickname] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Estimated_Time] [date] NOT NULL,
 CONSTRAINT [PK_Product_User] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 2021-06-15 12:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Member_Since] [date] NOT NULL,
	[Languages] [varchar](500) NOT NULL,
	[Skills] [varchar](500) NOT NULL,
	[Education] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2021-06-15 12:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nickname] [varchar](100) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Surname] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bought_Products] ON 

INSERT [dbo].[Bought_Products] ([ID], [User_Id], [Product_Name], [Description], [Cost]) VALUES (1, 1, N'TV', N'Old TV Box', 13)
INSERT [dbo].[Bought_Products] ([ID], [User_Id], [Product_Name], [Description], [Cost]) VALUES (2, 1, N'MakeUp', N'Make up kit', 15)
INSERT [dbo].[Bought_Products] ([ID], [User_Id], [Product_Name], [Description], [Cost]) VALUES (4, 2, N'Voice Acting', N'Deep void', 20)
INSERT [dbo].[Bought_Products] ([ID], [User_Id], [Product_Name], [Description], [Cost]) VALUES (5, 2, N'TV Remote', N'Panasonic TV Remote with all buttons', 10)
INSERT [dbo].[Bought_Products] ([ID], [User_Id], [Product_Name], [Description], [Cost]) VALUES (6, 1, N'TV1', N'Old TV Box', 14)
SET IDENTITY_INSERT [dbo].[Bought_Products] OFF
GO
INSERT [dbo].[Contacts] ([Profile_Id], [Bussiness_Email], [Phone_Number]) VALUES (1, N'kOBE@gmail.com', N'86958422')
INSERT [dbo].[Contacts] ([Profile_Id], [Bussiness_Email], [Phone_Number]) VALUES (2, N'naujas@gmail.com', N'85944512')
GO
INSERT [dbo].[Product] ([User_Id], [Product_Name], [Description], [Cost]) VALUES (1, N'voice', N'Voice acting', 15)
INSERT [dbo].[Product] ([User_Id], [Product_Name], [Description], [Cost]) VALUES (8, N'drawing', N'Drawing', 999)
INSERT [dbo].[Product] ([User_Id], [Product_Name], [Description], [Cost]) VALUES (12, N'drawing', N'Drawing', 999)
GO
INSERT [dbo].[Product_User] ([Product_Id], [Nickname], [Email], [Estimated_Time]) VALUES (1, N'Kiok', N'Kiok@gmail.com', CAST(N'2021-06-22' AS Date))
INSERT [dbo].[Product_User] ([Product_Id], [Nickname], [Email], [Estimated_Time]) VALUES (2, N'Makarena', N'Mak@gmail.com', CAST(N'2021-05-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([ID], [User_Id], [Rating], [Description], [Member_Since], [Languages], [Skills], [Education]) VALUES (1, 1, 5, N'Programming', CAST(N'2020-09-11' AS Date), N'English, Lithuanian', N'Programming, Word, Pc', N'VIKO')
INSERT [dbo].[Profile] ([ID], [User_Id], [Rating], [Description], [Member_Since], [Languages], [Skills], [Education]) VALUES (2, 2, 4, N'Programming, Bussiness', CAST(N'2019-08-17' AS Date), N'English, Polska, Lithuanian', N'Business', N'None')
SET IDENTITY_INSERT [dbo].[Profile] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Nickname], [Name], [Surname], [Password], [Email]) VALUES (1, N'Tautviyays', N'Tautvydas', N'Rackauskas', N'Lopas', N'Tutis@gmail.com')
INSERT [dbo].[User] ([ID], [Nickname], [Name], [Surname], [Password], [Email]) VALUES (2, N'Nantas', N'Mantas', N'Vyšniauskas', N'Makaka', N'mak@gmail.com')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
USE [master]
GO
ALTER DATABASE [Fiver] SET  READ_WRITE 
GO
