DROP TABLE IF EXISTS chitietmuon;
DROP TABLE IF EXISTS phieumuon;
DROP TABLE IF EXISTS banin;
DROP TABLE IF EXISTS docgia_sdt;
DROP TABLE IF EXISTS docgia;

DROP TABLE IF EXISTS sach;
DROP TABLE IF EXISTS tailieuquyhiem;

DROP TABLE IF EXISTS sangtac;
DROP TABLE IF EXISTS tacgia;
DROP TABLE IF EXISTS tailieu;
DROP TABLE IF EXISTS kesach;
DROP TABLE IF EXISTS nhanvien;
DROP TABLE IF EXISTS nhaxuatban;
DROP TABLE IF EXISTS phongdoc;

-- CREATE DATABASE QuanLyThuVien;-- 
USE QuanLyThuVien;
-- 1. Bảng PHONGDOC 
CREATE TABLE PhongDoc (
    maPD CHAR(5) PRIMARY KEY,
    tenPD NVARCHAR(50) NOT NULL,
    viTri NVARCHAR(100) NOT NULL,
    sucChua INT NOT NULL 
);
-- 2. Bảng KESACH
CREATE TABLE KeSach (
    maKeSach CHAR(5) PRIMARY KEY,
    soTang INT NOT NULL,
    tenKe NVARCHAR(50) NOT NULL,
    loaiTaiLieu NVARCHAR(50) NOT NULL,
    maPD CHAR(5) NOT NULL,
    FOREIGN KEY (maPD) REFERENCES PhongDoc(maPD)
);
-- 3. Bảng NHAXUATBAN
CREATE TABLE NhaXuatBan (
    maXB CHAR(5) PRIMARY KEY,
    tenXB NVARCHAR(100) NOT NULL,
    namThanhLap INT NOT NULL,
    truSo NVARCHAR(100)
);
CREATE TABLE TacGia (
    maTacGia CHAR(5) PRIMARY KEY,
    tenTacGia NVARCHAR(100) NOT NULL,
    ngaySinh DATE,
    quocTich NVARCHAR(50)
);
-- 5. Bảng TAILIEU (Bảng cha chứa thông tin chung)
CREATE TABLE TaiLieu (
    maTaiLieu CHAR(5) PRIMARY KEY,
    tenTaiLieu NVARCHAR(200) NOT NULL,
    namXuatBan INT NOT NULL,
    theLoai NVARCHAR(50) NOT NULL,
    ngonNgu NVARCHAR(50) NOT NULL DEFAULT N'Tiếng Việt',
    soTrang INT NOT NULL,
    maXB CHAR(5) NOT NULL,
    FOREIGN KEY (maXB) REFERENCES NhaXuatBan(maXB)
);
-- 6. Bảng SACH
CREATE TABLE Sach (
    maTaiLieu_s CHAR(5) PRIMARY KEY,
    lanTaiBan INT NOT NULL DEFAULT 1,
    ISBN CHAR(20) UNIQUE,
    FOREIGN KEY (maTaiLieu_s) REFERENCES TaiLieu(maTaiLieu)
);
-- 7. Bảng TAILIEUQUYHIEM
CREATE TABLE TaiLieuQuyHiem (
    maTaiLieu_TLQH CHAR(5) PRIMARY KEY,
    nguonGoc NVARCHAR(100),
    tinhTrangBaoQuan NVARCHAR(100) NOT NULL,
    giaTri DECIMAL(18, 2) DEFAULT 0.00,
    mucDoQuyHiem NVARCHAR(50),
    maKeSach CHAR(5) NOT NULL,
    FOREIGN KEY (maTaiLieu_TLQH) REFERENCES TaiLieu(maTaiLieu),
    FOREIGN KEY (maKeSach) REFERENCES KeSach(maKeSach)
);
-- 8. Bảng SANGTAC
CREATE TABLE SangTac (
    maTaiLieu CHAR(5),
    maTacGia CHAR(5),
    PRIMARY KEY (maTaiLieu, maTacGia),
    FOREIGN KEY (maTaiLieu) REFERENCES TaiLieu(maTaiLieu),
    FOREIGN KEY (maTacGia) REFERENCES TacGia(maTacGia)
);

-- 9. Bảng DOCGIA
CREATE TABLE DocGia (
    maDocGia CHAR(5) PRIMARY KEY,
    tenDocGia NVARCHAR(100) NOT NULL,
    diaChi NVARCHAR(200) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    ngaySinh DATE,
    CHECK (email LIKE '%@%')
);
-- 10. Bảng DOCGIA_SDT
CREATE TABLE DocGia_SDT (
    maDocGia CHAR(5),
    SDT CHAR(15) UNIQUE NOT NULL,
    PRIMARY KEY (maDocGia, SDT),
    FOREIGN KEY (maDocGia) REFERENCES DocGia(maDocGia)
);
-- 11. Bảng NHANVIEN
CREATE TABLE NhanVien (
    maNhanVien CHAR(5) PRIMARY KEY,
    tenNhanVien NVARCHAR(100) NOT NULL,
    ngaySinh DATE,
    chucVu NVARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    SDT CHAR(15) UNIQUE NOT NULL
);
-- 12. Bảng BanIn
CREATE TABLE BanIn (
    maBanIn CHAR(5),
    maTaiLieu_s CHAR(5) NOT NULL,
    ngayNhap DATE NOT NULL,
    maKeSach CHAR(5) NOT NULL,
    PRIMARY KEY (maBanIn, maTaiLieu_s),
    FOREIGN KEY (maTaiLieu_s) REFERENCES Sach(maTaiLieu_s), 
    FOREIGN KEY (maKeSach) REFERENCES KeSach(maKeSach)
);
-- 13. Bảng PHIEUMUON
CREATE TABLE PhieuMuon(
    maPhieuMuon CHAR(5) PRIMARY KEY,
    maDocGia CHAR(5) NOT NULL,
    maNhanVien CHAR(5) NOT NULL,
    ghiChu CHAR(200),
    FOREIGN KEY (maDocGia) REFERENCES DocGia(maDocGia),
    FOREIGN KEY (maNhanVien) REFERENCES NhanVien(maNhanVien)
);
-- 14. Bảng CHITIETMUON
CREATE TABLE ChiTietMuon (
    maPhieuMuon CHAR(5) ,
    maTaiLieu_s CHAR(5) ,
    maBanIn CHAR(5) ,
    PRIMARY KEY (maPhieuMuon, maBanIn, mataiLieu_s),
    ngayMuon DATE NOT NULL,
    hanTra DATE NOT NULL,
    trangThai NVARCHAR(50) NOT NULL DEFAULT N'Đang mượn',
    FOREIGN KEY (maPhieuMuon) REFERENCES PhieuMuon(maPhieuMuon), 
    FOREIGN KEY (maBanIn, maTaiLieu_s) REFERENCES BanIn(maBanIn, maTaiLieu_s), 
    CHECK (ngayMuon < hanTra),
    CHECK (trangThai IN (N'Đang mượn', N'Đã trả', N'Quá hạn'))
);






