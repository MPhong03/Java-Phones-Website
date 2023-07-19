-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2023 at 05:36 AM
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
(1, 'Những nâng cấp lớn về hiệu năng, dung lượng pin, và trên hết là camera sau chính là những điểm khiến nó trở thành siêu phẩm trong phân khúc cao cấp. Dưới đây là những thông tin cần biết về dòng điện thoại vừa ra mắt của Samsung. Dưới đây', 'unknown', 17000000, 'Samsung Galaxy S22 Ultra (8GB - 128GB)', 1, 1),
(2, 'Apple Magic Mouse 2 mang trong mình một thiết kế bằng kim loại phần khung và thân chuột, giúp chúng có một độ sang trọng và cao cấp nhất định. Cùng với đó, phần thao tác bằng nhựa cao cấp, bền bỉ ở bên trên giúp cho bạn có thể có được những thao tác gọn nhẹ, linh hoạt và thoải mái nhất có thể. Thiết kế này của chuột Magic Mouse 2 giúp đồng bộ và hài hoà khi bạn sử dụng với thiết bị Apple.', 'unknown', 2300000, 'Chuột Apple Magic Mouse 2022 MMMQ3 | Chính hãng Apple Việt Nam', 2, 4),
(3, 'Vừa qua, Apple đã chính thức cho ra mắt chiếc tai nghe Apple Airpods 2 sở hữu chip H1 được dành riêng giúp chuyển nhanh các cuộc gọi từ iPhone sang Airpods cũng như giảm mức tiêu thụ điện năng cực kỳ thấp. Thời gian sử dụng đến 5 giờ nghe nhạc hoặc 3 giờ đàm thoại và khi kết hợp với hộp sạc cho thời gian đến 24 giờ. Kết nối không dây chất lượng cao, tự động bật và luôn kết nối giúp sẵn sàng theo bạn đến bất kỳ đâu. Cùng tham khảo thêm về chiếc Airpod 2 này nhé.', 'unknown', 2670000, 'Tai nghe Bluetooth Apple AirPods 2 | Chính hãng Apple Việt Nam', 2, 6),
(4, 'Điện thoại Xiaomi Redmi Note 12 – Thiết kế sang trọng, hiệu năng mạnh mẽ\r\nDòng Redmi Note của Xiaomi có được khá đông đảo anh em công nghệ quan tâm tới, bởi vì thường có mức giá rẻ và sâu bên trong là bộ vi xử lý mạnh mẽ hơn hẳn những đối thủ trong cùng tầm giá.', 'unknown', 4390000, 'Xiaomi Redmi Note 12 4GB 128GB', 3, 1),
(5, 'Asus ROG Strix G15 G513IH-HN015TW là chiếc laptop có cấu hình mạnh mẽ, đáp ứng được hầu hết các tựa game trên thị trường hiện nay. Ngay cả khi hoạt động trong nhiều giờ liền máy vẫn khá mát mẻ do có hệ thống tản nhiệt cao cấp. Nếu bạn là một game thủ hay người dùng muốn tìm máy có cấu hình cao thì đừng bỏ qua chiếc laptop Asus chất lượng này.', 'unknown', 18290000, 'Laptop Asus Gaming Rog Strix G15 G513IH HN015W', 5, 2),
(6, 'Sau thành công của dòng Macbook M1 thì Apple lại chuẩn bị mang đến cho người dùng dòng sản phẩm Macbook Air 2022 với những điểm nâng cấp đáng chú ý. Bên cạnh đó mức giá thành lại thấp hơn so với hiện tại, chắc chắn rằng các iFan đang rất nóng lòng chờ đón sự xuất hiện của dòng sản phẩm mới này.', 'unknown', 26990000, 'Apple Macbook Air M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', 2, 2),
(7, 'Sản phẩm bàn phím Apple Magic Keyboard 2021 MK2A3 đến từ thương hiệu chính hãng Apple, sở hữu thiết kế hiện đại, nhỏ gọn nhưng vẫn được cung cấp đầy đủ các phím chức năng phổ biến. Hãy cùng CellphoneS tìm hiểu rõ hơn về chất lượng của bàn phím này nhé!', 'unknown', 2090000, 'Bàn phím Apple Magic Keyboard 2021 MK2A3 | Chính hãng Apple Việt Nam', 2, 4);

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
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
