/*
Câu 1: Lấy thông tin về tất cả nhân viên  số điện thoại bắt đầu bằng '08'

Select nhan_vien.IDnhanvien,NHAN_VIEN.tennv,NHAN_VIEN_SDT.SDT
from NHAN_VIEN
join NHAN_VIEN_SDT on NHAN_VIEN_SDT.IDnhanvien = NHAN_VIEN.IDnhanvien
where NHAN_VIEN_SDT.SDT like '08%';
*/
/*
Câu 2: Lấy thông tin chi nhánh ở Cầu Giấy
select * from Chi_Nhanh where Diachi = 'Cau Giay';
*/
/*Câu 3: Lấy thông tin về tất cả khách hàng thường có hóa đơn có số tiền thanh toán lớn hơn 900 000 
select *
from KHACH_THUONG
join KHACH_HANG on KHACH_THUONG.IDKH_thuong = KHACH_HANG.IDkhachhang
join HOA_DON on KHACH_HANG.IDkhachhang = HOA_DON.IDkhachhang
where HOA_DON.Tongtien > 900000
*/
/* Câu 4: Lấy thông tin về tất cả đơn vị cung cấp cung cấp sản phẩm có số lượng tồn kho lớn hơn 90 
select * 
from DonViCungCap
join SAN_PHAM on DonViCungCap.IDdonvicungcap = SAN_PHAM.IDdonvicungcap
where SAN_PHAM.Soluong > 90
*/
/* Câu 5: Lấy danh sách các hóa đơn được tạo bởi những khách hàng VIP (lâu năm), bao gồm thông tin về hóa đơn và khách hàng 
SELECT KHACH_HANG.TenKH, HOA_DON.IDhoadon, Bao_gom.SoLuong
FROM KHACH_HANG
JOIN HOA_DON ON KHACH_HANG.IDkhachhang = HOA_DON.IDkhachhang
JOIN Bao_gom ON HOA_DON.IDhoadon = Bao_gom.IDhoadon
JOIN KHACH_LAU_NAM ON KHACH_HANG.IDkhachhang = KHACH_LAU_NAM.IDKH_vip;
*/
/*Câu 6:  Lấy danh sách các sản phẩm mà khách hàng "Vu Van Nhan" đã đặt hàng trong các hóa đơn: 
SELECT KH.TenKH, SP.Tensanpham, BG.SoLuong
FROM KHACH_HANG KH
JOIN HOA_DON HD ON KH.IDkhachhang = HD.IDkhachhang
JOIN Bao_gom BG ON HD.IDhoadon = BG.IDhoadon
JOIN SAN_PHAM SP ON BG.IDsanpham = SP.IDsanpham
WHERE KH.TenKH = 'Vu Van Nhan';
*/
/* Câu 7: Lấy danh sách tất cả sản phẩm được cung cấp bởi các đơn vị cung cấp ở chi nhánh 'Soc Son' 
SELECT SAN_PHAM.Tensanpham, SAN_PHAM.Giaban, SAN_PHAM.Soluong, DonViCungCap.TenDVCC
FROM SAN_PHAM
JOIN DonViCungCap ON SAN_PHAM.IDdonvicungcap = DonViCungCap.IDdonvicungcap
JOIN NHAN_VIEN ON SAN_PHAM.IDnhanvien = NHAN_VIEN.IDnhanvien
JOIN Chi_Nhanh ON NHAN_VIEN.IDchinhanh = Chi_Nhanh.IDchinhanh
WHERE Chi_Nhanh.Diachi = 'Soc Son';
*/
/* Câu 8:Lấy danh sách các đơn vị cung cấp và tổng số sản phẩm mà mỗi đơn vị cung cấp đã cung cấp 
SELECT DonViCungCap.TenDVCC, COUNT(SAN_PHAM.IDsanpham) AS TongSoSanPham
FROM DonViCungCap
LEFT JOIN SAN_PHAM ON DonViCungCap.IDdonvicungcap = SAN_PHAM.IDdonvicungcap
GROUP BY DonViCungCap.TenDVCC;
*/
/*Câu 9:  lấy thông tin khách hàng mua nhiều hơn 1 lần 
select KHACH_HANG.IDkhachhang, KHACH_HANG.TenKH, COUNT(*) as So_Lan_mua
from KHACH_HANG
join HOA_DON on KHACH_HANG.IDkhachhang = HOA_DON.IDkhachhang
group by KHACH_HANG.IDkhachhang, KHACH_HANG.TenKH
having count(*) >1;
*/
/* Câu 10: Liệt kê những chi nhánh mà khách hàng có ID KH002 chưa mua hàng. 
SELECT Chi_Nhanh.IDchinhanh FROM Chi_Nhanh
EXCEPT
(SELECT DISTINCT Chi_Nhanh.IDchinhanh
FROM ((Chi_Nhanh INNER JOIN NHAN_VIEN
ON Chi_Nhanh.IDchinhanh = NHAN_VIEN.IDchinhanh)
INNER JOIN HOA_DON
ON HOA_DON.IDnhanvien = NHAN_VIEN.IDnhanvien)
INNER JOIN KHACH_HANG
ON KHACH_HANG.IDkhachhang = HOA_DON.IDkhachhang
WHERE KHACH_HANG.IDkhachhang = 'KH002'
)
*/
/* Câu 11:  In ra tên và số tiền mỗi chi nhánh phải trả cho nhân viên 
SELECT Chi_Nhanh.IDchinhanh,Sum(LUONG.Luongcung + LUONG.Luongthuong) as 'TỔNG TIỀN LƯƠNG CHI TRẢ CHO NHÂN VIÊN'
FROM ((Chi_Nhanh INNER JOIN NHAN_VIEN
ON NHAN_VIEN.IDchinhanh = Chi_Nhanh.IDchinhanh)
INNER JOIN CONG_VIEC
ON NHAN_VIEN.IDcongviec = CONG_VIEC.IDcongviec)
INNER JOIN LUONG
ON CONG_VIEC.IDcongviec = LUONG.IDcongviec
GROUP BY Chi_Nhanh.IDchinhanh
*/
