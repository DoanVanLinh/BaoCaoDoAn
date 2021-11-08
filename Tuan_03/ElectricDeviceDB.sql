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
	[Status] BIT DEFAULT 1 NOT NULL,
) 
GO

CREATE TABLE Suplliers
(
	ID_Supllier INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(255) NOT NULL,
	Icon NVARCHAR(255) NOT NULL,
	[Status] BIT DEFAULT 1 NOT NULL,
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
	ShortDescription NTEXT NULL,
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

INSERT INTO dbo.Suplliers([Name],Icon) VALUES
(N'Ariston',N'ariston-7QeHYs.png')
GO


INSERT INTO dbo.Products (ID_Category,ID_Supplier, [Name], Price, Model, Amount, Guarantee, Origin, Discount, ShortDescription, Detail, [Image], [Status]) VALUES
(1,1, N'Bình nóng lạnh gián tiếp Ariston AN2 30RS 2.5 FE-MT 30 lít', 3990000, N'AN2 30RS 2.5 FE-MT', 10, 12, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp Ariston AN2 30RS 2.5 FE-MT 30 lít',N'Cơ chế làm nóng gián tiếp phù hợp cho các vùng có khí hậu lạnh (dưới 20 độ C). Dung tích 30 lít, dành cho những gia đình nhỏ có khoảng 4 thành viên. Vỏ chống thấm nước chuẩn IPX1 giúp linh kiện không bị bám nước gây chập mạch.Lòng bình tráng men Titan ngăn chặn rò rỉ nước bên trong, kéo dài tuổi thọ cho bình nước nóng Đèn báo đang đun nước và đèn báo nước đã sẵn sàng dùng.Thanh đốt 100% bằng đồng cho hiệu quả làm nóng nhanh chóng Hệ thống an toàn đồng bộ TSS giúp chống giật và chống bỏng hiệu quả.Công nghệ Ag+ kháng khuẩn bảo vệ sức khỏe cho người dùng',N'-WH1UeP.png', 1),
(1,1, N'Bình nóng lạnh 20L Ariston SL2 20R',4440000, N'SL2 20R',20 ,12 , N'Malaysia', 0, N'Bình nóng lạnh gián tiếp, Dung tích: 20 lít Kích thước: 704 x 301 x 282 mm ( DxRxC) Nhiệt độ tối đa: 80 độ, Bình chứa tráng men Titan, Hệ thống an toàn đồng bộ tích hợp ELCB chống giật Lớp cách nhiệt mật độ cao, Tiết kiệm điện năng chuẩn 5 sao Vỏ chống thấm nước', N'Bình nước nóng có thiết kế chữ nhật ngang hài hòa Bình nóng lạnh 20L Ariston SL2 20R có thiết kế dạng chữ nhật ngang đơn giản, dễ dàng lắp đặt ở những căn phòng tắm có trần tương đối thấp, mang đến vẻ đẹp hài hòa cho không gian nội thất. Là một chiếc bình tắm nóng lạnh gián tiếp, bình nóng lạnh Ariston có thể làm nóng nước lên đến 80 độ C, phù hợp để lắp đặt ở những khu vực có khí hậu lạnh như miền Bắc nước ta', N'-P2HwZg.png', 1),
(1,1, N'Bình nóng lạnh 30L Ariston AN2 30R 2.5 FE-MT',4700000 , N'AN2 30R 2.5 FE-MT',30 ,12 , N'Malaysia', 0, N'Bình nóng lạnh gián tiếp Dung tích 30L, Công suất 2500W Làm nóng hiệu quả, An toàn: Chống giật ELCB Thanh đốt đồng cho độ bền vượt trội Hiển thị nhiệt độ an toàn khuyên dùng', N'Thiết kế sang trọng Bình nóng lạnh Ariston AN2 30R 2.5 FE-MT là dạng bình nóng lạnh gián tiếp, với thiết kế thanh lịch, gam màu đơn giản. Với nhiệt độ tối đa lên đến 80 độ C, phù hợp để lắp đặt ở nơi nhiệt độ thấp.Bình chứa 30 lít Bình nóng lạnh Ariston có bình chứa với dung tích 30 lít, lựa chọn lý tưởng cho gia đình ít người. Đun nóng nước 1 lần và sử dụng được nhiều lần nên sẽ tiết kiệm tối đa điện năng cho gia đình bạn.', N'-ZZFkGo.png', 1),
(1,1, N'Bình nóng lạnh gián tiếp Ariston 20L SL2 20 RS',4600000 , N'SL2 20 RS',50 ,12 , N'Malaysia', 0, N'Thanh đốt 100% đồng chất lượng cao Bình chứa tráng men Titan Rơ le nhiệt cơ TBST  Khuyến cáo nhiệt độ an toàn Hệ thống an toàn đồng bộ TSS', N'THANH ĐỐT 100% ĐỒNG CHẤT LƯỢNG CAO Là chuyên gia hàng đầu trên thế giới trong lĩnh vực gia nhiệt, Ariston hiểu rằng tầm quan trọng của thanh đốt được ví như trái tim của con người. Bình nước nóng Ariston sử dụng thanh đốt 100% đồng, mang lại hiệu quả làm nóng nhanh và bền bỉ với thời gian. Bạn hoàn toàn có thể yên tâm với độ bền vượt trội của bình nước nóng Ariston.', N'-cItkGg.png', 1),
(1,1, N'Bình nóng lạnh trực tiếp Ariston SM45PE-VN - 4500W',2990000 , N'SM45PE-VN',60 ,12 , N'Malaysia', 0, N'Thiết kế chống thấm nước, Bộ ổn định nhiệt lưỡng cực Hệ thống điều chỉnh lưu lượng nước,Vòi sen 3 chức năng Van cấp nước tích hợp 3 trong 1 (Khóa – Lọc – Mở)', N'Phong cách thiết kế đậm chất Ý Bình nóng lạnh trực tiếp Ariston SM45PE-VN được tạo nên bởi chính tay của một nhà thiết kế người Ý nổi tiếng, mang âm hưởng vẻ đẹp tinh tế nước Ý. Với thiết kế chống thấm nước IP25, Bình nóng lạnh Ariston sẽ hạn chế được sự rò rỉ điện xảy ra, giúp gia đình bạn luôn được an toàn', N'binh-nong-lanh-truc-tiep-ariston-sm45pevn-4500wco-bom-44a9Xv.png', 1),
(1,1, N'Bình nóng lạnh gián tiếp Ariston AN2 15R 2.5 FE-MT 15 Lít',4450000 , N'AN2 15R 2.5 FE-MT',25 ,6 , N'Malaysia', 0, N'Thanh đốt đồng cho độ bền vượt trội Hiển thị nhiệt độ an toàn khuyên dùng', N'Thiết kế hiện đại Bình nóng lạnh Ariston AN2 15R 2.5 FE-MT là dạng bình nóng lạnh gián tiếp, với thiết kế thanh lịch, gam màu đơn giản. Với nhiệt độ tối đa lên đến 80 độ C, phù hợp để lắp đặt ở nơi nhiệt độ thấp.', N'-nu458B.png', 1),
(1,1, N'Bình nóng lạnh 50L Ariston Pro R 50 SH 2.5 FE- Bình ngang',5240000 , N'Pro R 50 SH 2.5 FE',24 ,24 , N'Malaysia', 0, N'Dung tích: 50L, Công suất: 2500W Hệ thống an toàn đồng bộ TSS Bộ ổn nhiệt kiểm soát nhiệt độ hiệu quả', N'Thiết kế hiện đại Bình nóng lạnh Ariston Pro R 50 SH 2.5 FE thiết kế hiện đại, phù hợp nhiều nhiều không gian tạo nên sự hoàn hảo cho phòng tắm.Điều khiển dễ sử dụng Bình nóng lạnh Ariston cấu trúc đặc biệt đơn giản bảng điều khiển nằm một bên cho phép dễ dàng kiểm tra và bảo trì nhanh chóng khi cần thiết.', N'binh-nong-lanh-50l-ariston-pro-r-50-sh-25-fe-binh-ngang-39WSh0.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (9, 1, 2, N'Bình nước nóng 22L Kangaroo KG68A2', 2990000.0000, N'KG68A2', 111, 12, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp 22L, Công nghệ Nano kháng khuẩn 
Hệ thống an toàn đồng bộ CSS, Lớp cách nhiệt pu mật độ cao 
Chống giật kép, Chống đun khô, Tiết kiệm điện năng ', N'Dung tích 22L
Bình tắm nóng lạnh Kangaroo KG68A2 có dung tích 22L, đáp ứng tốt nhu cầu sử dụng của các hộ gia đình từ đông thành viên từ 4-5 người rất tiện dụng Thiết kế đẹp mắt
Bình tắm nóng lạnh gián tiếp với thiết kế sang trọng tinh tế với bình ngang vàng, chắc chắn sẽ đem lại sự sang trọng cho nội thất nhà bạn. Ruột bình nóng lạnh tráng kim cương nhân tạo, duy nhất trên thị trường có, mang đến độ bền cao cho sản phẩm ', N'binh-nuoc-nong-22l-kangaroo-kg68a2-XkMpfg.jpg', 1)
GO
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (10, 1, 2, N'Bình nóng lạnh 15L Kangaroo KG516N', 3510000.0000, N'KG516N', 123, 18, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp 15L Chống giật kép, Chống đun khô 
Công nghệ Nano kháng khuẩn, Hệ thống an toàn đồng bộ CSS 
Lớp cách nhiệt pu mật độ cao
Tiết kiệm điện năng, Cài đặt nhiệt độ', N'Dung tích 15L
Bình nóng lạnh 15L Kangaroo KG516N có dung tích 15L, phù hợp với hộ gia đình ít người ', N'-1eEOdS.jpg', 1)
GO
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (11, 1, 2, N'Bình nóng lạnh 30L Kangaroo KG69A3', 2960000.0000, N'KG69A3', 121, 6, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp 30L Chống giật kép, Chống đun khô 
Công nghệ Nano kháng khuẩn, Hệ thống an toàn đồng bộ CSS 
Lớp cách nhiệt pu mật độ cao', N'Dung tích 30L
Bình nóng lạnh 30L Kangaroo KG69A3 có dung tích 30L, phù hợp với hộ gia đình 3-4 người Chống rò điện 
Bình nóng lạnh Kangaroo có Hệ thống an toàn đồng bộ CSS , lớp cách nhiệt pu mật độ cao, Chống giật kép, Chống đun khô.', N'binh-nong-lanh-30l-kangaroo-kg69a3-T2vzZH.png', 1)

 GO
