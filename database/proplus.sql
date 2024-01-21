-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2020 pada 04.19
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proplus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `backset`
--

CREATE TABLE `backset` (
  `url` varchar(100) NOT NULL,
  `sessiontime` varchar(4) DEFAULT NULL,
  `footer` varchar(50) DEFAULT NULL,
  `themesback` varchar(2) DEFAULT NULL,
  `responsive` varchar(2) DEFAULT NULL,
  `namabisnis1` tinytext NOT NULL,
  `batas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `backset`
--

INSERT INTO `backset` (`url`, `sessiontime`, `footer`, `themesback`, `responsive`, `namabisnis1`, `batas`) VALUES
('http://localhost/proplus', '100', 'Aplikasi Indotory', '2', '0', 'IndoTory V3.1', 30);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `hargabeli` int(11) DEFAULT NULL,
  `hargajual` int(11) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `kategori` varchar(20) DEFAULT NULL,
  `terjual` int(11) DEFAULT NULL,
  `terbeli` int(11) DEFAULT NULL,
  `sisa` int(11) DEFAULT NULL,
  `no` int(11) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `brand` text NOT NULL,
  `avatar` varchar(300) NOT NULL,
  `retur` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bayar`
--

CREATE TABLE `bayar` (
  `nota` varchar(20) NOT NULL,
  `tglbayar` date DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `keluar` int(11) DEFAULT NULL,
  `kasir` varchar(100) DEFAULT NULL,
  `diskon` int(10) NOT NULL,
  `no` int(11) NOT NULL,
  `tipebayar` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `beli`
--

CREATE TABLE `beli` (
  `nota` varchar(20) NOT NULL,
  `tglbeli` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `supplier` varchar(20) DEFAULT NULL,
  `kasir` varchar(100) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `brand`
--

CREATE TABLE `brand` (
  `kode` varchar(20) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buy`
--

CREATE TABLE `buy` (
  `nota` varchar(20) NOT NULL,
  `tglsale` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `supplier` varchar(200) DEFAULT NULL,
  `kasir` varchar(100) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `no` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `diterima` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `chmenu`
--

CREATE TABLE `chmenu` (
  `userjabatan` varchar(20) NOT NULL,
  `menu1` varchar(1) DEFAULT '0',
  `menu2` varchar(1) DEFAULT '0',
  `menu3` varchar(1) DEFAULT '0',
  `menu4` varchar(1) DEFAULT '0',
  `menu5` varchar(1) DEFAULT '0',
  `menu6` varchar(1) DEFAULT '0',
  `menu7` varchar(1) DEFAULT '0',
  `menu8` varchar(1) DEFAULT '0',
  `menu9` varchar(1) DEFAULT '0',
  `menu10` varchar(1) DEFAULT '0',
  `menu11` varchar(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `chmenu`
--

INSERT INTO `chmenu` (`userjabatan`, `menu1`, `menu2`, `menu3`, `menu4`, `menu5`, `menu6`, `menu7`, `menu8`, `menu9`, `menu10`, `menu11`) VALUES
('admin', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5'),
('demo', '0', '0', '0', '0', '5', '5', '0', '0', '0', '0', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data`
--

CREATE TABLE `data` (
  `nama` varchar(100) DEFAULT NULL,
  `tagline` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `notelp` varchar(20) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data`
--

INSERT INTO `data` (`nama`, `tagline`, `alamat`, `notelp`, `signature`, `avatar`, `no`) VALUES
('Nama Toko Anda', 'Toko Online Keren', 'Jalan Menuju Sukses No.1 Kel.Suka Makmur kec.Maju Jaya Provinsi Sehat Selalu Negara Hidup Bahagia', '62999999999', 'Thank you for Shopping with us\r\n-- ini bisa di edit--', 'dist/img/logo.png', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dataretur`
--

CREATE TABLE `dataretur` (
  `nota` varchar(10) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `harga` int(10) NOT NULL,
  `hargaakhir` int(10) NOT NULL,
  `no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `info`
--

CREATE TABLE `info` (
  `nama` varchar(50) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `info`
--

INSERT INTO `info` (`nama`, `avatar`, `tanggal`, `isi`, `id`) VALUES
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1),
('iam Admin gantent', 'dist/upload/avatar.png', '2020-01-02', '<h1>Indotory v3 Pro Plus<small></small>:</h1><p>hanya beli di tokopedia.com/warungebook<br><br>fitur dibawah ini tidak ada di yg versi basic</p><p><br>Fitur Pro:<br><br>-Scan Barcode saat jualan</p><p>-Scan barcode untuk tambah stok<br></p><p>-Scan Barcode untuk stok keluar</p><p>-Cetak barcode, cetak Invoice, cetak Struk dg logo<br><br>Fitur Plus:<br>-Detail barang plus gambar barang, mutasi<br>-Detail User isinya ttg user, penjualan user,pembelian user,aktivitas user</p><p>-Stok Alert , tentukan batas minimal stok barang, jika ada yg kurang dr stok minimal maka akan muncul daftar barangnya<br><br><br></p><p><br></p>', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoicebeli`
--

CREATE TABLE `invoicebeli` (
  `nota` varchar(20) NOT NULL,
  `kode` varchar(200) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `terima` int(10) NOT NULL,
  `hargaakhir` int(11) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoicejual`
--

CREATE TABLE `invoicejual` (
  `nota` varchar(20) NOT NULL,
  `kode` varchar(200) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `hargaakhir` int(11) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `kode` varchar(20) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`kode`, `nama`, `no`) VALUES
('0001', 'admin', 28),
('0002', 'demo', 33);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kode` varchar(20) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mutasi`
--

CREATE TABLE `mutasi` (
  `namauser` varchar(50) NOT NULL,
  `tgl` date NOT NULL,
  `kodebarang` varchar(10) NOT NULL,
  `sisa` int(10) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `kegiatan` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `no` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `operasional`
--

CREATE TABLE `operasional` (
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `biaya` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `kasir` varchar(20) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `tipe` int(1) NOT NULL,
  `nota` varchar(10) NOT NULL,
  `cara` varchar(20) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `ref` varchar(50) NOT NULL,
  `payday` date NOT NULL,
  `no` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kode` varchar(20) NOT NULL,
  `tgldaftar` date DEFAULT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `alamat` varchar(70) DEFAULT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `retur`
--

CREATE TABLE `retur` (
  `nota` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `dana` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale`
--

CREATE TABLE `sale` (
  `nota` varchar(20) NOT NULL,
  `tglsale` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `pelanggan` varchar(200) DEFAULT NULL,
  `kasir` varchar(100) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `no` int(11) NOT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stokretur`
--

CREATE TABLE `stokretur` (
  `kode` varchar(100) NOT NULL,
  `stok` int(7) NOT NULL,
  `no` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `kode` varchar(20) NOT NULL,
  `tgldaftar` date DEFAULT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `alamat` varchar(70) DEFAULT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksibeli`
--

CREATE TABLE `transaksibeli` (
  `nota` varchar(20) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `hargaakhir` int(11) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksimasuk`
--

CREATE TABLE `transaksimasuk` (
  `nota` varchar(20) NOT NULL,
  `kode` varchar(200) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `hargabeli` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `hargaakhir` int(11) DEFAULT NULL,
  `hargabeliakhir` int(11) DEFAULT NULL,
  `retur` varchar(3) NOT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userna_me` varchar(20) NOT NULL,
  `pa_ssword` varchar(70) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `tglaktif` date DEFAULT NULL,
  `jabatan` varchar(20) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`userna_me`, `pa_ssword`, `nama`, `alamat`, `nohp`, `tgllahir`, `tglaktif`, `jabatan`, `avatar`, `no`) VALUES
('admin', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 'iam Admin gantent', '    jalan menuju sukses no 1 kelurahan kaya raya kecamatan makmur jaya provinsi panjang umur', '019101911', '2020-01-01', '2016-10-08', 'admin', 'dist/upload/avatar.png', 1),
('demo', 'a69681bcf334ae130217fea4505fd3c994f5683f', 'demo12231', 'demo demo demo', '321334', '0011-11-11', '2020-01-01', 'demo', 'dist/upload/index.jpg', 2),
('demo1', 'a69681bcf334ae130217fea4505fd3c994f5683f', 'demo', 'demo demo demo', '321334', '0011-11-11', '0001-11-11', 'admin', 'bootstrap/dist/upload/index.jpg', 23),
('superadmin', '095fd63ec4594cc8117cce148c660d64ba02adab', 'supervisor', 'demo demo demo', '321334', '0111-11-11', '0001-11-11', 'admin', 'bootstrap/dist/upload/world-contries.jpg', 26);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `backset`
--
ALTER TABLE `backset`
  ADD PRIMARY KEY (`url`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `no` (`no`),
  ADD KEY `jenis` (`kategori`);

--
-- Indeks untuk tabel `bayar`
--
ALTER TABLE `bayar`
  ADD PRIMARY KEY (`nota`),
  ADD KEY `no` (`no`);

--
-- Indeks untuk tabel `beli`
--
ALTER TABLE `beli`
  ADD PRIMARY KEY (`nota`),
  ADD KEY `no` (`no`);

--
-- Indeks untuk tabel `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `no4` (`no`);

--
-- Indeks untuk tabel `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`nota`),
  ADD KEY `no` (`no`);

--
-- Indeks untuk tabel `chmenu`
--
ALTER TABLE `chmenu`
  ADD PRIMARY KEY (`userjabatan`);

--
-- Indeks untuk tabel `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `dataretur`
--
ALTER TABLE `dataretur`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `info`
--
ALTER TABLE `info`
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `invoicebeli`
--
ALTER TABLE `invoicebeli`
  ADD PRIMARY KEY (`nota`,`kode`),
  ADD KEY `barang` (`nama`),
  ADD KEY `no5_2` (`no`);

--
-- Indeks untuk tabel `invoicejual`
--
ALTER TABLE `invoicejual`
  ADD PRIMARY KEY (`nota`,`kode`),
  ADD KEY `barang` (`nama`),
  ADD KEY `no5_2` (`no`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `no` (`no`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `no4` (`no`);

--
-- Indeks untuk tabel `mutasi`
--
ALTER TABLE `mutasi`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `operasional`
--
ALTER TABLE `operasional`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `no` (`no`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `no3` (`no`);

--
-- Indeks untuk tabel `retur`
--
ALTER TABLE `retur`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`nota`),
  ADD KEY `no` (`no`);

--
-- Indeks untuk tabel `stokretur`
--
ALTER TABLE `stokretur`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `no3` (`no`);

--
-- Indeks untuk tabel `transaksibeli`
--
ALTER TABLE `transaksibeli`
  ADD PRIMARY KEY (`nota`,`kode`),
  ADD KEY `no` (`no`),
  ADD KEY `username` (`kode`),
  ADD KEY `kdbarang` (`harga`);

--
-- Indeks untuk tabel `transaksimasuk`
--
ALTER TABLE `transaksimasuk`
  ADD PRIMARY KEY (`nota`,`kode`),
  ADD KEY `barang` (`nama`),
  ADD KEY `no5_2` (`no`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userna_me`),
  ADD KEY `no` (`no`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bayar`
--
ALTER TABLE `bayar`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `beli`
--
ALTER TABLE `beli`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `brand`
--
ALTER TABLE `brand`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `buy`
--
ALTER TABLE `buy`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dataretur`
--
ALTER TABLE `dataretur`
  MODIFY `no` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `invoicebeli`
--
ALTER TABLE `invoicebeli`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `invoicejual`
--
ALTER TABLE `invoicejual`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mutasi`
--
ALTER TABLE `mutasi`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `operasional`
--
ALTER TABLE `operasional`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment`
--
ALTER TABLE `payment`
  MODIFY `no` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `retur`
--
ALTER TABLE `retur`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sale`
--
ALTER TABLE `sale`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stokretur`
--
ALTER TABLE `stokretur`
  MODIFY `no` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaksibeli`
--
ALTER TABLE `transaksibeli`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaksimasuk`
--
ALTER TABLE `transaksimasuk`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
