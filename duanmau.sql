CREATE DATABASE FINALPOLY
USE FINALPOLY
GO
-- ChucVu
CREATE TABLE ChucVu(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(50) DEFAULT NULL
)
GO
-- CuaHang
CREATE TABLE CuaHang(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(50) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
ThanhPho NVARCHAR(50) DEFAULT NULL,
QuocGia NVARCHAR(50) DEFAULT NULL
)
GO
-- NhanVien
CREATE TABLE NhanVien(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30) DEFAULT NULL,
TenDem NVARCHAR(30) DEFAULT NULL,
Ho NVARCHAR(30) DEFAULT NULL,
GioiTinh NVARCHAR(10) DEFAULT NULL,
NgaySinh DATE DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
MatKhau VARCHAR(MAX) DEFAULT NULL,
IdCH UNIQUEIDENTIFIER,
IdCV UNIQUEIDENTIFIER,
IdGuiBC UNIQUEIDENTIFIER,
TrangThai INT DEFAULT 0
)
GO
-- KhachHang
CREATE TABLE KhachHang(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30),
TenDem NVARCHAR(30) DEFAULT NULL,
Ho NVARCHAR(30) DEFAULT NULL,
NgaySinh DATE DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
ThanhPho NVARCHAR(50) DEFAULT NULL,
QuocGia NVARCHAR(50) DEFAULT NULL,
MatKhau VARCHAR(MAX) DEFAULT NULL
)
GO
--HoaDon
CREATE TABLE HoaDon(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdKH UNIQUEIDENTIFIER,
IdNV UNIQUEIDENTIFIER,
Ma VARCHAR(20) UNIQUE,
NgayTao DATE DEFAULT NULL,
NgayThanhToan DATE DEFAULT NULL,
NgayShip DATE DEFAULT NULL,
NgayNhan DATE DEFAULT NULL,
TinhTrang INT DEFAULT 0,
TenNguoiNhan NVARCHAR(50) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
)
GO
CREATE TABLE GioHang(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdKH UNIQUEIDENTIFIER,
IdNV UNIQUEIDENTIFIER,
Ma VARCHAR(20) UNIQUE,
NgayTao DATE DEFAULT NULL,
NgayThanhToan DATE DEFAULT NULL,
TenNguoiNhan NVARCHAR(50) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
TinhTrang INT DEFAULT 0
)
GO
-- SanPham
CREATE TABLE SanPham(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30)
)
GO
-- NSX
CREATE TABLE NSX(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30)
)
GO
-- MauSac
CREATE TABLE MauSac(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30)
)
GO
-- DongSP
CREATE TABLE DongSP(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30)
)
GO
-- ChiTietSP
CREATE TABLE ChiTietSP(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdSP UNIQUEIDENTIFIER,
IdNsx UNIQUEIDENTIFIER,
IdMauSac UNIQUEIDENTIFIER,
IdDongSP UNIQUEIDENTIFIER,
NamBH INT DEFAULT NULL,
MoTa NVARCHAR(50) DEFAULT NULL,
SoLuongTon INT,
GiaNhap DECIMAL(20,0) DEFAULT 0,
GiaBan DECIMAL(20,0) DEFAULT 0,
)

GO
-- HoaDonChiTiet
CREATE TABLE HoaDonChiTiet(
IdHoaDon UNIQUEIDENTIFIER,
IdChiTietSP UNIQUEIDENTIFIER,
SoLuong INT,
DonGia DECIMAL(20,0) DEFAULT 0,
CONSTRAINT PK_HoaDonCT PRIMARY KEY (IdHoaDon,IdChiTietSP),
CONSTRAINT FK1 FOREIGN KEY(IdHoaDon) REFERENCES HoaDon(Id),
CONSTRAINT FK2 FOREIGN KEY(IdChiTietSP) REFERENCES ChiTietSP(Id),
)
GO
CREATE TABLE GioHangChiTiet(
IdGioHang UNIQUEIDENTIFIER,
IdChiTietSP UNIQUEIDENTIFIER,
SoLuong INT,
DonGia DECIMAL(20,0) DEFAULT 0,
DonGiaKhiGiam DECIMAL(20,0) DEFAULT 0,
CONSTRAINT PK_GioHangCT PRIMARY KEY (IdGioHang,IdChiTietSP),
CONSTRAINT FK1_IdGioHang FOREIGN KEY(IdGioHang) REFERENCES GioHang(Id),
CONSTRAINT FK2_IdChiTietSP FOREIGN KEY(IdChiTietSP) REFERENCES ChiTietSP(Id),
)
GO
--T?O QUAN H? GI?A CÁC B?NG
--NhanVien - CuaHang
ALTER TABLE NhanVien ADD FOREIGN KEY (IdCH) REFERENCES CuaHang(Id)
--NhanVien - ChucVu
ALTER TABLE NhanVien ADD FOREIGN KEY (IdCV) REFERENCES ChucVu(Id)
--NhanVien - GuiBaoCao
ALTER TABLE NhanVien ADD FOREIGN KEY (IdGuiBC) REFERENCES NhanVien(Id)
-- HoaDon - KhachHang
ALTER TABLE HoaDon ADD FOREIGN KEY (IdKH) REFERENCES KhachHang(Id)
-- GioHang - KhachHang
ALTER TABLE GioHang ADD FOREIGN KEY (IdKH) REFERENCES KhachHang(Id)
-- HoaDon - NhanVien
ALTER TABLE HoaDon ADD FOREIGN KEY (IdNV) REFERENCES NhanVien(Id)
-- ChiTietSP - SanPham
ALTER TABLE ChiTietSP ADD FOREIGN KEY(IdSP) REFERENCES SanPham(Id)
-- ChiTietSP - NSX
ALTER TABLE ChiTietSP ADD FOREIGN KEY(IdNsx) REFERENCES Nsx(Id)
-- ChiTietSP - MauSac
ALTER TABLE ChiTietSP ADD FOREIGN KEY(IdMauSac) REFERENCES MauSac(Id)
-- ChiTietSP - DongSP
ALTER TABLE ChiTietSP ADD FOREIGN KEY(IdDongSP) REFERENCES DongSP(Id)

insert into ChucVu (Ma,Ten) VALUES (N'NV01',N'Nhân Viên')
insert into ChucVu (Ma,Ten) VALUES (N'QL01',N'Quản lý')
insert into ChucVu (Ma,Ten) VALUES (N'NV02',N'Nhân Viên')
insert into ChucVu (Ma,Ten) VALUES (N'NV03',N'Nhân Viên')
insert into ChucVu (Ma,Ten) VALUES (N'NV04',N'Nhân Viên')

insert into CuaHang (Ma,Ten,DiaChi,ThanhPho,QuocGia) VALUES (N'CH01',N'Bách hóa xanh',N'Phương Canh, Nam Từ Liêm',N'Hà Nội',N'Việt Nam')
insert into CuaHang (Ma,Ten,DiaChi,ThanhPho,QuocGia) VALUES (N'CH02',N'WinMart',N'Xuân Phương, Nam Từ Liêm',N'Hà Nội',N'Việt Nam')
insert into CuaHang (Ma,Ten,DiaChi,ThanhPho,QuocGia) VALUES (N'CH03',N'Circle K',N'Cổng Vĩnh, Hoài Đức',N'Hà Nội',N'Việt Nam')
insert into CuaHang (Ma,Ten,DiaChi,ThanhPho,QuocGia) VALUES (N'CH04',N'WinMart',N'Cầu Diễn, Nam Từ Liêm',N'Hà Nội',N'Việt Nam')
insert into CuaHang (Ma,Ten,DiaChi,ThanhPho,QuocGia) VALUES (N'CH05',N'WinMart',N'Mễ Trì, Nam Từ Liêm',N'Hà Nội',N'Việt Nam')

--NhanVien, KhachHang, HoaDon, GioHang, SanPham

INSERT INTO [dbo].[NhanVien]
           ([Ma],[Ten],[TenDem],[Ho],[GioiTinh],[NgaySinh],[DiaChi],[Sdt],[MatKhau],[TrangThai])
     VALUES
           (N'NV01',N'Đức',N'Trung',N'Lê',N'Nam','19960106',N'Nam Từ Liêm','0333489777','ledt20789',1)
		   ,(N'NV02',N'Hải',N'Trung','Lê',N'Nam','19980106',N'Bắc Từ Liêm','0388489777','hailt20789',1)
		   ,(N'NV03',N'Đạt',N'Quốc',N'Đỗ',N'Nam','19990106',N'Nam Từ Liêm','0366489777','datdq20789',1)
		   ,(N'NV04',N'Văn',N'Quốc',N'Nguyễn',N'Nam','19990106',N'Hoàng Mai','0396489777','vannq0789',1)
		   ,(N'QL01',N'Trung',N'Văn',N'Trần',N'Nam','19990106',N'Hà Đông','0345254786','trungtv20789',1)

INSERT INTO [dbo].[KhachHang]
           ([Ma],[Ten],[TenDem],[Ho],[NgaySinh],[Sdt],[DiaChi],[ThanhPho],[QuocGia],[MatKhau])
     VALUES
           (N'KH101',N'Khánh',N'Quốc',N'Nguyễn',N'20060630','0977885965',N'Nam Từ Liêm',N'Hà Nội',N'Việt Nam','khanhnq090608')
		   ,(N'KH102',N'Anh',N'Quang',N'Nguyễn',N'20030915','0974568741',N'Bắc Từ Liêm',N'Hà Nội',N'Việt Nam','anhnq090608')
		   ,(N'KH103',N'Hải',N'Minh',N'Lê',N'20020506','0911223548',N'Hoàng Mai',N'Hà Nội',N'Việt Nam','hailm090608')
		   ,(N'KH104',N'Việt',N'Tiến',N'Trần',N'20010519','0956452189',N'Hà Đông',N'Hà Nội',N'Việt Nam','viettt090608')
		   ,(N'KH105',N'Đức',N'Văn',N'Chu',N'20070802','0902031035',N'Bắc Từ Liêm',N'Hà Nội',N'Việt Nam','duccv090608')
		   ,(N'KH106',N'Anh',N'Việt',N'Nguyễn',N'20040709','0901030025',N'Nam Từ Liêm',N'Hà Nội',N'Việt Nam','anhnv090608')
		   ,(N'KH107',N'Lâm',N'Quốc',N'Lê',N'20031231','0965897456',N'Hoàng Mai',N'Hà Nội',N'Việt Nam','lamlq090608')
		   ,(N'KH108',N'Đăng',N'Hải',N'Nguyễn',N'19990807','09612139874',N'Hà Đông',N'Hà Nội',N'Việt Nam','hangctb090608')

INSERT INTO [dbo].[HoaDon]
           ([IdKH],[IdNV],[Ma],[NgayTao],[NgayThanhToan],[NgayShip],[NgayNhan],[TinhTrang],[TenNguoiNhan],[DiaChi],[Sdt])
     VALUES
           (N'A1D28AD4-4363-4ED8-9F64-09259D99EDDE',N'0AB789BD-6F47-4745-9A05-08D20DAA3B9A',N'HD101',N'20220506',N'20220507',N'20220507',N'20220507',1,N'Khánh',N'Nam Từ Liêm','0977885965')
		   ,(N'9AC24A6A-D6AB-45D2-8C25-C8AAC21F8877',N'21367A3F-E4B7-4349-8842-FC4F3A4DE11F',N'HD102',N'20220703',N'20220709',N'20220709',N'20220709',1,N'Quang Anh',N'Bắc Từ Liêm','0974568741')
		   ,(N'44963015-F7CB-487C-BF35-170FF1F2BDE7',N'CAAA07C5-71C2-4B6B-B6E3-32099EA9A256',N'HD103',N'20220802',N'20220812',N'20220812',N'20220812',1,N'Hải',N'Hoàng Mai','0911223548')
		   ,(N'92513C68-320A-4CBC-8F28-63AE46B59D47',N'0AB789BD-6F47-4745-9A05-08D20DAA3B9A',N'HD104',N'20221220',N'20221223',N'20221223',N'20221223',1,N'Việt',N'Hà Đông','0956452189')
		   ,(N'379E7FD3-C6EE-487E-BBBA-74DF869D5DBB',N'21367A3F-E4B7-4349-8842-FC4F3A4DE11F',N'HD105',N'20220102',N'20220130',N'20220130',N'20220130',1,N'Đức',N'Bắc Từ Liêm','0902031035')
		   ,(N'68BF0D78-E33F-4FDB-A7C7-BAB2C9DDE577',N'E263545D-E993-4EAA-8F38-96057B4287A1',N'HD106',N'20220802',N'20220812',N'20220112',N'20220709',1,N'Anh',N'Nam Từ Liêm','0911223548')
		   ,(N'8185A7A5-662B-42BE-A7D6-865060C088C6',N'CAAA07C5-71C2-4B6B-B6E3-32099EA9A256',N'HD107',N'20220321',N'20220321',N'20220322',N'20220322',1,N'Lâm',N'Hoàng Mai','0965897456')
		   ,(N'0C8A239B-5F6C-478D-805C-E5F0AB217420',N'0AB789BD-6F47-4745-9A05-08D20DAA3B9A',N'HD108',N'20220802',N'20220812',N'20220812',N'20220812',1,N'Anh',N'Hà Đông','0961213987')

INSERT INTO [dbo].[SanPham]
           ([Ma],[Ten])
     VALUES
           ('SP01',N'Khoai tây doritto')
		   ,('SP02',N'Bắp cải rang vị tảo biển')
		   ,('SP03',N'Cá viên chiên vị mặn')
		   ,('SP04',N'Bim bim Oreo')
		   ,('SP05',N'Thịt bò sấy khô vị cay')
		   ,('SP06',N'Khoai tây snack tảo biển')
		   ,('SP07',N'Khoai tây snack cay')
		   ,('SP08',N'Bim bim Tunies 2')
		   ,('SP09',N'Thịt heo đóng hộp')
		   ,('SP010',N'Nước giải khát coke cole')

INSERT INTO [dbo].[NSX]
           ([Ma]
           ,[Ten])
     VALUES
           ('NSX01','POTATOCHIP')
		   ,('NSX02','CHIPCOKES')
		   ,('NSX03','FRESH N FOOD')

INSERT INTO [dbo].[MauSac]
           ([Ma]
           ,[Ten])
     VALUES
           ('red',N'Đỏ')
		   ,('blue',N'Xanh')
		   ,('green',N'Vàng')

INSERT INTO [dbo].[DongSP]
           ([Ma]
           ,[Ten])
     VALUES
           ('Coke',N'Nước giải khát')
		   ,('Vegetable',N'Rau củ quả')
		   ,('Meat',N'Thịt')
		   ,('Chips',N'Đồ ăn vặt')

INSERT INTO [dbo].[ChiTietSP]
           ([IdSP]
           ,[IdNsx]
           ,[IdMauSac]
           ,[IdDongSP]
           ,[NamBH]
           ,[MoTa] 
           ,[SoLuongTon]
           ,[GiaNhap]
           ,[GiaBan])
     VALUES
           ('84e4fef3-faad-4bca-b0c3-76a68d0eddf8','4a3fecf1-2ff2-49b0-a734-2f9e718eb8cd','855eba7d-3d56-4104-8cf1-242fe614f0ce','a24536c7-eb55-442f-8bfa-b23adc7049ad','2021',N'Còn hàng',20,20000,30000)
		   ,('84e4fef3-faad-4bca-b0c3-76a68d0eddf8','4a3fecf1-2ff2-49b0-a734-2f9e718eb8cd','0c06ddc7-180a-4307-98a8-a587b6d0cb56','a24536c7-eb55-442f-8bfa-b23adc7049ad','2021',N'Còn hàng',20,20000,30000)
		   ,('9f2a58d0-1c0a-4364-8807-cfda5845c0fd','e143a159-1b39-4930-90eb-3a77885326c0','0c06ddc7-180a-4307-98a8-a587b6d0cb56','ac3cd1df-0912-4c7e-ad5e-7dea3bdd1182','2020',N'Còn hàng',30,25000,35000)
		   ,('9f2a58d0-1c0a-4364-8807-cfda5845c0fd','e143a159-1b39-4930-90eb-3a77885326c0','855eba7d-3d56-4104-8cf1-242fe614f0ce','ac3cd1df-0912-4c7e-ad5e-7dea3bdd1182','2020',N'Còn hàng',30,25000,35000)
		   ,('ce2e7c39-50cd-4711-a92c-39ff993da4e6','e143a159-1b39-4930-90eb-3a77885326c0','7554f5f9-3b89-4fb2-97d4-5931d4af3ba1','afac1c85-5487-4b02-a3d7-537c7ab11434','2021',N'Còn hàng',50,30000,50000)
		   ,('4192e5c7-7934-43e8-93c4-3b18355a093c','4a3fecf1-2ff2-49b0-a734-2f9e718eb8cd','0c06ddc7-180a-4307-98a8-a587b6d0cb56','a24536c7-eb55-442f-8bfa-b23adc7049ad','2020',N'Còn hàng',50,15000,20000)
		   ,('d67d5122-7c19-47a8-8a9b-700df176b453','4a3fecf1-2ff2-49b0-a734-2f9e718eb8cd','855eba7d-3d56-4104-8cf1-242fe614f0ce','a24536c7-eb55-442f-8bfa-b23adc7049ad','2020',N'Còn hàng',60,50000,65000)
		   ,('3ba28144-8274-45cb-b8a8-b850f580aef9','4a3fecf1-2ff2-49b0-a734-2f9e718eb8cd','7554f5f9-3b89-4fb2-97d4-5931d4af3ba1','a24536c7-eb55-442f-8bfa-b23adc7049ad','2021',N'Còn hàng',70,50000,60000)
		   ,('6eb41180-ca82-4afc-9146-3b7966556d33','509b5f9c-eaa4-4d5f-88a0-dcb2fad263ea','7554f5f9-3b89-4fb2-97d4-5931d4af3ba1','4d650080-1243-48e6-93d0-7672c8c43693','2020',N'Còn hàng',60,7000,10000)
		   ,('6eb41180-ca82-4afc-9146-3b7966556d33','509b5f9c-eaa4-4d5f-88a0-dcb2fad263ea','0c06ddc7-180a-4307-98a8-a587b6d0cb56','4d650080-1243-48e6-93d0-7672c8c43693','2020',N'Còn hàng',60,7000,10000)

	

INSERT INTO [dbo].[HoaDonChiTiet]
           ([IdHoaDon],[IdChiTietSP],[SoLuong],[DonGia])
     VALUES
           ('ecd2e60e-a83b-4770-8692-51ae7a7897f5','ca1e3b61-62d2-4ea6-b69c-05ac9e991cda',2,120000)
		  ,('47a79867-3248-47f9-abb4-9f87b53e6663','a2c411ab-2e70-45bb-8c8b-39189b7f6d1e',10,350000)
		  ,('aa693aa9-7f54-4a55-bbe5-653398494682','ff392b49-2ea1-4c2d-870b-b16597586ea0',5,100000)
		  ,('8489ce99-222c-4ea7-b06d-68649ae0109c','cc2b91cf-8929-43b1-bc9c-9fe6d282d14a',7,210000)
		  ,('81706ade-fc1a-4f0a-aa0e-df55b6e65146','02d7aa0c-12ff-4e55-84e2-eb10fb824f24',10,100000)
		  ,('e97be32b-4250-44c6-8a71-0d718f0ab2ed','c68a28f3-c43c-451f-9564-cf387638a436',3,105000)
		  ,('ccc35f6c-2683-41b2-952d-cdbecbedc22f','93474484-4be1-4892-9d2d-0c200b5d970e',10,100000)
		  ,('09927889-8DF3-45FA-9C1B-5C84358730E6','a2c411ab-2e70-45bb-8c8b-39189b7f6d1e',10,350000)


INSERT INTO [dbo].[GioHang]
           ([IdKH]
           ,[IdNV]
           ,[Ma]
           ,[NgayTao]
           ,[NgayThanhToan]
           ,[TenNguoiNhan]
           ,[DiaChi]
           ,[Sdt]
           ,[TinhTrang])
     VALUES
           ('a1d28ad4-4363-4ed8-9f64-09259d99edde','0ab789bd-6f47-4745-9a05-08d20daa3b9a','GH01','20220801','2022-05-06',N'Khánh',N'Nam Từ Liêm','0977885965',1)
		  ,('9ac24a6a-d6ab-45d2-8c25-c8aac21f8877','21367a3f-e4b7-4349-8842-fc4f3a4de11f','GH02','20220701','2022-07-01',N'Quang Anh',N'Bắc Từ Liêm','0974568741',1)
		  ,('44963015-f7cb-487c-bf35-170ff1f2bde7','caaa07c5-71c2-4b6b-b6e3-32099ea9a256','GH03','20220801','2022-08-01',N'Hải',N'Hoàng Mai','0911223548',1)
		  ,('92513c68-320a-4cbc-8f28-63ae46b59d47','0ab789bd-6f47-4745-9a05-08d20daa3b9a','GH04','20221216','2022-12-18',N'Việt',N'Hà Đông','0956452189',1)
		  ,('379e7fd3-c6ee-487e-bbba-74df869d5dbb','0ab789bd-6f47-4745-9a05-08d20daa3b9a','GH05','20220101','2022-01-01',N'Đức',N'Bắc Từ Liêm','0902031035',1)
		  ,('68bf0d78-e33f-4fdb-a7c7-bab2c9dde577','e263545d-e993-4eaa-8f38-96057b4287a1','GH06','20020801','2022-08-02',N'Anh',N'Nam Từ Liêm','0911223548',1)
		  ,('8185a7a5-662b-42be-a7d6-865060c088c6','caaa07c5-71c2-4b6b-b6e3-32099ea9a256','GH07','20220320','2022-03-21',N'Lâm',N'Hoàng Mai','0965897456',1)
		  ,('a1d28ad4-4363-4ed8-9f64-09259d99edde','0ab789bd-6f47-4745-9a05-08d20daa3b9a','GH08','20220730','2022-08-02',N'Anh',N'Hà Đông','0961213987',1)



INSERT INTO [dbo].[GioHangChiTiet]
           ([IdGioHang]
           ,[IdChiTietSP]
           ,[SoLuong]
           ,[DonGia]
           ,[DonGiaKhiGiam])
     VALUES
           ('82DB1217-9DC5-4EB6-9C33-750A17615D1D','ca1e3b61-62d2-4ea6-b69c-05ac9e991cda',2,120000,120000)
		  ,('6CB650DF-EA6F-4DA2-8F81-1C49FB3917C2','a2c411ab-2e70-45bb-8c8b-39189b7f6d1e',10,350000,350000)
		  ,('9DB13D8F-F831-4293-8712-F3793F537A69','ff392b49-2ea1-4c2d-870b-b16597586ea0',5,100000,100000)
		  ,('3D869D2A-C24B-4249-A5F9-784BB11A17F7','cc2b91cf-8929-43b1-bc9c-9fe6d282d14a',7,210000,210000)
		  ,('8F774DCE-55E9-4E49-809E-3F3FC14F506A','02d7aa0c-12ff-4e55-84e2-eb10fb824f24',10,100000,100000)
		  ,('58D4DEF5-19CF-40BA-99E7-65B63C09A117','c68a28f3-c43c-451f-9564-cf387638a436',3,105000,105000)
		  ,('1670895A-1C48-478A-8FFE-6F6382F4DEE7','93474484-4be1-4892-9d2d-0c200b5d970e',10,100000,100000)
		  ,('771D752E-46F1-4A21-8F10-A1D919AD881D','a2c411ab-2e70-45bb-8c8b-39189b7f6d1e',10,350000,350000)



  IF  EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES Where Table_Schema = 'dbo'  AND Table_Name ='SanPham2')
BEGIN
     drop table SanPham2
END


  select identity(int,1,1) as STT ,A.Ma,A.Ten, NamBH, SoLuongTon, GiaNhap, GiaBan ,C.Ten as MauSac, E.Ten as DongSP,D.Ten as NSX, MoTa
  into SanPham2
  from SanPham A join ChiTietSP B on A.Id=B.IdSP join MauSac C on B.IdMauSac=C.Id join NSX D on B.IdNsx=D.Id join DongSP E on B.IdDongSP=E.Id
  IF  EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES Where Table_Schema = 'dbo'  AND Table_Name ='SanPham2')

     select * from SanPham2


  delete SanPham2


