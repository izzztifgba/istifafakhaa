-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2026 at 03:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbraport_istifafakha`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi_istifafakha`
--

CREATE TABLE `absensi_istifafakha` (
  `id_absen` int(11) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `sakit` int(3) DEFAULT 0,
  `izin` int(3) DEFAULT 0,
  `alfa` int(3) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absensi_istifafakha`
--

INSERT INTO `absensi_istifafakha` (`id_absen`, `nis`, `sakit`, `izin`, `alfa`) VALUES
(1, '1', 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `guru_istifafakha`
--

CREATE TABLE `guru_istifafakha` (
  `id_guru` varchar(15) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `no_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru_istifafakha`
--

INSERT INTO `guru_istifafakha` (`id_guru`, `nip`, `nama_guru`, `no_telp`) VALUES
('1', '001', 'Fauzi', '7876'),
('2', '002', 'Dirga', '3544'),
('3', '003', 'Rahma', '78987'),
('4', '004', 'Fahri', '5567');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_istifafakha`
--

CREATE TABLE `kelas_istifafakha` (
  `id_kelas` varchar(10) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `id_guru` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas_istifafakha`
--

INSERT INTO `kelas_istifafakha` (`id_kelas`, `nama_kelas`, `id_guru`) VALUES
('1', 'X RPL A', '1'),
('2', 'X RPL B', '2'),
('3', 'XI RPL A', '3'),
('4', 'XI RPL B', '4');

-- --------------------------------------------------------

--
-- Table structure for table `mapel_istifafaka`
--

CREATE TABLE `mapel_istifafaka` (
  `id_mapel` varchar(10) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `kkm` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mapel_istifafaka`
--

INSERT INTO `mapel_istifafaka` (`id_mapel`, `nama_mapel`, `kkm`) VALUES
('1', 'Matematika', 80),
('2', 'Bahasa Indonesia', 80),
('3', 'Bahasa Inggris', 80),
('4', 'PAI', 85),
('5', 'IPA', 80),
('6', 'PPKn', 80);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_istifafakha`
--

CREATE TABLE `nilai_istifafakha` (
  `id_nilai` varchar(11) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `id_mapel` varchar(10) NOT NULL,
  `nilai_tugas` int(3) DEFAULT NULL,
  `nilai_uts` int(3) DEFAULT NULL,
  `nilai_uas` int(3) DEFAULT NULL,
  `nilai_akhir` decimal(5,2) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `semester` enum('Ganjil','Genap') NOT NULL,
  `tahun_ajaran` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai_istifafakha`
--

INSERT INTO `nilai_istifafakha` (`id_nilai`, `nis`, `id_mapel`, `nilai_tugas`, `nilai_uts`, `nilai_uas`, `nilai_akhir`, `deskripsi`, `semester`, `tahun_ajaran`) VALUES
('N001', '2', '3', 90, 89, 98, 93.70, 'tau', 'Ganjil', '2024/2025'),
('N002', '1', '1', 100, 90, 100, 97.00, 'HAHAHA', 'Ganjil', '2025/2026'),
('N003', '3', '4', 98, 89, 90, 91.30, 'y', 'Genap', '2025/2026'),
('N004', '4', '1', 89, 98, 87, 90.70, 'gg', 'Ganjil', '2024/2025'),
('N005', '1', '6', 22, 2, 22, 16.00, 'well', 'Genap', '2023/2024');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_istifafakha`
--

CREATE TABLE `siswa_istifafakha` (
  `nis` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `id_kelas` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa_istifafakha`
--

INSERT INTO `siswa_istifafakha` (`nis`, `nama`, `tempat_lahir`, `tgl_lahir`, `alamat`, `id_kelas`) VALUES
('1', 'Revita Gadis Amijaya', 'Bandung', '2009-04-15', 'Cisarua No.90', '1'),
('2', 'Muhammad Ezra', 'Cimahi', '2008-03-14', 'Cibaligo NO.89', '2'),
('3', 'Dean Petra', 'Cimahi', '2008-04-18', 'Tegal Kawung NO.77', '3'),
('4', 'Rafasya Atthaulah', 'Bandung', '2008-01-16', 'Padalarang NO.54', '4');

-- --------------------------------------------------------

--
-- Table structure for table `users_istifafakha`
--

CREATE TABLE `users_istifafakha` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','guru','walikelas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_istifafakha`
--

INSERT INTO `users_istifafakha` (`id`, `username`, `password`, `role`) VALUES
(1, 'istifafakha', 'istifa45', 'admin'),
(2, 'fauzi', 'uzi33', 'walikelas'),
(3, 'Dirga', 'ddirga5', 'walikelas'),
(4, 'Rahma', 'rhm98', 'walikelas'),
(5, 'Fahri', 'hadirfa4', 'walikelas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi_istifafakha`
--
ALTER TABLE `absensi_istifafakha`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `nis` (`nis`);

--
-- Indexes for table `guru_istifafakha`
--
ALTER TABLE `guru_istifafakha`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `kelas_istifafakha`
--
ALTER TABLE `kelas_istifafakha`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indexes for table `mapel_istifafaka`
--
ALTER TABLE `mapel_istifafaka`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `nilai_istifafakha`
--
ALTER TABLE `nilai_istifafakha`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `nis` (`nis`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indexes for table `siswa_istifafakha`
--
ALTER TABLE `siswa_istifafakha`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `users_istifafakha`
--
ALTER TABLE `users_istifafakha`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi_istifafakha`
--
ALTER TABLE `absensi_istifafakha`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_istifafakha`
--
ALTER TABLE `users_istifafakha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi_istifafakha`
--
ALTER TABLE `absensi_istifafakha`
  ADD CONSTRAINT `absensi_istifafakha_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa_istifafakha` (`nis`) ON DELETE CASCADE;

--
-- Constraints for table `kelas_istifafakha`
--
ALTER TABLE `kelas_istifafakha`
  ADD CONSTRAINT `kelas_istifafakha_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `guru_istifafakha` (`id_guru`) ON UPDATE CASCADE;

--
-- Constraints for table `nilai_istifafakha`
--
ALTER TABLE `nilai_istifafakha`
  ADD CONSTRAINT `nilai_istifafakha_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa_istifafakha` (`nis`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_istifafakha_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `mapel_istifafaka` (`id_mapel`) ON DELETE CASCADE;

--
-- Constraints for table `siswa_istifafakha`
--
ALTER TABLE `siswa_istifafakha`
  ADD CONSTRAINT `siswa_istifafakha_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas_istifafakha` (`id_kelas`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
