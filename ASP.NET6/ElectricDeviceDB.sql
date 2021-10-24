/*
Created		14/06/2021
Modified		14/06/2021
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/

USE master
GO

IF(EXISTS(SELECT * FROM SYSDATABASES WHERE NAME='ElectronicDevice'))
	DROP DATABASE ElectronicDevice
GO

CREATE DATABASE ElectronicDevice
GO

USE ElectronicDevice
GO
Create table [Category]
(
	[ID_Category] Integer Identity NOT NULL,
	[Name] Nvarchar(255) NOT NULL,
	[Icon] Nvarchar(255) NOT NULL,
	[Status] Bit NOT NULL,
Primary Key ([ID_Category])
) 
go

Create table [Product]
(
	[ID_Product] Integer Identity NOT NULL,
	[ID_Category] Integer NOT NULL,
	[Name] Nvarchar(255) NOT NULL,
	[Price] Money NOT NULL,
	[Model] Nvarchar(255) NOT NULL,
	[Amount] Integer NOT NULL,
	[Guarantee] Integer NOT NULL,
	[Origin] Nvarchar(255) NULL,
	[Discount] Smallint NULL,
	[ShortDescription] Nvarchar(255) NULL,
	[Detail] Ntext NULL,
	[Image] Nvarchar(255) NOT NULL,
	[Status] Bit NOT NULL,
Primary Key ([ID_Product])
) 
go

Create table [Account]
(
	[ID_Account] Integer Identity NOT NULL,
	[ID_Role] Integer NOT NULL,
	[UserName] Varchar(255) NOT NULL, UNIQUE ([UserName]),
	[Password] Varchar(255) NOT NULL,
	[FullName] Nvarchar(255) NOT NULL,
	[Phone] Char(20) NULL,
	[Address] Nvarchar(255) NULL,
	[Email] Varchar(50) NULL,
	[Status] Bit NOT NULL,
	[Avatar] Nvarchar(255) NULL,
Primary Key ([ID_Account])
) 
go

Create table [Role]
(
	[ID_Role] Integer Identity NOT NULL,
	[Name] Nvarchar(255) NOT NULL,
	[Code] Varchar(50) NOT NULL,
Primary Key ([ID_Role])
) 
go

Create table [Cart]
(
	[ID_Product] Integer NOT NULL,
	[ID_Account] Integer NOT NULL,
	[Amount] Integer NOT NULL,
Primary Key ([ID_Product],[ID_Account])
) 
go

Create table [Feedback]
(
	[ID_Product] Integer NOT NULL,
	[ID_Account] Integer NOT NULL,
	[Content] Nvarchar(255) NOT NULL,
	[CreateDate] Datetime NOT NULL,
	[Status] Bit NOT NULL,
Primary Key ([ID_Product],[ID_Account])
) 
go

Create table [Promotion]
(
	[ID_Promotion] Integer Identity NOT NULL,
	[Content] Ntext NOT NULL,
	[CreateDate] Datetime NOT NULL,
	[ModifyDate] Datetime NOT NULL,
	[Status] Bit NOT NULL,
	[ID_Product] Integer NOT NULL,
Primary Key ([ID_Promotion])
) 
go

Create table [Bill]
(
	[ID_Bill] Integer Identity NOT NULL,
	[ID_Account] Integer NOT NULL,
	[ReceiverName] Nvarchar(50) NOT NULL,
	[ReceiverAddress] Nvarchar(255) NOT NULL,
	[ReceiverEmail] Varchar(255) NOT NULL,
	[ReceiverPhone] Char(20) NOT NULL,
	[Note] Ntext NULL,
	[PayType] Nvarchar(255) NOT NULL,
	[Status] Bit NOT NULL,
Primary Key ([ID_Bill])
) 
go

Create table [BillDetail]
(
	[ID_Product] Integer NOT NULL,
	[ID_Bill] Integer NOT NULL,
	[Amount] Integer NOT NULL,
	[CurrentlyPrice] Money NOT NULL,
Primary Key ([ID_Product],[ID_Bill])
) 
go

Create table [News]
(
	[ID_News] Integer Identity NOT NULL,
	[Content] Ntext NOT NULL,
	[Title] Nvarchar(255) NOT NULL,
	[ShortDescription] Nvarchar(255) NULL,
	[Thumbnail] Nvarchar(255) NULL,
	[CreateDate] Datetime NOT NULL,
	[Status] Bit NOT NULL,
Primary Key ([ID_News])
) 
go

Create table [AboutUs]
(
	[ID_AboutUs] Integer Identity NOT NULL,
	[Content] Ntext NOT NULL,
Primary Key ([ID_AboutUs])
) 
go


Alter table [Product] add  foreign key([ID_Category]) references [Category] ([ID_Category])  on update no action on delete no action 
go
Alter table [Cart] add  foreign key([ID_Product]) references [Product] ([ID_Product])  on update no action on delete no action 
go
Alter table [Feedback] add  foreign key([ID_Product]) references [Product] ([ID_Product])  on update no action on delete no action 
go
Alter table [Promotion] add  foreign key([ID_Product]) references [Product] ([ID_Product])  on update no action on delete no action 
go
Alter table [BillDetail] add  foreign key([ID_Product]) references [Product] ([ID_Product])  on update no action on delete no action 
go
Alter table [Cart] add  foreign key([ID_Account]) references [Account] ([ID_Account])  on update no action on delete no action 
go
Alter table [Feedback] add  foreign key([ID_Account]) references [Account] ([ID_Account])  on update no action on delete no action 
go
Alter table [Bill] add  foreign key([ID_Account]) references [Account] ([ID_Account])  on update no action on delete no action 
go
Alter table [Account] add  foreign key([ID_Role]) references [Role] ([ID_Role])  on update no action on delete no action 
go
Alter table [BillDetail] add  foreign key([ID_Bill]) references [Bill] ([ID_Bill])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go

SET IDENTITY_INSERT [dbo].[Category] ON 
INSERT [dbo].[Category] ([ID_Category], [Name], [Icon], [Status]) VALUES (3, N'Điều hòa nhiệt độ', N'icon_dieu_hoa.png', 1)
INSERT [dbo].[Category] ([ID_Category], [Name], [Icon], [Status]) VALUES (4, N'Tivi, Loa - Am thanh', N'icon-tivi-loa-am-thanh.png', 1)
INSERT [dbo].[Category] ([ID_Category], [Name], [Icon], [Status]) VALUES (5, N'Máy giặt, Máy sấy quần áo', N'icon-may-giat-may-say.png', 1)
INSERT [dbo].[Category] ([ID_Category], [Name], [Icon], [Status]) VALUES (6, N'Tủ lạnh, Tủ đông, Tủ mát', N'icon-tu-lanh-tu-dong-tu-mat.png', 1)
INSERT [dbo].[Category] ([ID_Category], [Name], [Icon], [Status]) VALUES (8, N'Quạt mát các loại', N'icon-quat-mat-cac-loai.png', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (4, 6, N'TỦ ĐÔNG SANAKY 260L INVERTER VH-3699W3', 6990000.0000, N'A', 45, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (5, 6, N'TỦ ĐÔNG 400L INVERTER SANAKY 2 NGĂN VH 4099W3', 123453.0000, N'B', 12, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (6, 6, N'TỦ ĐÔNG 280L INVERTER SANAKY 2 NGĂN VH-2899W3', 452412.0000, N'S', 35, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (7, 6, N'TỦ ĐÔNG 400L INVERTER SANAKY 1 NGĂN VH-4099A3', 84531.0000, N'G', 12, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (8, 6, N'TỦ ĐÔNG SANAKY INVERTER 260L VH-3699W4K', 12348534.0000, N'F', 10, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (9, 6, N'TỦ ĐÔNG SANAKY INVERTER 280L VH-4099A4K', 123453.0000, N'V', 78, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (10, 6, N'TỦ ĐÔNG SANAKY INVERTER 305L VH-4099W4K', 12345.0000, N'H', 54, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (11, 6, N'TỦ ĐÔNG 280L INVERTER SANAKY 1 NGĂN VH 2899A3', 1234534.0000, N'A', 12, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (12, 6, N'TỦ ĐÔNG SANAKY 230L VH 230HY', 1235345.0000, N'R', 123, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (13, 6, N'TỦ ĐÔNG KANGAROO 809L KG809C1', 84645.0000, N'V', 40, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (14, 6, N'TỦ ĐÔNG KANGAROO KG399NC1 286 LÍT - KHÁNG KHUẨN', 442121.0000, N'H', 78, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (15, 6, N'TỦ ĐÔNG SANAKY 208L VH-2599A2KD', 4567842.0000, N'R', 12, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (16, 6, N'TỦ ĐÔNG KANGAROO 90L KG168NC1', 42452345.0000, N'J', 75, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (17, 6, N'TỦ ĐÔNG LG INVERTER 165L GN-F304PS', 4548534534.0000, N'Z', 91, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (18, 6, N'TỦ ĐÔNG LG INVERTER 165L GN-F304WB', 4834534.0000, N'G', 12, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (19, 6, N'TỦ ĐÔNG MỀM KANGAROO 212L KG328DM2', 483434.0000, N'K', 35, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (20, 6, N'TỦ ĐÔNG SANAKY INVERTER 365L DÀN ĐỒNG VH-5699W3', 48534853.0000, N'R', 43, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (21, 6, N'TỦ ĐÔNG SANAKY 208L VH-2599A2K', 4538434.0000, N'Z', 78, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (22, 6, N'TỦ ĐÔNG MỀM KANGAROO 192L KG268DM2', 48348534.0000, N'S', 123, 1, N'VN', 0, N'mô tả ngắn', N'Chi tiết', N'thumb_tu-dong-sanaky-inverter-400-lit-vh5699w3-6ydR8O.png', 1)

INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (23, 3, N'Điều hòa Panasonic 1 chiều 9000BTU CS-N9WKH-8M', 8890000.0000, N'CS-N9WKH-8M', 10, 12, N'Malaysia', 0, N'ĐIỀU HÒA PANASONIC', N'Nội dung', N'dieu-hoa-panasonic-1-chieu-9000btu-csn9wkh8m-wH2k4X.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (24, 3, N'Điều hòa Casper 1 chiều 12000BTU SC-12TL32', 7990000.0000, N'SC-12TL32', 20, 12, N'Malaysia', 0, N'ĐIỀU HÒA CASPER', N'Nội dung', N'dieu-hoa-casper-1-chieu-12000btu-sc12tl32-210d6q.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (25, 3, N'Điều hòa Gree 1 chiều Inverter 9000BTU GWC09PB-K3D0P4', 7000000.0000, N'GWC09PB-K3D0P4', 10, 12, N'Trung Quốc', 0, N'ĐIỀU HÒA GREE', N'Nội dung', N'dieu-hoa-gree-1-chieu-inverter-9000btu-gwc09pbk3d0p4-huR772.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (26, 3, N'Điều hòa Midea 1 chiều 9.000BTU MSMA3-10CRN1', 8000000.0000, N'MSMA3-10CRN1', 20, 36, N'Việt Nam', 0, N'ĐIÊU HÒA MIDEA', N'Nội dung', N'dieu-hoa-midea-1-chieu-9000btu-msma310crn1-291nZR.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (27, 3, N'Điều hòa Samsung Wind-Free 1 chiều Inverter 12000BTU AR13TYGCDWKNSV', 9000000.0000, N'AR13TYGCDWKNSV', 10, 24, N'Thái Lan', 0, N'ĐIỀU HÒA SAMSUNG', N'Nội dung', N'dieu-hoa-samsung-windfree-1-chieu-inverter-12000btu-ar13tygcdwknsv-8CN26y.png', 1)

INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (44, 8, N'quat-treo-tuong-coex-cw7210-17XRkL.png', 690000.0000, N'CW-7210', 100, 24, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (45, 8, N'QUẠT TRẦN 5 CÁNH MITSUBISHI C56-RW5 SF XÁM NHẠT', 700000.0000, N'CW-7211', 45, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (46, 8, N'QUẠT TREO TƯỜNG COEX CW-7210A - ĐIỀU KHIỂN TỪ XA', 500000.0000, N'CW-7212', 12, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (47, 8, N'QUẠT TREO TƯỜNG COEX CW-7210', 400000.0000, N'CW-7213', 32, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (48, 8, N'QUẠT CÂY TOSHIBA INVERTER DC F-LSD10(H) - CÓ ĐIỀU KHIỂN', 650000.0000, N'CW-7214', 43, 24, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 0)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (49, 8, N'QUẠT LỬNG MIDEA FTS40-17VD', 750000.0000, N'CW-7215', 54, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 0)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (50, 8, N'QUẠT HỘP MIDEA FB40-9H', 850000.0000, N'CW-7216', 65, 24, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (51, 8, N'QUẠT LỬNG SENKO L1638/LL1338-THÂN NHỰA', 100000.0000, N'CW-7217', 43, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (52, 8, N'QUẠT LỬNG SENKO LS103/LS1630-ỐNG SẮT', 200000.0000, N'CW-7218', 12, 24, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (53, 8, N'QUẠT TREO TƯỜNG SENKO TC16', 120000.0000, N'CW-7219', 43, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (54, 8, N'QUẠT CÂY ĐIỆN CƠ QD400X-MS - CÓ ĐIỀU KHIỂN', 200000.0000, N'CW-7220', 54, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (55, 8, N'QUẠT CÂY ĐIỆN CƠ QD450-DM', 350000.0000, N'CW-7221', 8, 24, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (56, 8, N'QUẠT CÂY MIDEA FS40-15QR CÓ ĐIỀU KHIỂN', 300000.0000, N'CW-7222', 12, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (57, 8, N'QUẠT TREO TƯỜNG MIDEA FW40-15VF', 400000.0000, N'CW-7223', 54, 24, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (58, 8, N'QUẠT TREO TƯỜNG MIDEA FW40-7JR', 500000.0000, N'CW-7224', 123, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (59, 8, N'QUẠT TREO TƯỜNG MIDEA FW40-6H', 400000.0000, N'CW-7225', 54, 24, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (60, 8, N'QUẠT HỘP MIDEA KYT30-15A', 350000.0000, N'CW-7226', 23, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (61, 8, N'QUẠT CÂY MIDEA FS40-15Q', 100000.0000, N'CW-7227', 43, 24, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (62, 8, N'QUẠT HỘP ĐIỆN CƠ TN QH 300-LP', 200000.0000, N'CW-7228', 54, 12, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (63, 8, N'QUẠT CÂY MITSUBISHI LV16RS/RT/RV-SF-GY-GHI NHẠT', 500000.0000, N'CW-7229', 23, 24, N'Trung Quốc', 0, N'Quạt làm mát nhanh, ít tốn điện với công suất 50 W.', N'Quạt treo tường Coex CW-7210 có thiết kế nhỏ gọn, sang trọng và đẹp mắt. Quạt mang đến sự an toàn khi sử dụng và giúp tiết kiệm không gian sinh hoạt cho gia đình bạn.', N'quat-treo-tuong-coex-cw7210-17XRkL.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (64, 4, N'LOA SOUNDBAR SAMSUNG HW-T550/XV 2.1CH', 400000.0000, N'CT-7200', 23, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (65, 4, N'DÀN ÂM THANH SOUNDBAR SONY HT-S20R//C', 230000.0000, N'CT-7201', 43, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (66, 4, N'LOA SOUNDBAR SAMSUNG HW-T450/XV 2.1CH', 3000000.0000, N'CT-7202', 12, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (67, 4, N'DÀN ÂM THANH SOUND BAR SONY HT-S350//M 2.1 CH', 4000000.0000, N'CT-7203', 34, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (68, 4, N'DÀN ÂM THANH SONY HT-RT3 5.1 CH/ NFC/ BLUETOOTH', 5000000.0000, N'CT-7204', 123, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (69, 4, N'LOA SOUNDBAR SAMSUNG HW-A450/XV', 10000000.0000, N'CT-7205', 43, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (70, 4, N'LOA SOUNDBAR SAMSUNG HW-T420/XV 2.1CH', 9000000.0000, N'CT-7206', 23, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (71, 4, N'LOA SOUNDBAR LG SL4 2.1 CH', 6500000.0000, N'CT-7207', 54, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (72, 4, N'LOA SOUNDBAR SAMSUNG HW-Q600A/XV', 15000000.0000, N'CT-7207', 23, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (73, 4, N'LOA SOUND BAR SONY HT-S100F', 20000000.0000, N'CT-7209', 54, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (74, 4, N'LOA SOUNDBAR SAMSUNG HW-Q70T/XV 3.1.2 CH', 14000000.0000, N'CT-7210', 23, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (75, 4, N'LOA SOUNDBAR SAMSUNG HW-T650/XV 3.1CH', 13000000.0000, N'CT-7211', 64, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (76, 4, N'DÀN ÂM THANH SOUNDBAR SONY HT-S500RF 5.1', 15000000.0000, N'CT-7212', 234, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (77, 4, N'DÀN ÂM THANH SONY HT-S700RF', 12000000.0000, N'CT-7213', 65, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (78, 4, N'LOA SOUNDBAR LG SN5R 4.1 CH', 4000000.0000, N'CT-7214', 234, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (79, 4, N'LOA SOUNDBAR SAMSUNG HW-Q60T/XV 5.1CH', 35000000.0000, N'CT-7215', 54, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (80, 4, N'LOA SOUNDBAR SAMSUNG HW-Q700A/XV', 30000000.0000, N'CT-7216', 234, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (81, 4, N'LOA SOUNDBAR SONY DOLBY ATMOS HT-X9000F', 10000000.0000, N'CT-7217', 54, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (82, 4, N'LOA SOUNDBAR SAMSUNG HW-A550/XV', 12000000.0000, N'CT-7218', 234, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (83, 4, N'LOA SOUNDBAR SAMSUNG HW-A650/XV', 13000000.0000, N'CT-7219', 234, 12, N'Trung Quốc', 0, N'Công nghệ Q-Symphony đồng bộ hoàn hảo với Samsung TV', N'Loa thanh Samsung đã được điều chỉnh và kiểm nghiệm bởi các kỹ sư hàng đầu thế giới tại phòng nghiên cứu âm thanh California Audio Lab. Thưởng thức chất âm tròn đầy, cân bằng hoàn hảo nhờ công nghệ âm thanh tăng cường và mô hình máy tính tiên tiến.', N'thumb_-00BMt7 (1).jpg', 1)

INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (84, 5, N'Máy giặt 9 Kg Electrolux EWF9025BQSA Inverter', 12990000.0000, N'EWF9025BQSA', 24, 0, N'Thái Lan', 24, N'a', N'Máy giặt cửa trước màu bạc sang trọng, hiện đại
Máy giặt Electrolux Inverter 9 Kg EWF9025BQSA với kiểu dáng cửa trước cùng sắc bạc sang trọng, hiện đại và viền cửa chrome bóng bẩy sẽ là điểm nhấn cho không gian nội thất của gia đình.

Bên cạnh đó, cửa máy giặt được thiết kế khá rộng, giúp bạn thuận tiện trong việc bỏ vào và lấy quần áo ra.

', N'-64I884.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (85, 5, N'Máy giặt lồng ngang Samsung Inverterter 9.5Kg WW95TA046AX/S', 13850000.0000, N'WW95TA046AX/SV', 12, 0, N'Việt Nam', 31, N'Công nghệ Inverter tiết kiệm điện

Công nghệ giặt hơi nước giúp ngăn ngừa vi khuẩn, nấm mốc

Giặt sạch hơn với công nghệ giặt Eco Bubble

Tính năng kiểm tra thông minh Smart Check', N'Giặt sạch sâu, bảo vệ sợi vải tốt hơn 45% với công nghệ giặt bong bóng siêu mịn EcoBubble
Máy giặt Samsung Inverter 9.5kg WW95TA046AX/SV với công nghệ EcoBubble sẽ đánh tan chất giặt tẩy với sự kết hợp giữa khí và nước, tạo thành bong bóng siêu mịn thẩm thấu vào sợi vải nhanh gấp 40 lần', N'-964Enf.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (86, 5, N'Máy giặt 8 Kg Electrolux EWF8025EQWA
', 10990000.0000, N'EWF8025EQWA', 11, 1, N'Thái Lan', 28, N'Công nghệ giặt hơi nước giảm thiểu nếp nhăn
Giặt đồ len dễ dàng với chứng nhận Woolmark
Chức năng giặt nhanh 15 phút phù hợp người bận rộnNULL', N'Kiểu dáng thanh lịch, tinh tế
Máy giặt Electrolux 8 Kg EWF8025EQWA mang kiểu dáng cửa trước kết hợp cùng sắc trắng thanh lịch, tinh tế sẽ là sự lựa chọn hoàn hảo cho những vị gia chủ yêu thích vẻ đẹp tối giản nhưng không kém phần sang trọng.', N'-soXWB4.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (87, 5, N'Máy giặt lồng ngang Samsung Inverter 8,5Kg WW85J42G0BX/SVL', 7190000.0000, N'WW85J42G0BX/SV', 10, 1, N'Việt Nam', NULL, N'Công nghệ Inverter giúp tiết kiệm năng lượng hiệu quả

Chế độ tự động vệ sinh lồng giặt giúp tiết kiệm thời gian và chi phí

Tính năng khóa trẻ em an toàn

Chế độ giặt nhanh 15 phút tiện lợiLL', N'Bảo vệ làn da, tránh tác nhân gây dị ứng, giảm nhăn sợi vải nhờ công nghệ giặt hơi nước Steam
Máy giặt Samsung Inverter 8.5 kg WW85J42G0BX/SV sở hữu công nghệ giặt hơi nước Steam, không chỉ xử lý hiệu quả các vết bẩn mà cho khả năng loại bỏ đến 99,9% vi khuẩn (được chứng nhận bởi Intertek) cũng như các tác nhân gây dị ứng khác bám trên quần áo, giúp bảo vệ làn da bạn được tốt hơn, nhất là làn da của trẻ nhỏ và người lớn tuổi.', N'-OWra1B.jpg', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (88, 5, N'Máy giặt 9 Kg Samsung Addwash WW90K54E0UX/SV hơi nước', 8990000.0000, N'WW90K54E0UX/SV', 15, 1, N'Việt Nam', NULL, N'Công nghệ giặt bong bóng
Ecobuble chăm sóc quần áo
Tính năng kiểm tra lỗi thông minh
Chế độ giặt ngâm bubble soak', N'Động cơ bền bỉ, tiết kiệm năng lượng
Công nghệ Digital đạt chuẩn châu Âu, giúp tiết kiệm năng lượng tối đa, vận hành bền bỉ vượt trội', N'-hpnO94.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (89, 5, N'may-giat-inverter-9kg-say-5kg-lg-fv1409g4v-93DNFk.png', 12990000.0000, N'EWW8025DGWA', 12, 1, N'Việt Nam', 12, N'máy còn tích hợp bảng điều khiển song ngữ Anh/Việt có nút xoay, cảm ứng và màn hình hiển thị hiện đại, giúp người dùng dễ dàng thao tác, sử dụng.', N'Máy giặt/sấy Electrolux 8.0/5.0Kg EWW8025DGWA mang gam màu trắng thanh lịch, trung tính, cùng với thiết kế sang trọng và trang nhã sẽ là điểm nhấn nổi bật cho mọi không gian nội thất. Ngoài ra, máy còn tích hợp bảng điều khiển song ngữ Anh/Việt có nút xoay, cảm ứng và màn hình hiển thị hiện đại, giúp người dùng dễ dàng thao tác, sử dụng.', N'fv1409g4v-93DNFk.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (90, 5, N'Máy giặt lồng ngang Toshiba Inverter 9,5Kg BK105S3V(SK)', 8790000.0000, N'BK105S3V(SK)', 10, 1, N' Trung Quốc', NULL, N'Khối lượng giặt 9,5 Kg Công nghệ Great Waves tiên tiến giặt sạch sâu

Sức mạnh siêu sóng Flush Waves đánh tan vết bẩn

Real Inverter giúp tiết kiệm điện và vận hành êm ái bền bỉ', N'GIỚI THIỆU SẢN PHẨM - MÁY GIẶT LỒNG NGANG TOSHIBA INVERTER 9,5KG BK105S3V(SK)

Thiết kế cửa trước sang trọng, hiện đại
Máy giặt Toshiba 9.5kg TW-BK105S3V (SK) sở hữu gam màu tối lịch lãm, kết hợp với kiểu dáng cửa trước hiện đại, hứa hẹn sẽ mang đến cho không gian nội thất của gia đình bạn vẻ đẹp sang trọng, tinh tế.', N'-3KZ62G.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (91, 5, N'Máy giặt lồng ngang Toshiba Inverter ', 12790000.0000, N'BK105S3F', 9, 0, N'Trung Quốc', 34, N'Color Care giảm 39% độ phai màu, 45% độ biến dạng đồ giặt

Tự vận hành tiếp tục chương trình dang dở khi có điện trở lại

Tốc độ vắt tối đa 1200 vòng/phút giúp đồ giặt mau khô', N'Greatwaves sẽ tạo ra sức mạnh siêu sóng để đánh bật các vết bẩn cứng đầu, khó chịu trên từng sợ vải, mang đến cho bạn những bộ quần áo sạch đẹp chỉ trong thời gian ngắn. Greatwaves tích hợp 3 công nghệ tiên tiến:', N'-105kg-aqdd1050ew-9gTcUY.png', 0)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (92, 5, N'NULLMáy giặt AQUA lồng ngang', 11290000.0000, N'QD-D950E', 14, 1, N'Việt Nam', 22, N'Vòng đệm kháng khuẩn ABT diệt khuẩn 99.9%

Mối hàn laser bảo vệ quần áo', N'Với máy giặt này, người dùng sẽ không còn phải bận tâm quá nhiều về chi phí điện năng hằng tháng khi được trang bị công nghệ Inverter cho khả năng vận hành ổn định và tiết kiệm điện vượt trội.', N'fv1409g4v-93DNFk.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (93, 5, N'Máy giặt LG lồng ngang 8kg FM1208N6', 9990000.0000, N'FM1208N6', 12, 1, N'Việt Nam', 23, N'Chế độ giặt 6 chuyển động độc đáo
Tiện ích thông minh với NFC, Màn hình LED hiển thị', N'Nếu gia đình bạn có từ 3-4 thành viên thì chiếc máy giặt LG FM1208N6W với trang bị khối lượng giặt là 8kg sẽ là sự lựa chọn hàng đầu.', N'aqdd900fs-H4zXRf.png', 1)
INSERT [dbo].[Product] ([ID_Product], [ID_Category], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (94, 5, N'Máy giặt Electrolux 8Kg ', 12990000.0000, N'EWW8025', 13, 1, N'Thái Lan', NULL, N'máy còn tích hợp bảng điều khiển song ngữ Anh/Việt có nút xoay, cảm ứng và màn hình hiển thị hiện đại, giúp người dùng dễ dàng thao tác, sử dụng.', N'Với khối lượng giặt là 8 kg và khối lượng sấy là 5 kg, máy giặt Electrolux sẽ là sự lựa chọn lý tưởng cho gia đình 4 - 5 người và giúp hong khô quần áo nhanh chóng vào những ngày mưa, bão', N'9kg-lg-fv1409s2v-NAAdZv.png', 1)

SET IDENTITY_INSERT [dbo].[Product] OFF
GO
