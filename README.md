# 💊 Apotek V2 Management System

![JAVA](https://img.shields.io/badge/JAVA-orange?style=for-the-badge)
![GUI](https://img.shields.io/badge/GUI-blue?style=for-the-badge)
![SQL SERVER](https://img.shields.io/badge/SQL%20SERVER-red?style=for-the-badge)
![OOP](https://img.shields.io/badge/OOP-purple?style=for-the-badge)
![JDBC](https://img.shields.io/badge/JDBC-green?style=for-the-badge)
![STATUS](https://img.shields.io/badge/STATUS-COMPLETED-brightgreen?style=for-the-badge)

Sistem manajemen apotek berbasis Java GUI dengan fitur login multi-role, manajemen stok obat, transaksi penjualan, dan laporan apotek yang terintegrasi dengan SQL Server.

---

## ✨ Fitur

- 🔐 **Login & Register Multi-Role** — Sistem autentikasi dengan role Admin dan Pelanggan menggunakan UserSession
- 🏥 **Kelola Data Obat** — CRUD lengkap data obat dengan 2 harga (Harga Beli & Harga Jual)
- 🚚 **Kelola Data Supplier** — CRUD data supplier pemasok obat
- 📦 **Fitur Restock Obat** — Admin dapat melakukan pembelian obat ke supplier, stok otomatis bertambah
- 🛒 **Kasir Penjualan (Admin)** — Transaksi penjualan oleh kasir, stok otomatis berkurang
- 🛍️ **Toko Pelanggan** — Pelanggan dapat berbelanja obat secara mandiri melalui aplikasi
- 📊 **Laporan Apotek** — 3 jenis laporan: Stok Menipis, Pemasukan (Penjualan), dan Pengeluaran (Restock)
- 🔒 **Role-Based Access Control** — Admin dan Pelanggan memiliki halaman dan akses yang berbeda

---

## 🗂️ Struktur Project
Apotek_V2
└── src/apotek_v2/
├── KoneksiDB.java        → Pusat koneksi database (OOP)
├── UserSession.java      → Manajemen sesi login
├── Form_Login.java       → Halaman login
├── Form_Register.java    → Pendaftaran akun pelanggan
├── Form_MenuAdmin.java   → Dashboard admin
├── Form_Obat.java        → Kelola data obat
├── Form_Supplier.java    → Kelola data supplier
├── Form_Restock.java     → Transaksi beli obat ke supplier
├── Form_Kasir.java       → Transaksi penjualan oleh kasir
├── Form_Laporan.java     → Laporan apotek
└── Form_TokoPelanggan.java → Halaman belanja pelanggan

---

## 🗄️ Struktur Database

Database: `Apotek_V2`

| Tabel | Fungsi |
|-------|--------|
| `users` | Menyimpan data akun login (Admin & Pelanggan) |
| `obat` | Master data obat dengan harga beli & jual |
| `supplier` | Master data supplier |
| `transaksi_jual` | Header transaksi penjualan |
| `detail_jual` | Detail item transaksi penjualan |
| `transaksi_beli` | Header transaksi restock/pembelian obat |
| `detail_beli` | Detail item transaksi restock |

---

## 🔄 Alur Aplikasi
[Form_Login]
│
├── Role: Admin ──► [Form_MenuAdmin]
│                        ├── Form_Obat
│                        ├── Form_Supplier
│                        ├── Form_Restock
│                        ├── Form_Kasir
│                        └── Form_Laporan
│
└── Role: Pelanggan ──► [Form_TokoPelanggan]
└── Belanja & Checkout

---

## 🛠️ Teknologi yang Digunakan

| Teknologi | Keterangan |
|-----------|-----------|
| Java SE | Bahasa pemrograman utama |
| Java Swing (GUI) | Antarmuka aplikasi desktop |
| SQL Server | Database penyimpanan data |
| JDBC (mssql-jdbc-13.4.0.jre11) | Koneksi Java ke SQL Server |
| JCalendar (jcalendar-1.4) | Komponen pemilih tanggal |
| Apache NetBeans IDE 27 | IDE pengembangan |

---

## ⚙️ Cara Menjalankan

**1. Persiapan Database**
```sql
-- Buat database
CREATE DATABASE Apotek_V2;

-- Jalankan semua script tabel dan data dummy
-- (Lihat folder /sql di repository ini)
```

**2. Konfigurasi Koneksi**

Sesuaikan file `KoneksiDB.java`:
```java
String url = "jdbc:sqlserver://localhost:1433;databaseName=Apotek_V2;
              encrypt=true;trustServerCertificate=true;";
String user = "Db_Con";
String password = "12345678";
```

**3. Tambahkan Library**
- `mssql-jdbc-13.4.0.jre11.jar`
- `jcalendar-1.4.jar`

**4. Jalankan Aplikasi**
- Buka project di NetBeans
- Tekan `F6` atau klik Run
- Login menggunakan akun berikut:

| Role | Username | Password |
|------|----------|----------|
| Admin | admin | admin123 |
| Pelanggan | (daftar sendiri) | (bebas) |

---

## 📸 Tampilan Aplikasi

| Form Login | Menu Admin | Toko Pelanggan |
|------------|------------|----------------|
| *(screenshot)* | *(screenshot)* | *(screenshot)* |

---

## 👤 Identitas

**Nama:** Ibrahim Bagas Pradana  
**NIM:** 255150207111046  
**Program Studi:** Teknik Informatika  

---

## 📚 Referensi

- Microsoft JDBC Driver Documentation
- Java Swing Documentation — Oracle
- Elmasri, R., & Navathe, S. B. (2016). *Fundamentals of Database Systems*. Pearson.
