-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Apr 2022 pada 17.00
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id` int(11) NOT NULL,
  `id_prov` int(11) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kabupaten`
--

INSERT INTO `kabupaten` (`id`, `id_prov`, `nama`, `waktu`) VALUES
(1101, 11, 'Kab. Aceh Selatan', '2022-04-06 23:31:28'),
(1102, 11, 'Kab. Aceh Tenggara', '2022-04-03 15:10:35'),
(1103, 11, 'Kab. Aceh Timur', '2022-04-03 15:10:35'),
(1104, 11, 'Kab. Aceh Tengah', '2022-04-03 15:10:35'),
(1105, 11, 'Kab. Aceh Barat', '2022-04-03 15:10:35'),
(1106, 11, 'Kab. Aceh Besar', '2022-04-03 15:10:35'),
(1107, 11, 'Kab. Pidie', '2022-04-03 15:10:35'),
(1108, 11, 'Kab. Aceh Utara', '2022-04-03 15:10:35'),
(1109, 11, 'Kab. Simeulue', '2022-04-03 15:10:35'),
(1110, 11, 'Kab. Aceh Singkil', '2022-04-03 15:10:35'),
(1111, 11, 'Kab. Bireuen', '2022-04-03 15:10:35'),
(1112, 11, 'Kab. Aceh Barat Daya', '2022-04-03 15:10:35'),
(1113, 11, 'Kab. Gayo Lues', '2022-04-03 15:10:35'),
(1114, 11, 'Kab. Aceh Jaya', '2022-04-03 15:10:35'),
(1115, 11, 'Kab. Nagan Raya', '2022-04-03 15:10:35'),
(1116, 11, 'Kab. Aceh Tamiang', '2022-04-03 15:10:35'),
(1117, 11, 'Kab. Bener Meriah', '2022-04-03 15:10:35'),
(1118, 11, 'Kab. Pidie Jaya', '2022-04-03 15:10:35'),
(1171, 11, 'Kota Banda Aceh', '2022-04-03 15:10:35'),
(1172, 11, 'Kota Sabang', '2022-04-03 15:10:35'),
(1173, 11, 'Kota Lhokseumawe', '2022-04-03 15:10:35'),
(1174, 11, 'Kota Langsa', '2022-04-03 15:10:35'),
(1175, 11, 'Kota Subulussalam', '2022-04-03 15:10:35'),
(1201, 12, 'Kab. Tapanuli Tengah', '2022-04-03 15:10:35'),
(1202, 12, 'Kab. Tapanuli Utara', '2022-04-03 15:10:35'),
(1203, 12, 'Kab. Tapanuli Selatan', '2022-04-03 15:10:35'),
(1204, 12, 'Kab. Nias', '2022-04-03 15:10:35'),
(1205, 12, 'Kab. Langkat', '2022-04-03 15:10:35'),
(1206, 12, 'Kab. Karo', '2022-04-03 15:10:35'),
(1207, 12, 'Kab. Deli Serdang', '2022-04-03 15:10:35'),
(1208, 12, 'Kab. Simalungun', '2022-04-03 15:10:35'),
(1209, 12, 'Kab. Asahan', '2022-04-03 15:10:35'),
(1211, 12, 'Kab. Dairi', '2022-04-03 15:10:35'),
(1212, 12, 'Kab. Toba Samosir', '2022-04-03 15:10:35'),
(1213, 12, 'Kab. Mandailing Natal', '2022-04-03 15:10:35'),
(1214, 12, 'Kab. Nias Selatan', '2022-04-03 15:10:35'),
(1215, 12, 'Kab. Pakpak Bharat', '2022-04-03 15:10:35'),
(1216, 12, 'Kab. Humbang Hasundutan', '2022-04-03 15:10:35'),
(1217, 12, 'Kab. Samosir', '2022-04-03 15:10:35'),
(1218, 12, 'Kab. Serdang Bedagai', '2022-04-03 15:10:35'),
(1219, 12, 'Kab. Batu Bara', '2022-04-03 15:10:35'),
(1220, 12, 'Kab. Padang Lawas Utara', '2022-04-03 15:10:35'),
(1221, 12, 'Kab. Padang Lawas', '2022-04-03 15:10:35'),
(1222, 12, 'Kab. Labuhanbatu Selatan', '2022-04-03 15:10:35'),
(1223, 12, 'Kab. Labuhanbatu Utara', '2022-04-03 15:10:35'),
(1224, 12, 'Kab. Nias Utara', '2022-04-03 15:10:35'),
(1225, 12, 'Kab. Nias Barat', '2022-04-03 15:10:35'),
(1271, 12, 'Kota Medan', '2022-04-03 15:10:35'),
(1272, 12, 'Kota Pematangsiantar', '2022-04-03 15:10:35'),
(1273, 12, 'Kota Sibolga', '2022-04-03 15:10:35'),
(1274, 12, 'Kota Tanjung Balai', '2022-04-03 15:10:35'),
(1275, 12, 'Kota Binjai', '2022-04-03 15:10:35'),
(1276, 12, 'Kota Tebing Tinggi', '2022-04-03 15:10:35'),
(1277, 12, 'Kota Padang Sidempuan', '2022-04-03 15:10:35'),
(1278, 12, 'Kota Gunungsitoli', '2022-04-03 15:10:35'),
(1301, 13, 'Kab. Pesisir Selatan', '2022-04-03 15:10:35'),
(1302, 13, 'Kab. Solok', '2022-04-03 15:10:35'),
(1303, 13, 'Kab. Sijunjung', '2022-04-03 15:10:35'),
(1304, 13, 'Kab. Tanah Datar', '2022-04-03 15:10:35'),
(1305, 13, 'Kab. Padang Pariaman', '2022-04-03 15:10:35'),
(1306, 13, 'Kab. Agam', '2022-04-03 15:10:35'),
(1307, 13, 'Kab. Lima Puluh Kota', '2022-04-03 15:10:35'),
(1308, 13, 'Kab. Pasaman', '2022-04-03 15:10:35'),
(1309, 13, 'Kab. Kepulauan Mentawai', '2022-04-03 15:10:35'),
(1310, 13, 'Kab. Dharmasraya', '2022-04-03 15:10:35'),
(1311, 13, 'Kab. Solok Selatan', '2022-04-03 15:10:35'),
(1312, 13, 'Kab. Pasaman Barat', '2022-04-03 15:10:35'),
(1371, 13, 'Kota Padang', '2022-04-03 15:10:35'),
(1372, 13, 'Kota Solok', '2022-04-03 15:10:35'),
(1373, 13, 'Kota Sawahlunto', '2022-04-03 15:10:35'),
(1374, 13, 'Kota Padang Panjang', '2022-04-03 15:10:35'),
(1375, 13, 'Kota Bukittinggi', '2022-04-03 15:10:35'),
(1376, 13, 'Kota Payakumbuh', '2022-04-03 15:10:35'),
(1377, 13, 'Kota Pariaman', '2022-04-03 15:10:35'),
(1401, 14, 'Kab. Kampar', '2022-04-03 15:10:35'),
(1402, 14, 'Kab. Indragiri Hulu', '2022-04-03 15:10:35'),
(1403, 14, 'Kab. Bengkalis', '2022-04-03 15:10:35'),
(1404, 14, 'Kab. Indragiri Hilir', '2022-04-03 15:10:35'),
(1405, 14, 'Kab. Pelalawan', '2022-04-03 15:10:35'),
(1406, 14, 'Kab. Rokan Hulu', '2022-04-03 15:10:35'),
(1407, 14, 'Kab. Rokan Hilir', '2022-04-03 15:10:35'),
(1408, 14, 'Kab. Siak', '2022-04-03 15:10:35'),
(1409, 14, 'Kab. Kuantan Singingi', '2022-04-03 15:10:35'),
(1410, 14, 'Kab. Kepulauan Meranti', '2022-04-03 15:10:35'),
(1471, 14, 'Kota Pekanbaru', '2022-04-03 15:10:35'),
(1472, 14, 'Kota Dumai', '2022-04-03 15:10:35'),
(1501, 15, 'Kab. Kerinci', '2022-04-03 15:10:35'),
(1502, 15, 'Kab. Merangin', '2022-04-03 15:10:35'),
(1503, 15, 'Kab. Sarolangun', '2022-04-03 15:10:35'),
(1504, 15, 'Kab. Batanghari', '2022-04-03 15:10:35'),
(1505, 15, 'Kab. Muaro Jambi', '2022-04-03 15:10:35'),
(1506, 15, 'Kab. Tanjung Jabung Barat', '2022-04-03 15:10:35'),
(1507, 15, 'Kab. Tanjung Jabung Timur', '2022-04-03 15:10:35'),
(1508, 15, 'Kab. Bungo', '2022-04-03 15:10:35'),
(1509, 15, 'Kab. Tebo', '2022-04-03 15:10:35'),
(1571, 15, 'Kota Jambi', '2022-04-03 15:10:35'),
(1572, 15, 'Kota Sungai Penuh', '2022-04-03 15:10:35'),
(1601, 16, 'Kab. Ogan Komering Ulu', '2022-04-03 15:10:35'),
(1602, 16, 'Kab. Ogan Komering Ilir', '2022-04-03 15:10:35'),
(1603, 16, 'Kab. Muara Enim', '2022-04-03 15:10:35'),
(1604, 16, 'Kab. Lahat', '2022-04-03 15:10:35'),
(1605, 16, 'Kab. Musi Rawas', '2022-04-03 15:10:35'),
(1606, 16, 'Kab. Musi Banyuasin', '2022-04-03 15:10:35'),
(1607, 16, 'Kab. Banyuasin', '2022-04-03 15:10:35'),
(1608, 16, 'Kab. Ogan Komering Ulu Timur', '2022-04-03 15:10:35'),
(1609, 16, 'Kab. Ogan Komering Ulu Selatan', '2022-04-03 15:10:35'),
(1610, 16, 'Kab. Ogan Ilir', '2022-04-03 15:10:35'),
(1611, 16, 'Kab. Empat Lawang', '2022-04-03 15:10:35'),
(1612, 16, 'Kab. Penukal Abab Lematang', '2022-04-03 15:10:35'),
(1613, 16, 'Kab. Musi Rawas Utara', '2022-04-03 15:10:35'),
(1671, 16, 'Kota Palembang', '2022-04-03 15:10:35'),
(1672, 16, 'Kota Pagar Alam', '2022-04-03 15:10:35'),
(1673, 16, 'Kota Lubuk Linggau', '2022-04-03 15:10:35'),
(1674, 16, 'Kota Prabumulih', '2022-04-03 15:10:35'),
(1701, 17, 'Kab. Bengkulu Selatan', '2022-04-03 15:10:35'),
(1702, 17, 'Kab. Rejang Lebong', '2022-04-03 15:10:35'),
(1703, 17, 'Kab. Bengkulu Utara', '2022-04-03 15:10:35'),
(1704, 17, 'Kab. Kaur', '2022-04-03 15:10:35'),
(1705, 17, 'Kab. Seluma', '2022-04-03 15:10:35'),
(1706, 17, 'Kab. Muko Muko', '2022-04-03 15:10:35'),
(1707, 17, 'Kab. Lebong', '2022-04-03 15:10:35'),
(1708, 17, 'Kab. Kepahiang', '2022-04-03 15:10:35'),
(1709, 17, 'Kab. Bengkulu Tengah', '2022-04-03 15:10:35'),
(1771, 17, 'Kota Bengkulu', '2022-04-03 15:10:35'),
(1801, 18, 'Kab. Lampung Selatan', '2022-04-03 15:10:35'),
(1802, 18, 'Kab. Lampung Tengah', '2022-04-03 15:10:35'),
(1803, 18, 'Kab. Lampung Utara', '2022-04-03 15:10:35'),
(1804, 18, 'Kab. Lampung Barat', '2022-04-03 15:10:35'),
(1805, 18, 'Kab. Tulang Bawang', '2022-04-03 15:10:35'),
(1806, 18, 'Kab. Tanggamus', '2022-04-03 15:10:35'),
(1807, 18, 'Kab. Lampung Timur', '2022-04-03 15:10:35'),
(1808, 18, 'Kab. Way Kanan', '2022-04-03 15:10:35'),
(1809, 18, 'Kab. Pesawaran', '2022-04-03 15:10:35'),
(1810, 18, 'Kab. Pringsewu', '2022-04-03 15:10:35'),
(1811, 18, 'Kab. Mesuji', '2022-04-03 15:10:35'),
(1812, 18, 'Kab. Tulang Bawang Barat', '2022-04-03 15:10:35'),
(1813, 18, 'Kab. Pesisir Barat', '2022-04-03 15:10:35'),
(1871, 18, 'Kota Bandar Lampung', '2022-04-03 15:10:35'),
(1872, 18, 'Kota Metro', '2022-04-03 15:10:35'),
(1901, 19, 'Kab. Bangka', '2022-04-03 15:10:35'),
(1902, 19, 'Kab. Belitung', '2022-04-03 15:10:35'),
(1903, 19, 'Kab. Bangka Selatan', '2022-04-03 15:10:35'),
(1904, 19, 'Kab. Bangka Tengah', '2022-04-03 15:10:35'),
(1905, 19, 'Kab. Bangka Barat', '2022-04-03 15:10:35'),
(1906, 19, 'Kab. Belitung Timur', '2022-04-03 15:10:35'),
(1971, 19, 'Kota Pangkal Pinang', '2022-04-03 15:10:35'),
(2102, 21, 'Kab. Karimun', '2022-04-03 15:10:35'),
(2103, 21, 'Kab. Natuna', '2022-04-03 15:10:35'),
(2104, 21, 'Kab. Lingga', '2022-04-03 15:10:35'),
(2105, 21, 'Kab. Kepulauan Anambas', '2022-04-03 15:10:35'),
(2171, 21, 'Kota Batam', '2022-04-03 15:10:35'),
(2172, 21, 'Kota Tanjung Pinang', '2022-04-03 15:10:35'),
(3101, 31, 'Kab. Adm. Kep. Seribu', '2022-04-03 15:10:35'),
(3171, 31, 'Kota Adm. Jakarta Pusat', '2022-04-03 15:10:35'),
(3172, 31, 'Kota Adm. Jakarta Utara', '2022-04-03 15:10:35'),
(3173, 31, 'Kota Adm. Jakarta Barat', '2022-04-03 15:10:35'),
(3174, 31, 'Kota Adm. Jakarta Selatan', '2022-04-03 15:10:35'),
(3175, 31, 'Kota Adm. Jakarta Timur', '2022-04-03 15:10:35'),
(3201, 32, 'Kab. Bogor', '2022-04-03 15:10:35'),
(3202, 32, 'Kab. Sukabumi', '2022-04-03 15:10:35'),
(3203, 32, 'Kab. Cianjur', '2022-04-03 15:10:35'),
(3204, 32, 'Kab. Bandung', '2022-04-03 15:10:35'),
(3205, 32, 'Kab. Garut', '2022-04-03 15:10:35'),
(3206, 32, 'Kab. Tasikmalaya', '2022-04-03 15:10:35'),
(3207, 32, 'Kab. Ciamis', '2022-04-03 15:10:35'),
(3208, 32, 'Kab. Kuningan', '2022-04-03 15:10:35'),
(3209, 32, 'Kab. Cirebon', '2022-04-03 15:10:35'),
(3210, 32, 'Kab. Majalengka', '2022-04-03 15:10:35'),
(3211, 32, 'Kab. Sumedang', '2022-04-03 15:10:35'),
(3212, 32, 'Kab. Indramayu', '2022-04-03 15:10:35'),
(3213, 32, 'Kab. Subang', '2022-04-03 15:10:35'),
(3214, 32, 'Kab. Purwakarta', '2022-04-03 15:10:35'),
(3215, 32, 'Kab. Karawang', '2022-04-03 15:10:35'),
(3216, 32, 'Kab. Bekasi', '2022-04-03 15:10:35'),
(3217, 32, 'Kab. Bandung Barat', '2022-04-03 15:10:35'),
(3218, 32, 'Kab. Pangandaran', '2022-04-03 15:10:35'),
(3271, 32, 'Kota Bogor', '2022-04-03 15:10:35'),
(3272, 32, 'Kota Sukabumi', '2022-04-03 15:10:35'),
(3273, 32, 'Kota Bandung', '2022-04-03 15:10:35'),
(3274, 32, 'Kota Cirebon', '2022-04-03 15:10:35'),
(3275, 32, 'Kota Bekasi', '2022-04-03 15:10:35'),
(3276, 32, 'Kota Depok', '2022-04-03 15:10:35'),
(3277, 32, 'Kota Cimahi', '2022-04-03 15:10:35'),
(3278, 32, 'Kota Tasikmalaya', '2022-04-03 15:10:35'),
(3279, 32, 'Kota Banjar', '2022-04-03 15:10:35'),
(3301, 33, 'Kab. Cilacap', '2022-04-03 15:10:35'),
(3302, 33, 'Kab. Banyumas', '2022-04-03 15:10:35'),
(3303, 33, 'Kab. Purbalingga', '2022-04-03 15:10:35'),
(3304, 33, 'Kab. Banjarnegara', '2022-04-03 15:10:35'),
(3305, 33, 'Kab. Kebumen', '2022-04-03 15:10:35'),
(3306, 33, 'Kab. Purworejo', '2022-04-03 15:10:35'),
(3307, 33, 'Kab. Wonosobo', '2022-04-03 15:10:35'),
(3308, 33, 'Kab. Magelang', '2022-04-03 15:10:35'),
(3309, 33, 'Kab. Boyolali', '2022-04-03 15:10:35'),
(3310, 33, 'Kab. Klaten', '2022-04-03 15:10:35'),
(3311, 33, 'Kab. Sukoharjo', '2022-04-03 15:10:35'),
(3312, 33, 'Kab. Wonogiri', '2022-04-03 15:10:35'),
(3313, 33, 'Kab. Karanganyar', '2022-04-03 15:10:35'),
(3314, 33, 'Kab. Sragen', '2022-04-03 15:10:35'),
(3315, 33, 'Kab. Grobogan', '2022-04-03 15:10:35'),
(3316, 33, 'Kab. Blora', '2022-04-03 15:10:35'),
(3317, 33, 'Kab. Rembang', '2022-04-03 15:10:35'),
(3318, 33, 'Kab. Pati', '2022-04-03 15:10:35'),
(3319, 33, 'Kab. Kudus', '2022-04-03 15:10:35'),
(3320, 33, 'Kab. Jepara', '2022-04-03 15:10:35'),
(3321, 33, 'Kab. Demak', '2022-04-03 15:10:35'),
(3322, 33, 'Kab. Semarang', '2022-04-03 15:10:35'),
(3323, 33, 'Kab. Temanggung', '2022-04-03 15:10:35'),
(3324, 33, 'Kab. Kendal', '2022-04-03 15:10:35'),
(3325, 33, 'Kab. Batang', '2022-04-03 15:10:35'),
(3326, 33, 'Kab. Pekalongan', '2022-04-03 15:10:35'),
(3327, 33, 'Kab. Pemalang', '2022-04-03 15:10:35'),
(3328, 33, 'Kab. Tegal', '2022-04-03 15:10:35'),
(3329, 33, 'Kab. Brebes', '2022-04-03 15:10:35'),
(3371, 33, 'Kota Magelang', '2022-04-03 15:10:35'),
(3372, 33, 'Kota Surakarta', '2022-04-03 15:10:35'),
(3373, 33, 'Kota Salatiga', '2022-04-03 15:10:35'),
(3374, 33, 'Kota Semarang', '2022-04-03 15:10:35'),
(3375, 33, 'Kota Pekalongan', '2022-04-03 15:10:35'),
(3376, 33, 'Kota Tegal', '2022-04-03 15:10:35'),
(3401, 34, 'Kab. Kulon Progo', '2022-04-03 15:10:35'),
(3402, 34, 'Kab. Bantul', '2022-04-03 15:10:35'),
(3403, 34, 'Kab. Gunungkidul', '2022-04-03 15:10:35'),
(3404, 34, 'Kab. Sleman', '2022-04-03 15:10:35'),
(3471, 34, 'Kota Yogyakarta', '2022-04-03 15:10:35'),
(3501, 35, 'Kab. Pacitan', '2022-04-03 15:10:35'),
(3502, 35, 'Kab. Ponorogo', '2022-04-03 15:10:35'),
(3503, 35, 'Kab. Trenggalek', '2022-04-03 15:10:35'),
(3504, 35, 'Kab. Tulungagung', '2022-04-03 15:10:35'),
(3505, 35, 'Kab. Blitar', '2022-04-03 15:10:35'),
(3506, 35, 'Kab. Kediri', '2022-04-03 15:10:35'),
(3507, 35, 'Kab. Malang', '2022-04-03 15:10:35'),
(3508, 35, 'Kab. Lumajang', '2022-04-03 15:10:35'),
(3509, 35, 'Kab. Jember', '2022-04-03 15:10:35'),
(3510, 35, 'Kab. Banyuwangi', '2022-04-03 15:10:35'),
(3511, 35, 'Kab. Bondowoso', '2022-04-03 15:10:35'),
(3512, 35, 'Kab. Situbondo', '2022-04-03 15:10:35'),
(3513, 35, 'Kab. Probolinggo', '2022-04-03 15:10:35'),
(3514, 35, 'Kab. Pasuruan', '2022-04-03 15:10:35'),
(3515, 35, 'Kab. Sidoarjo', '2022-04-03 15:10:35'),
(3516, 35, 'Kab. Mojokerto', '2022-04-03 15:10:35'),
(3517, 35, 'Kab. Jombang', '2022-04-03 15:10:35'),
(3518, 35, 'Kab. Nganjuk', '2022-04-03 15:10:35'),
(3519, 35, 'Kab. Madiun', '2022-04-03 15:10:35'),
(3520, 35, 'Kab. Magetan', '2022-04-03 15:10:35'),
(3521, 35, 'Kab. Ngawi', '2022-04-03 15:10:35'),
(3522, 35, 'Kab. Bojonegoro', '2022-04-03 15:10:35'),
(3523, 35, 'Kab. Tuban', '2022-04-03 15:10:35'),
(3524, 35, 'Kab. Lamongan', '2022-04-03 15:10:35'),
(3525, 35, 'Kab. Gresik', '2022-04-03 15:10:35'),
(3526, 35, 'Kab. Bangkalan', '2022-04-03 15:10:35'),
(3527, 35, 'Kab. Sampang', '2022-04-03 15:10:35'),
(3528, 35, 'Kab. Pamekasan', '2022-04-03 15:10:35'),
(3529, 35, 'Kab. Sumenep', '2022-04-03 15:10:35'),
(3571, 35, 'Kota Kediri', '2022-04-03 15:10:35'),
(3572, 35, 'Kota Blitar', '2022-04-03 15:10:35'),
(3573, 35, 'Kota Malang', '2022-04-03 15:10:35'),
(3574, 35, 'Kota Probolinggo', '2022-04-03 15:10:35'),
(3575, 35, 'Kota Pasuruan', '2022-04-03 15:10:35'),
(3576, 35, 'Kota Mojokerto', '2022-04-03 15:10:35'),
(3577, 35, 'Kota Madiun', '2022-04-03 15:10:35'),
(3578, 35, 'Kota Surabaya', '2022-04-03 15:10:35'),
(3579, 35, 'Kota Batu', '2022-04-03 15:10:35'),
(3601, 36, 'Kab. Pandeglang', '2022-04-03 15:10:35'),
(3602, 36, 'Kab. Lebak', '2022-04-03 15:10:35'),
(3603, 36, 'Kab. Tangerang', '2022-04-03 15:10:35'),
(3604, 36, 'Kab. Serang', '2022-04-03 15:10:35'),
(3671, 36, 'Kota Tangerang', '2022-04-03 15:10:35'),
(3672, 36, 'Kota Cilegon', '2022-04-03 15:10:35'),
(3673, 36, 'Kota Serang', '2022-04-03 15:10:35'),
(3674, 36, 'Kota Tangerang Selatan', '2022-04-03 15:10:35'),
(5101, 51, 'Kab. Jembrana', '2022-04-03 15:10:35'),
(5102, 51, 'Kab. Tabanan', '2022-04-03 15:10:35'),
(5103, 51, 'Kab. Badung', '2022-04-03 15:10:35'),
(5104, 51, 'Kab. Gianyar', '2022-04-03 15:10:35'),
(5105, 51, 'Kab. Klungkung', '2022-04-03 15:10:35'),
(5106, 51, 'Kab. Bangli', '2022-04-03 15:10:35'),
(5107, 51, 'Kab. Karangasem', '2022-04-03 15:10:35'),
(5108, 51, 'Kab. Buleleng', '2022-04-03 15:10:35'),
(5171, 51, 'Kota Denpasar', '2022-04-03 15:10:35'),
(5201, 52, 'Kab. Lombok Barat', '2022-04-03 15:10:35'),
(5202, 52, 'Kab. Lombok Tengah', '2022-04-03 15:10:35'),
(5203, 52, 'Kab. Lombok Timur', '2022-04-03 15:10:35'),
(5204, 52, 'Kab. Sumbawa', '2022-04-03 15:10:35'),
(5205, 52, 'Kab. Dompu', '2022-04-03 15:10:35'),
(5206, 52, 'Kab. Bima', '2022-04-03 15:10:35'),
(5207, 52, 'Kab. Sumbawa Barat', '2022-04-03 15:10:35'),
(5208, 52, 'Kab. Lombok Utara', '2022-04-03 15:10:35'),
(5271, 52, 'Kota Mataram', '2022-04-03 15:10:35'),
(5272, 52, 'Kota Bima', '2022-04-03 15:10:35'),
(5301, 53, 'Kab. Kupang', '2022-04-03 15:10:35'),
(5302, 53, 'Kab Timor Tengah Selatan', '2022-04-03 15:10:35'),
(5303, 53, 'Kab. Timor Tengah Utara', '2022-04-03 15:10:35'),
(5304, 53, 'Kab. Belu', '2022-04-03 15:10:35'),
(5305, 53, 'Kab. Alor', '2022-04-03 15:10:35'),
(5306, 53, 'Kab. Flores Timur', '2022-04-03 15:10:35'),
(5307, 53, 'Kab. Sikka', '2022-04-03 15:10:35'),
(5308, 53, 'Kab. Ende', '2022-04-03 15:10:35'),
(5309, 53, 'Kab. Ngada', '2022-04-03 15:10:35'),
(5310, 53, 'Kab. Manggarai', '2022-04-03 15:10:35'),
(5311, 53, 'Kab. Sumba Timur', '2022-04-03 15:10:35'),
(5312, 53, 'Kab. Sumba Barat', '2022-04-03 15:10:35'),
(5313, 53, 'Kab. Lembata', '2022-04-03 15:10:35'),
(5314, 53, 'Kab. Rote Ndao', '2022-04-03 15:10:35'),
(5315, 53, 'Kab. Manggarai Barat', '2022-04-03 15:10:35'),
(5316, 53, 'Kab. Nagekeo', '2022-04-03 15:10:35'),
(5317, 53, 'Kab. Sumba Tengah', '2022-04-03 15:10:35'),
(5318, 53, 'Kab. Sumba Barat Daya', '2022-04-03 15:10:35'),
(5319, 53, 'Kab. Manggarai Timur', '2022-04-03 15:10:35'),
(5320, 53, 'Kab. Sabu Raijua', '2022-04-03 15:10:35'),
(5321, 53, 'Kab. Malaka', '2022-04-03 15:10:35'),
(5371, 53, 'Kota Kupang', '2022-04-03 15:10:35'),
(6101, 61, 'Kab. Sambas', '2022-04-03 15:10:35'),
(6102, 61, 'Kab. Mempawah', '2022-04-03 15:10:35'),
(6103, 61, 'Kab. Sanggau', '2022-04-03 15:10:35'),
(6104, 61, 'Kab. Ketapang', '2022-04-03 15:10:35'),
(6105, 61, 'Kab. Sintang', '2022-04-03 15:10:35'),
(6106, 61, 'Kab. Kapuas Hulu', '2022-04-03 15:10:35'),
(6107, 61, 'Kab. Bengkayang', '2022-04-03 15:10:35'),
(6108, 61, 'Kab. Landak', '2022-04-03 15:10:35'),
(6109, 61, 'Kab. Sekadau', '2022-04-03 15:10:35'),
(6110, 61, 'Kab. Melawi', '2022-04-03 15:10:35'),
(6111, 61, 'Kab. Kayong Utara', '2022-04-03 15:10:35'),
(6112, 61, 'Kab. Kubu Raya', '2022-04-03 15:10:35'),
(6171, 61, 'Kota Pontianak', '2022-04-03 15:10:35'),
(6172, 61, 'Kota Singkawang', '2022-04-03 15:10:35'),
(6201, 62, 'Kab. Kotawaringin Barat', '2022-04-03 15:10:35'),
(6202, 62, 'Kab. Kotawaringin Timur', '2022-04-03 15:10:35'),
(6203, 62, 'Kab. Kapuas', '2022-04-03 15:10:35'),
(6204, 62, 'Kab. Barito Selatan', '2022-04-03 15:10:35'),
(6205, 62, 'Kab. Barito Utara', '2022-04-03 15:10:35'),
(6206, 62, 'Kab. Katingan', '2022-04-03 15:10:35'),
(6207, 62, 'Kab. Seruyan', '2022-04-03 15:10:35'),
(6208, 62, 'Kab. Sukamara', '2022-04-03 15:10:35'),
(6209, 62, 'Kab. Lamandau', '2022-04-03 15:10:35'),
(6210, 62, 'Kab. Gunung Mas', '2022-04-03 15:10:35'),
(6211, 62, 'Kab. Pulang Pisau', '2022-04-03 15:10:35'),
(6212, 62, 'Kab. Murung Raya', '2022-04-03 15:10:35'),
(6213, 62, 'Kab. Barito Timur', '2022-04-03 15:10:35'),
(6271, 62, 'Kota Palangkaraya', '2022-04-03 15:10:35'),
(6301, 63, 'Kab. Tanah Laut', '2022-04-03 15:10:35'),
(6302, 63, 'Kab. Kotabaru', '2022-04-03 15:10:35'),
(6303, 63, 'Kab. Banjar', '2022-04-03 15:10:35'),
(6304, 63, 'Kab. Barito Kuala', '2022-04-03 15:10:35'),
(6305, 63, 'Kab. Tapin', '2022-04-03 15:10:35'),
(6306, 63, 'Kab. Hulu Sungai Selatan', '2022-04-03 15:10:35'),
(6307, 63, 'Kab. Hulu Sungai Tengah', '2022-04-03 15:10:35'),
(6308, 63, 'Kab. Hulu Sungai Utara', '2022-04-03 15:10:35'),
(6309, 63, 'Kab. Tabalong', '2022-04-03 15:10:35'),
(6310, 63, 'Kab. Tanah Bumbu', '2022-04-03 15:10:35'),
(6311, 63, 'Kab. Balangan', '2022-04-03 15:10:35'),
(6371, 63, 'Kota Banjarmasin', '2022-04-03 15:10:35'),
(6372, 63, 'Kota Banjarbaru', '2022-04-03 15:10:35'),
(6401, 64, 'Kab. Paser', '2022-04-03 15:10:35'),
(6402, 64, 'Kab. Kutai Kartanegara', '2022-04-03 15:10:35'),
(6403, 64, 'Kab. Berau', '2022-04-03 15:10:35'),
(6407, 64, 'Kab. Kutai Barat', '2022-04-03 15:10:35'),
(6408, 64, 'Kab. Kutai Timur', '2022-04-03 15:10:35'),
(6409, 64, 'Kab. Penajam Paser Utara', '2022-04-03 15:10:35'),
(6411, 64, 'Kab. Mahakam Ulu', '2022-04-03 15:10:35'),
(6471, 64, 'Kota Balikpapan', '2022-04-03 15:10:35'),
(6472, 64, 'Kota Samarinda', '2022-04-03 15:10:35'),
(6474, 64, 'Kota Bontang', '2022-04-03 15:10:35'),
(6501, 65, 'Kab. Bulungan', '2022-04-03 15:10:35'),
(6502, 65, 'Kab. Malinau', '2022-04-03 15:10:35'),
(6503, 65, 'Kab. Nunukan', '2022-04-03 15:10:35'),
(6504, 65, 'Kab. Tana Tidung', '2022-04-03 15:10:35'),
(6571, 65, 'Kota Tarakan', '2022-04-03 15:10:35'),
(7101, 71, 'Kab. Bolaang Mongondow', '2022-04-03 15:10:35'),
(7102, 71, 'Kab. Minahasa', '2022-04-03 15:10:35'),
(7103, 71, 'Kab. Kepulauan Sangihe', '2022-04-03 15:10:35'),
(7104, 71, 'Kab. Kepulauan Talaud', '2022-04-03 15:10:35'),
(7105, 71, 'Kab. Minahasa Selatan', '2022-04-03 15:10:35'),
(7106, 71, 'Kab. Minahasa Utara', '2022-04-03 15:10:35'),
(7107, 71, 'Kab. Minahasa Tenggara', '2022-04-03 15:10:35'),
(7108, 71, 'Kab. Bolaang Mongondow Utara', '2022-04-03 15:10:35'),
(7109, 71, 'Kab. Kep. Siau Tagulandang Biaro', '2022-04-03 15:10:35'),
(7110, 71, 'Kab. Bolaang Mongondow Timur', '2022-04-03 15:10:35'),
(7111, 71, 'Kab. Bolaang Mongondow Selatan', '2022-04-03 15:10:35'),
(7171, 71, 'Kota Manado', '2022-04-03 15:10:35'),
(7172, 71, 'Kota Bitung', '2022-04-03 15:10:35'),
(7173, 71, 'Kota Tomohon', '2022-04-03 15:10:35'),
(7174, 71, 'Kota Kotamobagu', '2022-04-03 15:10:35'),
(7201, 72, 'Kab. Banggai', '2022-04-03 15:10:35'),
(7202, 72, 'Kab. Poso', '2022-04-03 15:10:35'),
(7203, 72, 'Kab. Donggala', '2022-04-03 15:10:35'),
(7204, 72, 'Kab. Toli Toli', '2022-04-03 15:10:35'),
(7205, 72, 'Kab. Buol', '2022-04-03 15:10:35'),
(7206, 72, 'Kab. Morowali', '2022-04-03 15:10:35'),
(7207, 72, 'Kab. Banggai Kepulauan', '2022-04-03 15:10:35'),
(7208, 72, 'Kab. Parigi Moutong', '2022-04-03 15:10:35'),
(7209, 72, 'Kab. Tojo Una Una', '2022-04-03 15:10:35'),
(7210, 72, 'Kab. Sigi', '2022-04-03 15:10:35'),
(7211, 72, 'Kab. Banggai Laut', '2022-04-03 15:10:35'),
(7212, 72, 'Kab. Morowali Utara', '2022-04-03 15:10:35'),
(7271, 72, 'Kota Palu', '2022-04-03 15:10:35'),
(7301, 73, 'Kab. Kepulauan Selayar', '2022-04-03 15:10:35'),
(7302, 73, 'Kab. Bulukumba', '2022-04-03 15:10:35'),
(7303, 73, 'Kab. Bantaeng', '2022-04-03 15:10:35'),
(7304, 73, 'Kab. Jeneponto', '2022-04-03 15:10:35'),
(7305, 73, 'Kab. Takalar', '2022-04-03 15:10:35'),
(7306, 73, 'Kab. Gowa', '2022-04-03 15:10:35'),
(7307, 73, 'Kab. Sinjai', '2022-04-03 15:10:35'),
(7308, 73, 'Kab. Bone', '2022-04-03 15:10:35'),
(7309, 73, 'Kab. Maros', '2022-04-03 15:10:35'),
(7310, 73, 'Kab. Pangkajene Kepulauan', '2022-04-03 15:10:35'),
(7311, 73, 'Kab. Barru', '2022-04-03 15:10:35'),
(7312, 73, 'Kab. Soppeng', '2022-04-03 15:10:35'),
(7313, 73, 'Kab. Wajo', '2022-04-03 15:10:35'),
(7314, 73, 'Kab. Sidenreng Rappang', '2022-04-03 15:10:35'),
(7315, 73, 'Kab. Pinrang', '2022-04-03 15:10:35'),
(7316, 73, 'Kab. Enrekang', '2022-04-03 15:10:35'),
(7317, 73, 'Kab. Luwu', '2022-04-03 15:10:35'),
(7318, 73, 'Kab. Tana Toraja', '2022-04-03 15:10:35'),
(7322, 73, 'Kab. Luwu Utara', '2022-04-03 15:10:35'),
(7324, 73, 'Kab. Luwu Timur', '2022-04-03 15:10:35'),
(7326, 73, 'Kab. Toraja Utara', '2022-04-03 15:10:35'),
(7371, 73, 'Kota Makassar', '2022-04-03 15:10:35'),
(7372, 73, 'Kota Pare Pare', '2022-04-03 15:10:35'),
(7373, 73, 'Kota Palopo', '2022-04-03 15:10:35'),
(7401, 74, 'Kab. Kolaka', '2022-04-03 15:10:35'),
(7402, 74, 'Kab. Konawe', '2022-04-03 15:10:35'),
(7403, 74, 'Kab. Muna', '2022-04-03 15:10:35'),
(7404, 74, 'Kab. Buton', '2022-04-03 15:10:35'),
(7405, 74, 'Kab. Konawe Selatan', '2022-04-03 15:10:35'),
(7406, 74, 'Kab. Bombana', '2022-04-03 15:10:35'),
(7407, 74, 'Kab. Wakatobi', '2022-04-03 15:10:35'),
(7408, 74, 'Kab. Kolaka Utara', '2022-04-03 15:10:35'),
(7409, 74, 'Kab. Konawe Utara', '2022-04-03 15:10:35'),
(7410, 74, 'Kab. Buton Utara', '2022-04-03 15:10:35'),
(7411, 74, 'Kab. Kolaka Timur', '2022-04-03 15:10:35'),
(7412, 74, 'Kab. Konawe Kepulauan', '2022-04-03 15:10:35'),
(7413, 74, 'Kab. Muna Barat', '2022-04-03 15:10:35'),
(7414, 74, 'Kab. Buton Tengah', '2022-04-03 15:10:35'),
(7415, 74, 'Kab. Buton Selatan', '2022-04-03 15:10:35'),
(7471, 74, 'Kota Kendari', '2022-04-03 15:10:35'),
(7472, 74, 'Kota Bau Bau', '2022-04-03 15:10:35'),
(7501, 75, 'Kab. Gorontalo', '2022-04-03 15:10:35'),
(7502, 75, 'Kab. Boalemo', '2022-04-03 15:10:35'),
(7503, 75, 'Kab. Bone Bolango', '2022-04-03 15:10:35'),
(7504, 75, 'Kab. Pahuwato', '2022-04-03 15:10:35'),
(7505, 75, 'Kab. Gorontalo Utara', '2022-04-03 15:10:35'),
(7571, 75, 'Kota Gorontalo', '2022-04-03 15:10:35'),
(7601, 76, 'Kab. Pasangkayu', '2022-04-03 15:10:35'),
(7602, 76, 'Kab. Mamuju', '2022-04-03 15:10:35'),
(7603, 76, 'Kab. Mamasa', '2022-04-03 15:10:35'),
(7604, 76, 'Kab. Polewali Mandar', '2022-04-03 15:10:35'),
(7605, 76, 'Kab. Majene', '2022-04-03 15:10:35'),
(7606, 76, 'Kab. Mamuju Tengah', '2022-04-03 15:10:35'),
(8101, 81, 'Kab. Maluku Tengah', '2022-04-03 15:10:35'),
(8102, 81, 'Kab. Maluku Tenggara', '2022-04-03 15:10:35'),
(8103, 81, 'Kab. Kepulauan Tanimbar', '2022-04-03 15:10:35'),
(8104, 81, 'Kab. Buru', '2022-04-03 15:10:35'),
(8105, 81, 'Kab. Seram Bagian Timur', '2022-04-03 15:10:35'),
(8106, 81, 'Kab. Seram Bagian Barat', '2022-04-03 15:10:35'),
(8107, 81, 'Kab. Kepulauan Aru', '2022-04-03 15:10:35'),
(8108, 81, 'Kab. Maluku Barat Daya', '2022-04-03 15:10:35'),
(8109, 81, 'Kab. Buru Selatan', '2022-04-03 15:10:35'),
(8171, 81, 'Kota Ambon', '2022-04-03 15:10:35'),
(8172, 81, 'Kota Tual', '2022-04-03 15:10:35'),
(8201, 82, 'Kab. Halmahera Barat', '2022-04-03 15:10:35'),
(8202, 82, 'Kab. Halmahera Tengah', '2022-04-03 15:10:35'),
(8203, 82, 'Kab. Halmahera Utara', '2022-04-03 15:10:35'),
(8204, 82, 'Kab. Halmahera Selatan', '2022-04-03 15:10:35'),
(8205, 82, 'Kab. Kepulauan Sula', '2022-04-03 15:10:35'),
(8206, 82, 'Kab. Halmahera Timur', '2022-04-03 15:10:35'),
(8207, 82, 'Kab. Pulau Morotai', '2022-04-03 15:10:35'),
(8208, 82, 'Kab. Pulau Taliabu', '2022-04-03 15:10:35'),
(8271, 82, 'Kota Ternate', '2022-04-03 15:10:35'),
(8272, 82, 'Kota Tidore Kepulauan', '2022-04-03 15:10:35'),
(9101, 91, 'Kab. Merauke', '2022-04-03 15:10:35'),
(9102, 91, 'Kab. Jayawijaya', '2022-04-03 15:10:35'),
(9103, 91, 'Kab. Jayapura', '2022-04-03 15:10:35'),
(9104, 91, 'Kab. Nabire', '2022-04-03 15:10:35'),
(9105, 91, 'Kab. Kepulauan Yapen', '2022-04-03 15:10:35'),
(9106, 91, 'Kab. Biak Numfor', '2022-04-03 15:10:35'),
(9107, 91, 'Kab. Puncak Jaya', '2022-04-03 15:10:35'),
(9108, 91, 'Kab. Paniai', '2022-04-03 15:10:35'),
(9109, 91, 'Kab. Mimika', '2022-04-03 15:10:35'),
(9110, 91, 'Kab. Sarmi', '2022-04-03 15:10:35'),
(9111, 91, 'Kab. Keerom', '2022-04-03 15:10:35'),
(9112, 91, 'Kab Pegunungan Bintang', '2022-04-03 15:10:35'),
(9113, 91, 'Kab. Yahukimo', '2022-04-03 15:10:35'),
(9114, 91, 'Kab. Tolikara', '2022-04-03 15:10:35'),
(9115, 91, 'Kab. Waropen', '2022-04-03 15:10:35'),
(9116, 91, 'Kab. Boven Digoel', '2022-04-03 15:10:35'),
(9117, 91, 'Kab. Mappi', '2022-04-03 15:10:35'),
(9118, 91, 'Kab. Asmat', '2022-04-03 15:10:35'),
(9119, 91, 'Kab. Supiori', '2022-04-03 15:10:35'),
(9120, 91, 'Kab. Mamberamo Raya', '2022-04-03 15:10:35'),
(9121, 91, 'Kab. Mamberamo Tengah', '2022-04-03 15:10:35'),
(9122, 91, 'Kab. Yalimo', '2022-04-03 15:10:35'),
(9123, 91, 'Kab. Lanny Jaya', '2022-04-03 15:10:35'),
(9124, 91, 'Kab. Nduga', '2022-04-03 15:10:35'),
(9125, 91, 'Kab. Puncak', '2022-04-03 15:10:35'),
(9126, 91, 'Kab. Dogiyai', '2022-04-03 15:10:35'),
(9127, 91, 'Kab. Intan Jaya', '2022-04-03 15:10:35'),
(9128, 91, 'Kab. Deiyai', '2022-04-03 15:10:35'),
(9171, 91, 'Kota Jayapura', '2022-04-03 15:10:35'),
(9201, 92, 'Kab. Sorong', '2022-04-03 15:10:35'),
(9202, 92, 'Kab. Manokwari', '2022-04-03 15:10:35'),
(9203, 92, 'Kab. Fak Fak', '2022-04-03 15:10:35'),
(9204, 92, 'Kab. Sorong Selatan', '2022-04-03 15:10:35'),
(9205, 92, 'Kab. Raja Ampat', '2022-04-03 15:10:35'),
(9206, 92, 'Kab. Teluk Bintuni', '2022-04-03 15:10:35'),
(9207, 92, 'Kab. Teluk Wondama', '2022-04-03 15:10:35'),
(9208, 92, 'Kab. Kaimana', '2022-04-03 15:10:35'),
(9209, 92, 'Kab. Tambrauw', '2022-04-03 15:10:35'),
(9210, 92, 'Kab. Maybrat', '2022-04-03 15:10:35'),
(9211, 92, 'Kab. Manokwari Selatan', '2022-04-03 15:10:35'),
(9212, 92, 'Kab. Pegunungan Arfak', '2022-04-03 15:10:35'),
(9271, 92, 'Kota Sorong', '2022-04-03 15:10:35');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_prov` (`id_prov`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9272;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD CONSTRAINT `kabupaten_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `provinsi` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
