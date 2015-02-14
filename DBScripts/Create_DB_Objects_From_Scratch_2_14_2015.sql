
--DROP TABLES
DROP TABLE Style
DROP TABLE Account
DROP TABLE DealerContact
DROP TABLE Dealer
DROP TABLE Inventory
DROP TABLE Fuel
DROP TABLE ExteriorColor
DROP TABLE DriveTrain
DROP TABLE BodyStyle
DROP TABLE AccountType
DROP TABLE Model
DROP TABLE Mileage
DROP TABLE Vendor
DROP TABLE Transmission
DROP TABLE [Image]
DROP PROCEDURE SearchInventoryItems
DROP PROCEDURE SaveInventoryItem
DROP PROCEDURE SaveDealerItem
DROP PROCEDURE [Login]
DROP PROCEDURE AccountExistsCheck
DROP PROCEDURE DeleteInventoryItem
DROP PROCEDURE GetVendorItems
DROP PROCEDURE GetVendorByID
DROP PROCEDURE GetInventoryItems
DROP PROCEDURE GetDealerItems
DROP PROCEDURE GetAccount
DROP PROCEDURE CreateAccount
DROP PROCEDURE SaveImage
DROP PROCEDURE [GetImage]
DROP PROCEDURE SaveVendorItem

USE [FVS]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
    [AccountID] [int] IDENTITY(1,1) NOT NULL,
    [UserName] [varchar](50) NOT NULL,
    [Password] [varchar](50) NOT NULL,
    [CreatedDate] [datetime] NOT NULL,
    [AccountTypeID] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dealer]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dealer](
    [DealerID] [int] IDENTITY(1,1) NOT NULL,
    [DealerName] [varchar](500) NOT NULL,
    [Address1] [varchar](500) NOT NULL,
    [Address2] [varchar](500) NULL,
    [StateOrRegion] [varchar](100) NOT NULL,
    [Phone] [varchar](50) NOT NULL,
    [Fax] [varchar](50) NULL,
 CONSTRAINT [PK_Dealer] PRIMARY KEY CLUSTERED
(
    [DealerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory](
    [InventoryID] [int] IDENTITY(1,1) NOT NULL,
    [VendorID] [int] NOT NULL,
    [City] [varchar](50) NULL,
    [State] [varchar](50) NULL,
    [Region] [nvarchar](50) NULL,
    [StockNumber] [varchar](50) NULL,
    [VIN] [varchar](50) NULL,
    [Year] [int] NULL,
    [Make] [varchar](50) NULL,
    [Model] [varchar](50) NULL,
    [Style] [varchar](50) NULL,
    [Trim] [varchar](250) NULL,
    [Fuel] [varchar](50) NULL,
    [Transmission] [varchar](50) NULL,
    [Drivetrain] [varchar](50) NULL,
    [ExteriorColor] [varchar](50) NULL,
    [Mileage] [int] NULL,
    [MileageRangeBottom] [int] NULL,
    [MileageRangeTop] [int] NULL,
    [Cost] [decimal](18, 2) NULL,
    [CreateDate] [datetime] NULL,
    [ModifiedDate] [datetime] NULL,
    [CreatedByID] [int] NULL,
    [LastUpdatedByID] [int] NULL,
    [IsActive] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Image]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
    [ImageID] [int] IDENTITY(1,1) NOT NULL,
    [Year] [int] NOT NULL,
    [Make] [varchar](100) NOT NULL,
    [Model] [varchar](100) NOT NULL,
    [SubModel] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fuel]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fuel](
    [FuelID] [int] IDENTITY(1,1) NOT NULL,
    [Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Fuel] PRIMARY KEY CLUSTERED
(
    [FuelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExteriorColor]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExteriorColor](
    [ExteriorColorID] [int] IDENTITY(1,1) NOT NULL,
    [Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ExteriorColor] PRIMARY KEY CLUSTERED
(
    [ExteriorColorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DriveTrain]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DriveTrain](
    [DriveTrainID] [int] IDENTITY(1,1) NOT NULL,
    [Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DriveTrain] PRIMARY KEY CLUSTERED
(
    [DriveTrainID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BodyStyle]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BodyStyle](
    [BodyStyleID] [int] IDENTITY(1,1) NOT NULL,
    [Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BodyStyle] PRIMARY KEY CLUSTERED
(
    [BodyStyleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountType](
    [AccountTypeID] [int] IDENTITY(1,1) NOT NULL,
    [AccountType] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Model]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Model](
    [ModelID] [int] IDENTITY(1,1) NOT NULL,
    [Model] [varchar](50) NOT NULL,
    [ModelNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED
(
    [ModelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mileage]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mileage](
    [MileageID] [int] IDENTITY(1,1) NOT NULL,
    [Mileage] [int] NULL,
    [MileageCieling] [int] NULL,
    [MileageFloor] [int] NULL,
 CONSTRAINT [PK_Mileage] PRIMARY KEY CLUSTERED
(
    [MileageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor](
    [VendorID] [int] IDENTITY(1,1) NOT NULL,
    [VendorNumber] [varchar](50) NOT NULL,
    [VendorName] [varchar](500) NOT NULL,
    [Region] [varchar](20) NOT NULL,
    [Address1] [varchar](500) NOT NULL,
    [Address2] [varchar](500) NULL,
    [Phone] [varchar](50) NOT NULL,
    [Fax] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transmission]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transmission](
    [TransmissionID] [int] IDENTITY(1,1) NOT NULL,
    [Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Transmission] PRIMARY KEY CLUSTERED
(
    [TransmissionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Style]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Style](
    [StyleID] [int] IDENTITY(1,1) NOT NULL,
    [Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Style] PRIMARY KEY CLUSTERED
(
    [StyleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SearchInventoryItems]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        benstieglitz@msn.com
-- Create date: 2-19-2014
-- Description:    Search Inventory Items using Short Circuit
-- =============================================
CREATE PROCEDURE [dbo].[SearchInventoryItems]
       @Region VARCHAR(50) = NULL
      ,@StockNumber VARCHAR(50) = NULL
      ,@State VARCHAR(50) = NULL
      ,@VIN VARCHAR(50) = NULL
      ,@Year VARCHAR(50) = NULL
      ,@Make VARCHAR(50) = NULL
      ,@Model VARCHAR(50) = NULL
      ,@Style VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
       [InventoryID]
      ,[City]
      ,[State]
      ,[Region]
      ,[StockNumber]
      ,[VIN]
      ,[Year]
      ,[Make]
      ,[Model]
      ,[Style]
      ,[Trim]
      ,[Fuel]
      ,[Transmission]
      ,[Drivetrain]
      ,[ExteriorColor]
      ,[Mileage]
      ,[MileageRangeBottom]
      ,[MileageRangeTop]
      ,[Cost]
      ,[CreateDate]
      ,[ModifiedDate]
      ,[CreatedByID]
      ,[LastUpdatedByID]
      ,[IsActive]
  FROM [FVS].[dbo].[Inventory]
  WHERE
    (
        @State IS NULL
        OR
        [State] LIKE ('%' + @State + '%')
    )
    AND
    (
        @Region IS NULL
        OR
        [Region] = @Region
    )
    AND
    (
        @VIN IS NULL
        OR
        VIN LIKE ('%' + @VIN + '%')
    )
     AND
     (
        @Year IS NULL
        OR
        [Year] LIKE ('%' + @Year + '%')
      )
      AND
      (
        @Make IS NULL
        OR
        Make LIKE ('%' + @Make + '%')
      )
      AND
      (
        @Model IS NULL
        OR
        Model LIKE ('%' + @Model + '%')
      )
      AND
      (
        @Style IS NULL
        OR
        Style LIKE ('%' + @Style + '%')
      )
      AND
      (
        @StockNumber IS NULL
        OR
        StockNumber = @StockNumber
      )
END
GO
/****** Object:  StoredProcedure [dbo].[SaveVendorItem]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveVendorItem]
       @VendorID INT OUTPUT
      ,@VendorNumber VARCHAR(50)
      ,@VendorName VARCHAR(100)
      ,@Region VARCHAR(10)
      ,@Address1 VARCHAR(200)
      ,@Address2 VARCHAR(200) = NULL
      ,@Phone VARCHAR(50)
      ,@Fax VARCHAR(50)
AS

IF NOT EXISTS(SELECT VendorID FROM [dbo].[Vendor] (NOLOCK) WHERE ([VendorID] = @VendorID))
BEGIN
    INSERT INTO [FVS].[dbo].[Vendor]
           ([VendorNumber]
            ,[VendorName]
            ,[Region]
            ,[Address1]
            ,[Address2]
            ,[Phone]
            ,[Fax])
     VALUES
           (@VendorNumber
            ,@VendorName
            ,@Region
            ,@Address1
            ,@Address2
            ,@Phone
            ,@Fax)
           
        SELECT @VendorID = SCOPE_IDENTITY();
END

ELSE
BEGIN
    UPDATE
        [dbo].[Vendor]
    SET
            [VendorNumber] = @VendorNumber
            ,[VendorName] = @VendorName
            ,[Region] = @Region
            ,[Address1] = @Address1
            ,[Address2] = @Address2
            ,[Phone] = @Phone
            ,[Fax] = @Fax
    WHERE
    ([VendorID] = @VendorID)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveInventoryItem]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveInventoryItem]
       @InventoryID INT OUTPUT
      ,@VendorID INT = NULL
      ,@City VARCHAR(50)
      ,@State VARCHAR(50)
      ,@Region VARCHAR(50)
      ,@StockNumber VARCHAR(50)
      ,@VIN VARCHAR(50)
      ,@Year INT
      ,@Make VARCHAR(50)
      ,@Model VARCHAR(50)
      ,@Style VARCHAR(50)
      ,@Trim VARCHAR(250)
      ,@Fuel VARCHAR(50)
      ,@Transmission VARCHAR(50)
      ,@Drivetrain VARCHAR(50)
      ,@ExteriorColor VARCHAR(50)
      ,@Mileage INT
      ,@MileageRangeBottom INT = NULL
      ,@MileageRangeTop INT = NULL
      ,@Cost DECIMAL(18,2)
      ,@LastUpdatedByID INT = 1 --Administrator
      ,@IsActive BIT

AS

DECLARE  @CreateDate DATETIME
DECLARE  @ModifiedDate DATETIME
DECLARE  @CreatedByID INT

SET         @CreateDate = GetDate()
SET         @ModifiedDate = GetDate()
SET         @CreatedByID = @LastUpdatedByID

IF NOT EXISTS(
    SELECT VIN FROM [dbo].[Inventory] (NOLOCK) WHERE ([VIN] = @VIN))
BEGIN
    INSERT INTO [FVS].[dbo].[Inventory]
           (
           [VendorID]
           ,[City]
           ,[State]
           ,[Region]
           ,[StockNumber]
           ,[VIN]
           ,[Year]
           ,[Make]
           ,[Model]
           ,[Style]
           ,[Trim]
           ,[Fuel]
           ,[Transmission]
           ,[Drivetrain]
           ,[ExteriorColor]
           ,[Mileage]
           ,[MileageRangeBottom]
           ,[MileageRangeTop]
           ,[Cost]
           ,[CreateDate]
           ,[ModifiedDate]
           ,[CreatedByID]
           ,[LastUpdatedByID]
           ,[IsActive])
     VALUES
           (
            @VendorID
           ,@City
           ,@State
           ,@Region
           ,@StockNumber
           ,@VIN
           ,@Year
           ,@Make
           ,@Model
           ,@Style
           ,@Trim
           ,@Fuel
           ,@Transmission
           ,@Drivetrain
           ,@ExteriorColor
           ,@Mileage
           ,@MileageRangeBottom
           ,@MileageRangeTop
           ,@Cost
           ,@CreateDate
           ,@ModifiedDate
           ,@CreatedByID
           ,@LastUpdatedByID
           ,@IsActive)
           
        SELECT @InventoryID = SCOPE_IDENTITY();
END

ELSE
BEGIN
    UPDATE
        [dbo].[Inventory]
    SET
            [VendorID] = @VendorID
           ,[City] = @City
           ,[State] = @State
           ,[Region] = @Region
           ,[StockNumber] = @StockNumber
           ,[VIN] = @VIN
           ,[Year] = @Year
           ,[Make] = @Make
           ,[Model] = @Model
           ,[Style] = @Style
           ,[Trim] = @Trim
           ,[Fuel] = @Fuel
           ,[Transmission] = @Transmission
           ,[Drivetrain] = @Drivetrain
           ,[ExteriorColor] = @ExteriorColor
           ,[Mileage] = @Mileage
           ,[MileageRangeBottom]= @MileageRangeBottom
           ,[MileageRangeTop]= @MileageRangeTop
           ,[Cost] = @Cost
           ,[CreateDate] = @CreateDate
           ,[ModifiedDate] = @ModifiedDate
           ,[CreatedByID] = @CreatedByID
           ,[LastUpdatedByID] = @LastUpdatedByID
           ,[IsActive] = @IsActive
    WHERE
    ([InventoryID] = @InventoryID)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveImage]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveImage]
(
    @Year INT,
    @Make VARCHAR(100),
    @Model VARCHAR(100),
    @SubModel VARCHAR(100)
)
AS
BEGIN
    INSERT INTO [FVS].[dbo].[Image]
           (
           [Year]
           ,[Make]
           ,[Model]
           ,[SubModel]
           )
     VALUES
           (
           @Year
           ,@Make
           ,@Model
           ,@SubModel
           )
END
GO
/****** Object:  StoredProcedure [dbo].[SaveDealerItem]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveDealerItem]
       @DealerID INT OUTPUT
      ,@DealerName VARCHAR(200)
      ,@Address1 VARCHAR(200)
      ,@Address2 VARCHAR(200) = NULL
      ,@StateOrRegion VARCHAR(200)
      ,@Phone VARCHAR(50)
      ,@Fax VARCHAR(50)
AS

IF NOT EXISTS(SELECT DealerID FROM [dbo].[Dealer] (NOLOCK) WHERE ([DealerID] = @DealerID))
BEGIN
    INSERT INTO [FVS].[dbo].[Dealer]
           ([DealerName]
           ,[Address1]
           ,[Address2]
           ,[StateOrRegion]
           ,[Phone]
           ,[Fax])
     VALUES
           (@DealerName
           ,@Address1
           ,@Address2
           ,@StateOrRegion
           ,@Phone
           ,@Fax)
           
        SELECT @DealerID = SCOPE_IDENTITY();
END

ELSE
BEGIN
    UPDATE
        [dbo].[Dealer]
    SET
            [DealerName] = @DealerName
           ,[Address1] = @Address1
           ,[Address2] = @Address2
           ,[StateOrRegion] = @StateOrRegion
           ,[Phone] = @Phone
           ,[Fax] = @Fax
    WHERE
    ([DealerID] = @DealerID)
END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login]
(
    @IsSuccess BIT OUTPUT,
    @Username VARCHAR(50) = NULL,
    @Password VARCHAR(50) = NULL
)   
AS
BEGIN
    IF EXISTS(Select UserName FROM Account
                    WHERE
                    UserName = @UserName
                    AND
                    [Password] = @Password)
                    SET @IsSuccess = 1
                    ELSE
                    SET @IsSuccess = 0
END
GO
/****** Object:  StoredProcedure [dbo].[AccountExistsCheck]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AccountExistsCheck]
(
    @UserNameInUse BIT OUTPUT,
    @UserName VARCHAR(50)
)
AS
BEGIN
    SET @UserNameInUse = 0
    IF EXISTS(SELECT Username from Account WHERE Username = @Username)
    SET @UserNameInUse = 1
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInventoryItem]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteInventoryItem]
@VendorNumber varchar(50) = NULL
AS
DELETE FROM Inventory WHERE
VendorID = @VendorNumber
GO
/****** Object:  Table [dbo].[DealerContact]    Script Date: 12/14/2014 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DealerContact](
    [DealerContactID] [int] IDENTITY(1,1) NOT NULL,
    [DealerID] [int] NOT NULL,
    [FirstName] [varchar](500) NOT NULL,
    [LastName] [varchar](500) NOT NULL,
    [Phone] [varchar](50) NOT NULL,
    [Cell] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DealerContact] PRIMARY KEY CLUSTERED
(
    [DealerContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetVendorItems]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        benstieglitz@msn.com
-- Create date: 4-29-2014
-- Description:    Fetch Vendor Items
-- =============================================
CREATE PROCEDURE [dbo].[GetVendorItems]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [VendorID]
      ,[VendorNumber]
      ,[VendorName]
      ,[Region]
      ,[Address1]
      ,[Address2]
      ,[Phone]
      ,[Fax]
  FROM [FVS].[dbo].[Vendor]
END
GO
/****** Object:  StoredProcedure [dbo].[GetVendorByID]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        benstieglitz@msn.com
-- Create date: 5-3-2014
-- Description:    Fetch Vendor Item for a given ID
-- =============================================
CREATE PROCEDURE [dbo].[GetVendorByID]
    @VendorID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [VendorID]
      ,[VendorNumber]
      ,[VendorName]
      ,[Region]
      ,[Address1]
      ,[Address2]
      ,[Phone]
      ,[Fax]
  FROM [FVS].[dbo].[Vendor]
  WHERE VendorID = @VendorID
END
GO
/****** Object:  StoredProcedure [dbo].[GetInventoryItems]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        benstieglitz@msn.com
-- Create date: 1-29-2014
-- Description:    Fetch Inventory Items using Short Circuit
-- =============================================
CREATE PROCEDURE [dbo].[GetInventoryItems]
    @InventoryID [int] = NULL,
    @VendorID [int] = NULL,
    @City [varchar](50) = NULL,
    @State [varchar](50) = NULL,
    @Region [nvarchar] (50) = NULL,
    @StockNumber [varchar](50) = NULL,
    @VIN [varchar](50) = NULL,
    @Year [int] = NULL,
    @Make [varchar](50) = NULL,
    @Model [varchar](50) = NULL,
    @Style [varchar](50)= NULL,
    @Trim [varchar](250) = NULL,
    @Fuel [varchar](50) = NULL,
    @Transmission [varchar](50) = NULL,
    @Drivetrain [varchar](50) = NULL,
    @ExteriorColor [varchar](50) = NULL,
    @Mileage [int] = NULL,
    @MileageRangeBottom [int] = NULL,
    @MileageRangeTop [int] = NULL,
    @Cost [decimal](18, 2) = NULL,
    @CreateDate [datetime] = NULL,
    @ModifiedDate [datetime] = NULL,
    @CreatedByID [int] = NULL,
    @LastUpdatedByID [int] = NULL,
    @IsActive [bit] = NULL
      
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [InventoryID]
      ,[VendorID]
      ,[City]
      ,[State]
      ,[Region]
      ,[StockNumber]
      ,[VIN]
      ,[Year]
      ,[Make]
      ,[Model]
      ,[Style]
      ,[Trim]
      ,[Fuel]
      ,[Transmission]
      ,[Drivetrain]
      ,[ExteriorColor]
      ,[Mileage]
      ,[MileageRangeBottom]
      ,[MileageRangeTop]
      ,[Cost]
      ,[CreateDate]
      ,[ModifiedDate]
      ,[CreatedByID]
      ,[LastUpdatedByID]
      ,[IsActive]
  FROM [FVS].[dbo].[Inventory]
  WHERE
   (
        @InventoryID IS NULL
        OR
        InventoryID = @InventoryID
    )
    AND
    (
        @VendorID IS NULL
        OR
        VendorID = @VendorID
    )
    AND
    (
        @StockNumber IS NULL
        OR
        StockNumber = @StockNumber
    )
    AND
    (
        @State IS NULL
        OR
        [State] = @State
    )
    AND
    (
        @Region IS NULL
        OR
        Region = @Region
    )
    AND
    (
        @VIN IS NULL
        OR
        VIN = @VIN
     )
     AND
     (
        @Year IS NULL
        OR
        [Year] = @Year
      )
      AND
      (
        @Make IS NULL
        OR
        Make = @Make
      )
      AND
      (
        @Model IS NULL
        OR
        Model = @Model
      )
      AND
      (
        @Style IS NULL
        OR
        Style = @Style
      )
      AND
      (
        @Fuel IS NULL
        OR
        Fuel = @Fuel
      )
      AND
      (
        @Transmission IS NULL
        OR
        Transmission = @Transmission
      )
      AND
      (
        @DriveTrain IS NULL
        OR
        DriveTrain = @DriveTrain
      )
      AND
      (
        @ExteriorColor IS NULL
        OR
        ExteriorColor = @ExteriorColor
      )
      AND
      (
        @Cost IS NULL
        OR
        Cost = @Cost
      )
      AND
      (
        @IsActive IS NULL
        OR
        IsActive = @IsActive
      )
END
GO
/****** Object:  StoredProcedure [dbo].[GetImage]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetImage]
(
    @Year INT,
    @Make VARCHAR(100),
    @Model VARCHAR(100),
    @SubModel VARCHAR(100) = NULL
)
AS
BEGIN
    IF(@SubModel IS NULL)
        BEGIN
            SELECT
                ImageID,
                [Year],
                [Make],
                [Model],
                [SubModel]
            FROM
                [Image]
            WHERE
                [Year] = @Year
                    AND
                [Make] = @Make
                    AND
                [Model] = @Model
        END
    ELSE
        BEGIN
            SELECT
                ImageID,
                [Year],
                [Make],
                [Model],
                [SubModel]
            FROM
                [Image]
            WHERE
                [Year] = @Year
                    AND
                [Make] = @Make
                    AND
                [Model] = @Model
                    AND
                [SubModel] = @SubModel
        END
END
GO
/****** Object:  StoredProcedure [dbo].[GetDealerItems]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        benstieglitz@msn.com
-- Create date: 2-06-2014
-- Description:    Fetch Dealer Items using Short Circuit
-- =============================================
CREATE PROCEDURE [dbo].[GetDealerItems]
        @DealerID INT = NULL
      ,@DealerName VARCHAR(200) = NULL
      ,@Address1 VARCHAR(200) = NULL
      ,@Address2 VARCHAR(200) = NULL
      ,@StateOrRegion VARCHAR(50) = NULL
      ,@Phone VARCHAR(50) = NULL
      ,@Fax VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  [DealerID]
      ,[DealerName]
      ,[Address1]
      ,[Address2]
      ,[StateOrRegion]
      ,[Phone]
      ,[Fax]
  FROM [FVS].[dbo].[Dealer]
  WHERE
    (
        @DealerID IS NULL
        OR
        DealerID = @DealerID
    )
END
GO
/****** Object:  StoredProcedure [dbo].[GetAccount]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAccount]
(
    @Username VARCHAR(50)
)
AS
BEGIN
    SELECT
        AccountID,
        UserName,
        [Password],
        CreatedDate,
        AccountTypeID
    FROM
        Account
    WHERE UserName = @Username
       
END
GO
/****** Object:  StoredProcedure [dbo].[CreateAccount]    Script Date: 12/14/2014 03:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateAccount]
(
    @UserName VARCHAR(50),
    @Password VARCHAR(50),
    @AccountTypeID INT = 1
)
AS
BEGIN
    INSERT INTO [FVS].[dbo].[Account]
           ([UserName]
           ,[Password]
           ,[CreatedDate]
           ,[AccountTypeID])
     VALUES
           (@UserName
           ,@Password
           ,GETDATE()
           ,@AccountTypeID)
END
GO
/****** Object:  ForeignKey [FK_DealerContact_Dealer]    Script Date: 12/14/2014 03:09:15 ******/
ALTER TABLE [dbo].[DealerContact]  WITH CHECK ADD  CONSTRAINT [FK_DealerContact_Dealer] FOREIGN KEY([DealerID])
REFERENCES [dbo].[Dealer] ([DealerID])
GO
ALTER TABLE [dbo].[DealerContact] CHECK CONSTRAINT [FK_DealerContact_Dealer]
GO
