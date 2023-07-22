-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 03:23 AM
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
-- Database: `javaweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brandid` int(11) NOT NULL,
  `brandname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brandid`, `brandname`) VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'Xiaomi'),
(4, 'Oppo'),
(5, 'Asus');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL,
  `categoryname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `categoryname`) VALUES
(1, 'Điện thoại'),
(2, 'Laptop'),
(3, 'PC'),
(4, 'Phụ kiện'),
(5, 'Tivi'),
(6, 'Âm thanh'),
(7, 'Máy ảnh'),
(8, 'Tablet');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productid` int(11) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `imagelink` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `brandid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `description`, `imagelink`, `price`, `productname`, `brandid`, `categoryid`) VALUES
(13, 'Bàn phím laptop được thiết kế khoa học với cấu trúc liền khối cùng hành trình phím ngắn. Nhờ vậy bạn có thể bấm phím thoải mái, dễ dàng không bị dính phím. đồng thời tiếng động gây ra từ bàn phím khá nhỏ không làm ồn đến người dùng cũng như môi trường xung quanh.', '/img/products-image-list/laptop-asus-vivobook-r564ja-uh51t-1.jpg;/img/products-image-list/laptop-asus-vivobook-r564ja-uh51t-2.jpg;/img/products-image-list/laptop-asus-vivobook-r564ja-uh51t-3.jpg', 11690000, 'Laptop ASUS VivoBook R564JA-UH31T', 5, 2),
(15, 'Samsung từng bước khẳng định thương hiệu của mình bằng việc cho ra đời những mẫu flagship ngày càng hiện đại với công nghệ tiến bộ. Điển hình là chiếc điện thoại Samsung Galaxy S21 Ultra 5G  tích hợp mọi tính năng gần như trở thành mẫu smartphone hoàn hảo nhất.', 'unknown', 9990000, 'Samsung Galaxy S21 Ultra 5G Korea (Likenew)', 1, 1),
(16, 'Hoàn toàn xứng đáng với những gì được mong chờ, phiên bản cao cấp nhất iPhone Xs Max 64 GB của Apple năm nay nổi bật với chip A12 Bionic mạnh mẽ, màn hình rộng đến 6.5 inch, cùng camera kép trí tuệ nhân tạo và Face ID được nâng cấp.', 'unknown', 8990000, 'Apple iPhone Xs Max 256GB Quốc Tế (Likenew)', 2, 1),
(17, 'Tai nghe Bluetooth AirPods Pro MagSafe Charge Apple MLWK3 trắng được chế tác với vẻ ngoài tinh giản, gam màu trắng trẻ trung, sáng đẹp, phối hợp tuyệt vời với mọi trang phục từ đời thường đến công sở, dự tiệc của bạn. ', 'unknown', 4690000, 'Apple AirPods Pro 2021 Magsafe', 2, 6),
(18, 'Black Shark 4 là điện thoại chơi game hàng đầu của Xiaomi trong năm 2021. Những điểm mạnh của Black Shark 4 là tương đối toàn diện. Thiết kế toàn màn hình cao cấp với tốc độ làm mới 144Hz/720Hz. Phần cứng là bộ vi xử lý Snapdragon 870 mạnh mẽ. Tản nhiệt cũng được nâng cấp mạnh mẽ giảm tới 18 độ cho CPU giúp chơi game cấu hình cao không nóng máy. Hơn nữa, Black Shark 4 đã xác lập kỷ lục với pin 4500mAh, hỗ trợ sạc 120W “nhanh nhất thế giới”,… Mang lại hiệu năng vượt trội về nhiều mặt.', 'unknown', 5790000, 'Xiaomi Black Shark 4 (8GB/128GB) Likenew', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productvalue`
--

CREATE TABLE `productvalue` (
  `valueid` int(11) NOT NULL,
  `valueindex` varchar(255) DEFAULT NULL,
  `valuename` varchar(255) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productvalue`
--

INSERT INTO `productvalue` (`valueid`, `valueindex`, `valuename`, `productid`) VALUES
(4, 'Intel Core I3-1005G1 1.20 GHz up to 3.40 GHz', 'Loại CPU', 13),
(5, 'Intel UHD Graphics', 'Loại card đồ họa', 13),
(6, '4GB', 'Dung lượng RAM', 13),
(8, '6.8 inches', 'Kích thước màn hình', 15),
(9, 'Exynos 2100', 'Chipset', 15),
(12, '6.5 inches', 'Kích thước màn hình', 16),
(13, 'Super Retina OLED', 'Công nghệ màn hình', 16),
(14, '4GB', 'Dung lượng RAM', 16),
(15, '64GB', 'Bộ nhớ trong', 16),
(18, '1', 'test1', 17),
(19, '2', 'test2', 17),
(23, '6.67 inches', 'Kích thước màn hình', 18),
(24, 'Super AMOLED 144Hz', 'Công nghệ màn hình', 18);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isadmin` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `address`, `email`, `isadmin`, `password`, `phonenumber`, `username`) VALUES
(5, '101/29 Bùi Minh Trực P.5, Q.8', 'dangminhphong@gmail.com', b'0', 'user', '0764186912', 'user'),
(6, '101/29 Bùi Minh Trực P.5, Q.8', 'dangminhphong1@gmail.com', b'0', 'user', '0764186912', 'user1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brandid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `FKbjg13m30ju2y2g5icqbuycglv` (`brandid`),
  ADD KEY `FK4ort9abhumpx4t2mlngljr1vi` (`categoryid`);

--
-- Indexes for table `productvalue`
--
ALTER TABLE `productvalue`
  ADD PRIMARY KEY (`valueid`),
  ADD KEY `FKowugdbg12112ys9qacm9om453` (`productid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `productvalue`
--
ALTER TABLE `productvalue`
  MODIFY `valueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK4ort9abhumpx4t2mlngljr1vi` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`),
  ADD CONSTRAINT `FKbjg13m30ju2y2g5icqbuycglv` FOREIGN KEY (`brandid`) REFERENCES `brand` (`brandid`);

--
-- Constraints for table `productvalue`
--
ALTER TABLE `productvalue`
  ADD CONSTRAINT `FKowugdbg12112ys9qacm9om453` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
