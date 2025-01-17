USE [master]
GO
/****** Object:  Database [OtelRezervasyonDB]    Script Date: 10.08.2024 01:19:07 ******/
CREATE DATABASE [OtelRezervasyonDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OtelRezervasyonDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OtelRezervasyonDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OtelRezervasyonDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OtelRezervasyonDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OtelRezervasyonDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OtelRezervasyonDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OtelRezervasyonDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OtelRezervasyonDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OtelRezervasyonDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OtelRezervasyonDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OtelRezervasyonDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OtelRezervasyonDB] SET  MULTI_USER 
GO
ALTER DATABASE [OtelRezervasyonDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OtelRezervasyonDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OtelRezervasyonDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OtelRezervasyonDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OtelRezervasyonDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OtelRezervasyonDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OtelRezervasyonDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [OtelRezervasyonDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OtelRezervasyonDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10.08.2024 01:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 10.08.2024 01:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[guests]    Script Date: 10.08.2024 01:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guests](
	[GuestId] [int] IDENTITY(1,1) NOT NULL,
	[MisafirAd] [nvarchar](max) NOT NULL,
	[MisafirSoyad] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Yetiskin] [int] NOT NULL,
	[Cocuk] [int] NOT NULL,
 CONSTRAINT [PK_guests] PRIMARY KEY CLUSTERED 
(
	[GuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservations]    Script Date: 10.08.2024 01:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CheckInDate] [datetime2](7) NOT NULL,
	[CheckOutDate] [datetime2](7) NOT NULL,
	[RoomId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NOT NULL,
	[GuestId] [int] NOT NULL,
 CONSTRAINT [PK_reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 10.08.2024 01:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[Capacity] [int] NOT NULL,
	[mKare] [int] NOT NULL,
	[PricePerNight] [decimal](18, 2) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
 CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10.08.2024 01:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240718091513_Init1', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240718104056_Init2', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240719085823_Init4', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240720205436_Init6', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240722081604_Init7', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240722082516_Init8', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240722083058_Init9', N'8.0.7')
GO
SET IDENTITY_INSERT [dbo].[guests] ON 

INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (3, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (4, N'serkan', N'balcı', N'5362545656', 2, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1002, N'asdasd', N'asdasd', N'12313213', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1003, N'asdasd', N'asdasd', N'12313213', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1004, N'asdasd', N'asdads', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1005, N'asdasd', N'asdads', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1006, N'asdads', N'asdasd', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1007, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1008, N'asdads', N'asdasd', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1009, N'asdads', N'asdasd', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1010, N'damla', N'dinç', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1011, N'damla', N'dinç', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1012, N'damla', N'dinç', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1013, N'damla', N'dinç', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1014, N'damla', N'dinç', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (1015, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2002, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2003, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2004, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2005, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2006, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2007, N'asdads', N'asdasd', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2008, N'asdads', N'asdasd', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2009, N'berkant', N'özbay', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2010, N'ömür', N'akay', N'53062545', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2011, N'ömür', N'akay', N'53062545', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2012, N'ömür', N'akay', N'53062545', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2013, N'ömür', N'akay', N'53062545', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2014, N'ömür', N'akay', N'53062545', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2015, N'furkan', N'akyol', N'530624541', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2016, N'tuncay', N'çorum', N'536343131231', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2017, N'ömür', N'akay', N'53062545', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2018, N'serkan', N'balcı', N'05362545656', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2019, N'tuncay', N'çorum', N'536343131231', 2, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2020, N'tuncay', N'çorum', N'536343131231', 2, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2021, N'tuncay', N'çorum', N'536343131231', 2, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2022, N'tuncay', N'çorum', N'536343131231', 2, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2023, N'ömür', N'akay', N'53062545', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2024, N'ömür', N'akay', N'53062545', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2025, N'ömür', N'akay', N'53062545', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2026, N'ömür', N'akay', N'53062545', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2027, N'tuncay', N'çorum', N'536343131231', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2028, N'tuncay', N'çorum', N'536343131231', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2029, N'berkant', N'özbay', N'+905306272252', 2, 0)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2030, N'alp', N'erdem', N'53625242352', 2, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2031, N'asdads', N'asdasd', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (2032, N'asdads', N'asdasd', N'+905306272252', 1, 1)
INSERT [dbo].[guests] ([GuestId], [MisafirAd], [MisafirSoyad], [Phone], [Yetiskin], [Cocuk]) VALUES (3016, N'ufuk', N'bey', N'5326264644', 1, 1)
SET IDENTITY_INSERT [dbo].[guests] OFF
GO
SET IDENTITY_INSERT [dbo].[reservations] ON 

INSERT [dbo].[reservations] ([Id], [CheckInDate], [CheckOutDate], [RoomId], [UserId], [Aciklama], [GuestId]) VALUES (2019, CAST(N'2024-08-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-11T00:00:00.0000000' AS DateTime2), 2, 2006, N'qwwwww', 2018)
INSERT [dbo].[reservations] ([Id], [CheckInDate], [CheckOutDate], [RoomId], [UserId], [Aciklama], [GuestId]) VALUES (2029, CAST(N'2024-08-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-11T00:00:00.0000000' AS DateTime2), 2, 2006, N'hhhhhhhhh', 2028)
INSERT [dbo].[reservations] ([Id], [CheckInDate], [CheckOutDate], [RoomId], [UserId], [Aciklama], [GuestId]) VALUES (2030, CAST(N'2024-08-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-11T00:00:00.0000000' AS DateTime2), 2, 2008, N'2 kişiyiz', 2029)
INSERT [dbo].[reservations] ([Id], [CheckInDate], [CheckOutDate], [RoomId], [UserId], [Aciklama], [GuestId]) VALUES (2031, CAST(N'2024-08-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-14T00:00:00.0000000' AS DateTime2), 3, 2008, N'asdadadas', 2030)
INSERT [dbo].[reservations] ([Id], [CheckInDate], [CheckOutDate], [RoomId], [UserId], [Aciklama], [GuestId]) VALUES (2032, CAST(N'2024-08-17T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-18T00:00:00.0000000' AS DateTime2), 2, 2008, N'asdadadas', 2031)
INSERT [dbo].[reservations] ([Id], [CheckInDate], [CheckOutDate], [RoomId], [UserId], [Aciklama], [GuestId]) VALUES (2033, CAST(N'2024-08-19T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-20T00:00:00.0000000' AS DateTime2), 2, 2008, N'sdasdads', 2032)
INSERT [dbo].[reservations] ([Id], [CheckInDate], [CheckOutDate], [RoomId], [UserId], [Aciklama], [GuestId]) VALUES (3017, CAST(N'2024-08-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-28T00:00:00.0000000' AS DateTime2), 2, 2008, N'asdadadas', 3016)
SET IDENTITY_INSERT [dbo].[reservations] OFF
GO
SET IDENTITY_INSERT [dbo].[rooms] ON 

INSERT [dbo].[rooms] ([RoomId], [Capacity], [mKare], [PricePerNight], [IsAvailable]) VALUES (1, 1, 30, CAST(800.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[rooms] ([RoomId], [Capacity], [mKare], [PricePerNight], [IsAvailable]) VALUES (2, 2, 50, CAST(1500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[rooms] ([RoomId], [Capacity], [mKare], [PricePerNight], [IsAvailable]) VALUES (3, 3, 40, CAST(2000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[rooms] ([RoomId], [Capacity], [mKare], [PricePerNight], [IsAvailable]) VALUES (4, 2, 30, CAST(3500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[rooms] ([RoomId], [Capacity], [mKare], [PricePerNight], [IsAvailable]) VALUES (1002, 4, 60, CAST(3000.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[rooms] ([RoomId], [Capacity], [mKare], [PricePerNight], [IsAvailable]) VALUES (1003, 5, 80, CAST(4500.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[rooms] ([RoomId], [Capacity], [mKare], [PricePerNight], [IsAvailable]) VALUES (1004, 4, 35, CAST(2000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[rooms] ([RoomId], [Capacity], [mKare], [PricePerNight], [IsAvailable]) VALUES (1005, 4, 35, CAST(2000.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([UserId], [FullName], [Email], [Password], [Phone]) VALUES (2006, N'Admin', N'admin@hotmail.com', N'123456', N'000')
INSERT [dbo].[users] ([UserId], [FullName], [Email], [Password], [Phone]) VALUES (2007, N'ahmet uzun', N'ahmet@hotmail.com', N'123456789', N'5306254856')
INSERT [dbo].[users] ([UserId], [FullName], [Email], [Password], [Phone]) VALUES (2008, N'berkant özbay', N'berkant@hotmail.com', N'123456', N'5306272233')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
/****** Object:  Index [IX_reservations_GuestId]    Script Date: 10.08.2024 01:19:08 ******/
CREATE NONCLUSTERED INDEX [IX_reservations_GuestId] ON [dbo].[reservations]
(
	[GuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_reservations_RoomId]    Script Date: 10.08.2024 01:19:08 ******/
CREATE NONCLUSTERED INDEX [IX_reservations_RoomId] ON [dbo].[reservations]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_reservations_UserId]    Script Date: 10.08.2024 01:19:08 ******/
CREATE NONCLUSTERED INDEX [IX_reservations_UserId] ON [dbo].[reservations]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[reservations] ADD  DEFAULT (N'') FOR [Aciklama]
GO
ALTER TABLE [dbo].[reservations] ADD  DEFAULT ((0)) FOR [GuestId]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (N'') FOR [Phone]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_guests_GuestId] FOREIGN KEY([GuestId])
REFERENCES [dbo].[guests] ([GuestId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_guests_GuestId]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[rooms] ([RoomId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_rooms_RoomId]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_users_UserId]
GO
USE [master]
GO
ALTER DATABASE [OtelRezervasyonDB] SET  READ_WRITE 
GO
