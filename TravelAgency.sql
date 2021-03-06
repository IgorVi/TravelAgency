USE [master]
GO
/****** Object:  Database [TravelAgency]    Script Date: 02.06.2015 16:17:27 ******/
CREATE DATABASE [TravelAgency]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravelAgency', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TravelAgency.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TravelAgency_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TravelAgency_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TravelAgency] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelAgency].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelAgency] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelAgency] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelAgency] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelAgency] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravelAgency] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelAgency] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TravelAgency] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TravelAgency] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelAgency] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelAgency] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelAgency] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelAgency] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelAgency] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelAgency] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelAgency] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelAgency] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TravelAgency] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelAgency] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelAgency] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelAgency] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelAgency] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelAgency] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TravelAgency] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelAgency] SET RECOVERY FULL 
GO
ALTER DATABASE [TravelAgency] SET  MULTI_USER 
GO
ALTER DATABASE [TravelAgency] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelAgency] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelAgency] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelAgency] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TravelAgency', N'ON'
GO
USE [TravelAgency]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 02.06.2015 16:17:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[cityID] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BalanceOfCompany]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceOfCompany](
	[date] [date] NOT NULL,
	[income] [float] NOT NULL,
	[expense] [float] NOT NULL,
	[profit] [float] NOT NULL,
	[taxes] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[cityID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[countryID] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[cityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CitiesResorts]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CitiesResorts](
	[resortsID] [int] NOT NULL,
	[cityID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[countryID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_countries] PRIMARY KEY CLUSTERED 
(
	[countryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerDiscount]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDiscount](
	[customerID] [int] NOT NULL,
	[discountID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[addressID] [int] NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
	[internationalPassportID] [int] NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[discountID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[percentage] [int] NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Excursions]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excursions](
	[excursionsID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Excursions] PRIMARY KEY CLUSTERED 
(
	[excursionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExcursionsResorts]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExcursionsResorts](
	[excursionsResortsID] [int] IDENTITY(1,1) NOT NULL,
	[resortsID] [int] NOT NULL,
	[excursionsID] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_ExcursionsResorts] PRIMARY KEY CLUSTERED 
(
	[excursionsResortsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelRooms]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelRooms](
	[hotelRoomsID] [int] IDENTITY(1,1) NOT NULL,
	[hotelID] [int] NOT NULL,
	[typesOfRoomsID] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_HotelRooms] PRIMARY KEY CLUSTERED 
(
	[hotelRoomsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[hotelID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[stars] [int] NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Hotels] PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InternationalPassport]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternationalPassport](
	[internationalPassportID] [int] IDENTITY(1,1) NOT NULL,
	[series] [nvarchar](50) NOT NULL,
	[number] [nvarchar](50) NOT NULL,
	[dateOfIssue] [date] NOT NULL,
	[validUntil] [date] NOT NULL,
	[fullNameEnglish] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_InternationalPassport] PRIMARY KEY CLUSTERED 
(
	[internationalPassportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NnutritionAtResorts]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NnutritionAtResorts](
	[nnutritionAtResortsID] [int] IDENTITY(1,1) NOT NULL,
	[resortsID] [int] NOT NULL,
	[nutritionID] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_NnutritionAtResorts] PRIMARY KEY CLUSTERED 
(
	[nnutritionAtResortsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nutrition]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nutrition](
	[nutritionID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Nutrition] PRIMARY KEY CLUSTERED 
(
	[nutritionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetailExcursion]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailExcursion](
	[excursionsResortsID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[count] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetailNutrition]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailNutrition](
	[nnutritionAtResortsID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[count] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetailRooms]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailRooms](
	[hotelRoomsID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[count] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetailTransport]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailTransport](
	[transportModesResortID] [int] NOT NULL,
	[orderID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [int] NOT NULL,
	[staffID] [int] NOT NULL,
	[resortsID] [int] NOT NULL,
	[discountID] [int] NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patronymic]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patronymic](
	[patronymicID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Patronymic] PRIMARY KEY CLUSTERED 
(
	[patronymicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resorts]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resorts](
	[resortsID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [text] NULL,
	[rating] [int] NULL,
	[typesOfHolidayID] [int] NULL,
	[durationOfTravel] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_Resorts] PRIMARY KEY CLUSTERED 
(
	[resortsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RresortHotels]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RresortHotels](
	[resortsID] [int] NOT NULL,
	[hotelID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salaries]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salaries](
	[staffID] [int] NOT NULL,
	[accrualDate] [date] NOT NULL,
	[sum] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[staffID] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[patronymicID] [int] NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[addressID] [int] NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
	[salary] [float] NOT NULL,
	[dateOfEmployment] [date] NULL,
	[dateOfDismissal] [date] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[staffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transport]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transport](
	[transportID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Transport] PRIMARY KEY CLUSTERED 
(
	[transportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransportModesResort]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportModesResort](
	[transportModesResortID] [int] IDENTITY(1,1) NOT NULL,
	[resortsID] [int] NOT NULL,
	[transportID] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_TransportModesResort] PRIMARY KEY CLUSTERED 
(
	[transportModesResortID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypesOfHoliday]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesOfHoliday](
	[typesOfHolidayID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_TypesOfHoliday] PRIMARY KEY CLUSTERED 
(
	[typesOfHolidayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypesOfRooms]    Script Date: 02.06.2015 16:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesOfRooms](
	[typesOfRoomsID] [int] IDENTITY(1,1) NOT NULL,
	[nmae] [nvarchar](100) NOT NULL,
	[description] [text] NULL,
	[numberOfRoomsAvailable] [int] NOT NULL,
 CONSTRAINT [PK_TypesOfRooms] PRIMARY KEY CLUSTERED 
(
	[typesOfRoomsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Cities] FOREIGN KEY([cityID])
REFERENCES [dbo].[Cities] ([cityID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Cities]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([countryID])
REFERENCES [dbo].[Countries] ([countryID])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[CitiesResorts]  WITH CHECK ADD  CONSTRAINT [FK_CitiesResorts_Cities] FOREIGN KEY([cityID])
REFERENCES [dbo].[Cities] ([cityID])
GO
ALTER TABLE [dbo].[CitiesResorts] CHECK CONSTRAINT [FK_CitiesResorts_Cities]
GO
ALTER TABLE [dbo].[CitiesResorts]  WITH CHECK ADD  CONSTRAINT [FK_CitiesResorts_Resorts] FOREIGN KEY([resortsID])
REFERENCES [dbo].[Resorts] ([resortsID])
GO
ALTER TABLE [dbo].[CitiesResorts] CHECK CONSTRAINT [FK_CitiesResorts_Resorts]
GO
ALTER TABLE [dbo].[CustomerDiscount]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDiscount_Customers] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customers] ([customerID])
GO
ALTER TABLE [dbo].[CustomerDiscount] CHECK CONSTRAINT [FK_CustomerDiscount_Customers]
GO
ALTER TABLE [dbo].[CustomerDiscount]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDiscount_Discounts] FOREIGN KEY([discountID])
REFERENCES [dbo].[Discounts] ([discountID])
GO
ALTER TABLE [dbo].[CustomerDiscount] CHECK CONSTRAINT [FK_CustomerDiscount_Discounts]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Address] FOREIGN KEY([addressID])
REFERENCES [dbo].[Address] ([addressID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Address]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_InternationalPassport] FOREIGN KEY([internationalPassportID])
REFERENCES [dbo].[InternationalPassport] ([internationalPassportID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_InternationalPassport]
GO
ALTER TABLE [dbo].[ExcursionsResorts]  WITH CHECK ADD  CONSTRAINT [FK_ExcursionsResorts_Excursions] FOREIGN KEY([excursionsID])
REFERENCES [dbo].[Excursions] ([excursionsID])
GO
ALTER TABLE [dbo].[ExcursionsResorts] CHECK CONSTRAINT [FK_ExcursionsResorts_Excursions]
GO
ALTER TABLE [dbo].[ExcursionsResorts]  WITH CHECK ADD  CONSTRAINT [FK_ExcursionsResorts_Resorts] FOREIGN KEY([resortsID])
REFERENCES [dbo].[Resorts] ([resortsID])
GO
ALTER TABLE [dbo].[ExcursionsResorts] CHECK CONSTRAINT [FK_ExcursionsResorts_Resorts]
GO
ALTER TABLE [dbo].[HotelRooms]  WITH CHECK ADD  CONSTRAINT [FK_HotelRooms_Hotels] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotels] ([hotelID])
GO
ALTER TABLE [dbo].[HotelRooms] CHECK CONSTRAINT [FK_HotelRooms_Hotels]
GO
ALTER TABLE [dbo].[HotelRooms]  WITH CHECK ADD  CONSTRAINT [FK_HotelRooms_TypesOfRooms] FOREIGN KEY([typesOfRoomsID])
REFERENCES [dbo].[TypesOfRooms] ([typesOfRoomsID])
GO
ALTER TABLE [dbo].[HotelRooms] CHECK CONSTRAINT [FK_HotelRooms_TypesOfRooms]
GO
ALTER TABLE [dbo].[NnutritionAtResorts]  WITH CHECK ADD  CONSTRAINT [FK_NnutritionAtResorts_Nutrition] FOREIGN KEY([nutritionID])
REFERENCES [dbo].[Nutrition] ([nutritionID])
GO
ALTER TABLE [dbo].[NnutritionAtResorts] CHECK CONSTRAINT [FK_NnutritionAtResorts_Nutrition]
GO
ALTER TABLE [dbo].[NnutritionAtResorts]  WITH CHECK ADD  CONSTRAINT [FK_NnutritionAtResorts_Resorts] FOREIGN KEY([resortsID])
REFERENCES [dbo].[Resorts] ([resortsID])
GO
ALTER TABLE [dbo].[NnutritionAtResorts] CHECK CONSTRAINT [FK_NnutritionAtResorts_Resorts]
GO
ALTER TABLE [dbo].[OrderDetailExcursion]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailExcursion_ExcursionsResorts] FOREIGN KEY([excursionsResortsID])
REFERENCES [dbo].[ExcursionsResorts] ([excursionsResortsID])
GO
ALTER TABLE [dbo].[OrderDetailExcursion] CHECK CONSTRAINT [FK_OrderDetailExcursion_ExcursionsResorts]
GO
ALTER TABLE [dbo].[OrderDetailExcursion]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailExcursion_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetailExcursion] CHECK CONSTRAINT [FK_OrderDetailExcursion_Orders]
GO
ALTER TABLE [dbo].[OrderDetailNutrition]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailNutrition_NnutritionAtResorts] FOREIGN KEY([nnutritionAtResortsID])
REFERENCES [dbo].[NnutritionAtResorts] ([nnutritionAtResortsID])
GO
ALTER TABLE [dbo].[OrderDetailNutrition] CHECK CONSTRAINT [FK_OrderDetailNutrition_NnutritionAtResorts]
GO
ALTER TABLE [dbo].[OrderDetailNutrition]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailNutrition_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetailNutrition] CHECK CONSTRAINT [FK_OrderDetailNutrition_Orders]
GO
ALTER TABLE [dbo].[OrderDetailRooms]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailRooms_HotelRooms] FOREIGN KEY([hotelRoomsID])
REFERENCES [dbo].[HotelRooms] ([hotelRoomsID])
GO
ALTER TABLE [dbo].[OrderDetailRooms] CHECK CONSTRAINT [FK_OrderDetailRooms_HotelRooms]
GO
ALTER TABLE [dbo].[OrderDetailRooms]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailRooms_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetailRooms] CHECK CONSTRAINT [FK_OrderDetailRooms_Orders]
GO
ALTER TABLE [dbo].[OrderDetailTransport]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailTransport_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetailTransport] CHECK CONSTRAINT [FK_OrderDetailTransport_Orders]
GO
ALTER TABLE [dbo].[OrderDetailTransport]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailTransport_TransportModesResort] FOREIGN KEY([transportModesResortID])
REFERENCES [dbo].[TransportModesResort] ([transportModesResortID])
GO
ALTER TABLE [dbo].[OrderDetailTransport] CHECK CONSTRAINT [FK_OrderDetailTransport_TransportModesResort]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customers] ([customerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Discounts] FOREIGN KEY([discountID])
REFERENCES [dbo].[Discounts] ([discountID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Discounts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Resorts] FOREIGN KEY([resortsID])
REFERENCES [dbo].[Resorts] ([resortsID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Resorts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Staff] FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Staff]
GO
ALTER TABLE [dbo].[Resorts]  WITH CHECK ADD  CONSTRAINT [FK_Resorts_TypesOfHoliday] FOREIGN KEY([typesOfHolidayID])
REFERENCES [dbo].[TypesOfHoliday] ([typesOfHolidayID])
GO
ALTER TABLE [dbo].[Resorts] CHECK CONSTRAINT [FK_Resorts_TypesOfHoliday]
GO
ALTER TABLE [dbo].[RresortHotels]  WITH CHECK ADD  CONSTRAINT [FK_RresortHotels_Hotels] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotels] ([hotelID])
GO
ALTER TABLE [dbo].[RresortHotels] CHECK CONSTRAINT [FK_RresortHotels_Hotels]
GO
ALTER TABLE [dbo].[RresortHotels]  WITH CHECK ADD  CONSTRAINT [FK_RresortHotels_Resorts] FOREIGN KEY([resortsID])
REFERENCES [dbo].[Resorts] ([resortsID])
GO
ALTER TABLE [dbo].[RresortHotels] CHECK CONSTRAINT [FK_RresortHotels_Resorts]
GO
ALTER TABLE [dbo].[Salaries]  WITH CHECK ADD  CONSTRAINT [FK_Salaries_Staff] FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Salaries] CHECK CONSTRAINT [FK_Salaries_Staff]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Address] FOREIGN KEY([addressID])
REFERENCES [dbo].[Address] ([addressID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Address]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Patronymic] FOREIGN KEY([patronymicID])
REFERENCES [dbo].[Patronymic] ([patronymicID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Patronymic]
GO
ALTER TABLE [dbo].[TransportModesResort]  WITH CHECK ADD  CONSTRAINT [FK_TransportModesResort_Resorts] FOREIGN KEY([resortsID])
REFERENCES [dbo].[Resorts] ([resortsID])
GO
ALTER TABLE [dbo].[TransportModesResort] CHECK CONSTRAINT [FK_TransportModesResort_Resorts]
GO
ALTER TABLE [dbo].[TransportModesResort]  WITH CHECK ADD  CONSTRAINT [FK_TransportModesResort_Transport] FOREIGN KEY([transportID])
REFERENCES [dbo].[Transport] ([transportID])
GO
ALTER TABLE [dbo].[TransportModesResort] CHECK CONSTRAINT [FK_TransportModesResort_Transport]
GO
USE [master]
GO
ALTER DATABASE [TravelAgency] SET  READ_WRITE 
GO
