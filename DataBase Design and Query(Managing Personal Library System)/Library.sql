USE [master]
GO
/****** Object:  Database [Book_List]    Script Date: 6/6/2017 10:19:36 AM ******/
CREATE DATABASE [Book_List]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookList', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookList.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookList_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookList_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Book_List] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Book_List].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Book_List] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Book_List] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Book_List] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Book_List] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Book_List] SET ARITHABORT OFF 
GO
ALTER DATABASE [Book_List] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Book_List] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Book_List] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Book_List] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Book_List] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Book_List] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Book_List] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Book_List] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Book_List] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Book_List] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Book_List] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Book_List] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Book_List] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Book_List] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Book_List] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Book_List] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Book_List] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Book_List] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Book_List] SET  MULTI_USER 
GO
ALTER DATABASE [Book_List] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Book_List] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Book_List] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Book_List] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Book_List] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Book_List]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] NOT NULL,
	[FirstName] [char](50) NOT NULL,
	[LastName] [char](50) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookList]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookList](
	[BookID] [int] NOT NULL,
	[BookTitle] [char](100) NOT NULL,
	[AuthoreID] [int] NOT NULL,
	[BookType] [char](50) NOT NULL,
	[Price] [money] NOT NULL,
	[VersionID] [int] NOT NULL,
	[OwnershipID] [int] NOT NULL,
	[PublisherID] [int] NOT NULL,
 CONSTRAINT [PK_BookList] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BorrowedBook]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BorrowedBook](
	[BorrowedBookID] [int] NOT NULL,
	[BookTitle] [char](100) NOT NULL,
	[PersonName] [char](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Phone] [char](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[OwnershipID] [int] NOT NULL,
 CONSTRAINT [PK_BorrowedBook] PRIMARY KEY CLUSTERED 
(
	[BorrowedBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LentBook]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LentBook](
	[LentBookID] [int] NOT NULL,
	[BookTitle] [char](100) NOT NULL,
	[PersonName] [char](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Phone] [char](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[OwnershipID] [int] NOT NULL,
 CONSTRAINT [PK_LentBook] PRIMARY KEY CLUSTERED 
(
	[LentBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ownership]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ownership](
	[OwnershipID] [int] NOT NULL,
	[Ownership] [char](50) NOT NULL,
 CONSTRAINT [PK_Ownership] PRIMARY KEY CLUSTERED 
(
	[OwnershipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherID] [int] NOT NULL,
	[PublisherName] [char](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Version]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Version](
	[VersionID] [int] NOT NULL,
	[Version] [char](50) NOT NULL,
 CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED 
(
	[VersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Query_1]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Query_1]
AS
SELECT TOP (100) PERCENT dbo.BookList.BookTitle, dbo.Author.FirstName + ' ' + dbo.Author.LastName AS 'Author Name', dbo.Ownership.Ownership
FROM  dbo.BookList INNER JOIN
         dbo.Author ON dbo.BookList.AuthoreID = dbo.Author.AuthorID INNER JOIN
         dbo.Ownership ON dbo.BookList.OwnershipID = dbo.Ownership.OwnershipID
WHERE (dbo.Ownership.Ownership = 'Borrowed')
ORDER BY dbo.BookList.BookTitle

GO
/****** Object:  View [dbo].[Query_2]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Query_2]
AS
SELECT TOP (100) PERCENT dbo.BookList.BookTitle, dbo.Author.FirstName + ' ' + dbo.Author.LastName AS 'Author Name', dbo.BookList.BookType
FROM  dbo.BookList INNER JOIN
         dbo.Author ON dbo.BookList.AuthoreID = dbo.Author.AuthorID
WHERE (dbo.BookList.BookType = 'Novel')
ORDER BY dbo.Author.FirstName

GO
/****** Object:  View [dbo].[Query_3]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Query_3]
AS
SELECT TOP (100) PERCENT dbo.BookList.BookTitle, dbo.BookList.Price, dbo.Ownership.Ownership
FROM  dbo.BookList INNER JOIN
         dbo.Ownership ON dbo.BookList.OwnershipID = dbo.Ownership.OwnershipID
WHERE (dbo.Ownership.Ownership = 'lended')
ORDER BY dbo.BookList.BookTitle

GO
/****** Object:  View [dbo].[Query_4]    Script Date: 6/6/2017 10:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Query_4]
AS
SELECT TOP (100) PERCENT dbo.BookList.BookTitle, dbo.Author.FirstName + '' + dbo.Author.LastName AS 'Author Name', dbo.Publisher.PublisherName
FROM  dbo.BookList INNER JOIN
         dbo.Author ON dbo.BookList.AuthoreID = dbo.Author.AuthorID INNER JOIN
         dbo.Publisher ON dbo.BookList.PublisherID = dbo.Publisher.PublisherID
ORDER BY dbo.BookList.BookTitle

GO
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (1, N'Humayun                                           ', N'Ahmed                                             ')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (2, N'Sharatchandra                                     ', N'Chattopaddhay                                     ')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (3, N'Muhammed                                          ', N'Zafar Iqbal                                       ')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (4, N'Samaresh                                          ', N'Majumder                                          ')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (5, N'Rakib                                             ', N'Hasan                                             ')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (6, N'Taslima                                           ', N'Nasrin                                            ')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (7, N'Jahanara                                          ', N'Imam                                              ')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (8, N'Anisul                                            ', N'Haque                                             ')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (9, N'Maxim                                             ', N'Gorky                                             ')
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (1, N'Aguner poroshmoni                                                                                   ', 1, N'Novel                                             ', 200.0000, 1, 1, 3)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (2, N'Aaj Dupure Tomar Nimantron                                                                          ', 1, N'Story                                             ', 200.0000, 2, 2, 3)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (3, N'Chayabithi                                                                                          ', 1, N'Novel                                             ', 200.0000, 1, 1, 9)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (4, N'Fiha Somikoron                                                                                      ', 1, N'Science Fiction Novel                             ', 150.0000, 1, 1, 1)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (5, N'Himu                                                                                                ', 1, N'Novel                                             ', 150.0000, 1, 1, 3)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (6, N'Himu Remand-E                                                                                       ', 1, N'Novel                                             ', 150.0000, 1, 1, 3)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (7, N'Jochna O Jononir Golpo                                                                              ', 1, N'Novel                                             ', 550.0000, 1, 1, 3)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (8, N'Megher Chaya                                                                                        ', 1, N'Novel                                             ', 150.0000, 1, 1, 11)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (9, N'Misir Alir Amimangsito Rahasya                                                                      ', 1, N'Science Fiction (Series)                          ', 250.0000, 1, 2, 3)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (10, N'Rupar Palonko                                                                                       ', 1, N'Novel                                             ', 200.0000, 1, 1, 3)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (11, N'Bamuner Meye                                                                                        ', 2, N'Novel                                             ', 200.0000, 1, 1, 2)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (12, N'Bipradas                                                                                            ', 2, N'Novel                                             ', 150.0000, 1, 1, 12)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (13, N'Datta                                                                                               ', 2, N'Novel                                             ', 300.0000, 1, 1, 12)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (14, N'Dena Paona                                                                                          ', 2, N'Novel                                             ', 215.0000, 1, 1, 2)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (15, N'Palli Samaj                                                                                         ', 2, N'Novel                                             ', 175.0000, 2, 1, 2)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (16, N'Parineeta                                                                                           ', 2, N'Novel                                             ', 200.0000, 1, 1, 12)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (17, N'Mahesh                                                                                              ', 2, N'Story                                             ', 250.0000, 1, 1, 2)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (18, N'Mejdidi                                                                                             ', 2, N'Story                                             ', 300.0000, 1, 1, 12)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (19, N'Pather Dabi                                                                                         ', 2, N'Novel                                             ', 150.0000, 1, 1, 12)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (20, N'Animan                                                                                              ', 3, N'Science Fiction                                   ', 225.0000, 1, 1, 15)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (21, N'Adh Dozon School                                                                                    ', 3, N'Juvenile Novel                                    ', 125.0000, 1, 1, 14)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (22, N'Amar Bondhu Rasherd                                                                                 ', 3, N'Juvenile Novel                                    ', 150.0000, 1, 2, 6)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (23, N'Cromium Oronno                                                                                      ', 3, N'Science Fiction                                   ', 140.0000, 1, 1, 15)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (24, N'Copotronic Shukh-Dukkho                                                                             ', 3, N'Science Fiction                                   ', 100.0000, 1, 1, 5)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (25, N'Ekjon Otumanobi                                                                                     ', 3, N'Science Fiction                                   ', 100.0000, 2, 1, 15)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (26, N'Eron                                                                                                ', 3, N'Science Fiction                                   ', 140.0000, 1, 1, 15)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (27, N'Hat Kata Robin                                                                                      ', 3, N'Juvenile Novel                                    ', 160.0000, 1, 1, 8)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (28, N'Meku Kahini                                                                                         ', 3, N'Story                                             ', 160.0000, 1, 1, 4)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (29, N'Meyetir Nam Narina                                                                                  ', 3, N'Science Fiction                                   ', 200.0000, 1, 1, 9)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (30, N'Pri                                                                                                 ', 3, N'Science Fiction                                   ', 120.0000, 1, 1, 15)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (31, N'Uttaradhikar                                                                                        ', 4, N'Novel                                             ', 350.0000, 1, 1, 2)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (32, N'Kaalbela                                                                                            ', 4, N'Novel                                             ', 350.0000, 1, 1, 2)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (33, N'Kalpurush                                                                                           ', 4, N'Novel                                             ', 350.0000, 1, 1, 2)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (34, N'Shatkahon                                                                                           ', 4, N'Novel                                             ', 500.0000, 1, 1, 2)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (35, N'Gorvodharini                                                                                        ', 4, N'Novel                                             ', 630.0000, 1, 1, 2)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (36, N'Aat Kuthuri Noy Dorja                                                                               ', 4, N'Novel                                             ', 500.0000, 1, 1, 2)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (37, N'Tin Goyenda                                                                                         ', 5, N'Juvenile Detective                                ', 75.0000, 1, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (38, N'Rupali Makorsha                                                                                     ', 5, N'Juvenile Detective                                ', 75.0000, 1, 3, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (39, N'Momee                                                                                               ', 5, N'Juvenile Detective                                ', 75.0000, 1, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (40, N'Rotnodano                                                                                           ', 5, N'Juvenile Detective                                ', 75.0000, 2, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (41, N'Roktochokkhu                                                                                        ', 5, N'Juvenile Detective                                ', 75.0000, 2, 3, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (42, N'Jolo Doshyur Dip 1,2                                                                                ', 5, N'Juvenile Detective                                ', 75.0000, 2, 3, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (43, N'Mukto Shikary                                                                                       ', 5, N'Juvenile Detective                                ', 75.0000, 2, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (44, N'Kakatua Rohossho                                                                                    ', 5, N'Juvenile Detective                                ', 75.0000, 1, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (45, N'Bhuter Hashi                                                                                        ', 5, N'Juvenile Detective                                ', 75.0000, 1, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (46, N'Vishon Arunno 1 & 2                                                                                 ', 5, N'Juvenile Detective                                ', 75.0000, 1, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (47, N'Guhamanob                                                                                           ', 5, N'Juvenile Detective                                ', 75.0000, 1, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (48, N'Purono Shotru                                                                                       ', 5, N'Juvenile Detective                                ', 75.0000, 1, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (49, N'Dhakay Tin Goyenda                                                                                  ', 5, N'Juvenile Detective                                ', 75.0000, 1, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (50, N'Shingher Gorjon                                                                                     ', 5, N'Juvenile Detective                                ', 75.0000, 1, 1, 13)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (51, N'Phera                                                                                               ', 6, N'Novel                                             ', 200.0000, 1, 1, 16)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (52, N'Nirbasan                                                                                            ', 6, N'Autobiography                                     ', 250.0000, 1, 3, 10)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (53, N'Ekattorer Dingulee                                                                                  ', 7, N'Liberation War Memoir                             ', 300.0000, 1, 2, 7)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (54, N'Maa                                                                                                 ', 8, N'Liberation War Memoir                             ', 300.0000, 1, 3, 15)
INSERT [dbo].[BookList] ([BookID], [BookTitle], [AuthoreID], [BookType], [Price], [VersionID], [OwnershipID], [PublisherID]) VALUES (55, N'Mother                                                                                              ', 9, N'Novel                                             ', 500.0000, 3, 1, 17)
INSERT [dbo].[BorrowedBook] ([BorrowedBookID], [BookTitle], [PersonName], [Address], [Phone], [Email], [OwnershipID]) VALUES (1, N'Aaj Dupure Tomar Nimantron                                                                          ', N'Sabiha Tanzim                                     ', N'63 Rail Road, Jessore, Bangladesh', N'01913019722                                       ', N'sabiha12@gmail.com', 2)
INSERT [dbo].[BorrowedBook] ([BorrowedBookID], [BookTitle], [PersonName], [Address], [Phone], [Email], [OwnershipID]) VALUES (2, N'Misir Alir Amimangsito Rahasya                                                                      ', N'Sharmin Sultana                                   ', N'102/4 Ghop, Jessore, Bangladesh', N'01813017652                                       ', N'happy.sharmin@gmail.com', 2)
INSERT [dbo].[BorrowedBook] ([BorrowedBookID], [BookTitle], [PersonName], [Address], [Phone], [Email], [OwnershipID]) VALUES (3, N'Amar Bondhu Rasherd                                                                                 ', N'Tanisha Tasnim                                    ', N'64/9 Modhubagh, Dhaka, Bangladesh', N'01712446672                                       ', N'tanisha_tasnim@yahoo.com', 2)
INSERT [dbo].[BorrowedBook] ([BorrowedBookID], [BookTitle], [PersonName], [Address], [Phone], [Email], [OwnershipID]) VALUES (4, N'Ekattorer Dingulee                                                                                  ', N'Mafruha Lubla                                     ', N'350 Police-Line Road, Rasulpur, Satkhira, Bangladesh', N'01716569126                                       ', N'mlubna@gmail.com', 2)
INSERT [dbo].[LentBook] ([LentBookID], [BookTitle], [PersonName], [Address], [Phone], [Email], [OwnershipID]) VALUES (1, N'Rupali Makorsha                                                                                     ', N'Tania Afrin                                       ', N'House # 16, Road # 5, Stadium Para, Jessore, Bangladesh', N'019167863823                                      ', N'afrin_tania@yahoo.com', 3)
INSERT [dbo].[LentBook] ([LentBookID], [BookTitle], [PersonName], [Address], [Phone], [Email], [OwnershipID]) VALUES (2, N'Roktochokkhu                                                                                        ', N'Fatema Khatun                                     ', N'16/kha, Barandi Para, Jessore, Bangladesh', N'01718487481                                       ', N'f.k.shumi@gmail.com', 3)
INSERT [dbo].[LentBook] ([LentBookID], [BookTitle], [PersonName], [Address], [Phone], [Email], [OwnershipID]) VALUES (3, N'Jolo Doshyur Dip 1,2                                                                                ', N'Farjana Ferdous                                   ', N'74 Ring Road, Mohammadpur, Dhaka, Bangladesh', N'01712548548                                       ', N'bobyhalum@yahoo.com', 3)
INSERT [dbo].[LentBook] ([LentBookID], [BookTitle], [PersonName], [Address], [Phone], [Email], [OwnershipID]) VALUES (4, N'Nirbasan                                                                                            ', N'Sk Masud Rana                                     ', N'69/2 Link Road, Gulshan 1, Dhaka, Bangladesh', N'01611986642                                       ', N'masud.ece@gmail.com', 3)
INSERT [dbo].[LentBook] ([LentBookID], [BookTitle], [PersonName], [Address], [Phone], [Email], [OwnershipID]) VALUES (5, N'Maa                                                                                                 ', N'Abdul Monayem                                     ', N'34/6, Shankarpur, Jessore, Bangladesh', N'01812698731                                       ', N'N/A', 3)
INSERT [dbo].[Ownership] ([OwnershipID], [Ownership]) VALUES (1, N'SelfOwned                                         ')
INSERT [dbo].[Ownership] ([OwnershipID], [Ownership]) VALUES (2, N'Borrowed                                          ')
INSERT [dbo].[Ownership] ([OwnershipID], [Ownership]) VALUES (3, N'Lended                                            ')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (1, N'Afsar Brothers                                    ', N'38/4, Banglabazar, Dhaka-1100, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (2, N'Ananda Publishers Pvt Ltd                         ', N'45, Beniatola Ln, College Row, College Street, Kolkata, West Bengal 700009, India')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (3, N'Annyaprokash                                      ', N'69/F, Green Road, Panthapath, Dhaka, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (4, N'Anupam Prokashoni                                 ', N'38/4, banglabazar, 1100, Dhaka, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (5, N'Gyankosh                                          ', N'House # 7, Mumtaj Plaza, Dhanmondi, Road # 4, Dhaka-1205, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (6, N'Kakoli Prokashoni                                 ', N'38/4, Banglabazar, Dhaka-1100, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (7, N'Shandhani Prakashani                              ', N'N/A')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (8, N'Mowla Brothers                                    ', N'28 Tipu Sultan Road, Dhaka 1100, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (9, N'Pearl Publications                                ', N'38/2 Banglabazar Dhaka-1100')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (10, N'People Book Society                               ', N'155, Dhaka New Market, Dhaka-1205, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (11, N'Protik                                            ', N'46/1 Hemendra Das Road, Shutrapur, Dhaka-1100, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (12, N'Roy M. C. Sarkar Bahadur & Sons                   ', N'14, Bankim Chatterjee Street, Kolkata - 700073, India')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (13, N'Sheba Prokashoni                                  ', N'24/4, Shahid Sayed Nazrul Islam Sharani, Shegunbagicha, Dhaka-1000, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (14, N'Shikha Prokashoni                                 ', N'38/2 Kha Banglabazar, Dhaka-1100, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (15, N'Somoy Prokashon                                   ', N'38/2 Kha Banglabazar, Dhaka-1100, Bangladesh')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (16, N'Srishti Publishers & Distributors                 ', N'212 A, Peacock Lane, Shahpur Jat, New Delhi 110049, India')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (17, N'Citadel                                           ', N'N/A')
INSERT [dbo].[Version] ([VersionID], [Version]) VALUES (1, N'PhysicalCopy                                      ')
INSERT [dbo].[Version] ([VersionID], [Version]) VALUES (2, N'eCopy                                             ')
INSERT [dbo].[Version] ([VersionID], [Version]) VALUES (3, N'Both                                              ')
ALTER TABLE [dbo].[BookList]  WITH CHECK ADD  CONSTRAINT [FK_BookList_Author] FOREIGN KEY([AuthoreID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[BookList] CHECK CONSTRAINT [FK_BookList_Author]
GO
ALTER TABLE [dbo].[BookList]  WITH CHECK ADD  CONSTRAINT [FK_BookList_Ownership] FOREIGN KEY([OwnershipID])
REFERENCES [dbo].[Ownership] ([OwnershipID])
GO
ALTER TABLE [dbo].[BookList] CHECK CONSTRAINT [FK_BookList_Ownership]
GO
ALTER TABLE [dbo].[BookList]  WITH CHECK ADD  CONSTRAINT [FK_BookList_Publisher] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([PublisherID])
GO
ALTER TABLE [dbo].[BookList] CHECK CONSTRAINT [FK_BookList_Publisher]
GO
ALTER TABLE [dbo].[BookList]  WITH CHECK ADD  CONSTRAINT [FK_BookList_Version] FOREIGN KEY([VersionID])
REFERENCES [dbo].[Version] ([VersionID])
GO
ALTER TABLE [dbo].[BookList] CHECK CONSTRAINT [FK_BookList_Version]
GO
ALTER TABLE [dbo].[BorrowedBook]  WITH CHECK ADD  CONSTRAINT [FK_BorrowedBook_Ownership] FOREIGN KEY([OwnershipID])
REFERENCES [dbo].[Ownership] ([OwnershipID])
GO
ALTER TABLE [dbo].[BorrowedBook] CHECK CONSTRAINT [FK_BorrowedBook_Ownership]
GO
ALTER TABLE [dbo].[LentBook]  WITH CHECK ADD  CONSTRAINT [FK_LentBook_Ownership] FOREIGN KEY([OwnershipID])
REFERENCES [dbo].[Ownership] ([OwnershipID])
GO
ALTER TABLE [dbo].[LentBook] CHECK CONSTRAINT [FK_LentBook_Ownership]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BookList"
            Begin Extent = 
               Top = 12
               Left = 76
               Bottom = 259
               Right = 351
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Author"
            Begin Extent = 
               Top = 12
               Left = 427
               Bottom = 225
               Right = 702
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ownership"
            Begin Extent = 
               Top = 12
               Left = 778
               Bottom = 191
               Right = 1053
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Query_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Query_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BookList"
            Begin Extent = 
               Top = 12
               Left = 76
               Bottom = 259
               Right = 351
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Author"
            Begin Extent = 
               Top = 12
               Left = 427
               Bottom = 225
               Right = 702
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Query_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Query_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BookList"
            Begin Extent = 
               Top = 12
               Left = 76
               Bottom = 259
               Right = 351
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ownership"
            Begin Extent = 
               Top = 12
               Left = 427
               Bottom = 191
               Right = 702
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Query_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Query_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BookList"
            Begin Extent = 
               Top = 12
               Left = 76
               Bottom = 259
               Right = 351
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Author"
            Begin Extent = 
               Top = 12
               Left = 427
               Bottom = 225
               Right = 702
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Publisher"
            Begin Extent = 
               Top = 12
               Left = 778
               Bottom = 225
               Right = 1056
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Query_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Query_4'
GO
USE [master]
GO
ALTER DATABASE [Book_List] SET  READ_WRITE 
GO
