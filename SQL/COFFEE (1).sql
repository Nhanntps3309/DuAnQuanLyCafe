Create database QuanLyQuanCaPhe_DuAn1
Go

Use QuanLyQuanCaPhe_DuAn1
Go


Create table NhanVien(
MaNV int identity(1,1) primary key,
MatKhau varchar(100) not null,
HoTen nvarchar(50) not null,
VaiTro int not null,
Email varchar(50) not null,
SDT int not null,
NgaySinh date not null,
GioiTinh bit not null,
Hinh varchar(50) null,
DiaChi nvarchar(50) not null,
TrangThai bit not null
)


Create table SanPham (
MaSP int identity(1,1) primary key,
TenSP nvarchar(50) not null,
TrangThai bit not null,
MaNV int foreign key references NhanVien(MaNV),
MoTa nvarchar(50),
Hinh varchar(50)  null,
LoaiSP nvarchar(20) not null
)

Create table GiaSanPham (
MaGSP int identity(1,1) primary key,
MaSP int foreign key references SanPham(MaSP),
Size nvarchar(20),
Gia float not null
)


Create table HoaDon(
MaHD int identity(1,1) primary key,
NgayTao date not null,
MaNV int foreign key references NhanVien(MaNV),
TienKhach float null,
TrangThai bit not null,
GhiChu nvarchar(50) null
)

Create table HoaDonChiTiet(
MaHDCT int identity(1,1) primary key,
MaHD int foreign key references HoaDon(MaHD) not null,
MaSP int foreign key references SanPham(MaSP) not null,
SoLuong int not null,
Gia float not null,
Size nvarchar(20) not null,
PTKhuyenMai float not null
)

Create table KhuyenMai(
MaKM int identity(1,1) primary key,
ThoiGianBD date,
ThoiGianKT date,
TenKM nvarchar(50) not null,
PTKhuyenMai float not null,
MaNV int foreign key references NhanVien(MaNV) not null
)
Create table KhuyenMaiChiTiet(
MaKMCT int identity(1,1) primary key,
MaSP int foreign key references SanPham(MaSP) not null,
MaKM int foreign key references KhuyenMai(MaKM) not null
)


-- Chèn dữ liệu vào bảng NhanVien
INSERT INTO NhanVien (MatKhau, HoTen, VaiTro, Email, SDT, NgaySinh, GioiTinh, Hinh, DiaChi, TrangThai)
VALUES
('password1', N'Họ và tên 1', 1, 'email1@example.com', 123456789, '1990-01-01', 1, 'hinh1.jpg', N'Địa chỉ 1', 1),
('password2', N'Họ và tên 2', 2, 'email2@example.com', 987654321, '1995-02-15', 0, 'hinh2.jpg', N'Địa chỉ 2', 1),
('password3', N'Họ và tên 3', 1, 'email3@example.com', 555555555, '1985-06-20', 1, 'hinh3.jpg', N'Địa chỉ 3', 0),
('password4', N'Họ và tên 4', 3, 'email4@example.com', 111111111, '2000-03-10', 1, 'hinh4.jpg', N'Địa chỉ 4', 1),
('password5', N'Họ và tên 5', 2, 'email5@example.com', 222222222, '1992-12-05', 0, 'hinh5.jpg', N'Địa chỉ 5', 0);

-- Chèn dữ liệu vào bảng SanPham
INSERT INTO SanPham (TenSP, TrangThai, MaNV, MoTa, Hinh, LoaiSP)
VALUES
(N'Tên sản phẩm 1', 1, 1, N'Mô tả sản phẩm 1', 'hinh1.jpg', N'Loại 1'),
(N'Tên sản phẩm 2', 1, 2, N'Mô tả sản phẩm 2', 'hinh2.jpg', N'Loại 2'),
(N'Tên sản phẩm 3', 0, 3, N'Mô tả sản phẩm 3', 'hinh3.jpg', N'Loại 1'),
(N'Tên sản phẩm 4', 1, 4, N'Mô tả sản phẩm 4', 'hinh4.jpg', N'Loại 2'),
(N'Tên sản phẩm 5', 0, 5, N'Mô tả sản phẩm 5', 'hinh5.jpg', N'Loại 1');

-- Chèn dữ liệu vào bảng GiaSanPham
INSERT INTO GiaSanPham (MaSP, Size, Gia)
VALUES
(1, N'Size M', 100000),
(2, N'Size L', 120000),
(3, N'Size S', 90000),
(4, N'Size XL', 130000),
(5, N'Size M', 95000);

-- Chèn dữ liệu vào bảng HoaDon
INSERT INTO HoaDon (NgayTao, MaNV, TienKhach, TrangThai, GhiChu)
VALUES
('2023-01-10', 1, 500000, 1, N'Ghi chú hóa đơn 1'),
('2023-02-15', 2, 800000, 0, N'Ghi chú hóa đơn 2'),
('2023-03-20', 3, 600000, 1, N'Ghi chú hóa đơn 3'),
('2023-04-05', 4, 750000, 1, N'Ghi chú hóa đơn 4'),
('2023-05-15', 5, 900000, 0, N'Ghi chú hóa đơn 5');

-- Chèn dữ liệu vào bảng HoaDonChiTiet
INSERT INTO HoaDonChiTiet (MaHD, MaSP, SoLuong, Gia, Size, PTKhuyenMai)
VALUES
(1, 1, 2, 200000, N'Size M', 0.1),
(2, 2, 3, 240000, N'Size L', 0.15),
(3, 3, 1, 90000, N'Size S', 0.05),
(4, 4, 4, 520000, N'Size XL', 0.2),
(5, 5, 2, 180000, N'Size M', 0.1);

-- Chèn dữ liệu vào bảng KhuyenMai
INSERT INTO KhuyenMai (ThoiGianBD, ThoiGianKT, TenKM, PTKhuyenMai, MaNV)
VALUES
('2023-01-01', '2023-01-15', N'Khuyến mãi 1', 0.1, 1),
('2023-02-10', '2023-02-28', N'Khuyến mãi 2', 0.15, 2),
('2023-03-05', '2023-03-20', N'Khuyến mãi 3', 0.2, 3),
('2023-04-15', '2023-04-30', N'Khuyến mãi 4', 0.1, 4),
('2023-05-10', '2023-05-25', N'Khuyến mãi 5', 0.15, 5);

-- Chèn dữ liệu vào bảng KhuyenMaiChiTiet
INSERT INTO KhuyenMaiChiTiet (MaSP, MaKM)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

select * from SanPham 
where MaSP not in (select KhuyenMaiChiTiet.MaSP from KhuyenMaiChiTiet)

select * from SanPham 
where MaSP  in (select KhuyenMaiChiTiet.MaSP from KhuyenMaiChiTiet)

-- Proc HoaDon
CREATE PROCEDURE GetHoaDonInfo
AS
BEGIN
    SELECT 
        HD.MaHD,
        HD.NgayTao,
        HD.MaNV,
        HDCT.MaSP,
        HDCT.SoLuong,
        HDCT.Size,
        HDCT.PTKhuyenMai,
        GiaSauKhuyenMai = HDCT.Gia * (1 - HDCT.PTKhuyenMai),
        HD.GhiChu
    FROM 
        HoaDon HD
    JOIN 
        HoaDonChiTiet HDCT ON HD.MaHD = HDCT.MaHD;
END;

DROP PROCEDURE GetHoaDonInfo;

EXECUTE GetHoaDonInfo;

SELECT * FROM HoaDon ORDER BY MaHD DESC

select * from SanPham
select TenSP from SanPham
where LoaiSP like N'Loại 2'


select * from HoaDon
select * from HoaDonChiTiet