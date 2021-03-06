USE [master]
GO
/****** Object:  Database [WebsiteHealthMonitor]    Script Date: 19.5.2016 11:28:29 ******/
CREATE DATABASE [WebsiteHealthMonitor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebsiteHealthMonitor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WebsiteHealthMonitor.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebsiteHealthMonitor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WebsiteHealthMonitor_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebsiteHealthMonitor] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteHealthMonitor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteHealthMonitor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteHealthMonitor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebsiteHealthMonitor] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WebsiteHealthMonitor]
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 19.5.2016 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblCustomer_ID]  DEFAULT (newid()),
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTest]    Script Date: 19.5.2016 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [uniqueidentifier] NOT NULL,
	[URL] [varchar](200) NOT NULL,
	[Name] [varchar](100) NULL,
	[ExpectedResponse] [text] NULL,
	[AvailabilityTest] [bit] NULL,
	[DateCreated] [smalldatetime] NOT NULL CONSTRAINT [DF_tblTest_DateCreated]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblTest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTestResult]    Script Date: 19.5.2016 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTestResult](
	[TestID] [int] NOT NULL,
	[SuccessID] [int] NOT NULL,
	[ErrorMessage] [varchar](100) NULL,
	[DateCreated] [smalldatetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCustomer] ([ID], [Name], [Email], [DateCreated]) VALUES (N'eae35ba5-e193-4d28-a4d2-99876f9855e1', N'Hatice', N'h@v.com', CAST(N'2016-01-27 16:22:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tblTest] ON 

INSERT [dbo].[tblTest] ([ID], [Customer_ID], [URL], [Name], [ExpectedResponse], [AvailabilityTest], [DateCreated]) VALUES (1, N'eae35ba5-e193-4d28-a4d2-99876f9855e1', N'sdfsdf', N'dsfsf', N'dfsf', 1, CAST(N'2016-05-19 11:13:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tblTest] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UniqueRule_tblCustomer]    Script Date: 19.5.2016 11:28:30 ******/
ALTER TABLE [dbo].[tblCustomer] ADD  CONSTRAINT [UniqueRule_tblCustomer] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTestResult] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[tblTest]  WITH CHECK ADD  CONSTRAINT [FK__tblTest__Custome__1DE57479] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[tblCustomer] ([ID])
GO
ALTER TABLE [dbo].[tblTest] CHECK CONSTRAINT [FK__tblTest__Custome__1DE57479]
GO
ALTER TABLE [dbo].[tblTestResult]  WITH CHECK ADD FOREIGN KEY([TestID])
REFERENCES [dbo].[tblTest] ([ID])
GO
USE [master]
GO
ALTER DATABASE [WebsiteHealthMonitor] SET  READ_WRITE 
GO
