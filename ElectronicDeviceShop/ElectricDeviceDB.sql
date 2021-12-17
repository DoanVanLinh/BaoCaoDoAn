USE master
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
	UrlSlug NVARCHAR(255),
	Icon NVARCHAR(255) NOT NULL,
	[Status] INT DEFAULT 1,
) 
GO

CREATE TABLE Suppliers
(
	ID_Supplier INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(255) NOT NULL,
	UrlSlug NVARCHAR(255),
	Icon NVARCHAR(255) NOT NULL,
	[Status] INT DEFAULT 1,
) 
GO


CREATE TABLE Products
(
	ID_Product INT IDENTITY PRIMARY KEY,
	ID_Category INT NOT NULL,
	ID_Supplier INT NOT NULL,
	[Name] NVARCHAR(255) NOT NULL,
	UrlSlug NVARCHAR(255),
	Price Money NOT NULL,
	Model NVARCHAR(255) NOT NULL,
	Amount INT NOT NULL,
	Guarantee INT NOT NULL,
	Origin NVARCHAR(255) NULL,
	Discount INT NULL,
	ShortDescription NTEXT NULL,
	Detail NTEXT NULL,
	[Image] NVARCHAR(255) NOT NULL,
	[Status] INT DEFAULT 1,	
	CONSTRAINT FK_Products_Categories FOREIGN KEY (ID_Category) REFERENCES Categories(ID_Category),
	CONSTRAINT FK_Products_Suppliers FOREIGN KEY (ID_Supplier) REFERENCES Suppliers(ID_Supplier)
) 
GO

CREATE TABLE Accounts
(
	ID_Account INT IDENTITY PRIMARY KEY,
	UserName Varchar(255) UNIQUE NOT NULL,
	[Password] Varchar(255) NOT NULL,
	FullName NVARCHAR(255) NULL,
	Phone Char(20) NULL,
	[Address] NVARCHAR(255) NULL,
	Email Varchar(50) NULL,
	Avatar NVARCHAR(255) NULL,
	[Role] INT DEFAULT 2,--0:AD,1:NV,2:KH
	[Status] INT DEFAULT 1,
) 
GO

CREATE TABLE Carts
(
	ID_Cart INT IDENTITY PRIMARY KEY,  
	ID_Product INT NOT NULL,
	ID_Account INT NOT NULL,
	Amount INT NOT NULL,
	[Status] INT DEFAULT 1,
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
	BuyDate DATE NOT NULL,
	[Status] INT DEFAULT 2,
	CONSTRAINT FK_Bills_Accounts FOREIGN KEY (ID_Account) REFERENCES Accounts(ID_Account)
)
GO

CREATE TABLE BillDetails
(
	ID_Billdetail INT IDENTITY PRIMARY KEY,
	ID_Bill INT NOT NULL,
	ID_Product INT NOT NULL,
	Amount INT NOT NULL,
	CurrentlyPrice Money NOT NULL,
	[Status] INT DEFAULT 1,
	CONSTRAINT FK_BillDetails_Product FOREIGN KEY (ID_Product) REFERENCES Products(ID_Product),
	CONSTRAINT FK_BillDetails_Bill FOREIGN KEY (ID_Bill) REFERENCES Bills(ID_Bill)
) 
GO

CREATE TABLE [Permissions]
(
	ID_Permission INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(255) NOT NULL,
	Code VARCHAR(255),
	[Status] INT DEFAULT 1,
) 
GO

CREATE TABLE PermissionDetails
(
	ID_PermissionDetail INT IDENTITY PRIMARY KEY,
	ID_Permission INT NOT NULL,
	ID_Account INT NOT NULL,
	[View] BIT NULL,
	[Create] BIT NULL,
	Edit BIT NULL,
	[Delete] BIT NULL,
	[Status] INT DEFAULT 1,
	CONSTRAINT FK_PermissionDetail_Account FOREIGN KEY (ID_Account) REFERENCES Accounts(ID_Account),
	CONSTRAINT FK_PermissionDetail_Permission FOREIGN KEY (ID_Permission) REFERENCES [Permissions](ID_Permission),
) 
GO

INSERT dbo.Categories ([Name], Icon, [Status]) VALUES
(N'Bình tắm nóng lạnh', N'icon-binh-tam-nong-lanh.png', 1),
(N'Điều hòa nhiệt độ', N'icon-dieu-hoa.png', 1),
(N'Nồi chiên không dầu', N'icon-noi-chien.png', 1),
(N'Tivi, Loa - Âm thanh', N'icon-tivi-loa-am-thanh.png', 1),
(N'Tủ lạnh, Tủ đông, Tủ mát', N'icon-tu-lanh-tu-dong-tu-mat.png', 1)

GO

INSERT INTO dbo.Suppliers([Name],Icon) VALUES
(N'Ariston',N'ariston-7QeHYs.png'),
(N'Kangharoo',N'kangaroo-DxE1BV.png'),
(N'SamSung',N'samsung-2XG2f2.png'),
(N'LG', N'lg-OI70q3.png'),
(N'Coex', N'coex-5u7kJo.png'),
(N'Philips', N'philips-3w2Q5U.png'),
(N'Sanaky', N'sanaky-49X4N8.png')
GO


INSERT INTO dbo.Products (ID_Category,ID_Supplier, [Name], Price, Model, Amount, Guarantee, Origin, Discount, ShortDescription, Detail, [Image], [Status]) VALUES
(1,1, N'Bình nóng lạnh gián tiếp Ariston AN2 30RS 2.5 FE-MT 30 lít', 3990000, N'AN2 30RS 2.5 FE-MT', 10, 12, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp Ariston AN2 30RS 2.5 FE-MT 30 lít',N'Cơ chế làm nóng gián tiếp phù hợp cho các vùng có khí hậu lạnh (dưới 20 độ C). Dung tích 30 lít, dành cho những gia đình nhỏ có khoảng 4 thành viên. Vỏ chống thấm nước chuẩn IPX1 giúp linh kiện không bị bám nước gây chập mạch.Lòng bình tráng men Titan ngăn chặn rò rỉ nước bên trong, kéo dài tuổi thọ cho bình nước nóng Đèn báo đang đun nước và đèn báo nước đã sẵn sàng dùng.Thanh đốt 100% bằng đồng cho hiệu quả làm nóng nhanh chóng Hệ thống an toàn đồng bộ TSS giúp chống giật và chống bỏng hiệu quả.Công nghệ Ag+ kháng khuẩn bảo vệ sức khỏe cho người dùng',N'-WH1UeP.png', 1),
(1,1, N'Bình nóng lạnh 20L Ariston SL2 20R',4440000, N'SL2 20R',20 ,12 , N'Malaysia', 0, N'Bình nóng lạnh gián tiếp, Dung tích: 20 lít Kích thước: 704 x 301 x 282 mm ( DxRxC) Nhiệt độ tối đa: 80 độ, Bình chứa tráng men Titan, Hệ thống an toàn đồng bộ tích hợp ELCB chống giật Lớp cách nhiệt mật độ cao, Tiết kiệm điện năng chuẩn 5 sao Vỏ chống thấm nước', N'Bình nước nóng có thiết kế chữ nhật ngang hài hòa Bình nóng lạnh 20L Ariston SL2 20R có thiết kế dạng chữ nhật ngang đơn giản, dễ dàng lắp đặt ở những căn phòng tắm có trần tương đối thấp, mang đến vẻ đẹp hài hòa cho không gian nội thất. Là một chiếc bình tắm nóng lạnh gián tiếp, bình nóng lạnh Ariston có thể làm nóng nước lên đến 80 độ C, phù hợp để lắp đặt ở những khu vực có khí hậu lạnh như miền Bắc nước ta', N'-P2HwZg.png', 1),
(1,1, N'Bình nóng lạnh 30L Ariston AN2 30R 2.5 FE-MT',4700000 , N'AN2 30R 2.5 FE-MT',30 ,12 , N'Malaysia', 0, N'Bình nóng lạnh gián tiếp Dung tích 30L, Công suất 2500W Làm nóng hiệu quả, An toàn: Chống giật ELCB Thanh đốt đồng cho độ bền vượt trội Hiển thị nhiệt độ an toàn khuyên dùng', N'Thiết kế sang trọng Bình nóng lạnh Ariston AN2 30R 2.5 FE-MT là dạng bình nóng lạnh gián tiếp, với thiết kế thanh lịch, gam màu đơn giản. Với nhiệt độ tối đa lên đến 80 độ C, phù hợp để lắp đặt ở nơi nhiệt độ thấp.Bình chứa 30 lít Bình nóng lạnh Ariston có bình chứa với dung tích 30 lít, lựa chọn lý tưởng cho gia đình ít người. Đun nóng nước 1 lần và sử dụng được nhiều lần nên sẽ tiết kiệm tối đa điện năng cho gia đình bạn.', N'-ZZFkGo.png', 1),
(1,1, N'Bình nóng lạnh gián tiếp Ariston 20L SL2 20 RS',4600000 , N'SL2 20 RS',50 ,12 , N'Malaysia', 0, N'Thanh đốt 100% đồng chất lượng cao Bình chứa tráng men Titan Rơ le nhiệt cơ TBST  Khuyến cáo nhiệt độ an toàn Hệ thống an toàn đồng bộ TSS', N'THANH ĐỐT 100% ĐỒNG CHẤT LƯỢNG CAO Là chuyên gia hàng đầu trên thế giới trong lĩnh vực gia nhiệt, Ariston hiểu rằng tầm quan trọng của thanh đốt được ví như trái tim của con người. Bình nước nóng Ariston sử dụng thanh đốt 100% đồng, mang lại hiệu quả làm nóng nhanh và bền bỉ với thời gian. Bạn hoàn toàn có thể yên tâm với độ bền vượt trội của bình nước nóng Ariston.', N'-cItkGg.png', 1),
(1,1, N'Bình nóng lạnh trực tiếp Ariston SM45PE-VN - 4500W',2990000 , N'SM45PE-VN',60 ,12 , N'Malaysia', 0, N'Thiết kế chống thấm nước, Bộ ổn định nhiệt lưỡng cực Hệ thống điều chỉnh lưu lượng nước,Vòi sen 3 chức năng Van cấp nước tích hợp 3 trong 1 (Khóa – Lọc – Mở)', N'Phong cách thiết kế đậm chất Ý Bình nóng lạnh trực tiếp Ariston SM45PE-VN được tạo nên bởi chính tay của một nhà thiết kế người Ý nổi tiếng, mang âm hưởng vẻ đẹp tinh tế nước Ý. Với thiết kế chống thấm nước IP25, Bình nóng lạnh Ariston sẽ hạn chế được sự rò rỉ điện xảy ra, giúp gia đình bạn luôn được an toàn', N'binh-nong-lanh-truc-tiep-ariston-sm45pevn-4500wco-bom-44a9Xv.png', 1),
(1,1, N'Bình nóng lạnh gián tiếp Ariston AN2 15R 2.5 FE-MT 15 Lít',4450000 , N'AN2 15R 2.5 FE-MT',25 ,6 , N'Malaysia', 0, N'Thanh đốt đồng cho độ bền vượt trội Hiển thị nhiệt độ an toàn khuyên dùng', N'Thiết kế hiện đại Bình nóng lạnh Ariston AN2 15R 2.5 FE-MT là dạng bình nóng lạnh gián tiếp, với thiết kế thanh lịch, gam màu đơn giản. Với nhiệt độ tối đa lên đến 80 độ C, phù hợp để lắp đặt ở nơi nhiệt độ thấp.', N'-nu458B.png', 1),
(1,1, N'Bình nóng lạnh 50L Ariston Pro R 50 SH 2.5 FE- Bình ngang',5240000 , N'Pro R 50 SH 2.5 FE',24 ,24 , N'Malaysia', 0, N'Dung tích: 50L, Công suất: 2500W Hệ thống an toàn đồng bộ TSS Bộ ổn nhiệt kiểm soát nhiệt độ hiệu quả', N'Thiết kế hiện đại Bình nóng lạnh Ariston Pro R 50 SH 2.5 FE thiết kế hiện đại, phù hợp nhiều nhiều không gian tạo nên sự hoàn hảo cho phòng tắm.Điều khiển dễ sử dụng Bình nóng lạnh Ariston cấu trúc đặc biệt đơn giản bảng điều khiển nằm một bên cho phép dễ dàng kiểm tra và bảo trì nhanh chóng khi cần thiết.', N'binh-nong-lanh-50l-ariston-pro-r-50-sh-25-fe-binh-ngang-39WSh0.png', 1),
(1, 2, N'Bình nước nóng 22L Kangaroo KG68A2', 2990000.0000, N'KG68A2', 111, 12, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp 22L, Công nghệ Nano kháng khuẩn 
Hệ thống an toàn đồng bộ CSS, Lớp cách nhiệt pu mật độ cao 
Chống giật kép, Chống đun khô, Tiết kiệm điện năng ', N'Dung tích 22L
Bình tắm nóng lạnh Kangaroo KG68A2 có dung tích 22L, đáp ứng tốt nhu cầu sử dụng của các hộ gia đình từ đông thành viên từ 4-5 người rất tiện dụng Thiết kế đẹp mắt
Bình tắm nóng lạnh gián tiếp với thiết kế sang trọng tinh tế với bình ngang vàng, chắc chắn sẽ đem lại sự sang trọng cho nội thất nhà bạn. Ruột bình nóng lạnh tráng kim cương nhân tạo, duy nhất trên thị trường có, mang đến độ bền cao cho sản phẩm ', N'binh-nuoc-nong-22l-kangaroo-kg68a2-XkMpfg.jpg', 1),
(1, 2, N'Bình nóng lạnh 15L Kangaroo KG516N', 3510000.0000, N'KG516N', 123, 18, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp 15L Chống giật kép, Chống đun khô 
Công nghệ Nano kháng khuẩn, Hệ thống an toàn đồng bộ CSS 
Lớp cách nhiệt pu mật độ cao
Tiết kiệm điện năng, Cài đặt nhiệt độ', N'Dung tích 15L
Bình nóng lạnh 15L Kangaroo KG516N có dung tích 15L, phù hợp với hộ gia đình ít người ', N'-1eEOdS.jpg', 1),
(1, 2, N'Bình nóng lạnh 30L Kangaroo KG69A3', 2960000.0000, N'KG69A3', 121, 6, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp 30L Chống giật kép, Chống đun khô 
Công nghệ Nano kháng khuẩn, Hệ thống an toàn đồng bộ CSS 
Lớp cách nhiệt pu mật độ cao', N'Dung tích 30L
Bình nóng lạnh 30L Kangaroo KG69A3 có dung tích 30L, phù hợp với hộ gia đình 3-4 người Chống rò điện 
Bình nóng lạnh Kangaroo có Hệ thống an toàn đồng bộ CSS , lớp cách nhiệt pu mật độ cao, Chống giật kép, Chống đun khô.', N'binh-nong-lanh-30l-kangaroo-kg69a3-T2vzZH.png', 1),
(2, 3, N'Điều hòa Samsung 1 chiều Inverter 12000BTU AR13TYHYCWKNSV', 13200000.0000, N'AR13TYHYCWKNSV', 222, 12, N'Thái Lan', 0, N'Công suất: 12000BTU, Công nghệ Inverter
Chế độ Làm Lạnh Tức Thì Fast Cooling
Bộ lọc Tri-Care Filter lọc sạch hiệu quả bụi siêu mịn
Chế độ Ngủ Ngon duy trì nhiệt độ lý tưởng', N'Vận hành êm ái và Siêu tiết kiệm điện đến 73%*
Động cơ Digital Inverter Boost
Công nghệ Digital Inverter Boost ưu việt giúp tiết kiệm điện năng hiệu quả lên đến 77%* và duy trì ổn định nhiệt độ mong muốn. Với nam châm neodymium và bộ giảm âm kép Twin Tube Muffler, máy hoạt động yên tĩnh, êm ái và bền lâu. Kiểm định trên model AR09TXCAAWKNEU so với model Samsung AQ09TSLXEA thông thường.
Lan Tỏa Nhanh Hơn, Xa Hơn
Chế độ Làm Lạnh Tức Thì Fast Cooling
Nhanh chóng phân tán không khí mát lạnh đến mọi ngóc ngách trong phòng. Công nghệ Digital Inverter Boost đẩy nhanh tốc độ làm lạnh không khí đến 43%. Thiết kế cải tiến với quạt gió lớn hơn 15%, cửa hút khí rộng hơn 18% và cửa thổi khí rộng hơn 31%, giúp không khí lạnh được phân tán xa và rộng hơn lên đến 15m**', N'dieu-hoa-samsung-1-chieu-inverter-12000btu-ar13tyhycwknsv-T2nNcL.png', 1),
(2, 3, N'Điều hòa Samsung Wind-Free 1 chiều Inverter 12000BTU AR13TYGCDWKNSV', 13390000.0000, N'AR13TYGCDWKNSV', 321, 12, N'Thái Lan', 0, N'Công suất: 12000BTU, Công nghệ Inverter
Chế độ Wind-Free Cooling làm lạnh không gió buốt
Tiện nghi với công nghệ làm lạnh thông minh AI
Ống giảm thanh Twin Tube Muffler hạn chế tối đa tiếng ồn', N'Lạnh Nhanh Không Gió Buốt Thổi Trực Tiếp
Công Nghệ WindFree™ Đầu Tiên Trên Thế Giới
Hơn hẳn điều hòa thông thường, ngoài hiệu quả làm lạnh nhanh chóng, điều hòa Samsung WindFree™ còn có thêm lựa chọn chế độ làm lạnh WindFree™ không gió buốt thổi trực tiếp. Chỉ với 1 thao tác trên remote đơn giản, phòng sẽ nhanh chóng đạt nhiệt độ mát lạnh tối ưu hoặc thổi khí lạnh nhẹ nhàng qua 23.000 lỗ nhỏ, hạn chế gió thổi trực tiếp mà vẫn duy trì nhiệt độ mong muốn của người dùng. *ASHRAE (Hội kỹ sư nghiên cứu về Tủ lạnh, Máy Sưởi và Điều Hòa Không Khí tại Mỹ) định nghĩa “Luồng không khí dễ chịu" là không khí đạt tốc độ dưới 0,15m/s và không có sự hiện diện của gió buốt. **Kiểm định trên model AR12TXCAAWKNEU. Chế độ WindFree ™ tạo ra tiếng ồn 23dB so với 26dB của model Samsung thông thường. ***Kiểm định trên model AR07T9170HA3 dựa trên mức tiêu thụ năng lượng của chế độ Làm Lạnh Nhanh so với chế độ WindFree™.
Lọc 99% Virus, Vi Khuẩn, Bụi Siêu Mịn Và Tác Nhân Gây Dị Ứng
Bộ Lọc Tri-Care
Được chứng nhận bởi tổ chức quốc tế ITEA và Intertek, bộ lọc Tri-Care trên điều hòa Samsung có khả năng lọc 99% virus, vi khuẩn, bụi siêu mịn và tác nhân gây dị ứng, giữ không khí luôn trong lành hoàn hảo.', N'dieu-hoa-samsung-windfree-1-chieu-inverter-12000btu-ar13tygcdwknsv-8CN26y.png', 1),
(2, 3, N'Điều hòa Samsung Wind-Free 1 chiều Inverter 9400BTU AR10TYGCDWKNSV', 11690000.0000, N'AR10TYGCDWKNSV', 213, 12, N'Thái Lan', 0, N'- Luồng khí lạnh lý tưởng, tiết kiệm điện với công nghệ WindFree với 23.000 lỗ siêu nhỏ giúp tỏa khí lạnh nhanh mà không lo gió buốt.
- Công nghệ Kháng khuẩn, lọc bụi mịn và virus 99%, chống nấm mốc hiệu quả cùng bộ lọc TriCare.
- Tiết kiệm điện lên đến 77%, làm lạnh nhanh với động cơ Digital Inverter Boots và chế độ Eco.
- Làm lạnh hiệu quả, độ bền máy cao với chế độ Auto Clean.', N'Lạnh Nhanh Không Gió Buốt Thổi Trực Tiếp
Công Nghệ WindFree™ Đầu Tiên Trên Thế Giới
Hơn hẳn điều hòa thông thường, ngoài hiệu quả làm lạnh nhanh chóng, điều hòa Samsung WindFree™ còn có thêm lựa chọn chế độ làm lạnh WindFree™ không gió buốt thổi trực tiếp. Chỉ với 1 thao tác trên remote đơn giản, phòng sẽ nhanh chóng đạt nhiệt độ mát lạnh tối ưu hoặc thổi khí lạnh nhẹ nhàng qua 23.000 lỗ nhỏ, hạn chế gió thổi trực tiếp mà vẫn duy trì nhiệt độ mong muốn của người dùng. Lạnh Nhanh Không Gió Buốt Thổi Trực Tiếp
Công Nghệ WindFree™ Đầu Tiên Trên Thế Giới
Hơn hẳn điều hòa thông thường, ngoài hiệu quả làm lạnh nhanh chóng, điều hòa Samsung WindFree™ còn có thêm lựa chọn chế độ làm lạnh WindFree™ không gió buốt thổi trực tiếp. Chỉ với 1 thao tác trên remote đơn giản, phòng sẽ nhanh chóng đạt nhiệt độ mát lạnh tối ưu hoặc thổi khí lạnh nhẹ nhàng qua 23.000 lỗ nhỏ, hạn chế gió thổi trực tiếp mà vẫn duy trì nhiệt độ mong muốn của người dùng. Lạnh Nhanh Không Gió Buốt Thổi Trực Tiếp
Công Nghệ WindFree™ Đầu Tiên Trên Thế Giới
Hơn hẳn điều hòa thông thường, ngoài hiệu quả làm lạnh nhanh chóng, điều hòa Samsung WindFree™ còn có thêm lựa chọn chế độ làm lạnh WindFree™ không gió buốt thổi trực tiếp. Chỉ với 1 thao tác trên remote đơn giản, phòng sẽ nhanh chóng đạt nhiệt độ mát lạnh tối ưu hoặc thổi khí lạnh nhẹ nhàng qua 23.000 lỗ nhỏ, hạn chế gió thổi trực tiếp mà vẫn duy trì nhiệt độ mong muốn của người dùng. *ASHRAE (Hội kỹ sư nghiên cứu về Tủ lạnh, Máy Sưởi và Điều Hòa Không Khí tại Mỹ) định nghĩa “Luồng không khí dễ chịu" là không khí đạt tốc độ dưới 0,15m/s và không có sự hiện diện của gió buốt. **Kiểm định trên model AR12TXCAAWKNEU. Chế độ WindFree ™ tạo ra tiếng ồn 23dB so với 26dB của model Samsung thông thường. ***Kiểm định trên model AR07T9170HA3 dựa trên mức tiêu thụ năng lượng của chế độ Làm Lạnh Nhanh so với chế độ WindFree™.
Lọc 99% Virus, Vi Khuẩn, Bụi Siêu Mịn Và Tác Nhân Gây Dị Ứng
Bộ Lọc Tri-Care
Được chứng nhận bởi tổ chức quốc tế ITEA và Intertek, bộ lọc Tri-Care trên điều hòa Samsung có khả năng lọc 99% virus, vi khuẩn, bụi siêu mịn và tác nhân gây dị ứng, giữ không khí luôn trong lành hoàn hảo.', N'dieu-hoa-samsung-windfree-1-chieu-inverter-9400btu-ar10tygcdwknsv-FbD86A.png', 1),
(2, 3, N'Điều hòa Samsung Digital Inverter AR10RYFTAWKNSV 1 chiều 9.400BTU', 4990000.0000, N'AR10RYFTAWKNSV', 42, 12, N'Thái Lan', 0, N'Công nghệ Digital Inverter 8 cực tối ưu điện năng
Bộ lọc 3 Care Filter lọc sạch 99% bụi bẩn và vi khuẩn
Hiệu suất vượt trội với công nghệ Bảo Vệ Bộ Ba Tăng Cường', N'Kiểu dáng hiện đại sang trọng
Điều hòa SAMSUNG Inverter 9.400BTU AR10RYFTAWKNSV mang thiết kế màu trắng thanh lịch nổi bật sẽ mang lại vẻ đẹp hài hòa, bắt mắt cho không gian nội thất của gia đình Công nghệ Digital Inverter vận hành êm ái, bền bỉ
Không chỉ tiết kiệm điện, công nghệ Inverter của điều hòa còn có khả năng mang đến sự hoạt động êm ái, bền bỉ, nhiệt độ vô cùng ổn định. Bạn sẽ không còn cảm thấy khó chịu bởi tiếng ồn phát ra trong lúc máy vận hành nữa.', N'-77QCAC.jpg', 1),
(2, 3, N'Điều hòa Samsung 1 chiều Inverter 9.700BTU AR10NVFSCURXSV', 4990000.0000, N'AR10NVFSCURXSV', 54, 12, N'Thái Lan', 0, N'Máy nén Digital Inverter 8 cực tiết kiệm điện tối ưu
Bộ lọc Filter/3 Care-Filter lọc bụi, virus và chất gây dị ứng
Thiết kế tam diện lan tỏa hơi mát ra xa 14m', N'Đặc điểm Điều hòa Samsung 1 chiều Inverter 9.700BTU AR10NVFSCURXSV
Tiết Kiệm Điện - Lên Đến 68%
Công Nghệ Máy Nén Digital Inverter 8 Cực
Công nghệ Digital Inverter 8 cực sử dụng năng lượng ít hơn 68% so với các dòng máy lạnh thông thường*. Máy điều hòa duy trì nhiệt độ lý tưởng mong muốn, hoạt động hiệu quả và bền bỉ hơn mà không cần thường xuyên tắt và mở, mang đến không gian yên tĩnh. Mát Lạnh Tức Thì
Làm Mát Nhanh Chóng
Làm mát nhanh chóng khắp mọi ngóc ngách của căn phòng giúp bạn luôn luôn cảm thấy thoải mái. Công Nghệ Digital Inverter 8 cực làm mát không khí hơn 43%* và thiết kế tam diện lan tỏa không khí mát lạnh xa hơn và rộng hơn**', N'dieu-hoa-samsung-1-chieu-inverter-9700btu-ar10nvfscurxsv-6N779O.jpg', 1),
(2, 4, N'Điều hòa LG 1 chiều Inverter 9.200BTU V10ENW1', 9450000.0000, N'V10ENW1', 96, 12, N'Thái Lan', 0, N'Công suất 1 HP thích hợp sử dụng cho phòng có diện tích dưới 15m2
Công nghệ Inverter giúp máy vận hành êm, giảm ồn, tiết kiệm điện
Chế độ làm lạnh Powerful giúp căn phòng mát lạnh ngay tức thì
Chế độ thổi hướng gió dễ chịu tránh gió lạnh lùa trực tiếp vào cơ thể
Lớp phủ chống ăn mòn Gold Fin giúp tăng độ bền cho dàn tản nhiệt', N'Thiết kế đơn giản, dễ dàng kết hợp với mọi không gian nội thất
Máy lạnh LG Inverter 1.0 HP V10ENW1 có thiết kế bên ngoài đơn giản, đi cùng sắc trắng trung tính, thanh lịch sẽ dễ dàng kết hợp với mọi không gian nội thất nhà bạn. Nếu bạn có nhu cầu lắp máy lạnh cho phòng dưới 15 m2 thì máy lạnh LG 1.0 HP chính là một sự lựa chọn lý tưởng. Công nghệ Dual Cool Inverter tiết kiệm điện lên đến 70%
Ứng dụng công nghệ Dual Cool Inverter, chiếc máy lạnh LG này không chỉ mang đến khả năng tiết kiệm điện năng lên đến 70% mà nó còn vận hành êm ái và bền bỉ, đem lại sự ổn định cho nhiệt độ trong phòng.', N'dieu-hoa-lg-1-chieu-inverter-9200btu-v10enw1-V96Zd2.png', 1),
(2, 4, N'Điều hòa LG sang trọng 1 chiều Inverter 9.200BTU V10API1', 12200000.0000, N'V10API1', 63, 12, N'Thái Lan', 0, N'Công suất làm lạnh 1 HP, dành cho phòng có diện tích dưới 15 mét vuông.
Công nghệ Inverter nâng cao hiệu quả tiết kiệm điện.
Làm lạnh nhanh chóng chỉ trong 3 phút với công nghệ Jet Cool.
Phát hiện và xử lý nhanh chóng khi máy lạnh bị lỗi với tính năng chuẩn đoán lỗi.', N'Thiết kế tối giản, phù hợp với mọi không gian
Toàn bộ máy lạnh được bao phủ bởi gam màu trắng sạch sẽ, dễ dàng phối hợp với mọi phong cách thiết kế nội thất từ cổ điển cho đến hiện đại. Máy lạnh kích thước khá gọn gàng giúp tăng thẩm mỹ cho bức tường phòng bạn.
Trên dàn lạnh cũng được trang bị một màn hình hiển thị nhiệt độ giúp bạn dễ dàng quan sát, không cần phải tìm remote mỗi khi muốn xem nhiệt độ nữa.
Dành cho những phòng có diện tích 15 mét vuông với công suất 1 HP
Máy lạnh LG Inverter 1 HP V10API1 
có công suất 1 HP ~ 9.200 BTU sẽ thích hợp sử dụng các phòng ngủ, phòng khách nhỏ ở căn hộ chung cư hay phòng trọ sinh viên có diện tích từ dưới 15 m2.', N'dieu-hoa-lg-sang-trong-1-chieu-inverter-9200btu-v10api1-qJLPJm.png', 1),
(2, 4, N'Điều hòa LG UV Nano 1 chiều Inverter 9.200BTU V10APFUV', 15700000.0000, N'V10APFUV', 47, 12, N'Thái Lan', 0, N'Công nghệ UV Nano loại bỏ vi khuẩn tới 99,99%
Loại bỏ bụi siêu mịn PM 0.1
Công suất 1 HP thích hợp sử dụng cho phòng có diện tích dưới 15m2', N'Mang đến luồng không khí sạch hơn nhờ công nghệ UVnano diệt sạch vi khuẩn
Công nghệ UVnano sử dụng các tia UV chiếu lên quạt điều hòa. Là tia có năng lượng cao, ánh sáng UV dễ dàng loại bỏ các vi khuẩn như Staphylococcus aureus, Staphylococcus epidermidis, và Klebsiella pneumoniae với hiệu suất 99.99% sau khi tiếp xúc với tia UV trong 4 giờ.
Với khả năng loại bỏ nhiều vi khuẩn thường ngày, công nghệ này mang đến bầu không khí sạch, trong lành, bảo vệ gia đình bạn khỏi các bệnh về đường hô hấp.
Bảo vệ sức khỏe, duy trì độ ẩm cho da với tính năng tạo ion lọc không khí
Nhờ chức năng tạo ion lọc không khí, máy lạnh có thể giải phóng ra các ion âm để vô hiệu hóa sự hoạt động của vi khuẩn và những tác nhân gây dị ứng, nhờ đó bảo vệ sức khỏe cho người dùng tốt hơn.
Ngoài ra, các ion này còn có khả năng tái tạo phân tử nước, cung cấp thêm độ ẩm trong không khí, tránh được tình trạng da khô khi bạn ở trong phòng máy lạnh, nhất là trẻ nhỏ và những người nhạy cảm.
Điều khiển thông minh trên điện thoại nhờ tích hợp bộ phát wifi
Chiếc máy lạnh LG Inverter này còn được tích hợp bộ phát wifi, điều này cho phép bạn kết hợp với điện thoại thông minh dễ dàng, giúp điều khiển các chức năng máy lạnh được tiện lợi hơn mà không cần phải dùng remote.', N'-6ZjeIx.png', 1),
(3, 5, N'Nồi chiên không dầu 3.5 lít Coex AFC-3115', 214000.0000, N'AFC-3115', 76, 12, N'Trung Quốc', 0, N'Dung tích chứa 3.5 lít, công suất 1500W chế biến được nhiều món ăn nhanh hơn
Công nghệ Rapid Air độc đáo có thể rán, nướng, quay ngon và giảm dầu mỡ đến 80%
Khay chiên phủ lớp chống dính ceramic cao cấp bền bỉ, hạn chế dính cháy, dễ chùi rửa sau khi dùng
2 nút điều chỉnh thời gian và nhiệt độ riêng biệt', N'Thiết kế sang trọng, tinh tế
Nồi chiên không dầu cao cấp Coex AFC-3115 thiết kế kiểu dáng đẹp và lạ mắt với lớp vỏ ngoài mạ chrome sang trọng, vệ sinh. Vỏ dày bóng loáng, đẹp mắt, thiết kế dung tích 3.5 lít, công suất 1500W, công nghệ Rapid Air hiện đại. Ứng dụng công nghệ chiên không dầu Rapid Air hạn chế dầu mỡ tối đa cho món chiên, nướng thơm ngon, bổ dưỡng và tốt với sức khỏe của người dùng hơn. Đặc biệt, thích hợp sử dụng sản phẩm nấu ăn cho người già và trẻ nhỏ.
Công nghệ chiên không dầu Rapid Air giúp thức ăn chín đều hơn
Ứng dụng công nghệ chiên không dầu Rapid Air không khí kết hợp với quạt thổi gió giúp không khí nóng được lan tỏa nhanh và mạnh đều khắp bề mặt thực phẩm đảm bảo món ăn được chín đều mà không cần trở mặt nhiều như khi chiên bằng chảo chống dính.', N'noi-chien-khong-dau-dien-tu-35-lit-coex-afc3115-C5ixBc.png', 1),
(3, 5, N'Nồi chiên không dầu 5 Lít cao cấp Coex AFC-3118M', 3070000.0000, N'AFC-3118M', 92, 24, N'Trung Quốc', 0, N'Công suất mạnh mẽ 1700W cho món ăn chín nhanh, ít dầu, tốt cho sức khỏe của người dùng
Dung tích chứa siêu lớn 5.0 Lít
Công nghệ Rapid Air độc đáo có thể rán, nướng, quay ngon và giảm dầu mỡ đến 80%', N'Thiết kế sang trọng, tinh tế
Nồi chiên không dầu cao cấp Coex AFC-3118M thiết kế sang trọng, trang nhã cùng với chất liệu an toàn, bền bỉ. Vỏ ngoài bằng thép không gỉ, sang trọng, dễ vệ sinh.
Công suất 1700W
Nồi chiên không dầu Coex 3118M có công suất 1700W giúp chế biến được nhiều món ăn nhanh hơn, giúp tiết kiệm năng lượng đến 50% so với nồi thường. Không những chiên thức ăn không dùng đến dầu mà còn giúp loại bỏ đến 80% lượng mỡ có sẵn trong thực phẩm.', N'-krQCen.png', 1),
(3, 5, N'Nồi chiên không dầu 5L Coex AFC-3119', 3690000.0000, N'AFC-3119', 64, 12, N'Trung Quốc', 0, N'Dung tích chứa siêu lớn 5.0 Lít, Công suất mạnh mẽ 1700W cho món ăn chín nhanh, ít dầu, tốt cho sức khỏe của người dùng
Khay chiên phủ lớp chống dính Ceramic cao cấp bền bỉ, hạn chế dính cháy, dễ chùi rửa sau khi dùng
Bảng điều khiển gồm 2 núm điều chỉnh thời gian và nhiệt độ riêng biệt dễ sử dụng', N'Thiết kế sang trọng, tinh tế
Nồi chiên không dầu cao cấp Coex AFC-3119 thiết kế sang trọng, trang nhã cùng với chất liệu an toàn, bền bỉ. Vỏ ngoài bằng thép không gỉ, sang trọng, dễ vệ sinh.
Công suất 1700W
Nồi chiên không dầu Coex có công suất 1700W giúp chế biến được nhiều món ăn nhanh hơn, giúp tiết kiệm năng lượng đến 50% so với nồi thường. Không những chiên thức ăn không dùng đến dầu mà còn giúp loại bỏ đến 80% lượng mỡ có sẵn trong thực phẩm.
Dung tích chứa 5.0L
Với dung tích 5.0L, nồi chiên không dầu sử dụng cảm biến nhiệt độ và thời gian, điều khiển cơ với 2 nút xoay điều chỉnh nhiệt độ và thời gian. Bạn có thể điều chỉnh nhiệt độ và thời gian nướng bằng các núm vặn xoáy. Nồi sử dụng cảm biến nhiệt độ, thời gian đã được cài đặt và tự động ngắt giúp đồ ăn chín đều, giòn, ngon, không bị cháy khét. Nồi chiên không dầu phù hợp chiên, nướng dành cho gia đình trên 6 người ăn', N'-J63WXT.png', 1),
(3, 5, N'Nồi chiên không dầu 5.5 Lít cao cấp Coex AFC-3109', 3990000.0000, N'AFC-3109', 462, 12, N'Trung Quốc', 0, N'Dung tích chứa siêu lớn 5.5 Lít
Công suất 1500W chế biến được nhiều món ăn nhanh hơn
Công nghệ Rapid Air độc đáo có thể rán, nướng, quay ngon, giảm dầu mỡ đến 80%
Kính cường lực trong suốt, quan sát được quá trình chín thực phẩm', N'Thiết kế sang trọng, tinh tế
Nồi chiên không dầu cao cấp Coex AFC-3109 thiết kế sang trọng, trang nhã cùng với chất liệu an toàn, bền bỉ. Kính cường lực trong suốt, quan sát được quá trình chín thực phẩm bên trong. Vỏ ngoài bằng thép không gỉ, sang trọng, dễ vệ sinh.
Công suất 1500W
Nồi chiên không dầu Coex có công suất 1500W giúp chế biến được nhiều món ăn nhanh hơn, giúp tiết kiệm năng lượng đến 50% so với nồi thường. Không những chiên thức ăn không dùng đến dầu mà còn giúp loại bỏ đến 80% lượng mỡ có sẵn trong thực phẩm.
Khay chiên phủ lớp chống dính Ceramic
Khay chiên phủ lớp chống dính Ceramic an toàn giúp thực phẩm không bị dính, không bị vỡ nát trong quá trình chiên, rán... dễ chùi rửa sau khi dùng. Mặt kính cường lực trong suốt chịu nhiệt cao, người dùng có thể dễ dàng quan sát quá trình thực phẩm được chiên từ đó điều chỉnh nhiệt độ và thời gian phù hợp.', N'noi-chien-khong-dau-coex-afc3109-T74L46.png', 1),
(3, 5, N'Nồi chiên không dầu điện tử cao cấp 5 lít Coex AFC-3118', 4290000.0000, N'AFC-3118', 30, 12, N'Trung Quốc', 0, N'Dung tích chứa siêu lớn 5 lít, công suất mạnh mẽ 1700W cho món ăn chín nhanh, ít dầu, tốt cho sức khỏe của người dùng
Khay chiên phủ lớp chống dính ceramic cao cấp bền bỉ, hạn chế dính cháy, dễ chùi rửa sau khi dùng
Bảng điều khiển điện tử dễ dàng thao tác chọn các chức năng', N'Thiết kế sang trọng, tinh tế
Nồi chiên không dầu cao cấp Coex AFC-3118 thiết kế sang trọng, trang nhã cùng với chất liệu an toàn, bền bỉ. Vỏ ngoài bằng thép không gỉ, sang trọng, dễ vệ sinh.
Công suất 1700W
Nồi chiên không dầu Coex có công suất 1700W giúp chế biến được nhiều món ăn nhanh hơn, giúp tiết kiệm năng lượng đến 50% so với nồi thường. Không những chiên thức ăn không dùng đến dầu mà còn giúp loại bỏ đến 80% lượng mỡ có sẵn trong thực phẩm.
Dung tích chứa 5L
Với dung tích 5L, nồi chiên không dầu sử dụng cảm biến nhiệt độ và thời gian, bảng điều khiển điện tử dễ dàng thao tác chọn các chức năng. Bạn có thể điều chỉnh nhiệt độ và thời gian nướng tùy thích. Nồi sử dụng cảm biến nhiệt độ, thời gian được cài đặt và tự động ngắt giúp đồ ăn chín đều, giòn, ngon, không bị cháy khét. Nồi chiên không dầu phù hợp chiên, nướng dành cho gia đình trên 6 người ăn.', N'noi-chien-khong-dau-dien-tu-cao-cap-5-lit-coex-afc3118-f962HO.png', 1),
(3, 6, N'Nồi chiên không dầu Philips HD9216', 2880000.0000, N'HD9216', 46, 12, N'Trung Quốc', 0, N'Dung tích 3 lít, Công suất 1425W nấu nhanh hơn so với lò nướng thường
Với Airfryer bạn có thể rán, quay, nướng và thậm chí là nướng bánh
Điều khiển thời gian và nhiệt độ có thể điều chỉnh theo cách thủ công
Rán có lợi cho sức khỏe với công nghệ Rapid Air', N'Nồi chiên chân không Philips HD9216 với công nghệ Rapid Air độc đáo của Philips cho phép bạn rán bằng không khí, khiến cho thức ăn giòn ở bên ngoài và mềm ở bên trong.Chỉ cần ít dầu hoặc không cần dầu để có món ăn đẹp hoàn hảo và thật ngon miệng
Ưu điểm: Nồi chiên chân không HD 9216:
Rán có lợi cho sức khỏe với công nghệ Rapid Air
Nồi chiên chân không Philips HD9216 với công nghệ Rapid Air, Airfryer luân chuyển khí nóng xung quanh giỏ nấu bọc lưới kim loại, sử dụng ít dầu hoặc không dùng dầu khi chiên rán, nướng thịt và nướng bánh. Mặt đáy của Airfryer được thiết kế hình sao giúp lưu thông khí dễ dàng, đảm bảo các món ăn ưa thích của bạn được nấu chín đều.
Với Airfryer bạn có thể rán, quay, nướng và thậm chí là nướng bánh
Không chỉ tuyệt vời khi rán, Philips Airfryer đổi mới với công nghệ Rapid Air còn cho phép bạn quay, nướng bánh và nướng những món ăn ưa thích với giải pháp một lần kết thúc cho tất cả các món của bữa ăn.
Điều khiển thời gian và nhiệt độ có thể điều chỉnh theo cách thủ công
Chức năng hẹn giờ tích hợp cho phép bạn đặt sẵn thời gian nấu lên đến 30 phút. Chức năng tự động tắt có cả chỉ báo âm thanh "sẵn sàng". Điều khiển nhiệt độ hoàn toàn có thể điều chỉnh cho phép bạn đặt trước nhiệt độ nấu ăn tốt nh ất cho thức ăn lên đến 390 độ. Thưởng thức những miếng rán giòn, vàng ươm, món ăn nhanh, gà, thịt và nhiều món khác, tất cả đều được chế biến với thời gian và nhiệt độ phù hợp để cho kết quả tốt nh ất!', N'-92o6kY.png', 1),
(3, 6, N'Nồi chiên không dầu Philips HD9220 2.2L', 2390000.0000, N' HD9220', 61, 12, N'Trung Quốc', 0, N'Dùng công nghệ Rapid Air có thể rán, nướng, quay thực phẩm không cần dầu.
Có thể điều chỉnh nhiệt độ đến 200 độ C, hẹn giờ nấu đến 30 phút tiện dụng.
Công suất cao 1425 W cho hiệu quả nấu ăn nhanh.', N'Thiết kế tinh tế
Nồi chiên không dầu Philips HD9220 sở hữu màu đen trang nhã với chất liệu vỏ nhựa cao cấp chắc chắn, làm tôn thêm sự tinh tế của gian bếp nhà bạn.
Cài đặt dễ dàng
Nồi chiên không dầu Philips có khả năng cài đặt nhiệt độ lên đến 200 độ và thời gian hẹn giờ tối đa 30 phút cho bạn lựa chọn chủ động trong công việc nấu nướng.
Chiên không dầu
Nồi chiên không dầu sử dụng công nghệ Rapid Air, dùng dòng khí nóng lên đến 200 độ C đối lưu nhanh và mạnh xung quanh thực phẩm để chiên giòn đều bằng không khí mà không cần dầu mỡ.
An toàn khi sử dụng
Philips HD9220 có chức năng tự ngắt điện khi chiên xong giúp bạn yên tâm khi sử dụng, không cần lo những sự cố về điện', N'-7387Po.png', 1),
(3, 6, N' Nồi chiên không dầu Philips HD9218', 2790000.0000, N'HD9218', 73, 12, N'Trung Quốc', 0, N'Dung tích 3 lít, Công suất 1425W nấu nhanh hơn so với lò nướng thường
Với Airfryer bạn có thể rán, quay, nướng và thậm chí là nướng bánh
Điều khiển thời gian và nhiệt độ có thể điều chỉnh theo cách thủ công
Rán có lợi cho sức khỏe với công nghệ Rapid Air', N'Với Airfryer bạn có thể rán, quay, nướng và thậm chí là nướng bánh
Không chỉ tuyệt vời khi rán, Philips Airfryer đổi mới với công nghệ Rapid Air còn cho phép bạn quay, nướng bánh và nướng những món ăn ưa thích với giải pháp một lần kết thúc cho tất cả các món của bữa ăn.
Điều khiển thời gian và nhiệt độ có thể điều chỉnh theo cách thủ công
Chức năng hẹn giờ tích hợp cho phép bạn đặt sẵn thời gian nấu lên đến 30 phút. Chức năng tự động tắt có cả chỉ báo âm thanh "sẵn sàng". Điều khiển nhiệt độ hoàn toàn có thể điều chỉnh cho phép bạn đặt trước nhiệt độ nấu ăn tốt nhất cho thức ăn lên đến 390 độ F. Thưởng thức những miếng rán giòn, vàng ươm, thức ăn nhanh, gà, thịt và nhiều món khác, tất cả đều được chế biến với thời gian và nhiệt độ phù hợp để cho kết quả tốt nhất!
Rán có lợi cho sức khỏe với công nghệ Rapid Air
Với công nghệ Rapid Air, Airfryer luân chuyển khí nóng xung quanh giỏ nấu bọc lưới kim loại, sử dụng ít dầu hoặc không dùng dầu khi chiên rán, nướng thịt và nướng bánh. Mặt đáy của Airfryer được thiết kế hình sao giúp lưu thông khí dễ dàng, đảm bảo các món ăn ưa thích của bạn được nấu chín đều.', N'noi-chien-khong-dau-philips-hd9218-0a608i.png', 1),
(3, 6, N'Nồi chiên không dầu Philips HD9650/91', 69909000.0000, N'HD9650/91', 34, 12, N'Trung Quốc', 0, N'Dùng chiên, nướng thực phẩm nhanh chóng với công suất 2200 W.
Giảm đến 90% lượng chất béo trong thực phẩm nhờ công nghệ chiên không dầu Radpid Twin Turbo Star hiện đại.', N'Món ăn từ nồi chiên không dầu chín ngon chuẩn vị
Nồi chiên không dầu Philips HD9650/91 sở hữu công nghệ TurboStar với luồng nhiệt được truyền mạnh mẽ, ổn định giúp bạn tiết kiệm công sức, không phải lật trở nhiều ngay cả khi thức ăn chất chồng lên nhau, để thức ăn đạt được độ "giòn bên ngoài, mềm bên trong".
Thiết kế nhỏ gọn, hiện đại
Nồi chiên không dầu Philips sở hữu thiết kế hình sao nhỏ gọn, đẹp mắt cùng với màu đen bóng sang trọng, tôn lên vẻ đẹp, hiện đại cho căn bếp của gia đình bạn. Công nghệ chiên nướng không cần dầu mang đến những món ăn tốt cho sức khỏe của cả gia đình bạn.
An toàn tuyệt đối
Nồi chiên không dầu có vỏ máy mát, chân đế chống trượt mang lại sự an toàn tuyệt đối cho người sử dụng. Bên cạnh đó còn có chế độ tự động ngắt khi đã nấu xong giúp món ăn ngon chuẩn vị mà không phải mất thời gian để canh chừng.
', N'noi-chien-khong-dau-philips-hd965091-74mbPo.jpg', 1),
(3, 6, N'Nồi chiên không dầu Philips HD9745/90', 4990000.0000, N'HD9745/90', 64, 12, N'Trung Quốc', 0, N'Dung tích 3 lít, Công suất 1500W nhanh hơn 1,5 lần so với lò nướng thường
Công nghệ Rapid Air cho món ăn giòn rụm và thơm ngon hơn
Công nghệ Loại bỏ chất béo giúp tách và thu gom chất béo dư thừa
Chiên rán, nướng, quay hoặc hâm nóng thức ăn', N'Chiên rán, nướng, quay hoặc hâm nóng thức ăn.
Bạn có thể chế biến hàng trăm món ăn với nồi chiên Airfryer. Chiên rán, nướng bánh, quay giòn, nướng thịt hoặc hâm nóng thức ăn. Mỗi món ăn đều thơm ngon đến miếng cuối cùng nhờ thiết kế hình sao và luồng khí nóng của Philips cho phép không khí lưu chuyển dễ dàng. Nồi chiên này giúp thức ăn chín đều từ mọi phía để bạn có thể thưởng thức bữa ăn hoàn hảo vào mọi lúc.
Ứng dụng với hàng trăm công thức chế biến và đi kèm sách hướng dẫn miễn phí
Từ các món ăn nhanh lành mạnh đến bữa ăn đầy đủ cho gia đình, sách dạy nấu ăn miễn phí của chúng tôi có hơn 30 món ăn thơm ngon và hướng dẫn dễ thực hiện từ các đầu bếp chuyên nghiệp. Ứng dụng Philips Airfryer của chúng tôi có đầy đủ các mẹo, hướng dẫn và công thức nấu ăn dễ thực hiện', N'noi-chien-khong-dau-philips-hd9745-PqKe6a.png', 1),
(4, 3, N'Loa Soundbar Samsung HW-Q600A/XV', 6643000.0000, N'HW-Q600A/XV', 28, 12, N'Việt Nam', 0, N'Âm Thanh 2.1ch Chân Thực
Âm thanh vòm 3D
Tinh Chỉnh Âm Thanh Vượt Trội
Điều Khiển Thông Minh One Remote', N'Chất Âm Ấn Tượng
Với loa thanh 2.1ch kênh và loa siêu trầm 6.5 inch, bạn sẽ cảm nhận trọn vẹn dải âm chất lượng xung quanh với uy lực âm trầm sâu hơn, mạnh mẽ hơn.
Điều Chỉnh Dễ Dàng Với One Remote
Bạn không cần nhiều remote để điều khiển các thiết bị. Từ việc bật tắt, điều chỉnh âm lượng, thậm chí hiệu ứng âm thanh và nhiều tính năng khác của loa thanh có thể được điều chỉnh chỉ với One Remote.
Hoàn Hảo Cho Mọi Nội Dung
Loa thanh Samsung tự động phân tích và tối ưu âm thanh trên từng khung hình hiển thị tương ứng. Thoải mái cuồng nhiệt cùng những trận cầu kịch tính hay dễ dàng lắng nghe trọn vẹn những cuộc hội thoại trong phim với thanh âm sắc nét phát ra từ loa thanh.', N'-00BMt7.jpg', 1),
(4, 3, N'Loa Soundbar Samsung HW-Q950A/XV', 24990000.0000, N'HW-Q950A/XV', 46, 12, N'Việt Nam', 0, N'Thưởng thức sắc âm chuẩn 11.1.4CH
Sống động bộ Loa Vệ Tinh Không Dây
Âm thanh vòm 3D cải tiến, bao trùm mọi giác quan
Tính năng Adaptive Sound tự động cân chỉnh âm thanh', N'Chất Âm Ấn Tượng
Với loa thanh 2.1ch kênh và loa siêu trầm 6.5 inch, bạn sẽ cảm nhận trọn vẹn dải âm chất lượng xung quanh với uy lực âm trầm sâu hơn, mạnh mẽ hơn.
Điều Chỉnh Dễ Dàng Với One Remote
Bạn không cần nhiều remote để điều khiển các thiết bị. Từ việc bật tắt, điều chỉnh âm lượng, thậm chí hiệu ứng âm thanh và nhiều tính năng khác của loa thanh có thể được điều chỉnh chỉ với One Remote.
Hoàn Hảo Cho Mọi Nội Dung
Loa thanh Samsung tự động phân tích và tối ưu âm thanh trên từng khung hình hiển thị tương ứng. Thoải mái cuồng nhiệt cùng những trận cầu kịch tính hay dễ dàng lắng nghe trọn vẹn những cuộc hội thoại trong phim với thanh âm sắc nét phát ra từ loa thanh.', N'loa-soundbar-samsung-hwq950axv-X3aY50.jpg', 1),
(4, 3, N'Smart Tivi Samsung 4K 43 inch 43AU8000 Crystal UHD', 18900000.0000, N'UA43AU8000KXXV', 94, 12, N'Việt Nam', 0, N'Tận hưởng màu sắc chân thực nhờ công nghệ Dynamic Crystal 4K
Dynamic Crystal Color đắm mình vào khung hình
Dễ dàng tìm kiếm nội dung nhờ Trợ lý ảo Google
Multi View xem nhiều nội dung trên một khung hình', N'Sắc Màu Ấn Tượng Trên Thiết Kế Mỏng Chưa Từng Có
Chân Thực Sắc Màu Với Trạng Thái Tinh Khiết Của Tinh Thể Mịn
Công Nghệ Dynamic Crystal Color - Thưởng thức những khung hình chân thực với tỷ sắc màu sống động. Công nghệ Dynamic Crystal Color truyền tải tinh tế từng biến chuyển sắc màu, cho bạn thưởng thức mọi thay đổi dù là nhỏ nhất.
Cảm Nhận Sắc Màu Cuộc Sống Với 4K Quyền Năng
Bộ Xử Lý Crystal 4K - Nâng cấp mọi nội dung yêu thích lên chuẩn 4K ấn tượng. Bạn thoả sức chiêm ngưỡng những sắc thái màu nguyên bản, thật như cuộc sống với công nghệ ánh xạ màu tiên tiến.', N'-5pw465.jpg', 1),
(4, 3, N'Smart Tivi Samsung 4K 55 inch 55AU7700 UHD', 19900000.0000, N'UA55AU7700KXXV', 72, 24, N'Việt Nam', 0, N'Công Nghệ Motion Xcelerator cho khung hình rõ nét
Tái hiện sắc màu chân thực với công nghệ PurColor
Thưởng thức nội dung 4K chuẩn điện ảnh', N'Trải Nghiệm Nội Dung 4K Hoàn Mỹ Trên Thế Hệ Smart TV Mới
Tái Hiện Sắc Màu Cuộc Sống, Rực Rỡ Và Sống Động Hơn
PurColor - Choáng ngợp trước dải màu sắc hiển thị rộng lớn và rực rỡ từ công nghệ PurColor. Đắm chìm trong từng khung hình sống động và chân thực như bước ra từ cuộc sống.
Cảm Nhận Màu Sắc Chân Thực Trong Khung Hình 4K Sống Động
Bộ Xử Lý Crystal 4K - Nâng cấp mọi nội dung bạn yêu thích lên chuẩn 4K ấn tượng. Chiêm ngưỡng sắc màu hiển thị sống động và chân thực với công nghệ Color Mapping tiên tiến.
Rõ Khung Hình, Mượt Chuyển Động
Công Nghệ Motion Xcelerator - Trong các phân cảnh đua xe hoặc rượt đuổi, các khung hình thay đổi liên tục dễ dẫn đến hiện tượng "bóng ma" trên màn hình. Công nghệ Motion Xcelerator sẽ tự động bổ sung thêm khung hình để nội dung rõ nét và mượt mà hơn.', N'smart-tivi-samsung-4k-55-inch-55au7700-uhd-f7iBwb.jpg', 1),
(4, 3, N'Smart Tivi Samsung 4K 55 inch 55AU9000 Crystal UHD', 21000000.0000, N'UA55AU9000KXXV', 82, 24, N'Việt Nam', 0, N'Tận hưởng màu sắc chân thực nhờ công nghệ Dual LED
Dynamic Crystal Color đắm mình vào khung hình
Dễ dàng tìm kiếm nội dung nhờ Trợ lý ảo Google', N'Tận Hưởng Trọn Vẹn Niềm Vui Giải Trí Ngay Tại Nhà Cùng TV Crystal UHD 4K Samsung
Tái Tạo Hoàn Hảo Sắc Màu Chân Thực Và Tinh Khiết
Công Nghệ Dynamic Crystal Color - Đắm chìm hoàn toàn trong khung hình rực rỡ tỷ sắc màu. Công nghệ Dynamic Crystal Color tái hiện màu sắc chân thực, tuyệt đẹp như cuộc sống để bạn nhìn rõ mọi chi tiết sống động.
Cảm Nhận Màu Sắc Chân Thực Trong Khung Hình 4K Sống Động
Bộ Xử Lý Crystal 4K - Nâng cấp mọi nội dung bạn yêu thích lên chuẩn 4K ấn tượng. Chiêm ngưỡng sắc màu hiển thị sống động và chân thực với công nghệ Color Mapping tiên tiến.', N'smart-tivi-samsung-4k-55-inch-55au9000-crystal-uhd-JyY5Qd.jpg', 1),
(4, 4, N'Loa SoundBar LG SL4 2.1 CH', 2190000.0000, N'LG SL4', 69, 12, N'Việt Nam', 0, N'Loa siêu trầm cho âm thanh rõ ràng
Công nghệ Dolby Atmos
Hi-res Audio đạt 24bit/192kHz.
Kết nối không dây Bluetooth', N'Thiết kế thon gọn, kiểu dáng hiện đại, chỉnh chu trong từng chi tiết giúp nâng cao phẩm chất và đẳng cấp của không gian sử dụng
Loa thanh soundbar LG 2.1 SL4 300W có 1 thanh loa và 1 loa trầm Carbon được thiết kế gọn gàng, chắc chắn, đường nét được cắt gọt hoàn hảo, màu đen quý phái tôn vinh mọi không gian bố trí.
Loa soundbar cho âm thanh vòm bùng nổ, bao trùm không gian với công nghệ Dolby Atmos, DTS:X, công suất 300 W
Âm thanh vòng đa chiều lan tỏa khắp không gian cho bạn trải nghiệm cảm giác nghe nhạc, xem phim, tin tức như đang ở trong rạp hát, rạp chiếu phim thực sự. Âm trầm đến từ loa trầm Carbon cho âm thanh trung thực, rõ nét, không bị méo tiếng.
Công suất 300 W, hệ thống loa LG 2.1 kênh cho bạn tận hưởng chất lượng âm thanh đỉnh cao trong từng khoảnh khắc.
Ngoài ra, sản phẩm còn có tính năng điều khiển âm thanh tương thích cho khả năng loa tự xác định nội dung đang phát, điều chỉnh chế độ âm thanh phù hợp để người dùng có trải nghiệm âm thanh chính xác, thực tế nhất.
Âm thanh trung thực, có chiều sâu với độ phân giải cao, đạt chứng nhận Hi-res Audio có thể phát âm thanh chất lượng đến 24bit/192kHz
Kết nối không dây Bluetooth cho phép người dùng chuyển đổi, phát nhạc trực tiếp, ổn định từ điện thoại, máy tính bảng,... đến loa LG dễ dàng', N'-pFble3.jpg', 1),
(4, 4, N'Loa Soundbar LG QP5W 3.1.2CH', 7490000.0000, N'QP5W', 70, 12, N'Việt Nam', 0, N'Chia sẻ chế độ âm thanh TV & Điều khiển chế độ loa Soundbar
Low-vibration Subwoofer
Dolby Atmos & DTS:X', N'Thiết kế thon gọn, kiểu dáng hiện đại, chỉnh chu trong từng chi tiết giúp nâng cao phẩm chất và đẳng cấp của không gian sử dụng
Loa thanh soundbar LG 2.1 SL4 300W có 1 thanh loa và 1 loa trầm Carbon được thiết kế gọn gàng, chắc chắn, đường nét được cắt gọt hoàn hảo, màu đen quý phái tôn vinh mọi không gian bố trí.
Loa soundbar cho âm thanh vòm bùng nổ, bao trùm không gian với công nghệ Dolby Atmos, DTS:X, công suất 300 W
Âm thanh vòng đa chiều lan tỏa khắp không gian cho bạn trải nghiệm cảm giác nghe nhạc, xem phim, tin tức như đang ở trong rạp hát, rạp chiếu phim thực sự. Âm trầm đến từ loa trầm Carbon cho âm thanh trung thực, rõ nét, không bị méo tiếng.
Công suất 300 W, hệ thống loa LG 2.1 kênh cho bạn tận hưởng chất lượng âm thanh đỉnh cao trong từng khoảnh khắc.
Ngoài ra, sản phẩm còn có tính năng điều khiển âm thanh tương thích cho khả năng loa tự xác định nội dung đang phát, điều chỉnh chế độ âm thanh phù hợp để người dùng có trải nghiệm âm thanh chính xác, thực tế nhất.
Âm thanh trung thực, có chiều sâu với độ phân giải cao, đạt chứng nhận Hi-res Audio có thể phát âm thanh chất lượng đến 24bit/192kHz
Kết nối không dây Bluetooth cho phép người dùng chuyển đổi, phát nhạc trực tiếp, ổn định từ điện thoại, máy tính bảng,... đến loa LG dễ dàng', N'loa-soundbar-lg-qp5w-O2GroS.jpg', 1),
(4, 4, N'Smart Tivi LG 4K 43 inch 43UP7720PTC ThinQ AI', 13900000.0000, N'43UP7720PTC', 18, 12, N'Việt Nam', 0, N'Xem 4K Ultra HD rực rỡ với chất lượng hình ảnh sống động.
Chất lượng âm thanh hấp thụ và không khí với AI Sound
Nền tảng thông minh webOS với Freeview Play, Netflix, Disney + và hơn thế nữa
Kiểu dáng đẹp và mỏng với chân đế kép', N'4K UHD - Xem sống động ở độ phân giải cực cao
TV LG UHD vượt qua sự mong đợi của bạn mọi lúc. Trải nghiệm chất lượng hình ảnh sống động như thật và màu sắc sống động với độ chính xác pixel gấp bốn lần so với Full HD.
FILMMAKER MODE ™ - Hiệu suất phim bom tấn được đảm bảo.
Mang rạp chiếu phim về nhà. FILMMAKER MODE ™ và HDR mang đến cho bạn trải nghiệm xem đắm chìm hơn. Kết nối với các nền tảng phát trực tuyến yêu thích của bạn để truy cập nội dung bạn yêu thích.', N'smart-tivi-lg-4k-43-inch-43up7720ptc-thinq-ai-9A3TOj.jpg', 1),
(4, 4, N'Smart Tivi LG 4K 55 inch 55UP8100PTB ThinQ AI', 20400000.0000, N'55UP8100PTB', 76, 24, N'Việt Nam', 0, N'Độ sống động, màu sắc và độ sâu của hình ảnh 4K Ultra HD đáng kinh ngạc
Chất lượng âm thanh hấp thụ và không khí với AI Sound
Nền tảng thông minh webOS với Freeview Play, Netflix, Disney + và hơn thế nữa', N'Chuẩn 4K đích thực - Đắm chìm trong các nội dung 4K đặc sắc
TV LG UHD luôn vượt quá sự mong đợi của bạn. Trải nghiệm chất lượng hình ảnh trung thực và màu sắc sống động với điểm ảnh cùng độ chính xác cao gấp bốn lần so với Full HD.
Thưởng thức trọn vẹn những bộ phim bom tấn
Mang cả rạp chiếu phim về nhà. FILMMAKER MODE™, Dolby Vision IQ & Dolby Atmos và HDR mang đến cho bạn trải nghiệm xem ngoạn mục hơn. Kết nối với các nền tảng truyền phát trực tuyến và dễ dàng truy cập nội dung yêu thích của bạn', N'smart-tivi-lg-4k-55-inch-55up8100ptb-thinq-ai-kscAns.jpg', 1),
(4, 4, N'Smart Tivi LG 32 inch 32LM575BPTC ThinQ AI', 7290000.0000, N'32LM575BPTC', 99, 12, N'Việt Nam', 0, N'Nâng cấp màu sắc sống động, Bộ Xử Lý Lõi Tứ
Virtual Surround Plus, Dolby Audio
Điều khiển thông minh, Điều khiển bằng giọng nói', N'Trải nghiệm chuẩn mực
LG TV mang đến hình ảnh chính xác hơn với độ phân giải tuyệt đẹp với màu sắc sống động.
Chất lượng hình ảnh rõ nét hơn
LG TV được gây ấn tượng với chất lượng hình ảnh rõ ràng, đẹp hơn gấp hai lần so với HD. Và với các tính năng Dynamic Color và Active HDR, toàn bộ nội dung yêu thích của bạn sẽ trở nên trung thực và sống động hơn.
Màu sắc sống động, tự nhiên nhất
Nâng cao hiệu suất xử lý và điều chỉnh màu sắc cho hình ảnh phong phú hơn, tự nhiên hơn. Tận hưởng vẻ đẹp thiên nhiên với màu sắc trung thực trên màn hình TV của bạn.
Active HDR Đi sâu vào chi tiết
LG TV mang đến màu sắc rực rỡ và chi tiết chính xác với Active HDR. Thưởng thức các bộ phim yêu thích với chất lượng tương tự như bản gốc với nhiều định dạng HDR bao gồm HDR10 và HLG.', N'smart-tivi-lg-32-inch-32lm575bptc-fhd-thinq-ai-163uqC.jpg', 1),
(5, 2, N'Tủ đông Kangaroo KG399NC1 286 Lít - Kháng khuẩn', 87890000.0000, N'KG399NC1', 75, 12, N'Việt Nam', 0, N'Công nghệ Digital Inverter tiết kiệm điện năng lên đến 50%
Công nghệ Nano bạc kháng khuẩn giúp thực phẩm luôn tươi ngon, thời gian bảo quản được lâu hơn.
Trang bị máy nén Panasonic made in Singapore hoạt động êm ái, độ bền cao.', N'Tủ đông kháng khuẩn Kangaroo KG399NC1 có kiểu dáng hiện đại, bo viền 4 góc sang trọng, vỏ ngoài được làm bằng nhựa ABS nguyên chất với gam màu trắng có độ bền cao, dễ dàng lau chùi. Đặc biệt dưới chân tủ có bánh xe giúp di chuyển dễ dàng khi muốn thay đổi vị trí đặt tủ. Tủ được thiết kế 1 ngăn 1 cánh, ngăn đông có nhiệt độ đông ≤ -18°C dùng để bảo quản thực phẩm tươi sống như thịt, cá, hải sản… rất tiện lợi.
Dung tích 399 Lít 
Mẫu tủ đông Kangaroo KG399NC1 có dung tích 399 Lít phù hợp để bảo quản rất nhiều loại thực phẩm khác nhau với số lượng lớn. Tủ có thể sử dụng cho các hộ kinh doanh nhỏ lẻ hoặc những gia đình đông người thường xuyên tích trữ đồ đông lạnh.', N'-K2pI20.png', 1),
(5, 2, N'Tủ đông Kangaroo 90L KG168NC1', 4490000.0000, N'KG168NC1', 43, 12, N'Việt Nam', 0, N'Model Tủ đông kháng khuẩn 1 ngăn – 1 cánh
Lòng tủ sử dụng công nghệ Nano bạc kháng khuẩn
Trang bị máy nén LG made in Korea hoạt động êm ái, độ bền cao.', N'Tủ đông kháng khuẩn Kangaroo KG168NC1 được thiết kế với kiểu dáng nhỏ gọn, thiết kế bo viền 4 góc sang trọng, vỏ ngoài có gam màu trắng đẹp mắt. Đặc biệt dưới chân tủ có bánh xe, dễ dàng di chuyển khi muốn thay đổi vị trí đặt tủ nên phù hợp với nhiều không gian khác nhau. Tủ được thiết kế 1 ngăn 1 cánh tiện lợi, với một ngăn đông có nhiệt độ đông ≤ -18°C dùng để bảo quản thực phẩm tươi sống như thịt, cá, hải sản… rất tiện lợi.
Dung tích 90 Lít 
Mẫu tủ đông Kangaroo KG168NC1 có dung tích 90 Lít nhỏ gọn, dự trữ được rất nhiều loại thực phẩm mà không chiếm quá nhiều không gian. Tủ có thể sử dụng cho các hộ kinh doanh nhỏ lẻ hoặc những gia đình nhỏ thường xuyên tích trữ đồ đông lạnh.
Lòng tủ nhôm phủ Nano bạc kháng khuẩn
Tủ đông kháng khuẩn Kangaroo KG168NC1 thiết kế lòng nhôm phủ Nano giúp diệt sạch vi khuẩn gây bệnh, chống oxy hóa, làm sạch không khí giữ cho thực phẩm tươi ngon lâu hơn.
', N'tu-dong-kangaroo-90l-kg168nc1-saZsMP.jpg', 1),
(5, 2, N'Tủ đông mềm Kangaroo 212L KG328DM2', 9390000.0000, N'KG328DM2', 73, 12, N'Việt Nam', 0, N'Dung tích ngăn mát: 86 lít, Dung tích ngăn đông: 126 lít
Dàn làm lạnh bằng đồng 99.99%
Có chức năng kháng khuẩn trong lòng tủ & trên tay cầm', N'Tủ đông mềm Kangaroo giúp thực phẩm ngoài chức năng cấp đông. Kèm theo đó là chức năng bảo quản đông mềm, đó là quá trình xử lý làm ức chế sự phát triển của vi khuẩn, làm giảm sự phá vỡ liên kết tế bào giữ cho thực phẩm được tươi ngon và giữ trọn hương vị.
Nhiệt độ ngăn đông mềm được duy trì trong khoảng từ -3 đến -7 độ C.
Nhiệt độ ngăn đông mềm được giữ từ -3 đến -7 độ C
Hai dàn lạnh độc lập bằng đồng 99.99% làm lạnh nhanh: Dàn lạnh ngăn đông mềm – Dàn lạnh ngăn mát
Tủ đông mềm Kangaroo kiểm soát nhiệt độ chính xác cao với bộ điều khiển nhiệt độ điện tử', N'-w89YJA.png', 1),
(5, 2, N'Tủ đông Kangaroo KG308C1 308 Lít - Kháng khuẩn', 9890000.0000, N'KG308C1', 85, 12, N'Việt Nam', 0, N'Dung tích Tổng/Thực: 308/278L, Công nghệ Digital Inverter tiết kiệm điện năng lên đến 50%
Công nghệ Nano bạc kháng khuẩn giúp thực phẩm luôn tươi ngon, thời gian bảo quản được lâu hơn.', N'Ở tủ đông, lòng tủ là nơi chứa nhiều loại vi khuẩn nhất, nếu không muốn nói là ổ vi khuẩn với nguy cơ lây nhiễm chéo giữa các loại thực phẩm với nhau. Chính vì vậy, một lớp nano bạc được Kangaroo tráng lên bề mặt lòng Tủ đông Kangaroo giúp vị trí này luôn sạch khuẩn, ngoài ra, các phân tử bạc cũng giúp chống oxy hóa, làm sạch không khí giữ cho thực phẩm tươi ngon lâu hơn.
Tủ đông kháng khuẩn Kangaroo KG308C1 màu xám bạc với dàn lạnh bằng đồng nguyên chất, làm lạnh nhanh,1 ngăn 2 cánh mở. Bên ngoài được làm bằng nhựa ABS nguyên chất, có độ bền cao. Đặc biệt dưới chân tủ có bánh xe, dễ dàng di chuyển khi muốn thay đổi vị trí đặt tủ.', N'tu-dong-kangaroo-kg308c1-308-lit-khang-khuan-gl81GH.jpg', 1),
(5, 2, N'Tủ đông Kangaroo KG235VC1 230 Lít - Kháng khuẩn', 4990000.0000, N'KG235VC1', 347, 12, N'Việt Nam', 0, N'- Tủ đông kháng khuẩn: 1 ngăn 1 cánh
- Màu xám bạc sang trọng hiện đại.
- Đèn chiếu sang, 2 cánh kính trượt 
- Tay nắm nổi có khóa/ Lòng nhôm sơn tĩnh điện phủ Nano bạc ', N'Tủ đông có kích thước nhỏ gọn, không chiếm nhiều không gian diện tích
Tủ đông Kangaroo 235 lít KG235VC1 có kiểu dáng 1 ngăn, một cánh mở, đơn giản, nhỏ gọn sẽ không chiếm nhiều không gian diện tích của gia đình bạn. Đi cùng dung tích tổng là 235 lít, tủ đông là sự lựa chọn lý tưởng cho gia đình sử dụng hoặc dùng cho hộ kinh doanh nhỏ lẻ.
Sử dụng gas R600a thân thiện với tầng Ozone, làm lạnh nhanh chóng
Dàn lạnh bằng đồng vận hành bền bỉ, đông lạnh nhanh chóng
Tủ đông có dàn lạnh được làm từ chất liệu đồng nguyên chất. Nhờ vậy, tủ không chỉ giúp đông lạnh thực phẩm nhanh hơn đến 30% mà còn đảm bảo độ vận hành bền bỉ với thời gian.', N'tu-dong-kangaroo-kg235vc1-230-lit-khang-khuan-0LooS2.jpg', 1),
(5, 4, N'Tủ Đông LG Inverter 165L GN-F304PS', 6190000.0000, N'GN-F304PS', 336, 12, N'Việt Nam', 0, N'Tay cầm thời trang, tiện lợi và không lo bị gãy tay cầm.
Thiết kế cửa bạch kim hoàn thiện, đẹp mắt.
Làm lạnh nhanh, tiết kiệm điện với máy nén Inverter.', N'Tay cầm thời trang, tiện lợi và không lo bị gãy tay cầm
Tay cầm của tủ đông LG 165 lít GN-F304PS được thiết kế màu đen bóng, nổi bật trên nền bạch kim của cửa tủ, giúp tủ thêm sang trọng và nổi bật hơn.
Ngoài ra, khác với những kiểu tủ truyền thống là tay cầm được lắp nổi trên bề mặt cửa thì ở dạng tủ đông này, tay cầm được thiết kế chìm bên trong cánh cửa, giúp thao tác đóng - mở cửa tủ dễ dàng hơn, gọn gàng và không lo bị gãy khi vận chuyển, lắp đặt, sử dụng.
Thiết kế cửa bạch kim hoàn thiện, làm phòng bếp trở nên sành điệu hơn
Cùng với tay cầm thì cửa của tủ đông này có màu bạch kim rất sành điệu, giúp làm sáng lên nội thất bên trong phòng bếp của bạn, thích hợp với nhiều không gian nội thất, chiều lòng mọi gu thẩm mĩ khó tính của người tiêu dùng.
Làm lạnh nhanh, tiết kiệm điện với máy nén Inverter
Sản phẩm tủ đông LG này sử dụng công nghệ làm lạnh trực tiếp cùng việc tích hợp công nghệ Inverter giúp làm lạnh nhanh, duy trì được nhiệt độ lạnh phù hợp mà hoạt động vẫn êm ái và giảm thiểu tiếng ồn.
Ngoài ra công nghệ này còn giúp tiết kiệm điện hiệu quả, với công suất tiêu thụ công bố theo TCVN là 399 kWh/năm, giải tỏa nỗi lo chi phí tiền điện hàng tháng.', N'-6VZiTQ.png', 1),
(5, 4, N'Tủ Đông LG Inverter 165L GN-F304WB', 6690000.0000, N'GN-F304WB', 94, 12, N'Việt Nam', 0, N'Sang trọng, chắn chắc với tay cầm dạng âm vào trong.
Kiểu dáng thon gọn, tinh tế.
Vận hành êm ái, tiết kiệm điện năng với công nghệ Inverter.', N'Sang trọng, không lo bị vướn, gãy với tay cầm dạng âm vào trong
Tủ đông LG 165 lít GN-F304WB có tay cầm màu đen bóng sang trọng, vững chắc, tiết kiệm không gian nội thất một cách tối đa với thiết kế chìm tinh tế, người dùng có thể dễ dàng sử dụng, vận chuyển mà không cần lo lắng vấn đề tay cầm sẽ bị gãy.
Kiểu dáng thon gọn, tinh tế
Tủ đông LG 165 lít GN-F304WB có kiểu dáng nhỏ gọn vô cùng tinh tế, lớp sơn tĩnh điện màu đen sang trọng, giúp tủ có thể hài hòa với không gian người dùng một cách dễ dàng mà không tốn nhiều diện tích', N'tu-dong-lg-inverter-165l-gnf304wb-v5XMGQ.jpg', 1),
(5, 7, N'Tủ đông Sanaky 260L Inverter VH-3699W3', 7790000.0000, N'VH-3699W3', 45, 12, N'Việt Nam', 0, N'Dung tích 360L gồm 1 ngăn đông và 1 ngăn mát, thích hợp sử dụng cho gia đình
Dàn lạnh làm bằng ống đồng, nhiệt độ làm lạnh đạt đến -18 oC nhanh chóng', N'Hoạt động bền bỉ
Tủ đông Sanaky VH 3699W3 làm lạnh bằng dàn đồng nguyên chất siêu bền. Hệ thống máy nén công nghệ Inverter làm lạnh nhanh, vận hành êm. Khe thoát nước an toàn cho máy, dễ vệ sinh.
Làm lạnh nhanh chóng
Tủ đông Sanaky công nghệ Nhật, 1 ngăn đông 1 ngăn mát. Quạt lồng sóc làm lạnh nhanh, sâu, trữ đông an toàn, tránh vi khuẩn, nấm mốc.
Dùng gas R600A thân thiện môi trường
Tủ đông sử dụng gas R600A thân thiện môi trường, đảm bảo sức khỏe người dùng. Bánh xe chịu lực tốt, dễ di chuyển.', N'-AgVmb0.jpg', 1),
(5, 7, N'Tủ đông 400L inverter SANAKY 1 NGĂN VH-4099A3', 7790000.0000, N'VH-4099A3', 346, 12, N'Việt Nam', 0, N'Tủ đông dung tích 400 lít bảo quản thực phẩm số lượng lớn
Dàn lạnh bằng đồng có độ bền cao
Quạt lồng sóc làm lạnh nhanh và sâu hơn
Thiết kế 1 ngăn 2 cửa tiện lợi, có bánh xe dễ dàng di chuyển', N'Tủ đông 1 ngăn 2 cửa
Tủ đông thiết kế hiện đại, có 1 ngăn đông và trang bị 2 cửa giúp người dùng thuận tiện lấy thực phẩm bên trong và tránh tình trạng thoát hơi lạnh hiệu quả.
Làm lạnh hiệu quả
Tủ đông Sanaky VH-4099A3 có hiệu suất làm lạnh và đông thực phẩm nhanh nhờ vào thành tủ được thiết kế dày, cửa tủ có ron cao su chống thoát hơi tốt
Tiết kiệm điện năng
Tủ đông Sanaky VH-4099A3 sử dụng công nghệ Inverter vận hành êm ái, bền bỉ, có khả năng tiết kiệm điện năng hiệu quả.
Điều khiển đơn giản
Tủ đông Sanaky được trang bị bộ điều khiển nằm ngay dưới góc bao gồm đèn báo hiệu và nút xoay điều chỉnh nhiệt độ giúp người dùng dễ dàng điều chỉnh nhiệt độ.
', N'-yyk5LR.jpg', 1),
(5, 7, N'Tủ đông Sanaky 100L VH-1599HYK', 5990000.0000, N'VH-1599HYK', 48, 12, N'Việt Nam', 0, N'Tủ đông Sanaky VH-1599HYK mặt kính cường lực', N'Một số tính năng cơ bản
Model VH-1599HYK sử dụng dàn lạnh bằng ống đồng kết hợp với quạt lồng sóc giúp cho nhiệt độ làm lạnh bên trong ngăn tủ đạt đến -18°C nhanh chóng, hơi lạnh sâu hơn giúp tăng hiệu suất làm lạnh của tủ. Hơn nữa độ bền của dàn đồng cao hơn so với các sản phẩm sử dụng dàn lạnh bằng nhôm.
Thiết kế 1 ngăn và 1 cánh mở kiểu vali rất dễ sử dụng. Mặt trên của cánh tủ được làm bằng kính cường lực, mặt kính phẳng sang trọng, tiện lợi khi sử dụng. Mặt kính bền màu theo thời gian cũng rất dễ dàng vệ sinh.
Cửa tủ cũng được lắp đặt khóa tủ nên rất tiện lợi cho chủ cửa hàng. An toàn với gia đình có trẻ nhỏ và tránh những trường hợp mở tủ ngoài ý muốn.
Lòng tủ cấp đông Sanaky được làm từ nhựa ABS cao cấp có độ bền cao và rất dễ dàng để vệ sinh.
Một số tính năng khác
– Gas làm lạnh của tủ là loại R600A mới nhất hiện nay cho hiệu suất làm lạnh tốt hơn, thân thiện với môi trường và người sử dụng.
– Bạn có thể dễ dàng điều chỉnh nhiệt độ của tủ bằng tút điều chỉnh nằm phía trước tủ.
– Chân tủ có 4 bánh lăn chịu lực, thuận tiện cho việc di chuyển.
– Sản phẩm bảo hành chính hãng tại nhà trong 2 năm', N'-q4I5dm.jpg', 1)
GO

INSERT INTO Accounts(UserName,[Password],FullName,Phone,[Address],Email,Avatar,[Role]) VALUES
('Admin','Admin123456',N'Đoàn Văn Admin',123456789,N'Việt Nam','Admin@gmail.com',N'icons8_user_80px_1.png',0),
('User','User123456',N'Đoàn Văn User',123456789,N'Việt Nam','User@gmail.com',N'icons8_user_80px_1.png',2),
('Staff','Staff123456',N'Đoàn Văn Staff',123456789,N'Việt Nam','Staff@gmail.com',N'icons8_user_80px_1.png',1)
GO

INSERT INTO Carts(ID_Product, ID_Account, Amount) VALUES
(16,2,1),
(6,2,2),
(20,2,3),
(2,2,4)
GO

INSERT INTO Bills(ID_Account, ReceiverName, ReceiverAddress, ReceiverEmail, ReceiverPhone, Note, PayType, BuyDate,[Status]) VALUES
(2, N'Nguyễn Văn Mua Test', N'Hải Dương', 'Mua@gmail.com', '1235578', N'Không ghi chú', N'Thẻ', '1/11/2021',5),
(2, N'Nguyễn Văn Mua 2', N'Hải Dương 2', 'Mua2@gmail.com', '26565452', N'Không ghi chú 2', N'Thẻ 2', '2/11/2021',5),
(2, N'Nguyễn Văn Mua 3', N'Hải Dương 3', 'Mua3@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '3/11/2021',5),
(2, N'Nguyễn Văn', N'Hải Dương', 'Mua@gmail.com', '1235578', N'Không ghi chú', N'Thẻ', '10/11/2021',5),
(2, N'Nguyễn Văn 2', N'Hải Dương 2', 'Mua2@gmail.com', '26565452', N'Không ghi chú 2', N'Thẻ 2', '4/11/2021',5),
(2, N'Nguyễn Văn 3', N'Hải Dương 3', 'Mua3@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '5/11/2021',5),
(2, N'Nguyễn Văn Mua 4', N'Hải Dương 4', 'Mua4@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '6/11/2021',5),
(2, N'Nguyễn Văn Mua 5', N'Hải Dương 5', 'Mua5@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '7/11/2021',5),
(2, N'Nguyễn Văn Mua 4', N'Hải Dương 4', 'Mua4@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '8/11/2021',5),
(2, N'Nguyễn Văn Mua 5', N'Hải Dương 5', 'Mua5@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '9/11/2021',5),
(2, N'Nguyễn Văn Mua 4', N'Hải Dương 4', 'Mua4@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '10/11/2021',5),
(2, N'Nguyễn Văn Mua 5', N'Hải Dương 5', 'Mua5@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '11/11/2021',5),
(2, N'Nguyễn Văn Mua 6', N'Hải Dương 6', 'Mua6@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '12/11/2021',5),
(2, N'Nguyễn Văn Mua 4', N'Hải Dương 4', 'Mua4@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '6/11/2021',2),
(2, N'Nguyễn Văn Mua 5', N'Hải Dương 5', 'Mua5@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '7/11/2021',3),
(2, N'Nguyễn Văn Mua 4', N'Hải Dương 4', 'Mua4@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '8/11/2021',4),
(2, N'Nguyễn Văn Mua 5', N'Hải Dương 5', 'Mua5@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '9/11/2021',6),
(2, N'Nguyễn Văn Mua 4', N'Hải Dương 4', 'Mua4@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '6/11/2021',2),
(2, N'Nguyễn Văn Mua 5', N'Hải Dương 5', 'Mua5@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '7/11/2021',3),
(2, N'Nguyễn Văn Mua 4', N'Hải Dương 4', 'Mua4@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '8/11/2021',4),
(2, N'Nguyễn Văn Mua 5', N'Hải Dương 5', 'Mua5@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '9/11/2021',6),
(2, N'Nguyễn Văn Mua 4', N'Hải Dương 4', 'Mua4@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '6/11/2021',2),
(2, N'Nguyễn Văn Mua 5', N'Hải Dương 5', 'Mua5@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '7/11/2021',3),
(2, N'Nguyễn Văn Mua 4', N'Hải Dương 4', 'Mua4@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '8/11/2021',4),
(2, N'Nguyễn Văn Mua 5', N'Hải Dương 5', 'Mua5@gmail.com', '47685678', N'Không ghi chú 3', N'Thẻ 3', '9/11/2021',6)
GO

INSERT INTO BillDetails(ID_Bill, ID_Product, Amount, CurrentlyPrice) VALUES
(1, 1, 16, 1234567),
(2, 45, 6, 78532),
(3, 22, 2, 7865),
(4, 10, 16, 13105),
(5, 20, 16, 3150450),
(6, 40, 16, 570453),
(7, 16, 16, 1234567),
(8, 7, 6, 78532),
(9, 35, 2, 7865),
(10, 15, 16, 13105),
(11, 11, 16, 3150450),
(12, 23, 16, 570453),
(13, 1, 16, 1234567),
(14, 45, 6, 78532),
(15, 22, 2, 7865),
(16, 10, 16, 13105),
(17, 20, 16, 3150450),
(18, 40, 16, 570453),
(19, 16, 16, 1234567),
(20, 7, 6, 78532),
(21, 35, 2, 7865),
(22, 15, 16, 13105),
(23, 11, 16, 3150450),
(24, 23, 16, 570453)
GO

INSERT INTO [Permissions]([Name],Code) VALUES
(N'Quản lý tài khoản', 'ACCOUNTS'),
(N'Quản lý hóa đơn', 'BILLS'),
(N'Quản lý danh mục', 'CATEGORIES'),
(N'Quản lý sản phẩm', 'PRODUCTS'),
(N'Quản lý nhà cung cấp', 'SUPPLIERS'),
(N'Quản lý thống kê', 'Statistic')
GO

INSERT INTO PermissionDetails(ID_Permission,ID_Account,[View],[Create],Edit,[Delete]) VALUES
(1,1,1,1,1,0),
(2,1,1,0,1,0),
(3,1,1,1,1,1),
(4,1,0,0,0,0),
(5,1,1,0,0,0),
(6,1,1,0,0,0),
(1,2,0,0,0,0),
(2,2,0,0,1,0),
(3,2,0,0,0,0),
(4,2,0,0,0,0),
(5,2,0,0,0,0),
(6,2,1,0,0,0)
GO

SELECT * FROM Categories
SELECT * FROM Suppliers
SELECT * FROM Products
SELECT * FROM Accounts
SELECT * FROM Carts
SELECT * FROM Bills
SELECT * FROM BillDetails
SELECT * FROM [Permissions]
SELECT * FROM PermissionDetails
GO

