-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2023 at 07:29 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jual`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `Kode_brg` varchar(10) NOT NULL,
  `Nama_brg` varchar(50) NOT NULL,
  `harga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`Kode_brg`, `Nama_brg`, `harga`) VALUES
('b001', 'lemari', 13000000),
('b002', 'kulkas', 23000000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` varchar(10) NOT NULL,
  `nama_customer` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`) VALUES
('c001', 'Ryan'),
('c002', 'Mozes');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan_brg`
--

CREATE TABLE `detail_penjualan_brg` (
  `no_jual` varchar(11) NOT NULL,
  `Kode_brg` varchar(11) NOT NULL,
  `qty_penjualan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_penjualan_brg`
--

INSERT INTO `detail_penjualan_brg` (`no_jual`, `Kode_brg`, `qty_penjualan`) VALUES
('j001', 'b001', 1),
('j001', 'b002', 2),
('j002', 'b001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_brg`
--

CREATE TABLE `penjualan_brg` (
  `no_jual` varchar(10) NOT NULL,
  `tgl_jual` varchar(50) NOT NULL,
  `id_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan_brg`
--

INSERT INTO `penjualan_brg` (`no_jual`, `tgl_jual`, `id_customer`) VALUES
('j001', '12/2/2020', 'c001'),
('j001', '3/2/2020', 'c001'),
('j002', '2/3/2020', 'c002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Kode_brg`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detail_penjualan_brg`
--
ALTER TABLE `detail_penjualan_brg`
  ADD PRIMARY KEY (`no_jual`,`Kode_brg`),
  ADD KEY `Kode_brg` (`Kode_brg`);

--
-- Indexes for table `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD PRIMARY KEY (`no_jual`,`tgl_jual`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`Kode_brg`) REFERENCES `detail_penjualan_brg` (`Kode_brg`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `penjualan_brg` (`id_customer`);

--
-- Constraints for table `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD CONSTRAINT `penjualan_brg_ibfk_1` FOREIGN KEY (`no_jual`) REFERENCES `detail_penjualan_brg` (`no_jual`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
