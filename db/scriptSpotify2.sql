USE [master]
GO
/****** Object:  Database [spotify]    Script Date: 28/09/2021 12:27:14 ******/
CREATE DATABASE [spotify]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'spotify', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\spotify.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'spotify_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\spotify_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [spotify] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [spotify].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [spotify] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [spotify] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [spotify] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [spotify] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [spotify] SET ARITHABORT OFF 
GO
ALTER DATABASE [spotify] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [spotify] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [spotify] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [spotify] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [spotify] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [spotify] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [spotify] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [spotify] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [spotify] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [spotify] SET  DISABLE_BROKER 
GO
ALTER DATABASE [spotify] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [spotify] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [spotify] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [spotify] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [spotify] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [spotify] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [spotify] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [spotify] SET RECOVERY FULL 
GO
ALTER DATABASE [spotify] SET  MULTI_USER 
GO
ALTER DATABASE [spotify] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [spotify] SET DB_CHAINING OFF 
GO
ALTER DATABASE [spotify] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [spotify] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [spotify] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [spotify] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'spotify', N'ON'
GO
ALTER DATABASE [spotify] SET QUERY_STORE = OFF
GO
ALTER AUTHORIZATION ON DATABASE::[spotify] TO [sa]
GO
USE [spotify]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 28/09/2021 12:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[SpotifyAlbumString] [nvarchar](320) NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Album] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 28/09/2021 12:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[SpotifyArtistString] [nvarchar](320) NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Artist] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ArtistSong]    Script Date: 28/09/2021 12:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistSong](
	[ArtistId] [bigint] NULL,
	[SongId] [bigint] NULL
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[ArtistSong] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 28/09/2021 12:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[PlaylistId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[SpotifyPlString] [nvarchar](320) NULL,
 CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Playlist] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[PlaylistSong]    Script Date: 28/09/2021 12:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistSong](
	[PlaylistSongId] [bigint] IDENTITY(1,1) NOT NULL,
	[Position] [bigint] NULL,
	[Date] [datetime2](7) NULL,
	[PlaylistId] [bigint] NOT NULL,
	[SongId] [bigint] NOT NULL,
 CONSTRAINT [PK_PlaylistSong] PRIMARY KEY CLUSTERED 
(
	[PlaylistSongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[PlaylistSong] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Song]    Script Date: 28/09/2021 12:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[SongId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[SpotifySongString] [nvarchar](320) NULL,
	[AlbumId] [bigint] NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[SongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Song] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Userapp]    Script Date: 28/09/2021 12:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Userapp](
	[UserappId] [bigint] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](300) NULL,
	[Password] [nvarchar](300) NULL,
	[Role] [nvarchar](300) NULL,
 CONSTRAINT [PK_Userapp] PRIMARY KEY CLUSTERED 
(
	[UserappId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Userapp] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10002, N'Narkotyki są nielegalne', N'2KgIZKlpVDIuP80fnRNWEQ')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10003, N'E-GIRLS ARE RUINING MY LIFE!', N'1wrJvDOGOMQKn2v0iRiSJT')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10004, N'Sigurds Bjørnetime 2', N'76GtNtO2oxXYQodfzoE6d7')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10005, N'Whoopty', N'5oBYG6dEI2Er6EeLnmonGE')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10006, N'Tylko Jedno W Głowie Mam', N'6wIj4KFMqQE2FvY5fuVVbx')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10007, N'Adderall (Corvette Corvette)', N'6zUd16jYIP9n45kUE3L5J3')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10008, N'Die Very Rough', N'4msRIZnQRcXPRHkhROqM0k')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10009, N'Nu Wij Niet Meer Praten', N'3PbHh4WEBxiXZj3eXoiRP2')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10010, N'Patlamaya Devam', N'7ndjN1E8J7089oquwNLugJ')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10011, N'Deep End', N'2HICqd0ltMKNrkhfmWSuKy')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10012, N'POKA', N'3L9mTHHUpxXvSDDR3L7nEB')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10013, N'A92 x Fumez The Engineer - Plugged In Freestyle', N'2d2jGNehp3V4MKWusgvMbk')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10014, N'Drip Like ME', N'7eeWe8yTFfY5rDkYAc9IQu')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10015, N'Public Void', N'0G2RxSCixG5Nl6jpjwiw2g')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10016, N'Stop Stealing The Covers!', N'7mCxkaPLj0IGKmbBuLDYah')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10017, N'Party With A Jagaban', N'6xAMrpY1W8Krvq6jOvuFJM')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10018, N'Back from the Edge', N'7oiJYvEJHsmYtrgviAVIBD')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10019, N'Love you', N'4Gd8NfRAr0rTyfoN2Uyodn')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10020, N'Papi Chulo', N'33FmsnS00we0hrD1NrGniq')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10021, N'Following The Sun', N'2ZcEETOWlcn0tLqHpnDTXZ')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10022, N'moment', N'4X2vOIggOwcX7BFIH0xqng')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10023, N'You’re Mines Still (feat. Drake)', N'7MQJy9di8JoLJOkG5mZAry')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10024, N'Levon James', N'1ZRAeQ6zsPJ5W1K3DvpRpP')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10025, N'Cat Girls Are Ruining My Life!', N'13vJf0S7wWfz9NC9nBhWqW')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10026, N'Cold As Ice', N'7Kh8xIe0oqPe2j6bwNCTxN')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10027, N'Lonely (with benny blanco)', N'3P5WIUJO0Ots1lQx09TOxk')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10028, N'Wesh gros', N'0uj5U4HxVmY2B7YeAfPQ8V')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10029, N'Huyu Suyu', N'59X5b8naRHRkj3jjCpM45O')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10030, N'B4 The Storm', N'2vGU0DOcfsDee0euvhl1iZ')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10031, N'アニメ『ヤリチン☆ビッチ部』主題歌「Touch You」', N'2rQlPhe76mnmviBmjHdS89')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10032, N'Atterrissage', N'7JOb07lFRC4z6NsrWd4D82')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10033, N'O My Heart', N'0X7S0TEZ5NJsSxmyTnfYi2')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10034, N'Bayside', N'2orFMHnB5g4sx6uQCZaEjC')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10035, N'Mood (feat. iann dior)', N'4YMnOf4a7obOcN1Gy2QEuM')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10036, N'Miss YOU!', N'1N4sOPjYya80HsT6idMO0f')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10037, N'NCT RESONANCE Pt. 1 - The 2nd Album', N'6kudlOyCqSQfsBVSdPZEu4')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10038, N'Pull Up', N'0hB1SMe4ztzlBQmKHvF8cD')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10039, N'Fix Me Up', N'1BBtONNMFpOzl52zrFK2SD')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10040, N'Denk Maar Niet Aan Morgen', N'5hEdWtFos3Q3Ql3fdRy9TX')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10041, N'[12:00]', N'3obToaukLcPbCLPPmWFzQi')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10042, N'Assassin''s Creed Valhalla: The Ravens Saga (Original Soundtrack)', N'5gxCjYgosIC6xWfQd9Px7K')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10043, N'White Tee', N'5gJEkk1zcfeQYHv1hOVhrm')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10044, N'Billy Nomates', N'7duCIMjQ9LE5UjybZ0ZqoI')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10045, N'Canceled', N'1r6mQtOY7miSYNNJOJ809V')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10046, N'Allah’ından Bul', N'7kvSA869nORwy8uzrHxUko')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10047, N'Welcome to O''Block', N'7gGJ9rNtigRF53dsFo48Wp')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10048, N'Clash Tibo Inshape', N'3IGZgl6JujrmSPBucNr4kc')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10049, N'Shoot For The Stars Aim For The Moon', N'7e7t0MCrNDcJZsPwUKjmOc')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10050, N'Этажи', N'1vPytXXwF0VXnof89Z91Pm')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10051, N'When I ruled the world X Let Me See Your Hips Swing', N'7iJSviJO7vPgFNIYL0WNT6')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10052, N'Dancing in My Room', N'3t1MvGhT6LU3fOIp3KMrta')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10053, N'Chipolata', N'0GgwaO0m33PA2lCU6Xl3aY')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10054, N'Studio Killers', N'5eaoWhBweqqjErHzhebjgL')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10055, N'Fuck Up the Friendship', N'6OYKLdkagNi7b1cANWVAMg')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10056, N'Montgomery Ricky', N'3EENSiRh7KUBYPSufAU84x')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10057, N'Scooter', N'10IlTa0VOPyS4ttZK53QaN')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10058, N'Trap Anthem', N'7uZfP59XSrWmVRNALF2n2y')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10059, N'Sélection naturelle', N'0Zd4iOhPKcEDcmXRIUDiJx')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10060, N'Eyes wide open', N'77irgFZWRDU0jkUCYvLiua')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10061, N'Heal Me', N'4PFH5f3PxwuweuCE8gofIF')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10062, N'Positions', N'3euz4vS7ezKGnNSwgyvKcd')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10063, N'F*CK LOVE (SAVAGE)', N'3YjfdLdpQcVI72uKhooZst')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10064, N'Wow Wow Wow', N'6AGOllKhjcFbirXGqVAZxN')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10065, N'Reveries', N'7Jl54jIBzvZjzED55yLj23')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10066, N'Under Pressure (Original Mix)', N'5jlYwho9vlUdsoQmbnpoDF')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10067, N'The Business', N'2adSO4KU3FDjeM1PXCRDZm')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10068, N'Put Your Records On', N'6K7559pAYrNCJwsv1uIIK7')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10069, N'Slide', N'28ouhFhVEg2FWsxuiprIyC')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10070, N'Marea (We’ve Lost Dancing)', N'3AAwKutHRWyftJ2GrFdPX9')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10071, N'Friday (feat. Mufasa & Hypeman) [Dopamine Re-Edit]', N'39qsmsNRXjVaFqTZj9af0j')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10072, N'Wellerman (Sea Shanty / 220 KID x Billen Ted Remix)', N'1zEBi4O4AaY5M55dUcUp3z')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10073, N'Lockdown Lul (Extended 80''s Versie)', N'4fEZjSYNrJKPs5sx2zLj3O')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10074, N'Stand Up (From Harriet)', N'2csFa6zpizG4hDUqQgj95C')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10075, N'Latest Trends', N'0vkahJN8SNXT05PgGc46nu')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10076, N'Iko Iko', N'4XPwYCtmyrjrA83g0ClH9H')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10077, N'TAKE TIME', N'1zHR48K6XtWYm6bhrw4J6C')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10078, N'1 Op Een Miljoen', N'7vhYasDgXpdyjwVaFvt95z')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10079, N'Astronaut In The Ocean', N'57UjGWNfxfsBCykDm73XBK')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10080, N'Dingue de toi', N'1XEs1PvVOhjv6xJRg8x90a')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10081, N'Wellerman (Sea Shanty)', N'1AK6peN1DwvYRXN19cqWoP')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10082, N'Sin Miedo (del Amor y Otros Demonios) ∞', N'00wSTrFxoSzA7eeS1UxHgd')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10083, N'SugarCrash!', N'064pDjy5L2sQn0XLJj2wWx')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10084, N'Lekker Setje Beats', N'2N4wFWz7M75F0CAHFS0sCj')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10085, N'Моя голова винтом (My head is spinning like a screw)', N'3MLrnG2xgu1CIONcpoFHfO')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10086, N'Bushi', N'0AhbjvgpEzNOnpFR8YcqBO')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10087, N'The Papercut Chronicles', N'4Ug3M4a8wAEebndVIF65fX')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10088, N'Drive Forever (Remix)', N'70EN3Bvmpiqje9AOcpageS')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10089, N'Wild West', N'0aAVMtHuK9wX1mQozWvdSZ')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10090, N'En Route (Uit Liefde Voor Muziek)', N'7tsbYQeZUlM0IbLKsYHWMQ')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10091, N'Dépendance', N'5c5DmUs9A8AWCafTtZ6b6y')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10092, N'Track Star', N'7yvSdViuYJjZwXWtSwYu3D')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10093, N'Calling My Phone', N'1QhKOq11hGEoNA42rV2IHp')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10094, N'Tokyo', N'00vH1F6IQIDDDOeodKDD2k')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10095, N'Faded Love', N'5DwA2j6RPl3a9CEHROkUK5')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10096, N'JVLIVS II', N'7eKvzMoLTENJaukj2pHrw7')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10097, N'Shiesty Season', N'2UwJ4Nt10VStLczYefhcEV')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10098, N'TPL x Fumez The Engineer - Plugged In Freestyle', N'0qD48aseZrFjSw4E5x3Lbf')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10099, N'Evering Road (Deluxe)', N'19ftohYqQetn7BoGQXXlSd')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10100, N'We Begrijpen Mekaar (Uit Liefde Voor Muziek) [Live]', N'2gOhnVp39T9oxho2u3U5sY')
GO
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10101, N'Welcome To Brixton', N'2cJGDIj1sw0CRisyitZqdQ')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10102, N'Cover Me In Sunshine', N'7p0HJKqXo2WpApHFp1iDcI')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10103, N'Honeymoon', N'6QZyKchQivUBTSMcoBmlPa')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10104, N'Sequoia Trees', N'7x8iGLR0soG9LVyGQo63jz')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10105, N'Sometimes (Backwood)', N'3ERQUpVWleQpvEueo3KFgj')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10106, N'L*l In De Lockdown', N'0bYUcI3SWF2ZI4HsQHtQLn')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10107, N'Sale môme', N'2DvQpNlXOxscugs367CijU')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10108, N'Only the Generals Gon Understand', N'7udQ5hoKMjgCJT75oxPmgn')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10109, N'Your Love (9PM)', N'7F9yYqHRtIZnEGF2tANI4b')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10110, N'ROLLIN N CONTROLLIN FREESTYLE', N'752RRPgpiIBjptbb1BqoRI')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10111, N'la di die (feat. jxdn)', N'1KBoH5xsMCXPuVsZMORvtO')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10112, N'Angelic 7', N'0VqPgJ14lyu0JlERRgqgUw')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10113, N'Beginning Middle End (From The Netflix Film "To All The Boys: Always and Forever")', N'4swfwUj2JmvWtXll9wtsjn')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10114, N'Tuk Tuk (feat. ÄTNA)', N'6vAG3Q0XWsrCXvwmxX8GiC')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10115, N'No More Parties (Remix)', N'4H8JPgTkCXVgVr8e2J5tKX')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10116, N'Le Tigre', N'0dSSZGzoukzrFBnG07J45i')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10117, N'Stapelgek', N'0m7P98OZ4l0YTVm0V0S51L')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10118, N'Wellerman', N'0YpFe46hrCyXS0jsmDClOa')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10119, N'Actual Life (April 14 - December 17 2020)', N'6o86bV7TAt5x4exc2qLDqC')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10120, N'Somebody To Love', N'4w9VVee11vl7YA0JeUatU1')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10121, N'Iko Iko', N'0IVeq4oFSUAAXmdQqXFTrU')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10122, N'All My Demons Greeting Me As A Friend (Deluxe)', N'6YMSXPIHkA2jPIlFHuejXW')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10123, N'Rasputin', N'6PzYuR9c0CYCPJTnqylPhd')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10124, N'Vuurwerk', N'4YbZBB4HuIetaPBvadyys0')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10125, N'Parado no Bailão', N'4OZ9djo9HM9hIQtjY2NBLa')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10126, N'MONTERO (Call Me By Your Name)', N'2Hjcfw8zHN4dJDZJGOzLd6')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10127, N'Body', N'02ZsXShyE1HUqQceWLONcJ')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10128, N'DRILL FR', N'31H0KWvM2hCC3p8jkctCWN')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10129, N'Break it off', N'2qT1ltrbTlrUi5F7uMFPHz')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10130, N'Flying', N'1gH1fXGLT3cTgVJPLoiPxY')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10131, N'Motive X Promiscuous', N'7D21zZJo1DUaTOvUY4QBXF')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10132, N'Bipolar', N'7bbDmub6x679LEFy8eZj5w')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10133, N'Good Without', N'1TushXSMlKucNp0KziSAU4')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10134, N'Tonight (feat. D-Block Europe & OBOY)', N'7aLkdrymBzJRMaXZhCd9px')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10135, N'We play', N'4kU6DFVgZKoDYQPZk1OZp9')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10136, N'Trepidation', N'1M7Nh8lF4Xg3bIcwVAKitI')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10137, N'Astronaut In The Ocean', N'3OilDLxf5rFVhaQmez7ent')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10138, N'Lars', N'43TZEM7ygBER2J582OdGWX')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10139, N'Laisser faire', N'5m6Kx9tCaC1ckzrxjWX9ok')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10140, N'Sicko Drop', N'19WhhSvX9yW51l5R2yrJmS')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10141, N'Leave The Door Open', N'7dfPqXck6BB9wpThrVYBss')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10142, N'Shadow (Remixes)', N'0UN2MKtYHmSYDOXTgWls4q')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10143, N'Vroum Vroum', N'0cPGWnwGhDm4SAV8h2Ot6l')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10144, N'Hy Brasil', N'3qzXinrMHSBhrsKBcwnLLR')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10145, N'Keep Moving', N'2RfWbfIULVPJq4Ng554eyX')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10146, N'Los Legendarios 001', N'7g5WqPI4CdA22Cy8LxRXCf')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10147, N'I Mortali²', N'1eXLJLcFqCLlrdSoQU8Ilf')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10148, N'Justice', N'5dGWwsZ9iB2Xc3UKR0gif2')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10149, N'Follow You / Cutthroat', N'1nz0PWfAcTQVbFtpU6u1UY')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10150, N'Jalebi Baby', N'2k8nShpibT4psqEQV7Smqc')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10151, N'Hope', N'6nNZY2RbAG3GFckpDPzztY')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10152, N'NEPTUNE TERMINUS', N'3Y8U9hoaYR9P5IF9D9ZmiM')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10153, N'OSO', N'7mEKV0RUe7odIcWOO7ZyTT')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10154, N'Goud', N'4BqgPdobyinht8gNWxcVE2')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10155, N'Pump the Brakes', N'6LF0iT7seN01JDE1LjBJm5')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10156, N'TIME', N'3KowWhELY5SXlDJ14PElvb')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10157, N'Les mains faites pour l''or', N'3mLAiqAlaOd5KaVOLJLtYM')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10158, N'Dimension (feat. Skepta & Rema)', N'0Zp33hB1LZhbpMQCNfzeVF')
INSERT [dbo].[Album] ([AlbumId], [Name], [SpotifyAlbumString]) VALUES (10159, N'Love Tonight', N'5KXv2MHeoLSqZ96jRuFF9H')
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
SET IDENTITY_INSERT [dbo].[Artist] ON 

INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10002, N'Cypis', N'20akE7sZUTpZSC78lPhqvt')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10003, N'CORPSE', N'7yntSJ6uojO3z6GFUVwhAW')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10004, N'Savage Ga$p', N'0x7qiZJaal6j8qS7yCydFk')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10005, N'Sigurd Barrett', N'6EN9iGovybDcQZ2NtsqMFd')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10006, N'CJ', N'7arQA31aZVS8yS6zUveWzb')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10007, N'Tańcząca Krowa', N'3rAyh4sUUhSsX5Frdu7ylF')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10008, N'Popp Hunna', N'3fyhhXHbGVLuSHFk2SYx4I')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10009, N'Mario Judah', N'5HFSWl4JPwju06kHxukvTe')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10010, N'Jaap Reesema', N'5WxnXxSCyhDSyi6elhBZd4')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10011, N'Pommelien Thijs', N'3zGV7t4BDmYZBLVA24487b')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10012, N'Isyan Tetick', N'4Rhx0H3w80yqUMSiPfq0Cz')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10013, N'Fousheé', N'6trIghKwHRUyxwvm66HLHH')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10014, N'Chibi Ichigo', N'0eARdjFMVY4Z92QEzM7dgN')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10015, N'Fumez The Engineer', N'0ksX396B3t2Gt8kwr0BJZk')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10016, N'A92', N'5uWT1NONby2BqNCu42fdDc')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10017, N'Offica', N'3z9G13I73VCCZgf2j7i8q2')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10018, N'Kenndog', N'2NLseG7xyv3fHY5U8AUntx')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10019, N'Penelope Scott', N'3u6lPufHw4Oww6D88rv6sB')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10020, N'Edith Whiskers', N'15K8w0bfYieOr55vhSMgJN')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10021, N'Midas the Jagaban', N'07MX7XJsNTn8JlgEcbZ7Fd')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10022, N'James Arthur', N'4IWBUUAFIplrNtaOHcJPRM')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10023, N'GS', N'5rtvBFj4IeWDwKjf9cmeKv')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10024, N'Octavian', N'5zfEatKLDdRkgbw6sdLBAQ')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10025, N'Skepta', N'2p1fiYHYiXz9qi0JJyxBzN')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10026, N'SUPER-Hi', N'2lJ6K4PTrrweXhRiqh1CZE')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10027, N'Neeka', N'1JPZHb1qziDJ05n0a1OvfW')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10028, N'lildeath', N'31ijgiurmIPTNojkYQXdnl')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10029, N'Yung Bleu', N'3KNIG74xSTc3dj0TRy7pGX')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10030, N'Drake', N'3TVXtAsR1Inumwj472S9r4')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10031, N'King Von', N'6QtgPSJPSzcnn7dPZ4VINp')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10032, N'Kreepa', N'6XUob2lASlLLaavOTAw9Vb')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10033, N'Justin Bieber', N'1uNFoZAHBGtllmzznpCI3s')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10034, N'benny blanco', N'5CiGnKThu5ctn9pBxv7DGa')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10035, N'Bando', N'2Th8OtQjRW9N3913iQS1xA')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10036, N'emir taha', N'1zofEGCCvRwAdhetK573gb')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10037, N'Internet Money', N'6MPCFvOQv5cIGfw3jODMF0')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10038, N'Gunna', N'2hlmm7s2ICUX0LVIhVFlZQ')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10039, N'Don Toliver', N'4Gso3d4CscCijv0lmajZWs')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10040, N'NAV', N'7rkW85dBwwrJtlHRDkJDAC')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10041, N'遠野高志', N'3dkW1L7GIhispeiHo9uzM8')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10042, N'加島優', N'3ynBix87InXjEn5L9LsAWB')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10043, N'矢口恭介', N'4CkENaPbZ3CSwB7kAbzTE1')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10044, N'ジミー', N'4ABfGQhx7kTXCFbxvlLtlO')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10045, N'百合絢斗', N'5nEXLz5Qwkcv8d91fP4Cjo')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10046, N'田村唯', N'4tF37PbmfGwti71JKUI1pz')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10047, N'明美圭一', N'6l15fzba4HWiYgbX7ji3NQ')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10048, N'糸目幸士郎', N'0t1H6voah4Js1hbu2EPUqx')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10049, N'鹿谷樹', N'7u0iN4XxPpkIk9KRcLQXDa')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10050, N'Ronisia', N'4krMq8pXkLVTGplpYgHlnV')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10051, N'Mother Mother', N'0e86yPdC41PGRkLp2Q1Bph')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10052, N'Obskür', N'29MTNlaVntQaQiDyj8KGwx')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10053, N'24kGoldn', N'6fWVd57NKTalqvmjRd2t8Z')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10054, N'iann dior', N'6ASri4ePR7RlsvIQgWPJpS')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10055, N'NCT U', N'3paGCCtX1Xr4Gx53mSeZuQ')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10056, N'LMB DG', N'32dh4IR61XDw1XhDpD2Faw')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10057, N'A Firm Handshake', N'2FNefsUIddQsI81cmIJhta')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10058, N'Zach Sobiech', N'1gPo4GYra6HG4nBHD1D3c5')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10059, N'Bazart', N'3kcwSBHk3lMgHMHuxjJLNZ')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10060, N'LOONA', N'52zMTJCKluDlFwMQWmccY7')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10061, N'Sarah Schachner', N'692KvxElsJHIJQCS6Eoc32')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10062, N'Jesper Kyd', N'3m6alJyeKYSCZ8078ttfaH')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10063, N'Einar Selvik', N'4QwiYnKp4dh2PTv1Vgw3c5')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10064, N'Billy Nomates', N'0QJaBD8Piha8IEwKtNpBOB')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10065, N'Larray', N'0rQjJGZLXBq95OA3nSmDj9')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10066, N'Ezhel', N'6LnJKrtFnTEGdbWQ2riWCL')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10067, N'Fivio Foreign', N'14CHVeJGrR5xgUGQFV5BVM')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10068, N'Juju Fitcats', N'7FKoCTIHiz8yMYkooMCyd1')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10069, N'Pop Smoke', N'0eDvMgVFoNV3TpwtrVCoTj')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10070, N'Molchat Doma', N'1nVq0hKIVReeaiB3xJgKf0')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10071, N'Facemask Time', N'3GlDGYz9LvnYbHMUQcpnyu')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10072, N'347aidan', N'0bBz5bRBkExaej2HxtVfCw')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10073, N'Téo Lavabo', N'7fxB1ST5efdEkFaSFenmlw')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10074, N'Studio Killers', N'7avo0PmlW8O1YLEt9DnWQT')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10075, N'Leah Kate', N'6oWOHAOyBUn6aJlKIPJK9r')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10076, N'Ricky Montgomery', N'0ZUvK7zGdXLd78mQr3t1Tw')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10077, N'Yssi SB', N'0o1hCS1PDOc1UtVrcXB9s8')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10078, N'Qlas & Blacka', N'0ltU5V1lbLkZlgXrnCeGjx')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10079, N'Ashafar', N'438nTuoZFCZCyBl33jE9dU')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10080, N'ADF Samski', N'5qeFPM2PZUCzcpkY4e4RC8')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10081, N'MC Virgins', N'3iNL7rw7fpmysjZvhB8vi7')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10082, N'Yun Head', N'3nIuVGstklsvoHOIvULcCe')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10083, N'Kalash Criminel', N'6ytOHdKh4xt4YvF7tz8Zcv')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10084, N'Damso', N'2UwqpfQtNuhBwviIC0f2ie')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10085, N'TWICE', N'7n2Ycct7Beij7Dj7meI4X0')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10086, N'FARR', N'0eHwH1Ze2lRt6KOGw1T3rq')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10087, N'Biscits', N'052B9SONfhoScw7dgYWw5o')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10088, N'Ariana Grande', N'66CXWjxzNUsdJxJ2JdwvnR')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10089, N'The Kid LAROI', N'2tIP7SsRs7vjIcLrU85W8J')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10090, N'JOYCA', N'5AqhBC5pt6b0WVpUAII1Ro')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10091, N'Ava Cerasoli', N'2zMMspLbw3KFWxxf8KCQLl')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10092, N'Belocca', N'3jcvzSheHd14vjraXHLGPN')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10093, N'A*S*Y*S', N'4xfA60YoR4UbBxuOn9WXJq')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10094, N'Tiësto', N'2o5jDhtHVPhrJdv3cEQ99Z')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10095, N'Ritt Momney', N'7MPGCB854Qo4alYMOPkBka')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10096, N'Bosh', N'6Mm2g25BTeJ6BICPFWGkPg')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10097, N'Fred again..', N'4oLeXFyACqeem2VImYeBFe')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10098, N'The Blessed Madonna', N'4TvhRzxIL1le2PWCeUqxQw')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10099, N'Riton', N'7i9j813KFoSBMldGqlh2Z1')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10100, N'Nightcrawlers', N'1gALaWbNDnwS2ECV09sn2A')
GO
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10101, N'Mufasa & Hypeman', N'4L2dV3zY7RmkeiNO035Fi0')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10102, N'Dopamine', N'3Edve4VIATi0OZngclQlkN')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10103, N'Nathan Evans', N'1PKErrAhYFdfrDymGHRQRo')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10104, N'220 KID', N'4Euia7UzdRshy1DJOSMTcs')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10105, N'Billen Ted', N'5PoZtBo8xZKqPWlZrIDq82')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10106, N'Hans Teeuwen', N'7HHVKYQo7uk2347GOmPoPD')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10107, N'Bjørgen', N'52KZuPCKgBFM3ZgBiQ6XaF')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10108, N'Cynthia Erivo', N'46UMQ0cW8ToR8egkBRwAxZ')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10109, N'A1 x J1', N'1WO1hFAkFbeo9tV3uVX7Dy')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10110, N'Justin Wellington', N'5lTjv8Ag00qHSGhvK4JbeF')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10111, N'Small Jam', N'6c8akjSeJQw2NYemV6qVT8')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10112, N'Giveon', N'4fxd5Ee7UefO4CUXgwJ7IP')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10113, N'Metejoor', N'7hdCH3dJ27WvUbo00gAMwE')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10114, N'Babet', N'2Zx5UnYsOJTrLB7EerhsJh')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10115, N'Masked Wolf', N'1uU7g3DNSbsu0QjSEqZtEd')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10116, N'Keyzo', N'1WDv7kwoxxZ9dauOsL9t2j')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10117, N'Kali Uchis', N'1U1el3k54VvEUzo3ybLPlM')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10118, N'ElyOtto', N'4b19vuzlDcNdU4quI7L6sW')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10119, N'Klaus Veen', N'5hEZc6Innys0o99gLeha3K')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10120, N'kostromin', N'3JG79Z23wJN9Q5PTPpDAEV')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10121, N'BU$HI', N'2GIoAorOnT0Yp1jKyTzW7K')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10122, N'Gym Class Heroes', N'4IJczjB0fJ04gs4uvP0Fli')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10123, N'Sergio Valentino', N'4OmG7TmODI5Rj3q7PV3fP5')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10124, N'xakavir', N'1VL3uvtbLOPZN0HO1XpsX8')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10125, N'Central Cee', N'5H4yInM5zmHqpKIoMNAx4r')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10126, N'Cleymans & Van Geel', N'5yRYgJHwb6gtIJ59POLBes')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10127, N'Doria D', N'3o3EvvWqx9JYkPCWM3C15w')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10128, N'Mooski', N'4NqH3V7GS0Igs1VyGMXEi8')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10129, N'Lil Tjay', N'6jGMq4yGs7aQzuGsMgVgZR')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10130, N'6LACK', N'4IVAbR2w4JJNJDDRFP3E83')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10131, N'Leat''eq', N'1iBxtU5394iPOzmot1FDUD')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10132, N'Leony', N'2NpPlwwDVYR5dIj0F31EcC')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10133, N'SCH', N'2kXKa3aAFngGz2P4GjG5w2')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10134, N'Pooh Shiesty', N'5F1aAS1duwlzExnPs3l2Xe')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10135, N'Lil Durk', N'3hcs9uc56yIGFCSy9leWe7')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10136, N'Sava', N'25A5LqeSK0yH4ks5fGxbI2')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10137, N'BM X MINI', N'6xNUn9epduXbZmCgsxutSx')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10138, N'Tom Grennan', N'5SHxzwjek1Pipl1Yk11UHv')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10139, N'Geike', N'5mkzx9Hq5mYTx1LZ0CUGiP')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10140, N'SR', N'2NZN0JDhWXmMmhSXTbhm1h')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10141, N'P!nk', N'1KCSPY1glIKqW2TotWuXOR')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10142, N'Willow Sage Hart', N'0gAILSEru1PKMwP0tAqNLS')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10143, N'Beach Bunny', N'2vnB6tuQMaQpORiRdvXF9H')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10144, N'Ykons', N'37j8wAQ4dudi8EIUL32hk1')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10145, N'gigi', N'3FVGHhoCQxw0fmNhRMhmOT')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10146, N'De Nachtbrakers', N'6WtQIrE4QtO7sceTzeasnn')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10147, N'Haha Bier Jongen', N'1aCXrk9aUVgcLRqQQjfKba')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10148, N'Niro', N'1wAtSe79kItIb9nf5EhI2Q')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10149, N'PLK', N'3DCWeG2J1fZeu0Oe6i5Q6m')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10150, N'Kevin Gates', N'1gPhS1zisyXr5dHTYZyiMe')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10151, N'ATB', N'7jZM5w05mGhw6wTB1okhD9')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10152, N'Topic', N'0u6GtibW46tFX7koQ6uNJZ')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10153, N'A7S', N'5Wg2b4Mp42gicxEeDNawf7')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10154, N'DUSTY LOCANE', N'22hWz22JAmIhIEp0u1X01L')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10155, N'Nessa Barrett', N'7pwufEBGfggjoI8twqlsmQ')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10156, N'jxdn', N'6Y64EaNqpqcZYTgs4c76gF')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10157, N'SoFaygo', N'2SJhf6rTOU53g8yBdAjPby')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10158, N'Leah Nobel', N'5WHKBKrvTBMPoQX3v3Bq8J')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10159, N'Solomun', N'5wJK4kQAkVGjqM9x46KQOC')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10160, N'ÄTNA', N'4ORnI4BzjKFbUply6fRvkX')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10161, N'Coi Leray', N'6AMd49uBDJfhf30Ak2QR5s')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10162, N'Le Tigre', N'2n6FviARgtjjimZXu18uRM')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10163, N'Bankzitters', N'1g9nyCbUH0kbNgXAsw7tUB')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10164, N'Sea Shanty', N'0mFdUcqo7TnJNeWxzqqJax')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10165, N'Basstrologe', N'6OMAZu0PYOsl3kONOQV9Zk')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10166, N'AURORA', N'1WgXqy2Dd70QQOU7Ay074N')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10167, N'Majestic', N'6QMABvTzixnxzsLYyhqRxI')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10168, N'Boney M.', N'54R6Y0I7jGUCveDTtI21nb')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10169, N'Camille', N'2aV2tpJtR55vg19SxBJvNs')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10170, N'MC L da Vinte', N'0lHB0Qc4pmD5RkTLlHeESo')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10171, N'MC Gury', N'6fOyYqdh6p0ZWLs9zUDoyt')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10172, N'Lil Nas X', N'7jVv8c5Fj3E9VhNjxT4snq')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10173, N'Russ Millions', N'3FoFW2AoUGRHBacC6i4x4p')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10174, N'Tion Wayne', N'7b79bQFziJFedJb75k6hFt')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10175, N'Gazo', N'5gqmbbfjcikQBzPB5Hv13I')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10176, N'PinkPantheress', N'78rUTD7y6Cy67W1RVzYs7t')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10177, N'Cody Fry', N'7dOCnyDR2oEa1hQlvTXvdT')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10178, N'lil kudo', N'2hKSBz0WXqOQJhKDJNSzzb')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10179, N'Yot Club', N'6FugQjLquBF4JzATRN70bR')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10180, N'Mimi Webb', N'3GxKJzJK4LpsYGXQrw77wz')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10181, N'Ghost Killer Track', N'37S0GFsBW73uqxGXNFeADJ')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10182, N'D-Block Europe', N'5VadK1havLhK1OpKYsXv9y')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10183, N'OBOY', N'66Ok6bgC570sHkw08N20pZ')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10184, N'Weeekly', N'73B9bjqS2Z5KLXNGqXf64m')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10185, N'Stan Christ', N'0aby7MYHsm3JS0eSifxu3I')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10186, N'Our Last Night', N'00YTqRClk82aMchQQpYMd5')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10187, N'Snelle', N'3E31HqA00iCX9nRhesw6LD')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10188, N'Maan', N'5vmwWgrlwCfHm1P0vdDFbU')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10189, N'Angelcy', N'2BLqT1DuND6cAhJodiKmc2')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10190, N'KVSH', N'2uGKgNuq7MnKksXiSO6HjB')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10191, N'Schillist', N'2qvWyc9Z0oHK156P65vH4d')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10192, N'Bruno Mars', N'0du5cEVh5yTK9QJze8zA0C')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10193, N'Anderson .Paak', N'3jK9MiCrA42lLAdMGUZpwa')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10194, N'Silk Sonic', N'6PvvGcCY2XtUcSRld1Wilr')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10195, N'Maceo Plex', N'3TXQ1ddouwQAI78hV4hXDj')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10196, N'Chromatics', N'4tOVIRjlWWfR1RrAxyRqTE')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10197, N'Moha K', N'6o5sl0TGublDPXyMHdMq1E')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10198, N'Rea Garvey', N'0bmxU94V20pNJ2Vie9kFYv')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10199, N'VIZE', N'09agIJMxCD2k87ys9Al0f0')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10200, N'Jungle', N'59oA5WbbQvomJz2BuRG071')
GO
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10201, N'Los Legendarios', N'0n6sKrG0xKAf8xmdqeNGke')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10202, N'Wisin', N'3E6xrwgnVfYCrCs0ePERDz')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10203, N'Jhay Cortez', N'0EFisYRi20PTADoJrifHrz')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10204, N'Colapesce', N'2KX2VLr3Eu6sn6EtxzCtvf')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10205, N'Dimartino', N'1k3zqz5SgrYCE0wpcfJX3g')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10206, N'Daniel Caesar', N'20wkVLutqVOYrc0kxFs7rA')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10207, N'Imagine Dragons', N'53XhwfbYqKCa1cC15pYq2q')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10208, N'Tesher', N'49YbNTLaaAbZHLtDI2aPGL')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10209, N'DJ Licious', N'30SUNrTLW7OZeDALH3sWzH')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10210, N'Armen Paul', N'1CwqAnNZyIYqC7SWpTUpwk')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10211, N'Youssoupha', N'5DW7NxqQ2875JtjuV7KMn4')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10212, N'Caballero', N'5DE0by3fZT0nrlJSutY2D7')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10213, N'Suzan & Freek', N'77IW5ZK1smDQYYKDCQugXh')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10214, N'Dom Dolla', N'205i7E8fNVfojowcQSfK9m')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10215, N'Yaw Tog', N'2Dqt6WjEca8WcZuGiUcYDd')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10216, N'Stormzy', N'2SrSdSvpminqmStGELCSNd')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10217, N'Kwesi Arthur', N'52iM1kP5BpnLypZ0VtrpyY')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10218, N'Naps', N'6W5uA6CNMf3hd2j4a2XWCx')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10219, N'JAE5', N'3NbqBIc16CNAe5nYSmHR3p')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10220, N'Rema', N'46pWGuE3dSwY3bMMXGBvVS')
INSERT [dbo].[Artist] ([ArtistId], [Name], [SpotifyArtistString]) VALUES (10221, N'Shouse', N'2TcGJdSOiOvITBzhvfX8XB')
SET IDENTITY_INSERT [dbo].[Artist] OFF
GO
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10002, 10002)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10003, 10003)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10004, 10003)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10005, 10004)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10006, 10005)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10007, 10006)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10008, 10007)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10009, 10008)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10010, 10009)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10011, 10009)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10012, 10010)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10013, 10011)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10014, 10012)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10015, 10013)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10016, 10013)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10017, 10013)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10018, 10014)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10019, 10015)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10020, 10016)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10021, 10017)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10022, 10018)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10023, 10019)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10024, 10020)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10025, 10020)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10026, 10021)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10027, 10021)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10028, 10022)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10029, 10023)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10030, 10023)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10031, 10024)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10003, 10025)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10032, 10026)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10033, 10027)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10034, 10027)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10035, 10028)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10036, 10029)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10037, 10030)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10038, 10030)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10039, 10030)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10040, 10030)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10041, 10031)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10042, 10031)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10043, 10031)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10044, 10031)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10045, 10031)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10046, 10031)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10047, 10031)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10048, 10031)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10049, 10031)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10050, 10032)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10051, 10033)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10052, 10034)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10053, 10035)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10054, 10035)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10003, 10036)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10055, 10037)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10056, 10038)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10057, 10039)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10058, 10039)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10059, 10040)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10060, 10041)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10061, 10042)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10062, 10042)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10063, 10042)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10003, 10043)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10064, 10044)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10065, 10045)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10066, 10046)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10031, 10047)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10067, 10047)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10068, 10048)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10069, 10049)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10070, 10050)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10071, 10051)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10072, 10052)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10073, 10053)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10074, 10054)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10075, 10055)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10076, 10056)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10077, 10057)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10078, 10057)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10079, 10057)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10080, 10057)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10081, 10058)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10082, 10058)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10083, 10059)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10084, 10059)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10085, 10060)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10086, 10061)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10087, 10061)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10088, 10062)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10089, 10063)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10090, 10064)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10091, 10065)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10092, 10066)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10093, 10066)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10094, 10067)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10095, 10068)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10096, 10069)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10097, 10070)
GO
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10098, 10070)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10099, 10071)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10100, 10071)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10101, 10071)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10102, 10071)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10103, 10072)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10104, 10072)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10105, 10072)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10106, 10073)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10107, 10073)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10108, 10074)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10109, 10075)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10110, 10076)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10111, 10076)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10112, 10077)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10113, 10078)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10114, 10078)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10115, 10079)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10116, 10080)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10103, 10081)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10117, 10082)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10118, 10083)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10119, 10084)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10120, 10085)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10121, 10086)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10122, 10087)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10123, 10088)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10124, 10088)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10125, 10089)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10126, 10090)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10127, 10091)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10128, 10092)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10129, 10093)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10130, 10093)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10131, 10094)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10132, 10095)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10133, 10096)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10134, 10097)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10135, 10097)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10015, 10098)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10136, 10098)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10137, 10098)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10138, 10099)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10139, 10100)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10140, 10101)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10141, 10102)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10142, 10102)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10143, 10103)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10144, 10104)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10145, 10105)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10106, 10106)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10146, 10106)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10147, 10106)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10148, 10107)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10149, 10107)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10150, 10108)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10151, 10109)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10152, 10109)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10153, 10109)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10154, 10110)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10155, 10111)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10156, 10111)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10157, 10112)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10158, 10113)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10159, 10114)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10160, 10114)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10161, 10115)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10135, 10115)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10125, 10116)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10162, 10117)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10163, 10118)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10164, 10119)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10097, 10120)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10098, 10120)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10165, 10121)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10110, 10122)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10111, 10122)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10166, 10123)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10167, 10124)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10168, 10124)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10169, 10125)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10170, 10126)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10171, 10126)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10172, 10127)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10173, 10128)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10174, 10128)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10175, 10129)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10176, 10130)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10177, 10131)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10178, 10132)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10179, 10133)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10180, 10134)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10181, 10135)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10182, 10135)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10183, 10135)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10184, 10136)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10185, 10137)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10186, 10138)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10187, 10139)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10188, 10139)
GO
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10189, 10140)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10190, 10141)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10191, 10141)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10192, 10142)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10193, 10142)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10194, 10142)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10195, 10143)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10196, 10143)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10197, 10144)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10198, 10145)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10199, 10145)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10200, 10146)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10201, 10147)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10202, 10147)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10203, 10147)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10204, 10148)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10205, 10148)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10033, 10149)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10206, 10149)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10112, 10149)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10207, 10150)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10208, 10151)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10209, 10152)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10210, 10152)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10211, 10153)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10212, 10154)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10213, 10155)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10214, 10156)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10212, 10157)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10215, 10158)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10216, 10158)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10217, 10158)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10218, 10159)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10219, 10160)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10025, 10160)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10220, 10160)
INSERT [dbo].[ArtistSong] ([ArtistId], [SongId]) VALUES (10221, 10161)
GO
SET IDENTITY_INSERT [dbo].[Playlist] ON 

INSERT [dbo].[Playlist] ([PlaylistId], [Name], [SpotifyPlString]) VALUES (10002, N'Belgium Viral 50', N'37i9dQZEVXbJx9hUtTN0Sj')
INSERT [dbo].[Playlist] ([PlaylistId], [Name], [SpotifyPlString]) VALUES (10009, N'Heavy rotation 3', N'maplaylistheavyrotation2')
SET IDENTITY_INSERT [dbo].[Playlist] OFF
GO
SET IDENTITY_INSERT [dbo].[PlaylistSong] ON 

INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10024, 1, NULL, 10002, 10002)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10025, 2, NULL, 10002, 10003)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10026, 3, NULL, 10002, 10004)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10027, 4, NULL, 10002, 10005)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10028, 5, NULL, 10002, 10006)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10029, 6, NULL, 10002, 10007)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10030, 7, NULL, 10002, 10008)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10031, 8, NULL, 10002, 10009)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10032, 9, NULL, 10002, 10010)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10033, 10, NULL, 10002, 10011)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10034, 11, NULL, 10002, 10012)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10035, 12, NULL, 10002, 10013)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10036, 13, NULL, 10002, 10014)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10037, 14, NULL, 10002, 10015)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10038, 15, NULL, 10002, 10016)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10039, 16, NULL, 10002, 10017)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10040, 17, NULL, 10002, 10018)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10041, 18, NULL, 10002, 10019)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10042, 19, NULL, 10002, 10020)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10043, 20, NULL, 10002, 10021)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10044, 21, NULL, 10002, 10022)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10045, 22, NULL, 10002, 10023)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10046, 23, NULL, 10002, 10024)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10047, 24, NULL, 10002, 10025)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10048, 25, NULL, 10002, 10026)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10049, 26, NULL, 10002, 10027)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10050, 27, NULL, 10002, 10028)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10051, 28, NULL, 10002, 10029)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10052, 29, NULL, 10002, 10030)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10053, 30, NULL, 10002, 10031)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10054, 31, NULL, 10002, 10032)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10055, 32, NULL, 10002, 10033)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10056, 33, NULL, 10002, 10034)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10057, 34, NULL, 10002, 10035)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10058, 35, NULL, 10002, 10036)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10059, 36, NULL, 10002, 10037)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10060, 37, NULL, 10002, 10038)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10061, 38, NULL, 10002, 10039)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10062, 39, NULL, 10002, 10040)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10063, 40, NULL, 10002, 10041)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10064, 41, NULL, 10002, 10042)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10065, 42, NULL, 10002, 10043)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10066, 43, NULL, 10002, 10044)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10067, 44, NULL, 10002, 10045)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10068, 45, NULL, 10002, 10046)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10069, 46, NULL, 10002, 10047)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10070, 47, NULL, 10002, 10048)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10071, 48, NULL, 10002, 10049)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10072, 49, NULL, 10002, 10050)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10073, 50, NULL, 10002, 10051)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10074, 2, NULL, 10002, 10052)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10075, 11, NULL, 10002, 10053)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10076, 15, NULL, 10002, 10054)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10077, 17, NULL, 10002, 10055)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10078, 20, NULL, 10002, 10056)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10079, 23, NULL, 10002, 10057)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10080, 25, NULL, 10002, 10058)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10081, 28, NULL, 10002, 10059)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10082, 30, NULL, 10002, 10060)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10083, 31, NULL, 10002, 10061)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10084, 32, NULL, 10002, 10062)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10085, 33, NULL, 10002, 10063)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10086, 35, NULL, 10002, 10064)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10087, 43, NULL, 10002, 10065)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10088, 44, NULL, 10002, 10066)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10089, 46, NULL, 10002, 10067)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10090, 47, NULL, 10002, 10068)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10091, 49, NULL, 10002, 10069)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10092, 1, NULL, 10002, 10070)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10093, 2, NULL, 10002, 10071)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10094, 3, NULL, 10002, 10072)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10095, 4, NULL, 10002, 10073)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10096, 5, NULL, 10002, 10074)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10097, 6, NULL, 10002, 10075)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10098, 7, NULL, 10002, 10076)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10099, 8, NULL, 10002, 10077)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10100, 9, NULL, 10002, 10078)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10101, 10, NULL, 10002, 10079)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10102, 11, NULL, 10002, 10080)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10103, 12, NULL, 10002, 10081)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10104, 13, NULL, 10002, 10082)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10105, 14, NULL, 10002, 10083)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10106, 15, NULL, 10002, 10084)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10107, 16, NULL, 10002, 10085)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10108, 17, NULL, 10002, 10086)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10109, 18, NULL, 10002, 10087)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10110, 19, NULL, 10002, 10088)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10111, 20, NULL, 10002, 10089)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10112, 21, NULL, 10002, 10090)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10113, 22, NULL, 10002, 10091)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10114, 23, NULL, 10002, 10092)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10115, 24, NULL, 10002, 10093)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10116, 25, NULL, 10002, 10094)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10117, 26, NULL, 10002, 10095)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10118, 27, NULL, 10002, 10096)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10119, 28, NULL, 10002, 10097)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10120, 29, NULL, 10002, 10098)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10121, 30, NULL, 10002, 10099)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10122, 31, NULL, 10002, 10100)
GO
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10123, 32, NULL, 10002, 10101)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10124, 33, NULL, 10002, 10102)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10125, 34, NULL, 10002, 10103)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10126, 35, NULL, 10002, 10104)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10127, 36, NULL, 10002, 10105)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10128, 37, NULL, 10002, 10106)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10129, 38, NULL, 10002, 10107)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10130, 39, NULL, 10002, 10108)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10131, 40, NULL, 10002, 10109)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10132, 41, NULL, 10002, 10110)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10133, 42, NULL, 10002, 10111)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10134, 43, NULL, 10002, 10112)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10135, 44, NULL, 10002, 10113)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10136, 45, NULL, 10002, 10114)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10137, 46, NULL, 10002, 10115)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10138, 47, NULL, 10002, 10116)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10139, 48, NULL, 10002, 10117)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10140, 49, NULL, 10002, 10118)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10141, 50, NULL, 10002, 10119)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10142, 1, NULL, 10002, 10120)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10143, 2, NULL, 10002, 10121)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10144, 3, NULL, 10002, 10122)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10145, 4, NULL, 10002, 10123)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10146, 5, NULL, 10002, 10124)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10147, 6, NULL, 10002, 10125)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10148, 7, NULL, 10002, 10126)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10149, 9, NULL, 10002, 10127)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10150, 10, NULL, 10002, 10128)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10151, 11, NULL, 10002, 10129)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10152, 12, NULL, 10002, 10130)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10153, 13, NULL, 10002, 10131)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10154, 14, NULL, 10002, 10132)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10155, 15, NULL, 10002, 10133)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10156, 16, NULL, 10002, 10134)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10157, 18, NULL, 10002, 10135)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10158, 19, NULL, 10002, 10136)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10159, 20, NULL, 10002, 10137)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10160, 21, NULL, 10002, 10138)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10161, 22, NULL, 10002, 10139)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10162, 23, NULL, 10002, 10140)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10163, 24, NULL, 10002, 10141)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10164, 25, NULL, 10002, 10142)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10165, 26, NULL, 10002, 10143)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10166, 27, NULL, 10002, 10144)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10167, 28, NULL, 10002, 10145)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10168, 29, NULL, 10002, 10146)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10169, 31, NULL, 10002, 10147)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10170, 33, NULL, 10002, 10148)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10171, 34, NULL, 10002, 10149)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10172, 35, NULL, 10002, 10150)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10173, 36, NULL, 10002, 10151)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10174, 37, NULL, 10002, 10152)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10175, 38, NULL, 10002, 10153)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10176, 39, NULL, 10002, 10154)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10177, 40, NULL, 10002, 10155)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10178, 43, NULL, 10002, 10156)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10179, 44, NULL, 10002, 10157)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10180, 45, NULL, 10002, 10158)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10181, 46, NULL, 10002, 10159)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10182, 48, NULL, 10002, 10160)
INSERT [dbo].[PlaylistSong] ([PlaylistSongId], [Position], [Date], [PlaylistId], [SongId]) VALUES (10183, 49, NULL, 10002, 10161)
SET IDENTITY_INSERT [dbo].[PlaylistSong] OFF
GO
SET IDENTITY_INSERT [dbo].[Song] ON 

INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10002, N'Gdzie jest biały węgorz ? (Zejście)', N'4fNbS43X6yt4iWxLgRqwKa', 10002)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10003, N'E-GIRLS ARE RUINING MY LIFE!', N'7bCfHiRcfUjG0YVVNUL7Ve', 10003)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10004, N'Pilfingerdansen - Remix', N'1xH7LBCKd4kBzD3hiDMJcQ', 10004)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10005, N'Whoopty', N'5vGLcdRuSbUhD8ScwsGSdA', 10005)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10006, N'Tylko Jedno W Głowie Mam', N'7vwy560dv6TVwzCCmpbv7z', 10006)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10007, N'Adderall (Corvette Corvette)', N'3aAmQOxRPeKDL0HMWFA5qn', 10007)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10008, N'Die Very Rough', N'3brXaWuPsVScvYQKUh3Ijc', 10008)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10009, N'Nu Wij Niet Meer Praten', N'13UfB1tm7QYrhtW8FhPYmW', 10009)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10010, N'Patlamaya Devam', N'4InPkb53JOmTmpM1njbl6A', 10010)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10011, N'Deep End', N'6HlE9t71z9DjGi7KqSyEpA', 10011)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10012, N'POKA', N'6AJdztpt8pqAwaDviMptxr', 10012)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10013, N'A92 x Fumez The Engineer - Plugged In Freestyle', N'0goOUCNL6MYrqSVvGhvsxw', 10013)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10014, N'Drip Like ME', N'5lNsNowjCKqgafSWE7Ie2Z', 10014)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10015, N'Rät', N'25z6kpmIwkCUqk2IORrJ5v', 10015)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10016, N'Home', N'18V1UiYRvWYwn01CRDbbuR', 10016)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10017, N'Party With A Jagaban', N'5BkBcXJ0rDRlnzh3tmknxI', 10017)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10018, N'Train Wreck', N'55Am8neGJkdj2ADaM3aw5H', 10018)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10019, N'Love you', N'3UDiwDYlN33NmalHdpbpAi', 10019)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10020, N'Papi Chulo', N'6Juv5N0dNU1imms9c9u1dA', 10020)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10021, N'Following The Sun', N'2JzXBqTIVHYX43t7EcLyMs', 10021)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10022, N'moment', N'2JKIYl8KaAMzOR1dIzEO5f', 10022)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10023, N'You’re Mines Still (feat. Drake)', N'7E2C5rBLpCKwQlhJPVFBRS', 10023)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10024, N'Took Her To The O', N'7fEoXCZTZFosUFvFQg1BmW', 10024)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10025, N'Cat Girls Are Ruining My Life!', N'4SPBwOTXgku4QvmRtMEGfW', 10025)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10026, N'Oh No', N'4qBMiRsJjtm1WR4KyAQqrX', 10026)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10027, N'Lonely (with benny blanco)', N'4y4spB9m0Q6026KfkAvy9Q', 10027)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10028, N'Wesh gros', N'4TDg4BSrkHpiEmMsJ6M3WZ', 10028)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10029, N'Huyu Suyu', N'67VXzMGtIrbj52tB6D4djH', 10029)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10030, N'Lemonade (feat. Gunna, Don Toliver & NAV)', N'7hxHWCCAIIxFLCzvDgnQHX', 10030)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10031, N'Touch You', N'6qWEpnyU43Bcrx3vfbGuVm', 10031)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10032, N'Atterrissage', N'6IXC9VdQ03U13URwDvDi73', 10032)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10033, N'Hayloft', N'2kS6td1yvmpNgZTt1q5pQq', 10033)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10034, N'Bayside', N'3FZMw07xN35LDqfvYRtXMq', 10034)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10035, N'Mood (feat. iann dior)', N'3tjFYV6RSFtuktYl3ZtYcq', 10035)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10036, N'Miss YOU!', N'3pXVmZh293nWtqxildz9jf', 10036)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10037, N'Make A Wish (Birthday Song)', N'6FdShjf7nA2cqEnpv1tIia', 10037)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10038, N'Pull Up', N'6NwyHRfUVnUBUZW9W5McAZ', 10038)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10039, N'Clouds (feat. Zach Sobiech)', N'40CJfuACP98IVW9aY6wAmh', 10039)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10040, N'Denk Maar Niet Aan Morgen', N'1dYluPeOZX9szv3wbzY8dp', 10040)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10041, N'Why Not?', N'6yGQ86UppYULzTCxAWgwVN', 10041)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10042, N'Assassin''s Creed Valhalla Main Theme (feat. Einar Selvik)', N'2hQIeYuMXRrvCASE6kB37E', 10042)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10043, N'White Tee', N'3qdRwIwWa5nVZnNp43uYrx', 10043)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10044, N'No', N'3lBiecVdyFqNIx4VFn1ijn', 10044)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10045, N'Canceled', N'3VxOgQ9o1aKonFx4d5lPR3', 10045)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10046, N'Allah’ından Bul', N'350aUOZhGtTOK1dQbQFKNc', 10046)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10047, N'I Am What I Am (feat. Fivio Foreign)', N'6FKbgWZ7KgpSk7tvFP7eEc', 10047)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10048, N'Clash Tibo Inshape', N'245xHfeQeBCcYn2hm5jXDb', 10048)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10049, N'What You Know Bout Love', N'1tkg4EHVoqnhR6iFEXb60y', 10049)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10050, N'Судно (Борис Рижий)', N'6DONTnamNDOJdO6DzCu71p', 10050)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10051, N'When I ruled the world X Let Me See Your Hips Swing', N'1Kv5BK09yyab9sRem6w2VY', 10051)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10052, N'Dancing in My Room', N'6Pgmqg15yVexuOgtzuxwoX', 10052)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10053, N'Chipolata', N'7vs3WkE9wB9G6hxNtKpmXd', 10053)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10054, N'Jenny', N'7lgA34nFXxjqQgyLkPUcLv', 10054)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10055, N'Fuck Up the Friendship', N'1ddKUwm3UuvcMWLLAgOIcX', 10055)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10056, N'Line Without a Hook', N'5jvgec3P4jyoZUPTy2pWDR', 10056)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10057, N'Scooter', N'4eWeOwo0TB0vkdrUhy4zbM', 10057)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10058, N'Trap Anthem', N'0CJgUQ8UemK2htS73Ye5U8', 10058)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10059, N'But en or', N'6d1nCbLfLPLl1mTqIzqwPc', 10059)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10060, N'I CAN''T STOP ME', N'3apeXzypBMnUfYcZYNX6DH', 10060)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10061, N'Heal Me - Biscits Remix', N'1ld3ibWlGwo4oBFPb6pmKk', 10061)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10062, N'positions', N'35mvY5S1H3J2QZyna3TFe0', 10062)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10063, N'SO DONE', N'3qgPpwtuRu5oP8EtFSj8HE', 10063)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10064, N'Wow Wow Wow', N'5M10YdeYDGoMT3KBfLyh7D', 10064)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10065, N'Reveries', N'2Wq70oxNy3i4KOW175fUs2', 10065)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10066, N'Under Pressure - Original Mix', N'0M07XMvl0ylY9VVt69LsJu', 10066)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10067, N'The Business', N'6f3Slt0GbA2bPZlz0aIFXN', 10067)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10068, N'Put Your Records On', N'6AGOKlMZWLCaEJGnaROtF9', 10068)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10069, N'Slide', N'1nikTDDXqLfm9naa48m6FI', 10069)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10070, N'Marea (We’ve Lost Dancing)', N'1t0Jmqg1pKVBbxjQFZebeR', 10070)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10071, N'Friday (feat. Mufasa & Hypeman) - Dopamine Re-Edit', N'4cG7HUWYHBV6R6tHn1gxrl', 10071)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10072, N'Wellerman - Sea Shanty / 220 KID x Billen Ted Remix', N'3iw6V4LH7yPj1ESORX9RIN', 10072)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10073, N'Lockdown Lul - Extended 80''s Versie', N'1nltrWqyzvm1fnEEl2jXHF', 10073)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10074, N'Stand Up (From Harriet)', N'3wNNbf63xkxw9rIVWtFy7a', 10074)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10075, N'Latest Trends', N'7pnQ23WgZca9jEfMts9qsR', 10075)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10076, N'Iko Iko', N'4qlBvxOwFy6og73eik75Ro', 10076)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10077, N'Heartbreak Anniversary', N'3FAJ6O0NOHQV8Mc5Ri6ENp', 10077)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10078, N'1 Op Een Miljoen', N'1Ox6RIOerYvgRH9AxIl4DO', 10078)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10079, N'Astronaut In The Ocean', N'3VT8hOC5vuDXBsHrR53WFh', 10079)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10080, N'Dingue de toi', N'74ILhGYbgzus115BpJs3s9', 10080)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10081, N'Wellerman - Sea Shanty', N'54OBgO0Xwu20Jak9TMXbR7', 10081)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10082, N'telepatía', N'6tDDoYIxWvMLTdKpjFkc1B', 10082)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10083, N'SugarCrash!', N'2ePtv8MlBO9nuuXABqAfEX', 10083)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10084, N'Poison', N'4kdnniHBTCnzaYXrnsweSf', 10084)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10085, N'Моя голова винтом (My head is spinning like a screw)', N'4KrhaZm4JRkNO4HRdLvJIG', 10085)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10086, N'Obito', N'2bXRmU7X5Te9FCBEjlwUEx', 10086)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10087, N'Cupid''s Chokehold / Breakfast in America', N'2Lhdl74nwwVGOE2Gv35QuK', 10087)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10088, N'Drive Forever - Remix', N'5Q3xCP6hLWzMgTWjaSQ4yU', 10088)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10089, N'Commitment Issues', N'0UCKUJU94sx8XBQnaNsRkB', 10089)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10090, N'En Route - Uit Liefde Voor Muziek', N'11DVD49RgiEyGYkCYfy53c', 10090)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10091, N'Dépendance', N'3oJ1XZy05mnRAnEXJsxYzI', 10091)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10092, N'Track Star', N'5hChuUMe5iHfjkXgzj1D4b', 10092)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10093, N'Calling My Phone', N'5Kskr9LcNYa0tpt5f0ZEJx', 10093)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10094, N'Tokyo', N'5GRf6zSrCi8gErdN6CyRJT', 10094)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10095, N'Faded Love', N'3RcXFW8aiRYHRaDDYBqJ76', 10095)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10096, N'Marché noir', N'3BDHFeYIrqGpL8HNkuI6zv', 10096)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10097, N'Back In Blood (feat. Lil Durk)', N'7FGdjbZ32vMybPuP0IuE7d', 10097)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10098, N'TPL x Fumez The Engineer - Plugged In Freestyle', N'2oW5T6viRcUuE6Ttk6TJ9B', 10098)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10099, N'Little Bit of Love', N'3Iba59sFmGhQ4kbCY5L8AX', 10099)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10100, N'We Begrijpen Mekaar (Uit Liefde Voor Muziek) - Live', N'6I398Umcn5ipSuydfpU73p', 10100)
GO
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10101, N'Welcome To Brixton', N'7kQUdVjev73xIuwu7W6YW9', 10101)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10102, N'Cover Me In Sunshine', N'6Tio0ZoDeSQnI7EBAqWer2', 10102)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10103, N'Cloud 9', N'6vFsBXYczYsP0H3lgunZOm', 10103)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10104, N'Sequoia Trees', N'0GNvrasvTX93h4ljqq04qe', 10104)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10105, N'Sometimes (Backwood)', N'5ysFFsqJFcsX8Rez67j2tv', 10105)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10106, N'L*l In De Lockdown (Power Hour Edit)', N'4lIORHYHCUjJsIDbRNjp1O', 10106)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10107, N'Fils 2', N'3IHyLOqJ4WPGRHWB7UjXmg', 10107)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10108, N'Big Gangsta', N'2HYvkdq6lpFXkVz9Tfqi8r', 10108)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10109, N'Your Love (9PM)', N'5YaskwnGDZFDRipaqzbwQx', 10109)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10110, N'ROLLIN N CONTROLLIN FREESTYLE', N'1xqRKo0SDFDO5Jy8yEVD0X', 10110)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10111, N'la di die (feat. jxdn)', N'3RLshk3cDQOqWhSIRCVaXL', 10111)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10112, N'Knock Knock', N'6aHoPULNO7pSL2ZfUY0bU8', 10112)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10113, N'Beginning Middle End - From The Netflix Film "To All The Boys: Always and Forever"', N'2kFHjWko1il6O9L3eK9IzG', 10113)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10114, N'Tuk Tuk (feat. ÄTNA)', N'0vvR7ogspsWehDhpZPNhZF', 10114)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10115, N'No More Parties - Remix', N'5A4WcRuy0FFEAC5pAK43oa', 10115)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10116, N'Loading', N'4vzJrkfHbCGaodPA5RY5BV', 10089)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10117, N'Deceptacon', N'5773KSWFzg9kCc8yazjbSt', 10116)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10118, N'Stapelgek', N'3XIp0ysiSPDINHCeSpL6HK', 10117)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10119, N'Wellerman', N'1fC0uGs48Sb7GLioUe0tN4', 10118)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10120, N'Marea (We’ve Lost Dancing)', N'5Z8Dj3LtbyCMiwE86rhg2f', 10119)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10121, N'Somebody To Love', N'6uYnM3pZBgvEh95lrsqSJS', 10120)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10122, N'Iko Iko', N'7MC4XR9M9amdmKQr2iDF7i', 10121)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10123, N'Runaway', N'1v1oIWf2Xgh54kIWuKsDf6', 10122)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10124, N'Rasputin', N'0b18g3G5spr4ZCkz7Y6Q0Q', 10123)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10125, N'Vuurwerk', N'0ij4IjHf1J5gEz7vdX6fAk', 10124)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10126, N'Parado no Bailão', N'3Hb9kUdm4yf839Fle4RIdT', 10125)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10127, N'MONTERO (Call Me By Your Name)', N'67BtfxlNbhBmCDR2L2l8qd', 10126)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10128, N'Body', N'3CVb6hkMrlF7eHhXi5B3PZ', 10127)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10129, N'HAINE&SEX', N'6Vcxzw4ifKqYxVrp3ckpVF', 10128)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10130, N'Break it off', N'5892YX6q8y3Rs9OysF08kv', 10129)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10131, N'I Hear a Symphony', N'3iJya7m7trpGv570Ske30n', 10130)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10132, N'Motive X Promiscuous', N'5qD2DVnUdnx22kZN3CNseL', 10131)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10133, N'YKWIM?', N'7ejeQLLLGjVriLS7cojERB', 10132)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10134, N'Good Without', N'15OCqNPYoLziEAsbVnqRj5', 10133)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10135, N'Tonight (feat. D-Block Europe & OBOY)', N'6yxTnrfmP6IPqzmQNkSv3S', 10134)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10136, N'After School', N'52CBUrIdyf8tbZaUY9iawE', 10135)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10137, N'Trepidation', N'2xDPYggKsvXFblelNnCnu4', 10136)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10138, N'Astronaut In The Ocean', N'2qjH6wZfR0g11ZiT7KqyRO', 10137)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10139, N'Blijven Slapen', N'7BRKEcW05hOZMJ3bKOOzQl', 10138)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10140, N'Laisser faire', N'79aL0u0Ll6BdI4YrrIXY5y', 10139)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10141, N'Sicko Drop', N'5OJbBrGPY4scEGwMysuyLb', 10140)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10142, N'Leave The Door Open', N'7MAibcTli4IisCtbHKrGMh', 10141)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10143, N'Shadow (Maceo Plex Remix)', N'5BAJDNTutBFJL27pKunac1', 10142)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10144, N'Vroum Vroum', N'6sRPU30pj9A6G1pBXqzQkM', 10143)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10145, N'The One', N'6j0l7Hjt6qeDCQnYBZuJXY', 10144)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10146, N'Keep Moving', N'6a88fc0zSrVWGPdoj445nJ', 10145)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10147, N'Fiel', N'7Bk0uXKk1uPT0XuQbpFzvs', 10146)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10148, N'Musica leggerissima', N'67qxSUoyng1ohzvfyOyNWW', 10147)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10149, N'Peaches (feat. Daniel Caesar & Giveon)', N'4iJyoBOLtHqaGxP12qzhQI', 10148)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10150, N'Follow You', N'7FdUvDkaE24o3FPIWTvzv2', 10149)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10151, N'Jalebi Baby', N'6GKGoi0FHzldk1ZRQoV1fv', 10150)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10152, N'Hope', N'7wCOdJ62C6ZWvp8nf8i59S', 10151)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10153, N'MON ROI', N'6JBguwp02pjeudMxJx17JD', 10152)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10154, N'Goût du beurre', N'6S7e7WM3Jyy88RviWeeQbB', 10153)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10155, N'Goud', N'3aViSiRTiK1e5OqJtUk3MS', 10154)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10156, N'Pump the Brakes', N'1Gz2E1chOzRyhFXHJYWw8y', 10155)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10157, N'Bethleem', N'3Li7gehqgOC6ntvpkXivtO', 10153)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10158, N'Sore - Remix', N'7nLNOyevGxrRJnC5OhGyyc', 10156)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10159, N'La kiffance', N'1bwhDrXcAtqePp8mNJ0pTe', 10157)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10160, N'Dimension (feat. Skepta & Rema)', N'2Jy4EdqIZswDZvVDh5dx3A', 10158)
INSERT [dbo].[Song] ([SongId], [Name], [SpotifySongString], [AlbumId]) VALUES (10161, N'Love Tonight - Edit', N'6OufwUcCqo81guU2jAlDVP', 10159)
SET IDENTITY_INSERT [dbo].[Song] OFF
GO
SET IDENTITY_INSERT [dbo].[Userapp] ON 

INSERT [dbo].[Userapp] ([UserappId], [Login], [Password], [Role]) VALUES (1, N'toto', N'$2a$12$WwkwL0/yOVXajo42TpwWKOrwVYppL081Xnl3srM.8RzUEzHCfyzq.', N'user')
INSERT [dbo].[Userapp] ([UserappId], [Login], [Password], [Role]) VALUES (2, N'toto2', N'helloworld', N'user')
INSERT [dbo].[Userapp] ([UserappId], [Login], [Password], [Role]) VALUES (3, N'toto2', N'$2a$12$x5NQ7IYUMghvYIB5Hd84WuqfuvQfjMAkffsOyCtaOCD5kstftxbrG', N'user')
INSERT [dbo].[Userapp] ([UserappId], [Login], [Password], [Role]) VALUES (4, N'toto2', N'$2a$12$GMaprBtOyXBPNaM0Dyw3.OkkcW5WW1NIeCSmNWssLAez0yDJQC0OC', N'user')
INSERT [dbo].[Userapp] ([UserappId], [Login], [Password], [Role]) VALUES (5, N'toto3', N'$2a$12$kN0RImSYyvo370/V15msUufoA1vrw1O92GUPr4fkfz2Yi8ZhGBjb6', N'user')
SET IDENTITY_INSERT [dbo].[Userapp] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Album]    Script Date: 28/09/2021 12:27:15 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [IX_Album] UNIQUE NONCLUSTERED 
(
	[SpotifyAlbumString] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Artist]    Script Date: 28/09/2021 12:27:15 ******/
ALTER TABLE [dbo].[Artist] ADD  CONSTRAINT [IX_Artist] UNIQUE NONCLUSTERED 
(
	[SpotifyArtistString] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Playlist]    Script Date: 28/09/2021 12:27:15 ******/
ALTER TABLE [dbo].[Playlist] ADD  CONSTRAINT [IX_Playlist] UNIQUE NONCLUSTERED 
(
	[SpotifyPlString] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Song]    Script Date: 28/09/2021 12:27:15 ******/
ALTER TABLE [dbo].[Song] ADD  CONSTRAINT [IX_Song] UNIQUE NONCLUSTERED 
(
	[SpotifySongString] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArtistSong]  WITH CHECK ADD  CONSTRAINT [FK_ArtistSong_Artist1] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([ArtistId])
GO
ALTER TABLE [dbo].[ArtistSong] CHECK CONSTRAINT [FK_ArtistSong_Artist1]
GO
ALTER TABLE [dbo].[ArtistSong]  WITH CHECK ADD  CONSTRAINT [FK_ArtistSong_Song1] FOREIGN KEY([SongId])
REFERENCES [dbo].[Song] ([SongId])
GO
ALTER TABLE [dbo].[ArtistSong] CHECK CONSTRAINT [FK_ArtistSong_Song1]
GO
ALTER TABLE [dbo].[PlaylistSong]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistSong_Playlist] FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlist] ([PlaylistId])
GO
ALTER TABLE [dbo].[PlaylistSong] CHECK CONSTRAINT [FK_PlaylistSong_Playlist]
GO
ALTER TABLE [dbo].[PlaylistSong]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistSong_Song] FOREIGN KEY([SongId])
REFERENCES [dbo].[Song] ([SongId])
GO
ALTER TABLE [dbo].[PlaylistSong] CHECK CONSTRAINT [FK_PlaylistSong_Song]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK_Song_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Album] ([AlbumId])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK_Song_Album]
GO
USE [master]
GO
ALTER DATABASE [spotify] SET  READ_WRITE 
GO
