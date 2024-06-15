-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Nov 2023 pada 03.39
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `persediaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(2, 'Sabun'),
(3, 'Minuman'),
(4, 'Sembako');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `kode_produk` varchar(10) NOT NULL,
  `stok_min` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga_produk` varchar(25) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `stok_supp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `id_supplier`, `kode_produk`, `stok_min`, `nama_produk`, `harga_produk`, `satuan`, `stok_supp`) VALUES
(1, 4, 1, 'A01b', 3, 'Beras', '10000', '', 84),
(2, 4, 2, '0MYK', 2, 'Minyak', '17000', 'kg', 0),
(3, 3, 1, '1234A', 10, 'coba', '20000', '', 120),
(4, 2, 1, 'coba edit', 80, 'coba2', '10000', '', 100),
(6, 2, 1, 'Ad-678-upi', 0, 'Gula', '10000', 'pcs', 123);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_keluar`
--

CREATE TABLE `produk_keluar` (
  `id_produk_keluar` int(11) NOT NULL,
  `id_produk_masuk` int(11) NOT NULL,
  `id_transaksi` varchar(20) NOT NULL,
  `qty_kel` varchar(20) NOT NULL,
  `tgl_keluar` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk_keluar`
--

INSERT INTO `produk_keluar` (`id_produk_keluar`, `id_produk_masuk`, `id_transaksi`, `qty_kel`, `tgl_keluar`, `time`) VALUES
(7, 1, '20220813HB9ZMOTK', '2', '2022-08-13', '2022-08-13 09:57:28'),
(8, 3, '20220813HB9ZMOTK', '2', '2022-08-13', '2022-08-13 09:57:28'),
(9, 3, '20220813HRQKUBGW', '2', '2022-08-13', '2022-08-13 10:12:28'),
(10, 3, '202208133IP4TBDR', '3', '2022-08-13', '2022-08-13 10:16:44'),
(11, 3, '20220813BK0SAUTL', '3', '2022-08-13', '2022-08-13 10:17:54'),
(12, 3, '20220813OJ031C5C', '5', '2022-08-13', '2022-08-13 10:18:37'),
(13, 5, '20231113JPSRYICM', '1', '2023-11-13', '2023-11-13 02:04:27'),
(14, 8, '20231113ZN4U1UCY', '1', '2023-11-13', '2023-11-13 02:27:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_masuk`
--

CREATE TABLE `produk_masuk` (
  `id_produk_masuk` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_tran_supp` int(11) NOT NULL,
  `qty` varchar(20) NOT NULL,
  `sisa` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `tgl_masuk` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk_masuk`
--

INSERT INTO `produk_masuk` (`id_produk_masuk`, `id_produk`, `id_tran_supp`, `qty`, `sisa`, `create_time`, `tgl_masuk`) VALUES
(1, 2, 0, '2', 0, '2022-04-07 01:06:14', '04/07/2022 8:06'),
(3, 1, 0, '32', 5, '2022-04-07 01:27:40', '04/07/2022 8:27'),
(4, 4, 0, '10', 10, '2022-09-07 13:31:41', '2022-09-07'),
(5, 2, 1, '2', 1, '2023-03-03 12:42:16', '2023-03-16'),
(6, 2, 1, '2', 2, '2023-03-04 15:26:19', '2023-03-04'),
(7, 2, 2, '2', 2, '2023-03-05 06:48:18', '2023-03-16'),
(8, 1, 3, '1', 0, '2023-11-13 02:16:58', NULL),
(9, 1, 4, '5', 5, '2023-11-13 02:36:53', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `nama_toko` varchar(50) NOT NULL,
  `alamat` varchar(125) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `username_supp` varchar(50) NOT NULL,
  `pass_supp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `nama_toko`, `alamat`, `no_hp`, `username_supp`, `pass_supp`) VALUES
(1, 'Ahmas Saidi', 'Berkah Jaya', 'Semarang', '088000888000', 'rudi', 'rudiahmad'),
(2, 'Rudi Hidayat', 'Sumber Waras', 'Kudus', '085666000666', 'rahmat', 'rahmathidayat'),
(3, 'Johan Alfaiz', 'Maju Jaya', 'Jepara', '082111000111', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_transaksi` varchar(15) NOT NULL,
  `total_bayar` varchar(15) NOT NULL,
  `pembayaran` varchar(15) NOT NULL,
  `kembali` varchar(15) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `tgl_transaksi`, `total_bayar`, `pembayaran`, `kembali`, `time`) VALUES
('202208133IP4TBDR', 14, '2022-08-13', '30000', '40000', '10000', '2022-08-13 10:16:44'),
('20220813BK0SAUTL', 14, '2022-08-13', '30000', '40000', '10000', '2022-08-13 10:17:54'),
('20220813HB9ZMOTK', 13, '2022-08-13', '54000', '60000', '6000', '2022-08-13 10:11:12'),
('20220813HRQKUBGW', 14, '2022-08-13', '20000', '30000', '10000', '2022-08-13 10:12:28'),
('20220813OJ031C5C', 14, '2022-08-13', '50000', '50000', '0', '2022-08-13 10:18:37'),
('20231113JPSRYICM', 14, '2023-11-13', '17000', '20000', '3000', '2023-11-13 02:04:27'),
('20231113ZN4U1UCY', 14, '2023-11-13', '10000', '10000', '0', '2023-11-13 02:27:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_supp`
--

CREATE TABLE `transaksi_supp` (
  `id_tran_supp` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `tgl_tran_supp` varchar(10) NOT NULL,
  `tot_bayar` varchar(15) NOT NULL,
  `status_transaksi` int(11) NOT NULL,
  `time_supp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_supp`
--

INSERT INTO `transaksi_supp` (`id_tran_supp`, `id_supplier`, `tgl_tran_supp`, `tot_bayar`, `status_transaksi`, `time_supp`) VALUES
(1, 2, '2023-03-04', '34000', 1, '2023-03-04 15:26:19'),
(2, 2, '2023-03-05', '34000', 0, '2023-03-05 06:48:18'),
(3, 1, '2023-11-13', '10000', 0, '2023-11-13 02:16:58'),
(4, 1, '2023-11-13', '50000', 0, '2023-11-13 02:36:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `alamat`, `no_hp`, `username`, `password`, `level_user`) VALUES
(12, 'Rehandito', 'Semarang', '081222333444', 'pemilik', 'pemilik', 2),
(13, 'Muhlisin', 'magelang', '081222111222', 'admin', 'admin', 1),
(14, 'kasir', 'Semarang', '087000777000', 'kasir', 'kasir', 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `produk_keluar`
--
ALTER TABLE `produk_keluar`
  ADD PRIMARY KEY (`id_produk_keluar`);

--
-- Indeks untuk tabel `produk_masuk`
--
ALTER TABLE `produk_masuk`
  ADD PRIMARY KEY (`id_produk_masuk`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `transaksi_supp`
--
ALTER TABLE `transaksi_supp`
  ADD PRIMARY KEY (`id_tran_supp`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `produk_keluar`
--
ALTER TABLE `produk_keluar`
  MODIFY `id_produk_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `produk_masuk`
--
ALTER TABLE `produk_masuk`
  MODIFY `id_produk_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi_supp`
--
ALTER TABLE `transaksi_supp`
  MODIFY `id_tran_supp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
