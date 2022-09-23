CREATE DATABASE QLBH;
 
USE `QLBH`;
 
/* SQLINES DEMO *** le Categories    Script Date: 20/05/2022 5:42:17 CH ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `Users`(
	`Id` nvarchar(50) NOT NULL primary key,
	`Password` nvarchar(50) NOT NULL,
	`Fullname` nvarchar(50) NOT NULL,
	`Telephone` int NOT NULL,
	`Email` nvarchar(50) NOT NULL,
	`Photo` nvarchar(50) NOT NULL,
	`Activated` Tinyint NOT NULL,
	`Admin` Tinyint NOT NULL
);
/*Adminccount : Admin = 1 ; UserAccount : Admin=2 */
CREATE TABLE `Categories`(
	`Id` int AUTO_INCREMENT NOT NULL primary key,
	`Name` nvarchar(50) NOT NULL,
	`NameVN` Longtext NOT NULL
);
/* SQLINES DEMO *** le OrderDetails    Script Date: 20/05/2022 5:42:17 CH ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `Products`(
	`Id` int AUTO_INCREMENT NOT NULL primary key,
	`Name` nvarchar(60),
	`UnitPrice` Double,
	`Image` nvarchar(50),
	`ProductDate` date,
	`Available` Tinyint,
	`CategoryId` int,
	`Quantity` int,
	`Description` Longtext,
	`Discount` Double,
	`ViewCount` int,
	`Special` Tinyint,
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);
/* SQLINES DEMO *** le Users    Script Date: 20/05/2022 5:42:17 CH ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY

CREATE TABLE `Orders`(
	`Id` int AUTO_INCREMENT NOT NULL primary key,
	`UserId` nvarchar(20) NOT NULL,
	`OrderDate` datetime(3) NOT NULL,
	`Telephone` int NOT NULL,
	`Address` nvarchar(60) NOT NULL,
	`Amount` Double NOT NULL,
	`Description` nvarchar(1000) NULL,
	`Status` int NULL,
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);
/* SQLINES DEMO *** le Products    Script Date: 20/05/2022 5:42:17 CH ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `OrderDetails`(
	`Id` int AUTO_INCREMENT NOT NULL primary key,
	`OrderId` int NOT NULL,
	`ProductId` int NOT NULL,
	`UnitPrice` Double NOT NULL,
	`Quantity` int NOT NULL,
	`Discount` Double NOT NULL,
     FOREIGN KEY (OrderId) REFERENCES Orders(Id),
     FOREIGN KEY (ProductId) REFERENCES Products(Id)
);
/* SQLINES DEMO *** le Orders    Script Date: 20/05/2022 5:42:17 CH ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY


INSERT Categories (Id, Name, NameVN) VALUES (1, N' XE MÁY VÀ XE Ô TÔ ', N'HONDA');
INSERT Categories (Id, Name, NameVN) VALUES (2, N' XE MÁY', N'YAMAHA');
INSERT Categories (Id, Name, NameVN) VALUES (3, N'XE Ô TÔ VÀ XE TẢI', N'FORD');
INSERT Categories (Id, Name, NameVN) VALUES (4, N'XE Ô TÔ', N'MERCEDES');
INSERT Categories (Id, Name, NameVN) VALUES (5, N'XE MÁY VÀ XE Ô TÔ', N'VINFAST');
INSERT Categories (Id, Name, NameVN) VALUES (6, N'XE MÁY VÀ XE Ô TÔ', N'VOLKSWAGEN');
INSERT Categories (Id, Name, NameVN) VALUES (7, N'XE MÁY VÀ XE Ô TÔ', N'BMW - Bayerische Motoren Werke AG');
INSERT Categories (Id, Name, NameVN) VALUES (8, N'XE Ô TÔ', N'AUDI');
INSERT Categories (Id, Name, NameVN) VALUES (9, N'XE MÁY', N'KAWASAKI');
INSERT Categories (Id, Name, NameVN) VALUES (10, N'XE Ô TÔ, XE TẢI VÀ XE BUÝT', N'THACO');
INSERT Categories (Id, Name, NameVN) VALUES (12, N'PHỤ KIỆN', N'YAMAHA PHỤ KIỆN');
INSERT Categories (Id, Name, NameVN) VALUES (13, N'PHỤ KIỆN', N'PHỤ KIỆN');


#INSERT OrderDetails (Id, OrderId, ProductId, UnitPrice, Quantity, Discount) VALUES (1, 1, 2, 21700000, 1, 0);
#INSERT OrderDetails (Id, OrderId, ProductId, UnitPrice, Quantity, Discount) VALUES (2, 2, 5, 881695000, 1, 0.1);
#INSERT OrderDetails (Id, OrderId, ProductId, UnitPrice, Quantity, Discount) VALUES (3, 3, 7, 1790000000, 1, 0.05);
#INSERT OrderDetails (Id, OrderId, ProductId, UnitPrice, Quantity, Discount) VALUES (4, 4, 4, 17859273, 1, 0);


#INSERT Orders (Id, UserId, OrderDate, Telephone, Address, Amount, Description, Status) VALUES (1, N'admin', CAST(N'2022-05-14T00:00:00.000' AS DateTime), 964772094, N'Tân Bình', 21700000, N'<p>Trước khi giao gọi điện thoại</p>', 3);
#INSERT Orders (Id, UserId, OrderDate, Telephone, Address, Amount, Description, Status) VALUES (2, N'admin', CAST(N'2022-05-20T00:00:00.000' AS DateTime), 964772094, N'Tân Bình', 793525500, N'Hello World', 1);
#INSERT Orders (Id, UserId, OrderDate, Telephone, Address, Amount, Description, Status) VALUES (3, N'Longdz', CAST(N'2022-05-20T00:00:00.000' AS DateTime), 332467724, N'Go Vap', 1700500000, N'mua xe Audi', 1);
#INSERT Orders (Id, UserId, OrderDate, Telephone, Address, Amount, Description, Status) VALUES (4, N'huynhhuong', CAST(N'2022-03-11T00:00:00.000' AS DateTime), 1234567890, N'Phu Nhuan', 17859273, N'', 1);


INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (1, N'Air Blade 125/150', 41324727, N'1.png', CAST(N'2022-10-04' AS Date), 1, 1, 20, N'<h1><strong><span style="color:#c0392b">THIẾT KẾ</span></strong></h1>

<h2><strong>Kiểu d&aacute;ng thể thao cao cấp</strong></h2>

<p>Tiếp tục l&agrave; hiện th&acirc;n của sự đột ph&aacute;, hiện đại với diện mạo được trau chuốt tỉ mỉ đến từng chi tiết, Air Blade mang h&igrave;nh ảnh đặc trưng được thể hiện qua thiết kế tổng thể gợi li&ecirc;n tưởng đến &ldquo;chữ X&rdquo;, phản chiếu sự cứng c&aacute;p trong bề mặt hiện đại xen lẫn l&agrave; những đường n&eacute;t được xử l&yacute; gọn g&agrave;ng, dứt kho&aacute;t. Đặc biệt, Air Blade 150cc kh&aacute;c biệt hơn với tấm chắn gi&oacute; ph&iacute;a trước, y&ecirc;n xe hai t&ocirc;ng m&agrave;u v&agrave; tiết diện lốp xe lớn.</p>

<p><img alt="" src="https://cdn.honda.com.vn/motorbike-strong-points/December2020/uYYo3IGKUEGOZNhvmkxw.jpg" style="height:490px; width:650px" /></p>

<h2><strong>Tem xe c&ugrave;ng phối m&agrave;u mới mới ấn tượng</strong></h2>

<h2>Tem xe được thiết kế mới với những đường n&eacute;t mạnh mẽ, thể thao, c&ugrave;ng phối m&agrave;u mới ấn tượng nhưng kh&ocirc;ng k&eacute;m phần sang trọng, mang đến diện mạo mới thể thao v&agrave; cuốn h&uacute;t hơn.</h2>

<p><img alt="" src="https://cdn.honda.com.vn/motorbike-strong-points/December2020/Wn5KQHqquM15ypg91FWs.png" style="height:490px; width:650px" /></p>

<h2><strong>Cụm đ&egrave;n LED trước</strong></h2>

<p>Air Blade sử dụng đ&egrave;n định vị LED cỡ lớn với thiết kế đ&egrave;n trước được m&ocirc; phỏng cấu tr&uacute;c đ&egrave;n từ những mẫu xe ph&acirc;n khối lớn, tạo cảm gi&aacute;c thể thao năng động. Nhờ việc cải thiện đặc điểm ph&acirc;n v&ugrave;ng &aacute;nh s&aacute;ng của đ&egrave;n chiếu s&aacute;ng ph&iacute;a trước, tầm nh&igrave;n xe được cải thiện hơn v&agrave;o ban đ&ecirc;m v&agrave; trong điều kiện thời tiết xấu.</p>

<p><img alt="" src="https://cdn.honda.com.vn/motorbike-strong-points/December2020/sMYAyrNZ2r4cike1lv5t.png" style="height:490px; width:650px" /></p>

<h2><strong>Mặt đồng hồ LCD</strong></h2>

<p>Mặt đồng hồ LCD kỹ thuật số ho&agrave;n to&agrave;n mang lại một thiết kế hiện đại, gọn g&agrave;ng hơn v&agrave; tăng kh&ocirc;ng gian cho th&ocirc;ng tin hiển thị. Ngo&agrave;i hai th&ocirc;ng tin về h&agrave;nh tr&igrave;nh, đồng hồ c&ograve;n hiển thị th&ocirc;ng tin ti&ecirc;u thụ nhi&ecirc;n liệu tức thời/trung b&igrave;nh, gi&uacute;p người d&ugrave;ng theo d&otilde;i được sự kh&aacute;c biệt trong những t&igrave;nh huống l&aacute;i xe kh&aacute;c nhau.</p>

<h1><span style="color:#c0392b"><strong>Th&ocirc;ng số kĩ thuật</strong></span></h1>

<p><strong>Khối lượng bản th&acirc;n</strong></p>

<p>Air Blade 125cc: 111kg<br />
Air Blade 150cc: 113kg</p>

<p>D&agrave;i x Rộng x Cao</p>

<p>Air Blade 125cc: 1.870mm x 687mm x 1.091mm<br />
Air Blade 150cc: 1.870mm x 686mm x 1.112mm</p>

<p><strong>Khoảng c&aacute;ch trục b&aacute;nh xe</strong></p>

<p>1.286mm</p>

<p><strong>Độ cao y&ecirc;n</strong></p>

<p>Air Blade 125cc: 774mm<br />
Air Blade 150cc: 775mm</p>

<p><strong>Khoảng s&aacute;ng gầm xe</strong></p>

<p>125mm</p>

<p><strong>Dung t&iacute;ch b&igrave;nh xăng</strong></p>

<p>4,4 l&iacute;t</p>

<p><strong>Phuộc trước</strong></p>

<p>Ống lồng, giảm chấn thủy lực</p>

<p><strong>Phuộc sau</strong></p>

<p>L&ograve; xo trụ, giảm chấn thủy lực</p>

<p><strong>Loại động cơ</strong></p>

<p>Xăng, 4 kỳ, 1 xy lanh, l&agrave;m m&aacute;t bằng dung dịch</p>

<p><strong>C&ocirc;ng suất tối đa</strong></p>

<p>Air Blade 125cc: 8,4kW/8.500 v&ograve;ng/ph&uacute;t<br />
Air Blade 150cc: 9,6kW/8.500 v&ograve;ng/ph&uacute;t</p>

<p><strong>Dung t&iacute;ch nhớt m&aacute;y</strong></p>

<p>0,8 l&iacute;t khi thay dầu<br />
0,9 l&iacute;t khi r&atilde; m&aacute;y</p>

<p><strong>Mức ti&ecirc;u thụ nhi&ecirc;n liệu</strong></p>

<p>Air Blade 125cc: 1,99 l&iacute;t/100km<br />
Air Blade 150cc: 2,17 l&iacute;t/100km</p>

<p><strong>Hộp số</strong></p>

<p>Tự động, truyền động bằng đai</p>

<p><strong>Hệ thống khởi động</strong></p>

<p>Điện</p>

<p><strong>Moment cực đại</strong></p>

<p>Air Blade 125cc: 11,68 N.m/5.000 v&ograve;ng/ph&uacute;t<br />
Air Blade 150cc: 13,3 N.m/5.000 v&ograve;ng/ph&uacute;t</p>

<p><strong>Dung t&iacute;ch xy-lanh</strong></p>

<p>Air Blade 125cc: 124,9cm3<br />
Air Blade 150cc: 149,3cm3</p>

<p><strong>Đường k&iacute;nh x H&agrave;nh tr&igrave;nh p&iacute;t t&ocirc;ng</strong></p>

<p>Air Blade 125cc: 52,4mm x 57,9mm<br />
Air Blade 150cc: 57,3mm x 57,9mm</p>

<p><strong>Tỷ số n&eacute;n</strong></p>

<p>Air Blade 125cc: 11,0:1<br />
Air Blade 150cc: 10,6:1</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 0, 1005, 0);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (2, N'SIRIUS PHIÊN BẢN RC VÀNH ĐÚC', 21700000, N'cover.png', CAST(N'2022-11-11' AS Date), 1, 2, 30, N'<h2><strong>Động cơ</strong></h2>

<table>
	<tbody>
		<tr>
			<td>Loại</td>
			<td>4 th&igrave;, 2 van SOHC, l&agrave;m m&aacute;t bằng kh&ocirc;ng kh&iacute;</td>
		</tr>
		<tr>
			<td>Bố tr&iacute; xi lanh</td>
			<td>Xi lanh đơn</td>
		</tr>
		<tr>
			<td>Dung t&iacute;ch xy lanh (CC)</td>
			<td>110.3</td>
		</tr>
		<tr>
			<td>Đường k&iacute;nh v&agrave; h&agrave;nh tr&igrave;nh piston</td>
			<td>51,0mm x 54,0mm</td>
		</tr>
		<tr>
			<td>Tỷ số n&eacute;n</td>
			<td>9,3:1</td>
		</tr>
		<tr>
			<td>C&ocirc;ng suất tối đa</td>
			<td>6,60KW (9.0PS/8.000 v&ograve;ng/ph&uacute;t)</td>
		</tr>
		<tr>
			<td>M&ocirc; men cực đại</td>
			<td>9,0Nm (0.92kgf-m/5.000 v&ograve;ng/ph&uacute;t)</td>
		</tr>
		<tr>
			<td>Hệ thống khởi động</td>
			<td>Điện / Cần khởi động</td>
		</tr>
		<tr>
			<td>Hệ thống b&ocirc;i trơn</td>
			<td>C&aacute;c te ướt</td>
		</tr>
		<tr>
			<td>Dung t&iacute;ch dầu m&aacute;y</td>
			<td>1 L</td>
		</tr>
		<tr>
			<td>Dung t&iacute;ch b&igrave;nh xăng</td>
			<td>4,2 l&iacute;t</td>
		</tr>
		<tr>
			<td>Mức ti&ecirc;u thụ nhi&ecirc;n liệu (l/100km)</td>
			<td>1,99</td>
		</tr>
		<tr>
			<td>Bộ chế h&ograve;a kh&iacute;</td>
			<td>VM21x1</td>
		</tr>
		<tr>
			<td>Hệ thống đ&aacute;nh lửa</td>
			<td>DC-CDI</td>
		</tr>
		<tr>
			<td>Tỷ số truyền sơ cấp v&agrave; thứ cấp</td>
			<td>3,722 (67/18) / 2,333 (35/15)</td>
		</tr>
		<tr>
			<td>Hệ thống ly hợp</td>
			<td>Đa đĩa, Ly t&acirc;m loại ướt</td>
		</tr>
		<tr>
			<td>Tỷ số truyền động</td>
			<td>1: 3,167 2: 1,941 3: 1,381 4: 1,095</td>
		</tr>
		<tr>
			<td>Kiểu hệ thống truyền lực</td>
			<td>4 số tr&ograve;n</td>
		</tr>
	</tbody>
</table>

<h2><strong>Khung xe</strong></h2>

<table>
	<tbody>
		<tr>
			<td>Hệ thống giảm x&oacute;c trước</td>
			<td>Kiểu ống lồng</td>
		</tr>
		<tr>
			<td>H&agrave;nh tr&igrave;nh phuộc trước</td>
			<td>95 mm</td>
		</tr>
		<tr>
			<td>Độ lệch phương trục l&aacute;i</td>
			<td>26,2&deg; / 73 mm</td>
		</tr>
		<tr>
			<td>Hệ thống giảm x&oacute;c sau</td>
			<td>Giảm chấn thủy lực l&ograve; xo trụ</td>
		</tr>
		<tr>
			<td>H&agrave;nh tr&igrave;nh giảm x&oacute;c sau</td>
			<td>77 mm</td>
		</tr>
		<tr>
			<td>Phanh trước</td>
			<td>Đĩa thuỷ lực</td>
		</tr>
		<tr>
			<td>Phanh sau</td>
			<td>Phanh cơ (đ&ugrave;m)</td>
		</tr>
		<tr>
			<td>Lốp trước</td>
			<td>70/90 - 17 38P (Lốp c&oacute; săm)</td>
		</tr>
		<tr>
			<td>Lốp sau</td>
			<td>80/90 - 17 44P (Lốp c&oacute; săm)</td>
		</tr>
		<tr>
			<td>Đ&egrave;n trước</td>
			<td>Halogen 12V, 35W/35Wx1</td>
		</tr>
		<tr>
			<td>Đ&egrave;n sau</td>
			<td>12V, 5W/18W x 1</td>
		</tr>
	</tbody>
</table>

<h2><strong>K&iacute;ch thước</strong></h2>

<table>
	<tbody>
		<tr>
			<td>K&iacute;ch thước (d&agrave;i x rộng x cao)</td>
			<td>1.890mm x 665mm x 1.035mm</td>
		</tr>
		<tr>
			<td>Độ cao y&ecirc;n xe</td>
			<td>770mm</td>
		</tr>
		<tr>
			<td>Khoảng c&aacute;ch giữa 2 trục b&aacute;nh xe</td>
			<td>1.200mm</td>
		</tr>
		<tr>
			<td>Độ cao gầm xe</td>
			<td>130mm</td>
		</tr>
		<tr>
			<td>Trọng lượng ướt</td>
			<td>96kg</td>
		</tr>
	</tbody>
</table>

<h2><strong>Bảo h&agrave;nh</strong></h2>

<table>
	<tbody>
		<tr>
			<td>Thời gian bảo h&agrave;nh</td>
			<td>3 năm hoặc 30.000km (t&ugrave;y điều kiện n&agrave;o đến trước)</td>
		</tr>
	</tbody>
</table>
', 0, 5, 1);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (3, N'Honda City 2022', 529000000, N'hondacity.png', CAST(N'2022-01-05' AS Date), 1, 1, 15, N'<p>Thế hệ thứ 5 của&nbsp;<a href="https://oto.com.vn/bang-gia-xe-o-to-honda-city-moi-nhat" title="Honda City">Honda City</a>&nbsp;ch&iacute;nh thức tr&igrave;nh l&agrave;ng g&agrave;y 09/12/2020 với th&ocirc;ng điệp&nbsp;<em>&quot;Mạnh mẽ trải lối th&agrave;nh c&ocirc;ng&rdquo;</em>. C&ugrave;ng với đ&oacute;, Honda City All New mang những gi&aacute; trị nổi bật&nbsp;<em>&ldquo;Thể thao c&aacute; t&iacute;nh &ndash; Tiện nghi hiện đại &ndash; Vận h&agrave;nh mạnh mẽ - An t&acirc;m cầm l&aacute;i&rdquo;</em>.&nbsp; Xe&nbsp;tiếp tục được lắp r&aacute;p v&agrave; ph&acirc;n phối ch&iacute;nh h&atilde;ng tại Việt Nam với 3 phi&ecirc;n bản gồm RS, L, G.</p>

<h2><strong>Th&ocirc;ng tin tổng quan</strong>&nbsp;<strong>Honda City&nbsp;2022</strong></h2>

<p>Ở thế hệ mới, Honda City đ&atilde; khắc phục được c&aacute;c vấn đề về t&iacute;nh thẩm mỹ, trở n&ecirc;n thể thao v&agrave; trẻ trung hơn hẳn. Thiết kế xe ph&aacute;t triển theo&nbsp;triết l&iacute; &quot;đ&ocirc;i c&aacute;nh&quot; với k&iacute;ch thước&nbsp; d&agrave;i x rộng x cao lần lượt&nbsp;l&agrave;&nbsp;4.553 x 1.748 x 1.467 (mm), chiều d&agrave;i cơ sở l&ecirc;n tới 2.600mm.</p>

<h3><strong>Ngoại thất xe&nbsp;Honda City</strong></h3>

<p><img alt="Ngoại thất Honda City 2021 - Ảnh 1." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-2-7611.jpg" title="Ngoại thất Honda City 2021 - Ảnh 1" /></p>

<p>Đầu xe nổi bật với lưới tản nhiệt c&aacute;nh chim sơn đen b&oacute;ng nối liền c&ugrave;ng hệ thống chiếu s&aacute;ng full LED hiện đại. Hốc h&uacute;t gi&oacute; gắn th&ecirc;m đ&egrave;n sương m&ugrave; c&ugrave;ng những đường g&acirc;n trang tr&iacute; đẹp&nbsp; mắt. Cản trước cứng c&aacute;p, thể thao hơn.</p>

<p>Chạy dọc th&acirc;n xe l&agrave; những đường g&acirc;n dập nổi sắc n&eacute;t, gương chiếu hậu hạ thấp xuống cửa, c&oacute; chức năng chỉnh gập điện t&iacute;ch hợp đ&egrave;n b&aacute;o rẽ LED. Tay nắm cửa trước mở bằng v&acirc;n tay, la-zăng 16 inch tạo h&igrave;nh 5 c&aacute;nh thanh tho&aacute;t.</p>

<p>Tiến về đu&ocirc;i xe, cụm đ&egrave;n chiếu s&aacute;ng LED được tinh chỉnh sắc n&eacute;t, tạo n&ecirc;n tổng thể thẩm mỹ cho xe.</p>

<table align="center" border="0" cellpadding="1" cellspacing="1">
	<tbody>
		<tr>
			<td><img alt="Ngoại thất Honda City 2021 - Ảnh 2." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-14-26ef.jpg" title="Ngoại thất Honda City 2021 - Ảnh 2" /></td>
			<td><img alt="Ngoại thất Honda City 2021 - Ảnh 3." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-15-7f57.jpg" title="Ngoại thất Honda City 2021 - Ảnh 3" /></td>
			<td><img alt="Ngoại thất Honda City 2021 - Ảnh 4." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-19-e69f.jpg" title="Ngoại thất Honda City 2021 - Ảnh 4" /></td>
		</tr>
		<tr>
			<td><img alt="Ngoại thất Honda City 2021 - Ảnh 5." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-21-5c1f.jpg" title="Ngoại thất Honda City 2021 - Ảnh 5" /></td>
			<td><img alt="Ngoại thất Honda City 2021 - Ảnh 6." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-22-ac16.jpg" title="Ngoại thất Honda City 2021 - Ảnh 6" /></td>
			<td><img alt="Ngoại thất Honda City 2021 - Ảnh 7." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-17-1ead.jpg" title="Ngoại thất Honda City 2021 - Ảnh 7" /></td>
		</tr>
	</tbody>
</table>

<h3><strong>Nội thất xe Honda City</strong></h3>

<p><img alt="Nội thất Honda City 2021 - Ảnh 1." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-4-1312.jpg" title="Nội thất Honda City 2021 - Ảnh 1" /></p>

<p>Về nội thất, Honda City thế hệ mới rộng r&atilde;i hơn v&agrave; bổ sung th&ecirc;m nhiều c&ocirc;ng nghệ cũng như trang bị hơn. Vẫn l&agrave;&nbsp;ghế xe bọc&nbsp;nỉ quen thuộc nhưng xe đ&atilde; c&oacute; th&ecirc;m g&aacute;c tay trung t&acirc;m ở h&agrave;ng ghế trước, hộc chứa đồ 4 cửa xe, v&ocirc;-lăng với c&aacute;c t&iacute;nh năng đ&agrave;m thoại rảnh tay, lẫy số thể thao. Ri&ecirc;ng bản RS khoang nội thất được pha trộn giữa vật liệu nỉ - da lộn v&agrave; da, mang đến c&aacute;i nh&igrave;n sang trọng, đẳng cấp hơn cho một mẫu xe hạng B.</p>

<p>Giữa t&aacute;p-l&ocirc; l&agrave; m&agrave;n h&igrave;nh trung t&acirc;m dạng cảm ứng 8 inch kết nối đa phương tiện. Đi c&ugrave;ng với đ&oacute; l&agrave; loạt trang bị đ&aacute;ng ch&uacute; &yacute; như: điều h&ograve;a 2 chiều c&oacute; hốc gi&oacute; cho h&agrave;ng ghế sau, đầu CD, 4 loa, kết nối&nbsp;USB, AUX,&nbsp;AM/FM...</p>

<table align="center" border="0" cellpadding="1" cellspacing="1">
	<tbody>
		<tr>
			<td><img alt="Nội thất Honda City 2021 - Ảnh 2." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-6-1a71.jpg" title="Nội thất Honda City 2021 - Ảnh 2" /></td>
			<td><img alt="Nội thất Honda City 2021 - Ảnh 3." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-10-ed97.jpg" title="Nội thất Honda City 2021 - Ảnh 3" /></td>
			<td><img alt="Nội thất Honda City 2021 - Ảnh 4." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-11-5797.jpg" title="Nội thất Honda City 2021 - Ảnh 4" /></td>
		</tr>
		<tr>
			<td><img alt="Nội thất Honda City 2021 - Ảnh 5." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-7-f659.jpg" title="Nội thất Honda City 2021 - Ảnh 5" /></td>
			<td><img alt="Nội thất Honda City 2021 - Ảnh 6." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-5-ae7b.jpg" title="Nội thất Honda City 2021 - Ảnh 6" /></td>
			<td><img alt="Nội thất Honda City 2021 - Ảnh 7." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-12-a9a5.jpg" title="Nội thất Honda City 2021 - Ảnh 7" /></td>
		</tr>
	</tbody>
</table>

<h3><strong>Động cơ xe&nbsp;Honda City</strong></h3>

<p><img alt="Động cơ xe Honda City 2021 - Ảnh 1." src="https://img1.oto.com.vn/2020/12/11/pTBR3JY9/gia-xe-honda-city-2021-oto-com-vn-1-2721.jpg" title="Động cơ xe Honda City 2021 - Ảnh 1" /></p>

<p>Động cơ Honda City l&agrave; cỗ m&aacute;y&nbsp;1.5L&nbsp;4 xi-lanh thẳng h&agrave;ng, sản sinh&nbsp;c&ocirc;ng suất cực đại 119 m&atilde; lực tại v&ograve;ng tua m&aacute;y 6.600 v&ograve;ng/ph&uacute;t v&agrave; m&ocirc;-men xoắn lớn nhất&nbsp;145 Nm tại 4.300 v&ograve;ng/ph&uacute;t. Sức mạnh của xe truyền qua&nbsp;hộp số v&ocirc; cấp CVT.</p>

<p>Xe c&oacute; sẵn t&iacute;nh năng Eco gi&uacute;p tiết kiệm nhi&ecirc;n liệu v&agrave; c&aacute;c t&iacute;nh năng an to&agrave;n đ&aacute;ng ch&uacute; &yacute; như:&nbsp;chống b&oacute; cứng phanh, ph&acirc;n bổ lực phanh điện tử, chống trộm,&nbsp;t&uacute;i kh&iacute; v&agrave; tựa đầu giảm chấn cho&nbsp;ghế trước.</p>

<h3><strong>Trang bị an to&agrave;n&nbsp;Honda City</strong></h3>

<ul>
	<li>Hệ thống 6 t&uacute;i kh&iacute;</li>
	<li>Hệ thống chống b&oacute; cứng phanh</li>
	<li>Hệ thống ph&acirc;n phối lực phanh điện tử</li>
	<li>Hệ thống c&acirc;n bằng điện tử</li>
	<li>Hệ thống khởi h&agrave;nh ngang dốc</li>
	<li>Hệ thống phanh khẩn cấp</li>
	<li>Camera l&ugrave;i</li>
</ul>

<h2><strong>Ưu - nhược điểm xe Honda City 2022</strong></h2>

<h3><strong>Ưu điểm:</strong></h3>

<ul>
	<li>Thiết kế trẻ trung, hiện đại</li>
	<li>Đ&egrave;n chiếu s&aacute;ng LED</li>
	<li>Trang bị cao cấp: m&agrave;n h&igrave;nh cảm ứng 6,8 inch, đề nổ th&ocirc;ng minh, &acirc;m thanh 8 loa, kiểm so&aacute;t h&agrave;nh tr&igrave;nh, hỗ trợ khởi h&agrave;nh ngang dốc, c&acirc;n bằng điện tử, camera l&ugrave;i, 6 t&uacute;i kh&iacute;,...</li>
	<li>Động cơ mạnh mẽ, tiết kiệm nhi&ecirc;n liệu; hộp số v&ocirc; cấp (CVT) &ecirc;m &aacute;i</li>
</ul>

<h3><strong>Nhược điểm</strong>:</h3>

<ul>
	<li>B&aacute;n k&iacute;nh v&ograve;ng quay lớn khiến kh&oacute; xoay sở trong ng&otilde; hẹp</li>
	<li>Hệ thống treo cứng</li>
	<li>Hệ thống điều h&ograve;a l&agrave;m m&aacute;t chậm v&agrave; kh&ocirc;ng s&acirc;u</li>
</ul>

<h2><strong><a href="https://oto.com.vn/thong-so-ky-thuat/xe-honda-city-2021-moi-nhat-tai-viet-nam-articleid-na314fo" title="THÔNG SỐ KỸ THUẬT HONDA CITY">Th&ocirc;ng số kỹ thuật Honda City</a>&nbsp;2022 tại Việt Nam</strong></h2>

<table align="center" border="1" cellpadding="1" cellspacing="1">
	<tbody>
		<tr>
			<td colspan="2">Th&ocirc;ng số</td>
			<td>City G</td>
			<td>City L</td>
			<td>City RS</td>
		</tr>
		<tr>
			<td colspan="5">K&iacute;ch thước</td>
		</tr>
		<tr>
			<td colspan="2">Số chỗ ngồi</td>
			<td colspan="3" rowspan="1">05</td>
		</tr>
		<tr>
			<td colspan="2">D&agrave;i x Rộng x Cao (mm)</td>
			<td colspan="3" rowspan="1">4.553 x 1.748 x 1.467</td>
		</tr>
		<tr>
			<td colspan="2">Chiều d&agrave;i cơ sở (mm)</td>
			<td colspan="3" rowspan="1">2.600</td>
		</tr>
		<tr>
			<td colspan="2">Chiều rộng cơ sở trước/sau (mm)</td>
			<td colspan="3" rowspan="1">1.495/1.483</td>
		</tr>
		<tr>
			<td colspan="2">Khoảng s&aacute;ng gầm xe (mm)</td>
			<td colspan="3" rowspan="1">134</td>
		</tr>
		<tr>
			<td colspan="2">B&aacute;n k&iacute;nh v&ograve;ng quay tối thiểu (m)</td>
			<td colspan="3" rowspan="1">5</td>
		</tr>
		<tr>
			<td colspan="2">Trọng lượng kh&ocirc;ng tải (kg)</td>
			<td>1.117</td>
			<td>1.124</td>
			<td>1.134</td>
		</tr>
		<tr>
			<td colspan="2">Trọng lượng to&agrave;n tải (kg)</td>
			<td colspan="3" rowspan="1">1.580</td>
		</tr>
		<tr>
			<td colspan="2">Cỡ lốp</td>
			<td>185/60R15</td>
			<td colspan="2" rowspan="1">185/55R16</td>
		</tr>
		<tr>
			<td colspan="2">La-zăng</td>
			<td>Hợp kim 15 inch</td>
			<td colspan="2" rowspan="1">Hợp kim 16 inch</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống treo trước/sau</td>
			<td colspan="3" rowspan="1">Kiểu MacPherson/Giằng xoắn</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống phanh trước/sau</td>
			<td colspan="3" rowspan="1">Phanh đĩa/Phanh tang trống</td>
		</tr>
		<tr>
			<td colspan="5">Ngoại thất</td>
		</tr>
		<tr>
			<td colspan="1" rowspan="3">Cụm đ&egrave;n trước</td>
			<td>Đ&egrave;n chiếu xa</td>
			<td colspan="2" rowspan="1">Halogen</td>
			<td>LED</td>
		</tr>
		<tr>
			<td>Đ&egrave;n chiếu gần</td>
			<td colspan="2" rowspan="1">Halogen Projector</td>
			<td>LED</td>
		</tr>
		<tr>
			<td>Đ&egrave;n chạy ban ng&agrave;y</td>
			<td>LED</td>
			<td>LED</td>
			<td>LED</td>
		</tr>
		<tr>
			<td colspan="2">Đ&egrave;n sương m&ugrave;</td>
			<td colspan="2" rowspan="1">Kh&ocirc;ng</td>
			<td>LED</td>
		</tr>
		<tr>
			<td colspan="2">Đ&egrave;n hậu</td>
			<td colspan="3" rowspan="1">LED</td>
		</tr>
		<tr>
			<td colspan="2">Đ&egrave;n phanh tr&ecirc;n cao</td>
			<td colspan="3" rowspan="1">LED</td>
		</tr>
		<tr>
			<td colspan="2">Gương chiếu hậu</td>
			<td>Chỉnh điện</td>
			<td colspan="2" rowspan="1">Chỉnh điện, gập điện, t&iacute;ch hợp đ&egrave;n b&aacute;o rẽ</td>
		</tr>
		<tr>
			<td colspan="2">Tay nắm cửa</td>
			<td>C&ugrave;ng m&agrave;u th&acirc;n xe</td>
			<td>Mạ Chrome</td>
			<td>C&ugrave;ng m&agrave;u th&acirc;n xe</td>
		</tr>
		<tr>
			<td colspan="5">Nội thất</td>
		</tr>
		<tr>
			<td colspan="2">Cửa k&iacute;nh điện tự động l&ecirc;n xuống một chạm chống kẹt</td>
			<td colspan="3" rowspan="1">Ghế l&aacute;i</td>
		</tr>
		<tr>
			<td colspan="2">Ăng-ten</td>
			<td colspan="3" rowspan="1">Dạng v&acirc;y c&aacute; mập</td>
		</tr>
		<tr>
			<td colspan="2">Chất liệu ghế ngồi</td>
			<td>Da</td>
			<td>Da lộn</td>
			<td>Da, Da lộn, nỉ</td>
		</tr>
		<tr>
			<td colspan="2">Ghế l&aacute;i</td>
			<td colspan="3" rowspan="1">Chỉnh điện 6 hướng</td>
		</tr>
		<tr>
			<td colspan="2">V&ocirc;-lăng</td>
			<td>Urethane, điều chỉnh 4 hướng v&agrave; t&iacute;ch hợp n&uacute;t điều chỉnh &acirc;m thanh</td>
			<td>Bọc da,&nbsp;điều chỉnh 4 hướng, t&iacute;ch hợp n&uacute;t điều chỉnh &acirc;m thanh</td>
			<td>Bọc da,&nbsp;điều chỉnh 4 hướng v&agrave; t&iacute;ch hợp n&uacute;t điều chỉnh &acirc;m thanh&nbsp;v&agrave; c&oacute; lẫy chuyển số</td>
		</tr>
		<tr>
			<td colspan="2">M&agrave;n h&igrave;nh giải tr&iacute;</td>
			<td colspan="3" rowspan="1">Cảm ứng 8 inch</td>
		</tr>
		<tr>
			<td colspan="2">Bảng đồng hồ sau v&ocirc;-lăng</td>
			<td colspan="3" rowspan="1">Analog</td>
		</tr>
		<tr>
			<td colspan="2">Chế độ khởi động từ xa</td>
			<td colspan="2" rowspan="1">Kh&ocirc;ng</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Ch&igrave;a kh&oacute;a th&ocirc;ng minh</td>
			<td>Kh&ocirc;ng</td>
			<td colspan="2" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Khởi động bằng n&uacute;t bấm</td>
			<td colspan="3">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Chế độ đ&agrave;m thoại rảnh tay</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Kết nối điện thoại th&ocirc;ng minh/Bluetooth/USB</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Quay số nhanh bằng giọng n&oacute;i</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Đ&agrave;i AM/FM</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống loa</td>
			<td colspan="2" rowspan="1">04 loa</td>
			<td>08 loa</td>
		</tr>
		<tr>
			<td colspan="2">Nguồn sạc</td>
			<td colspan="2" rowspan="1">03</td>
			<td>05</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống điều h&ograve;a</td>
			<td>Chỉnh cơ</td>
			<td colspan="2" rowspan="1">Tự động một v&ugrave;ng</td>
		</tr>
		<tr>
			<td colspan="2">Cửa gi&oacute; điều h&ograve;a cho h&agrave;ng ghế sau</td>
			<td colspan="2" rowspan="1">Kh&ocirc;ng</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Tựa tay h&agrave;ng ghế sau t&iacute;ch hợp hộc đựng cốc</td>
			<td colspan="2">Kh&ocirc;ng</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Bệ trung t&acirc;m t&iacute;ch hợp khay đựng cốc v&agrave; ngăn chứa đồ</td>
			<td>Kh&ocirc;ng</td>
			<td colspan="2" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Ngăn đựng t&agrave;i liệu cho h&agrave;ng ghế sau</td>
			<td colspan="3">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Đ&egrave;n đọc bản đồ cho h&agrave;ng ghế trước v&agrave; h&agrave;ng ghế sau</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Đ&egrave;n cốp</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Gương trang điểm cho h&agrave;ng ghế trước</td>
			<td colspan="2" rowspan="1">Ghế l&aacute;i</td>
			<td>Ghế l&aacute;i + Ghế phụ</td>
		</tr>
		<tr>
			<td colspan="5">Động cơ</td>
		</tr>
		<tr>
			<td colspan="2">Kiểu động cơ</td>
			<td colspan="3" rowspan="1">1.5L DOHC i-VTEC 4 xy-lanh thẳng h&agrave;ng, 16 van</td>
		</tr>
		<tr>
			<td colspan="2">Dung t&iacute;ch xy-lanh (cc)</td>
			<td colspan="3" rowspan="1">1.498</td>
		</tr>
		<tr>
			<td colspan="2">C&ocirc;ng suất (Hp/rpm)</td>
			<td colspan="3" rowspan="1">119/6.600</td>
		</tr>
		<tr>
			<td colspan="2">M&ocirc;-men xoắn (Nm/rpm)</td>
			<td colspan="3" rowspan="1">145/4.300</td>
		</tr>
		<tr>
			<td colspan="2">Hộp số</td>
			<td colspan="3" rowspan="1">V&ocirc; cấp CVT</td>
		</tr>
		<tr>
			<td colspan="2">Dung t&iacute;ch th&ugrave;ng nhi&ecirc;n liệu (l&iacute;t)</td>
			<td colspan="3" rowspan="1">40</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống nhi&ecirc;n liệu</td>
			<td colspan="3" rowspan="1">Phun xăng điện tử/PGM-FI</td>
		</tr>
		<tr>
			<td colspan="2">Chế độ l&aacute;i tiết kiệm nhi&ecirc;n liệu (ECO Mode)</td>
			<td colspan="3">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Chức năng hướng dẫn l&aacute;i tiết kiệm nhi&ecirc;n liệu (ECO Coaching)</td>
			<td colspan="3">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Chế độ l&aacute;i thể thao</td>
			<td colspan="3">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống l&aacute;i</td>
			<td colspan="3">Trợ lực l&aacute;i điện</td>
		</tr>
		<tr>
			<td colspan="2">Van bướm ga điều chỉnh bằng điện tử</td>
			<td colspan="3">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="1" rowspan="3">Mức ti&ecirc;u thụ nhi&ecirc;n liệu (l&iacute;t/100km)</td>
			<td>Chu tr&igrave;nh tổ hợp</td>
			<td colspan="3" rowspan="1">5,68</td>
		</tr>
		<tr>
			<td>Đ&ocirc; thị cơ bản</td>
			<td colspan="3" rowspan="1">7,29</td>
		</tr>
		<tr>
			<td>Đ&ocirc; thị phụ</td>
			<td colspan="3" rowspan="1">4,73</td>
		</tr>
		<tr>
			<td colspan="5">An to&agrave;n - An ninh</td>
		</tr>
		<tr>
			<td colspan="2">T&uacute;i kh&iacute; cho ghế l&aacute;i v&agrave; ghế phụ</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">T&uacute;i kh&iacute; b&ecirc;n cho h&agrave;ng ghế trước</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">T&uacute;i kh&iacute; r&egrave;m cho tất cả h&agrave;ng ghế</td>
			<td>Kh&ocirc;ng</td>
			<td>Kh&ocirc;ng</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống c&acirc;n bằng điện tử VSA</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống chống b&oacute; cứng phanh ABS</td>
			<td colspan="3">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống ph&acirc;n bổ lực phanh điện tử EBD</td>
			<td colspan="3">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống hỗ trợ phanh khẩn cấp BA</td>
			<td colspan="3">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Hệ thống hỗ trợ khởi h&agrave;nh ngang dốc HSA</td>
			<td colspan="3">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Đ&egrave;n b&aacute;o phanh khẩn cấp ESS</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Ga tự động Cruise Control</td>
			<td>Kh&ocirc;ng</td>
			<td colspan="2">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Camera l&ugrave;i</td>
			<td>Kh&ocirc;ng</td>
			<td colspan="2" rowspan="1">3 g&oacute;c quay</td>
		</tr>
		<tr>
			<td colspan="2">Chức năng kh&oacute;a cửa tự động</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Nhắc nhở c&agrave;i d&acirc;y an to&agrave;n</td>
			<td colspan="3" rowspan="1">H&agrave;ng ghế trước</td>
		</tr>
		<tr>
			<td colspan="2">M&oacute;c ghế an to&agrave;n cho trẻ em ISOFIX</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Khung xe hấp thụ lực v&agrave; tương th&iacute;ch va chạm</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
		<tr>
			<td colspan="2">Ch&igrave;a kh&oacute;a được m&atilde; h&oacute;a chống trộm v&agrave; hệ thống b&aacute;o động</td>
			<td colspan="3" rowspan="1">C&oacute;</td>
		</tr>
	</tbody>
</table>

<h2><strong>Thủ tục mua xe Honda City 2022 trả g&oacute;p</strong></h2>

<p>C&aacute;c ng&acirc;n h&agrave;ng hiện nay đang tung ra nhiều ch&iacute;nh s&aacute;ch ưu đ&atilde;i hấp dẫn về l&atilde;i suất d&agrave;nh ri&ecirc;ng cho kh&aacute;ch h&agrave;ng&nbsp;<strong><a href="https://oto.com.vn/mua-ban-xe-honda-city" title="mua xe Honda City">mua xe Honda City</a></strong>&nbsp;2022 trả g&oacute;p trong thời gian n&agrave;y.</p>

<h2><strong>Những điểm mới đ&aacute;ng ch&uacute; &yacute; tr&ecirc;n Honda City 2022</strong></h2>

<p>Honda City 2022 được đ&aacute;nh gi&aacute; l&agrave; sở hữu thiết kế trẻ trung c&ugrave;ng cảm gi&aacute;c l&aacute;i ấn tượng. Honda City thế hệ thứ 5 mang đến cảm gi&aacute;c trường d&aacute;ng v&agrave; thể thao nhờ k&iacute;ch thước chiều d&agrave;i tổng thể tăng l&ecirc;n 54 mm v&agrave; hạ chiều cao xuống 10 mm.</p>

<p>Ngoại h&igrave;nh City mới được đ&aacute;nh gi&aacute; l&agrave; &quot;lột x&aacute;c&quot; ho&agrave;n to&agrave;n, c&aacute; t&iacute;nh, thời thượng hơn hẳn người tiền nhiệm khi thiết kế lưới tản nhiệt trải d&agrave;i xuống mũi xe v&agrave; kết nối với hệ thống đ&egrave;n pha. C&aacute;c họa tiết b&ecirc;n trong dạng lưới tổ ong v&ocirc; c&ugrave;ng bắt mắt.</p>

<p>Về thiết kế th&acirc;n v&agrave; đu&ocirc;i xe Honda City 2022 chưa c&oacute; nhiều điểm mới mang t&iacute;nh &quot;c&aacute;ch mạng&quot; như khu vực mặt tiền.</p>

<p>Khoang cabin Honda City mới tho&aacute;ng rộng nhất ph&acirc;n kh&uacute;c nhờ sự gia tăng đ&aacute;ng kể về chiều rộng (tăng th&ecirc;m 113 mm). M&agrave;n h&igrave;nh giải tr&iacute; 8 inch, lớn hơn thế hệ cũ, c&oacute; hỗ trợ kết nối Apple CarPlay/Android Auto.</p>

<p>Sự xuất hiện của t&iacute;nh năng khởi động xe từ xa, tăng th&ecirc;m t&iacute;nh tiện dụng cho người d&ugrave;ng xe. Một trong những điểm mới nổi bật nhất tr&ecirc;n Honda City model 2022 ch&iacute;nh l&agrave; c&oacute; th&ecirc;m phi&ecirc;n bản City RS (Road Sailing) ho&agrave;n to&agrave;n mới với nhiều điểm nhấn ấn tượng.</p>

<p>Nh&igrave;n chung, ở thế hệ mới Honda City được đ&aacute;nh gi&aacute; c&oacute; nhiều thay đổi t&iacute;ch cực so với &quot;người tiền nhiệm&quot;, gi&uacute;p tăng khả năng cạnh tranh với c&aacute;c đối thủ sừng sỏ tại ph&acirc;n kh&uacute;c sedan B hiện nay.</p>

<p>Tuy nhi&ecirc;n, gi&aacute; xe Honda City 2022 vẫn c&ograve;n kh&aacute; cao so với c&aacute;c trang bị cũng như những c&aacute;i t&ecirc;n &quot;chung m&acirc;m&quot;. Đ&acirc;y l&agrave; một trong những bất lợi cho City trong cuộc chiến gi&agrave;nh thị phần vốn v&ocirc; c&ugrave;ng gay gắt.</p>

<h2><strong>Những c&acirc;u hỏi thường gặp về Honda City</strong></h2>

<h3><strong>Honda City c&oacute; bao nhi&ecirc;u phi&ecirc;n bản?</strong></h3>

<p>&nbsp;</p>

<p>Honda City ra mắt tại thị trường Việt Nam với 3 phi&ecirc;n bản l&agrave;: City E c&oacute; gi&aacute; ni&ecirc;m yết l&agrave; 529 triệu; City 1.5 G c&oacute; mức gi&aacute; ni&ecirc;m yết l&agrave; 559 triệu. cuối c&ugrave;ng l&agrave; phi&ecirc;n bản City 1.5 L c&oacute; gi&aacute; 599 triệu.</p>

<h3><strong>Đối thủ của Honda City?</strong></h3>

<p>Honda City hiện nay đang cạnh tranh với c&aacute;c mẫu xe trong ph&acirc;n kh&uacute;c xe hạng B như:&nbsp;Toyota Vios, Hyundai Accent hay Kia Soluto&hellip;.</p>

<h2><strong>Tổng kết</strong></h2>

<p>Gi&aacute; xe Honda City hiện nay đang kh&aacute; ngang tầm với c&aacute;c đối thủ Vios, Accent. Mẫu xe n&agrave;y được giới chuy&ecirc;n m&ocirc;n đ&aacute;nh gi&aacute; về thiết kế ấn tượng, trẻ trung v&agrave; đặc biệt l&agrave; bổ sung th&ecirc;m kh&aacute; nhiều c&ocirc;ng nghệ hữu &iacute;ch.</p>

<p>&nbsp;</p>
', 0.05, 3, 0);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (4, N'Wave Alpha 110cc', 17859273, N'wavealpha.jpg', CAST(N'2022-03-21' AS Date), 1, 1, 30, N'<h2><strong>Thiết kế</strong></h2>

<p>Wave Alpha 110cc phi&ecirc;n bản 2020 trẻ trung v&agrave; c&aacute; t&iacute;nh với thiết kế bộ tem mới, tạo những điểm nhấn ấn tượng, thu h&uacute;t &aacute;nh nh&igrave;n, cho bạn tự tin ghi lại dấu ấn c&ugrave;ng bạn b&egrave; của m&igrave;nh tr&ecirc;n mọi h&agrave;nh tr&igrave;nh.</p>

<h2><strong>Tem xe c&aacute; t&iacute;nh mới</strong></h2>

<p>Thiết kế tem mới với những đường n&eacute;t ấn tượng chạy dọc th&acirc;n xe mang lại h&igrave;nh ảnh tổng thể mới lạ v&agrave; c&aacute; t&iacute;nh.</p>

<p><img alt="" src="https://cdn.honda.com.vn/motorbike-strong-points/October2020/dHDkyeS9loGAbePiahHS.jpg" style="height:490px; width:650px" /></p>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/2e5f0b7c-56e1-44c9-a7f9-9abf9360a118" style="width:650px" />
<figcaption></figcaption>
</figure>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/2d93c3fa-5c94-48bf-920b-e543867fc6bc" style="width:650px" />
<figcaption></figcaption>
</figure>

<h2><strong>Mặt đồng hồ dễ quan s&aacute;t</strong></h2>

<p>C&aacute;c th&ocirc;ng số vận h&agrave;nh được hiển thị đầy đủ gi&uacute;p người l&aacute;i quan s&aacute;t một c&aacute;ch dễ d&agrave;ng v&agrave; thuận tiện.</p>

<p><img alt="" src="https://cdn.honda.com.vn/motorbike-strong-points/October2020/AnWeJC30HhLiG4PCmqda.jpg" style="height:490px; width:650px" /></p>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/fb705ffd-8260-414e-aacd-31a063b824ef" style="width:650px" />
<figcaption></figcaption>
</figure>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/7af14c45-73ae-4381-ad81-498c6b17f02f" style="width:650px" />
<figcaption></figcaption>
</figure>

<h2><strong>Động cơ - C&ocirc;ng nghệ</strong></h2>

<p>Wave Alpha 110cc được trang bị động cơ 110cc với hiệu suất vượt trội m&agrave; vẫn đảm bảo khả năng tiết kiệm nhi&ecirc;n liệu một c&aacute;ch tối ưu.</p>

<p><img alt="" src="https://cdn.honda.com.vn/motorbike-strong-points/October2020/QuE9jB8aqV9KUoJgBTd6.jpg" /></p>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/8420e926-2094-4a35-b023-ebb3454790e6" style="width:650px" />
<figcaption></figcaption>
</figure>

<h2><strong>Tiện &iacute;ch &amp; An to&agrave;n</strong></h2>

<p>Tối ưu h&oacute;a tiện &iacute;ch lu&ocirc;n l&agrave; một trong những quan t&acirc;m h&agrave;ng đầu của Honda khi ph&aacute;t triển xe, để bạn thoải m&aacute;i lướt c&ugrave;ng Wave Alpha 110cc tr&ecirc;n mọi nẻo đường.</p>

<h2><strong>Đ&egrave;n chiếu s&aacute;ng ph&iacute;a trước c&oacute; t&iacute;nh năng tự động bật s&aacute;ng</strong></h2>

<p>Đảm bảo cho người sử dụng c&oacute; tầm nh&igrave;n tốt nhất, hạn chế c&aacute;c trường hợp qu&ecirc;n bật đ&egrave;n khi đi trong điều kiện &aacute;nh s&aacute;ng kh&ocirc;ng đảm bảo. B&ecirc;n cạnh đ&oacute;, khả năng nhận diện của xe khi di chuyển tr&ecirc;n đường phố cũng được tăng l&ecirc;n.</p>

<p><img alt="" src="https://cdn.honda.com.vn/motorbike-strong-points/October2020/BX09Ju4GhRGAXp2zEsrQ.jpg" style="height:490px; width:650px" /></p>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/cb6fd368-9ca6-4b56-96b2-27a0d0f4f604" style="width:650px" />
<figcaption></figcaption>
</figure>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/4a726e6a-632b-4501-b10a-da9986737fdb" style="width:650px" />
<figcaption></figcaption>
</figure>

<h2><strong>Ổ kh&oacute;a đa năng 3 trong 1</strong></h2>

<p>Ổ kh&oacute;a bao gồm kh&oacute;a điện, kh&oacute;a cổ v&agrave; kh&oacute;a từ, dễ sử dụng v&agrave; chống rỉ s&eacute;t hiệu quả.</p>

<p><img alt="" src="https://cdn.honda.com.vn/motorbike-strong-points/October2020/r5ZSu8UxGPreYZtmqNvs.jpg" style="height:490px; width:650px" /></p>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/f2b355b0-efd6-4f4d-86c4-64d8b7a9a646" style="width:650px" />
<figcaption></figcaption>
</figure>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/2ac0b4a1-7948-4d31-8f0d-f42d1e77e233" style="width:650px" />
<figcaption></figcaption>
</figure>

<h2><strong>M&agrave;u sắc</strong></h2>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/1deea7a6-14fc-46b5-93af-e7f51bbb20eb" style="width:635px" />
<figcaption></figcaption>
</figure>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/769f12b8-dcbc-4b99-9d71-abe24f627174" style="width:635px" />
<figcaption></figcaption>
</figure>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/f9214934-501f-4292-98ba-51991cfd323d" style="width:635px" />
<figcaption></figcaption>
</figure>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/d660c25c-7dfc-47b0-b4ab-f598a63ea3c2" style="width:635px" />
<figcaption></figcaption>
</figure>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/88513fcf-536e-447a-83d1-e4c013414e1c" style="width:635px" />
<figcaption></figcaption>
</figure>

<h2><strong>Th&ocirc;ng số kĩ thuật</strong></h2>

<p><strong>Khối lượng bản th&acirc;n</strong></p>

<p>97kg</p>

<p><strong>D&agrave;i x Rộng x Cao</strong></p>

<p>1.914mm x 688mm x 1.075mm</p>

<p><strong>Khoảng c&aacute;ch trục b&aacute;nh xe</strong></p>

<p>1.224mm</p>

<p><strong>Độ cao y&ecirc;n</strong></p>

<p>769mm</p>

<p><strong>Khoảng s&aacute;ng gầm xe</strong></p>

<p>138mm</p>

<p><strong>Dung t&iacute;ch b&igrave;nh xăng</strong></p>

<p>3,7 l&iacute;t</p>

<p><strong>K&iacute;ch cỡ lớp trước/ sau</strong></p>

<p>Trước: 70/90 - 17 M/C 38P<br />
Sau: 80/90 - 17 M/C 50P</p>

<p><strong>Phuộc trước</strong></p>

<p>Ống lồng, giảm chấn thủy lực</p>

<p><strong>Phuộc sau</strong></p>

<p>L&ograve; xo trụ, giảm chấn thủy lực</p>

<p><strong>Loại động cơ</strong></p>

<p>Xăng, 4 kỳ, 1 xi-lanh, l&agrave;m m&aacute;t bằng kh&ocirc;ng kh&iacute;</p>

<p><strong>C&ocirc;ng suất tối đa</strong></p>

<p>6,12 kW / 7.500 v&ograve;ng/ph&uacute;t</p>

<p><strong>Dung t&iacute;ch nhớt m&aacute;y</strong></p>

<p>1 l&iacute;t (khi r&atilde; m&aacute;y)<br />
0,8 l&iacute;t (khi thay nhớt)</p>

<p><strong>Mức ti&ecirc;u thụ nhi&ecirc;n liệu</strong></p>

<p>1,90 l&iacute;t</p>

<p><strong>Hộp số</strong></p>

<p>Cơ kh&iacute;, 4 số tr&ograve;n</p>

<p><strong>Hệ thống khởi động</strong></p>

<p>Điện/ Đạp ch&acirc;n</p>

<p><strong>Moment cực đại</strong></p>

<p>8,44 Nm/5.500 v&ograve;ng/ph&uacute;t</p>

<p><strong>Dung t&iacute;ch xy-lanh</strong></p>

<p>109,1cm3</p>

<p><strong>Đường k&iacute;nh x H&agrave;nh tr&igrave;nh p&iacute;t t&ocirc;ng</strong></p>

<p>50mm x 55,6mm</p>

<p><strong>Tỷ số n&eacute;n</strong></p>

<p>9,0:1</p>
', 0, 6, 0);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (5, N'VINFAST LUX A2.0', 881695000, N'luxa20.jpg', CAST(N'2022-04-02' AS Date), 1, 5, 10, N'<h2><strong>ĐỘNG CƠ BMW2.0L</strong></h2>

<p>C&Ocirc;NG SUẤT 228 HP</p>

<p>HỘP SỐ TỰ ĐỘNG ZF 8 CẤP</p>

<p><img alt="hinh anh gia xe VinFast Lux A2.0 ban tieu chuan" src="https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwbdd0e76b/images/Lux-A/hinh-anh-gia-xe-VinFast-Lux-A2.0-ban-tieu-chuan-mau-do-mystique-red.png" title="giá xe VinFast Lux a2.0 bản tiêu chuẩn" /></p>

<h2><strong>CHỌN M&Agrave;U XE</strong></h2>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/2df83bce-0375-403c-b7e7-af83ae53bf65" style="width:133px" />
<figcaption></figcaption>
</figure>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/6f5db69a-786b-4a74-9900-3585e0a87365" style="width:133px" />
<figcaption></figcaption>
</figure>

<h2><strong>THIẾT KẾ NGOẠI THẤT</strong></h2>

<h2>KHỎE KHOẮN &amp; SANG TRỌNG</h2>

<p>Sự kết hợp giữa d&aacute;ng vẻ khỏe khoắn v&agrave; cấu tr&uacute;c ho&agrave;n hảo của ngoại thất tạo n&ecirc;n điểm nhấn sang trọng nhưng vẫn đầy tinh tế cho LUX A2.0, thổi l&agrave;n gi&oacute; mới v&agrave;o thiết kế đặc hữu của d&ograve;ng sedan th&ocirc;ng thường.</p>

<p><a href="https://shop.vinfastauto.com/vn_vi/vinfast-cars-deposit.html?modelId=Products-Car-LUX-A" type="button">MUA NGAY</a></p>

<ul>
	<li>Sang trọng &amp; tinh tế Được cấu th&agrave;nh từ nh&ocirc;m, gỗ v&agrave; da Nappa thượng hạng, khoang xe tạo cảm gi&aacute;c cao cấp v&agrave; trang nh&atilde;.</li>
	<li>Thoải m&aacute;i tận hưởngHai ghế trước chỉnh điện đa hướng c&ugrave;ng ghế sau c&oacute; độ ngả l&yacute; tưởng mang đến sự thư th&aacute;i tr&ecirc;n mọi cung đường.</li>
	<li>Tiện nghi t&acirc;n tiếnSạc kh&ocirc;ng d&acirc;y, điều h&ograve;a tự động 2 v&ugrave;ng độc lập kiểm so&aacute;t chất lượng kh&ocirc;ng kh&iacute; bằng ion, r&egrave;m che nắng chỉnh điện, m&agrave;n h&igrave;nh giải tr&iacute; 10.4 inch c&ugrave;ng d&agrave;n &acirc;m thanh 13 loa. Hỗ trợ kết nối Apple Carplay.</li>
</ul>

<h3>THIẾT KẾ NỘI THẤT</h3>

<h2>TIỆN NGHI &amp;<br />
ĐẲNG CẤP</h2>

<p>Chất liệu sang trọng, trau chuốt trong từng chi tiết, trang bị tiện nghi ti&ecirc;n tiến, tất cả l&agrave;m n&ecirc;n một kh&ocirc;ng gian đẳng cấp d&agrave;nh cho người l&aacute;i v&agrave; h&agrave;nh kh&aacute;ch tr&ecirc;n LUX A2.0.</p>

<p><a href="https://shop.vinfastauto.com/vn_vi/vinfast-cars-deposit.html?modelId=Products-Car-LUX-A" type="button">MUA NGAY</a></p>

<h3><strong>ĐỘNG CƠ &amp; C&Ocirc;NG NGHỆ</strong></h3>

<h2><strong>MẠNH MẼ &amp; &Ecirc;M &Aacute;I</strong></h2>

<p>Sức mạnh 228 m&atilde; lực từ khối động cơ 2.0L tăng &aacute;p, kết hợp c&ugrave;ng hộp số tự động 8 cấp ZF v&agrave; h&agrave;ng loạt c&ocirc;ng nghệ an to&agrave;n ti&ecirc;n tiến, LUX A 2.0 mang đến khả năng vận h&agrave;nh chắc chắn, tự tin c&ugrave;ng chủ nh&acirc;n chinh phục những cột mốc th&agrave;nh c&ocirc;ng.</p>

<ul>
	<li>1. Động cơ 2.0 L - 228 HP</li>
	<li>2. Hộp số tự động ZF 8 cấp</li>
	<li>3. Hệ thống treo trước/sau độc lập</li>
	<li>4. Khung gầm liền khối ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u</li>
	<li>5. Trợ lực l&aacute;i thủy lực điều khiển điện</li>
	<li>6. ABS - Hệ thống chống b&oacute; cứng phanh</li>
	<li>7. Cảnh b&aacute;o điểm m&ugrave;</li>
	<li>8. EBD - Ph&acirc;n phối lực phanh điện tử</li>
	<li>9. BA - Hỗ trợ phanh khẩn cấp</li>
	<li>10. ESC - Hệ thống c&acirc;n bằng điện tử</li>
	<li>11. TCS - Hệ thống kiểm so&aacute;t lực k&eacute;o</li>
	<li>12. HSA - Hỗ trợ khởi h&agrave;nh ngang dốc</li>
	<li>13. Hệ thống t&uacute;i kh&iacute;</li>
	<li>14. Hệ thống camera 360 độ</li>
</ul>

<h3>VINFAST LUX A2.0</h3>

<h2>TH&Ocirc;NG SỐ XE</h2>

<p>C&aacute;c th&ocirc;ng tin sản phẩm c&oacute; thể thay đổi&nbsp;m&agrave; kh&ocirc;ng cần b&aacute;o trước</p>

<ul>
	<li>
	<h2><strong><a href="https://shop.vinfastauto.com/vn_vi/car-lux-a.html#standa-tab" id="standa">TI&Ecirc;U CHUẨN</a></strong></h2>
	</li>
	<li>D&agrave;i x Rộng x Cao4973 x 1900 x 1500 (mm)</li>
	<li>Chiều d&agrave;i cơ sở2968 (mm)</li>
	<li>Khoảng s&aacute;ng gầm150 (mm)</li>
	<li>Dung t&iacute;ch nhi&ecirc;n liệu70 (L)</li>
	<li>Mức ti&ecirc;u thụ nhi&ecirc;n liệuKết hợp: 8,39 (l&iacute;t/100km)<br />
	Trong đ&ocirc; thị: 11,11 (l&iacute;t/100km)<br />
	Ngo&agrave;i đ&ocirc; thị: 6,90 (l&iacute;t/100km)</li>
	<li>Động cơ 2.0L</li>
	<li>C&ocirc;ng suất tối đa 174 HP</li>
	<li>M&ocirc; men xoắn cực đại 300 Nm</li>
	<li>Hộp số Tự động, 8 cấp</li>
	<li>Dẫn động Cầu sau (RWD)</li>
	<li>
	<h2><span style="color:#3498db"><u><strong>N&Acirc;NG CAO</strong></u></span></h2>
	</li>
	<li>D&agrave;i x Rộng x Cao 4973 x 1900 x 1500 (mm)</li>
	<li>Chiều d&agrave;i cơ sở 2968 (mm)</li>
	<li>Khoảng s&aacute;ng gầm 150 (mm)</li>
	<li>Dung t&iacute;ch nhi&ecirc;n liệu70 (L)</li>
	<li>Mức ti&ecirc;u thụ nhi&ecirc;n liệu Kết hợp: 8,39 (l&iacute;t/100km)<br />
	Trong đ&ocirc; thị: 11,11 (l&iacute;t/100km)<br />
	Ngo&agrave;i đ&ocirc; thị: 6,90 (l&iacute;t/100km)</li>
	<li>Động cơ 2.0L</li>
	<li>C&ocirc;ng suất tối đa 174 HP</li>
	<li>M&ocirc; men xoắn cực đại 300 Nm</li>
	<li>Hộp sốTự động, 8 cấp</li>
	<li>Dẫn độngCầu sau (RWD)</li>
	<li>
	<h2><span style="color:#3498db"><u><strong>CAO CẤP</strong></u></span></h2>
	</li>
	<li>D&agrave;i x Rộng x Cao 4973 x 1900 x 1500 (mm)</li>
	<li>Chiều d&agrave;i cơ sở 2968 (mm)</li>
	<li>Khoảng s&aacute;ng gầm đủ tải/ kh&ocirc;ng tải 150 (mm)</li>
	<li>Dung t&iacute;ch nhi&ecirc;n liệu 70 (L)</li>
	<li>Mức ti&ecirc;u thụ nhi&ecirc;n liệuKết hợp: 8,32 (l&iacute;t/100km)<br />
	Trong đ&ocirc; thị: 10,83 (l&iacute;t/100km)<br />
	Ngo&agrave;i đ&ocirc; thị: 6,82 (l&iacute;t/100km)</li>
	<li>Động cơ 2.0L</li>
	<li>C&ocirc;ng suất tối đa 228 HP</li>
	<li>M&ocirc; men xoắn cực đại 350 Nm</li>
	<li>Hộp số Tự động, 8 cấp</li>
	<li>Dẫn động Cầu sau (RWD)</li>
</ul>
', 0.1, 19, 1);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (6, N'Z400 ABS 2020', 149000000, N'z400.jpg', CAST(N'2022-05-16' AS Date), 1, 9, 10, N'<table>
	<tbody>
		<tr>
			<td>
			<h1><strong>TH&Ocirc;NG SỐ KỸ THUẬT</strong></h1>
			</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>ĐỘNG CƠ XY LANH Đ&Ocirc;I</p>

<p>399cc</p>

<p>VẺ NGO&Agrave;I PHONG C&Aacute;CH</p>

<p>CHIẾN BINH ĐƯỜNG PHỐ</p>

<h2><strong>C&Ocirc;NG NGHỆ</strong></h2>

<p>&nbsp;</p>

<p>T&igrave;m Hiểu Th&ecirc;m Về C&ocirc;ng Nghệ</p>

<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng nghệ quản l&yacute; động cơ</td>
		</tr>
	</tbody>
</table>

<ul>
	<li><a href="javascript:void(0)"><img src="https://content2.kawasaki.com/ContentStorage/KMV/ProductTechIcons/b29e3c42-03b3-4caf-951c-ae675c12a5c0.svg" /></a>

	<p><a href="javascript:void(0)">HỖ TRỢ SANG SỐ &amp; CHỐNG TRƯỢT LY HỢP</a></p>
	</li>
	<li><a href="javascript:void(0)"><img src="https://content2.kawasaki.com/ContentStorage/KMV/ProductTechIcons/0df4f4a4-a0e0-40be-bfd4-718fce66954b.svg" /></a>
	<p><a href="javascript:void(0)">CHỈ SỐ ECONOMICAL RIDING</a></p>
	</li>
</ul>

<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng nghệ kiểm so&aacute;t khung sườn</td>
		</tr>
	</tbody>
</table>

<ul>
	<li><a href="javascript:void(0)"><img src="https://content2.kawasaki.com/ContentStorage/CKM/ProductTechIcons/e44d9891-8639-4464-954b-1a6e2d0612ab.svg" /></a>

	<p><a href="javascript:void(0)">T&Iacute;NH NĂNG ABS (HỆ THỐNG CHỐNG B&Oacute; CỨNG PHANH)</a></p>
	</li>
	<li><a href="javascript:void(0)"><img src="https://content2.kawasaki.com/ContentStorage/CKM/ProductTechIcons/0dc297fc-2041-4c7c-90a8-ce1ea3ccf7c2.svg" /></a>
	<p><a href="javascript:void(0)">ERGO-FIT</a></p>
	</li>
</ul>

<h2><strong>SỨC MẠNH</strong></h2>

<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng suất cực đại</td>
			<td>&nbsp;33,4 kW {45 PS} / 10.000 rpm</td>
		</tr>
		<tr>
			<td>M&ocirc;-men xoắn cực đại</td>
			<td>&nbsp;38,0 N&middot;m {3,9 kgfm} / 8.000 rpm</td>
		</tr>
		<tr>
			<td>Loại động cơ</td>
			<td>&nbsp;4 th&igrave;, xy-lanh đ&ocirc;i, DOHC, 4 van, W /C</td>
		</tr>
		<tr>
			<td>Dung t&iacute;ch động cơ</td>
			<td>&nbsp;399 cm&sup3;</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước v&agrave; h&agrave;nh tr&igrave;nh</td>
			<td>&nbsp;70,0 x 51,8 mm</td>
		</tr>
		<tr>
			<td>Tỉ số n&eacute;n</td>
			<td>&nbsp;11,5:1</td>
		</tr>
		<tr>
			<td>HT đ&aacute;nh lửa</td>
			<td>&nbsp;B&amp;C (TCBI EL. ADV. D.)</td>
		</tr>
		<tr>
			<td>HT khởi động</td>
			<td>&nbsp;Khởi động điện</td>
		</tr>
		<tr>
			<td>HT b&ocirc;i trơn</td>
			<td>&nbsp;B&ocirc;i trơn cưỡng bức</td>
		</tr>
		<tr>
			<td>Hộp số</td>
			<td>&nbsp;Hộp số 6 cấp</td>
		</tr>
		<tr>
			<td>Tỉ số truyền ch&iacute;nh</td>
			<td>&nbsp;2,219 (71/32)</td>
		</tr>
		<tr>
			<td>Tỉ số truyền 1st</td>
			<td>&nbsp;2,929 (41/14)</td>
		</tr>
		<tr>
			<td>Tỉ số truyền 2nd</td>
			<td>&nbsp;2,056 (37/18) </td>
		</tr>
		<tr>
			<td>Tỉ số truyền 3rd</td>
			<td>&nbsp;1,619 (34/21)</td>
		</tr>
		<tr>
			<td>Tỉ số truyền 4th</td>
			<td>1,333 (32/24)</td>
		</tr>
		<tr>
			<td>Tỉ số truyền 5th</td>
			<td>1,154 (30/26)</td>
		</tr>
		<tr>
			<td>Tỉ số truyền 6th</td>
			<td>1.037 (28 /27)</td>
		</tr>
		<tr>
			<td>Tỉ số truyền cuối</td>
			<td>2,929 (41/14)</td>
		</tr>
		<tr>
			<td>Ly hợp</td>
			<td>Đa đĩa ướt</td>
		</tr>
		<tr>
			<td>HT truyền động</td>
			<td>X&iacute;ch</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<h2><strong>HIỆU NĂNG</strong></h2>

<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td>Loại khung</td>
			<td>&nbsp;Khung Trellis, th&eacute;p chịu lực cao</td>
		</tr>
		<tr>
			<td>Hệ thống giảm x&oacute;c trước</td>
			<td>&nbsp;Giảm x&oacute;c ống lồng</td>
		</tr>
		<tr>
			<td>Hệ thống giảm x&oacute;c sau</td>
			<td>&nbsp;Phuộc sau dạng Uni Trak c&oacute; khả năng điều chỉnh được</td>
		</tr>
		<tr>
			<td>H&agrave;nh tr&igrave;nh phuộc trước</td>
			<td>120 mm</td>
		</tr>
		<tr>
			<td>H&agrave;nh tr&igrave;nh phuộc sau</td>
			<td>130 mm</td>
		</tr>
		<tr>
			<td>G&oacute;c Caster</td>
			<td>24,5&deg;</td>
		</tr>
		<tr>
			<td>Đường m&ograve;n</td>
			<td>92 mm</td>
		</tr>
		<tr>
			<td>G&oacute;c l&aacute;i (tr&aacute;i /phải)</td>
			<td>35&deg; / 35&deg;</td>
		</tr>
		<tr>
			<td>Lốp trước</td>
			<td>110/70-17 M/C 54S</td>
		</tr>
		<tr>
			<td>Lốp sau</td>
			<td>150/60R17 M/C 66H</td>
		</tr>
		<tr>
			<td>Phanh trước</td>
			<td>Đĩa đơn</td>
		</tr>
		<tr>
			<td>Phanh sau</td>
			<td>Đĩa đơn</td>
		</tr>
		<tr>
			<td>Chiều d&agrave;i cơ sở</td>
			<td>1.370 mm</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<h2><strong>CHI TIẾT</strong></h2>

<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>1.990 x 800 x 1.055 mm</td>
		</tr>
		<tr>
			<td>Độ cao gầm xe</td>
			<td>145 mm</td>
		</tr>
		<tr>
			<td>Chiều cao y&ecirc;n</td>
			<td>785mm</td>
		</tr>
		<tr>
			<td>Trọng lượng</td>
			<td>167 kg</td>
		</tr>
		<tr>
			<td>Dung t&iacute;ch b&igrave;nh xăng</td>
			<td>14 l&iacute;t</td>
		</tr>
		<tr>
			<td>HT Nhi&ecirc;n liệu</td>
			<td>Phun xăng</td>
		</tr>
		<tr>
			<td>Mức ti&ecirc;u hao nhi&ecirc;n liệu</td>
			<td>&nbsp;4,4 L/100km</td>
		</tr>
		<tr>
			<td>Bảo h&agrave;nh</td>
			<td>24 th&aacute;ng</td>
		</tr>
	</tbody>
</table>
', 0, 3, 0);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (7, N'Audi A4 2022', 1790000000, N'AudiA04.png', CAST(N'2022-05-16' AS Date), 1, 8, 5, N'<h1 style="text-align:center"><strong>Audi A4 Mới<br />
C&ocirc;ng nghệ dẫn lối</strong></h1>

<p>Thiết kế trau chuốt, kh&ocirc;ng gian nội thất rộng hơn trong d&aacute;ng vẻ thể thao c&ugrave;ng m&agrave;n h&igrave;nh cảm ứng, Audi A4 dẫn đầu c&ocirc;ng nghệ. Qu&aacute;n qu&acirc;n giải thưởng &ldquo;International Engine&rdquo; hạng mục động cơ TFSI 2.0 với trang bị hệ thống mild hybrid (MHEV). Sự kết hợp t&iacute;nh hiệu quả với độ thoải m&aacute;i tr&ecirc;n cả hai phi&ecirc;n bản dẫn động cầu trước v&agrave; dẫn động hai cầu. C&ocirc;ng suất v&agrave; m&ocirc;-men xoắn hiệu quả khiến Audi A4 trở n&ecirc;n kh&aacute;c biệt ho&agrave;n to&agrave;n trong c&ugrave;ng ph&acirc;n kh&uacute;c.<br />
<br />
D&aacute;ng vẻ thể thao song h&agrave;nh c&ugrave;ng động cơ xăng mild hybrid, Audi A4 mới mang lại cảm gi&aacute;c l&aacute;i th&uacute; vị với cả hai phi&ecirc;n bản: dẫn động cầu trước v&agrave; quattro.</p>

<h2 style="text-align:center"><strong>Thể thao từ mọi g&oacute;c nh&igrave;n</strong></h2>

<p>Audi A4 l&agrave; viết tắt cho t&iacute;nh thể thao, uy t&iacute;n v&agrave; cảm x&uacute;c. Bằng c&aacute;ch tập trung v&agrave;o c&aacute;c chi tiết năng động đặc trưng quattro với tỷ lệ h&agrave;i h&ograve;a, c&aacute;c thuộc t&iacute;nh n&agrave;y hiển thị một c&aacute;ch r&otilde; r&agrave;ng. Ở ph&iacute;a sau, một thanh crom ngang nổi bật bắt nối giữa hai đ&egrave;n hậu đồng thời nhấn mạnh ấn tượng chiều rộng. Hai ống xả h&igrave;nh thang thể thao nằm ch&igrave;m trong ốp bộ khuếch t&aacute;n ph&iacute;a sau. Nh&igrave;n từ ph&iacute;a b&ecirc;n, c&aacute;c đường g&acirc;n thể thao nổi bật kết hợp với c&aacute;c v&ograve;m b&aacute;nh xe nhấn mạnh đặc trưng quattro.<br />
<br />
Đi k&egrave;m l&agrave; bộ m&acirc;m hợp kim phong c&aacute;ch 17-inch với thiết kế 5 chấu năng động, t&ugrave;y chọn mở rộng l&ecirc;n đến m&acirc;m 19-inch. Ở phần đầu xe, lưới tản nhiệt được thiết kế dạng khung đơn s&acirc;u v&agrave; rộng, kết hợp với phần cản trước v&agrave; c&aacute;c khe h&uacute;t gi&oacute; tạo th&agrave;nh điểm nhấn mạnh mẽ.</p>

<p><strong>Rear</strong></p>

<p><img alt="" src="https://www.audi.vn/content/dam/nemo/models/a4/a4-limousine/my-2020/1920x1080-feature-gallery/1920x1080_AA4_L_191002.jpg?output-format=webp&amp;downsize=1920px:*" style="height:675px; width:1200px" /></p>

<p><strong>Side</strong></p>

<p><strong><img alt="" src="https://www.audi.vn/content/dam/nemo/models/a4/a4-limousine/my-2020/1920x1080-feature-gallery/1920x1080_AA4_L_191002.jpg?output-format=webp&amp;downsize=1920px:*" style="height:1080px; width:1920px" />Front</strong></p>

<p><strong><img alt="" src="https://www.audi.vn/content/dam/nemo/models/a4/a4-limousine/my-2020/1920x1080-feature-gallery/1920x1080_AA4_L_191002.jpg?output-format=webp&amp;downsize=1920px:*" style="height:675px; width:1200px" /></strong></p>

<h2 style="text-align:center"><strong>Nội thất rộng r&atilde;i với chất lượng đẳng cấp</strong></h2>

<p>Trong kh&ocirc;ng gian nội thất của Audi A4, bạn sẽ trải nghiệm được một kh&ocirc;ng gian rộng r&atilde;i với c&aacute;c yếu tố được sắp xếp để tối ưu h&oacute;a &aacute;nh s&aacute;ng. C&aacute;c đường viền chrome tạo ấn tượng mạnh mẽ v&agrave; nhấn mạnh chiều rộng của xe. Một ngăn chứa đồ lớn được thiết kế tr&ecirc;n ốp trung t&acirc;m mang lại t&iacute;nh tiện dụng cao. &Aacute;nh s&aacute;ng nội thất ti&ecirc;u chuẩn bao gồm cả đ&egrave;n đọc s&aacute;ch ở h&agrave;ng ghế tr&ecirc;n. G&oacute;i t&ugrave;y chọn &aacute;nh nội thất m&agrave;u trắng l&agrave;m tăng th&ecirc;m bầu kh&ocirc;ng kh&iacute; dễ chịu. Ngo&agrave;i ra, Audi A4 cũng c&oacute; sẵn c&aacute;c phi&ecirc;n bản Audi A4 Advanced v&agrave; S line.</p>

<p><img alt="" src="https://www.audi.vn/dam/nemo/models/a4/a4-limousine/my-2020/1920x1080-inline-media-gallery/1920x1080_AA4_D_191001.jpg?output-format=webp&amp;downsize=1920px:*" style="height:675px; width:1200px" /></p>

<h2 style="text-align:center"><strong>Thiết lập xu hướng c&ocirc;ng nghệ</strong></h2>

<p>Nhờ kh&aacute;i niệm vận h&agrave;nh trực quan th&ocirc;ng qua c&aacute;c chức năng cảm ứng, Audi A4 đem lại một trải nghiệm sử dụng dễ d&agrave;ng th&acirc;n thiện. Ngo&agrave;i ra bạn c&oacute; thể lựa chọn những t&ugrave;y chọn c&ocirc;ng nghệ về th&ocirc;ng tin giải tr&iacute; như buồng l&aacute;i ảo kỹ thuật số ảo Audi virtual cockpit. M&agrave;n h&igrave;nh 12.3-inch của n&oacute; sẽ hiển thị r&otilde; r&agrave;ng c&aacute;c th&ocirc;ng tin quan trọng với độ ph&acirc;n giải Full HD, bao gồm hiển thị tốc độ v&agrave; c&aacute;c th&ocirc;ng số vận h&agrave;nh của xe.</p>

<p><img alt="" src="https://www.audi.vn/dam/nemo/models/a4/a4-limousine/my-2020/1920x1080-inline-media-gallery/1920x1080_AA4_D_191002.jpg?output-format=webp&amp;downsize=1766px:*" style="height:675px; width:1200px" /></p>

<h2 style="text-align:center"><strong>Động cơ mạnh mẽ</strong></h2>

<p>Ch&uacute;ng t&ocirc;i đem đến c&aacute;c t&ugrave;y chọn động cơ xăng 2.0 TFSI kh&aacute;c nhau cho Audi A4. Bạn c&oacute; thể chọn phi&ecirc;n bản động cơ xăng 2.0 - 40 TFSI cho c&ocirc;ng suất 140 kW (190 m&atilde; lực) hoặc phi&ecirc;n bản Audi A4 45 TFSI quattro với c&ocirc;ng suất 180 kW (245 m&atilde; lực). Phi&ecirc;n bản sau mang t&iacute;nh c&ocirc;ng nghệ cao với hệ dẫn động bốn b&aacute;nh quattro được k&iacute;ch hoạt chỉ trong v&agrave;i mili-gi&acirc;y khi c&oacute; t&igrave;nh huống l&aacute;i xe y&ecirc;u cầu, đảm bảo vận hạnh mạnh mẽ v&agrave; năng động. Hệ thống mild hybrid 12-volts c&ugrave;ng m&aacute;y ph&aacute;t khởi động lại v&agrave; Pin Li-ion cho ph&eacute;p động cơ c&oacute; thể tự động ngắt trong l&uacute;c vận h&agrave;nh - chế độ n&agrave;y được gọi l&agrave; chạy trơn. Điều n&agrave;y gi&uacute;p giảm mức ti&ecirc;u thụ nhi&ecirc;n liệu đ&aacute;ng kể.</p>

<p>&sup1; Mức ti&ecirc;u thụ nhi&ecirc;n liệu kết hợp: A4 40 TFSI 6.0 - 5.8 l&iacute;t / 100 km; A4 45 TFSI quattro 6.8 - 6.5 l&iacute;t / 100 km.</p>

<p><img alt="" src="https://www.audi.vn/dam/nemo/models/a4/a4-limousine/my-2020/1920x1080-inline-media-gallery/1920x1080_AA4_L_191007.jpg?output-format=webp&amp;downsize=1920px:*" style="height:675px; width:1200px" /></p>

<h2 style="text-align:center"><strong>T&iacute;nh năng &aacute;nh s&aacute;ng vượt trội</strong></h2>

<p>Một điểm dễ nhận thấy tr&ecirc;n Audi A4 ch&iacute;nh l&agrave; thiết kế &aacute;nh s&aacute;ng t&acirc;n tiến. Đ&egrave;n pha sử dụng c&ocirc;ng nghệ LED được trang bị ti&ecirc;u chuẩn. Ch&uacute;ng đảm bảo đem lại &aacute;nh s&aacute;ng thật như ban ng&agrave;y khi sử dụng. Ngo&agrave;i ra, bạn c&oacute; thể t&ugrave;y chọn đ&egrave;n pha LED Matrix với hiệu ứng chiếu s&aacute;ng năng động c&ugrave;ng đ&egrave;n xi nhan chạy tia năng động. C&ocirc;ng nghệ LED Matrix kết hợp với hệ thống camera c&ugrave;ng nguồn chiếu s&aacute;ng LED v&agrave; s&aacute;ng quang học chuẩn x&aacute;c. Điều n&agrave;y cho ph&eacute;p hệ thống chiếu s&aacute;ng c&oacute; chọn lọc c&aacute;c phương tiện chạy ngược chiều kh&ocirc;ng bị ch&oacute;i mắt. Khi bạn kh&oacute;a hoặc mở kh&oacute;a xe, đ&egrave;n pha ph&iacute;a trước sẽ cho một m&agrave;n tr&igrave;nh diễn &aacute;nh s&aacute;ng ấn tượng. Cũng như ở ph&iacute;a sau, đ&egrave;n hậu LED cũng c&oacute; một m&agrave;n tr&igrave;nh diễn ấn tượng kết hợp đ&egrave;n b&aacute;o rẽ chạy tia năng động.</p>

<p><img alt="" src="https://www.audi.vn/dam/nemo/models/a4/a4-limousine/my-2020/1920x1080-mtc-x-l-16-9/1920x1080_v3_AA4_L_191002.jpg?output-format=webp&amp;downsize=1920px:*" style="height:675px; width:1200px" /></p>

<p>&nbsp;</p>
', 0.05, 1, 0);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (8, N'FORD Ranger XLS 2.2L 4X2 AT', 662000000, N'Ranger.png', CAST(N'2021-12-21' AS Date), 1, 3, 5, N'<h2><strong>Ngoại thất</strong></h2>

<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:8080/a9e15068-3504-4cb1-bca5-bd6992971324" style="width:458px" />
<figcaption></figcaption>
</figure>

<h2><strong>Trang Bị Ch&iacute;nh</strong></h2>

<ul>
	<li><strong>Động cơ</strong>&nbsp;Turbo Diesel 2.2L i4 TDCi; Trục cam k&eacute;p, c&oacute; l&agrave;m m&aacute;t kh&iacute; nạp</li>
	<li><strong>C&ocirc;ng suất cực đại (PS/v&ograve;ng/ph&uacute;t)</strong>&nbsp;160 (118 KW) / 3200</li>
	<li><strong>Hệ thống truyền động</strong>&nbsp;Một cầu chủ động / 4x2</li>
	<li><strong>Kh&oacute;a vi sai cầu sau</strong>&nbsp;Kh&ocirc;ng</li>
	<li><strong>Hộp số</strong>&nbsp;Số tự động 6 cấp</li>
</ul>
', 0.1, 2, 0);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (9, N'BMW 520i ', 1999000000, N'BMW_520i .jpg', CAST(N'2021-02-05' AS Date), 1, 7, 5, N'<p><strong>TH&Ocirc;NG SỐ KỸ THUẬT</strong></p>

<p><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="BMW 520i ALL NEW" sizes="(max-width: 889px) 100vw, 889px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-VN-Event-1-e1566127422621-889x1024.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-VN-Event-1-e1566127422621-889x1024.jpg 889w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-VN-Event-1-e1566127422621-260x300.jpg 260w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-VN-Event-1-e1566127422621-768x885.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-VN-Event-1-e1566127422621-750x864.jpg 750w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-VN-Event-1-e1566127422621-1140x1314.jpg 1140w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-VN-Event-1-e1566127422621.jpg 1654w" style="height:1024px; width:889px" /></a></p>

<p><strong>th&ocirc;ng số kỹ thuật của xe</strong></p>

<p><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="BMW 520i ALL NEW" sizes="(max-width: 891px) 100vw, 891px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-EN-event-1-e1566127467161-891x1024.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-EN-event-1-e1566127467161-891x1024.jpg 891w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-EN-event-1-e1566127467161-261x300.jpg 261w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-EN-event-1-e1566127467161-768x882.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-EN-event-1-e1566127467161-750x862.jpg 750w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-EN-event-1-e1566127467161-1140x1310.jpg 1140w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/BMW-520i-EN-event-1-e1566127467161.jpg 1654w" style="height:1024px; width:891px" /></a></p>

<p><strong>th&ocirc;ng số kỹ thuật tiếng anh</strong></p>

<p><strong>KIỂU D&Aacute;NG NỔI BẬT &ndash; THIẾT KẾ CỦA BMW 520i All New THẾ HỆ MỚI&nbsp;</strong></p>

<p>Lời tuy&ecirc;n bố sứ mệnh: &ldquo;Thiết lập những ti&ecirc;u chuẩn mới&rdquo;,&nbsp;<a href="https://bmwcenter.com.vn/bmw-5-series-sedan/"><strong>BMW 5 Series All New</strong></a>&nbsp;l&agrave; hiện th&acirc;n của d&ograve;ng saloon d&agrave;nh cho doanh nh&acirc;n hiện đại. Nhờ v&agrave;o vẻ ngo&agrave;i năng động v&agrave; lịch l&atilde;m, chiếc xe n&agrave;y l&agrave; c&acirc;u trả lời thuyết phục cho những kỳ vọng được đặt ra đối với c&aacute;c d&ograve;ng xe trong c&ugrave;ng ph&acirc;n kh&uacute;c, thiết kế thể thao thẩm mỹ v&agrave; cảm gi&aacute;c l&aacute;i vượt trội đi k&egrave;m những c&ocirc;ng nghệ ti&ecirc;n tiến bậc nhất.</p>

<p><strong>THIẾT KẾ NGOẠI THẤT</strong></p>

<p>So với thế hệ tiền nhiệm, phong c&aacute;ch thiết kế của&nbsp;<strong>BMW 520i All New</strong>&nbsp;được đ&aacute;nh gi&aacute; l&agrave; &ldquo;chất&rdquo; hơn nhiều. Chiếc&nbsp;<a href="https://bmwcenter.com.vn/bmw-5-series-sedan/"><strong>BMW 5 Series 2019</strong></a>&nbsp;sở hữu phần đầu xe sắc n&eacute;t, trong khi phần th&acirc;n xe to&aacute;t l&ecirc;n vẻ g&acirc;n guốc mạnh mẽ. Nếu như thế hệ cũ sở hữu cấu tr&uacute;c trọng lượng nhẹ, động cơ hoạt động hiệu quả v&agrave; h&agrave;ng loạt c&ocirc;ng nghệ ti&ecirc;n tiến, th&igrave; ở thế hệ mới n&agrave;y,&nbsp;<strong>BMW 520i All New</strong>&nbsp;c&ograve;n l&agrave;m được nhiều hơn thế. Trọng lượng xe giảm đến 62kg nhờ việc ứng dụng c&aacute;c vật liệu nh&ocirc;m, magie v&agrave; th&eacute;p c&oacute; độ bền cao. Bộ khung gầm mới, chắc chắn, ph&acirc;n bổ trọng lượng đều v&agrave; trọng t&acirc;m thấp gi&uacute;p xe c&oacute; trải nghiệm l&aacute;i năng động hơn.</p>

<p><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_1_815-e1566128011785.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_1_815-e1566128011785.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_1_815-e1566128011785-300x192.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_1_815-e1566128011785-768x491.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_1_815-e1566128011785-750x479.jpg 750w" style="height:521px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_fs_evox_1_815-e1566128066385.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_fs_evox_1_815-e1566128066385.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_fs_evox_1_815-e1566128066385-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_fs_evox_1_815-e1566128066385-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_fs_evox_1_815-e1566128066385-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_7_815-e1566128112589.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_7_815-e1566128112589.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_7_815-e1566128112589-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_7_815-e1566128112589-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_7_815-e1566128112589-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_4_815-e1566128282733.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_4_815-e1566128282733.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_4_815-e1566128282733-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_4_815-e1566128282733-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_4_815-e1566128282733-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_5_815-e1566128424942.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_5_815-e1566128424942.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_5_815-e1566128424942-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_5_815-e1566128424942-768x495.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_5_815-e1566128424942-750x483.jpg 750w" style="height:525px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_6_815-e1566196824714.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_6_815-e1566196824714.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_6_815-e1566196824714-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_6_815-e1566196824714-768x493.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_6_815-e1566196824714-750x481.jpg 750w" style="height:523px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_10_815-e1566196933794.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_10_815-e1566196933794.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_10_815-e1566196933794-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_10_815-e1566196933794-768x495.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_10_815-e1566196933794-750x483.jpg 750w" style="height:525px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_15_815-1-e1566196985958.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_15_815-1-e1566196985958.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_15_815-1-e1566196985958-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_15_815-1-e1566196985958-768x493.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_tds_evox_15_815-1-e1566196985958-750x481.jpg 750w" style="height:523px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_2_815-e1566197038344.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_2_815-e1566197038344.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_2_815-e1566197038344-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_2_815-e1566197038344-768x495.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_2_815-e1566197038344-750x483.jpg 750w" style="height:525px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_3_815-e1566197079359.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_3_815-e1566197079359.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_3_815-e1566197079359-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_3_815-e1566197079359-768x493.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_3_815-e1566197079359-750x481.jpg 750w" style="height:523px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_4_815-e1566197121959.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_4_815-e1566197121959.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_4_815-e1566197121959-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_4_815-e1566197121959-768x493.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_4_815-e1566197121959-750x481.jpg 750w" style="height:523px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_6_815-e1566197226933.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_6_815-e1566197226933.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_6_815-e1566197226933-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_6_815-e1566197226933-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_6_815-e1566197226933-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_8_815-e1566197277328.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_8_815-e1566197277328.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_8_815-e1566197277328-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_8_815-e1566197277328-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_8_815-e1566197277328-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_11_815-1-e1566197347923.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_11_815-1-e1566197347923.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_11_815-1-e1566197347923-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_11_815-1-e1566197347923-768x495.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds2_evox_11_815-1-e1566197347923-750x483.jpg 750w" style="height:525px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_2_815-e1566197436973.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_2_815-e1566197436973.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_2_815-e1566197436973-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_2_815-e1566197436973-768x495.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_2_815-e1566197436973-750x483.jpg 750w" style="height:525px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_1_815-e1566197479603.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_1_815-e1566197479603.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_1_815-e1566197479603-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_1_815-e1566197479603-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_1_815-e1566197479603-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_5_815-e1566197590448.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_5_815-e1566197590448.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_5_815-e1566197590448-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_5_815-e1566197590448-768x493.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_5_815-e1566197590448-750x481.jpg 750w" style="height:523px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_8_815-e1566197637717.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_8_815-e1566197637717.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_8_815-e1566197637717-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_8_815-e1566197637717-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530i_tds3_evox_8_815-e1566197637717-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_gr_evox_1_815-e1566197689950.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_gr_evox_1_815-e1566197689950.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_gr_evox_1_815-e1566197689950-300x195.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_gr_evox_1_815-e1566197689950-768x500.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_gr_evox_1_815-e1566197689950-750x489.jpg 750w" style="height:531px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_hl_evox_1_815-e1566197735354.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_hl_evox_1_815-e1566197735354.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_hl_evox_1_815-e1566197735354-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_hl_evox_1_815-e1566197735354-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_hl_evox_1_815-e1566197735354-750x485.jpg 750w" style="height:527px; width:815px" /></a></p>

<p><strong>THIẾT KẾ NỘI THẤT</strong></p>

<p>Nội thất của BMW 5 Series 2019 thể hiện r&otilde; hai ti&ecirc;u ch&iacute; chủ đạo l&agrave; hiện đại v&agrave; tinh tế. C&aacute;c chuy&ecirc;n gia đ&aacute;nh gi&aacute; cao khoang cabin của 5 Series mới nhờ ghế ngồi cao cấp, sự y&ecirc;n tĩnh v&agrave; h&agrave;ng loạt t&iacute;nh năng hiện đại c&ugrave;ng kh&ocirc;ng gian rộng r&atilde;i.</p>

<p><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 1024px) 100vw, 1024px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2017-bmw-5-series-interior-1024x684.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2017-bmw-5-series-interior-1024x684.jpg 1024w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2017-bmw-5-series-interior-300x200.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2017-bmw-5-series-interior-768x513.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2017-bmw-5-series-interior-750x501.jpg 750w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2017-bmw-5-series-interior-1140x761.jpg 1140w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2017-bmw-5-series-interior.jpg 1280w" style="height:684px; width:1024px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ip_evox_1_815-e1566198136759.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ip_evox_1_815-e1566198136759.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ip_evox_1_815-e1566198136759-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ip_evox_1_815-e1566198136759-768x495.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ip_evox_1_815-e1566198136759-750x483.jpg 750w" style="height:525px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_ch_evox_1_815-e1566198180560.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_ch_evox_1_815-e1566198180560.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_ch_evox_1_815-e1566198180560-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_ch_evox_1_815-e1566198180560-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_ch_evox_1_815-e1566198180560-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_cccl_evox_1_815-e1566198224112.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_cccl_evox_1_815-e1566198224112.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_cccl_evox_1_815-e1566198224112-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_cccl_evox_1_815-e1566198224112-768x495.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_cccl_evox_1_815-e1566198224112-750x483.jpg 750w" style="height:525px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ib2_evox_1_815-e1566198267869.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ib2_evox_1_815-e1566198267869.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ib2_evox_1_815-e1566198267869-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ib2_evox_1_815-e1566198267869-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ib2_evox_1_815-e1566198267869-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_ch4_evox_1_815-e1566198314344.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_ch4_evox_1_815-e1566198314344.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_ch4_evox_1_815-e1566198314344-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_ch4_evox_1_815-e1566198314344-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_ch4_evox_1_815-e1566198314344-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_dtw_evox_1_815-e1566198360425.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_dtw_evox_1_815-e1566198360425.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_dtw_evox_1_815-e1566198360425-300x195.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_dtw_evox_1_815-e1566198360425-768x498.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_dtw_evox_1_815-e1566198360425-750x487.jpg 750w" style="height:529px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_rcc_evox_1_815-e1566198437615.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_rcc_evox_1_815-e1566198437615.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_rcc_evox_1_815-e1566198437615-300x193.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_rcc_evox_1_815-e1566198437615-768x495.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_rcc_evox_1_815-e1566198437615-750x483.jpg 750w" style="height:525px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_rps_evox_1_815-e1566198604817.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_rps_evox_1_815-e1566198604817.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_rps_evox_1_815-e1566198604817-300x194.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_rps_evox_1_815-e1566198604817-768x497.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_rps_evox_1_815-e1566198604817-750x485.jpg 750w" style="height:527px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 840px) 100vw, 840px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019-bmw-5-series-sedan-rear-passenger-seats-carbuzz-338360-840x560.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019-bmw-5-series-sedan-rear-passenger-seats-carbuzz-338360-840x560.jpg 840w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019-bmw-5-series-sedan-rear-passenger-seats-carbuzz-338360-840x560-300x200.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019-bmw-5-series-sedan-rear-passenger-seats-carbuzz-338360-840x560-768x512.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019-bmw-5-series-sedan-rear-passenger-seats-carbuzz-338360-840x560-750x500.jpg 750w" style="height:560px; width:840px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ca_evox_1_815-e1566199422425.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ca_evox_1_815-e1566199422425.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ca_evox_1_815-e1566199422425-300x195.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ca_evox_1_815-e1566199422425-768x498.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2018_bmw_5-series_sedan_530e-iperformance_ca_evox_1_815-e1566199422425-750x487.jpg 750w" style="height:529px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_tp_evox_1_815-e1566199471796.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_tp_evox_1_815-e1566199471796.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_tp_evox_1_815-e1566199471796-300x196.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_tp_evox_1_815-e1566199471796-768x502.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_530e-xdrive-iperformance_tp_evox_1_815-e1566199471796-750x490.jpg 750w" style="height:533px; width:815px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 815px) 100vw, 815px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_m550i-xdrive_tp_evox_1_815-e1566199525540.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_m550i-xdrive_tp_evox_1_815-e1566199525540.jpg 815w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_m550i-xdrive_tp_evox_1_815-e1566199525540-300x195.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_m550i-xdrive_tp_evox_1_815-e1566199525540-768x498.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/2019_bmw_5-series_sedan_m550i-xdrive_tp_evox_1_815-e1566199525540-750x487.jpg 750w" style="height:529px; width:815px" /></a></p>

<p><strong>THIẾT KẾ ĐỘNG CƠ</strong></p>

<p>&nbsp;</p>

<p><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 1024px) 100vw, 1024px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/bmw-520i.png1_-1024x683.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/bmw-520i.png1_-1024x683.jpg 1024w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/bmw-520i.png1_-300x200.jpg 300w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/bmw-520i.png1_-768x512.jpg 768w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/bmw-520i.png1_-750x500.jpg 750w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/bmw-520i.png1_-1140x760.jpg 1140w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/bmw-520i.png1_.jpg 1500w" style="height:683px; width:1024px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 750px) 100vw, 750px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/dong-co-tang-ap-kep-2.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/dong-co-tang-ap-kep-2.jpg 750w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/dong-co-tang-ap-kep-2-300x169.jpg 300w" style="height:422px; width:750px" /></a><a href="https://bmw-vietnam.com.vn/bmw-520i-all-new/"><img alt="" sizes="(max-width: 750px) 100vw, 750px" src="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/bmw-520i.png3_.jpg" srcset="https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/bmw-520i.png3_.jpg 750w, https://bmw-vietnam.com.vn/wp-content/uploads/2019/08/bmw-520i.png3_-300x225.jpg 300w" style="height:563px; width:750px" /></a></p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 0.2, 2, 0);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (10, N'KIA New Morning', 439000000, N'cover.jpg', CAST(N'2021-07-18' AS Date), 1, 10, 10, N'<h1><img alt="" src="https://kiavietnam.com.vn/storage/product/new-kiamorning/san-pham/01-1.jpg" style="height:1069px; width:1200px" /></h1>

<h1><strong>New Morning</strong></h1>

<h2><strong>Phong c&aacute;ch thiết kế ho&agrave;n to&agrave;n mới</strong></h2>

<p>Nhấn mạnh t&iacute;nh thể thao, kiểu d&aacute;ng thời trang v&agrave; k&iacute;ch thước tối ưu</p>

<h2><strong>NGOẠI THẤT</strong></h2>

<p>Mặt trước</p>

<p><img alt="" src="https://kiavietnam.com.vn/storage/product/new-kiamorning/san-pham/kvd5174-optimized.jpg" style="height:801px; width:1200px" /></p>

<p>Mặt sau</p>

<p><img alt="" src="https://kiavietnam.com.vn/storage/product/new-kiamorning/san-pham/kvd5097-optimized.jpg" style="height:801px; width:1200px" /></p>

<h2><strong>Nội thất GT LINE</strong></h2>

<p><strong><img alt="" src="https://kiavietnam.com.vn/storage/product/new-kiamorning/san-pham/gt-line-fullseat-optimized.jpg" style="height:675px; width:1200px" /></strong></p>

<p><strong>M&agrave;n h&igrave;nh cảm ứng trung t&acirc;m 8&#39;&#39; đặt nổi</strong></p>

<p><strong><img alt="" src="https://kiavietnam.com.vn/storage/product/new-kiamorning/san-pham/noi-that/2.jpg" style="height:674px; width:1200px" />M&agrave;n h&igrave;nh đa th&ocirc;ng tin LCD 4.2</strong></p>

<p><strong><img alt="" src="https://kiavietnam.com.vn/storage/product/new-kiamorning/san-pham/noi-that/1.jpg" style="height:674px; width:1200px" />Hệ thống điều h&ograve;a tự động</strong></p>

<p><strong><img alt="" src="https://kiavietnam.com.vn/storage/product/new-kiamorning/san-pham/noi-that/image2-large.jpg" style="height:675px; width:1200px" />Bệ tỳ tay trung t&acirc;m</strong></p>

<p><img alt="" src="https://kiavietnam.com.vn/storage/product/new-kiamorning/san-pham/noi-that/3-1.jpg" style="height:674px; width:1200px" /></p>

<h4><a href="https://kiavietnam.com.vn/chi-tiet-san-pham/new-morning/thong-so-ky-thuat#kich-thuoc-trong-luong">K&Iacute;CH THƯỚC - TRỌNG LƯỢNG</a></h4>

<table>
	<tbody>
		<tr>
			<th scope="row">K&iacute;ch thước tổng thể (DxRxC) / Overall dimensions</th>
			<td>3,595 x1,595x1,485</td>
		</tr>
		<tr>
			<th scope="row">Chiều d&agrave;i cơ sở / Wheel base</th>
			<td>2400</td>
		</tr>
		<tr>
			<th scope="row">Khoảng s&aacute;ng gầm xe / Minimum ground clearance</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">B&aacute;n k&iacute;nh quay v&ograve;ng / Minimum turning radius</th>
			<td>4700</td>
		</tr>
		<tr>
			<th scope="row">Trọng lượng Kh&ocirc;ng tải / Weight curb</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Trọng lượng To&agrave;n tải / Weight gross</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Dung t&iacute;ch th&ugrave;ng nhi&ecirc;n liệu / Fuel tank capacity</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Số chỗ ngồi / Seat capacity</th>
			<td>4</td>
		</tr>
	</tbody>
</table>

<h4><a href="https://kiavietnam.com.vn/chi-tiet-san-pham/new-morning/thong-so-ky-thuat#dong-co-hop-so">ĐỘNG CƠ - HỘP SỐ</a></h4>

<table>
	<tbody>
		<tr>
			<th scope="row">Kiểu / Model</th>
			<td>Xăng,1.25L- 83 Hp</td>
		</tr>
		<tr>
			<th scope="row">Loại / Type</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Dung t&iacute;ch xi lanh / Displacement</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">C&ocirc;ng suất cực đại / Max. power</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">M&ocirc; men xoắn cực đại / Max. torque</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hộp số / Transmission</th>
			<td>4AT</td>
		</tr>
		<tr>
			<th scope="row">Dẫn động / Wheel drive</th>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<h4><a href="https://kiavietnam.com.vn/chi-tiet-san-pham/new-morning/thong-so-ky-thuat#khung-gam">KHUNG G&Acirc;̀M</a></h4>

<table>
	<tbody>
		<tr>
			<th scope="row">Hệ thống treo trước /Suspension front</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống treo sau/Suspension rear</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống phanh trước / Brakes System Front</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống phanh sau / Brakes System Rear</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Phanh dừng / Parking Brake</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Cơ cấu l&aacute;i / Power Steering</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Lốp xe / Tires</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">M&acirc;m xe / Wheel</th>
			<td>M&acirc;m đ&uacute;c 15&rsquo;&rsquo;</td>
		</tr>
	</tbody>
</table>

<h4><a href="https://kiavietnam.com.vn/chi-tiet-san-pham/new-morning/thong-so-ky-thuat#ngoai-that">NGOẠI TH&Acirc;́T</a></h4>

<table>
	<tbody>
		<tr>
			<th scope="row">Đ&egrave;n pha Full LED điều chỉnh theo g&oacute;c l&aacute;i / Full LED headlamps with AFLS (Adaptive Front Lighting System)</th>
			<td>Halogen Projector</td>
		</tr>
		<tr>
			<th scope="row">Đ&egrave;n pha tự động / Auto headlamps</th>
			<td>-</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống rửa đ&egrave;n pha / Headlamp washers</th>
			<td>-</td>
		</tr>
		<tr>
			<th scope="row">Đ&egrave;n LED chạy ban ng&agrave;y / LED daytime running lights</th>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<th scope="row">Cụm đ&egrave;n sau dạng LED / LED rear combination lamps</th>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<th scope="row">Đ&egrave;n sương m&ugrave; dạng LED / LED Front fog lamps</th>
			<td>Halogen Projector</td>
		</tr>
		<tr>
			<th scope="row">Đ&egrave;n phanh lắp tr&ecirc;n cao / Hight Mounted Stop Lamp (HMSL)</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Viền cửa k&iacute;nh mạ Cr&ocirc;m / Belt-line chrome</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Tay nắm cửa mạ Cr&ocirc;m / Chrome belt-line</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Nẹp cốp sau mạ Cr&ocirc;m / Chrome rear garnish</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Gạt mưa tự động / Automatic wipers</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Đ&egrave;n ch&agrave;o / Welcome light</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Gương chiếu hậu ngo&agrave;i chỉnh điện, gập điện, sấy, t&iacute;ch hợp đ&egrave;n b&aacute;o rẽ / Electrically adjustable,heated, retractable outer mirror with LED repeated lamp</th>
			<td>Sấy/Gập điện</td>
		</tr>
		<tr>
			<th scope="row">Gương chiếu hậu nhớ vị tr&iacute;/ Integrated memory outside mirror position</th>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<h4><a href="https://kiavietnam.com.vn/chi-tiet-san-pham/new-morning/thong-so-ky-thuat#noi-that">NỘI THẤT</a></h4>

<table>
	<tbody>
		<tr>
			<th scope="row">K&iacute;nh c&aacute;ch &acirc;m, c&aacute;ch nhiệt / Solar, Acoustic laminated glass</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">K&iacute;nh sau tối m&agrave;u / Privacy rear glass</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Trần xe bọc da lộn / Chamude Suede roof trim</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Tay l&aacute;i bọc da / Leather steering wheel</th>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<th scope="row">Tay l&aacute;i t&iacute;ch hợp điều khiển &acirc;m thanh / Steering wheel with audio remote control</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Chế độ điện thoại rảnh tay / Handsfree phone</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Cần số điện tử SBW / SBW type Gear Knob</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">M&agrave;n h&igrave;nh hiển thị tr&ecirc;n k&iacute;nh HUD/ Head Up Display</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Tay l&aacute;i điều chỉnh bằng điện 4 hướng nhớ vị tr&iacute; / Electric tilt &amp; telescopic steering wheel with Integrated Memory</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Ghế l&aacute;i chỉnh điện t&iacute;ch hợp nhớ vị tr&iacute; / Power integrated memory system driver&#39;s seat</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Ghế phụ chỉnh điện t&iacute;ch hợp nhớ vị tr&iacute; / Power integrated memory system front passenger&#39;s seat</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">H&agrave;ng ghế sau điều chỉnh điện t&iacute;ch hợp đệm lưng / Power rear seat with lumbar support</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">M&agrave;n h&igrave;nh hiển thị đa th&ocirc;ng tin LCD 12.3 inch / Full TFT LCD 12.3&quot;</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">DVD,MP3,USB,AUX,Radio</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống loa Hi-end LEXICON 17 loa / LEXICON Hi- end System sound with 17 speakers</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống giải tr&iacute; h&agrave;ng ghế sau cao cấp / Premium rear seat entertainment system</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Tựa tay h&agrave;ng ghế sau t&iacute;ch hợp điều chỉnh &acirc;m thanh v&agrave; điều ho&agrave; / Rear armlest with audio and air condition remote control</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Sấy k&iacute;nh trước - sau / Power mirror heated - front / rear</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Điều h&ograve;a tự động 3 v&ugrave;ng độc lập / Triple zone Auto air conditioner</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống lọc kh&iacute; bằng ion / Clean air system</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống sưởi v&agrave; l&agrave;m m&aacute;t h&agrave;ng ghế trước - sau / Heated, Ventilated (Cooling) front - rear seats</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Cửa gi&oacute; h&agrave;ng ghế ph&iacute;a sau / Rear air vent</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Cửa sổ chỉnh điện chống kẹt/ All power safety window</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Gương chiếu hậu trong chống ch&oacute;i ECM / Electric Chromic Mirror</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Cửa sổ trời to&agrave;n cảnh / Panoramic Sunroof</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">R&egrave;m che nắng cửa sau chỉnh điện/ Power rear sunshade</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">R&egrave;m che nắng h&agrave;ng ghế sau / Rear curtain</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Ghế bọc Da Nappa / Nappa leather seat</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Cửa h&iacute;t tự động / Power door latch</th>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<h4><a href="https://kiavietnam.com.vn/chi-tiet-san-pham/new-morning/thong-so-ky-thuat#an-toan">AN TOÀN</a></h4>

<table>
	<tbody>
		<tr>
			<th scope="row">Hệ thống chống b&oacute; cứng phanh ABS / Anti-lock brake system</th>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống ph&acirc;n phối lực phanh điện tử EBD / Electronic brake-force distribution</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống hỗ trợ lực phanh khẩn cấp / Brake assist</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống c&acirc;n bằng điện tử ESP cao cấp / Premium electronic stability program</th>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống ổn định th&acirc;n xe cải tiến AVSM / Advanced Vehicle Safety Management</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống ga tự động th&ocirc;ng minh ASCC / Advance smart cruise control</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Phanh tay điện tử / Electric Parking Brake (EPB)</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống n&acirc;ng gầm điện tử / Electronic controlled suspension</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">4 chế độ vận h&agrave;nh th&ocirc;ng minh / Smart Drive Mode Select (Sport/Normal/Comfort &amp; Snow)</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Ch&igrave;a kho&aacute; th&ocirc;ng minh khởi động bằng n&uacute;t nhấn / Smat key with start stop button</th>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<th scope="row">Hệ thống chống trộm / Burglar alarm</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Chống sao ch&eacute;p ch&igrave;a kh&oacute;a / Immobilizer</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">D&acirc;y đai an to&agrave;n c&aacute;c h&agrave;ng ghế / All row seat belts</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">T&uacute;i kh&iacute; / Airbags</th>
			<td>2</td>
		</tr>
		<tr>
			<th scope="row">Kh&oacute;a cửa trung t&acirc;m / Central door lock</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Kh&oacute;a cửa tự động theo tốc độ / Speed sensing auto door lock</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Cảnh b&aacute;o điểm m&ugrave; BSD / Blind Spot Detect</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row">Cảm biến hỗ trợ đỗ xe trước sau / Front- Rear parking sensors</th>
			<td>Cảm biến v&agrave; camera sau l&ugrave;i</td>
		</tr>
		<tr>
			<th scope="row">Camera 360 độ / Around view camera</th>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<h4><a href="https://kiavietnam.com.vn/chi-tiet-san-pham/new-morning/thong-so-ky-thuat#muc-tieu-thu-nhien-lieu-l100km">MỨC TI&Ecirc;U THỤ NHI&Ecirc;N LIỆU (L/100KM)</a></h4>

<table>
	<tbody>
		<tr>
			<th>Kết hợp</th>
			<th>Trong đ&ocirc; thị</th>
			<th>Ngo&agrave;i đ&ocirc; thị</th>
		</tr>
		<tr>
			<th>5.82</th>
			<th>7.74</th>
			<th>4.68</th>
		</tr>
	</tbody>
</table>
', 0, 6, 1);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (12, N'Kính H2C inox tĩnh điện đen cho Yamaha', 110000, N'01.jpg', CAST(N'2021-09-11' AS Date), 1, 12, 100, N'<p><strong>K&iacute;nh H2C inox tĩnh điện m&agrave;u đen d&agrave;nh cho Yamaha</strong>, k&iacute;nh được gia c&ocirc;ng lấy thương hiệu H2C, sản phẩm mới toanh tr&ecirc;n thị trường, c&oacute; thiết kế như c&aacute;c d&ograve;ng xe Yamaha gắn chung, đang rất được nhiều Biker ưa chuộng bởi kiểu d&aacute;ng đẹp cũng như gi&aacute; th&agrave;nh rẻ.</p>
', 0, 1, 0);
INSERT Products (Id, Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES (13, N'Bộ 4 Tấm Chắn Nắng Ô Tô Xe Hơi Phản Quang', 53000, N'1.png', CAST(N'2021-05-13' AS Date), 1, 13, 100, N'<h1>Bộ 4 Tấm Chắn Nắng &Ocirc; T&ocirc; Xe Hơi Phản Quang, Tấm Che Nắng &Ocirc; T&ocirc; C&aacute;ch Nhiệt Chống Thấm, K&iacute;ch Thước Ti&ecirc;u Chuẩn Ph&ugrave; Hợp Với Tất Cả C&aacute;c Loại K&iacute;nh Xe</h1>
', 0, 0, 1);

INSERT Users (Id, Password, Fullname, Telephone, Email, Photo, Activated, Admin) VALUES (N'admin', N'123456', N'Đồng Đức Khang', 964772094, N'duc.khang165@gmail.com', N'30714389_173138760010464_1235140372791820288_n.jpg', 1, 1);
INSERT Users (Id, Password, Fullname, Telephone, Email, Photo, Activated, Admin) VALUES (N'hung123', N'123456', N'Nguyễn Văn Hùng', 977255117, N'hung@gmail.com', N'luan.jpg', 1, 2);
INSERT Users (Id, Password, Fullname, Telephone, Email, Photo, Activated, Admin) VALUES (N'huynhhuong', N'123456', N'Huynh Huong', 1234567890, N'lonzomcf@yahoo.com.vn', N'user.png', 1, 2);
INSERT Users (Id, Password, Fullname, Telephone, Email, Photo, Activated, Admin) VALUES (N'Longdz', N'123456', N'Long Hoang', 332467724, N'long@gmail.com', N'30714389_173138760010464_1235140372791820288_n.jpg', 1, 2);



