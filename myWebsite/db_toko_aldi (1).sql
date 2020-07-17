-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2020 at 12:00 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_toko_aldi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(100) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `satuan_barang` varchar(20) NOT NULL,
  `harga_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `satuan_barang`, `harga_barang`) VALUES
(2, 'apel', '4', 5000),
(4, 'jeruk', 'kg', 45000),
(5, 'manggis', 'kg', 10000),
(8, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` int(11) NOT NULL,
  `nama_buku` varchar(50) NOT NULL,
  `nama_penerbit` varchar(20) NOT NULL,
  `nama_penulis` varchar(50) NOT NULL,
  `tahun_terbit` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `nama_buku`, `nama_penerbit`, `nama_penulis`, `tahun_terbit`) VALUES
(4, 'My flower shunsine', 'aldi book', 'diaz', 2010),
(5, 'city sun', 'magazine', 'rivan', 2010),
(6, 'flower red', 'diaz book', 'rivan', 2016),
(10, 'cinta brontosaurus', 'radit production', 'radityadika', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_transaksi`
--

CREATE TABLE `tb_detail_transaksi` (
  `no_transaksi` char(6) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_detail_transaksi`
--

INSERT INTO `tb_detail_transaksi` (`no_transaksi`, `id_barang`, `harga_barang`, `jumlah_beli`) VALUES
('T17072', 2, 5000, 1),
('T17072', 4, 45000, 1),
('T17073', 2, 5000, 2),
('T17076', 2, 5000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_header_transaksi`
--

CREATE TABLE `tb_header_transaksi` (
  `no_transaksi` char(6) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_header_transaksi`
--

INSERT INTO `tb_header_transaksi` (`no_transaksi`, `tgl_transaksi`, `id_user`, `total_harga`) VALUES
('T17072', '0000-00-00', 2, 50000),
('T17073', '2020-07-17', 2, 10000),
('T17076', '0000-00-00', 2, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_temp`
--

CREATE TABLE `tb_temp` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `satuan_barang` varchar(50) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `email_user` varchar(50) NOT NULL,
  `password_user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id_user`, `nama_user`, `email_user`, `password_user`) VALUES
(2, 'rivansyah1', 'rivansyah1@gmail.com', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'Diaz1', 'diaz@gmail.com', '99ccabed315e3609cae2dd150db1210b'),
(4, 'aisyah', 'aisyah@gmail.com', '26bb533df5747c7a3f2a9cc48a8cf3ee'),
(5, 'Dini', 'dini@gmail.com', '83476316a972856163fb987b861a0a2c'),
(6, 'Ryanaldi', 'ryanaldirivansyah@gmail.com', '21232f297a57a5a743894a0e4a801fc3'),
(10, 'aisyah', 'aisyah@gmail.com', '26bb533df5747c7a3f2a9cc48a8cf3ee'),
(12, 'riski', 'riski@gmail.com', '6e24184c9f8092a67bcd413cbcf598da');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD PRIMARY KEY (`no_transaksi`,`id_barang`),
  ADD KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `tb_header_transaksi`
--
ALTER TABLE `tb_header_transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_temp`
--
ALTER TABLE `tb_temp`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_buku`
--
ALTER TABLE `tb_buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD CONSTRAINT `tb_detail_transaksi_ibfk_1` FOREIGN KEY (`no_transaksi`) REFERENCES `tb_header_transaksi` (`no_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_detail_transaksi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_header_transaksi`
--
ALTER TABLE `tb_header_transaksi`
  ADD CONSTRAINT `tb_header_transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
