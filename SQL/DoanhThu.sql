create or alter PROCEDURE ThongKeDoanhThu
    @ThoiGianBatDau DATE,
    @ThoiGianKetThuc DATE
AS
BEGIN



    DECLARE @TienNhapHang DECIMAL(18, 2)--ph?n th?p phân
	DECLARE @Tiencaonhat DECIMAL(18, 2)
	DECLARE @Tienthapnhat DECIMAL(18, 2)
	DECLARE @TienTB DECIMAL(18, 2)
    DECLARE @LoiNhuan DECIMAL(18, 2)
	DECLARE @Tienbanduoc DECIMAL(18, 2)
	DECLARE @Soluong int

select @Tiencaonhat = max(hd.tongtien) , @Tienthapnhat = min(hd.tongtien), @TienTB = avg(hd.tongtien)
from HoaDon hd
where
hd.NgayTao >= @ThoiGianBatDau AND hd.NgayTao <= @ThoiGianKetThuc
		and hd.TrangThai = 1

select @TienNhapHang = sum(sp.GiaNhap)
from SanPham sp

select @Soluong = sum(hdct.SoLuong)
from HoaDonChiTiet hdct join HoaDon hd
on hdct.MaHD = hd.MaHD
where 
hd.NgayTao >= @ThoiGianBatDau AND hd.NgayTao <= @ThoiGianKetThuc
		and hd.TrangThai = 1

select @LoiNhuan = sum(hd.Tongtien) - @TienNhapHang
from HoaDon hd
where
hd.NgayTao >= @ThoiGianBatDau AND hd.NgayTao <= @ThoiGianKetThuc
		and hd.TrangThai = 1

select @Tienbanduoc = sum(hd.Tongtien)
from HoaDon hd
where
hd.NgayTao >= @ThoiGianBatDau AND hd.NgayTao <= @ThoiGianKetThuc
		and hd.TrangThai = 1

select @soluong as soluong,@TienNhapHang as tienhaphang,  @Tiencaonhat as tiecaonhat,
@Tienthapnhat as tienthapnhat, @TienTB as tientb, @LoiNhuan as loinhuan,
@Tienbanduoc as tongtien

end

exec dbo.sp_ThongKeDoanhThu '2022-2-15', '2023-2-15'