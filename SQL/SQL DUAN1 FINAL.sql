Create database THECOFFEE_DUAN1
Go

Use THECOFFEE_DUAN1
Go

Drop database THECOFFEE_DUAN1 

Create table NhanVien(
MaNV int identity(1,1) primary key,
MatKhau varchar(100) not null,
HoTen nvarchar(50) not null,
VaiTro int not null,
Email varchar(50) not null,
SDT varchar(20) not null,
NgaySinh date not null,
GioiTinh bit not null,
Hinh varchar(50) null,
DiaChi nvarchar(50) not null,
TrangThai bit not null
)


Create table SanPham (
MaSP int identity(1,1) primary key,
TenSP nvarchar(50) unique not null,
SoLuongSP int not null,
MaNV int foreign key references NhanVien(MaNV),
MoTa nvarchar(50),
Hinh varchar(50)  null,
LoaiSP nvarchar(20) not null,
GiaNhap float not null
)

Create table GiaSanPham (
MaGSP int identity(1,1) primary key,
MaSP int foreign key references SanPham(MaSP),
Size nvarchar(20) not null,
Gia float not null
)


Create table HoaDon(
MaHD int identity(1,1) primary key,
NgayTao date not null,
MaNV int foreign key references NhanVien(MaNV),
TienKhach float null,
TongTien float null,
TrangThai bit not null,
GhiChu nvarchar(50) null
)
drop table HoaDon
drop table HoaDonChiTiet
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
ThoiGianBD date not null,
ThoiGianKT date not null,
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
('123', N'Nguyễn Thành Nhân', 1, 'nhan@gmail.com', 123456789, '1990-01-01', 1, 'hinh1.jpg', N'Bến Tre', 1),
('123', N'Trần Vũ Giang', 2, 'giang@gmail.com', 987654321, '1995-02-15', 0, 'hinh2.jpg', N'Vũng Tàu', 1),
('123', N'Nguyễn Thái Bảo', 1, 'bao@gmail.com', 555555555, '1985-06-20', 1, 'hinh3.jpg', N'Long An', 0),
('123', N'Lâm Hoài Thương', 3, 'thuong@gmail.com', 111111111, '2000-03-10', 1, 'hinh4.jpg', N'TP HCM', 1),
('123', N'Phan Văn Trí', 2, 'tri@gmail.com', 222222222, '1992-12-05', 0, 'hinh5.jpg', N'Bình Thuận', 0);

-- Chèn dữ liệu vào bảng SanPham
INSERT INTO SanPham (TenSP, SoLuongSP, MaNV, MoTa, Hinh, LoaiSP,GiaNhap)
VALUES
(N'Trà sữa trân châu', 20, 1, N'Mô tả sản phẩm 1', 'hinh1.jpg', N'Trà',10000),
(N'Trà đào', 0, 2, N'Mô tả sản phẩm 2', 'hinh2.jpg', N'Trà',10000),
(N'Trà vải', 15, 4, N'Mô tả sản phẩm 4', 'hinh4.jpg', N'Trà',10000),
(N'Caffee sữa', 6, 3, N'Mô tả sản phẩm 3', 'hinh3.jpg', N'Caffee',10000),
(N'Sting', 13, 4, N'Mô tả sản phẩm 4', 'hinh4.jpg', N'Nước ngọt',10000),
(N'7UP', 0, 4, N'Mô tả sản phẩm 4', 'hinh4.jpg', N'Nước ngọt',10000),
(N'Caffee đen', 17, 4, N'Mô tả sản phẩm 4', 'hinh4.jpg', N'Caffee',10000),
(N'Trà sữa socola', 5, 5, N'Mô tả sản phẩm 5', 'hinh5.jpg', N'Trà',10000);

-- Chèn dữ liệu vào bảng GiaSanPham
INSERT INTO GiaSanPham (MaSP, Size, Gia)
VALUES
(1, N'Size M', 17000),
(1, N'Size L', 20000),
(2, N'Size M', 15000),
(2, N'Size L', 18000),
(3, N'Size M', 15000),
(3, N'Size L', 18000),
(4, N'Size M', 15000),
(4, N'Size L', 17000),
(5, N'Chai', 12000),
(6, N'Chai', 12000),
(7, N'Size M', 12000),
(7, N'Size L', 15000),
(8, N'Size M', 20000),
(8, N'Size L', 25000);
-- Chèn dữ liệu vào bảng HoaDon
INSERT INTO HoaDon (NgayTao, MaNV, TienKhach,TongTien, TrangThai, GhiChu)
VALUES
('2023-01-10', 1, 0,null, 0, N'Ghi chú hóa đơn 1'),
('2023-02-15', 2, 0,null, 0, N'Ghi chú hóa đơn 2'),
('2023-03-20', 3, 0,null, 0, N'Ghi chú hóa đơn 3'),
('2023-04-05', 4, 0,null, 0, N'Ghi chú hóa đơn 4'),
('2023-05-15', 5, 0,null, 0, N'Ghi chú hóa đơn 5');

-- Chèn dữ liệu vào bảng HoaDonChiTiet
INSERT INTO HoaDonChiTiet (MaHD, MaSP, SoLuong, Gia, Size, PTKhuyenMai)
VALUES
(1, 1, 2, 200000, N'Size M', 0.1),
(2, 2, 3, 240000, N'Size L', 0.15),
(3, 3, 1, 90000, N'Size M', 0.05),
(4, 4, 4, 520000, N'Size L', 0.2),
(5, 5, 2, 180000, N'Chai', 0.1);

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


CREATE PROCEDURE sp_ThongKeSanPham
AS 
BEGIN
    SELECT
        sp.TenSP AS TenSanPham,
        SUM(sp.SoLuongSP) AS SoLuongNhapVao,
        SUM(sp.SoLuongSP - ISNULL(hdct.SoLuongBanRa, 0)) AS SoLuongTonKho,
        ISNULL(hdct.SoLuongBanRa, 0) AS SoLuongBanRa
    FROM
        SanPham sp
    LEFT JOIN
        (
            SELECT
                hdct.MaSP,
                SUM(hdct.SoLuong) AS SoLuongBanRa
            FROM
                HoaDonChiTiet hdct
                INNER JOIN HoaDon hd ON hdct.MaHD = hd.MaHD
            WHERE
                hd.TrangThai = 1 -- Hóa đơn đã được thanh toán
            GROUP BY
                hdct.MaSP
        ) hdct ON sp.MaSP = hdct.MaSP
    GROUP BY
        sp.TenSP, hdct.SoLuongBanRa
END

EXEC sp_ThongKeSanPham
GO


CREATE OR ALTER PROCEDURE sp_ThongKeDoanhThu
    @ThoiGianBatDau DATE,
    @ThoiGianKetThuc DATE
AS
BEGIN
    DECLARE @Soluong INT
    DECLARE @TienNhapHang DECIMAL(18, 2)
    DECLARE @Tiencaonhat DECIMAL(18, 2)
    DECLARE @Tienthapnhat DECIMAL(18, 2)
    DECLARE @TienTB DECIMAL(18, 2)
	DECLARE @Tienbanduoc DECIMAL(18, 2)
    DECLARE @LoiNhuan DECIMAL(18, 2)
  
   

    SELECT @Tiencaonhat = MAX(hd.tongtien),
           @Tienthapnhat = MIN(hd.tongtien),
           @TienTB = AVG(hd.tongtien)
    FROM HoaDon hd
    WHERE hd.NgayTao >= @ThoiGianBatDau
      AND hd.NgayTao <= @ThoiGianKetThuc
      AND hd.TrangThai = 1

    SELECT @TienNhapHang = SUM(sp.GiaNhap)
    FROM SanPham sp

    SELECT @Soluong = SUM(hdct.SoLuong)
    FROM HoaDonChiTiet hdct
    JOIN HoaDon hd ON hdct.MaHD = hd.MaHD
    WHERE hd.NgayTao >= @ThoiGianBatDau
      AND hd.NgayTao <= @ThoiGianKetThuc
      AND hd.TrangThai = 1

	   SELECT @Tienbanduoc = SUM(hd.Tongtien)
    FROM HoaDon hd
    WHERE hd.NgayTao >= @ThoiGianBatDau
      AND hd.NgayTao <= @ThoiGianKetThuc
      AND hd.TrangThai = 1

    SELECT @LoiNhuan = SUM(hd.Tongtien) - @TienNhapHang
    FROM HoaDon hd
    WHERE hd.NgayTao >= @ThoiGianBatDau
      AND hd.NgayTao <= @ThoiGianKetThuc
      AND hd.TrangThai = 1

   

    SELECT @soluong AS soluong,
           FORMAT(@TienNhapHang, '#,##0.00') AS tienhaphang,
           FORMAT(@Tiencaonhat, '#,##0.00') AS tiecaonhat,
           FORMAT(@Tienthapnhat, '#,##0.00') AS tienthapnhat,
           FORMAT(@TienTB, '#,##0.00') AS tientb,
           FORMAT(@LoiNhuan, '#,##0.00') AS loinhuan,
           FORMAT(@Tienbanduoc, '#,##0.00') AS tongtien
END
exec dbo.sp_ThongKeDoanhThu '2023-10-1', '2023-15-5'

GO

create or alter proc MaxMaNV
as
begin
SELECT MAX(Manv) as Max
FROM NhanVien
end

----------------------------- Ở dưới ko chạy 
