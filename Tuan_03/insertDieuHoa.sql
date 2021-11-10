USE [ElectronicDeviceShopDB]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID_Category], [Name], [Icon], [Status]) VALUES (1, N'Bình tắm nóng lạnh', N'icon-binh-tam-nong-lanh.png', 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Icon], [Status]) VALUES (2, N'Điều hòa nhiệt độ', N'icon-dieu-hoa.png', 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Icon], [Status]) VALUES (3, N'Nồi chiên không dầu', N'icon-noi-chien.png', 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Icon], [Status]) VALUES (4, N'Tivi, Loa - Âm thanh', N'icon-tivi-loa-am-thanh.png', 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Icon], [Status]) VALUES (5, N'Tủ lạnh, Tủ đông, Tủ mát', N'icon-tu-lanh-tu-dong-tu-mat.png', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Suplliers] ON 

INSERT [dbo].[Suplliers] ([ID_Supllier], [Name], [Icon], [Status]) VALUES (1, N'Ariston', N'ariston-7QeHYs.png', 1)
INSERT [dbo].[Suplliers] ([ID_Supllier], [Name], [Icon], [Status]) VALUES (2, N'Kangharoo', N'kangaroo-DxE1BV.png', 1)
INSERT [dbo].[Suplliers] ([ID_Supllier], [Name], [Icon], [Status]) VALUES (3, N'SamSung', N'samsung-2XG2f2.png', 1)
INSERT [dbo].[Suplliers] ([ID_Supllier], [Name], [Icon], [Status]) VALUES (4, N'LG', N'lg-OI70q3.png', 1)
SET IDENTITY_INSERT [dbo].[Suplliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (1, 1, 1, N'Bình nóng lạnh gián tiếp Ariston AN2 30RS 2.5 FE-MT 30 lít', 3990000.0000, N'AN2 30RS 2.5 FE-MT', 10, 12, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp Ariston AN2 30RS 2.5 FE-MT 30 lít', N'Cơ chế làm nóng gián tiếp phù hợp cho các vùng có khí hậu lạnh (dưới 20 độ C). Dung tích 30 lít, dành cho những gia đình nhỏ có khoảng 4 thành viên. Vỏ chống thấm nước chuẩn IPX1 giúp linh kiện không bị bám nước gây chập mạch.Lòng bình tráng men Titan ngăn chặn rò rỉ nước bên trong, kéo dài tuổi thọ cho bình nước nóng Đèn báo đang đun nước và đèn báo nước đã sẵn sàng dùng.Thanh đốt 100% bằng đồng cho hiệu quả làm nóng nhanh chóng Hệ thống an toàn đồng bộ TSS giúp chống giật và chống bỏng hiệu quả.Công nghệ Ag+ kháng khuẩn bảo vệ sức khỏe cho người dùng', N'-WH1UeP.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (2, 1, 1, N'Bình nóng lạnh 20L Ariston SL2 20R', 4440000.0000, N'SL2 20R', 20, 12, N'Malaysia', 0, N'Bình nóng lạnh gián tiếp, Dung tích: 20 lít Kích thước: 704 x 301 x 282 mm ( DxRxC) Nhiệt độ tối đa: 80 độ, Bình chứa tráng men Titan, Hệ thống an toàn đồng bộ tích hợp ELCB chống giật Lớp cách nhiệt mật độ cao, Tiết kiệm điện năng chuẩn 5 sao Vỏ chống thấm nước', N'Bình nước nóng có thiết kế chữ nhật ngang hài hòa Bình nóng lạnh 20L Ariston SL2 20R có thiết kế dạng chữ nhật ngang đơn giản, dễ dàng lắp đặt ở những căn phòng tắm có trần tương đối thấp, mang đến vẻ đẹp hài hòa cho không gian nội thất. Là một chiếc bình tắm nóng lạnh gián tiếp, bình nóng lạnh Ariston có thể làm nóng nước lên đến 80 độ C, phù hợp để lắp đặt ở những khu vực có khí hậu lạnh như miền Bắc nước ta', N'-P2HwZg.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (3, 1, 1, N'Bình nóng lạnh 30L Ariston AN2 30R 2.5 FE-MT', 4700000.0000, N'AN2 30R 2.5 FE-MT', 30, 12, N'Malaysia', 0, N'Bình nóng lạnh gián tiếp Dung tích 30L, Công suất 2500W Làm nóng hiệu quả, An toàn: Chống giật ELCB Thanh đốt đồng cho độ bền vượt trội Hiển thị nhiệt độ an toàn khuyên dùng', N'Thiết kế sang trọng Bình nóng lạnh Ariston AN2 30R 2.5 FE-MT là dạng bình nóng lạnh gián tiếp, với thiết kế thanh lịch, gam màu đơn giản. Với nhiệt độ tối đa lên đến 80 độ C, phù hợp để lắp đặt ở nơi nhiệt độ thấp.Bình chứa 30 lít Bình nóng lạnh Ariston có bình chứa với dung tích 30 lít, lựa chọn lý tưởng cho gia đình ít người. Đun nóng nước 1 lần và sử dụng được nhiều lần nên sẽ tiết kiệm tối đa điện năng cho gia đình bạn.', N'-ZZFkGo.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (4, 1, 1, N'Bình nóng lạnh gián tiếp Ariston 20L SL2 20 RS', 4600000.0000, N'SL2 20 RS', 50, 12, N'Malaysia', 0, N'Thanh đốt 100% đồng chất lượng cao Bình chứa tráng men Titan Rơ le nhiệt cơ TBST  Khuyến cáo nhiệt độ an toàn Hệ thống an toàn đồng bộ TSS', N'THANH ĐỐT 100% ĐỒNG CHẤT LƯỢNG CAO Là chuyên gia hàng đầu trên thế giới trong lĩnh vực gia nhiệt, Ariston hiểu rằng tầm quan trọng của thanh đốt được ví như trái tim của con người. Bình nước nóng Ariston sử dụng thanh đốt 100% đồng, mang lại hiệu quả làm nóng nhanh và bền bỉ với thời gian. Bạn hoàn toàn có thể yên tâm với độ bền vượt trội của bình nước nóng Ariston.', N'-cItkGg.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (5, 1, 1, N'Bình nóng lạnh trực tiếp Ariston SM45PE-VN - 4500W', 2990000.0000, N'SM45PE-VN', 60, 12, N'Malaysia', 0, N'Thiết kế chống thấm nước, Bộ ổn định nhiệt lưỡng cực Hệ thống điều chỉnh lưu lượng nước,Vòi sen 3 chức năng Van cấp nước tích hợp 3 trong 1 (Khóa – Lọc – Mở)', N'Phong cách thiết kế đậm chất Ý Bình nóng lạnh trực tiếp Ariston SM45PE-VN được tạo nên bởi chính tay của một nhà thiết kế người Ý nổi tiếng, mang âm hưởng vẻ đẹp tinh tế nước Ý. Với thiết kế chống thấm nước IP25, Bình nóng lạnh Ariston sẽ hạn chế được sự rò rỉ điện xảy ra, giúp gia đình bạn luôn được an toàn', N'binh-nong-lanh-truc-tiep-ariston-sm45pevn-4500wco-bom-44a9Xv.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (6, 1, 1, N'Bình nóng lạnh gián tiếp Ariston AN2 15R 2.5 FE-MT 15 Lít', 4450000.0000, N'AN2 15R 2.5 FE-MT', 25, 6, N'Malaysia', 0, N'Thanh đốt đồng cho độ bền vượt trội Hiển thị nhiệt độ an toàn khuyên dùng', N'Thiết kế hiện đại Bình nóng lạnh Ariston AN2 15R 2.5 FE-MT là dạng bình nóng lạnh gián tiếp, với thiết kế thanh lịch, gam màu đơn giản. Với nhiệt độ tối đa lên đến 80 độ C, phù hợp để lắp đặt ở nơi nhiệt độ thấp.', N'-nu458B.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (7, 1, 1, N'Bình nóng lạnh 50L Ariston Pro R 50 SH 2.5 FE- Bình ngang', 5240000.0000, N'Pro R 50 SH 2.5 FE', 24, 24, N'Malaysia', 0, N'Dung tích: 50L, Công suất: 2500W Hệ thống an toàn đồng bộ TSS Bộ ổn nhiệt kiểm soát nhiệt độ hiệu quả', N'Thiết kế hiện đại Bình nóng lạnh Ariston Pro R 50 SH 2.5 FE thiết kế hiện đại, phù hợp nhiều nhiều không gian tạo nên sự hoàn hảo cho phòng tắm.Điều khiển dễ sử dụng Bình nóng lạnh Ariston cấu trúc đặc biệt đơn giản bảng điều khiển nằm một bên cho phép dễ dàng kiểm tra và bảo trì nhanh chóng khi cần thiết.', N'binh-nong-lanh-50l-ariston-pro-r-50-sh-25-fe-binh-ngang-39WSh0.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (8, 1, 2, N'Bình nước nóng 22L Kangaroo KG68A2', 2990000.0000, N'KG68A2', 111, 12, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp 22L, Công nghệ Nano kháng khuẩn 
Hệ thống an toàn đồng bộ CSS, Lớp cách nhiệt pu mật độ cao 
Chống giật kép, Chống đun khô, Tiết kiệm điện năng ', N'Dung tích 22L
Bình tắm nóng lạnh Kangaroo KG68A2 có dung tích 22L, đáp ứng tốt nhu cầu sử dụng của các hộ gia đình từ đông thành viên từ 4-5 người rất tiện dụng Thiết kế đẹp mắt
Bình tắm nóng lạnh gián tiếp với thiết kế sang trọng tinh tế với bình ngang vàng, chắc chắn sẽ đem lại sự sang trọng cho nội thất nhà bạn. Ruột bình nóng lạnh tráng kim cương nhân tạo, duy nhất trên thị trường có, mang đến độ bền cao cho sản phẩm ', N'binh-nuoc-nong-22l-kangaroo-kg68a2-XkMpfg.jpg', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (9, 1, 2, N'Bình nóng lạnh 15L Kangaroo KG516N', 3510000.0000, N'KG516N', 123, 18, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp 15L Chống giật kép, Chống đun khô 
Công nghệ Nano kháng khuẩn, Hệ thống an toàn đồng bộ CSS 
Lớp cách nhiệt pu mật độ cao
Tiết kiệm điện năng, Cài đặt nhiệt độ', N'Dung tích 15L
Bình nóng lạnh 15L Kangaroo KG516N có dung tích 15L, phù hợp với hộ gia đình ít người ', N'-1eEOdS.jpg', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (10, 1, 2, N'Bình nóng lạnh 30L Kangaroo KG69A3', 2960000.0000, N'KG69A3', 121, 6, N'Việt Nam', 0, N'Bình nóng lạnh gián tiếp 30L Chống giật kép, Chống đun khô 
Công nghệ Nano kháng khuẩn, Hệ thống an toàn đồng bộ CSS 
Lớp cách nhiệt pu mật độ cao', N'Dung tích 30L
Bình nóng lạnh 30L Kangaroo KG69A3 có dung tích 30L, phù hợp với hộ gia đình 3-4 người Chống rò điện 
Bình nóng lạnh Kangaroo có Hệ thống an toàn đồng bộ CSS , lớp cách nhiệt pu mật độ cao, Chống giật kép, Chống đun khô.', N'binh-nong-lanh-30l-kangaroo-kg69a3-T2vzZH.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (12, 2, 3, N'Điều hòa Samsung 1 chiều Inverter 12000BTU AR13TYHYCWKNSV', 13200000.0000, N'AR13TYHYCWKNSV', 222, 12, N'Thái Lan', 0, N'Công suất: 12000BTU, Công nghệ Inverter

Chế độ Làm Lạnh Tức Thì Fast Cooling

Bộ lọc Tri-Care Filter lọc sạch hiệu quả bụi siêu mịn

Chế độ Ngủ Ngon duy trì nhiệt độ lý tưởng', N'Vận hành êm ái và Siêu tiết kiệm điện đến 73%*
Động cơ Digital Inverter Boost
Công nghệ Digital Inverter Boost ưu việt giúp tiết kiệm điện năng hiệu quả lên đến 77%* và duy trì ổn định nhiệt độ mong muốn. Với nam châm neodymium và bộ giảm âm kép Twin Tube Muffler, máy hoạt động yên tĩnh, êm ái và bền lâu. Kiểm định trên model AR09TXCAAWKNEU so với model Samsung AQ09TSLXEA thông thường.

Lan Tỏa Nhanh Hơn, Xa Hơn
Chế độ Làm Lạnh Tức Thì Fast Cooling
Nhanh chóng phân tán không khí mát lạnh đến mọi ngóc ngách trong phòng. Công nghệ Digital Inverter Boost đẩy nhanh tốc độ làm lạnh không khí đến 43%. Thiết kế cải tiến với quạt gió lớn hơn 15%, cửa hút khí rộng hơn 18% và cửa thổi khí rộng hơn 31%, giúp không khí lạnh được phân tán xa và rộng hơn lên đến 15m**', N'dieu-hoa-samsung-1-chieu-inverter-12000btu-ar13tyhycwknsv-T2nNcL.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (13, 2, 3, N'Điều hòa Samsung Wind-Free 1 chiều Inverter 12000BTU AR13TYGCDWKNSV', 13390000.0000, N'AR13TYGCDWKNSV', 321, 12, N'Thái Lan', 0, N'Công suất: 12000BTU, Công nghệ Inverter

Chế độ Wind-Free Cooling làm lạnh không gió buốt

Tiện nghi với công nghệ làm lạnh thông minh AI

Ống giảm thanh Twin Tube Muffler hạn chế tối đa tiếng ồn', N'Lạnh Nhanh Không Gió Buốt Thổi Trực Tiếp
Công Nghệ WindFree™ Đầu Tiên Trên Thế Giới
Hơn hẳn điều hòa thông thường, ngoài hiệu quả làm lạnh nhanh chóng, điều hòa Samsung WindFree™ còn có thêm lựa chọn chế độ làm lạnh WindFree™ không gió buốt thổi trực tiếp. Chỉ với 1 thao tác trên remote đơn giản, phòng sẽ nhanh chóng đạt nhiệt độ mát lạnh tối ưu hoặc thổi khí lạnh nhẹ nhàng qua 23.000 lỗ nhỏ, hạn chế gió thổi trực tiếp mà vẫn duy trì nhiệt độ mong muốn của người dùng. *ASHRAE (Hội kỹ sư nghiên cứu về Tủ lạnh, Máy Sưởi và Điều Hòa Không Khí tại Mỹ) định nghĩa “Luồng không khí dễ chịu" là không khí đạt tốc độ dưới 0,15m/s và không có sự hiện diện của gió buốt. **Kiểm định trên model AR12TXCAAWKNEU. Chế độ WindFree ™ tạo ra tiếng ồn 23dB so với 26dB của model Samsung thông thường. ***Kiểm định trên model AR07T9170HA3 dựa trên mức tiêu thụ năng lượng của chế độ Làm Lạnh Nhanh so với chế độ WindFree™.

Lọc 99% Virus, Vi Khuẩn, Bụi Siêu Mịn Và Tác Nhân Gây Dị Ứng
Bộ Lọc Tri-Care
Được chứng nhận bởi tổ chức quốc tế ITEA và Intertek, bộ lọc Tri-Care trên điều hòa Samsung có khả năng lọc 99% virus, vi khuẩn, bụi siêu mịn và tác nhân gây dị ứng, giữ không khí luôn trong lành hoàn hảo.', N'dieu-hoa-samsung-windfree-1-chieu-inverter-12000btu-ar13tygcdwknsv-8CN26y.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (14, 2, 3, N'Điều hòa Samsung Wind-Free 1 chiều Inverter 9400BTU AR10TYGCDWKNSV', 11690000.0000, N'AR10TYGCDWKNSV', 213, 12, N'Thái Lan', 0, N'- Luồng khí lạnh lý tưởng, tiết kiệm điện với công nghệ WindFree với 23.000 lỗ siêu nhỏ giúp tỏa khí lạnh nhanh mà không lo gió buốt.
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
Được chứng nhận bởi tổ chức quốc tế ITEA và Intertek, bộ lọc Tri-Care trên điều hòa Samsung có khả năng lọc 99% virus, vi khuẩn, bụi siêu mịn và tác nhân gây dị ứng, giữ không khí luôn trong lành hoàn hảo.', N'dieu-hoa-samsung-windfree-1-chieu-inverter-9400btu-ar10tygcdwknsv-FbD86A.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (15, 2, 3, N'Điều hòa Samsung Digital Inverter AR10RYFTAWKNSV 1 chiều 9.400BTU', 4990000.0000, N'AR10RYFTAWKNSV', 42, 12, N'Thái Lan', 0, N'Công nghệ Digital Inverter 8 cực tối ưu điện năng
Bộ lọc 3 Care Filter lọc sạch 99% bụi bẩn và vi khuẩn
Hiệu suất vượt trội với công nghệ Bảo Vệ Bộ Ba Tăng Cường', N'Kiểu dáng hiện đại sang trọng
Điều hòa SAMSUNG Inverter 9.400BTU AR10RYFTAWKNSV mang thiết kế màu trắng thanh lịch nổi bật sẽ mang lại vẻ đẹp hài hòa, bắt mắt cho không gian nội thất của gia đình Công nghệ Digital Inverter vận hành êm ái, bền bỉ
Không chỉ tiết kiệm điện, công nghệ Inverter của điều hòa còn có khả năng mang đến sự hoạt động êm ái, bền bỉ, nhiệt độ vô cùng ổn định. Bạn sẽ không còn cảm thấy khó chịu bởi tiếng ồn phát ra trong lúc máy vận hành nữa.', N'-77QCAC.jpg', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (16, 2, 3, N'Điều hòa Samsung 1 chiều Inverter 9.700BTU AR10NVFSCURXSV', 4990000.0000, N'AR10NVFSCURXSV', 54, 12, N'Thái Lan', 0, N'Máy nén Digital Inverter 8 cực tiết kiệm điện tối ưu
Bộ lọc Filter/3 Care-Filter lọc bụi, virus và chất gây dị ứng
Thiết kế tam diện lan tỏa hơi mát ra xa 14m', N'Đặc điểm Điều hòa Samsung 1 chiều Inverter 9.700BTU AR10NVFSCURXSV
Tiết Kiệm Điện - Lên Đến 68%
Công Nghệ Máy Nén Digital Inverter 8 Cực
Công nghệ Digital Inverter 8 cực sử dụng năng lượng ít hơn 68% so với các dòng máy lạnh thông thường*. Máy điều hòa duy trì nhiệt độ lý tưởng mong muốn, hoạt động hiệu quả và bền bỉ hơn mà không cần thường xuyên tắt và mở, mang đến không gian yên tĩnh. Mát Lạnh Tức Thì
Làm Mát Nhanh Chóng
Làm mát nhanh chóng khắp mọi ngóc ngách của căn phòng giúp bạn luôn luôn cảm thấy thoải mái. Công Nghệ Digital Inverter 8 cực làm mát không khí hơn 43%* và thiết kế tam diện lan tỏa không khí mát lạnh xa hơn và rộng hơn**', N'dieu-hoa-samsung-1-chieu-inverter-9700btu-ar10nvfscurxsv-6N779O.jpg', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (18, 2, 4, N'Điều hòa LG 1 chiều Inverter 9.200BTU V10ENW1', 9450000.0000, N'V10ENW1', 96, 12, N'Thái Lan', 0, N'Công suất 1 HP thích hợp sử dụng cho phòng có diện tích dưới 15m2

Công nghệ Inverter giúp máy vận hành êm, giảm ồn, tiết kiệm điện

Chế độ làm lạnh Powerful giúp căn phòng mát lạnh ngay tức thì

Chế độ thổi hướng gió dễ chịu tránh gió lạnh lùa trực tiếp vào cơ thể

Lớp phủ chống ăn mòn Gold Fin giúp tăng độ bền cho dàn tản nhiệt', N'Thiết kế đơn giản, dễ dàng kết hợp với mọi không gian nội thất
Máy lạnh LG Inverter 1.0 HP V10ENW1 có thiết kế bên ngoài đơn giản, đi cùng sắc trắng trung tính, thanh lịch sẽ dễ dàng kết hợp với mọi không gian nội thất nhà bạn. Nếu bạn có nhu cầu lắp máy lạnh cho phòng dưới 15 m2 thì máy lạnh LG 1.0 HP chính là một sự lựa chọn lý tưởng. Công nghệ Dual Cool Inverter tiết kiệm điện lên đến 70%
Ứng dụng công nghệ Dual Cool Inverter, chiếc máy lạnh LG này không chỉ mang đến khả năng tiết kiệm điện năng lên đến 70% mà nó còn vận hành êm ái và bền bỉ, đem lại sự ổn định cho nhiệt độ trong phòng.', N'dieu-hoa-lg-1-chieu-inverter-9200btu-v10enw1-V96Zd2.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (19, 2, 4, N'Điều hòa LG sang trọng 1 chiều Inverter 9.200BTU V10API1', 12200000.0000, N'V10API1', 63, 12, N'Thái Lan', 0, N'Công suất làm lạnh 1 HP, dành cho phòng có diện tích dưới 15 mét vuông.

Công nghệ Inverter nâng cao hiệu quả tiết kiệm điện.

Làm lạnh nhanh chóng chỉ trong 3 phút với công nghệ Jet Cool.

Phát hiện và xử lý nhanh chóng khi máy lạnh bị lỗi với tính năng chuẩn đoán lỗi.', N'Thiết kế tối giản, phù hợp với mọi không gian
Toàn bộ máy lạnh được bao phủ bởi gam màu trắng sạch sẽ, dễ dàng phối hợp với mọi phong cách thiết kế nội thất từ cổ điển cho đến hiện đại. Máy lạnh kích thước khá gọn gàng giúp tăng thẩm mỹ cho bức tường phòng bạn.
Trên dàn lạnh cũng được trang bị một màn hình hiển thị nhiệt độ giúp bạn dễ dàng quan sát, không cần phải tìm remote mỗi khi muốn xem nhiệt độ nữa.




Dành cho những phòng có diện tích 15 mét vuông với công suất 1 HP
Máy lạnh LG Inverter 1 HP V10API1 
có công suất 1 HP ~ 9.200 BTU sẽ thích hợp sử dụng các phòng ngủ, phòng khách nhỏ ở căn hộ chung cư hay phòng trọ sinh viên có diện tích từ dưới 15 m2.', N'dieu-hoa-lg-sang-trong-1-chieu-inverter-9200btu-v10api1-qJLPJm.png', 1)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_Supplier], [Name], [Price], [Model], [Amount], [Guarantee], [Origin], [Discount], [ShortDescription], [Detail], [Image], [Status]) VALUES (20, 2, 4, N'Điều hòa LG UV Nano 1 chiều Inverter 9.200BTU V10APFUV', 15700000.0000, N'V10APFUV', 47, 12, N'Thái Lan', 0, N'Công nghệ UV Nano loại bỏ vi khuẩn tới 99,99%

Loại bỏ bụi siêu mịn PM 0.1

Công suất 1 HP thích hợp sử dụng cho phòng có diện tích dưới 15m2', N'Mang đến luồng không khí sạch hơn nhờ công nghệ UVnano diệt sạch vi khuẩn
Công nghệ UVnano sử dụng các tia UV chiếu lên quạt điều hòa. Là tia có năng lượng cao, ánh sáng UV dễ dàng loại bỏ các vi khuẩn như Staphylococcus aureus, Staphylococcus epidermidis, và Klebsiella pneumoniae với hiệu suất 99.99% sau khi tiếp xúc với tia UV trong 4 giờ.
Với khả năng loại bỏ nhiều vi khuẩn thường ngày, công nghệ này mang đến bầu không khí sạch, trong lành, bảo vệ gia đình bạn khỏi các bệnh về đường hô hấp.




Bảo vệ sức khỏe, duy trì độ ẩm cho da với tính năng tạo ion lọc không khí
Nhờ chức năng tạo ion lọc không khí, máy lạnh có thể giải phóng ra các ion âm để vô hiệu hóa sự hoạt động của vi khuẩn và những tác nhân gây dị ứng, nhờ đó bảo vệ sức khỏe cho người dùng tốt hơn.
Ngoài ra, các ion này còn có khả năng tái tạo phân tử nước, cung cấp thêm độ ẩm trong không khí, tránh được tình trạng da khô khi bạn ở trong phòng máy lạnh, nhất là trẻ nhỏ và những người nhạy cảm.
 
 
Điều khiển thông minh trên điện thoại nhờ tích hợp bộ phát wifi
Chiếc máy lạnh LG Inverter này còn được tích hợp bộ phát wifi, điều này cho phép bạn kết hợp với điện thoại thông minh dễ dàng, giúp điều khiển các chức năng máy lạnh được tiện lợi hơn mà không cần phải dùng remote.', N'-6ZjeIx.png', 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
