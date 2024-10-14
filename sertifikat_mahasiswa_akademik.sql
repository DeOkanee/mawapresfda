-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2024 at 02:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sertifikat_mahasiswa_akademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_2023`
--

CREATE TABLE `mahasiswa_2023` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `prodi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa_2023`
--

INSERT INTO `mahasiswa_2023` (`id`, `nim`, `nama`, `prodi`) VALUES
(6, '2211031354', 'i made oka kembarisna', 'pgsd'),
(7, '2211031354', 'i made oka kembarisna', 'pgsd'),
(8, '2211031350', 'madee', 'pgsd'),
(9, '2211031350', 'madee', 'pgsd');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_2024`
--

CREATE TABLE `mahasiswa_2024` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `prodi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa_2024`
--

INSERT INTO `mahasiswa_2024` (`id`, `nim`, `nama`, `prodi`) VALUES
(1, '12345678', 'debotz', 'pbi'),
(2, '2211031360', 'boot12333', 'pah');

-- --------------------------------------------------------

--
-- Table structure for table `prestasi_2023`
--

CREATE TABLE `prestasi_2023` (
  `id` int(11) NOT NULL,
  `mahasiswa_id` int(11) DEFAULT NULL,
  `jenis_prestasi` varchar(100) NOT NULL,
  `peringkat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prestasi_2023`
--

INSERT INTO `prestasi_2023` (`id`, `mahasiswa_id`, `jenis_prestasi`, `peringkat`) VALUES
(6, 6, 'bulutangkis', '1'),
(7, 7, 'bulutangkis', '1'),
(8, 8, 'podcast', '1'),
(9, 9, 'podcast', '1');

-- --------------------------------------------------------

--
-- Table structure for table `prestasi_2024`
--

CREATE TABLE `prestasi_2024` (
  `id` int(11) NOT NULL,
  `mahasiswa_id` int(11) DEFAULT NULL,
  `jenis_prestasi` varchar(100) NOT NULL,
  `peringkat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prestasi_2024`
--

INSERT INTO `prestasi_2024` (`id`, `mahasiswa_id`, `jenis_prestasi`, `peringkat`) VALUES
(1, 1, 'podcast', '1'),
(2, 2, 'nyurat', '3');

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat_2023`
--

CREATE TABLE `sertifikat_2023` (
  `id` int(11) NOT NULL,
  `prestasi_id` int(11) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sertifikat_2023`
--

INSERT INTO `sertifikat_2023` (`id`, `prestasi_id`, `file_path`) VALUES
(6, 6, '../uploads/2211031354_1728733369.jpeg'),
(7, 7, '../uploads/2211031354_1728733937.jpeg'),
(8, 8, '../uploads/2211031350_1728733991.jpg'),
(9, 9, '../uploads/2211031350_1728734015.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat_2024`
--

CREATE TABLE `sertifikat_2024` (
  `id` int(11) NOT NULL,
  `prestasi_id` int(11) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sertifikat_2024`
--

INSERT INTO `sertifikat_2024` (`id`, `prestasi_id`, `file_path`) VALUES
(1, 1, '../uploads/12345678_1728735084.jpg'),
(2, 2, '../uploads/2211031360_1728735243.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa_2023`
--
ALTER TABLE `mahasiswa_2023`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa_2024`
--
ALTER TABLE `mahasiswa_2024`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prestasi_2023`
--
ALTER TABLE `prestasi_2023`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `prestasi_2024`
--
ALTER TABLE `prestasi_2024`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `sertifikat_2023`
--
ALTER TABLE `sertifikat_2023`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prestasi_id` (`prestasi_id`);

--
-- Indexes for table `sertifikat_2024`
--
ALTER TABLE `sertifikat_2024`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prestasi_id` (`prestasi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa_2023`
--
ALTER TABLE `mahasiswa_2023`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mahasiswa_2024`
--
ALTER TABLE `mahasiswa_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prestasi_2023`
--
ALTER TABLE `prestasi_2023`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `prestasi_2024`
--
ALTER TABLE `prestasi_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sertifikat_2023`
--
ALTER TABLE `sertifikat_2023`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sertifikat_2024`
--
ALTER TABLE `sertifikat_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prestasi_2023`
--
ALTER TABLE `prestasi_2023`
  ADD CONSTRAINT `prestasi_2023_ibfk_1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa_2023` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prestasi_2024`
--
ALTER TABLE `prestasi_2024`
  ADD CONSTRAINT `prestasi_2024_ibfk_1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa_2024` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sertifikat_2023`
--
ALTER TABLE `sertifikat_2023`
  ADD CONSTRAINT `sertifikat_2023_ibfk_1` FOREIGN KEY (`prestasi_id`) REFERENCES `prestasi_2023` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sertifikat_2024`
--
ALTER TABLE `sertifikat_2024`
  ADD CONSTRAINT `sertifikat_2024_ibfk_1` FOREIGN KEY (`prestasi_id`) REFERENCES `prestasi_2024` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
