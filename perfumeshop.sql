-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 08, 2024 lúc 05:27 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `perfumeshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nguodung_id` bigint(20) UNSIGNED NOT NULL,
  `tinhtrang_id` bigint(20) UNSIGNED NOT NULL,
  `dienthoaigiaohang` varchar(20) NOT NULL,
  `diachigiaohang` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `nguodung_id`, `tinhtrang_id`, `dienthoaigiaohang`, `diachigiaohang`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0374133897', 'Nhà tui nè', '2024-01-08 14:52:01', '2024-01-08 14:52:01'),
(2, 1, 1, '0374133897', 'Nhà tui nè', '2024-01-08 15:10:33', '2024-01-08 15:10:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang_chitiet`
--

CREATE TABLE `donhang_chitiet` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `donhang_id` bigint(20) UNSIGNED NOT NULL,
  `sanpham_id` bigint(20) UNSIGNED NOT NULL,
  `soluongban` int(11) NOT NULL,
  `dongiaban` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang_chitiet`
--

INSERT INTO `donhang_chitiet` (`id`, `donhang_id`, `sanpham_id`, `soluongban`, `dongiaban`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 1, 3250000, '2024-01-08 14:52:01', '2024-01-08 14:52:01'),
(2, 2, 1, 1, 3950000, '2024-01-08 15:10:33', '2024-01-08 15:10:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangsanxuat`
--

CREATE TABLE `hangsanxuat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenhang` varchar(191) NOT NULL,
  `tenhang_slug` varchar(191) NOT NULL,
  `hinhanh` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hangsanxuat`
--

INSERT INTO `hangsanxuat` (`id`, `tenhang`, `tenhang_slug`, `hinhanh`, `created_at`, `updated_at`) VALUES
(1, 'Chanel', 'chanel', 'hang-san-xuat/chanel.png', '2024-01-08 13:03:43', '2024-01-08 13:03:43'),
(2, 'Lancome', 'lancome', 'hang-san-xuat/lancome.png', '2024-01-08 13:04:11', '2024-01-08 13:04:11'),
(3, 'Chloe', 'chloe', 'hang-san-xuat/chloe.png', '2024-01-08 13:04:26', '2024-01-08 13:04:26'),
(4, 'Gucci', 'gucci', 'hang-san-xuat/gucci.png', '2024-01-08 13:04:50', '2024-01-08 13:04:50'),
(5, 'Marc Jacobs', 'marc-jacobs', 'hang-san-xuat/marc-jacobs.png', '2024-01-08 13:05:13', '2024-01-08 13:05:13'),
(6, 'Estee Lauder', 'estee-lauder', 'hang-san-xuat/estee-lauder.png', '2024-01-08 13:05:34', '2024-01-08 13:05:34'),
(7, 'Guerlain', 'guerlain', 'hang-san-xuat/guerlain.png', '2024-01-08 13:06:00', '2024-01-08 13:06:00'),
(8, 'Giorgio Armani', 'giorgio-armani', 'hang-san-xuat/giorgio-armani.png', '2024-01-08 13:06:28', '2024-01-08 13:06:28'),
(9, 'Dior', 'dior', 'hang-san-xuat/dior.png', '2024-01-08 13:06:42', '2024-01-08 13:06:42'),
(10, 'Calvin Klein', 'calvin-klein', 'hang-san-xuat/calvin-klein.png', '2024-01-08 13:06:57', '2024-01-08 13:06:57'),
(11, 'Tom Ford', 'tom-ford', 'hang-san-xuat/tom-ford.png', '2024-01-08 13:07:09', '2024-01-08 13:07:09'),
(12, 'Burberry', 'burberry', 'hang-san-xuat/burberry.jpg', '2024-01-08 13:07:23', '2024-01-08 13:07:23'),
(13, 'YSL', 'ysl', 'hang-san-xuat/ysl.png', '2024-01-08 13:07:37', '2024-01-08 13:07:37'),
(14, 'Hermes', 'hermes', 'hang-san-xuat/hermes.png', '2024-01-08 13:07:53', '2024-01-08 13:07:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoiphucmatkhau`
--

CREATE TABLE `khoiphucmatkhau` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lienhe`
--

CREATE TABLE `lienhe` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ten` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `sdt` varchar(191) NOT NULL,
  `chude` varchar(191) NOT NULL,
  `noidung` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lienhe`
--

INSERT INTO `lienhe` (`id`, `ten`, `email`, `sdt`, `chude`, `noidung`, `created_at`, `updated_at`) VALUES
(1, 'Giang', 'khgiang_21th@student.agu.edu.vn', '12344556', 'Chào', '<p>Xin Chào</p>', '2024-01-08 14:53:11', '2024-01-08 14:53:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenloai` varchar(191) NOT NULL,
  `tenloai_slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`id`, `tenloai`, `tenloai_slug`, `created_at`, `updated_at`) VALUES
(1, 'Nam', 'nam', '2024-01-08 12:59:20', '2024-01-08 12:59:20'),
(2, 'Nữ', 'nu', '2024-01-08 12:59:32', '2024-01-08 12:59:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2023_12_17_000001_create_loai_san_phams_table', 1),
(4, '2023_12_17_000002_create_hang_san_xuats_table', 1),
(5, '2023_12_17_000003_create_san_phams_table', 1),
(6, '2023_12_17_000004_create_tinh_trangs_table', 1),
(7, '2023_12_17_000005_create_don_hangs_table', 1),
(8, '2023_12_17_000006_create_don_hang__chi_tiets_table', 1),
(9, '2024_01_08_095943_create_lien_hes_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `role` varchar(191) NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`id`, `name`, `email`, `username`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Khưu Hoàng User', 'geekay05052002@gmail.com', 'geekay05052002', 'user', NULL, '$2y$12$GefMG9v95fk9oJiyN4Hab.xN1mP0/gIWvynnoYc.kIX.69fpU2LgC', NULL, '2024-01-08 12:55:22', '2024-01-08 12:55:22'),
(2, 'Khưu Hoàng Admin', 'giangkhuu3897@gmail.com', 'giangkhuu3897', 'admin', NULL, '$2y$12$LbokCgNmw3tRHaARCVO0c.azgTU6XVZzoYnQZWqcYnRnVsrl70q6K', NULL, '2024-01-08 12:56:19', '2024-01-08 12:56:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loaisanpham_id` bigint(20) UNSIGNED NOT NULL,
  `hangsanxuat_id` bigint(20) UNSIGNED NOT NULL,
  `tensanpham` varchar(191) NOT NULL,
  `tensanpham_slug` varchar(191) NOT NULL,
  `soluong` int(11) NOT NULL,
  `dongia` double NOT NULL,
  `hinhanh` varchar(191) DEFAULT NULL,
  `motasanpham` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `loaisanpham_id`, `hangsanxuat_id`, `tensanpham`, `tensanpham_slug`, `soluong`, `dongia`, `hinhanh`, `motasanpham`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Bleu De Chanel Limited-Edition Parfum Spray', 'bleu-de-chanel-limited-edition-parfum-spray', 100, 3950000, 'nam/bleu-de-chanel-limited-edition-parfum-spray.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:14:48', '2024-01-08 13:14:48'),
(2, 1, 1, 'Bleu De Chanel Parfum', 'bleu-de-chanel-parfum', 100, 3850000, 'nam/bleu-de-chanel-parfum.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:15:46', '2024-01-08 13:15:46'),
(3, 1, 1, 'Allure Homme Sport Cologne For Men', 'allure-homme-sport-cologne-for-men', 100, 2350000, 'nam/allure-homme-sport-cologne-for-men.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:16:51', '2024-01-08 13:16:51'),
(4, 1, 1, 'Chanel Bleu De Chanel EDP', 'chanel-bleu-de-chanel-edp', 100, 3250000, 'nam/chanel-bleu-de-chanel-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:17:53', '2024-01-08 13:17:53'),
(5, 1, 1, 'Chanel Allure Homme Sport EDT', 'chanel-allure-homme-sport-edt', 100, 2900000, 'nam/chanel-allure-homme-sport-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:19:15', '2024-01-08 13:19:15'),
(6, 1, 1, 'Chanel Allure Homme Sport Eau Extreme', 'chanel-allure-homme-sport-eau-extreme', 100, 3250000, 'nam/chanel-allure-homme-sport-eau-extreme.png', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:20:40', '2024-01-08 13:20:40'),
(7, 1, 1, 'Allure Homme Eau De Toilette', 'allure-homme-eau-de-toilette', 100, 3300000, 'nam/allure-homme-eau-de-toilette.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:21:32', '2024-01-08 13:21:32'),
(8, 1, 1, 'Allure Edition Blanche EDP', 'allure-edition-blanche-edp', 100, 2980000, 'nam/allure-edition-blanche-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:22:26', '2024-01-08 13:22:26'),
(9, 1, 1, 'Allure Homme Edition Blanche', 'allure-homme-edition-blanche', 100, 3050000, 'nam/allure-homme-edition-blanche.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:23:32', '2024-01-08 13:23:32'),
(10, 1, 1, 'Bleu De Parfum', 'bleu-de-parfum', 100, 3490000, 'nam/bleu-de-parfum.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:24:31', '2024-01-08 13:24:31'),
(11, 1, 1, 'Allure Homme Sport Eau Extreme EDP', 'allure-homme-sport-eau-extreme-edp', 100, 3490000, 'nam/allure-homme-sport-eau-extreme-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:26:33', '2024-01-08 13:26:33'),
(12, 1, 2, 'Hypnose Homme Eau De Toilette For Men', 'hypnose-homme-eau-de-toilette-for-men', 100, 1785000, 'nam/hypnose-homme-eau-de-toilette-for-men.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:28:16', '2024-01-08 13:28:16'),
(13, 1, 4, 'Guilty Pour Homme Parfum', 'guilty-pour-homme-parfum', 100, 2150000, 'nam/guilty-pour-homme-parfum.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:30:09', '2024-01-08 13:30:09'),
(14, 1, 4, 'Guilty Absolute EDP', 'guilty-absolute-edp', 100, 2790000, 'nam/guilty-absolute-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:31:21', '2024-01-08 13:31:21'),
(15, 1, 4, 'Gucci Guilty Love Edition MMXXI EDT', 'gucci-guilty-love-edition-mmxxi-edt', 100, 1990000, 'nam/gucci-guilty-love-edition-mmxxi-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:32:30', '2024-01-08 13:32:30'),
(16, 1, 4, 'Guilty Pour Homme Parfum Sang Trọng', 'guilty-pour-homme-parfum-sang-trong', 100, 3100000, 'nam/guilty-pour-homme-parfum-sang-trong.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:34:05', '2024-01-08 13:34:18'),
(17, 1, 4, 'Pour Homme Eau De Toilette', 'pour-homme-eau-de-toilette', 100, 2500000, 'nam/pour-homme-eau-de-toilette.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:35:05', '2024-01-08 13:35:05'),
(18, 1, 4, 'Guilty Black Pour Homme EDT', 'guilty-black-pour-homme-edt', 100, 2300000, 'nam/guilty-black-pour-homme-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:38:34', '2024-01-08 13:38:34'),
(19, 1, 4, 'Guilty Intense Pour Homme EDT', 'guilty-intense-pour-homme-edt', 100, 1750000, 'nam/guilty-intense-pour-homme-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:42:43', '2024-01-08 13:42:43'),
(20, 1, 7, 'Guerlain Heritage EDT', 'guerlain-heritage-edt', 100, 1500000, 'nam/guerlain-heritage-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:44:45', '2024-01-08 13:44:45'),
(21, 1, 7, 'Homme EDP', 'homme-edp', 100, 1850000, 'nam/homme-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 13:45:42', '2024-01-08 13:45:42'),
(22, 1, 7, 'Habit Rouge EDT', 'habit-rouge-edt', 100, 1525000, 'nam/habit-rouge-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 14:18:58', '2024-01-08 14:18:58'),
(23, 1, 8, 'Acqua Di Gio Profondo Eau De Parfum', 'acqua-di-gio-profondo-eau-de-parfum', 100, 2550000, 'nam/acqua-di-gio-profondo-eau-de-parfum.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 14:20:29', '2024-01-08 14:20:29'),
(24, 1, 8, 'Acqua Di Gio EDT', 'acqua-di-gio-edt', 100, 2300000, 'nam/acqua-di-gio-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 14:21:49', '2024-01-08 14:21:49'),
(25, 1, 9, 'Eau Sauvage Eau De Toilette', 'eau-sauvage-eau-de-toilette', 100, 1850000, 'nam/eau-sauvage-eau-de-toilette.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 14:22:44', '2024-01-08 14:22:44'),
(26, 1, 9, 'Sauvage Eau De Toilette', 'sauvage-eau-de-toilette', 100, 2550000, 'nam/sauvage-eau-de-toilette.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 14:24:55', '2024-01-08 14:24:55'),
(27, 1, 9, 'Homme Bản 2020 EDP Intense', 'homme-ban-2020-edp-intense', 100, 2850000, 'nam/homme-ban-2020-edp-intense.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 14:26:05', '2024-01-08 14:26:05'),
(28, 1, 9, 'Homme Intense EDP', 'homme-intense-edp', 123, 3150000, 'nam/homme-intense-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 14:27:09', '2024-01-08 14:27:09'),
(29, 1, 10, 'CK Man EDT', 'ck-man-edt', 123, 900000, 'nam/ck-man-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:14:35', '2024-01-08 15:14:35'),
(30, 1, 10, 'CK Eternity Air EDT', 'ck-eternity-air-edt', 123, 896000, 'nam/ck-eternity-air-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:15:23', '2024-01-08 15:15:23'),
(31, 1, 11, 'Grey Vetiver Parfum', 'grey-vetiver-parfum', 123, 3800000, 'nam/grey-vetiver-parfum.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:16:24', '2024-01-08 15:16:24'),
(32, 1, 11, 'Ombre Leather Le Parfum', 'ombre-leather-le-parfum', 123, 2440000, 'nam/ombre-leather-le-parfum.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:17:20', '2024-01-08 15:17:20'),
(33, 1, 12, 'London For Men EDT', 'london-for-men-edt', 123, 1800000, 'nam/london-for-men-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:18:29', '2024-01-08 15:18:29'),
(34, 1, 12, 'Eau De Toilette', 'eau-de-toilette', 123, 1150000, 'nam/eau-de-toilette.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:19:38', '2024-01-08 15:19:38'),
(35, 1, 13, 'Yves Saint Laurent YSL MYSLF', 'yves-saint-laurent-ysl-myslf', 123, 2480000, 'nam/yves-saint-laurent-ysl-myslf.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:20:47', '2024-01-08 15:20:47'),
(36, 1, 13, 'Yves Saint Laurent YSL Y Eau De Toilette', 'yves-saint-laurent-ysl-y-eau-de-toilette', 123, 1980000, 'nam/yves-saint-laurent-ysl-y-eau-de-toilette.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:21:31', '2024-01-08 15:21:31'),
(37, 1, 14, 'Terre D\'Hermes Eau de Toilette', 'terre-dhermes-eau-de-toilette', 123, 2140000, 'nam/terre-dhermes-eau-de-toilette.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:22:45', '2024-01-08 15:22:45'),
(38, 1, 14, 'Terre D\'Hermes Eau Intense Vetiver Limited Edition', 'terre-dhermes-eau-intense-vetiver-limited-edition', 123, 2180000, 'nam/terre-dhermes-eau-intense-vetiver-limited-edition.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:23:56', '2024-01-08 15:23:56'),
(39, 2, 1, 'Coco Mademoiselle Limited EDP', 'coco-mademoiselle-limited-edp', 123, 3780000, 'nu/coco-mademoiselle-limited-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:25:42', '2024-01-08 15:25:42'),
(40, 2, 1, 'No5 EDP Limited Edition 2023', 'no5-edp-limited-edition-2023', 123, 3500000, 'nu/no5-edp-limited-edition-2023.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:27:23', '2024-01-08 15:27:23'),
(41, 2, 1, 'Coco Mademoiselle Thanh Lịch', 'coco-mademoiselle-thanh-lich', 123, 3650000, 'nu/coco-mademoiselle-thanh-lich.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:28:13', '2024-01-08 15:28:13'),
(42, 2, 2, 'Tresor La Nuit EDP', 'tresor-la-nuit-edp', 123, 2400000, 'nu/tresor-la-nuit-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:29:50', '2024-01-08 15:29:50'),
(43, 2, 2, 'La Nuit Tresor Intense EDP', 'la-nuit-tresor-intense-edp', 123, 3300000, 'nu/la-nuit-tresor-intense-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:30:40', '2024-01-08 15:30:40'),
(44, 2, 4, 'Bloom Intense EDP', 'bloom-intense-edp', 123, 2800000, 'nu/bloom-intense-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:32:04', '2024-01-08 15:32:04'),
(45, 2, 4, 'Flora Gorgeous Magnolia Eau De Parfum', 'flora-gorgeous-magnolia-eau-de-parfum', 123, 2450000, 'nu/flora-gorgeous-magnolia-eau-de-parfum.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:33:00', '2024-01-08 15:33:00'),
(46, 2, 4, 'Bloom Eau De Toilette', 'bloom-eau-de-toilette', 123, 2650000, 'nu/bloom-eau-de-toilette.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:34:43', '2024-01-08 15:34:43'),
(47, 2, 5, 'Daisy Love Eau So Sweet EDT', 'daisy-love-eau-so-sweet-edt', 123, 1550000, 'nu/daisy-love-eau-so-sweet-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:35:46', '2024-01-08 15:35:46'),
(48, 2, 5, 'Daisy Dream For Women', 'daisy-dream-for-women', 123, 1590000, 'nu/daisy-dream-for-women.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:36:48', '2024-01-08 15:36:48'),
(49, 2, 5, 'Perfect EDP', 'perfect-edp', 123, 2000000, 'nu/perfect-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:37:37', '2024-01-08 15:37:37'),
(50, 2, 6, 'Pleasures EDP', 'pleasures-edp', 123, 1900000, 'nu/pleasures-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:38:35', '2024-01-08 15:38:35'),
(51, 2, 6, 'Modern Muse Eau De Parfum Spray', 'modern-muse-eau-de-parfum-spray', 123, 4200000, 'nu/modern-muse-eau-de-parfum-spray.png', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:39:42', '2024-01-08 15:39:42');
INSERT INTO `sanpham` (`id`, `loaisanpham_id`, `hangsanxuat_id`, `tensanpham`, `tensanpham_slug`, `soluong`, `dongia`, `hinhanh`, `motasanpham`, `created_at`, `updated_at`) VALUES
(52, 2, 7, 'Mon Bloom Of Rose Eau De Parfum', 'mon-bloom-of-rose-eau-de-parfum', 123, 2850000, 'nu/mon-bloom-of-rose-eau-de-parfum.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:46:20', '2024-01-08 15:46:20'),
(53, 2, 7, 'Black Perfecto By La Petite Robe Noire EDP', 'black-perfecto-by-la-petite-robe-noire-edp', 123, 2049000, 'nu/black-perfecto-by-la-petite-robe-noire-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:47:37', '2024-01-08 15:47:37'),
(54, 2, 8, 'Armani Ocean Di Gioia EDP', 'armani-ocean-di-gioia-edp', 123, 1980000, 'nu/armani-ocean-di-gioia-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:48:41', '2024-01-08 15:48:41'),
(55, 2, 8, 'Armani Si Passione EDP', 'armani-si-passione-edp', 123, 2550000, 'nu/armani-si-passione-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:49:28', '2024-01-08 15:49:28'),
(56, 2, 9, 'J\'adore Parfum D\'eau EDP', 'jadore-parfum-deau-edp', 123, 3200000, 'nu/jadore-parfum-deau-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:51:07', '2024-01-08 15:51:07'),
(57, 2, 9, 'Hypnotic Poison EDP', 'hypnotic-poison-edp', 123, 3000000, 'nu/hypnotic-poison-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:51:55', '2024-01-08 15:51:55'),
(58, 2, 9, 'Miss Dior EDT', 'miss-dior-edt', 122, 2440000, 'nu/miss-dior-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:52:42', '2024-01-08 15:52:42'),
(59, 2, 10, 'CK IN2U For Her', 'ck-in2u-for-her', 113, 795000, 'nu/ck-in2u-for-her.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:53:52', '2024-01-08 15:53:52'),
(60, 2, 11, 'Velvet Orchid For Women', 'velvet-orchid-for-women', 123, 2050000, 'nu/velvet-orchid-for-women.png', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:54:48', '2024-01-08 15:54:48'),
(61, 2, 12, 'Her EDP', 'her-edp', 123, 2150000, 'nu/her-edp.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:55:47', '2024-01-08 15:55:47'),
(62, 2, 14, 'Eau Des Merveilles EDT', 'eau-des-merveilles-edt', 123, 2300000, 'nu/eau-des-merveilles-edt.jpg', '<p><span style=\"color:rgb(55,65,81);\">Nước hoa không chỉ là một sản phẩm làm đẹp mà còn là biểu tượng của phong cách và cá nhân hóa. Sự tinh tế và quyến rũ của hương thơm không chỉ làm tôn lên vẻ ngoại hình mà còn là ngôn ngữ giao tiếp không lời về đẳng cấp và gu thẩm mỹ. Sản phẩm nước hoa của chúng tôi không chỉ là một chai nước hoa, mà là một tác phẩm nghệ thuật kết hợp giữa công nghệ và nghệ thuật, từ việc chọn lựa nguyên liệu đến quá trình pha chế cầu kỳ. Với đa dạng các loại hương từ nhẹ nhàng, quyến rũ đến mạnh mẽ và cá tính, chúng tôi cam kết mang lại trải nghiệm thăng hoa cho mọi người yêu thủy chung và cái đẹp. Hãy để sản phẩm nước hoa của chúng tôi làm nổi bật và kể lên câu chuyện riêng của bạn, nơi nghệ thuật gặp gỡ sức sống, tạo nên một hồn thơm riêng biệt.</span></p>', '2024-01-08 15:57:01', '2024-01-08 15:57:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tinhtrang`
--

CREATE TABLE `tinhtrang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tinhtrang` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tinhtrang`
--

INSERT INTO `tinhtrang` (`id`, `tinhtrang`, `created_at`, `updated_at`) VALUES
(1, 'Đơn Hàng Mới', '2024-01-08 13:09:06', '2024-01-08 13:09:06');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donhang_nguodung_id_foreign` (`nguodung_id`),
  ADD KEY `donhang_tinhtrang_id_foreign` (`tinhtrang_id`);

--
-- Chỉ mục cho bảng `donhang_chitiet`
--
ALTER TABLE `donhang_chitiet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donhang_chitiet_donhang_id_foreign` (`donhang_id`),
  ADD KEY `donhang_chitiet_sanpham_id_foreign` (`sanpham_id`);

--
-- Chỉ mục cho bảng `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `khoiphucmatkhau`
--
ALTER TABLE `khoiphucmatkhau`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nguoidung_email_unique` (`email`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanpham_loaisanpham_id_foreign` (`loaisanpham_id`),
  ADD KEY `sanpham_hangsanxuat_id_foreign` (`hangsanxuat_id`);

--
-- Chỉ mục cho bảng `tinhtrang`
--
ALTER TABLE `tinhtrang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `donhang_chitiet`
--
ALTER TABLE `donhang_chitiet`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `tinhtrang`
--
ALTER TABLE `tinhtrang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_nguodung_id_foreign` FOREIGN KEY (`nguodung_id`) REFERENCES `nguoidung` (`id`),
  ADD CONSTRAINT `donhang_tinhtrang_id_foreign` FOREIGN KEY (`tinhtrang_id`) REFERENCES `tinhtrang` (`id`);

--
-- Các ràng buộc cho bảng `donhang_chitiet`
--
ALTER TABLE `donhang_chitiet`
  ADD CONSTRAINT `donhang_chitiet_donhang_id_foreign` FOREIGN KEY (`donhang_id`) REFERENCES `donhang` (`id`),
  ADD CONSTRAINT `donhang_chitiet_sanpham_id_foreign` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_hangsanxuat_id_foreign` FOREIGN KEY (`hangsanxuat_id`) REFERENCES `hangsanxuat` (`id`),
  ADD CONSTRAINT `sanpham_loaisanpham_id_foreign` FOREIGN KEY (`loaisanpham_id`) REFERENCES `loaisanpham` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
