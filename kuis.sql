-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Apr 2020 pada 00.18
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuis`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `NIS` varchar(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `TTL` date NOT NULL,
  `Jenkel` varchar(15) NOT NULL,
  `Agama` varchar(15) NOT NULL,
  `tgldaftar` date NOT NULL,
  `tglberlaku` date NOT NULL,
  `kelas` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`NIS`, `Nama`, `TTL`, `Jenkel`, `Agama`, `tgldaftar`, `tglberlaku`, `kelas`) VALUES
('123160207', 'Aisyah', '1996-03-28', 'Perempuan', 'Hindu', '2020-04-01', '2020-04-30', 'B'),
('123170173', 'Amanda Manopo', '1997-03-25', 'Perempuan', 'Kristen', '2020-01-17', '2020-01-29', 'D'),
('123180106', 'Ganis Dwi', '2000-02-24', 'Perempuan', 'Islam', '2020-04-13', '2020-05-13', 'A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `Kode_buku` varchar(4) NOT NULL,
  `Judul` varchar(50) NOT NULL,
  `Pengarang` varchar(50) NOT NULL,
  `Penerbit` varchar(50) NOT NULL,
  `Tahun` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`Kode_buku`, `Judul`, `Pengarang`, `Penerbit`, `Tahun`) VALUES
('1234', 'Sunset U', 'Nadia M', 'Uptoza', '2004'),
('1287', 'I Love U', 'AKOOOO', 'KAMOOO', '2021'),
('1384', 'Perfect Days', 'Emerald Z', 'Wannaqe', '1997'),
('1735', 'Soniq The Hedgehog', 'Jessica J', 'AnimalsCartoon', '1997'),
('2817', 'I Love MEE', 'akulah', 'akudong', '2020'),
('3428', 'Itaewon Class', 'Sae Ro Yi ', 'KoreaLagi', '2020'),
('9273', 'Captivated By Nature', 'Haswan Ari', 'Limite', '2005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `NIK` varchar(10) NOT NULL,
  `NamaKrw` varchar(50) NOT NULL,
  `Jenkel` varchar(15) NOT NULL,
  `Golongan` int(10) NOT NULL,
  `Jabatan` varchar(50) NOT NULL,
  `Tunjangan` int(100) NOT NULL,
  `Gaji` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`NIK`, `NamaKrw`, `Jenkel`, `Golongan`, `Jabatan`, `Tunjangan`, `Gaji`) VALUES
('1827', 'Saputru', 'Laki-laki', 5, 'Honorer', 200000, 850000),
('1876', 'Cintaku', 'Perempuan', 5, 'Honorer', 200000, 850000),
('3557', 'Josephian', 'Laki-laki', 3, 'Staff', 300000, 1100000),
('3663', 'Kelvin Wijaya', 'Laki-laki', 2, 'Supervisor', 500000, 1400000),
('8276', 'Cintaku', 'Laki-laki', 5, 'Honorer', 200000, 850000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `Nopinjam` varchar(4) NOT NULL,
  `NISP` varchar(10) NOT NULL,
  `KodebukuP` varchar(4) NOT NULL,
  `tglpinjam` date NOT NULL,
  `tglkembali` date NOT NULL,
  `LamaDenda` bigint(5) NOT NULL,
  `Denda` bigint(100) NOT NULL,
  `NIKP` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`Nopinjam`, `NISP`, `KodebukuP`, `tglpinjam`, `tglkembali`, `LamaDenda`, `Denda`, `NIKP`) VALUES
('3574', '123160207', '1384', '2020-04-01', '2020-04-30', 14, 400000, '3663');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`NIS`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`Kode_buku`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`NIK`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD KEY `fkbuku` (`KodebukuP`),
  ADD KEY `fkanggota` (`NISP`),
  ADD KEY `fkkaryawan` (`NIKP`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fkanggota` FOREIGN KEY (`NISP`) REFERENCES `anggota` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkbuku` FOREIGN KEY (`KodebukuP`) REFERENCES `buku` (`Kode_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkkaryawan` FOREIGN KEY (`NIKP`) REFERENCES `karyawan` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
