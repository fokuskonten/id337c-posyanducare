-- ========================================================
-- FOKUSKONTEN OFFICIAL DATABASE SCHEME
-- SKU: ID337C | Aplikasi: PosyanduCare
-- Kurasi & Distribusi: FokusKonten Digital (fokuskonten.my.id)
-- Kompatibilitas: MySQL 5.7+ / MariaDB 10.4+ / XAMPP / Laragon
-- ========================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelimunisasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anak`
--

CREATE TABLE `anak` (
  `anak_id` bigint(20) UNSIGNED NOT NULL,
  `nama_anak` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jk` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_ayah` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_ibu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kelurahan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bidan`
--

CREATE TABLE `bidan` (
  `bidan_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `imunisasi`
--

CREATE TABLE `imunisasi` (
  `imunisasi_id` bigint(20) UNSIGNED NOT NULL,
  `vaksin_id` bigint(20) UNSIGNED NOT NULL,
  `pegawai_id` bigint(20) UNSIGNED NOT NULL,
  `bidan_id` bigint(20) UNSIGNED NOT NULL,
  `anak_id` bigint(20) UNSIGNED NOT NULL,
  `posyandu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bulan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_imunisasis`
--

CREATE TABLE `jadwal_imunisasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vaksin_id` bigint(20) UNSIGNED NOT NULL,
  `tempat_imunisasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_imunisasi` date NOT NULL,
  `bidan_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kms`
--

CREATE TABLE `kms` (
  `kms_id` bigint(20) UNSIGNED NOT NULL,
  `jadwal_imunisasi_id` bigint(20) UNSIGNED NOT NULL,
  `anak_id` bigint(20) UNSIGNED NOT NULL,
  `berat_badan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tinggi_badan` bigint(20) UNSIGNED NOT NULL,
  `umur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_user_table', 1),
(2, '2020_12_06_081304_create_bidans_table', 1),
(3, '2020_12_07_002056_create_vaksins_table', 1),
(4, '2020_12_07_002312_create_pasiens_table', 1),
(5, '2020_12_07_002506_create_pegawais_table', 1),
(6, '2020_12_07_002515_create_balitas_table', 1),
(7, '2020_12_07_002525_create_imunisasis_table', 1),
(8, '2021_00_04_011557_create_jadwal_imunisasis_table', 1),
(9, '2021_01_31_075214_create_kms_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `pegawai_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`pegawai_id`, `user_id`, `nip`, `nama`, `alamat`, `jk`, `tempat_lahir`, `tgl_lahir`, `no_hp`) VALUES
(3, 2, '081234567890', 'Nama Admin', 'Pelaihari', 'Laki-laki', 'Pelaihari', '2000-01-01', '081234567890');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `pendaftaran_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_orang_tua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `role`) VALUES
(2, 'admin', '$2y$10$BD2wfke6XgEEPQ81oUEkNeAuYukbCoXL27RI43973xU9aN2v7nqq6', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `vaksin`
--

CREATE TABLE `vaksin` (
  `vaksin_id` bigint(20) UNSIGNED NOT NULL,
  `nama_vaksin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_imunisasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_umur` varchar(29) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anak`
--
ALTER TABLE `anak`
  ADD PRIMARY KEY (`anak_id`);

--
-- Indeks untuk tabel `bidan`
--
ALTER TABLE `bidan`
  ADD PRIMARY KEY (`bidan_id`),
  ADD KEY `bidan_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `imunisasi`
--
ALTER TABLE `imunisasi`
  ADD PRIMARY KEY (`imunisasi_id`),
  ADD KEY `imunisasi_vaksin_id_foreign` (`vaksin_id`),
  ADD KEY `imunisasi_pegawai_id_foreign` (`pegawai_id`),
  ADD KEY `imunisasi_bidan_id_foreign` (`bidan_id`),
  ADD KEY `imunisasi_anak_id_foreign` (`anak_id`);

--
-- Indeks untuk tabel `jadwal_imunisasis`
--
ALTER TABLE `jadwal_imunisasis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_imunisasis_vaksin_id_foreign` (`vaksin_id`),
  ADD KEY `jadwal_imunisasis_bidan_id_foreign` (`bidan_id`);

--
-- Indeks untuk tabel `kms`
--
ALTER TABLE `kms`
  ADD PRIMARY KEY (`kms_id`),
  ADD KEY `kms_anak_id_foreign` (`anak_id`),
  ADD KEY `kms_jadwal_imunisasi_id_foreign` (`jadwal_imunisasi_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`pegawai_id`),
  ADD KEY `pegawai_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`pendaftaran_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_username_unique` (`username`);

--
-- Indeks untuk tabel `vaksin`
--
ALTER TABLE `vaksin`
  ADD PRIMARY KEY (`vaksin_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anak`
--
ALTER TABLE `anak`
  MODIFY `anak_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bidan`
--
ALTER TABLE `bidan`
  MODIFY `bidan_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `imunisasi`
--
ALTER TABLE `imunisasi`
  MODIFY `imunisasi_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwal_imunisasis`
--
ALTER TABLE `jadwal_imunisasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kms`
--
ALTER TABLE `kms`
  MODIFY `kms_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `pegawai_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `pendaftaran_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `vaksin`
--
ALTER TABLE `vaksin`
  MODIFY `vaksin_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bidan`
--
ALTER TABLE `bidan`
  ADD CONSTRAINT `bidan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `imunisasi`
--
ALTER TABLE `imunisasi`
  ADD CONSTRAINT `imunisasi_anak_id_foreign` FOREIGN KEY (`anak_id`) REFERENCES `anak` (`anak_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `imunisasi_bidan_id_foreign` FOREIGN KEY (`bidan_id`) REFERENCES `bidan` (`bidan_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `imunisasi_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`pegawai_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `imunisasi_vaksin_id_foreign` FOREIGN KEY (`vaksin_id`) REFERENCES `vaksin` (`vaksin_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwal_imunisasis`
--
ALTER TABLE `jadwal_imunisasis`
  ADD CONSTRAINT `jadwal_imunisasis_bidan_id_foreign` FOREIGN KEY (`bidan_id`) REFERENCES `bidan` (`bidan_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jadwal_imunisasis_vaksin_id_foreign` FOREIGN KEY (`vaksin_id`) REFERENCES `vaksin` (`vaksin_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kms`
--
ALTER TABLE `kms`
  ADD CONSTRAINT `kms_anak_id_foreign` FOREIGN KEY (`anak_id`) REFERENCES `anak` (`anak_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kms_jadwal_imunisasi_id_foreign` FOREIGN KEY (`jadwal_imunisasi_id`) REFERENCES `jadwal_imunisasis` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
