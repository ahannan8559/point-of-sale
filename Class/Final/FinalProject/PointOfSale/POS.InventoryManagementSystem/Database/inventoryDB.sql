USE [inventoryDB]
GO
/****** Object:  UserDefinedFunction [dbo].[CategoryId]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[CategoryId]() 
returns char(6) 
as 
begin 
	DECLARE @lastval INT 
	SET @lastval = (select MAX(Cast(right(CategoryId,4) as int))  from Categories) 
	if @lastval is null set @lastval = 0 
	Return 'CAT' + right('0000' + convert(varchar(10),(@lastval + 1)),4) 
end
GO
/****** Object:  Table [dbo].[BarCodes]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BarCodes](
	[BarCodeId] [int] IDENTITY(1,1) NOT NULL,
	[BarCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_BarCode] PRIMARY KEY CLUSTERED 
(
	[BarCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandTag]  AS ('BR'+right('000'+CONVERT([varchar](4),[BrandId]),(4))) PERSISTED,
	[BrandName] [nvarchar](50) NULL,
	[VendorId] [int] NULL,
	[BrandDescription] [nvarchar](max) NULL,
	[BrandStatus] [varchar](10) NULL,
	[BrandImage] [image] NULL,
 CONSTRAINT [PK__Brands__DAD4F05EF02A7CC7] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseName] [nvarchar](50) NULL,
	[ExpenseAmount] [float] NULL,
	[ExpenseDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [int] NOT NULL,
	[OrderProductsCategoriesId] [int] NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainCategories]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainCategories](
	[MainCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[MainCategoryName] [nvarchar](50) NULL,
	[MainCategoryImage] [image] NULL,
 CONSTRAINT [PK__MainCate__0290BDD69E73A123] PRIMARY KEY CLUSTERED 
(
	[MainCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderTag]  AS ('ORD-'+right('000'+CONVERT([varchar](4),[OrderId]),(4))) PERSISTED,
	[Id] [int] NOT NULL,
	[BarCodeId] [int] NULL,
	[Date] [date] NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductPerUnitPrice] [float] NULL,
	[OrderQuantity] [int] NULL,
	[OrderStatus] [varchar](10) NULL,
	[PaymentMethod] [nvarchar](20) NULL,
	[TotalAmount] [float] NULL,
	[CustomerFullName] [nvarchar](50) NULL,
	[CustomerPhone] [nvarchar](50) NULL,
	[CustomerEmail] [nvarchar](50) NULL,
	[CustomerAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersProductsMap]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersProductsMap](
	[OrderProductsCategoriesId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_Orders_Products_Map] PRIMARY KEY CLUSTERED 
(
	[OrderProductsCategoriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProCateMap]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProCateMap](
	[PCID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[BrandId] [int] NULL,
	[BrandName] [nvarchar](50) NULL,
	[VendorId] [int] NULL,
	[VendorName] [nvarchar](50) NULL,
	[ThirdCategoryId] [int] NULL,
	[ThirdCategoryName] [nvarchar](50) NULL,
	[SecondCategoryId] [int] NULL,
	[SecondCategoryName] [nvarchar](50) NULL,
	[MainCategoryId] [int] NULL,
	[MainCategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProCateMap] PRIMARY KEY CLUSTERED 
(
	[PCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductIdTag]  AS ('PRO-'+right('000'+CONVERT([varchar](4),[ProductId]),(4))) PERSISTED,
	[ProductName] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[ProductDescription] [text] NULL,
	[ProductQuantityPerUnit] [float] NULL,
	[ProductPerUnitPrice] [float] NULL,
	[ProductMSRP] [float] NULL,
	[ProductStatus] [varchar](10) NULL,
	[ProductDiscountRate] [float] NULL,
	[ProductSize] [float] NULL,
	[ProductColor] [varchar](50) NULL,
	[ProductWeight] [float] NULL,
	[ProductUnitStock] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecondCategories]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondCategories](
	[SecondCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SecondCategoryName] [nvarchar](30) NULL,
	[MainCategoryId] [int] NULL,
	[SecondeCategoryImage] [image] NULL,
 CONSTRAINT [PK_SeconderyCategories] PRIMARY KEY CLUSTERED 
(
	[SecondCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThirdCategories]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThirdCategories](
	[ThirdCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ThirdCategoryName] [nvarchar](30) NULL,
	[SecondCategoryId] [int] NULL,
	[ThirdCategoryImage] [image] NULL,
 CONSTRAINT [PK_ThirdCategories] PRIMARY KEY CLUSTERED 
(
	[ThirdCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId]  AS (('U-'+right('000'+CONVERT([nvarchar](4),[Id]),(4)))+'-ID') PERSISTED,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Gender] [varchar](10) NULL,
	[Role] [varchar](30) NULL,
	[Salary] [float] NULL,
	[JoinDate] [date] NULL,
	[Birthdate] [date] NULL,
	[NID] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[HomeTown] [varchar](20) NULL,
	[CurrentCity] [varchar](20) NULL,
	[Division] [nvarchar](30) NULL,
	[BloodGroup] [nvarchar](20) NULL,
	[PostalCode] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[VednorTag]  AS ('VEN'+right('000'+CONVERT([varchar](4),[VendorId]),(4))) PERSISTED,
	[VendorName] [nvarchar](30) NULL,
	[ThirdCategoryId] [int] NULL,
	[VendorDescription] [nvarchar](max) NULL,
	[VendorStatus] [varchar](20) NULL,
	[VendorImage] [image] NULL,
	[RegisterDate] [date] NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Brands] ADD  CONSTRAINT [DF_Brands_BrandDescription]  DEFAULT ('No Data') FOR [BrandDescription]
GO
ALTER TABLE [dbo].[Brands] ADD  CONSTRAINT [DF_Brands_BrandStatus]  DEFAULT ('No Data') FOR [BrandStatus]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductQuantityPerUnit]  DEFAULT ((0.0)) FOR [ProductQuantityPerUnit]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductPerUnitPrice]  DEFAULT ((0.0)) FOR [ProductPerUnitPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductMSRP]  DEFAULT ((0.0)) FOR [ProductMSRP]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDiscountRate]  DEFAULT ((0.0)) FOR [ProductDiscountRate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductSize]  DEFAULT ((0.0)) FOR [ProductSize]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductWeight]  DEFAULT ((0.0)) FOR [ProductWeight]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductUnitStock]  DEFAULT ((0.0)) FOR [ProductUnitStock]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_LastName]  DEFAULT ('No Data') FOR [LastName]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Gender]  DEFAULT ('Not Selected') FOR [Gender]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Role]  DEFAULT ('Not Selected') FOR [Role]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Division]  DEFAULT (N'No Data') FOR [Division]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_BloodGroup]  DEFAULT (N'No Data') FOR [BloodGroup]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_VendorDescription]  DEFAULT ('No Data') FOR [VendorDescription]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_VendorStatus]  DEFAULT ('No Data') FOR [VendorStatus]
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD  CONSTRAINT [FK_Brands_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Brands] CHECK CONSTRAINT [FK_Brands_Vendors]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_OrdersProductsMap] FOREIGN KEY([OrderProductsCategoriesId])
REFERENCES [dbo].[OrdersProductsMap] ([OrderProductsCategoriesId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_OrdersProductsMap]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_BarCodes] FOREIGN KEY([BarCodeId])
REFERENCES [dbo].[BarCodes] ([BarCodeId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_BarCodes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[OrdersProductsMap]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products_Map_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrdersProductsMap] CHECK CONSTRAINT [FK_Orders_Products_Map_Orders]
GO
ALTER TABLE [dbo].[ProCateMap]  WITH CHECK ADD  CONSTRAINT [FK_ProCateMap_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[ProCateMap] CHECK CONSTRAINT [FK_ProCateMap_Brands]
GO
ALTER TABLE [dbo].[ProCateMap]  WITH CHECK ADD  CONSTRAINT [FK_ProCateMap_MainCategories] FOREIGN KEY([MainCategoryId])
REFERENCES [dbo].[MainCategories] ([MainCategoryId])
GO
ALTER TABLE [dbo].[ProCateMap] CHECK CONSTRAINT [FK_ProCateMap_MainCategories]
GO
ALTER TABLE [dbo].[ProCateMap]  WITH CHECK ADD  CONSTRAINT [FK_ProCateMap_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProCateMap] CHECK CONSTRAINT [FK_ProCateMap_Products]
GO
ALTER TABLE [dbo].[ProCateMap]  WITH CHECK ADD  CONSTRAINT [FK_ProCateMap_SecondCategories] FOREIGN KEY([SecondCategoryId])
REFERENCES [dbo].[SecondCategories] ([SecondCategoryId])
GO
ALTER TABLE [dbo].[ProCateMap] CHECK CONSTRAINT [FK_ProCateMap_SecondCategories]
GO
ALTER TABLE [dbo].[ProCateMap]  WITH CHECK ADD  CONSTRAINT [FK_ProCateMap_ThirdCategories] FOREIGN KEY([ThirdCategoryId])
REFERENCES [dbo].[ThirdCategories] ([ThirdCategoryId])
GO
ALTER TABLE [dbo].[ProCateMap] CHECK CONSTRAINT [FK_ProCateMap_ThirdCategories]
GO
ALTER TABLE [dbo].[ProCateMap]  WITH CHECK ADD  CONSTRAINT [FK_ProCateMap_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorId])
GO
ALTER TABLE [dbo].[ProCateMap] CHECK CONSTRAINT [FK_ProCateMap_Vendors]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[SecondCategories]  WITH CHECK ADD  CONSTRAINT [FK_SeconderyCategories_MainCategories] FOREIGN KEY([MainCategoryId])
REFERENCES [dbo].[MainCategories] ([MainCategoryId])
GO
ALTER TABLE [dbo].[SecondCategories] CHECK CONSTRAINT [FK_SeconderyCategories_MainCategories]
GO
ALTER TABLE [dbo].[ThirdCategories]  WITH CHECK ADD  CONSTRAINT [FK_ThirdCategories_SeconderyCategories] FOREIGN KEY([SecondCategoryId])
REFERENCES [dbo].[SecondCategories] ([SecondCategoryId])
GO
ALTER TABLE [dbo].[ThirdCategories] CHECK CONSTRAINT [FK_ThirdCategories_SeconderyCategories]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_Vendors_ThirdCategories] FOREIGN KEY([ThirdCategoryId])
REFERENCES [dbo].[ThirdCategories] ([ThirdCategoryId])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_Vendors_ThirdCategories]
GO
/****** Object:  StoredProcedure [dbo].[NewEmployee]    Script Date: 8/29/2021 7:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewEmployee]

     @EmployeeName VARCHAR(50)

AS BEGIN

SET NOCOUNT ON;

     INSERT INTO dbo.tblEmployee(Employee_ID, Name)
     SELECT 
            'EP' + RIGHT('0000' + CAST(Employee_ID + 1 AS VARCHAR(4)), 4)
          , @EmployeeName
     FROM (
          SELECT TOP 1 Employee_ID = CAST(RIGHT(Employee_ID, 4) AS INT)
          FROM dbo.tblEmployee
          ORDER BY Employee_ID DESC
     ) t

END 
GO
