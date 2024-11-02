/*
CREATE TABLE Chi_Nhanh(
	IDchinhanh varchar(10) Primary key not null,
	Diachi VARCHAR(20),
)

CREATE TABLE Chu_Chi_Nhanh(
	CCCD VARCHAR(10) PRIMARY KEY NOT NULL,
	Ten VARCHAR(50),
	DiaChi VARCHAR(30),
	SDT VARCHAR(10) NOT NULL,
	IDchinhanh varchar(10),
	FOREIGN KEY (IDchinhanh) references Chi_Nhanh(IDchinhanh) ON DELETE CASCADE ON UPDATE CASCADE,
)
CREATE TABLE DonViCungCap(
	IDdonvicungcap varchar(10) primary key not null,
	TenDVCC varchar(30),
	DiaChi varchar(30),
	SDT varchar(10) not null, 
)

create TABLE PHIEU_DAT(
	IDdathang VARCHAR(20) PRIMARY KEY NOT NULL,
	CCCD varchar(10) not null,
	IDdonvicungcap varchar(10) not null,
	Thoigiandat date not null,
	Soluongdat INT NOT NULL,
	foreign key (CCCD) references Chu_Chi_Nhanh(CCCD) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (IDdonvicungcap) references DonViCungCap(IDdonvicungcap) ON DELETE CASCADE ON UPDATE CASCADE,
)

create table CONG_VIEC(
	IDcongviec varchar(10) primary key not null,
	Tencongviec varchar(20) not null,
)

create table LUONG(
	IDcongviec varchar(10) unique not null references CONG_VIEC(IDcongviec) ON DELETE CASCADE ON UPDATE CASCADE,
	Luongcung int not null,
	Luongthuong int not null,
	)

create table NHAN_VIEN(
	IDnhanvien varchar(10) not NULL primary key,
	TenNV varchar(50) not null,
	DiachiNV varchar(100) not null,
	IDcongviec varchar(10) not null references CONG_VIEC(IDcongviec) ON DELETE CASCADE ON UPDATE CASCADE,
	IDchinhanh varchar(10) not null references Chi_Nhanh(IDchinhanh) ON DELETE CASCADE ON UPDATE CASCADE,
	)

CREATE TABLE SAN_PHAM(
  IDsanpham VARCHAR(10) NOT NULL PRIMARY KEY,
  Tensanpham VARCHAR(30) NOT NULL,
  Giaban INT NOT NULL,
  Soluong INT NOT NULL,
  IDdonvicungcap VARCHAR(10) NOT NULL REFERENCES DonViCungCap(IDdonvicungcap) ON DELETE CASCADE ON UPDATE CASCADE,
  IDnhanvien varchar(10) NOT NULL REFERENCES NHAN_VIEN(IDnhanvien) ON DELETE CASCADE ON UPDATE CASCADE,
  )
CREATE TABLE KHACH_HANG(
  IDkhachhang VARCHAR(20) NOT NULL PRIMARY KEY,
  TenKH VARCHAR(50) NOT NULL,
  Gioitinh VARCHAR(5) CHECK (Gioitinh IN ('Nam', 'Nu')),
  )
CREATE TABLE KHACH_HANG_SDT(
   IDkhachhang VARCHAR(20) NOT NULL REFERENCES KHACH_HANG(IDkhachhang) ON DELETE CASCADE ON UPDATE CASCADE,
   SDT varchar(10) not null,
   )
CREATE TABLE HOA_DON(
  IDhoadon VARCHAR(20) NOT NULL PRIMARY KEY,
  IDkhachhang VARCHAR(20) NOT NULL REFERENCES KHACH_HANG(IDkhachhang) ON DELETE CASCADE ON UPDATE CASCADE,
  IDnhanvien VARCHAR(10) NOT NULL REFERENCES NHAN_VIEN(IDnhanvien) ON DELETE CASCADE ON UPDATE CASCADE,
  NgayGD DATETIME NOT NULL,
  Tongtien INT NOT NULL,
  )

CREATE TABLE Bao_gom (
    IDhoadon VARCHAR(20) NOT NULL,
    IDsanpham VARCHAR(10) NOT NULL,
    SoLuong INT NOT NULL,
    PRIMARY KEY (IDhoadon, IDsanpham),
    FOREIGN KEY (IDhoadon) REFERENCES HOA_DON(IDhoadon),
    FOREIGN KEY (IDsanpham) REFERENCES SAN_PHAM(IDsanpham),
) 

CREATE TABLE KHACH_THUONG(
    IDKH_thuong VARCHAR(20) NOT NULL PRIMARY KEY,
    Voucher VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY(IDKH_thuong) REFERENCES KHACH_HANG(IDkhachhang) ON DELETE CASCADE ON UPDATE CASCADE,
    )

CREATE TABLE KHACH_LAU_NAM(
  IDKH_vip VARCHAR(20) NOT NULL PRIMARY KEY,
  Thethanhvien VARCHAR(20) NOT NULL UNIQUE,
  FOREIGN KEY (IDKH_vip) REFERENCES KHACH_HANG(IDkhachhang) ON DELETE CASCADE ON UPDATE CASCADE,
  ) 

CREATE TABLE NHAN_VIEN_SDT(
   IDnhanvien VARCHAR(10) NOT NULL REFERENCES NHAN_VIEN(IDnhanvien) ON DELETE CASCADE ON UPDATE CASCADE,
   SDT VARCHAR(10) NOT NULL,
   )

BULK INSERT Chi_Nhanh
FROM 'D:\MY_PROJECT\BTL_DATABASE\Chi_Nhanh.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2            -- Bỏ qua hàng tiêu đề
);

BULK INSERT Chu_Chi_Nhanh
FROM 'D:\MY_PROJECT\BTL_DATABASE\Chu_Chi_Nhanh.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT DonViCungCap
FROM 'D:\MY_PROJECT\BTL_DATABASE\Don_Vi_Cung_Cap.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT phieu_dat
FROM 'D:\MY_PROJECT\BTL_DATABASE\Phieu_Dat.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT cong_viec
FROM 'D:\MY_PROJECT\BTL_DATABASE\Cong_Viec.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT luong
FROM 'D:\MY_PROJECT\BTL_DATABASE\Luong.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT NHAN_VIEN
FROM 'D:\MY_PROJECT\BTL_DATABASE\Nhan_Vien.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT SAN_PHAM
FROM 'D:\MY_PROJECT\BTL_DATABASE\San_Pham.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT KHACH_HANG
FROM 'D:\MY_PROJECT\BTL_DATABASE\Khach_Hang.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT KHACH_HANG_SDT
FROM 'D:\MY_PROJECT\BTL_DATABASE\Khach_Hang_SDT.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT HOA_DON
FROM 'D:\MY_PROJECT\BTL_DATABASE\Hoa_Don.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT BAO_GOM
FROM 'D:\MY_PROJECT\BTL_DATABASE\Bao_Gom.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT khach_thuong
FROM 'D:\MY_PROJECT\BTL_DATABASE\Khach_Thuong.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT khach_lau_nam
FROM 'D:\MY_PROJECT\BTL_DATABASE\Khach_Lau_Nam.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);

BULK INSERT nhan_vien_sdt
FROM 'D:\MY_PROJECT\BTL_DATABASE\NHAN_VIEN_SDT.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Dấu phân cách giữa các cột
    ROWTERMINATOR = '\n',   -- Dấu phân cách giữa các hàng
    FIRSTROW = 2           -- Bỏ qua hàng tiêu đề
);
*/







