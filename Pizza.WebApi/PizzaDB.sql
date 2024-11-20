USE [master]
GO
/****** Object:  Database [PizzaDB]    Script Date: 20/11/2024 12:25:09 ******/
CREATE DATABASE [PizzaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PizzaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PizzaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PizzaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PizzaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PizzaDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PizzaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PizzaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PizzaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PizzaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PizzaDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PizzaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PizzaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PizzaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PizzaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PizzaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PizzaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PizzaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PizzaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PizzaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PizzaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PizzaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PizzaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PizzaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PizzaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PizzaDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PizzaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PizzaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PizzaDB] SET  MULTI_USER 
GO
ALTER DATABASE [PizzaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PizzaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PizzaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PizzaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PizzaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PizzaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PizzaDB] SET QUERY_STORE = OFF
GO
USE [PizzaDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20/11/2024 12:25:10 ******/
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
/****** Object:  Table [dbo].[CustomPizzaDetails]    Script Date: 20/11/2024 12:25:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomPizzaDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IngredientId] [int] NOT NULL,
	[CustomPizzaRequestId] [int] NOT NULL,
 CONSTRAINT [PK_CustomPizzaDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomPizzas]    Script Date: 20/11/2024 12:25:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomPizzas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_CustomPizzas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 20/11/2024 12:25:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 20/11/2024 12:25:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PizzaId] [int] NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
	[OrderRequestId] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 20/11/2024 12:25:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[Customer] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[TotalWithoutDisc] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[DeliveryCost] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pizzas]    Script Date: 20/11/2024 12:25:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizzas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Pizzas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 20/11/2024 12:25:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IngredientId] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[PizzaModelId] [int] NOT NULL,
 CONSTRAINT [PK_Recipes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241116210948_InitialCreate', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241116214152_modificacion1', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241116215204_modificacion2', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241116220636_modificacion3', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241116221953_modificacion4', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241116222520_modificacion5', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241116224403_modificacion6', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241116225824_modificacion7', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241116231323_modificacion8', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241117013805_modificacion9', N'9.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241117043155_modificacion10', N'9.0.0')
GO
SET IDENTITY_INSERT [dbo].[CustomPizzaDetails] ON 
GO
INSERT [dbo].[CustomPizzaDetails] ([Id], [IngredientId], [CustomPizzaRequestId]) VALUES (1, 3, 1)
GO
INSERT [dbo].[CustomPizzaDetails] ([Id], [IngredientId], [CustomPizzaRequestId]) VALUES (2, 1, 2)
GO
INSERT [dbo].[CustomPizzaDetails] ([Id], [IngredientId], [CustomPizzaRequestId]) VALUES (3, 3, 2)
GO
INSERT [dbo].[CustomPizzaDetails] ([Id], [IngredientId], [CustomPizzaRequestId]) VALUES (4, 5, 2)
GO
INSERT [dbo].[CustomPizzaDetails] ([Id], [IngredientId], [CustomPizzaRequestId]) VALUES (5, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[CustomPizzaDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomPizzas] ON 
GO
INSERT [dbo].[CustomPizzas] ([Id], [Price]) VALUES (1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CustomPizzas] ([Id], [Price]) VALUES (2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CustomPizzas] ([Id], [Price]) VALUES (3, CAST(10.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[CustomPizzas] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredients] ON 
GO
INSERT [dbo].[Ingredients] ([Id], [Name]) VALUES (1, N'Peperoni')
GO
INSERT [dbo].[Ingredients] ([Id], [Name]) VALUES (2, N'Jamon')
GO
INSERT [dbo].[Ingredients] ([Id], [Name]) VALUES (3, N'Salchicha')
GO
INSERT [dbo].[Ingredients] ([Id], [Name]) VALUES (4, N'Carne')
GO
INSERT [dbo].[Ingredients] ([Id], [Name]) VALUES (5, N'Chorizo')
GO
INSERT [dbo].[Ingredients] ([Id], [Name]) VALUES (6, N'Salami')
GO
INSERT [dbo].[Ingredients] ([Id], [Name]) VALUES (7, N'Mozzarella')
GO
INSERT [dbo].[Ingredients] ([Id], [Name]) VALUES (8, N'Parmesano')
GO
SET IDENTITY_INSERT [dbo].[Ingredients] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (1, 1, N'string', CAST(100.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (2, 1, N'string', CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (3, 1, N'string', CAST(50.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 5)
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (4, 0, N'string', CAST(60.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), 6)
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (5, 2, N'string', CAST(50.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 7)
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (6, 3, N'string', CAST(5.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(125.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 7)
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (7, 4, N'string', CAST(50.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 8)
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (8, 1, N'string', CAST(50.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 9)
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (9, 1, N'string', CAST(20.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (10, 1, N'string', CAST(10.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), 11)
GO
INSERT [dbo].[OrderDetails] ([Id], [PizzaId], [Detail], [Price], [Quantity], [Discount], [Subtotal], [OrderRequestId]) VALUES (11, 5, N'string', CAST(10.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 12)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [OrderStatus], [Customer], [Address], [OrderDate], [TotalWithoutDisc], [Discount], [DeliveryCost], [Total]) VALUES (1, N'string', N'string', N'string', CAST(N'2024-11-16T23:05:39.7300000' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [OrderStatus], [Customer], [Address], [OrderDate], [TotalWithoutDisc], [Discount], [DeliveryCost], [Total]) VALUES (2, N'string', N'string', N'string', CAST(N'2024-11-16T23:14:35.4040000' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [OrderStatus], [Customer], [Address], [OrderDate], [TotalWithoutDisc], [Discount], [DeliveryCost], [Total]) VALUES (5, N'string', N'string', N'string', CAST(N'2024-11-16T23:22:50.8610000' AS DateTime2), CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [OrderStatus], [Customer], [Address], [OrderDate], [TotalWithoutDisc], [Discount], [DeliveryCost], [Total]) VALUES (6, N'string', N'string', N'string', CAST(N'2024-11-14T23:24:24.1610000' AS DateTime2), CAST(1200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [OrderStatus], [Customer], [Address], [OrderDate], [TotalWithoutDisc], [Discount], [DeliveryCost], [Total]) VALUES (7, N'string', N'string', N'string', CAST(N'2024-11-12T23:26:19.9070000' AS DateTime2), CAST(1250.00 AS Decimal(18, 2)), CAST(625.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(625.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [OrderStatus], [Customer], [Address], [OrderDate], [TotalWithoutDisc], [Discount], [DeliveryCost], [Total]) VALUES (8, N'string', N'string', N'string', CAST(N'2024-11-12T23:36:11.4860000' AS DateTime2), CAST(1000.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [OrderStatus], [Customer], [Address], [OrderDate], [TotalWithoutDisc], [Discount], [DeliveryCost], [Total]) VALUES (9, N'string', N'string', N'string', CAST(N'2024-11-12T23:37:20.9150000' AS DateTime2), CAST(1000.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [OrderStatus], [Customer], [Address], [OrderDate], [TotalWithoutDisc], [Discount], [DeliveryCost], [Total]) VALUES (10, N'string', N'string', N'string', CAST(N'2024-11-12T23:38:35.7630000' AS DateTime2), CAST(400.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(205.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [OrderStatus], [Customer], [Address], [OrderDate], [TotalWithoutDisc], [Discount], [DeliveryCost], [Total]) VALUES (11, N'string', N'string', N'string', CAST(N'2024-11-14T23:39:40.3290000' AS DateTime2), CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [OrderStatus], [Customer], [Address], [OrderDate], [TotalWithoutDisc], [Discount], [DeliveryCost], [Total]) VALUES (12, N'string', N'string', N'string', CAST(N'2024-11-16T23:41:15.3020000' AS DateTime2), CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(505.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Pizzas] ON 
GO
INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Description]) VALUES (1, N'PIZZA 1', 15, N'PIZZA1')
GO
INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Description]) VALUES (2, N'PIZZA 2', 15, N'PIZZA')
GO
INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Description]) VALUES (3, N'PIZZA 3', 50, N'PIZZA')
GO
SET IDENTITY_INSERT [dbo].[Pizzas] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipes] ON 
GO
INSERT [dbo].[Recipes] ([Id], [IngredientId], [Quantity], [PizzaModelId]) VALUES (1, 2, CAST(1.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Recipes] ([Id], [IngredientId], [Quantity], [PizzaModelId]) VALUES (2, 3, CAST(2.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Recipes] ([Id], [IngredientId], [Quantity], [PizzaModelId]) VALUES (3, 4, CAST(5.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Recipes] ([Id], [IngredientId], [Quantity], [PizzaModelId]) VALUES (4, 1, CAST(5.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Recipes] ([Id], [IngredientId], [Quantity], [PizzaModelId]) VALUES (5, 3, CAST(2.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Recipes] ([Id], [IngredientId], [Quantity], [PizzaModelId]) VALUES (8, 5, CAST(6.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Recipes] ([Id], [IngredientId], [Quantity], [PizzaModelId]) VALUES (11, 2, CAST(5.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Recipes] ([Id], [IngredientId], [Quantity], [PizzaModelId]) VALUES (12, 1, CAST(5.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Recipes] ([Id], [IngredientId], [Quantity], [PizzaModelId]) VALUES (13, 3, CAST(10.00 AS Decimal(18, 2)), 3)
GO
SET IDENTITY_INSERT [dbo].[Recipes] OFF
GO
/****** Object:  Index [IX_CustomPizzaDetails_CustomPizzaRequestId]    Script Date: 20/11/2024 12:25:10 ******/
CREATE NONCLUSTERED INDEX [IX_CustomPizzaDetails_CustomPizzaRequestId] ON [dbo].[CustomPizzaDetails]
(
	[CustomPizzaRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomPizzaDetails_IngredientId]    Script Date: 20/11/2024 12:25:10 ******/
CREATE NONCLUSTERED INDEX [IX_CustomPizzaDetails_IngredientId] ON [dbo].[CustomPizzaDetails]
(
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_OrderRequestId]    Script Date: 20/11/2024 12:25:10 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderRequestId] ON [dbo].[OrderDetails]
(
	[OrderRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Recipes_IngredientId]    Script Date: 20/11/2024 12:25:10 ******/
CREATE NONCLUSTERED INDEX [IX_Recipes_IngredientId] ON [dbo].[Recipes]
(
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Recipes_PizzaModelId]    Script Date: 20/11/2024 12:25:10 ******/
CREATE NONCLUSTERED INDEX [IX_Recipes_PizzaModelId] ON [dbo].[Recipes]
(
	[PizzaModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomPizzaDetails] ADD  DEFAULT ((0)) FOR [CustomPizzaRequestId]
GO
ALTER TABLE [dbo].[CustomPizzas] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[Recipes] ADD  DEFAULT ((0)) FOR [PizzaModelId]
GO
ALTER TABLE [dbo].[CustomPizzaDetails]  WITH CHECK ADD  CONSTRAINT [FK_CustomPizzaDetails_CustomPizzas_CustomPizzaRequestId] FOREIGN KEY([CustomPizzaRequestId])
REFERENCES [dbo].[CustomPizzas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomPizzaDetails] CHECK CONSTRAINT [FK_CustomPizzaDetails_CustomPizzas_CustomPizzaRequestId]
GO
ALTER TABLE [dbo].[CustomPizzaDetails]  WITH CHECK ADD  CONSTRAINT [FK_CustomPizzaDetails_Ingredients_IngredientId] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomPizzaDetails] CHECK CONSTRAINT [FK_CustomPizzaDetails_Ingredients_IngredientId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderRequestId] FOREIGN KEY([OrderRequestId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderRequestId]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_Ingredients_IngredientId] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK_Recipes_Ingredients_IngredientId]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_Pizzas_PizzaModelId] FOREIGN KEY([PizzaModelId])
REFERENCES [dbo].[Pizzas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK_Recipes_Pizzas_PizzaModelId]
GO
USE [master]
GO
ALTER DATABASE [PizzaDB] SET  READ_WRITE 
GO
