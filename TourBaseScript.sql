USE [master]
GO
/****** Object:  Database [TourBase]    Script Date: 01.06.2023 9:59:58 ******/
CREATE DATABASE [TourBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TourBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\TourBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TourBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\TourBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TourBase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TourBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TourBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TourBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TourBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TourBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TourBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TourBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TourBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TourBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TourBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TourBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TourBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TourBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TourBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TourBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TourBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TourBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TourBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TourBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TourBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TourBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TourBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TourBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TourBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TourBase] SET  MULTI_USER 
GO
ALTER DATABASE [TourBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TourBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TourBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TourBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TourBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TourBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TourBase] SET QUERY_STORE = ON
GO
ALTER DATABASE [TourBase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TourBase]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 01.06.2023 9:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 01.06.2023 9:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 01.06.2023 9:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 01.06.2023 9:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[HotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC,
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HottelComment]    Script Date: 01.06.2023 9:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HottelComment](
	[Id] [int] NOT NULL,
	[HottelId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HottelComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 01.06.2023 9:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[Id] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TupeOfTour]    Script Date: 01.06.2023 9:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TupeOfTour](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TupeOfTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 01.06.2023 9:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (1, N'Тип1', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (2, N'Тип2', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (3, N'Тип3', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (4, N'Тип4', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (5, N'', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[HottelComment]  WITH CHECK ADD  CONSTRAINT [FK_HottelComment_Hotel] FOREIGN KEY([HottelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HottelComment] CHECK CONSTRAINT [FK_HottelComment_Hotel]
GO
ALTER TABLE [dbo].[TupeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TupeOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[TupeOfTour] CHECK CONSTRAINT [FK_TupeOfTour_Tour]
GO
ALTER TABLE [dbo].[TupeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TupeOfTour_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[TupeOfTour] CHECK CONSTRAINT [FK_TupeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [TourBase] SET  READ_WRITE 
GO
