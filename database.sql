USE [master]
GO
/****** Object:  Database [ContractManager]    Script Date: 3/8/2023 4:54:33 PM ******/
CREATE DATABASE [ContractManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContractManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ContractManager.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ContractManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ContractManager_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ContractManager] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContractManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContractManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContractManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContractManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContractManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContractManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContractManager] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ContractManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContractManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContractManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContractManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContractManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContractManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContractManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContractManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContractManager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ContractManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContractManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContractManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContractManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContractManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContractManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContractManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContractManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ContractManager] SET  MULTI_USER 
GO
ALTER DATABASE [ContractManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContractManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContractManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContractManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ContractManager] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ContractManager]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[ACID] [varchar](12) NULL,
	[password] [varchar](30) NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](30) NULL,
	[avartar] [varchar](50) NULL,
	[address1] [varchar](100) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BoardManager]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BoardManager](
	[BID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[BCID] [varchar](12) NULL,
	[password] [varchar](30) NULL,
	[dateOfBirth] [date] NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](30) NULL,
	[avartar] [varchar](50) NULL,
	[address1] [varchar](100) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[CoID] [int] IDENTITY(1,1) NOT NULL,
	[RoID] [int] NULL,
	[CID] [int] NULL,
	[RID] [int] NULL,
	[OID] [int] NULL,
	[SID] [int] NULL,
	[status] [int] NULL,
	[SignStatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContractImage]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContractImage](
	[CoID] [int] NOT NULL,
	[imgPath] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContractInformation]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContractInformation](
	[CoID] [int] NOT NULL,
	[fee] [int] NULL,
	[total] [int] NULL,
	[createDate] [date] NULL,
	[endDate] [date] NULL,
	[name] [varchar](100) NULL,
	[description] [varchar](5000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[CCID] [varchar](12) NULL,
	[password] [varchar](30) NULL,
	[dateOfBirth] [date] NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](30) NULL,
	[avartar] [varchar](50) NULL,
	[address1] [varchar](100) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Owner](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[OCID] [varchar](12) NULL,
	[password] [varchar](30) NULL,
	[dateOfBirth] [date] NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](30) NULL,
	[avartar] [varchar](50) NULL,
	[address1] [varchar](100) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Report]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[RpID] [int] IDENTITY(1,1) NOT NULL,
	[content] [text] NULL,
	[createDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resident]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resident](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[RCID] [varchar](12) NULL,
	[password] [varchar](30) NULL,
	[dateOfBirth] [date] NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](30) NULL,
	[avartar] [varchar](50) NULL,
	[address1] [varchar](100) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoID] [int] NOT NULL,
	[RID] [int] NULL,
	[OID] [int] NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seller]    Script Date: 3/8/2023 4:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seller](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[SCID] [varchar](12) NULL,
	[password] [varchar](30) NULL,
	[dateOfBirth] [date] NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](30) NULL,
	[avartar] [varchar](50) NULL,
	[address1] [varchar](100) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AID], [email], [ACID], [password], [fullname], [phone], [avartar], [address1], [status]) VALUES (1, N'admina@gmail.com', N'123123123123', N'123', N'Nguyen At Min A', N'123225', NULL, N'', 1)
INSERT [dbo].[Admin] ([AID], [email], [ACID], [password], [fullname], [phone], [avartar], [address1], [status]) VALUES (3, N'adminb@gmail.com', N'123123123111', N'123', N'Nguyen At Min BBBB', N'123', NULL, NULL, 1)
INSERT [dbo].[Admin] ([AID], [email], [ACID], [password], [fullname], [phone], [avartar], [address1], [status]) VALUES (10, N'adminh@gmail.com', N'111111111122', N'123456', N'Nguyen Van H', NULL, NULL, NULL, 1)
INSERT [dbo].[Admin] ([AID], [email], [ACID], [password], [fullname], [phone], [avartar], [address1], [status]) VALUES (11, N'hungphamphu159@gmail.com', NULL, N'123', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[BoardManager] ON 

INSERT [dbo].[BoardManager] ([BID], [email], [BCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (1, N'hoidonga@gmail.com', NULL, N'123', NULL, N'Hoi Dong A', NULL, NULL, NULL, 1)
INSERT [dbo].[BoardManager] ([BID], [email], [BCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (2, N'hoidongb@gmail.com', NULL, N'123', NULL, N'Hoi Dong B', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[BoardManager] OFF
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([CoID], [RoID], [CID], [RID], [OID], [SID], [status], [SignStatus]) VALUES (2, 2, 1, NULL, 1, 1, 0, 0)
INSERT [dbo].[Contract] ([CoID], [RoID], [CID], [RID], [OID], [SID], [status], [SignStatus]) VALUES (3, 3, NULL, 1, 1, NULL, 1, 3)
INSERT [dbo].[Contract] ([CoID], [RoID], [CID], [RID], [OID], [SID], [status], [SignStatus]) VALUES (4, 4, 1, NULL, 2, 2, 0, 1)
INSERT [dbo].[Contract] ([CoID], [RoID], [CID], [RID], [OID], [SID], [status], [SignStatus]) VALUES (5, 5, 1, NULL, 3, 1, 0, 2)
INSERT [dbo].[Contract] ([CoID], [RoID], [CID], [RID], [OID], [SID], [status], [SignStatus]) VALUES (6, 6, 2, NULL, 3, NULL, 0, 0)
INSERT [dbo].[Contract] ([CoID], [RoID], [CID], [RID], [OID], [SID], [status], [SignStatus]) VALUES (7, 7, NULL, NULL, 3, NULL, 0, 0)
INSERT [dbo].[Contract] ([CoID], [RoID], [CID], [RID], [OID], [SID], [status], [SignStatus]) VALUES (8, 8, NULL, 2, 1, NULL, 1, 3)
INSERT [dbo].[Contract] ([CoID], [RoID], [CID], [RID], [OID], [SID], [status], [SignStatus]) VALUES (10, 9, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contract] OFF
INSERT [dbo].[ContractInformation] ([CoID], [fee], [total], [createDate], [endDate], [name], [description]) VALUES (2, 10000, 500000, CAST(N'2023-02-10' AS Date), CAST(N'2025-02-10' AS Date), N'Hop Dong Thue Nha', N'Hop Dong thue nha ')
INSERT [dbo].[ContractInformation] ([CoID], [fee], [total], [createDate], [endDate], [name], [description]) VALUES (3, 200, 12000, CAST(N'2022-11-22' AS Date), CAST(N'2023-11-30' AS Date), N'Hop Dong Thue Nha', N'hop dong thue nha')
INSERT [dbo].[ContractInformation] ([CoID], [fee], [total], [createDate], [endDate], [name], [description]) VALUES (4, 1250, 11000, CAST(N'2019-03-07' AS Date), CAST(N'2025-05-05' AS Date), N'Hop Dong Thue Nha', N'hop dong thue nha')
INSERT [dbo].[ContractInformation] ([CoID], [fee], [total], [createDate], [endDate], [name], [description]) VALUES (5, 1250, 12000, CAST(N'2017-11-20' AS Date), CAST(N'2023-10-14' AS Date), N'Hop Dong Thue Nha', N'hop dong thue nha')
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CID], [email], [CCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (1, N'khachhanga@gmail.com', N'123123123000', N'123', CAST(N'2000-10-30' AS Date), N'Hung', N'123', N's', N'hcm', 1)
INSERT [dbo].[Customer] ([CID], [email], [CCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (2, N'khachhangb@gmail.com', N'123123123109', N'123', CAST(N'1999-05-02' AS Date), N'KhachHang B', N'123', N'abccc', N'asss', 1)
INSERT [dbo].[Customer] ([CID], [email], [CCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (3, N'khachhangc@gmail.com', N'123111111111', N'123', CAST(N'1998-01-01' AS Date), N'Khach Hang C', N'123', N'asdasd', N'asd', 0)
INSERT [dbo].[Customer] ([CID], [email], [CCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (5, N'khachhangd@gmail.com', N'123123123119', N'111111', CAST(N'2000-07-15' AS Date), N'Nguyen Van C', N'1234567891', NULL, N'HCM', 1)
INSERT [dbo].[Customer] ([CID], [email], [CCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (7, N'khachhangh@gmail.com', N'111111333333', N'123456', CAST(N'1997-11-21' AS Date), N'Nguyen Van H', N'1234567890', N'', N'HCM', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Owner] ON 

INSERT [dbo].[Owner] ([OID], [email], [OCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (1, N'chunhaa@gmail.com', N'093210932112', N'123', CAST(N'1900-01-01' AS Date), N'Chu Nha A', N'123', N'a', N'hcm', 1)
INSERT [dbo].[Owner] ([OID], [email], [OCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (2, N'chunhab@gmail.com', N'093210932166', N'123', CAST(N'1990-12-23' AS Date), N'Chu Nha B', N'123', N'b', N'jdkkkk', 1)
INSERT [dbo].[Owner] ([OID], [email], [OCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (3, N'chunhac@gmail.com', N'874328743287', N'123', CAST(N'1970-11-10' AS Date), N'Chu Nha C', N'123', N'd', N'okkkkko', 0)
INSERT [dbo].[Owner] ([OID], [email], [OCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (4, N'chunhad@gmail.com', N'123098456897', N'123', CAST(N'1920-10-10' AS Date), N'Chu Nha D', N'123', N'c', N'jkllkj', 1)
INSERT [dbo].[Owner] ([OID], [email], [OCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (5, N'chunhae@gmail.com', N'123456543123', N'123', CAST(N'2000-10-25' AS Date), N'Chu Nha E', N'123', N'e', N'ikkkk', 1)
SET IDENTITY_INSERT [dbo].[Owner] OFF
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([RpID], [content], [createDate]) VALUES (1, N'report', CAST(N'2023-03-01' AS Date))
INSERT [dbo].[Report] ([RpID], [content], [createDate]) VALUES (1, N'report', CAST(N'2023-03-01' AS Date))
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[Resident] ON 

INSERT [dbo].[Resident] ([RID], [email], [RCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (1, N'cudana@gmail.com', N'123123897987', N'123', CAST(N'1900-01-01' AS Date), N'Cu Dan A', N'123', N'', N'hcm', 1)
INSERT [dbo].[Resident] ([RID], [email], [RCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (2, N'cudanb@gmail.com', N'123987123987', N'123', NULL, N'Cu Dan B', N'123', NULL, NULL, 0)
INSERT [dbo].[Resident] ([RID], [email], [RCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (3, N'cudanc@gmail.com', N'123123123222', N'123', NULL, N'Cu Dan C', N'123', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Resident] OFF
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (2, NULL, 1, 0)
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (3, 1, 1, 1)
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (4, NULL, 2, 0)
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (5, NULL, 3, 0)
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (6, NULL, 3, 0)
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (7, NULL, 3, 0)
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (8, 2, 1, 1)
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (9, NULL, 2, 0)
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (10, 3, 2, 1)
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (11, NULL, 4, 0)
INSERT [dbo].[Room] ([RoID], [RID], [OID], [status]) VALUES (12, NULL, 5, 0)
SET IDENTITY_INSERT [dbo].[Seller] ON 

INSERT [dbo].[Seller] ([SID], [email], [SCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (1, N'moigioia@gmail.com', N'099009090909', N'123', CAST(N'1900-01-01' AS Date), N'Moi Gioi A', N'123', N'', N'HCM', 1)
INSERT [dbo].[Seller] ([SID], [email], [SCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (2, N'moigioib@gmail.com', N'232323232323', N'123', NULL, N'Moi Gioi B', N'123', NULL, NULL, 1)
INSERT [dbo].[Seller] ([SID], [email], [SCID], [password], [dateOfBirth], [fullname], [phone], [avartar], [address1], [status]) VALUES (3, N'moigioic@gmail.com', N'232323323232', N'123', NULL, N'Moi Gioi C', N'123', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Seller] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Admin__06FECA781C7EF3EC]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[ACID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Admin__06FECA787D0BF66A]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[ACID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Admin__AB6E616411390F76]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Admin__AB6E6164332E77E1]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__BoardMan__AB6E61645BD75B75]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[BoardManager] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__BoardMan__AB6E616490C18948]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[BoardManager] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Customer__A9561A4363899962]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[CCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Customer__A9561A439346CA14]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[CCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Customer__AB6E6164158859BE]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Customer__AB6E6164EBB01FC4]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Owner__A2E5E9DD117A33FA]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Owner] ADD UNIQUE NONCLUSTERED 
(
	[OCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Owner__A2E5E9DD44B6A849]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Owner] ADD UNIQUE NONCLUSTERED 
(
	[OCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Owner__AB6E616441AB1F3E]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Owner] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Owner__AB6E6164E9123F44]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Owner] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Resident__45CAE2101769D7F7]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Resident] ADD UNIQUE NONCLUSTERED 
(
	[RCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Resident__45CAE210A0EB1003]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Resident] ADD UNIQUE NONCLUSTERED 
(
	[RCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Resident__AB6E61642E643392]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Resident] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Seller__AB6E616465287C32]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Seller] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Seller__F7FE93ADC87D568C]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Seller] ADD UNIQUE NONCLUSTERED 
(
	[SCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Seller__F7FE93ADF4AF9E84]    Script Date: 3/8/2023 4:54:33 PM ******/
ALTER TABLE [dbo].[Seller] ADD UNIQUE NONCLUSTERED 
(
	[SCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[Customer] ([CID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[Customer] ([CID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[Customer] ([CID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[Customer] ([CID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([OID])
REFERENCES [dbo].[Owner] ([OID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([OID])
REFERENCES [dbo].[Owner] ([OID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([OID])
REFERENCES [dbo].[Owner] ([OID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([OID])
REFERENCES [dbo].[Owner] ([OID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Resident] ([RID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Resident] ([RID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Resident] ([RID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Resident] ([RID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([RoID])
REFERENCES [dbo].[Room] ([RoID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([RoID])
REFERENCES [dbo].[Room] ([RoID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([SID])
REFERENCES [dbo].[Seller] ([SID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([SID])
REFERENCES [dbo].[Seller] ([SID])
GO
ALTER TABLE [dbo].[ContractImage]  WITH CHECK ADD FOREIGN KEY([CoID])
REFERENCES [dbo].[Contract] ([CoID])
GO
ALTER TABLE [dbo].[ContractImage]  WITH CHECK ADD FOREIGN KEY([CoID])
REFERENCES [dbo].[Contract] ([CoID])
GO
ALTER TABLE [dbo].[ContractInformation]  WITH CHECK ADD FOREIGN KEY([CoID])
REFERENCES [dbo].[Contract] ([CoID])
GO
ALTER TABLE [dbo].[ContractInformation]  WITH CHECK ADD FOREIGN KEY([CoID])
REFERENCES [dbo].[Contract] ([CoID])
GO
ALTER TABLE [dbo].[ContractInformation]  WITH CHECK ADD FOREIGN KEY([CoID])
REFERENCES [dbo].[Contract] ([CoID])
GO
ALTER TABLE [dbo].[ContractInformation]  WITH CHECK ADD FOREIGN KEY([CoID])
REFERENCES [dbo].[Contract] ([CoID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[Customer] ([CID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[Customer] ([CID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([OID])
REFERENCES [dbo].[Owner] ([OID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([OID])
REFERENCES [dbo].[Owner] ([OID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Resident] ([RID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Resident] ([RID])
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[BoardManager]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[BoardManager]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Resident]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Resident]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Seller]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Seller]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
USE [master]
GO
ALTER DATABASE [ContractManager] SET  READ_WRITE 
GO
