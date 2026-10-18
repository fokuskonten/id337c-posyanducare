-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: laravelimunisasi
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anak`
--

DROP TABLE IF EXISTS `anak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anak` (
  `anak_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_anak` varchar(50) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jk` varchar(20) DEFAULT NULL,
  `nama_ayah` varchar(100) DEFAULT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `nama_kelurahan` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`anak_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anak`
--

LOCK TABLES `anak` WRITE;
/*!40000 ALTER TABLE `anak` DISABLE KEYS */;
INSERT INTO `anak` VALUES (1,'Muhammad Rayyan Al-Fatih','Banjarmasin','2025-11-15','Laki-laki','Ahmad Fadillah','Raudhatul Jannah','Jl. Mawar No. 04 RT 02','085299881122','Melayu'),(2,'Aisyah Putri Humaira','Banjarmasin','2026-01-20','Perempuan','Bambang Irawan','Nur Hayati','Jl. Melati Blok C No. 7','085311223344','Antasan'),(3,'Kenzo Abqary Pradipta','Banjarbaru','2025-08-10','Laki-laki','Dimas Prasetyo','Kartika Dewi','Komp. Graha Indah 2','081344556677','Kertak Hanyar'),(4,'Naura Zhafira Azkadina','Martapura','2026-03-05','Perempuan','Faisal Rahman','Anisa Triani','Jl. Cempaka Putih No. 18','082155667788','Sungai Baru');
/*!40000 ALTER TABLE `anak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidan`
--

DROP TABLE IF EXISTS `bidan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bidan` (
  `bidan_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `nip` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `jk` varchar(30) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  PRIMARY KEY (`bidan_id`),
  KEY `bidan_user_id_foreign` (`user_id`),
  CONSTRAINT `bidan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidan`
--

LOCK TABLES `bidan` WRITE;
/*!40000 ALTER TABLE `bidan` DISABLE KEYS */;
INSERT INTO `bidan` VALUES (1,3,'198504122010012001','Siti Aminah, Amd.Keb','Jl. Kenanga No. 12','Perempuan','Banjarmasin','1985-04-12','081234567891');
/*!40000 ALTER TABLE `bidan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imunisasi`
--

DROP TABLE IF EXISTS `imunisasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imunisasi` (
  `imunisasi_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vaksin_id` bigint(20) unsigned NOT NULL,
  `pegawai_id` bigint(20) unsigned NOT NULL,
  `bidan_id` bigint(20) unsigned NOT NULL,
  `anak_id` bigint(20) unsigned NOT NULL,
  `posyandu` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `bulan` date NOT NULL,
  PRIMARY KEY (`imunisasi_id`),
  KEY `imunisasi_vaksin_id_foreign` (`vaksin_id`),
  KEY `imunisasi_pegawai_id_foreign` (`pegawai_id`),
  KEY `imunisasi_bidan_id_foreign` (`bidan_id`),
  KEY `imunisasi_anak_id_foreign` (`anak_id`),
  CONSTRAINT `imunisasi_anak_id_foreign` FOREIGN KEY (`anak_id`) REFERENCES `anak` (`anak_id`) ON DELETE CASCADE,
  CONSTRAINT `imunisasi_bidan_id_foreign` FOREIGN KEY (`bidan_id`) REFERENCES `bidan` (`bidan_id`) ON DELETE CASCADE,
  CONSTRAINT `imunisasi_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`pegawai_id`) ON DELETE CASCADE,
  CONSTRAINT `imunisasi_vaksin_id_foreign` FOREIGN KEY (`vaksin_id`) REFERENCES `vaksin` (`vaksin_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imunisasi`
--

LOCK TABLES `imunisasi` WRITE;
/*!40000 ALTER TABLE `imunisasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `imunisasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal_imunisasis`
--

DROP TABLE IF EXISTS `jadwal_imunisasis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal_imunisasis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vaksin_id` bigint(20) unsigned NOT NULL,
  `tempat_imunisasi` varchar(255) NOT NULL,
  `tanggal_imunisasi` date NOT NULL,
  `bidan_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jadwal_imunisasis_vaksin_id_foreign` (`vaksin_id`),
  KEY `jadwal_imunisasis_bidan_id_foreign` (`bidan_id`),
  CONSTRAINT `jadwal_imunisasis_bidan_id_foreign` FOREIGN KEY (`bidan_id`) REFERENCES `bidan` (`bidan_id`) ON DELETE CASCADE,
  CONSTRAINT `jadwal_imunisasis_vaksin_id_foreign` FOREIGN KEY (`vaksin_id`) REFERENCES `vaksin` (`vaksin_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal_imunisasis`
--

LOCK TABLES `jadwal_imunisasis` WRITE;
/*!40000 ALTER TABLE `jadwal_imunisasis` DISABLE KEYS */;
INSERT INTO `jadwal_imunisasis` VALUES (1,2,'Posyandu Cempaka 01','2026-10-25',1,'2026-10-18 16:30:33','2026-10-18 16:30:33'),(2,3,'Posyandu Melati Indah','2026-11-05',1,'2026-10-18 16:30:33','2026-10-18 16:30:33'),(3,5,'Posyandu Kasih Ibu','2026-11-12',1,'2026-10-18 16:30:33','2026-10-18 16:30:33');
/*!40000 ALTER TABLE `jadwal_imunisasis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kms`
--

DROP TABLE IF EXISTS `kms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kms` (
  `kms_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jadwal_imunisasi_id` bigint(20) unsigned NOT NULL,
  `anak_id` bigint(20) unsigned NOT NULL,
  `berat_badan` varchar(255) NOT NULL,
  `tinggi_badan` bigint(20) unsigned NOT NULL,
  `umur` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kms_id`),
  KEY `kms_anak_id_foreign` (`anak_id`),
  KEY `kms_jadwal_imunisasi_id_foreign` (`jadwal_imunisasi_id`),
  CONSTRAINT `kms_anak_id_foreign` FOREIGN KEY (`anak_id`) REFERENCES `anak` (`anak_id`) ON DELETE CASCADE,
  CONSTRAINT `kms_jadwal_imunisasi_id_foreign` FOREIGN KEY (`jadwal_imunisasi_id`) REFERENCES `jadwal_imunisasis` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kms`
--

LOCK TABLES `kms` WRITE;
/*!40000 ALTER TABLE `kms` DISABLE KEYS */;
INSERT INTO `kms` VALUES (1,1,1,'8.2',72,'11 Bulan','2026-10-18 16:30:33','2026-10-18 16:30:33'),(2,1,2,'7.1',67,'9 Bulan','2026-10-18 16:30:33','2026-10-18 16:30:33'),(3,2,3,'10.5',82,'14 Bulan','2026-10-18 16:30:33','2026-10-18 16:30:33');
/*!40000 ALTER TABLE `kms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_user_table',1),(2,'2020_12_06_081304_create_bidans_table',1),(3,'2020_12_07_002056_create_vaksins_table',1),(4,'2020_12_07_002312_create_pasiens_table',1),(5,'2020_12_07_002506_create_pegawais_table',1),(6,'2020_12_07_002515_create_balitas_table',1),(7,'2020_12_07_002525_create_imunisasis_table',1),(8,'2021_00_04_011557_create_jadwal_imunisasis_table',1),(9,'2021_01_31_075214_create_kms_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegawai` (
  `pegawai_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `nip` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `jk` varchar(30) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  PRIMARY KEY (`pegawai_id`),
  KEY `pegawai_user_id_foreign` (`user_id`),
  CONSTRAINT `pegawai_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES (3,2,'081234567890','Nama Admin','Pelaihari','Laki-laki','Pelaihari','2000-01-01','081234567890');
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendaftaran`
--

DROP TABLE IF EXISTS `pendaftaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendaftaran` (
  `pendaftaran_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `nomor_telepon` varchar(255) NOT NULL,
  `nama_orang_tua` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pendaftaran_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendaftaran`
--

LOCK TABLES `pendaftaran` WRITE;
/*!40000 ALTER TABLE `pendaftaran` DISABLE KEYS */;
INSERT INTO `pendaftaran` VALUES (1,'Muhammad Rayyan Al-Fatih','Jl. Mawar No. 04 RT 02','085299881122','Raudhatul Jannah','Banjarmasin','2025-11-15',1),(2,'Aisyah Putri Humaira','Jl. Melati Blok C No. 7','085311223344','Nur Hayati','Banjarmasin','2026-01-20',1);
/*!40000 ALTER TABLE `pendaftaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'admin','$2y$10$BD2wfke6XgEEPQ81oUEkNeAuYukbCoXL27RI43973xU9aN2v7nqq6',1),(3,'bidan','$2y$10$BD2wfke6XgEEPQ81oUEkNeAuYukbCoXL27RI43973xU9aN2v7nqq6',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaksin`
--

DROP TABLE IF EXISTS `vaksin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vaksin` (
  `vaksin_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_vaksin` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `p_imunisasi` varchar(20) NOT NULL,
  `k_umur` varchar(29) NOT NULL,
  PRIMARY KEY (`vaksin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaksin`
--

LOCK TABLES `vaksin` WRITE;
/*!40000 ALTER TABLE `vaksin` DISABLE KEYS */;
INSERT INTO `vaksin` VALUES (1,'Hepatitis B (HB-0)','Mencegah transmisi vertikal virus hepatitis B','Intramuskular','0 - 24 Jam'),(2,'BCG & Polio 1','Mencegah Tuberkulosis (TBC) dan kelumpuhan polio','Intrakutan & Oral','1 Bulan'),(3,'DPT-HB-Hib 1 & Polio 2','Mencegah Difteri, Pertusis, Tetanus, Hep B, Hib','Intramuskular','2 Bulan'),(4,'DPT-HB-Hib 2 & Polio 3','Imunisasi dasar dosis lanjutan kedua','Intramuskular','3 Bulan'),(5,'Campak / MR 1','Mencegah infeksi Campak dan Campak Jerman (Rubella)','Subkutan','9 Bulan');
/*!40000 ALTER TABLE `vaksin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-18 23:30:43
