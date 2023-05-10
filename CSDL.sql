-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th4 17, 2023 lúc 03:14 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `uneti_ecommerce`
--
DROP DATABASE IF EXISTS `uneti_ecommerce`;
CREATE DATABASE IF NOT EXISTS `uneti_ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `uneti_ecommerce`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `created_at`, `updated_at`) VALUES
(24, 'Điện thoại', '2023-04-05 00:25:07', '2023-04-05 00:27:14'),
(25, 'Laptop', '2023-04-05 00:26:34', '2023-04-05 00:26:34'),
(26, 'Máy tính bảng', '2023-04-05 00:27:08', '2023-04-05 00:27:08'),
(27, 'Âm thanh', '2023-04-05 00:27:30', '2023-04-05 00:27:30'),
(29, 'Tivi', '2023-04-05 00:27:51', '2023-04-05 00:27:51'),
(30, 'PC - Màn hình', '2023-04-05 00:28:13', '2023-04-05 00:28:13'),
(31, 'Đồng hồ thông minh', '2023-04-05 02:18:58', '2023-04-05 02:18:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_class`
--

DROP TABLE IF EXISTS `customer_class`;
CREATE TABLE `customer_class` (
  `cclas_id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_class_has_category`
--

DROP TABLE IF EXISTS `customer_class_has_category`;
CREATE TABLE `customer_class_has_category` (
  `customer_class_cclas_id` int(11) NOT NULL,
  `category_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `file_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`image_id`, `file_name`, `products_product_id`) VALUES
(16, '1680629550268-269565630_iphone14.jpeg', 35),
(18, '1680630113801-39226669_14plus.jpeg', 37),
(19, '1680630571948-705372974_iphone-13-pro-max.jpeg', 38),
(20, '1680630704851-334244122_13mini.jpeg', 39),
(21, '1680630855231-8862482_11pro.jpeg', 40),
(22, '1680631026761-211096094_ip11.jpeg', 41),
(23, '1680631127227-572885233_ip8.jpeg', 42),
(24, '1680631364563-195223759_8pl.png', 43),
(25, '1680631555117-653979780_ip6s.jpeg', 44),
(26, '1680634470725-799216551_zflip4.jpeg', 45),
(27, '1680634886445-893703313_s23u.jpeg', 46),
(28, '1680635123592-235124022_xiaomi12.jpeg', 47),
(29, '1680635230617-713807277_21fe.jpg', 48),
(30, '1680635389102-698473957_zfold.jpeg', 49),
(31, '1680635575927-50568346_bphone.jpeg', 50),
(32, '1680636045030-716100697_lap1.jpeg', 51),
(33, '1680636154241-394507274_lap2.jpeg', 52),
(34, '1680636243695-762423404_lap3.jpeg', 53),
(35, '1680636437649-734456819_lap4.jpeg', 54),
(36, '1680636526394-675333626_lap5.jpeg', 55),
(37, '1680636820939-675691096_lap6.jpeg', 56),
(38, '1680636894133-614887788_lap7.jpeg', 57),
(39, '1680636958970-520749653_lap8.jpeg', 58),
(40, '1680637181208-282037057_lap9.jpeg', 59),
(41, '1680637289532-25605654_lap10.jpeg', 60),
(42, '1680637383858-54298909_lap11.jpeg', 61),
(43, '1680637622306-73630464_lap12.png', 62),
(44, '1680637844131-273122115_pad1.jpeg', 63),
(45, '1680637945315-792746379_pad2.jpeg', 64),
(46, '1680638104391-652044197_pad3.png', 65),
(47, '1680638794305-934877218_pad4.png', 66),
(48, '1680638965757-24539031_watch1.png', 67),
(49, '1680667709610-861888683_w2.png', 68),
(50, '1680667790398-967385336_w3.png', 69),
(51, '1680668104984-19009970_at1.png', 70),
(52, '1680668180475-485937543_at2.png', 71),
(53, '1680668239326-126941126_at3.png', 72),
(54, '1680668296079-474026697_at4.png', 73),
(55, '1680668357504-532706835_at5.png', 74),
(56, '1680668433935-955725673_at6.png', 75),
(57, '1680668743035-13348639_at7.png', 76),
(58, '1680668839396-757167961_at8.png', 77),
(59, '1680668975483-710213359_at9.png', 78),
(60, '1680669046194-117628624_at10.png', 79),
(61, '1680669183048-65242735_mt5.png', 80),
(62, '1680669279907-758556938_pad5.png', 81),
(63, '1680669341619-745951703_pad6.png', 82),
(64, '1680669465172-287271763_at12.png', 83),
(65, '1680669538409-917181983_w4.png', 84),
(66, '1680669586984-393532131_w5.png', 85),
(67, '1680669641686-693292170_w6.png', 86),
(68, '1680669693751-483461461_w7.png', 87),
(69, '1680669753322-796764136_w8.png', 88),
(70, '1680669994904-540061501_tv1.png', 89),
(71, '1680670054540-202101999_tv2.png', 90),
(72, '1680670126782-177608202_tv3.png', 91),
(73, '1680670223449-71245438_tv4.png', 92),
(74, '1680670271987-907631855_tv5.png', 93),
(75, '1680670384630-356266216_tv6.png', 94),
(76, '1680670505286-875310221_pc1.png', 95),
(77, '1680670558994-322578897_pc2.png', 96),
(78, '1680670617959-792879042_pc3.png', 97),
(79, '1680670690518-539429077_pc4.png', 98),
(80, '1680670735099-471223738_pc5.png', 99),
(81, '1680670809358-540642914_pc7.png', 100),
(82, '1680961270818-651496993_sc1.png', 101);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `content` varchar(3600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messages_message_id` int(11) NOT NULL,
  `users_user_id` int(11) NOT NULL,
  `shop_shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `state` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `total_price` int(11) DEFAULT 0,
  `updated_at` datetime DEFAULT current_timestamp(),
  `users_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `state`, `created_at`, `total_price`, `updated_at`, `users_user_id`) VALUES
(20, 3, '2023-04-05 12:03:58', 0, '2023-04-05 14:10:57', 41),
(21, 2, '2023-04-05 14:04:11', 0, '2023-04-15 21:12:50', 41),
(22, 2, '2023-04-05 14:04:44', 0, '2023-04-05 15:59:50', 42),
(23, 3, '2023-04-05 15:38:56', 0, '2023-04-05 15:40:12', 43),
(24, 2, '2023-04-05 15:47:18', 0, '2023-04-05 16:04:24', 43),
(25, 3, '2023-04-05 15:49:44', 0, '2023-04-05 15:59:34', 44),
(26, 1, '2023-04-05 16:00:51', 0, '2023-04-05 16:01:06', 46),
(27, 0, '2023-04-05 16:01:25', 0, '2023-04-05 16:01:25', 46),
(28, 2, '2023-04-05 16:02:24', 0, '2023-04-05 16:04:31', 43),
(29, 0, '2023-04-05 16:02:58', 0, '2023-04-05 16:02:58', 43),
(30, 1, '2023-04-05 16:03:21', 0, '2023-04-05 16:03:42', 42),
(31, 0, '2023-04-05 16:03:50', 0, '2023-04-05 16:03:50', 42),
(32, 3, '2023-04-05 23:17:15', 0, '2023-04-15 21:12:56', 47),
(33, 3, '2023-04-06 02:17:55', 0, '2023-04-06 22:01:51', 47),
(34, 3, '2023-04-07 11:06:25', 0, '2023-04-15 21:13:05', 47),
(35, 1, '2023-04-11 19:30:25', 0, '2023-04-15 21:12:08', 47),
(36, 1, '2023-04-15 21:15:03', 0, '2023-04-15 21:26:16', 47);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `contents` varchar(3600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`, `contents`, `status`, `created_at`, `updated_at`) VALUES
(35, 'iPhone 14 Pro Max 256GB ', 27450000, 'Công nghệ màn hình:: OLED\r\nĐộ phân giải:: 2796 x 1290 Pixels\r\nMàn hình rộng:: 6.7\"\r\nĐộ phân giải: Chính 48 MP & Phụ 12 MP, 12 MP, 12 MP\r\nHệ điều hành: iOS 16\r\nChip xử lý (CPU): Apple A16 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 256GB\r\nRAM: 6 GB\r\nMạng di động: Hỗ trợ 5G\r\nSố khe sim: 1 Nano SIM & 1 eSIM\r\nDung lượng pin: 4323 mAh', 1, '2023-04-05 00:32:30', '2023-04-05 00:32:30'),
(37, 'iPhone 14 Plus (512GB)', 27390000, 'Công nghệ màn hình:: OLED\r\nĐộ phân giải:: Super Retina XDR (1284 x 2778 Pixels)\r\nMàn hình rộng:: 6.7\"\r\nĐộ phân giải: 2 camera 12 MP, 12 MP\r\nHệ điều hành: iOS 16\r\nChip xử lý (CPU): Apple A15 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 512 GB\r\nRAM: 6 GB\r\nMạng di động: Hỗ trợ 5G\r\nSố khe sim: 1 Nano SIM & 1 eSIM\r\nDung lượng pin: 4325 mAh', 1, '2023-04-05 00:41:53', '2023-04-05 00:41:53'),
(38, 'iPhone 13 Pro (512GB)', 29990000, 'Công nghệ màn hình:: OLED\r\nĐộ phân giải:: 1170 x 2532 Pixels\r\nĐộ phân giải: 3 camera 12 MP, 12 MP\r\nHệ điều hành: iOS 15\r\nChip xử lý (CPU): Apple A15 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 512 GB\r\nRAM: 6 GB\r\nMạng di động: Hỗ trợ 5G\r\nSố khe sim: 1 Nano SIM & 1 eSIM', 1, '2023-04-05 00:49:31', '2023-04-05 00:49:31'),
(39, 'iPhone 13 mini (512GB)', 26790000, 'Công nghệ màn hình:: OLED\r\nĐộ phân giải:: Full HD+ (1080 x 2340 Pixels)\r\nĐộ phân giải: 2 camera 12 MP, 12 MP\r\nHệ điều hành: iOS 15\r\nChip xử lý (CPU): Apple A15 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 512 GB\r\nRAM: 4 GB\r\nMạng di động: Hỗ trợ 5G\r\nSố khe sim: 1 Nano SIM & 1 eSIM', 1, '2023-04-05 00:51:44', '2023-04-05 00:51:44'),
(40, 'iPhone 11 Pro 64GB', 12450000, 'Màn hình:\r\n\r\nOLED5.8\"Super Retina XDR\r\nHệ điều hành:\r\n\r\niOS 14\r\nCamera sau:\r\n\r\n3 camera 12 MP\r\nCamera trước:\r\n\r\n12 MP\r\nChip:\r\n\r\nApple A13 Bionic\r\nRAM:\r\n\r\n4 GB\r\nDung lượng lưu trữ:\r\n\r\n64 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n3046 mAh', 0, '2023-04-05 00:54:15', '2023-04-11 20:09:26'),
(41, 'iPhone 11 – 64Gb ', 7350000, 'Màn hình:\r\nĐang cập nhật\r\nHệ điều hành:\r\niOS 15\r\nCamera sau:\r\n2 camera 12 MP\r\nCamera trước:\r\n12 MP\r\nChip:\r\nApple A13 Bionic 6 nhân\r\nRAM:\r\n4GB\r\nBộ nhớ trong:\r\n64GB\r\nSIM:\r\n1 Nano SIM & 1 eSIM\r\nPin / Sạc:\r\nĐang cập nhật', 1, '2023-04-05 00:57:06', '2023-04-05 00:57:06'),
(42, 'iPhone 8 64GB', 3250000, 'Màn hình:\r\n\r\nLED-backlit IPS LCD4.7\"Retina HD\r\nHệ điều hành:\r\n\r\niOS 14\r\nCamera sau:\r\n\r\n12 MP\r\nCamera trước:\r\n\r\n7 MP\r\nChip:\r\n\r\nApple A11 Bionic\r\nRAM:\r\n\r\n2 GB\r\nDung lượng lưu trữ:\r\n\r\n64 GB\r\nSIM:\r\n\r\n1 Nano SIM\r\nPin, Sạc:\r\n\r\n1821 mAh', 1, '2023-04-05 00:58:47', '2023-04-05 00:58:47'),
(43, 'iPhone 8 Plus 64GB', 5990000, 'Kích thước màn hình\r\n\r\n5.5 inches\r\nCamera sau\r\n\r\n12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), tự động lấy nét nhận diện theo giai đoạn, zoom quang 2x, 4 LED flash (2 tone)\r\nCamera trước\r\n\r\n7 MP, f/2.2, 1080p@30fps, 720p@240fps, nhận diện khuôn mặt, HDR, panorama\r\nChipset\r\n\r\nApple A11 Bionic APL1W72\r\nDung lượng RAM\r\n\r\n3 GB\r\nBộ nhớ trong\r\n\r\n64 GB\r\nPin\r\n\r\nLi-ion 2691 mAh\r\nThẻ SIM\r\n\r\nNano-SIM\r\nHệ điều hành\r\n\r\n11\r\nĐộ phân giải màn hình\r\n\r\n1080 x 1920 pixels (FullHD)\r\nTrọng lượng\r\n\r\n202 g (7.13 oz)', 1, '2023-04-05 01:02:44', '2023-04-05 01:02:44'),
(44, 'iPhone 6S 128GB', 2590000, 'Thông số kỹ thuật\r\nKích thước màn hình\r\n\r\n4.7 inches\r\nCamera sau\r\n\r\n12 MP (f/2.2, 29mm, 1/3\", 1.22 µm), tự động lấy nét nhận diện theo giai đoạn, LED flash kép (2 tone)\r\nCamera trước\r\n\r\n5 MP (f/2.2, 31mm), 1080p@30fps, 720p@240fps, nhận diện khuôn mặt, HDR, panorama\r\nChipset\r\n\r\nApple A9 APL0898\r\nBộ nhớ trong\r\n\r\n128 GB\r\nPin\r\n\r\nLi-ion 1715 mAh\r\nThẻ SIM\r\n\r\nNano-SIM\r\nHệ điều hành\r\n\r\n11\r\nĐộ phân giải màn hình\r\n\r\n750 x 1334 pixels\r\nTrọng lượng\r\n\r\n143 g (5.04 oz)', 1, '2023-04-05 01:05:55', '2023-04-05 01:05:55'),
(45, 'Samsung Galaxy Z Flip4 -128GB', 19290000, 'Công nghệ màn hình:: Chính: Dynamic AMOLED 2X, Phụ: Super AMOLED\r\nĐộ phân giải:: Chính: FHD+ (2640 x 1080 Pixels) x Phụ: (260 x 512 Pixels)\r\nMàn hình rộng:: Chính 6.7\" & Phụ 1.9\" - Tần số quét 120 Hz\r\nĐộ phân giải: 2 camera 12 MP, 10 MP\r\nHệ điều hành: Android 12\r\nChip xử lý (CPU): Snapdragon 8+ Gen 1 8 nhân\r\nBộ nhớ trong (ROM): 128 GB\r\nRAM: 8 GB\r\nMạng di động: Hỗ trợ 5G\r\nSố khe sim: 1 Nano SIM & 1 eSIM\r\nDung lượng pin: 3700 mAh', 1, '2023-04-05 01:54:30', '2023-04-05 01:54:30'),
(46, 'Samsung Galaxy S23 Ultra 8GB/256GB', 23990000, 'Độ phân giải:: 3088 x 1440 (Edge Quad HD+)\r\nMàn hình rộng:: 6.8 inch\r\nĐộ phân giải: 200MP x 12MP x 10MP x 10MP, 12MP\r\nChip xử lý (CPU): Snapdragon® 8 Gen 2 Mobile Platform for Galaxy\r\nBộ nhớ trong (ROM): 256GB\r\nRAM: 8GB\r\nMạng di động: Hỗ trợ 5G\r\nDung lượng pin: 5000mAh', 1, '2023-04-05 02:01:26', '2023-04-05 02:01:26'),
(47, 'Xiaomi 12 Pro', 19990000, 'Công nghệ màn hình:: LTPO AMOLED, 120Hz, HDR10+\r\nĐộ phân giải:: QuadHD+ (1440 x 3200 pixels), tỉ lệ 20:9\r\nMàn hình rộng:: 6.73 inches\r\nĐộ phân giải: 50 MP, f/1.9 (góc rộng), Dual Pixel PDAF, OIS, 50 MP, f/1.9 (tele), PDAF, 2x zoom, 50 MP, f/2.2, 115˚ (góc siêu rộng), 32 MP (góc rộng)\r\nChip xử lý (CPU): Qualcomm SM8450 Snapdragon 8 Gen1 (4 nm), 8 nhân (1x3.00 GHz & 3x2.50 GHz & 4x1.80 GHz), GPU: Adreno 730\r\nBộ nhớ trong (ROM): 256GB\r\nRAM: 12GB\r\nSố khe sim: 2 Nano SIM\r\nDung lượng pin: Li-Po 4600 mAh, sạc nhanh 120W', 1, '2023-04-05 02:05:23', '2023-04-05 02:07:48'),
(48, 'Samsung Galaxy S21 FE (5G)', 10790000, 'Công nghệ màn hình:: Dynamic AMOLED 2X\r\nĐộ phân giải:: Full HD+ (1080 x 2340 Pixels)\r\nMàn hình rộng:: 6.4\" - Tần số quét 120 Hz\r\nĐộ phân giải: Chính 12 MP & Phụ 12 MP, 8 MP, 32 MP\r\nChip xử lý (CPU): Exynos 2100 8 nhân\r\nRAM: 8 GB\r\nDung lượng pin: 4520 mAh', 1, '2023-04-05 02:07:10', '2023-04-05 02:07:10'),
(49, 'Samsung Galaxy Z Fold4 - 512GB', 39190000, 'Công nghệ màn hình:: Dynamic AMOLED 2X\r\nĐộ phân giải:: Chính: QXGA+ (2176 x 1812 Pixels) & Phụ: HD+ (2316 x 904 Pixels)\r\nMàn hình rộng:: Chính 7.6\" & Phụ 6.2\" - Tần số quét 120 Hz\r\nĐộ phân giải: Chính 50 MP & Phụ 12 MP, 10 MP, 10 MP & 4 MP\r\nHệ điều hành: Android 12\r\nChip xử lý (CPU): Snapdragon 8+ Gen 1 8 nhân\r\nBộ nhớ trong (ROM): 512GB\r\nRAM: 12 GB\r\nMạng di động: Hỗ trợ 5G\r\nSố khe sim: 1 Nano SIM & 1 eSIM\r\nDung lượng pin: 4400 mAh', 1, '2023-04-05 02:09:49', '2023-04-05 02:09:49'),
(50, 'Bphone A40 - Chính hãng', 3790000, 'Công nghệ màn hình:: Thiết kế hiện đại màn hình lỗ\r\nĐộ phân giải:: FHD\r\nMàn hình rộng:: 6.67”\r\nĐộ phân giải: 4 Camera 16 MP + 2MP +5M +2MP, 8MP chụp góc rộng, tự làm đẹp...\r\nHệ điều hành: BOS - based on Android 11\r\nChip xử lý (CPU): Mediatek Helio G85, Antutu 205,950\r\nBộ nhớ trong (ROM): 64GB\r\nRAM: 4GB\r\nMạng di động: 4GB\r\nDung lượng pin: 5000mAh', 1, '2023-04-05 02:12:55', '2023-04-05 02:12:55'),
(51, 'Laptop MSI Gaming Katana', 20490000, 'CPU	Intel Core i5-12450H ( 3.3 GHz up to 4.4 GHz, 8 Cores 12 Threads )\r\nRam	8GB DDR4 3200MHz \r\nỔ cứng	512GB NVMe PCIe Gen 4 SSD \r\nVGA	NVIDIA® GeForce RTX™ 3050 4GB GDDR6 \r\nMàn hình	15.6\" FHD (1920x1080), 144Hz, IPS-Level, viền mỏng, chống chói\r\n\r\nCổng giao tiếp	\r\n2x Type-A USB3.2 Gen1\r\n1x Type-C USB3.2 Gen1\r\n1x (4K @ 60Hz) HDMI\r\n1x RJ45\r\n1x Type-A USB2.0\r\n1x Jack Audio 3.5mm\r\n\r\nBàn phím	Có phím số, Chiclet Keyboard with LED\r\nChuẩn LAN	Gigabit Ethernet\r\nChuẩn WIFI	Intel Wi-Fi 6 AX201(2*2 ax) \r\nBluetooth	v5.2\r\nHệ điều hành	Windows 11 Home\r\nTrọng lượng	2.25 kg\r\nMàu sắc	Đen\r\nKích thước	359 x 259 x 24.9 (mm)\r\n ', 1, '2023-04-05 02:20:45', '2023-04-05 02:20:45'),
(52, 'Laptop Fujitsu LifeBook E5410', 7690000, '\r\nCPU	\r\nIntel Core  i3-10110U\r\nMemory	\r\n4GB DDR4\r\nStorage	\r\n256GB SSD  NVMe\r\nCard đồ họa	\r\nIntel UHD Graphics\r\nMàn hình	\r\n14 Inch HD\r\nMàu sắc	\r\nĐen', 1, '2023-04-05 02:22:34', '2023-04-05 02:22:34'),
(53, 'Laptop Lenovo IdeaPad 3 14ITL6', 13990000, 'Processor	\r\nIntel® Core™ i7-1165G7 (4C / 8T, 2.8 / 4.7GHz, 12MB)\r\nGraphics	\r\nIntegrated Intel® Iris® Xe Graphics\r\nMemory	\r\n4GB Soldered DDR4-3200 + 4GB SO-DIMM DDR4-3200\r\nMemory Slots	\r\nOne memory soldered to systemboard, one DDR4 SO-DIMM slot, dual-channel capable\r\nMax Memory	\r\nUp to 12GB (4GB soldered + 8GB SO-DIMM) DDR4-3200 offering\r\nStorage	\r\n512GB SSD M.2 2242 PCIe® 3.0x4 NVMe®\r\nCard Reader	\r\n4-in-1 Card Reader\r\nOptical	\r\nNone\r\nAudio Chip	\r\nHigh Definition (HD) Audio, Realtek® ALC3287 codec\r\nSpeakers	\r\nStereo speakers, 1.5W x2, Dolby® Audio™\r\nCamera	\r\nHD 720p with Privacy Shutter\r\nMicrophone	\r\n2x, Array\r\nBattery	\r\nIntegrated 45Wh\r\nDESIGN\r\nDisplay	\r\n14\" FHD (1920x1080) TN 250nits Anti-glare\r\nTouchscreen	\r\nNone\r\nKeyboard	\r\nNon-backlit, English\r\nCase Color	\r\nArctic Grey\r\nSurface Treatment	\r\nIMR (In-Mold Decoration by Roller)\r\nCase Material	\r\nPC-ABS (Top), PC-ABS (Bottom)\r\nDimensions (WxDxH)	\r\n324.2 x 215.7 x 19.9 mm (12.76 x 8.49 x 0.78 inches)\r\nWeight	\r\nStarting at 1.41 kg (3.1 lbs)\r\nSOFTWARE\r\nOperating System	\r\nWindows® 11 Home, English\r\nBundled Software	\r\nOffice Trial\r\nCONNECTIVITY\r\nEthernet	\r\nNo Onboard Ethernet\r\nWLAN + Bluetooth	\r\nWi-Fi® 6, 11ax 2x2 + BT5.1\r\nStandard Ports	\r\n1x USB 2.0\r\n1x USB 3.2 Gen 1\r\n1x USB-C® 3.2 Gen 1 (support data transfer only)\r\n1x HDMI® 1.4b\r\n1x Card reader\r\n1x Headphone / microphone combo jack (3.5mm)\r\n1x Power connector', 1, '2023-04-05 02:24:03', '2023-04-05 02:24:03'),
(54, 'Laptop ASUS Vivobook 15 ', 18490000, '\r\nBộ xử lý - CPU	Intel® Core™ i5-13500H (2.60GHz up to 4.70GHz, 18MB Cache)\r\nMàn hình - Monitor	15.6 inch FHD (1920 x 1080) OLED 16:9 aspect ratio, 0.2ms, 60Hz, 600nits HDR peak brightness, 100% DCI-P3, VESA CERTIFIED Display HDR True Black 600, PANTONE Validated, Glossy display, TÜV Rheinland-certified\r\nBộ nhớ trong - Ram	16GB DDR4 on board\r\nỔ đĩa cứng - HDD	512GB M.2 NVMe™ PCIe® 3.0 SSD\r\nCard đồ hoạ - Video	\r\nIntel Iris Xᵉ Graphics\r\nWebcam	720p HD camera With privacy shutter\r\nGiao tiếp mạng - Communications	\r\nWi-Fi 6E(802.11ax) (Dual band) 1*1 \r\n\r\nCổng giao tiếp - Port	\r\n1 x USB 2.0 Type-A\r\n\r\n1 x USB 3.2 Gen 1 Type-C support power delivery\r\n\r\n2 x USB 3.2 Gen 1 Type-A\r\n\r\n1 x HDMI 1.4\r\n\r\n1 x 3.5mm Combo Audio Jack\r\n\r\n1 x DC-in\r\n\r\nBluetooth	Bluetooth 5.0\r\nPin	3Cell 50WHrs, 3S1P\r\nTrọng lượng	1.70 kg', 1, '2023-04-05 02:27:17', '2023-04-05 02:27:17'),
(55, 'Laptop Asus ROG Zephyrus', 75990000, '\r\nCông nghệ CPU\r\n\r\nIntel® Core™ i9-13900H Processor \r\n\r\nRAM\r\n\r\n32GB(16GB *2) SO-DIMM DDR5 4800Mhz\r\n\r\nỔ cứng\r\n\r\n1TB M.2 NVMe™ PCIe® 4.0\r\n\r\nKích thước màn hình\r\n\r\n16-inch QHD 240Hz 16:10, 3ms DCI-P3 100%, 1200nits, GSync, miniLED,Pantone Validated, NEBULA HDR\r\n\r\nCard màn hình\r\n\r\n NVIDIA® GeForce Geforce RTX 4070 8GB\r\n\r\nWireless\r\n\r\nWi-Fi 6E(802.11ax) (Triple band) 2*2\r\n\r\nLAN\r\n\r\n 1x RJ45 LAN port\r\n\r\nBluetooth\r\n\r\nBluetooth 5.2 (Dual band) 2*2\r\n\r\nKiểu bàn phím\r\n\r\nBàn phím tiêu chuẩn, 1-Zone RGB\r\n\r\nChuột\r\n\r\nCảm ứng đa điểm\r\n\r\nKết nối USB\r\n\r\n1x Thunderbolt™ 4 support DisplayPort™ / power delivery\r\n\r\n1x USB 3.2 Gen 2 Type-C support DisplayPort™ / power delivery\r\n\r\n2x USB 3.2 Gen 2 Type-A\r\n\r\nKết nối HDMI/VGA\r\n\r\n1x HDMI 2.0b\r\n\r\nTai nghe\r\n\r\n1x 3.5mm Combo Audio Jack\r\n\r\nCamera\r\n\r\n720P HD IR Camera for Windows Hello\r\n\r\nLOA\r\n\r\n2 Loa\r\n\r\nKiểu Pin\r\n\r\n4-cell, 90WHrs\r\n\r\nSạc pin\r\n\r\nĐi kèm\r\n\r\nHệ điều hành (bản quyền) đi kèm \r\n\r\n Windows 11 Home\r\n\r\nKích thước (Dài x Rộng x Cao)\r\n\r\n35.5 x 24.6 x 1.99 ~ 2.23 cm\r\n\r\nTrọng Lượng\r\n\r\n2.10 Kg\r\n\r\nMàu sắc\r\n\r\nĐen\r\n\r\n ', 1, '2023-04-05 02:28:46', '2023-04-05 02:28:46'),
(56, 'Laptop Asus Zenbook Q409ZA', 14590000, '\r\nCPU	Intel Core i5 1240P (12 nhân 16 luồng, 12 MB Intel® Smart Cache)\r\nCard đồ họa	Intel® Iris® Xe Graphics\r\nRAM	8GB LPDDR5 bus 5200MHz\r\nỔ cứng	256GB M.2 PCIe NVMe\r\nMàn hình	14 Inch OLED, 2.8K (2880x1800) 100% sRGB\r\nKết nối không dây	Wi-Fi 5|Bluetooth® 5.0\r\nCổng giao tiếp	\r\n2 x USB-C with Thunderbolt 4, 1 x USB-A , 1 x microSD, 1 x HDMI, 1x jack 3.5mm\r\n\r\nWebcam	Có\r\nPin	75Wh\r\nKích thước	313 x 220 x 17 mm\r\nTrọng lượng	1.38 kg', 1, '2023-04-05 02:33:40', '2023-04-05 02:33:40'),
(57, 'Laptop Dell Vostro 5310', 16390000, 'CPU	\r\nIntel Core i5 - 11320H\r\nMemory	\r\n16GB DDR4\r\nStorage	\r\n512GB SSD M.2 2280 PCIe 3.0x4 NVMe\r\nCard đồ họa	\r\nIntel Iris Xe Graphics\r\nMàn hình	\r\n13.3 Inch QHD+ (2K) chuẩn màu, 100% sRGB\r\nHệ điều hành	\r\nWindows bản quyền\r\nMàu sắc	\r\nLow Blue Light', 1, '2023-04-05 02:34:54', '2023-04-05 02:34:54'),
(58, 'Laptop Microsoft Surface Pro 7 Plus', 17990000, '\r\nCPU	\r\nIntel Core  i5-1135G7\r\nMemory	\r\n8GB LPDDR4X\r\nStorage	\r\n128GB SSD NVMe\r\nCard đồ họa	\r\nIntel Iris Xe Graphics\r\nMàn hình	\r\n12.3 Inch QHD\r\nHệ điều hành	\r\nwin 11\r\nMàu sắc	\r\nPlatinum', 1, '2023-04-05 02:35:58', '2023-04-05 02:35:58'),
(59, 'MacBook Pro M1', 27990000, 'CPU:	\r\nCông nghệ CPU:\r\n\r\nApple M1\r\nSố nhân:\r\n\r\n8\r\nBộ nhớ trong:	\r\nRAM:\r\n\r\n16 GB\r\n \r\nỔ cứng:\r\n\r\n512 GB SSD\r\n \r\nCông nghệ màn hình:	\r\nMàn hình:\r\n\r\n13.3 inch\r\nĐộ phân giải:\r\n\r\nRetina (2560 x 1600)\r\nTần số quét:\r\n\r\nHãng không công bố\r\nCông nghệ màn hình:\r\n\r\nTấm nền IPS\r\n\r\nLED Backlit\r\n\r\nRetina\r\n\r\n500 nits brightness\r\n\r\nTrue Tone Technology\r\n\r\nTiện ích đặc biệt:	\r\nCard màn hình:\r\n\r\nCard tích hợp - 8 nhân GPU\r\nCông nghệ âm thanh:\r\n\r\n3 microphones\r\n\r\nLoa kép (2 kênh)\r\n\r\nDolby Atmos\r\n\r\nKết nối:	\r\nCổng giao tiếp:\r\n\r\n2 x Thunderbolt 3 (USB-C)\r\nJack tai nghe 3.5 mm\r\nKết nối không dây:\r\n\r\nBluetooth 5.0\r\nWi-Fi 6 (802.11ax)\r\nWebcam:\r\n\r\nHD webcam\r\nTính năng khác:\r\n\r\nBảo mật vân tay\r\nĐèn bàn phím:\r\n\r\nCó\r\nKích thước mặt:	\r\nKích thước, khối lượng:\r\n\r\nDài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg\r\nChất liệu:\r\n\r\nVỏ kim loại nguyên khối\r\nTiện ích khác:	\r\nThông tin Pin:\r\n\r\nKhoảng 10 tiếng\r\nHệ điều hành:\r\n\r\nMac OS\r\nThời điểm ra mắt:\r\n\r\n2020', 1, '2023-04-05 02:39:41', '2023-04-05 02:39:41'),
(60, 'MacBook Pro 16 inch M2', 83500000, 'CPU:	\r\nCông nghệ CPU:\r\n\r\nApple M2 Max\r\nSố nhân:\r\n\r\n12\r\nSố luồng:\r\n\r\nHãng không công bố\r\nTốc độ CPU:\r\n\r\n400 GB/s memory bandwidth\r\nTốc độ tối đa:\r\n\r\nHãng không công bố\r\nBộ nhớ đệm:\r\n\r\nHãng không công bố\r\nBộ nhớ trong:	\r\nRAM:\r\n\r\n32 GB\r\nTốc độ Bus RAM:\r\n\r\nHãng không công bố\r\nHỗ trợ RAM tối đa:\r\n\r\nKhông hỗ trợ nâng cấp\r\nỔ cứng:\r\n\r\n1 TB SSD\r\nTiện ích đặc biệt:	\r\nCard màn hình:\r\n\r\nCard tích hợp - 38 nhân GPU\r\nCông nghệ âm thanh:\r\n\r\nWide stereo sound\r\n\r\nSpatial Audio\r\n\r\nDolby Atmos\r\n\r\nKết nối:	\r\nCổng giao tiếp:\r\n\r\nJack tai nghe 3.5 mm\r\n\r\nMagSafe 3\r\n\r\nHDMI\r\n\r\n3 x Thunderbolt 4\r\n\r\nKết nối không dây:\r\n\r\nWi-Fi 6E (802.11ax)Bluetooth 5.3\r\nKhe đọc thẻ nhớ:\r\n\r\nSD\r\nWebcam:\r\n\r\n1080p FaceTime HD camera\r\nĐèn bàn phím:\r\n\r\nCó\r\nTính năng khác:\r\n\r\nBảo mật vân tay\r\nKích thước, khối lượng:	\r\nKích thước, khối lượng:\r\n\r\nDài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.16 kg\r\nChất liệu:\r\n\r\nVỏ kim loại\r\nTiện ích khác:	\r\nThông tin Pin:\r\n\r\nKhoảng 10 tiếng\r\nHệ điều hành:\r\n\r\nMac OS\r\nThời điểm ra mắt:\r\n\r\n2023\r\nCông nghệ màn hình	\r\nMàn hình:\r\n\r\n16.2 inch\r\nĐộ phân giải:\r\n\r\nLiquid Retina XDR display (3456 x 2234)\r\nTần số quét:\r\n\r\nup to 120Hz\r\nCông nghệ màn hình:\r\n\r\nProMotion\r\n\r\nWide color (P3)\r\n\r\nĐộ sáng 1000 nits\r\n\r\nTrue Tone Technology\r\n\r\n1 tỷ màu', 1, '2023-04-05 02:41:29', '2023-04-05 02:41:29'),
(61, 'Mac mini M2', 15390000, 'CPU:	\r\nCông nghệ CPU:\r\n\r\nApple M2\r\nTốc độ CPU:\r\n\r\n100GB/s memory bandwidth\r\nBộ nhớ trong:	\r\nRAM:\r\n\r\n8 GB\r\nỔ cứng:\r\n\r\n256 GB SSD\r\nKết nối được với hệ điều hành:	\r\nThiết kế card:\r\n\r\nCard đồ hoạ tích hợp\r\nCard màn hình:\r\n\r\n10-core GPU\r\nCông nghệ âm thanh:\r\n\r\nKhông có\r\nKết nối:	\r\nCổng giao tiếp:\r\n\r\nHDMI\r\n\r\n2 x USB A\r\n\r\n2 x Thunderbolt 4\r\n\r\nJack 3.5 mm\r\n\r\nLAN (RJ45)\r\n\r\nGiao tiếp mạng:\r\n\r\nWi-Fi 6E (802.11ax)Bluetooth 5.3\r\nKhe đọc thẻ nhớ:\r\n\r\nKhông có\r\nKích thước, khối lượng:	\r\nKích thước, khối lượng:\r\n\r\nDài 197 mm - Rộng 197 mm - Dày 35.8 mm - Nặng 1.18 kg\r\nTiện ích khác:	\r\nBộ nguồn điện:\r\n\r\n150 W\r\nHệ điều hành:\r\n\r\nMac OS\r\nThời gian ra mắt:\r\n\r\n2023', 1, '2023-04-05 02:43:03', '2023-04-05 02:43:03'),
(62, 'iMac 2020 27\" MXWT2 ', 34750000, 'CPU:	\r\nCông nghệ CPU:\r\n\r\nIntel Core i5 Thế hệ 10\r\nLoại CPU:\r\n\r\nHãng không công bố\r\nTốc độ CPU:\r\n\r\n3.10 GHz\r\nTốc độ tối đa:\r\n\r\n4.50 GHz\r\nBộ nhớ trong:	\r\nRAM:\r\n\r\n8 GB\r\nLoại RAM:\r\n\r\nDDR4\r\nSố khe RAM:\r\n\r\n4 khe\r\nTốc độ Bus RAM:\r\n\r\n2666 MHz\r\nHỗ trợ RAM tối đa:\r\n\r\n128 GB\r\nỔ cứng:\r\n\r\n256 GB SSD\r\nChuẩn kết nối ổ cứng:\r\n\r\nHãng không công bố\r\nScreensize	\r\nKích thước màn hình:\r\n\r\n27 inch\r\nCông nghệ màn hình:\r\n\r\nRetina\r\n\r\nCông nghệ True Tone\r\n\r\nĐộ sáng 500 nits\r\n\r\nĐộ phân giải:\r\n\r\n5K (5120 x 2880)\r\nKết nối được với hệ điều hành:	\r\nThiết kế card:\r\n\r\nCard đồ hoạ tích hợp\r\nCard màn hình:\r\n\r\nRadeon Pro 5300, 4GB\r\nKết nối:	\r\nCổng giao tiếp:\r\n\r\nLAN (RJ45)\r\n\r\n4 x USB-A\r\n\r\n2 x Thunderbolt 3\r\n\r\nGiao tiếp mạng:\r\n\r\nBluetooth 5.0\r\nWiFi chuẩn AC\r\nKhe đọc thẻ nhớ:\r\n\r\nSD\r\nWebcam:\r\n\r\nHD webcam\r\nFaceTime Camera\r\nKích thước, khối lượng:	\r\nKích thước, khối lượng:\r\n\r\nDài 650 mm - Rộng 516 mm - Dày 203 mm - Nặng 8.92 kg\r\nTiện ích khác:	\r\nBộ nguồn điện:\r\n\r\nHãng không công bố\r\nHệ điều hành:\r\n\r\nMac OS', 1, '2023-04-05 02:47:02', '2023-04-05 02:47:02'),
(63, 'iPad Gen 10th', 10990000, 'Hệ điều hành & CPU	\r\nHệ điều hành:\r\n\r\niPadOS 16\r\nChip xử lý (CPU):\r\n\r\nApple A14 Bionic 6 nhân\r\nTốc độ CPU:\r\n2 nhân 3.1 GHz & 4 nhân 1.8 GHz\r\nChip đồ hoạ (GPU):\r\n\r\nApple GPU 4 nhân\r\nBộ nhớ trong:	\r\nRAM:\r\n4 GB\r\nDung lượng lưu trữ:\r\n\r\n64 GB\r\n \r\nThẻ nhớ ngoài:\r\n\r\nKhông có\r\nKết nối:	\r\nMạng di động:\r\n\r\nKhông có \r\nSIM:\r\n\r\nKhông có\r\nThực hiện cuộc gọi:\r\n\r\nFaceTime\r\nWifi:\r\n\r\nWi-Fi hotspot\r\n\r\nWi-Fi 802.11 a/b/g/n/ac/ax\r\n\r\nMIMO\r\n\r\nDual-band\r\n\r\nGPS:\r\n\r\nGPS\r\niBeacon\r\nBluetooth:\r\n\r\nv5.2\r\nCổng kết nối/sạc:\r\n\r\nType-C\r\nJack tai nghe:\r\n\r\nType C\r\nKết nối khác:\r\n\r\nKhông có\r\nTiện ích đặc biệt:	\r\nTính năng đặc biệt:\r\n\r\nKết nối Apple Pencil\r\n\r\n4 loa\r\n\r\nMở khóa bằng vân tay\r\n\r\nÂm thanh Dolby Atmos\r\n\r\nKết nối bàn phím rời\r\n\r\nGhi âm:\r\n\r\nCó\r\nRadio:\r\n\r\nKhông có\r\nTiện ích khác:	\r\nChất liệu:\r\n\r\nKhung & Mặt lưng kim loại\r\nKích thước, khối lượng:\r\n\r\nDài 248.6 mm - Ngang 179.5 mm - Dày 7 mm - Nặng 477 g\r\nThời điểm ra mắt:\r\n\r\n10/2022\r\nCamera sau	\r\nĐộ phân giải:\r\n\r\n12 MP\r\nQuay phim:\r\n\r\n4K 2160p@30fps\r\n\r\nFullHD 1080p@30fps\r\n\r\nFullHD 1080p@25fps\r\n\r\n4K 2160p@25fps\r\n\r\nHD 720p@30fps\r\n\r\n4K 2160p@60fps\r\n\r\nFullHD 1080p@60fps\r\n\r\n4K 2160p@24fps\r\n\r\nTính năng:\r\n\r\nBộ lọc màu\r\n\r\nTua nhanh thời gian (Time‑lapse)\r\n\r\nZoom kỹ thuật số\r\n\r\nQuay chậm (Slow Motion)\r\n\r\nSmart HDR 3\r\n\r\nGóc rộng\r\n\r\nToàn cảnh (Panorama)\r\n\r\nGắn thẻ địa lý\r\n\r\nCamera trước	\r\nĐộ phân giải:\r\n\r\n12 MP\r\nTính năng:\r\n\r\nTrôi nhanh thời gian (Time Lapse)\r\n\r\nQuay video Full HD\r\n\r\nBộ lọc màu\r\n\r\nHDR\r\n\r\nPin	\r\nDung lượng pin:\r\n28.6 Wh (~ 7587 mAh)\r\nLoại pin:\r\n\r\nLi-Po\r\nCông nghệ pin:\r\n\r\nSạc pin nhanh\r\nTiết kiệm pin\r\nHỗ trợ sạc tối đa:\r\n\r\n20 W\r\nSạc kèm theo máy:\r\n\r\n20 W\r\nCông nghệ màn hình	\r\nCông nghệ màn hình:\r\n\r\nRetina IPS LCD\r\nĐộ phân giải:\r\n\r\n1640 x 2360 Pixels\r\nMàn hình rộng:\r\n\r\n10.9\" - Tần số quét 60 Hz', 1, '2023-04-05 02:50:44', '2023-04-05 02:50:44'),
(64, 'iPad Air 5', 14490000, 'Hệ điều hành & CPU	\r\nHệ điều hành:\r\niPadOS 15\r\nChip xử lý (CPU):\r\nApple M1 8 nhân\r\nTốc độ CPU:\r\nHãng không công bố\r\nChip đồ hoạ (GPU):\r\nApple GPU 8 nhân\r\nBộ nhớ trong:	\r\nRAM:\r\n8 GB\r\nDung lượng lưu trữ:\r\n256 GB\r\n64 GB\r\nThẻ nhớ ngoài:\r\nKhông có\r\nKết nối:	\r\nMạng di động:\r\n\r\nCó hỗ trợ 5G\r\nSIM:\r\n\r\nKhông có\r\nThực hiện cuộc gọi:\r\n\r\nFaceTime\r\nWifi:\r\n\r\nDual-band\r\n\r\nWi-Fi 802.11 a/b/g/n/ac/ax\r\n\r\nMIMO\r\n\r\nGPS:\r\n\r\nGPSiBeacon\r\nBluetooth:\r\n\r\nv5.0\r\nCổng kết nối/sạc:\r\n\r\nType-C\r\nJack tai nghe:\r\n\r\nType C\r\nTiện ích đặc biệt:	\r\nTính năng đặc biệt:\r\n\r\nÂm thanh Dolby Atmos\r\n\r\nKết nối bàn phím rời\r\n\r\nMở khóa bằng vân tay\r\n\r\nNam châm & sạc cho Apple Pencil\r\n\r\nKết nối Apple Pencil 2\r\n\r\nDolby Vision\r\n\r\nMicro kép\r\n\r\nGhi âm:\r\n\r\nĐang cập nhật\r\nTiện ích khác:	\r\nChất liệu:\r\n\r\nNhôm nguyên khối\r\nKích thước, khối lượng:\r\n\r\nDài 247.6 mm - Ngang 178.5 mm - Dày 6.1 mm - Nặng 461 g\r\nThời điểm ra mắt:\r\n\r\n03/2022\r\nCamera sau	\r\nĐộ phân giải:\r\n\r\n12 MP\r\nQuay phim:\r\n\r\n4K 2160p@30fps\r\n\r\nFullHD 1080p@30fps\r\n\r\nHD 720p@30fps\r\n\r\n4K 2160p@24fps\r\n\r\n4K 2160p@60fps\r\n\r\nFullHD 1080p@60fps\r\n\r\n4K 2160p@25fps\r\n\r\nFullHD 1080p@25fps\r\n\r\nTính năng:\r\n\r\nQuay chậm (Slow Motion)\r\n\r\nTự động lấy nét (AF)\r\n\r\nHDR\r\n\r\nToàn cảnh (Panorama)\r\n\r\nGắn thẻ địa lý\r\n\r\nZoom kỹ thuật số\r\n\r\nTua nhanh thời gian (Time‑lapse)\r\n\r\nGóc rộng\r\n\r\nCamera trước	\r\nĐộ phân giải:\r\n\r\n12 MP\r\nTính năng:\r\n\r\nQuay video HD\r\n\r\nGóc rộng\r\n\r\nLive Photos\r\n\r\nBộ lọc màu\r\n\r\nTự động lấy nét (AF)\r\n\r\nPin	\r\nDung lượng pin:\r\n28.6 Wh (~ 7587 mAh)\r\nLoại pin:\r\n\r\nLi-Po\r\nCông nghệ pin:\r\n\r\nSạc pin nhanh\r\nHỗ trợ sạc tối đa:\r\n\r\n20 W\r\nSạc kèm theo máy:\r\n\r\n20 W\r\nCông nghệ màn hình	\r\nCông nghệ màn hình:\r\nRetina IPS LCD\r\nĐộ phân giải:\r\n1640 x 2360 Pixels\r\nMàn hình rộng:\r\n10.9\" - Tần số quét Hãng không công bố', 1, '2023-04-05 02:52:25', '2023-04-05 13:47:54'),
(65, 'iPad gen 9 10.2 inch', 7190000, 'Hệ điều hành & CPU	\r\nHệ điều hành:\r\n\r\niPadOS 15\r\nChip xử lý (CPU):\r\n\r\nApple A13 Bionic 6 nhân\r\nTốc độ CPU:\r\n2 nhân 2.65 GHz & 4 nhân 1.8 GHz\r\nChip đồ hoạ (GPU):\r\n\r\nApple GPU 4 nhân\r\nBộ nhớ trong:	\r\nRAM:\r\n3 GB\r\nDung lượng lưu trữ:\r\n\r\n64 GB\r\nKết nối:	\r\nMạng di động:\r\n\r\nKhông có \r\nSIM:\r\n\r\nKhông có\r\nThực hiện cuộc gọi:\r\n\r\nFaceTime\r\nWifi:\r\n\r\nDual-band\r\nWi-Fi 802.11 a/b/g/n/ac\r\nGPS:\r\n\r\nGPS\r\n\r\nGLONASS\r\n\r\nA-GPS\r\n\r\nBluetooth:\r\n\r\nv4.2\r\nCổng kết nối/sạc:\r\n\r\nLightning\r\nJack tai nghe:\r\n\r\n3.5 mm\r\nTiện ích đặc biệt:	\r\nTính năng đặc biệt:\r\n\r\nMở khóa bằng vân tay\r\nKết nối Apple Pencil\r\nTiện ích khác:	\r\nChất liệu:\r\n\r\nNhôm nguyên khối\r\nKích thước, khối lượng:\r\n\r\nDài 250.6 mm - Ngang 174.1 mm - Dày 7.5 mm - Nặng 487 g\r\nThời điểm ra mắt:\r\n\r\n11/2021\r\nCamera sau	\r\nĐộ phân giải:\r\n\r\n8 MP\r\nQuay phim:\r\n\r\nHD 720p@30fps\r\n\r\nFullHD 1080p@25fps\r\n\r\nFullHD 1080p@30fps\r\n\r\nTính năng:\r\n\r\nToàn cảnh (Panorama)\r\n\r\nGắn thẻ địa lý\r\n\r\nZoom kỹ thuật số\r\n\r\nTự động lấy nét (AF)\r\n\r\nHDR\r\n\r\nNhận diện khuôn mặt\r\n\r\nChạm lấy nét\r\n\r\nCamera trước	\r\nĐộ phân giải:\r\n\r\n12 MP\r\nTính năng:\r\n\r\nQuay video Full HD\r\n\r\nHDR\r\n\r\nTự động lấy nét (AF)\r\n\r\nPin	\r\nDung lượng pin:\r\n32.4 Wh (~ 8600 mAh)\r\nLoại pin:\r\n\r\nLi-Ion\r\nCông nghệ pin:\r\n\r\nSạc pin nhanh\r\nTiết kiệm pin\r\nHỗ trợ sạc tối đa:\r\n\r\n20 W\r\nSạc kèm theo máy:\r\n\r\n20 W\r\nCông nghệ màn hình	\r\nCông nghệ màn hình:\r\n\r\nRetina IPS LCD\r\nĐộ phân giải:\r\n\r\n1620 x 2160 Pixels\r\nMàn hình rộng:\r\n\r\n10.2\" - Tần số quét Hãng không công bố', 1, '2023-04-05 02:55:04', '2023-04-05 02:55:04'),
(66, 'iPad mini 6', 11990000, 'Hệ điều hành & CPU	\r\nHệ điều hành:\r\n\r\niPadOS 15\r\nChip xử lý (CPU):\r\n\r\nApple A15 Bionic 6 nhân\r\nTốc độ CPU:\r\n2.93 GHz\r\nChip đồ hoạ (GPU):\r\n\r\nApple GPU 5 nhân\r\nBộ nhớ trong:	\r\nRAM:\r\n4 GB\r\nDung lượng lưu trữ:\r\n\r\n64 GB\r\n256 GB\r\nKết nối:	\r\nMạng di động:\r\n\r\nHỗ trợ 5G\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIM\r\nThực hiện cuộc gọi:\r\n\r\nFaceTime\r\nWifi:\r\n\r\nDual-band\r\nWi-Fi 802.11 a/b/g/n/ac/ax\r\nGPS:\r\n\r\nGPS\r\n\r\nA-GPS\r\n\r\nGLONASS\r\n\r\nBluetooth:\r\n\r\nLE\r\n\r\nA2DP\r\n\r\nv5.0\r\n\r\nCổng kết nối/sạc:\r\n\r\nType-C\r\nTiện ích đặc biệt:	\r\nTính năng đặc biệt:\r\n\r\nMở khóa bằng vân tay\r\nKết nối Apple Pencil 2\r\nTiện ích khác:	\r\nChất liệu:\r\n\r\nNhôm nguyên khối\r\nKích thước, khối lượng:\r\n\r\nDài 195.4 mm - Ngang 134.8 mm - Dày 6.3 mm - Nặng 293 g\r\nThời điểm ra mắt:\r\n\r\n11/2021\r\nCamera sau	\r\nĐộ phân giải:\r\n\r\n12 MP\r\nQuay phim:\r\n\r\n4K 2160p@30fps\r\n\r\nFullHD 1080p@30fps\r\n\r\n4K 2160p@24fps\r\n\r\n4K 2160p@60fps\r\n\r\nFullHD 1080p@60fps\r\n\r\n4K 2160p@25fps\r\n\r\nFullHD 1080p@25fps\r\n\r\nTính năng:\r\n\r\nQuay chậm (Slow Motion)\r\n\r\nTự động lấy nét (AF)\r\n\r\nChạm lấy nét\r\n\r\nNhận diện khuôn mặt\r\n\r\nHDR\r\n\r\nToàn cảnh (Panorama)\r\n\r\nGắn thẻ địa lý\r\n\r\nZoom kỹ thuật số\r\n\r\nTua nhanh thời gian (Time‑lapse)\r\n\r\nCamera trước	\r\nĐộ phân giải:\r\n\r\n12 MP\r\nTính năng:\r\n\r\nHDR\r\n\r\nQuay video Full HD\r\n\r\nQuay video HD\r\n\r\nTự động lấy nét (AF)\r\n\r\nPin	\r\nDung lượng pin:\r\n19.3 Wh (~ 5175 mAh)\r\nLoại pin:\r\n\r\nLi-Ion\r\nCông nghệ pin:\r\n\r\nSạc pin nhanh\r\nTiết kiệm pin\r\nHỗ trợ sạc tối đa:\r\n\r\n20 W\r\nSạc kèm theo máy:\r\n\r\n20 W\r\nCông nghệ màn hình	\r\nCông nghệ màn hình:\r\n\r\nLED-backlit IPS LCD\r\nĐộ phân giải:\r\n\r\n1488 x 2266 Pixels\r\nMàn hình rộng:\r\n\r\n8.3\" - Tần số quét Hãng không công bố', 1, '2023-04-05 03:06:34', '2023-04-05 03:06:34'),
(67, 'Apple Watch SE', 6290000, 'Kích thước màn hình:	\r\nChất liệu mặt:\r\n\r\nIon-X strengthened glass\r\nChất liệu khung viền:\r\n\r\nHợp kim nhôm\r\nChất liệu dây:\r\n\r\nSilicone\r\nĐộ rộng dây:\r\n\r\nHãng không công bố\r\nĐộ dài dây:\r\n\r\nHãng không công bố\r\nKhả năng thay dây:\r\n\r\nCó\r\nKích thước, khối lượng:\r\n\r\nDài 44 mm - Ngang 38 mm - Dày 10.7 mm - Nặng 32.9 g\r\nDài 40 mm - Ngang 34 mm - Dày 10.7 mm - Nặng 26.4 g\r\nTiện ích đặc biệt:	\r\nTiện ích đặc biệt:\r\n\r\nPhát hiện té ngã\r\n\r\nNghe nhạc\r\n\r\nKết nối bluetooth với tai nghe\r\n\r\nSim & nghe gọi:\r\n\r\nNghe gọi ngay trên đồng hồ\r\nChống nước / Kháng nước:\r\n\r\nChống nước 5 ATM - ISO 22810:2010 (Tắm, bơi vùng nước nông)\r\nTheo dõi sức khoẻ:\r\n\r\nGửi thông báo khi có tai nạn\r\n\r\nTính quãng đường chạy\r\n\r\nChế độ luyện tập\r\n\r\nTính lượng calories tiêu thụ\r\n\r\nTheo dõi giấc ngủ\r\n\r\nTheo dõi mức độ stress\r\n\r\nTheo dõi chu kì kinh nguyệt\r\n\r\nNhắc nhở nhịp tim cao, thấp\r\n\r\nCảm biến nhiệt độ\r\n\r\nĐo nhịp tim\r\n\r\nĐếm số bước chân\r\n\r\nTiện ích khác:\r\n\r\nNâng cổ tay sáng màn hình\r\n\r\nMàn hình cảm ứng\r\n\r\nBáo thức\r\n\r\nTừ chối cuộc gọi\r\n\r\nDự báo thời tiết\r\n\r\nLa bàn\r\n\r\nĐồng hồ bấm giờ\r\n\r\nĐiều khiển chơi nhạc\r\n\r\nRung thông báo\r\n\r\nThay mặt đồng hồ\r\n\r\nCuộc gọi khẩn cấp SOS\r\n\r\nĐiều khiển chụp ảnh\r\n\r\nChuyển vùng quốc tế\r\n\r\nHiển thị thông báo:\r\n\r\nCuộc gọi\r\n\r\nTin nhắn\r\n\r\nZalo\r\n\r\nMessenger (Facebook)\r\n\r\nLine\r\n\r\nViber\r\n\r\nCPU:	\r\nCPU:\r\n\r\nApple S8\r\nBộ nhớ trong:\r\n\r\n32 GB\r\nHệ điều hành:\r\n\r\nWatchOS phiên bản mới nhất\r\nKết nối được với hệ điều hành:\r\n\r\niPhone 8 trở lên với iOS phiên bản mới nhất\r\nỨng dụng quản lý:\r\n\r\nWatch\r\nKết nối:\r\n\r\nBluetooth v5.3\r\n\r\nGPS\r\n\r\nWifi\r\n\r\nCảm biến:\r\n\r\nCảm biến ánh sáng môi trường\r\n\r\nCảm biến nhịp tim quang học thế hệ 2\r\n\r\nCao áp kế\r\n\r\nCon quay hồi chuyển\r\n\r\nGia tốc kế\r\n\r\nGalileo\r\n\r\nGLONASS\r\n\r\nGPS\r\n\r\nLa bàn\r\n\r\nTiện ích khác:	\r\nSản xuất tại:\r\n\r\nHãng không công bố\r\nThời gian ra mắt:\r\n\r\n09/2022\r\nNgôn ngữ:\r\n\r\nTiếng AnhTiếng Việt\r\nHãng:\r\n\r\nApple. Xem thông tin hãng\r\nMàn hình	\r\nCông nghệ màn hình:\r\n\r\nOLED\r\nKích thước màn hình:\r\n\r\nHãng không công bố\r\nĐộ phân giải:\r\n\r\n448 x 368 pixels (44 mm) và 324 x 394 pixels (40 mm)\r\nKích thước mặt:\r\n\r\n44 mm và 40 mm\r\nPin	\r\nThời gian sử dụng pin:\r\n\r\nKhoảng 1.5 ngày (ở chế độ tiết kiệm pin)Khoảng 18 giờ (ở chế độ sử dụng thông thường)\r\nThời gian sạc:\r\n\r\nHãng không công bố\r\nDung lượng pin:\r\n\r\nHãng không công bố\r\nCổng sạc:\r\n\r\nĐế sạc nam châm', 1, '2023-04-05 03:09:25', '2023-04-05 03:09:25'),
(68, 'Apple Watch Series 6', 6990000, 'Kích thước mặt:	\r\nChất liệu mặt:\r\n\r\nIon-X strengthened glass\r\nChất liệu khung viền:\r\n\r\nNhôm\r\nChất liệu dây:\r\n\r\nSilicone\r\nĐộ rộng dây:\r\n\r\nHãng không công bố\r\nĐộ dài dây:\r\n\r\nHãng không công bố\r\nKhả năng thay dây:\r\n\r\nCó\r\nKích thước, khối lượng:\r\n\r\nDài 40 mm - Ngang 34 mm - Dày 10.4 mm - Nặng 30.5 g\r\nTiện ích đặc biệt:	\r\nSim & nghe gọi:\r\n\r\nNghe gọi ngay trên đồng hồ\r\nTiện ích đặc biệt:\r\n\r\nMàn hình luôn hiển thị\r\n\r\nPhát hiện té ngã\r\n\r\nKết nối bluetooth với tai nghe\r\n\r\nChống nước / Kháng nước:\r\n\r\nChống nước 5 ATM - ISO 22810:2010 (Tắm, bơi vùng nước nông)\r\nTheo dõi sức khoẻ:\r\n\r\nĐiện tâm đồ\r\n\r\nĐo nồng độ oxy trong máu (SpO2)\r\n\r\nTính quãng đường chạy\r\n\r\nChế độ luyện tập\r\n\r\nTính lượng calories tiêu thụ\r\n\r\nTheo dõi giấc ngủ\r\n\r\nĐo nhịp tim\r\n\r\nĐếm số bước chân\r\n\r\nTiện ích khác:\r\n\r\nNghe gọi trên đồng hồ\r\n\r\nBáo thức\r\n\r\nTừ chối cuộc gọi\r\n\r\nDự báo thời tiết\r\n\r\nLa bàn\r\n\r\nĐồng hồ bấm giờ\r\n\r\nĐiều khiển chơi nhạc\r\n\r\nRung thông báo\r\n\r\nThay mặt đồng hồ\r\n\r\nĐiều khiển chụp ảnh\r\n\r\nMàn hình luôn hiển thị\r\n\r\nHiển thị thông báo:\r\n\r\nCuộc gọi\r\n\r\nNội dung tin nhắn\r\n\r\nTin nhắn\r\n\r\nZalo\r\n\r\nMessenger (Facebook)\r\n\r\nLine\r\n\r\nViber\r\n\r\nCPU:	\r\nCPU:\r\n\r\nApple S6 64 bit\r\nBộ nhớ trong:\r\n\r\n32 GB\r\nHệ điều hành:\r\n\r\nWatchOS phiên bản mới nhất\r\nKết nối được với hệ điều hành:\r\n\r\niPhone 8 trở lên với iOS phiên bản mới nhất\r\nỨng dụng quản lý:\r\n\r\nWatch\r\nKết nối:\r\n\r\nBluetooth v5.0\r\n\r\nGPS\r\n\r\nWifi\r\n\r\nCảm biến:\r\n\r\nCảm biến ánh sáng môi trường\r\n\r\nCảm biến nhịp tim điện tử\r\n\r\nCảm biến nhịp tim quang học thế hệ 3\r\n\r\nCao áp kế\r\n\r\nGia tốc kế\r\n\r\nGNSS\r\n\r\nGPS\r\n\r\nLa bàn\r\n\r\nĐo SpO2\r\n\r\nTiện ích khác:	\r\nSản xuất tại:\r\n\r\nTrung Quốc\r\nThời gian ra mắt:\r\n\r\n15/9/2020\r\nNgôn ngữ:\r\n\r\nTiếng AnhTiếng Việt\r\nHãng:\r\n\r\nApple. Xem thông tin hãng\r\nMàn hình	\r\nCông nghệ màn hình:\r\n\r\nOLED\r\nKích thước màn hình:\r\n\r\n1.57 inch\r\nĐộ phân giải:\r\n\r\n324 x 394 pixels\r\nPin	\r\nThời gian sử dụng pin:\r\n\r\nKhoảng 1.5 ngày\r\nThời gian sạc:\r\n\r\nKhoảng 2 giờ\r\nDung lượng pin:\r\n\r\n265.9 mAh\r\nCổng sạc:\r\n\r\nĐế sạc nam châm', 1, '2023-04-05 11:08:29', '2023-04-05 11:08:29'),
(69, 'Apple Watch Ultra LTE', 19990000, 'Kích thước, khối lượng:	\r\nChất liệu mặt:\r\n\r\nKính Sapphire\r\nChất liệu khung viền:\r\n\r\nTitanium\r\nChất liệu dây:\r\n\r\nSilicone\r\nĐộ rộng dây:\r\n\r\nHãng không công bố\r\nĐộ dài dây:\r\n\r\n13 - 20 cm\r\nKhả năng thay dây:\r\n\r\nCó\r\nKích thước, khối lượng:\r\n\r\nDài 49 mm - Ngang 44 mm - Dày 14.4 mm - Nặng 61.3 g\r\nTiện ích đặc biệt:	\r\nSim & nghe gọi:\r\n\r\nQua eSIM (nghe gọi độc lập không cần điện thoại)\r\nTiện ích đặc biệt:\r\n\r\nMàn hình luôn hiển thị\r\n\r\nPhát hiện té ngã\r\n\r\nNghe nhạc\r\n\r\nKết nối bluetooth với tai nghe\r\n\r\nChống nước / Kháng nước:\r\n\r\nChống nước 10 ATM (Bơi, lặn vùng nước nông)\r\nTiện ích khác:\r\n\r\nMàn hình cảm ứng\r\n\r\nChứng nhận độ bền MIL-STD-810H\r\n\r\nChế độ tiết kiệm năng lượng\r\n\r\nTính năng Family Setup\r\n\r\nNâng cổ tay sáng màn hình\r\n\r\nTrợ lý giọng nói\r\n\r\nĐiều khiển chơi nhạc\r\n\r\nThay mặt đồng hồ\r\n\r\nTừ chối cuộc gọi\r\n\r\nCuộc gọi khẩn cấp SOS\r\n\r\nĐồng hồ bấm giờ\r\n\r\nBáo thức\r\n\r\nDự báo thời tiết\r\n\r\nChuyển vùng quốc tế\r\n\r\nTheo dõi sức khoẻ:\r\n\r\nĐiện tâm đồ\r\n\r\nGửi thông báo khi có tai nạn\r\n\r\nĐo nồng độ oxy trong máu (SpO2)\r\n\r\nChấm điểm giấc ngủ\r\n\r\nƯớc tính ngày rụng trứng\r\n\r\nTính lượng calories tiêu thụ\r\n\r\nTheo dõi giấc ngủ\r\n\r\nTheo dõi chu kì kinh nguyệt\r\n\r\nNhắc nhở nhịp tim cao, thấp\r\n\r\nCảm biến nhiệt độ\r\n\r\nĐo nhịp tim\r\n\r\nĐếm số bước chân\r\n\r\nHiển thị thông báo:\r\n\r\nCuộc gọi\r\n\r\nViber\r\n\r\nMessenger (Facebook)\r\n\r\nLine\r\n\r\nTin nhắn\r\n\r\nZalo\r\n\r\nCPU:	\r\nCPU:\r\n\r\nApple S8\r\nBộ nhớ trong:\r\n\r\n32 GB\r\nHệ điều hành:\r\n\r\nWatchOS phiên bản mới nhất\r\nKết nối được với hệ điều hành:\r\n\r\niPhone 8 trở lên với iOS phiên bản mới nhất\r\nỨng dụng quản lý:\r\n\r\nWatch\r\nKết nối:\r\n\r\nBluetooth v5.3\r\n\r\nGPS\r\n\r\nWifi\r\n\r\nCảm biến:\r\n\r\nCảm biến ánh sáng môi trường\r\n\r\nCảm biến điện học (ECG)\r\n\r\nCảm biến nhịp tim quang học\r\n\r\nCảm biến nhịp tim quang học thế hệ 3\r\n\r\nCao áp kế\r\n\r\nCon quay hồi chuyển\r\n\r\nGia tốc kế\r\n\r\nGalileo\r\n\r\nBDS\r\n\r\nGLONASS\r\n\r\nQZSS\r\n\r\nLa bàn\r\n\r\nĐo SpO2\r\n\r\nTiện ích khác:	\r\nSản xuất tại:\r\n\r\nHãng không công bố\r\nThời gian ra mắt:\r\n\r\n09/2022\r\nNgôn ngữ:\r\n\r\nTiếng AnhTiếng Việt\r\nHãng:\r\n\r\nApple. Xem thông tin hãng\r\nMàn hình	\r\nCông nghệ màn hình:\r\n\r\nOLED\r\nKích thước màn hình:\r\n\r\n1.92 inch\r\nĐộ phân giải:\r\n\r\n410 x 502 pixels\r\nKích thước mặt:\r\n\r\n49 mm\r\nPin	\r\nThời gian sử dụng pin:\r\n\r\nKhoảng 60 giờ ở chế độ tiết kiệm pinKhoảng 36 giờ (ở chế độ sử dụng thông thường)\r\nThời gian sạc:\r\n\r\nHãng không công bố\r\nDung lượng pin:\r\n\r\nHãng không công bố\r\nCổng sạc:\r\n\r\nĐế sạc nam châm', 1, '2023-04-05 11:09:50', '2023-04-05 11:09:50'),
(70, 'AirPods 2', 2690000, 'Tiện ích đặc biệt:	\r\nTiện ích\r\n\r\nCó mic đàm thoại\r\nThời lượng pin\r\n\r\nTai nghe: Dùng 5 giờ\r\nHộp sạc: Dùng 24 giờ\r\nThời gian sạc\r\n\r\n2 giờ\r\nCổng sạc\r\n\r\nLightning\r\nMicro\r\n\r\nCó\r\nTương thích\r\n\r\nCác thiết bị có hỗ trợ Bluetooth\r\nKết nối:	\r\nPhương thức điều khiển\r\n\r\nCảm ứng chạm\r\nThao tác điều khiển\r\n\r\nChuyển bài\r\nĐiều chỉnh âm lượng\r\nTrả lời cuộc gọi\r\nKích hoạt trợ lý ảo Siri\r\nBluetooth\r\n\r\n5.0\r\nPhạm vi kết nối\r\n\r\n10 m\r\nKích thước\r\n\r\nTai nghe: 16.5 x 18.0 x 40.5 mm\r\nHộp sạc: 44.3 x 21.3 x 53.5 mm\r\nTrọng lượng\r\n\r\nTai nghe: 4 gr\r\nHộp sạc: 38.2 gr\r\nHãng sản xuất\r\n\r\nApple Chính hãng', 1, '2023-04-05 11:15:04', '2023-04-05 11:15:04'),
(71, 'Loa JBL GO 3', 1090000, 'Loa JBL GO 3\r\nMẫu loa di động nhỏ gọn với phong cách nổi bật, âm thanh JBL Pro Sound chuẩn xác và khả năng di chuyển tiện lợi.\r\n\r\nLoa JBL GO 3 với kích thước nhỏ, vừa vặn trong túi quần và tích hợp thêm quai đeo tiện lợi các bạn có thể mang đi khắp nơi dễ dàng và siêu di động.\r\n\r\nThiết kế hoàn toàn mới và các chi tiết được lấy cảm hứng từ thời trang đường phố kết hợp với nhiều màu sắc nổi bật đẹm lại phong cách riêng cho từng người.\r\n\r\nÂm thanh JBL Pro Sound chuyên nghiệm, phong phú và âm trầm mạnh mẽ so với kích thước tiếp thêm tinh thần và năng lượng cho bạn trong mọi hoạt động hàng ngày.\r\n\r\nChuẩn kết nối bluetooth không dây v5.1 mới nhất cho băng thông rộng hơn, truyền tải nhạc chất lượng cao hơn và chi tiết hơn.\r\n\r\nChuẩn chống nước, chống bụi IP67, Loa JBL GO 3 có thể bị chìm ở độ sâu 1m trong vòng 30p. Các bạn có thể mang loa ra bãi biển, bể bơi hoặc các điều kiện thời tiết khắc nghiệt mà không phải lo lắng gì. Độ bền và sự chắc chắn chính là điều chúng ta đã cảm chứng được qua các dòng loa di động của JBL.\r\n\r\nChúng ta có tổng cộng 7 màu sắc khác nhau để lựa chọn bao gồm: Black, Blue, Blue & Pink, Red, Squad, Pink, Green và White.', 1, '2023-04-05 11:16:20', '2023-04-05 11:16:20'),
(72, 'Loa Marshall Stanmore', 7990000, 'Loa Marshall Stanmore 2 (II) là dòng loa thông minh không dây, được tích hợp bluetooth 5.0 cùng nhiều tính năng hiện đại và tiên tiến khác, mang đến chất lượng âm thanh rõ ràng, chính xác ngay cả khi mở ở mức cao nhất. Cùng với đó là thiết kế đẹp mắt, sang trọng, Stanmore II phù hợp với mọi không gian phòng khác nhau, từ lớn đến nhỏ.', 1, '2023-04-05 11:17:19', '2023-04-05 11:17:19'),
(73, 'AirPods Pro 2', 5990000, 'Tiện ích đặc biệt:	\r\nTiện ích\r\n\r\nChống ồn, Điều khiển giọng nói, Dùng độc lập 1 bên tai, Có mic thoại, Sạc không dây, Trợ lý ảo Siri\r\nThời lượng pin\r\n\r\nTai nghe: Dùng 6 giờ\r\nHộp sạc: Dùng 30 giờ\r\nThời gian sạc\r\n\r\nHãng không công bố\r\nCổng sạc\r\n\r\nSạc MagSafe\r\nLightning\r\nSạc không dây Qi\r\nChống nước\r\n\r\nIPX4 (trên cả hộp sạc và tai nghe)\r\nCông nghệ âm thanh\r\n\r\nActive Noise Cancellation\r\nChip Apple H2\r\nAdaptive EQ\r\nTương thích\r\n\r\nAndroid, iOS, Windows\r\nKết nối:	\r\nSố thiết bị kết nối cùng lúc\r\n\r\n1 thiết bị\r\nPhương thức điều khiển\r\n\r\nCảm ứng chạm\r\nThao tác điều khiển\r\n\r\nNghe/nhận cuộc gọi\r\nPhát/dừng chơi nhạc\r\nChuyển bài hát\r\nTăng/giảm âm lượng\r\nBật trợ lí ảo\r\nChuyển chế độ Bật/Tắt chống ồn\r\nBluetooth\r\n\r\n5.3\r\nHãng sản xuất\r\n\r\nApple Chính hãng', 1, '2023-04-05 11:18:16', '2023-04-05 11:18:16'),
(74, 'Beats Solo Pro Wireless', 5990000, 'Khử tiếng ồn chủ động (ANC) chặn tiếng ồn bên ngoài\r\nBeats ‘Pure ANC thích nghi với tiếng ồn bên ngoài và vừa vặn trong khi vẫn giữ được chất lượng âm thanh\r\nThời gian nghe lên tới 22 giờ (tối đa 40 giờ khi tắt chế độ ANC và Độ trong suốt)\r\nFast Fuel cung cấp 3 giờ phát lại sau khi sạc 10 phút khi pin yếu\r\nTự động bật / tắt khi bạn mở và gập tai nghe', 1, '2023-04-05 11:19:17', '2023-04-05 11:19:17'),
(75, 'Powerbeats High-Performance', 3190000, 'Khử tiếng ồn chủ động (ANC) chặn tiếng ồn bên ngoài\r\nBeats ‘Pure ANC thích nghi với tiếng ồn bên ngoài và vừa vặn trong khi vẫn giữ được chất lượng âm thanh\r\nThời gian nghe lên tới 22 giờ (tối đa 40 giờ khi tắt chế độ ANC và Độ trong suốt)\r\nFast Fuel cung cấp 3 giờ phát lại sau khi sạc 10 phút khi pin yếu\r\nTự động bật / tắt khi bạn mở và gập tai nghe', 1, '2023-04-05 11:20:33', '2023-04-05 11:20:33'),
(76, 'Loa JBL Pulse 4', 4990000, 'Loa JBL \r\nLoa JBL là loa di động rất hot trong phân khúc 2 triệu đồng, sở hữu nhiều nâng cấp đáng kể như công suất lớn hơn, pin lâu hơn và thiết kế. Tuy nhiên, giá của lại không đổi so với thế hệ tiền nhiệm ', 1, '2023-04-05 11:25:43', '2023-04-05 11:25:43'),
(77, 'Loa Harman Kardon', 21800000, 'Loa Harman Kardon Citation Sub là thế hệ tiếp theo của loa siêu trầm không dây. Dễ dàng thiết lập và sử dụng, Citation Sub hòa quyện công nghệ đỉnh cao trong âm thanh gia đình với sự tỉ mỉ đến từng chi tiết trong thiết kế, tất cả mang tới một vẻ tinh tế bên ngoài, uy lực bên trong cho mọi trải nghiệm xem phim hay nghe nhạc khi kết nối với loa thanh Citation Bar hay loa tháp Citation Tower. Tận hưởng âm thanh như rạp phim với kênh 5.1 không cần dây kết nối. Với phần mềm tự động cập nhật, Citation Sub sẽ luôn hoạt động mượt mà và ổn định nhất.', 1, '2023-04-05 11:27:19', '2023-04-05 11:27:19'),
(78, 'Loa Harman Kardon Soundsticks', 7990000, 'Thiết kế đẹp mắt, sang trọng\r\nLoa Harman Kardon HK SOUND STICK 4 Đen gồm 2 cột loa vệ tinh và một subwoofer, loa subwoofer có thiết kế dạng vòm, bề mặt trong suốt cùng tông màu trắng cho các chi tiết bên trong loa, mặt trong loa sub được gia công thêm những chi tiết gợn sóng vừa để tạo điểm nhấn vừa có tác dụng khử nhiễu.\r\n\r\nBên cạnh đó các dây dẫn bên trong 2 loa vệ tinh được bố trí gọn gàng ẩn trong các ống trụ tạo nên sự thẩm mỹ. Hai loa vệ tinh được kết nối với loa sub qua dây theo công nghệ mới nhất của hãng Harman Kardon.\r\n\r\nLoa Bluetooth được trang bị 3 chân đế cao su giúp loa trụ vững trên mọi loại mặt phẳng và giúp tạo khoảng cách từ loa tới mặt bàn giúp âm thanh thoát ra mạnh mẽ hơn.', 1, '2023-04-05 11:29:35', '2023-04-05 11:29:35'),
(79, 'Tai nghe JBL Tune', 1490000, 'JBL TUNE 115TWS – Một trong những dòng tai nghe True Wireless hoàn toàn mới từ JBL, được thiết kế nhỏ gọn với công nghệ JBL Pure Bass cho phép bạn tận hưởng được thế giới âm thanh mọi lúc mọi nơi.', 1, '2023-04-05 11:30:46', '2023-04-05 11:30:46'),
(80, 'Samsung Galaxy Tab S8 Ultra', 28190000, 'Chiếc tabletGalaxy Tab S8 Ultra vừa được Samsung ra mắt cùng với Tab S8 và Tab S8 Plus mới đây. Máy tính bảng sở hữu thiết kế mới đột phá có độ mỏng vô cùng ấn tượng, cấu hình mạnh mẽ, dung lượng pin khủng cùng với những tính năng tân tiến nhất hiện nay. Đây hứa hẹn là dòng máy tính bảng sẽ làm mưa làm gió trong thời gian sắp tới.', 1, '2023-04-05 11:33:03', '2023-04-05 11:33:03'),
(81, 'Lenovo Tab M10 Gen 2', 2790000, 'Kích thước màn hình\r\n\r\n10 inches\r\nCông nghệ màn hình\r\n\r\nIPS LCD\r\nCamera sau\r\n\r\n8 MP\r\nCamera trước\r\n\r\n5 MP\r\nChipset\r\n\r\nMediaTek Helio P22T\r\nDung lượng RAM\r\n\r\n2 GB\r\nBộ nhớ trong\r\n\r\n32 GB\r\nPin\r\n\r\n5000 mAh\r\nThẻ SIM\r\n\r\nNano-SIM\r\nHệ điều hành\r\n\r\nAndroid 10\r\nĐộ phân giải màn hình\r\n\r\n800 x 1280 pixels', 1, '2023-04-05 11:34:39', '2023-04-05 11:34:39'),
(82, 'iPad Pro 12.9 2021 M1', 23990000, 'Hiển thị rực rỡ, sắc nét - Màn hình công nghệ MiniLED, tần số quét 120Hz, độ sáng tối đa 1600 nit\r\nHiệu năng như máy tính - Vi xử lý M1, 8GB RAM\r\nChụp ảnh chất lượng, hỗ trợ AR tiên tiến - Camera kép 12MP, cảm biến LiDAR cao cấp\r\nGiải trí ngày dài không lo cạn pin - Pin khủng 40,88W, sạc nhanh18W', 1, '2023-04-05 11:35:41', '2023-04-05 11:35:41'),
(83, 'Samsung Galaxy Buds2 Pro', 4690000, 'Thiết kế chuẩn công thái học phong cách, ôm khít vào tai, hạn chế rơi khi di chuyển\r\nĐắm chìm trong không gian âm nhạc riêng với tính năng chống ồn ANC và 360 Audio\r\nKhông ngại mưa rơi hay tập luyện cường độ cao khi sở hữu chuẩn kháng nước IPX7\r\nĐạt chuẩn Bluetooth 5.3 mới nhất cho kết nối ổn định, nhận diện thiết bị nhanh chóng', 1, '2023-04-05 11:37:45', '2023-04-05 11:37:45'),
(84, 'Huawei Watch Buds', 9490000, 'Thiết kế cực tinh xảo và trẻ trung nhưng không kém phần sang trọng với dáng mặt tròn cổ điển\r\nMàn hình được trang bị tấm nền AMOLED giúp mang đến khả năng hiển thị sống động, sặc sỡ\r\nKết hợp với tai nghe được đặt ở ngay bên dưới màn hình giúp bạn có thể chơi nhạc ngay trên đồng hồ\r\nTai nghe được thiết kế nằm gọn trong tai - ít gây cảm giác đau khi dùng trong thời gian dài\r\nTính năng hỗ trợ theo dõi quá trình tập luyện thể dục, thể thao cho người dùng', 1, '2023-04-05 11:38:58', '2023-04-06 22:02:50'),
(85, 'Huawei Watch GT3 Pro', 7190000, 'Mặt đồng hồ trang bị công nghệ Always on Display - tiện lợi theo dõi thông tin\r\nBảo vệ sức khoẻ tốt hơn với tính năng điện tâm đồ ECG\r\nChống nước 5ATM cùng tính năng lặn tự do - cho phép lặn sâu đến 30m\r\nTrả lời cuộc gọi ngay trên đồng hồ thông qua bluetooth khi kết nối với điện thoại\r\nPin cực trâu lên đến 14 ngày khi sử dụng thông thường', 1, '2023-04-05 11:39:46', '2023-04-05 11:39:46'),
(86, 'Xiaomi Watch S1 Pro', 5790000, 'Thiết kế tinh xảo - Mặt kính cường lực Sapphire cùng viền kim loại\r\nTrang bị tấm nền Amoled, kích thước 1.47 inch đọ sáng 600 nits - Hiển thị nội dung rõ ràng\r\n100 chế độ luyện tập thể thao - Thoả sức tập luyện\r\nPin sử dụng lên đến 14 ngày khi sử dụng thông thường, 10 ngày khi sử dụng thường xuyên\r\nĐịnh vị GPS được tích hợp - Dễ dàng theo dõi lộ trình luyện tập', 1, '2023-04-05 11:40:41', '2023-04-05 11:40:41'),
(87, 'Galaxy Watch5', 5490000, 'Trang bị cảm biến sinh học 3 trong 1: Cho phép đo nhịp tim, huyết áp, điện tâm đồ, SpO2\r\nSạc 45% pin chỉ trong 30 phút, quay lại cuộc chơi tức thì\r\nHệ điều hành Wear OS - cung cấp nhiều tính năng thông minh như nhắn tin, điều hướng qua google map\r\nMàn hình tinh thể Sapphire - cho khả năng kháng nước tốt hơn đến 1.6 lần so với phiên bản trước\r\n90 chế độ luyện tập - Thỏa sức tập luyện', 1, '2023-04-05 11:41:33', '2023-04-05 11:41:33'),
(88, 'Vòng đeo tay thông minh Huawei', 899000, 'Thiết kế thời thượng - màn hình 1.47 inch Amoled cùng thiết kế siêu mỏng\r\nTheo dõi nhịp tim và SpO2, đưa ra cảnh báo khi mức oxy trong máu hoặc nhịp tim nằm ngoài phạm vi thông thường\r\nKhông lo hết pin - thời lượng pin lên đến 2 tuấn thoải mái sử dụng\r\nHơn 4000 mặt đồng hồ để lựa chọn cùng chế độ màn hình luôn bật', 1, '2023-04-05 11:42:33', '2023-04-05 11:42:33'),
(89, 'Tivi Sony 4K 50 inch', 11190000, 'Android Tivi Sony 4K 50 inch KD-50X75 sở hữu thiết kế màn hình phẳng, tràn viền cho trải nghiệm xem tivi đắm chìm.\r\n\r\nBên cạnh đó, tivi Sony 50 inch còn có chân đế chữ V mỏng mang sự chắc chắn, thanh lịch phù hợp với mọi không gian nội thất như phòng khách, phòng họp,...', 1, '2023-04-05 11:46:34', '2023-04-05 11:46:34'),
(90, 'Google Tivi QLED TCL 4K', 7990000, 'Google Tivi TCL 4K 50 inch 50Q636 có độ phân giải 4K, màn hình 50 inch thiết kế tràn viền cùng các công nghệ hình ảnh hiện đại như Quantum Dot, Dolby Vision,... cho hình ảnh sắc nét, màu sắc có độ bão hòa và tương phản cao kết hợp cùng chất âm trong trẻo của hệ thống loa Onkyo và công nghệ âm vòm đỉnh cao Dolby Atmos. ', 1, '2023-04-05 11:47:34', '2023-04-05 11:47:34'),
(91, ' Tivi QLED 4K 55 inch Samsung', 12990000, 'Smart Tivi QLED 4K 55 inch Samsung QA55Q65A với thiết kế với màn hình tràn viền 4 cạnh, cho người dùng trải nghiệm khung hình giải trí trên tivi chân thực như thực tế đang xảy ra trước mắt.\r\n\r\nTivi Samsung 55 inch có chân đế được thiết kế gọn gàng, vững chắc. Mang lại sự thanh lịch, sang trọng cho chiếc tivi, phù hợp trưng bày ở phòng khách, phòng ngủ,...', 1, '2023-04-05 11:48:46', '2023-04-05 11:48:46'),
(92, 'Smart Tivi LG 4K 55 inch', 10990000, '- Smart Tivi LG 4K 55 inch 55UQ7550PSF hoàn thiện thiết kế nội thất của mọi không gian với vẻ ngoài thanh lịch, đường viền tinh giản giúp làm nổi bật nội dung đang phát trên màn hình, cho tầm nhìn của bạn luôn tập trung, không bị xao nhãng.\r\n\r\n- Chân đế chắc chắn với lớp vỏ nhựa, lõi bằng kim loại, thiết kế kiểu chữ V úp ngược giúp bố trí tivi LG thăng bằng trên kệ, hạn chế nghiêng, đổ.\r\n\r\n- Tạo điểm nhấn hoàn hảo cho căn phòng khách, phòng ngủ, phòng làm việc có diện tích vừa và lớn với màn hình 55 inch.', 1, '2023-04-05 11:50:23', '2023-04-05 11:50:23'),
(93, 'Smart Tivi Casper 4K 55 inch', 7990000, 'Smart Tivi Casper 4K 55 inch 55UW6000 sở hữu màn hình tràn viền thanh mảnh, tạo khung hình rộng và cảm giác tinh tế cho không gian lắp đặt.\r\n\r\nTivi Casper 55 inch chân đế chữ V úp ngược dễ tháo rời dùng đẹp cả khi đặt kệ tủ hay treo tường, sử dụng phù hợp các phòng có diện tích trung bình và lớn như phòng khách, phòng họp,…', 1, '2023-04-05 11:51:12', '2023-04-05 11:51:12'),
(94, 'Google Tivi Sony 4K', 13900000, 'Google Tivi Sony 4K 43 inch KD-43X80K gây ấn tượng với thiết kế tinh tế, hình ảnh sắc nét, chân thật, âm thanh cuốn hút, hỗ trợ nhiều kết nối, tính năng cho từng phút giây trải nghiệm của bạn đều tuyệt vời và thú vị. ', 1, '2023-04-05 11:53:04', '2023-04-05 11:53:04'),
(95, 'GVN G-Studio 5 Plus i3070Ti', 44000000, 'Mainboard ASUS ProArt B660-Creator DDR4\r\nĐược chọn làm nền tảng sức mạnh cho GVN G-Studio 5 Plus i3070Ti, ASUS ProArt B660-Creator DDR4 mang đến những thế mạnh cơ bản cùng nâng cao của dòng mainboard ProArt dành cho dân sáng tạo. Sở hữu chipset B660 cho bạn tăng cường khả năng tương thích cùng những vi xử lý ở phân khúc tầm trung đến cận cao cấp, ASUS ProArt B660-Creator DDR4 tự tin khai thác tối đa sức mạnh cho bộ PC đồ họa.', 1, '2023-04-05 11:55:05', '2023-04-05 11:55:05'),
(96, 'GVN VIPER Plus i3060 - White Edition', 33000000, 'Mainboard GIGABYTE B760M AORUS ELITE AX DDR4\r\nĐóng vai trò là bộ não của máy tính để bàn GVN VIPER Plus i3060 - White Edition, GIGABYTE B760M AORUS ELITE AX DDR4 sở hữu những tính năng vượt trội cùng thiết kế nổi bật. Với các chi tiết như tấm tản nhiệt, khe M.2 được hoàn thiện với những đường nét tinh tế trắng và bạc nhám tạo nên vẻ ngoài bắt mắt. ', 1, '2023-04-05 11:55:58', '2023-04-05 11:55:58'),
(97, 'GVN TITAN Plus i3070Ti', 72490000, 'Đánh giá chi tiết GVN TITAN PLUS i3070Ti\r\n\r\nGVN TITAN PLUS i3070Ti được xây dựng với những linh kiện chủ đạo mang thương hiệu ROG đầy tự hào của Asus, GVN TITAN PLUS I3070TI là một dàn PC gaming không chỉ dành cho fan ROG mà còn là một siêu phẩm đối với những ai yêu cái đẹp và đang tìm kiếm một dàn PC với sức mạnh đỉnh cao.', 1, '2023-04-05 11:56:57', '2023-04-05 11:56:57'),
(98, 'PC Gaming Lenovo', 15390000, 'PC Gaming Lenovo IdeaCentre G5 14IMB05-90N900H8VM - Kiểu dáng đẹp, hiệu suất mạnh mẽ\r\nChiếc PC Gaming Lenovo IdeaCentre G5 14IMB05-90N900H8VM mang đến một phong cách mới, với kiểu dáng đẹp và có nhiều chi tiết ấn tượng. PC còn có hiệu suất mạnh mẽ, giúp nâng cao trải nghiệm và hỗ trợ ép xung tốt.\r\n\r\nThiết kế đẹp mắt, bền bỉ và có nhiều cổng kết nối tiện dụng\r\nPC Gaming Lenovo IdeaCentre G5 14IMB05-90N900H8VM sở hữu kiểu dáng trang nhã, nhưng không kém phần mạnh mẽ để hướng đến phục vụ các game thủ. Cụ thể, trên PC có xuất hiện logo của vi xử lý ở góc dưới và logo Lenovo đặc trưng được đặt ở nửa trên mặt trước.', 1, '2023-04-05 11:58:10', '2023-04-05 11:58:10'),
(99, 'PC CPS Gaming G4', 13070000, 'PC CPS Gaming G4 – Thiết kế cá tính, tính năng nổi trội\r\nPC CPS Gaming G4 được đánh giá cao bởi tính năng và thiết kế ấn tượng của sản phẩm, nhiều khách hàng tin tưởng sử dụng trong thời gian dài để thay mới cho máy cũ hiện tại. Mẫu PC gaming này là lựa chọn hàng đầu dành cho các game thủ chuyên nghiệp mang đến quá trình hoạt động bền bỉ và mượt mà.\r\n\r\nThiết kế cá tính, tinh tế\r\nPC CPS Gaming G4 mang thiết kế cá tính, màu đen hiện đại, các chi tiết được hoàn thiện tỉ mỉ vô cùng tinh tế, tạo ra tổng thể đẹp mắt. PC được tạo ra nhờ chất liệu cao cấp, cứng cáp trong thời gian dài sử dụng sản phẩm.', 1, '2023-04-05 11:58:55', '2023-04-05 11:58:55');
INSERT INTO `products` (`product_id`, `product_name`, `price`, `contents`, `status`, `created_at`, `updated_at`) VALUES
(100, 'PC Asus Rog Strix G10DK', 19990000, 'PC ASUS ROG Strix G10DK-R5600G003W - Sức mạnh vượt bậc\r\nPC ASUS ROG Strix G10DK-R5600G003W hiện đang là cái tên được “săn lùng” hiện nay. LiệuPC Gaming này mang đến sức mạnh mẽ như thế nào mà có thể trở nên nổi tiếng như vậy?\r\n\r\nThiết kế cứng cáp, nhỏ gọn\r\nPC ASUS ROG Strix G10DK-R5600G003W tự hào khiến mình luôn nổi bật nhờ khung máy được ASUS thiết kế đặc trưng với những đường nét gọn gàng, sắc nét, cứng cáp mang đậm chất gaming tương lai.', 1, '2023-04-05 12:00:09', '2023-04-05 12:00:09'),
(101, 'Màn hình LG 24GN60R', 3990000, 'Thương hiệu	LG\r\nModel	24GN60R-B\r\nKích thước màn hình (inch)	23.8 Inch\r\nKích thước (cm)	60,4cm\r\nĐộ phân giải	1920 x 1080 (FHD)\r\nLoại tấm nền	IPS\r\nTỷ lệ màn hình	16:9\r\nKích thước điểm ảnh	0,2745x0,2745 mm\r\nĐộ sáng (Tối thiểu)	240 cd/m²\r\nĐộ sáng (Điển hình)	300 cd/m²\r\nGam màu (Tối thiểu)	sRGB 97% (CIE1931)\r\nGam màu (Điển hình)	sRGB 99% (CIE1931)\r\nĐộ sâu màu (Số màu)	16.7M\r\nTỷ lệ tương phản (Tối thiểu)	700:1\r\nTỷ lệ tương phản (Điển hình)	1000:1\r\nTần số quét	144Hz\r\nThời gian phản hồi	1ms (GtG nhanh hơn)\r\nGóc xem (CR≥10)	178º(R/L), 178º(U/D)\r\n\r\n\r\n\r\n\r\nTính năng	HDR 10\r\nHiệu ứng HDR\r\nHiệu chuẩn màu\r\nChống rung hình\r\nChế độ đọc sách\r\nGiảm độ mờ của chuyển động 1ms: MBR\r\nTương thích G-SYNC\r\nFreeSync Premium\r\nTrình ổn định màu đen\r\nĐồng bộ hóa hành động\r\nĐiểm ngắm\r\nBộ đếm FPS\r\nPhím do người dùng định nghĩa  \r\nChuyển đầu vào tự động \r\nTiết kiệm điện năng thông minh\r\n\r\nCổng kết nối	1 x HDMI (1ea)\r\n1 x DisplayPort (1ea)\r\n1 x DP 1.4\r\n1 x Tai nghe ra\r\n\r\nĐiện năng tiêu thụ	Điển hình: 28W\r\nTối đa: 30.2W\r\nChế độ ngủ: Ít hơn 0.5W\r\nĐặc điểm cơ học	Điều chỉnh vị trí màn hình: Độ nghiêng\r\nHỗ trợ VESA 100 x 100 mm\r\nKích thước sản phẩm	540,8 x 408,9 x 180,5 mm (Có chân đế)\r\n540,8 x 323,8 x 42,8 mm (Không có chân đế)\r\n601 x 384 x 129 mm (Đóng gói)\r\nTrọng lượng	3,94 kg (Có chân đế)\r\n3,5 kg (Không có chân đế)\r\n5,22 kg (Đóng gói)sc', 1, '2023-04-08 20:41:10', '2023-04-08 20:41:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_has_category`
--

DROP TABLE IF EXISTS `products_has_category`;
CREATE TABLE `products_has_category` (
  `products_product_id` int(11) NOT NULL,
  `category_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_has_category`
--

INSERT INTO `products_has_category` (`products_product_id`, `category_category_id`) VALUES
(35, 24),
(37, 24),
(38, 24),
(39, 24),
(40, 24),
(41, 24),
(42, 24),
(43, 24),
(44, 24),
(45, 24),
(46, 24),
(47, 24),
(48, 24),
(49, 24),
(50, 24),
(51, 25),
(52, 25),
(53, 25),
(54, 25),
(55, 25),
(56, 25),
(57, 25),
(58, 25),
(59, 25),
(60, 25),
(61, 25),
(61, 30),
(62, 25),
(62, 30),
(63, 26),
(64, 26),
(65, 26),
(66, 26),
(67, 31),
(68, 31),
(69, 31),
(70, 27),
(71, 27),
(72, 27),
(73, 27),
(74, 27),
(75, 27),
(76, 27),
(77, 27),
(78, 27),
(79, 27),
(80, 26),
(81, 26),
(82, 26),
(83, 27),
(84, 31),
(85, 31),
(86, 31),
(87, 31),
(88, 31),
(89, 29),
(90, 29),
(91, 29),
(92, 29),
(94, 29),
(95, 30),
(96, 30),
(97, 30),
(98, 30),
(99, 30),
(100, 30),
(101, 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_has_orders`
--

DROP TABLE IF EXISTS `products_has_orders`;
CREATE TABLE `products_has_orders` (
  `products_product_id` int(11) NOT NULL,
  `orders_order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_has_orders`
--

INSERT INTO `products_has_orders` (`products_product_id`, `orders_order_id`, `quantity`, `created_at`, `updated_at`) VALUES
(38, 31, 1, '2023-04-05 16:03:50', '2023-04-05 16:03:50'),
(42, 21, 1, '2023-04-05 14:04:19', '2023-04-05 14:04:19'),
(50, 36, 1, '2023-04-15 21:15:03', '2023-04-15 21:15:03'),
(51, 25, 1, '2023-04-05 15:49:44', '2023-04-05 15:49:44'),
(51, 30, 1, '2023-04-05 16:03:21', '2023-04-05 16:03:21'),
(52, 29, 1, '2023-04-05 16:02:58', '2023-04-05 16:02:58'),
(56, 30, 1, '2023-04-05 16:03:35', '2023-04-05 16:03:35'),
(58, 36, 1, '2023-04-15 21:15:14', '2023-04-15 21:15:14'),
(61, 35, 2, '2023-04-14 01:05:03', '2023-04-14 01:05:03'),
(62, 27, 1, '2023-04-05 16:01:34', '2023-04-05 16:01:34'),
(62, 30, 1, '2023-04-05 16:03:27', '2023-04-05 16:03:27'),
(63, 27, 1, '2023-04-05 16:01:51', '2023-04-05 16:01:51'),
(65, 24, 1, '2023-04-05 15:47:18', '2023-04-05 15:47:18'),
(65, 33, 1, '2023-04-06 02:17:55', '2023-04-06 02:17:55'),
(66, 20, 1, '2023-04-05 12:03:58', '2023-04-05 12:03:58'),
(69, 23, 1, '2023-04-05 15:38:56', '2023-04-05 15:38:56'),
(69, 32, 1, '2023-04-05 23:17:21', '2023-04-05 23:17:21'),
(70, 24, 1, '2023-04-05 15:47:30', '2023-04-05 15:47:30'),
(71, 23, 2, '2023-04-05 15:39:06', '2023-04-05 15:39:06'),
(72, 27, 1, '2023-04-05 16:01:43', '2023-04-05 16:01:43'),
(74, 28, 2, '2023-04-05 16:02:24', '2023-04-05 16:02:24'),
(75, 22, 1, '2023-04-05 14:05:13', '2023-04-05 14:05:13'),
(75, 32, 1, '2023-04-05 23:17:15', '2023-04-05 23:17:15'),
(76, 20, 1, '2023-04-05 12:04:03', '2023-04-05 12:04:03'),
(76, 35, 1, '2023-04-14 01:04:57', '2023-04-14 01:04:57'),
(77, 27, 1, '2023-04-05 16:01:25', '2023-04-05 16:01:25'),
(78, 23, 1, '2023-04-05 15:39:25', '2023-04-05 15:39:25'),
(79, 26, 3, '2023-04-05 16:00:51', '2023-04-05 16:00:51'),
(80, 21, 1, '2023-04-05 14:04:11', '2023-04-05 14:04:11'),
(86, 28, 1, '2023-04-05 16:02:38', '2023-04-05 16:02:38'),
(93, 27, 1, '2023-04-05 16:01:29', '2023-04-05 16:01:29'),
(94, 22, 1, '2023-04-05 14:08:45', '2023-04-05 14:08:45'),
(100, 34, 1, '2023-04-07 11:06:25', '2023-04-07 11:06:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `profile_id` int(11) NOT NULL,
  `fullname` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT 'no_avt.png',
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'No Address',
  `date_of_birth` datetime DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `users_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `profiles`
--

INSERT INTO `profiles` (`profile_id`, `fullname`, `avatar`, `address`, `date_of_birth`, `phone_number`, `job`, `gender`, `created_at`, `updated_at`, `users_user_id`) VALUES
(11, 'Admin', 'no_avt.png', 'No Address', '2001-05-14 00:00:00', '0000', 'kithuat', 1, '2023-03-28 20:00:54', '2023-03-28 20:00:54', 39),
(12, 'Kiên Ngu', '1680687217115-766003726_337178391_2010049469387067_7509400306019998846_n.png', 'No Address', '2023-03-08 00:00:00', '0000000', 'khac', 2, '2023-03-29 21:19:12', '2023-04-05 16:33:37', 40),
(13, 'Test1', 'no_avt.png', 'No Address', '2023-04-05 00:00:00', '+84 037 714 051', 'kithuat', 1, '2023-04-05 12:03:34', '2023-04-05 12:03:34', 41),
(14, 'Test2', 'no_avt.png', 'No Address', '2023-06-04 00:00:00', '+84 037 714 050', 'vanhoc', 2, '2023-04-05 13:51:45', '2023-04-05 13:51:45', 42),
(15, 'Test', 'no_avt.png', 'No Address', '2023-04-03 00:00:00', '+84 123 456 789', 'nongnghiep', 2, '2023-04-05 15:38:39', '2023-04-05 15:38:39', 43),
(16, 'Test3', 'no_avt.png', 'No Address', '2022-11-19 00:00:00', '+84 123 123 124', 'nongnghiep', 2, '2023-04-05 15:48:39', '2023-04-05 15:48:39', 44),
(17, 'test4', 'no_avt.png', 'No Address', '2022-11-03 00:00:00', '+84 238 192 731', 'hanhchinh', 2, '2023-04-05 15:49:33', '2023-04-05 15:49:33', 45),
(18, 'Test5', 'no_avt.png', 'No Address', '2023-04-25 00:00:00', '+84 231 342 134', 'hanhchinh', 1, '2023-04-05 16:00:34', '2023-04-05 16:00:34', 46),
(19, 'Phùng Thế Anh', '1680711412363-862088641_Screen Shot 2023-04-05 at 23.16.26.png', 'No Address', '2001-05-14 00:00:00', '+84 037 714 050', 'kithuat', 1, '2023-04-05 23:10:23', '2023-04-05 23:16:52', 47);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rate`
--

DROP TABLE IF EXISTS `rate`;
CREATE TABLE `rate` (
  `rate_id` int(11) NOT NULL,
  `content` varchar(3600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` int(11) NOT NULL,
  `users_user_id` int(11) NOT NULL,
  `products_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `user_role` int(2) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `password`, `created_at`, `updated_at`, `user_role`) VALUES
(39, 'admin', 'admin@gmail.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2023-03-28 20:00:54', '2023-03-28 20:00:54', 1),
(40, 'kienngu', 'kienngu@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '2023-03-29 21:19:12', '2023-03-29 21:19:12', 0),
(41, 'test1', 'test1@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '2023-04-05 12:03:34', '2023-04-05 12:03:34', 0),
(42, 'test2', 'test2@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '2023-04-05 13:51:45', '2023-04-05 13:51:45', 0),
(43, 'test', 'test@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '2023-04-05 15:38:39', '2023-04-05 15:38:39', 0),
(44, 'test3', 'test3@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '2023-04-05 15:48:39', '2023-04-05 15:48:39', 0),
(45, 'test4', 'test4@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '2023-04-05 15:49:33', '2023-04-05 15:49:33', 0),
(46, 'test5', 'test5@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '2023-04-05 16:00:34', '2023-04-05 16:00:34', 0),
(47, 'theanhph', 'theanhph@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '2023-04-05 23:10:23', '2023-04-05 23:10:23', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_has_customer_class`
--

DROP TABLE IF EXISTS `users_has_customer_class`;
CREATE TABLE `users_has_customer_class` (
  `users_user_id` int(11) NOT NULL,
  `customer_class_cclas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `customer_class`
--
ALTER TABLE `customer_class`
  ADD PRIMARY KEY (`cclas_id`);

--
-- Chỉ mục cho bảng `customer_class_has_category`
--
ALTER TABLE `customer_class_has_category`
  ADD PRIMARY KEY (`customer_class_cclas_id`,`category_category_id`),
  ADD KEY `fk_customer_class_has_category_category1_idx` (`category_category_id`),
  ADD KEY `fk_customer_class_has_category_customer_class1_idx` (`customer_class_cclas_id`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `fk_images_products1_idx` (`products_product_id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `fk_messages_messages1_idx` (`messages_message_id`),
  ADD KEY `fk_messages_users1_idx` (`users_user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_orders_users1_idx` (`users_user_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `products_has_category`
--
ALTER TABLE `products_has_category`
  ADD PRIMARY KEY (`products_product_id`,`category_category_id`),
  ADD KEY `fk_products_has_category_category1_idx` (`category_category_id`),
  ADD KEY `fk_products_has_category_products1_idx` (`products_product_id`);

--
-- Chỉ mục cho bảng `products_has_orders`
--
ALTER TABLE `products_has_orders`
  ADD PRIMARY KEY (`products_product_id`,`orders_order_id`),
  ADD KEY `fk_products_has_orders_orders1_idx` (`orders_order_id`),
  ADD KEY `fk_products_has_orders_products1_idx` (`products_product_id`);

--
-- Chỉ mục cho bảng `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `fk_profiles_users1_idx` (`users_user_id`);

--
-- Chỉ mục cho bảng `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `fk_rate_users1_idx` (`users_user_id`),
  ADD KEY `fk_rate_products1_idx` (`products_product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_name_UNIQUE` (`user_name`);

--
-- Chỉ mục cho bảng `users_has_customer_class`
--
ALTER TABLE `users_has_customer_class`
  ADD PRIMARY KEY (`users_user_id`,`customer_class_cclas_id`),
  ADD KEY `fk_users_has_customer_class_customer_class1_idx` (`customer_class_cclas_id`),
  ADD KEY `fk_users_has_customer_class_users1_idx` (`users_user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `customer_class`
--
ALTER TABLE `customer_class`
  MODIFY `cclas_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT cho bảng `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `rate`
--
ALTER TABLE `rate`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `customer_class_has_category`
--
ALTER TABLE `customer_class_has_category`
  ADD CONSTRAINT `fk_customer_class_has_category_category1` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_customer_class_has_category_customer_class1` FOREIGN KEY (`customer_class_cclas_id`) REFERENCES `customer_class` (`cclas_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_products1` FOREIGN KEY (`products_product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_messages1` FOREIGN KEY (`messages_message_id`) REFERENCES `messages` (`message_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_messages_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `products_has_category`
--
ALTER TABLE `products_has_category`
  ADD CONSTRAINT `fk_products_has_category_category1` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_has_category_products1` FOREIGN KEY (`products_product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `products_has_orders`
--
ALTER TABLE `products_has_orders`
  ADD CONSTRAINT `fk_products_has_orders_orders1` FOREIGN KEY (`orders_order_id`) REFERENCES `orders` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_has_orders_products1` FOREIGN KEY (`products_product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `fk_profiles_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `fk_rate_products1` FOREIGN KEY (`products_product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rate_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `users_has_customer_class`
--
ALTER TABLE `users_has_customer_class`
  ADD CONSTRAINT `fk_users_has_customer_class_customer_class1` FOREIGN KEY (`customer_class_cclas_id`) REFERENCES `customer_class` (`cclas_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_customer_class_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
