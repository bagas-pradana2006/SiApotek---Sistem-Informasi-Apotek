CREATE DATABASE Apotek_V2;

USE Apotek_V2;

-- 1. Tabel Users (Menggabungkan Admin & Pelanggan)
CREATE TABLE users(
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50),
    role VARCHAR(20),
    nama_lengkap VARCHAR(100),
    no_hp VARCHAR(15)
);

-- 2. Tabel Supplier
CREATE TABLE supplier(
    id_supplier VARCHAR(10) PRIMARY KEY,
    nama_supplier VARCHAR(50),
    alamat VARCHAR(100),
    no_telp VARCHAR(15)
);

-- 3. Tabel Obat (Sekarang ada 2 harga)
CREATE TABLE obat(
    id_obat VARCHAR(10) PRIMARY KEY,
    nama_obat VARCHAR(50),
    kategori VARCHAR(30),
    harga_beli INT, -- Harga kulakan dari supplier
    harga_jual INT, -- Harga jual ke pelanggan
    stok INT
);

-- 4. Tabel Transaksi Penjualan (Uang Masuk)
CREATE TABLE transaksi_jual(
    id_jual VARCHAR(15) PRIMARY KEY,
    tanggal DATE,
    username VARCHAR(50), -- Siapa yang beli / kasir yang melayani
    sumber VARCHAR(30), -- Isinya nanti: 'Admin Kasir' atau 'Pelanggan'
    total INT
);

-- 5. Tabel Detail Penjualan (Keranjang Jual)
CREATE TABLE detail_jual(
    id_detail VARCHAR(20) PRIMARY KEY,
    id_jual VARCHAR(15),
    id_obat VARCHAR(10),
    jumlah INT,
    subtotal INT
);

-- 6. Tabel Transaksi Pembelian / Restock (Uang Keluar)
CREATE TABLE transaksi_beli(
    id_beli VARCHAR(15) PRIMARY KEY,
    tanggal DATE,
    id_supplier VARCHAR(10),
    total INT
);

-- 7. Tabel Detail Pembelian (Keranjang Restock)
CREATE TABLE detail_beli(
    id_detail VARCHAR(20) PRIMARY KEY,
    id_beli VARCHAR(15),
    id_obat VARCHAR(10),
    jumlah INT,
    subtotal INT
);

-- MASUKKAN DATA AWAL (Akun Admin)
INSERT INTO users VALUES ('admin', 'admin123', 'admin', 'Administrator Utama', '08123456789');

USE Apotek_V2;

-- ==============================================
-- 1. INSERT DATA SUPPLIER (10 Data)
-- ==============================================
INSERT INTO supplier (id_supplier, nama_supplier, alamat, no_telp) VALUES 
('S001', 'PT Kimia Farma Tbk', 'Jl. Veteran No 9, Jakarta Pusat', '021-11122233'),
('S002', 'PT Kalbe Farma Tbk', 'Cempaka Putih, Jakarta Pusat', '021-44455566'),
('S003', 'PT Sanbe Farma', 'Cimahi, Bandung', '022-77788899'),
('S004', 'PT Dexa Medica', 'Bintaro, Tangerang Selatan', '021-99900011'),
('S005', 'PT Pharos Indonesia', 'Kebayoran Lama, Jakarta Selatan', '021-22233344'),
('S006', 'PT Darya-Varia Laboratoria', 'Gunung Putri, Bogor', '0251-5556667'),
('S007', 'PT Konimex', 'Grogol, Sukoharjo', '0271-8889990'),
('S008', 'PT Tempo Scan Pacific', 'Kuningan, Jakarta Selatan', '021-12312312'),
('S009', 'PT Bayer Indonesia', 'Cimanggis, Depok', '021-45645645'),
('S010', 'PT Novell Pharmaceutical', 'Kebon Jeruk, Jakarta Barat', '021-78978978');


-- ==============================================
-- 2. INSERT DATA OBAT (15 Data)
-- ==============================================
-- Keterangan: 
-- harga_beli = modal dari supplier, harga_jual = harga untuk pelanggan
-- Beberapa stok disengaja di bawah 10 agar muncul di "Laporan Stok Menipis"
-- Beberapa stok disengaja 0 agar bisa dites pakai fitur "Restock Admin"

INSERT INTO obat (id_obat, nama_obat, kategori, harga_beli, harga_jual, stok) VALUES 
('OB001', 'Paracetamol 500mg', 'Tablet', 2000, 3500, 150),
('OB002', 'Amoxicillin 500mg', 'Kapsul', 5000, 8000, 100),
('OB003', 'Promag Obat Maag', 'Tablet', 6000, 9000, 5),   -- Stok menipis
('OB004', 'Komix OBH', 'Sirup', 12000, 16000, 0),         -- Stok HABIS (Harus direstock)
('OB005', 'Betadine Antiseptic 10g', 'Salep', 15000, 20000, 35),
('OB006', 'Bodrex Migra', 'Tablet', 2500, 4000, 200),
('OB007', 'Sanmol Anak', 'Sirup', 18000, 23000, 45),
('OB008', 'Kalpanax Krim', 'Salep', 10000, 14000, 8),     -- Stok menipis
('OB009', 'Diapet Anti Diare', 'Kapsul', 5500, 8000, 80),
('OB010', 'Antangin JRG', 'Sirup', 13000, 17000, 120),
('OB011', 'Oskadon Sakit Kepala', 'Tablet', 2000, 3500, 50),
('OB012', 'Panadol Extra', 'Tablet', 8000, 12000, 0),     -- Stok HABIS (Harus direstock)
('OB013', 'Counterpain Krim 30g', 'Salep', 35000, 43000, 15),
('OB014', 'Sangobion Penambah Darah', 'Kapsul', 15000, 20000, 60),
('OB015', 'Woods Antitussive', 'Sirup', 26000, 33000, 40);

-- Selesai!