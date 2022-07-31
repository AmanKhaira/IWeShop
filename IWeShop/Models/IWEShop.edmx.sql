
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/31/2022 13:20:49
-- Generated from EDMX file: C:\Users\User\Desktop\IWeShop\IWeShop\IWeShop\Models\IWEShop.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [IWeShopdb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Order_Detail_Order_Master]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_Detail] DROP CONSTRAINT [FK_Order_Detail_Order_Master];
GO
IF OBJECT_ID(N'[dbo].[FK_Order_Master_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_Master] DROP CONSTRAINT [FK_Order_Master_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_Order_Master_Status_Master]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_Master] DROP CONSTRAINT [FK_Order_Master_Status_Master];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Image_Product_Master]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product_Image] DROP CONSTRAINT [FK_Product_Image_Product_Master];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Master_Product_Category_Master]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product_Master] DROP CONSTRAINT [FK_Product_Master_Product_Category_Master];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Customer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customer];
GO
IF OBJECT_ID(N'[dbo].[Order_Detail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order_Detail];
GO
IF OBJECT_ID(N'[dbo].[Order_Master]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order_Master];
GO
IF OBJECT_ID(N'[dbo].[Product_Category_Master]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product_Category_Master];
GO
IF OBJECT_ID(N'[dbo].[Product_Image]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product_Image];
GO
IF OBJECT_ID(N'[dbo].[Product_Master]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product_Master];
GO
IF OBJECT_ID(N'[dbo].[Status_Master]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status_Master];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(64)  NOT NULL,
    [Name] nvarchar(20)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(64)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] nvarchar(64)  NOT NULL,
    [RoleId] nvarchar(64)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(64)  NOT NULL,
    [UserName] nvarchar(128)  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [AddOn] datetime  NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL
);
GO

-- Creating table 'Order_Detail'
CREATE TABLE [dbo].[Order_Detail] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [OrderId] int  NULL,
    [ProductId] int  NULL,
    [Price] decimal(18,2)  NULL,
    [Quantity] int  NULL,
    [TotalAmount] decimal(18,2)  NULL
);
GO

-- Creating table 'Order_Master'
CREATE TABLE [dbo].[Order_Master] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [OrderNumber] int  NULL,
    [OrderDate] datetime  NULL,
    [CustomerId] int  NULL,
    [OrderAmount] decimal(18,2)  NULL,
    [StatusId] tinyint  NULL
);
GO

-- Creating table 'Product_Category_Master'
CREATE TABLE [dbo].[Product_Category_Master] (
    [CategoryID] int IDENTITY(1,1) NOT NULL,
    [CategoryName] varchar(30)  NULL
);
GO

-- Creating table 'Product_Image'
CREATE TABLE [dbo].[Product_Image] (
    [ImageID] int IDENTITY(1,1) NOT NULL,
    [ProductID] int  NULL,
    [ImagePath] varchar(100)  NULL,
    [IsDefault] bit  NOT NULL
);
GO

-- Creating table 'Product_Master'
CREATE TABLE [dbo].[Product_Master] (
    [ProductID] int IDENTITY(1,1) NOT NULL,
    [CategoryID] int  NULL,
    [ProductName] varchar(30)  NULL,
    [ProductDesc] varchar(500)  NULL,
    [Price] decimal(18,2)  NULL,
    [Discount] decimal(18,2)  NULL,
    [IsActive] bit  NOT NULL
);
GO

-- Creating table 'Status_Master'
CREATE TABLE [dbo].[Status_Master] (
    [StatusId] tinyint IDENTITY(1,1) NOT NULL,
    [Title] varchar(20)  NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerId] int IDENTITY(1,1) NOT NULL,
    [FirstName] varchar(50)  NULL,
    [LastName] varchar(50)  NULL,
    [Mobile] varchar(10)  NULL,
    [Email] varchar(50)  NULL,
    [CustomerAddress] varchar(200)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [UserId], [RoleId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([UserId], [RoleId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Order_Detail'
ALTER TABLE [dbo].[Order_Detail]
ADD CONSTRAINT [PK_Order_Detail]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [OrderID] in table 'Order_Master'
ALTER TABLE [dbo].[Order_Master]
ADD CONSTRAINT [PK_Order_Master]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [CategoryID] in table 'Product_Category_Master'
ALTER TABLE [dbo].[Product_Category_Master]
ADD CONSTRAINT [PK_Product_Category_Master]
    PRIMARY KEY CLUSTERED ([CategoryID] ASC);
GO

-- Creating primary key on [ImageID] in table 'Product_Image'
ALTER TABLE [dbo].[Product_Image]
ADD CONSTRAINT [PK_Product_Image]
    PRIMARY KEY CLUSTERED ([ImageID] ASC);
GO

-- Creating primary key on [ProductID] in table 'Product_Master'
ALTER TABLE [dbo].[Product_Master]
ADD CONSTRAINT [PK_Product_Master]
    PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

-- Creating primary key on [StatusId] in table 'Status_Master'
ALTER TABLE [dbo].[Status_Master]
ADD CONSTRAINT [PK_Status_Master]
    PRIMARY KEY CLUSTERED ([StatusId] ASC);
GO

-- Creating primary key on [CustomerId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [OrderId] in table 'Order_Detail'
ALTER TABLE [dbo].[Order_Detail]
ADD CONSTRAINT [FK_Order_Detail_Order_Master]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[Order_Master]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_Detail_Order_Master'
CREATE INDEX [IX_FK_Order_Detail_Order_Master]
ON [dbo].[Order_Detail]
    ([OrderId]);
GO

-- Creating foreign key on [StatusId] in table 'Order_Master'
ALTER TABLE [dbo].[Order_Master]
ADD CONSTRAINT [FK_Order_Master_Status_Master]
    FOREIGN KEY ([StatusId])
    REFERENCES [dbo].[Status_Master]
        ([StatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_Master_Status_Master'
CREATE INDEX [IX_FK_Order_Master_Status_Master]
ON [dbo].[Order_Master]
    ([StatusId]);
GO

-- Creating foreign key on [CategoryID] in table 'Product_Master'
ALTER TABLE [dbo].[Product_Master]
ADD CONSTRAINT [FK_Product_Master_Product_Category_Master]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Product_Category_Master]
        ([CategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Master_Product_Category_Master'
CREATE INDEX [IX_FK_Product_Master_Product_Category_Master]
ON [dbo].[Product_Master]
    ([CategoryID]);
GO

-- Creating foreign key on [ProductID] in table 'Product_Image'
ALTER TABLE [dbo].[Product_Image]
ADD CONSTRAINT [FK_Product_Image_Product_Master]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product_Master]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Image_Product_Master'
CREATE INDEX [IX_FK_Product_Image_Product_Master]
ON [dbo].[Product_Image]
    ([ProductID]);
GO

-- Creating foreign key on [CustomerId] in table 'Order_Master'
ALTER TABLE [dbo].[Order_Master]
ADD CONSTRAINT [FK_Order_Master_Customer]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_Master_Customer'
CREATE INDEX [IX_FK_Order_Master_Customer]
ON [dbo].[Order_Master]
    ([CustomerId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------