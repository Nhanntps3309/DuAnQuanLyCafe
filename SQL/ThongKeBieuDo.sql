CREATE PROCEDURE sp_thongkebieudo
    @ThoiGian int -- 2022
AS
BEGIN
   	DECLARE @Thang1 DECIMAL(18, 2)
	DECLARE @Thang2 DECIMAL(18, 2)
	DECLARE @Thang3 DECIMAL(18, 2)
	DECLARE @Thang4 DECIMAL(18, 2)
  	DECLARE @Thang5 DECIMAL(18, 2)
	DECLARE @Thang6 DECIMAL(18, 2)
	DECLARE @Thang7 DECIMAL(18, 2)
	DECLARE @Thang8 DECIMAL(18, 2)
    DECLARE @Thang9 DECIMAL(18, 2)
	DECLARE @Thang10 DECIMAL(18, 2)
	DECLARE @Thang11 DECIMAL(18, 2)
	DECLARE @Thang12 DECIMAL(18, 2)

	-- 2022
	select @Thang1 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 1

		select @Thang2 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 2

		select @Thang3 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 3

		select @Thang4 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 4

			select @Thang5 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 5

			select @Thang6 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 6

			select @Thang7 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 7

			select @Thang8 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 8

			select @Thang9 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 9

			select @Thang10 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 10

				select @Thang11 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 11

				select @Thang12 = sum(hd.tongtien) from hoadon hd
	where year(hd.ngaytao) = @ThoiGian
	and month(hd.ngaytao) = 12

	select @Thang1 as thang1,@Thang2 as thang2 ,@Thang3 as thang3,@Thang4 as thang4, 
	 @Thang5 as thang5,  @Thang6 as thang6,   @Thang7 as thang7,  @Thang8 as thang8,
	  @Thang9 as thang9,  @Thang10 as thang10,  @Thang11 as thang11,  @Thang12 as thang12

end
exec dbo.sp_thongkebieudo 2023

----------------------------- ? d??i ko ch?y 
