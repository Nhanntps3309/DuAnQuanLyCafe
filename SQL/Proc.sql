CREATE PROCEDURE sp_ThongKeSanPham
AS 
BEGIN
    SELECT
        sp.TenSP AS TenSanPham,
        SUM(sp.SoLuongSP) AS SoLuongNhapVao,
        SUM(sp.SoLuongSP - ISNULL(hdct.SoLuongBanRa, 0)) AS SoLuongTonKho,
        ISNULL(hdct.SoLuongBanRa, 0) AS SoLuongBanRa
		 ---để kiểm tra và thay thế giá trị NULL bằng một giá trị khác
    FROM
        SanPham sp
    LEFT JOIN
        (
            SELECT
                MaSP,
                SUM(SoLuong) AS SoLuongBanRa
            FROM
                HoaDonChiTiet hdct
            GROUP BY
                MaSP
        ) hdct ON sp.MaSP = hdct.MaSP
    GROUP BY
        sp.TenSP, hdct.SoLuongBanRa
END
EXEC sp_ThongKeSanPham
GO

/*CREATE PROCEDURE sp_ThongKeDoanhThu
    @ThoiGianBatDau DATE,
    @ThoiGianKetThuc DATE
AS
BEGIN
    SELECT
        COUNT(*) AS SoSanPhamBanDuoc,
        MAX(Gia) AS GiaCaoNhat,
        MIN(Gia) AS GiaThapNhat,
        ROUND(AVG(Gia), 2) AS GiaTrungBinh,
        SUM(Gia * SoLuong) AS TongTien
    FROM
        HoaDon hd
	INNER JOIN 
		HoaDonChiTiet hdct ON hd.MaHD = hdct.MaHD
    WHERE
          hd.NgayTao >= @ThoiGianBatDau AND hd.NgayTao <= @ThoiGianKetThuc
END
*/
CREATE PROCEDURE sp_ThongKeDoanhThu
    @ThoiGianBatDau DATE,
    @ThoiGianKetThuc DATE
AS
BEGIN
    DECLARE @TienNhapHang DECIMAL(18, 2)--phần thập phân
    DECLARE @LoiNhuan DECIMAL(18, 2)

    -- Tính Tiền nhập hàng
    SELECT @TienNhapHang = SUM(sp.GiaNhap * sp.SoLuongSP)
    FROM GiaSanPham gsp
    INNER JOIN SanPham sp ON sp.MaSP = sp.MaSP

    -- Tính Doanh thu
    SELECT
        COUNT(*) AS SoSanPhamBanDuoc,
		@TienNhapHang AS TienNhapHang,
        MAX(hdct.Gia) AS GiaCaoNhat,
        MIN(hdct.Gia) AS GiaThapNhat,
        ROUND(AVG(hdct.Gia), 2) AS GiaTrungBinh,
        SUM(hdct.Gia * hdct.SoLuong) AS TienBanDuoc,        
        SUM(hdct.Gia * hdct.SoLuong) - @TienNhapHang AS LoiNhuan
    FROM
        HoaDon hd
	INNER JOIN 
		HoaDonChiTiet hdct ON hd.MaHD = hdct.MaHD
    WHERE
        hd.NgayTao >= @ThoiGianBatDau AND hd.NgayTao <= @ThoiGianKetThuc
END


GO
DECLARE @ThoiGianBatDau DATETIME
DECLARE @ThoiGianKetThuc DATETIME

SET @ThoiGianBatDau = '2023-01-01'
SET @ThoiGianKetThuc = '2023-12-31'

EXEC sp_ThongKeDoanhThu @ThoiGianBatDau, @ThoiGianKetThuc

GO
CREATE PROCEDURE sp_ThongKeSanPham
AS 
BEGIN
    SELECT
        sp.TenSP AS TenSanPham,
        SUM(sp.SoLuongSP) AS SoLuongNhapVao,
        CASE
            WHEN SUM(sp.SoLuongSP - ISNULL(hdct.SoLuongBanRa, 0)) < 0 THEN 0
            ELSE SUM(sp.SoLuongSP - ISNULL(hdct.SoLuongBanRa, 0))
        END AS SoLuongTonKho,
        ISNULL(hdct.SoLuongBanRa, 0) AS SoLuongBanRa
    FROM
        SanPham sp
    LEFT JOIN
        (
            SELECT
                MaSP,
                SUM(SoLuong) AS SoLuongBanRa
            FROM
                HoaDonChiTiet hdct
            GROUP BY
                MaSP
        ) hdct ON sp.MaSP = hdct.MaSP
    GROUP BY
        sp.TenSP, hdct.SoLuongBanRa
END