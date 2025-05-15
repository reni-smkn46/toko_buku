-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2025 at 02:55 AM
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
-- Database: `toko_buku`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin01', '$2y$10$aZ6jUkkQqjH8DqaQEs35HeG.zo3bG8eABByefqq8uITx.Ewz3/pR6');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul_buku` varchar(30) NOT NULL,
  `penulis` varchar(30) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `id_kategori`, `judul_buku`, `penulis`, `gambar`, `deskripsi`, `harga`, `stok`) VALUES
(6, 5, 'Sejarah Peradaban Islam', 'Dr Ahmadin, S.Ag., S.Pd., M.Pd', '1746754752-islami4.jpg', 'Buku ini memuat perjalanan panjang sejarah peradaban Islam yang dimulai kajian tentang struktur spasial, struktur sosial, serta agama dan kepercayaan masyarakat Arab pra-Islam.', 75000, 50),
(7, 4, 'Bagaimana Kalau Kita Memohon P', 'Frizka Andani', '1746755230-novel1.jpg', 'Bagaimana Kalau Kita Memohon Pada Tuhan Untuk Melukis Ulang Takdir Kita', 65000, 70),
(8, 4, 'Aku dan Sepenggal Kisah Klasik', 'Pembelajar Institut Menulis Mu', '1746755305-novel2.jpg', 'Pembelajar Institut Menulis Muda Batch 7', 69900, 65),
(9, 4, 'Awal dari Perjuangan', 'Dandi Frengki Saputra', '1746755372-novel4.jpg', 'Awal dari Perjuangan', 66000, 40),
(10, 5, 'Metode Silat-Qu', 'Abi Ujek dan M. Hosaini', '1746755466-islami3.jpg', 'Metode SILAT QU(Satu Hari Lima Ayat, 3 bulan bisa baca Al Qur’an dan menghafal ) ini, di peruntukkan kepada setiap anak, mulai dari anak usia dini sampai anak dewasa maupun yang sudah berlanjut usia, yang baru belajar Al qur’an', 60000, 50),
(13, 4, 'Apa Kabar Kenangan', 'Siska Paulia, dkk', '1746756182-novel3.jpg', 'Apa kabar kenangan?', 64000, 46),
(14, 5, 'Be Your Self', 'Mila Septian Haryati, dkk.', '1746756399-novel5.jpg', 'Jadilah dirimu sendiri', 66300, 40),
(15, 5, 'Arah Baru Manajamen Pondok Pes', 'Dr. Fauzan Adhim, M.Pd.I.', '1746756571-islami2.jpg', 'Arah Baru Manajamen Pondok Pesantren', 84000, 68);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(2, 'Pelajaran Sekolah'),
(4, 'Novel'),
(5, 'Islami'),
(6, 'Komik');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama` varchar(30) NOT NULL,
  `no_tlp` varchar(15) NOT NULL,
  `alamat_penerima` varchar(255) NOT NULL,
  `catatan` text DEFAULT NULL,
  `metode_pembayaran` enum('tf','e_wallet','cod') NOT NULL,
  `total` int(11) DEFAULT NULL,
  `bukti_transfer` varchar(255) NOT NULL,
  `status` enum('pending','proses','terkirim') NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `id_user`, `nama`, `no_tlp`, `alamat_penerima`, `catatan`, `metode_pembayaran`, `total`, `bukti_transfer`, `status`, `created_at`) VALUES
(25, 4, 'Reni', '085694542774', 'Jln. Jati Raya No. 23 RT 06/03 Kel. Jati, Kec. Pulogadung', '', 'e_wallet', 84000, 'bukti_1747224446_8428.jpg', 'proses', '2025-05-14 19:07:10'),
(26, 5, 'Fenny Hanna Mezzaluna', '08682323562', 'Jl. Merdeka Pelajar 01, Kel. Jati, Kec. Pulogadung, Jakarta Timur', '-', 'tf', 84000, 'bukti_1747237513_4104.jpg', 'pending', '2025-05-14 22:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_detail`
--

CREATE TABLE `pesanan_detail` (
  `id` int(11) NOT NULL,
  `id_pesanan` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan_detail`
--

INSERT INTO `pesanan_detail` (`id`, `id_pesanan`, `id_buku`, `jumlah`, `subtotal`) VALUES
(24, 25, 15, 1, 84000),
(25, 26, 15, 1, 84000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_telepon` int(11) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `username`, `password`, `no_telepon`, `alamat`) VALUES
(4, 'Reni', 'reni3', '$2y$10$osBAmeMIkLcdFRKe.zRGzO15hIy8DV6li3qUe1997VMqFLd3UMSPi', 2147483647, 'Jl. Jati Raya No. 23 RT 006/03 Kel. Jati, Kec. Pulogadung, Jakarta Timur'),
(5, 'Hanna Luna', 'Hanna_luna', '$2y$10$TfnKqeafDeuFKzvKI4h3IucJoL24qx5YDON2MsMOWe.9vNH6nphCW', 2147483647, 'Jl. Merdeka Pelajar 01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD CONSTRAINT `pesanan_detail_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id`),
  ADD CONSTRAINT `pesanan_detail_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
