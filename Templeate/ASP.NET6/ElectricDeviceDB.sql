USE MASTER
GO

IF(EXISTS(SELECT * FROM SYSDATABASES WHERE NAME = 'ElectronicDeviceShopDB'))
	DROP DATABASE ElectronicDeviceShopDB
GO

CREATE DATABASE ElectronicDeviceShopDB
GO

USE ElectronicDeviceShopDB
GO

CREATE TABLE Categories
(
	ID_Category INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(255) NOT NULL,
	Icon NVARCHAR(255) NOT NULL,
	[Status] BIT NOT NULL,
) 
GO

CREATE TABLE Suplliers
(
	ID_Supllier INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(255) NOT NULL,
	Icon NVARCHAR(255) NOT NULL,
	[Status] BIT NOT NULL,
) 
GO


CREATE TABLE Products
(
	ID_Product INT IDENTITY PRIMARY KEY,
	ID_Category INT NOT NULL,
	ID_Supplier INT NOT NULL,
	[Name] NVARCHAR(255) NOT NULL,
	Price Money NOT NULL,
	Model NVARCHAR(255) NOT NULL,
	Amount INT NOT NULL,
	Guarantee INT NOT NULL,
	Origin NVARCHAR(255) NULL,
	Discount SMALLINT NULL,
	ShortDescription NVARCHAR(255) NULL,
	Detail NTEXT NULL,
	[Image] NVARCHAR(255) NOT NULL,
	[Status] BIT NOT NULL,
	CONSTRAINT FK_Products_Categories FOREIGN KEY (ID_Category) REFERENCES Categories(ID_Category),
	CONSTRAINT FK_Products_Suplliers FOREIGN KEY (ID_Supplier) REFERENCES Suplliers(ID_Supllier)
) 
GO

CREATE TABLE Accounts
(
	ID_Account INT IDENTITY PRIMARY KEY,
	UserName Varchar(255) UNIQUE NOT NULL,
	[Password] Varchar(255) NOT NULL,
	FullName NVARCHAR(255) NOT NULL,
	Phone Char(20) NULL,
	[Address] NVARCHAR(255) NULL,
	Email Varchar(50) NULL,
	Avatar NVARCHAR(255) NULL,
	[Status] BIT NOT NULL,
) 
GO

CREATE TABLE Carts
(
	ID_Cart INT IDENTITY PRIMARY KEY,  
	ID_Product INT NOT NULL,
	ID_Account INT NOT NULL,
	Amount INT NOT NULL,
	[Status] BIT NOT NULL,
	CONSTRAINT FK_Carts_Products FOREIGN KEY (ID_Product) REFERENCES Products(ID_Product),
	CONSTRAINT FK_Carts_Accounts FOREIGN KEY (ID_Account) REFERENCES Accounts(ID_Account)

) 
GO

CREATE TABLE Bills
(
	ID_Bill INT IDENTITY PRIMARY KEY,
	ID_Account INT NOT NULL,
	ReceiverName NVARCHAR(50) NOT NULL,
	ReceiverAddress NVARCHAR(255) NOT NULL,
	ReceiverEmail Varchar(255) NOT NULL,
	ReceiverPhone Char(20) NOT NULL,
	Note NTEXT NULL,
	PayType NVARCHAR(255) NOT NULL,
	[Status] BIT NOT NULL,
	CONSTRAINT FK_Bills_Accounts FOREIGN KEY (ID_Account) REFERENCES Accounts(ID_Account)
)
GO

CREATE TABLE BillDetails
(
	ID_Billdetail INT IDENTITY PRIMARY KEY,
	ID_Product INT NOT NULL,
	ID_Bill INT NOT NULL,
	Amount INT NOT NULL,
	CurrentlyPrice Money NOT NULL,
	CONSTRAINT FK_BillDetails_Product FOREIGN KEY (ID_Product) REFERENCES Products(ID_Product),
	CONSTRAINT FK_BillDetails_Bill FOREIGN KEY (ID_Bill) REFERENCES Bills(ID_Bill)
) 
GO

INSERT dbo.Categories ([Name], Icon, [Status]) VALUES
(N'Bình tắm nóng lạnh', N'icon-binh-tam-nong-lanh.png', 1),
(N'Điều hòa nhiệt độ', N'icon-dieu-hoa.png', 1),
(N'Nồi chiên không dầu', N'icon-noi-chien.png', 1),
(N'Tivi, Loa - Âm thanh', N'icon-tivi-loa-am-thanh.png', 1),
(N'Tủ lạnh, Tủ đông, Tủ mát', N'icon-tu-lanh-tu-dong-tu-mat.png', 1)

GO
SELECT * FROM Categories

INSERT INTO dbo.Products (ID_Category, [Name], Price, Model, Amount, Guarantee, Origin, Discount, ShortDescription, Detail, [Image], [Status]) VALUES
(1, N'Bình nóng lạnh gián tiếp Roler 30L WH-8113 kiểu vuông', 3990000, N'WH-8113', 10, 12, N'Malaysia', 0, N'Bình nóng lạnh gián tiếp Roler 30L WH-8113 kiểu vuông',N'Cơ chế làm nóng gián tiếp phù hợp cho các vùng có khí hậu lạnh (dưới 20 độ C). Dung tích 30 lít, dành cho những gia đình nhỏ có khoảng 4 thành viên. Vỏ chống thấm nước chuẩn IPX1 giúp linh kiện không bị bám nước gây chập mạch.Lòng bình tráng men Titan ngăn chặn rò rỉ nước bên trong, kéo dài tuổi thọ cho bình nước nóng Đèn báo đang đun nước và đèn báo nước đã sẵn sàng dùng.Thanh đốt 100% bằng đồng cho hiệu quả làm nóng nhanh chóng Hệ thống an toàn đồng bộ TSS giúp chống giật và chống bỏng hiệu quả.Công nghệ Ag+ kháng khuẩn bảo vệ sức khỏe cho người dùng ',N'-t2k636.png', 1),
(1, N'', , N'',20 ,12 , N'Malaysia', 0, N'', N'', N'', 1),
(1, N'', , N'',30 ,12 , N'Malaysia', 0, N'', N'', N'', 1),
(1, N'', , N'',50 ,12 , N'Malaysia', 0, N'', N'', N'', 1),
(1, N'', , N'',60 ,12 , N'Malaysia', 0, N'', N'', N'', 1),
(1, N'', , N'',25 ,6 , N'Malaysia', 0, N'', N'', N'', 1),
(1, N'', , N'',24 ,24 , N'Malaysia', 0, N'', N'', N'', 1),
(1, N'', , N'',35 ,12 , N'Malaysia', 0, N'', N'', N'', 1),
(1, N'', , N'',52 ,12 , N'Malaysia', 0, N'', N'', N'', 1),
(1, N'', , N'',45 ,12 , N'Malaysia', 0, N'', N'', N'', 1),


 GO
