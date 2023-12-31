USE [master]
GO
/****** Object:  Database [JqueryAjaxProject]    Script Date: 30.11.2023 01:29:05 ******/
CREATE DATABASE [JqueryAjaxProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JqueryAjaxProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FURKANKILIC\MSSQL\DATA\JqueryAjaxProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JqueryAjaxProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FURKANKILIC\MSSQL\DATA\JqueryAjaxProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [JqueryAjaxProject] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JqueryAjaxProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JqueryAjaxProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JqueryAjaxProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JqueryAjaxProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JqueryAjaxProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JqueryAjaxProject] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [JqueryAjaxProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET RECOVERY FULL 
GO
ALTER DATABASE [JqueryAjaxProject] SET  MULTI_USER 
GO
ALTER DATABASE [JqueryAjaxProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JqueryAjaxProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JqueryAjaxProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JqueryAjaxProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JqueryAjaxProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JqueryAjaxProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JqueryAjaxProject', N'ON'
GO
ALTER DATABASE [JqueryAjaxProject] SET QUERY_STORE = ON
GO
ALTER DATABASE [JqueryAjaxProject] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [JqueryAjaxProject]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30.11.2023 01:29:05 ******/
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
/****** Object:  Table [dbo].[categories]    Script Date: 30.11.2023 01:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 30.11.2023 01:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companies](
	[CompanyNo] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ContactName] [nvarchar](max) NOT NULL,
	[ContactPhone] [nvarchar](max) NOT NULL,
	[TaxAdministration] [nvarchar](max) NULL,
 CONSTRAINT [PK_companies] PRIMARY KEY CLUSTERED 
(
	[CompanyNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 30.11.2023 01:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](max) NULL,
	[EmployeeTitle] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[EmployeeStartDate] [datetime2](7) NOT NULL,
	[EmployeeCompany] [nvarchar](max) NULL,
	[EmployeeSalary] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 30.11.2023 01:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[StockCode] [nvarchar](max) NOT NULL,
	[Barcode] [nvarchar](max) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Brand] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userrs]    Script Date: 30.11.2023 01:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userrs](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserNamee] [nvarchar](max) NOT NULL,
	[EMail] [nvarchar](450) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Passwordd] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsRemember] [bit] NOT NULL,
 CONSTRAINT [PK_userrs] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231127192543_init', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231129152516_add-migrations', N'6.0.25')
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([CategoryId], [CategoryName], [Description]) VALUES (1, N'Electronics', N'Devices that use electronic circuits to perform their functions.')
INSERT [dbo].[categories] ([CategoryId], [CategoryName], [Description]) VALUES (2, N'Clothing', N'Items worn on the body.')
INSERT [dbo].[categories] ([CategoryId], [CategoryName], [Description]) VALUES (3, N'Books', N'Printed or written works.')
INSERT [dbo].[categories] ([CategoryId], [CategoryName], [Description]) VALUES (4, N'Home and Garden', N'Items related to household and outdoor spaces.')
INSERT [dbo].[categories] ([CategoryId], [CategoryName], [Description]) VALUES (5, N'Sports', N'Activities that involve physical exertion and skill.')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[companies] ON 

INSERT [dbo].[companies] ([CompanyNo], [CompanyName], [Description], [ContactName], [ContactPhone], [TaxAdministration]) VALUES (1, N'ABC Electronics', N'Electronic devices manufacturer', N'John Doe', N'555-1234', N'XYZ Tax Office')
INSERT [dbo].[companies] ([CompanyNo], [CompanyName], [Description], [ContactName], [ContactPhone], [TaxAdministration]) VALUES (2, N'Fashion Paradise', N'Clothing and fashion retailer', N'Jane Smith', N'555-5678', N'ABC Tax Office')
INSERT [dbo].[companies] ([CompanyNo], [CompanyName], [Description], [ContactName], [ContactPhone], [TaxAdministration]) VALUES (3, N'Book Haven', N'Bookstore and publishing', N'Michael Johnson', N'555-9876', N'DEF Tax Office')
INSERT [dbo].[companies] ([CompanyNo], [CompanyName], [Description], [ContactName], [ContactPhone], [TaxAdministration]) VALUES (4, N'Green Thumb Gardening', N'Landscaping and gardening services', N'Emily Green', N'555-5432', N'GHI Tax Office')
INSERT [dbo].[companies] ([CompanyNo], [CompanyName], [Description], [ContactName], [ContactPhone], [TaxAdministration]) VALUES (5, N'Sports World', N'Sports equipment and apparel', N'Robert Williams', N'555-8765', N'JKL Tax Office')
SET IDENTITY_INSERT [dbo].[companies] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([EmployeeId], [EmployeeName], [EmployeeTitle], [PhoneNumber], [EmployeeStartDate], [EmployeeCompany], [EmployeeSalary]) VALUES (1, N'Alice Johnson', N'Software Developer', N'555-1111', CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), N'5', CAST(60000.00 AS Decimal(18, 2)))
INSERT [dbo].[employees] ([EmployeeId], [EmployeeName], [EmployeeTitle], [PhoneNumber], [EmployeeStartDate], [EmployeeCompany], [EmployeeSalary]) VALUES (2, N'Bob Smith', N'Sales Representative', N'555-2222', CAST(N'2023-02-15T00:00:00.0000000' AS DateTime2), N'5', CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[employees] ([EmployeeId], [EmployeeName], [EmployeeTitle], [PhoneNumber], [EmployeeStartDate], [EmployeeCompany], [EmployeeSalary]) VALUES (3, N'Charlie Brown', N'HR Specialist', N'555-3333', CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'2', CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[employees] ([EmployeeId], [EmployeeName], [EmployeeTitle], [PhoneNumber], [EmployeeStartDate], [EmployeeCompany], [EmployeeSalary]) VALUES (4, N'Diana Johnson', N'Marketing Manager', N'555-4444', CAST(N'2023-04-10T00:00:00.0000000' AS DateTime2), N'2', CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[employees] ([EmployeeId], [EmployeeName], [EmployeeTitle], [PhoneNumber], [EmployeeStartDate], [EmployeeCompany], [EmployeeSalary]) VALUES (5, N'Edward Miller', N'IT Support', N'555-5555', CAST(N'2023-05-05T00:00:00.0000000' AS DateTime2), N'4', CAST(45000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([ProductId], [StockCode], [Barcode], [ProductName], [Quantity], [Brand], [CategoryID]) VALUES (1, N'P12345', N'123456789', N'Smartphone', 100, N'Samsung', 1)
INSERT [dbo].[products] ([ProductId], [StockCode], [Barcode], [ProductName], [Quantity], [Brand], [CategoryID]) VALUES (2, N'C56789', N'987654321', N'T-Shirt', 200, N'Nike', 2)
INSERT [dbo].[products] ([ProductId], [StockCode], [Barcode], [ProductName], [Quantity], [Brand], [CategoryID]) VALUES (3, N'B98765', N'456789123', N'Fantasy Novel', 50, N'Random Publisher', 3)
INSERT [dbo].[products] ([ProductId], [StockCode], [Barcode], [ProductName], [Quantity], [Brand], [CategoryID]) VALUES (4, N'E24680', N'135792468', N'Laptop', 75, N'Dell', 1)
INSERT [dbo].[products] ([ProductId], [StockCode], [Barcode], [ProductName], [Quantity], [Brand], [CategoryID]) VALUES (5, N'C13579', N'987123456', N'Jeans', 150, N'Levis', 2)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[userrs] ON 

INSERT [dbo].[userrs] ([UserId], [UserNamee], [EMail], [PhoneNumber], [Passwordd], [IsActive], [IsRemember]) VALUES (1, N'furkan', N'furkan@gmail.com', N'05442603193', N'123', 1, 1)
INSERT [dbo].[userrs] ([UserId], [UserNamee], [EMail], [PhoneNumber], [Passwordd], [IsActive], [IsRemember]) VALUES (2, N'deneme', N'deneme@gmail.com', N'123', N'123', 0, 0)
INSERT [dbo].[userrs] ([UserId], [UserNamee], [EMail], [PhoneNumber], [Passwordd], [IsActive], [IsRemember]) VALUES (3, N'furkandeneme', N'furkandeneme@gmail.com', N'05442603193', N'123', 0, 0)
SET IDENTITY_INSERT [dbo].[userrs] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_userrs_EMail]    Script Date: 30.11.2023 01:29:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_userrs_EMail] ON [dbo].[userrs]
(
	[EMail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[userrs] ADD  DEFAULT (N'') FOR [UserNamee]
GO
USE [master]
GO
ALTER DATABASE [JqueryAjaxProject] SET  READ_WRITE 
GO
