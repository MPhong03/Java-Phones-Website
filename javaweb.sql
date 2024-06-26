-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2023 at 02:24 PM
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brandid`, `brandname`) VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'Xiaomi'),
(4, 'Oppo'),
(5, 'Asus'),
(9, 'Nokia'),
(10, 'Acer'),
(14, 'Canon'),
(15, 'Dell'),
(16, 'HP'),
(17, 'MSI'),
(18, 'Sony');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `cardid` int(11) NOT NULL,
  `cvv` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `numbercard` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`cardid`, `cvv`, `money`, `month`, `name`, `numbercard`, `year`) VALUES
(1, 789, 5520000, 5, 'Trần Hữu Lộc', '123456789', 2025);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartid` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `productid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartid`, `price`, `quantity`, `productid`, `userid`, `color`) VALUES
(1, 29800000, 2, 6, 1, 'Xám'),
(2, 8990000, 1, 3, 1, 'Vàng'),
(3, 14900000, 1, 6, 1, 'Xanh Dương'),
(4, 19980000, 2, 2, 1, 'Trắng'),
(5, 4690000, 1, 4, 1, 'Trắng'),
(9, 9990000, 1, 2, 2, 'Trắng'),
(10, 6990000, 1, 39, 1, 'Trắng'),
(11, 3790000, 1, 102, 7, 'Tím');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL,
  `categoryname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `categoryname`) VALUES
(1, 'Điện thoại'),
(2, 'Laptop'),
(3, 'PC'),
(4, 'Phụ kiện'),
(6, 'Âm thanh'),
(7, 'Máy ảnh'),
(8, 'Tablet');

-- --------------------------------------------------------

--
-- Table structure for table `code`
--

CREATE TABLE `code` (
  `codeid` int(11) NOT NULL,
  `codetext` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `code`
--

INSERT INTO `code` (`codeid`, `codetext`, `price`, `status`) VALUES
(1, 'abcdef', 300000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentid` int(11) NOT NULL,
  `commenttext` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `rate` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentid`, `commenttext`, `date`, `rate`, `productid`, `userid`) VALUES
(1, 'san pham tot', '25/08/2023', 5, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `mesid` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`mesid`, `date`, `email`, `name`, `text`, `title`) VALUES
(1, '25-8-2023 05:58:36 PM', 'loctran7129@gmail.com', 'Trần Hữu Lộc', 'dwadadw', 'rr'),
(4, '26-8-2023 09:07:13 PM', 'loctran7129@gmail.com', 'dw', 'da4444444442', '454');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `newid` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`newid`, `date`, `filename`, `thumbnail`, `title`, `userid`) VALUES
(1, '25-8-2023 07:58:36 PM', 'iPhone-15-se-dung-hai-chuan-usb-c', 'img/iPhone-15-to-Switch-From-Light-3250-4695-1668707741.webp', 'iPhone 15 sẽ dùng hai chuẩn USB C', 2),
(2, '25-8-2023 08:00:36 PM', 'Mix-Fold-2-smartphone-gap-sieu-mong', 'img/DES09150-1660933232.jpg', 'Mix Fold 2 – smartphone gập siêu mỏng của Xiaomi về Việt Nam', 2),
(3, '25-8-2023 09:00:36 PM', 'Nang-cap-tren-samsung-galaxy-s23-ultra', 'img/anh_4.jpg', 'Nâng cấp đáng giá trên Samsung Galaxy S23 Ultra', 2),
(4, '26-8-2023 04:58:36 PM', 'oppo-reno6-pro-5g-vs-xiaomi-mi-11x', 'img/Can-canh-OPPO-Reno6-Pro-5G.webp', 'OPPO Reno6 Pro 5G đọ sức cùng Xiaomi Mi 11X: Ai mới “trùm” phân khúc tầm trung?', 2),
(5, '27-8-2023 05:00:36 PM', 'Xiaomi-Mi-Mix-4-Mi-CC-11-va-Mi-Pad-5-Series', 'img/Xiaomi-Mi-Mix-4-Mi-CC-11-va-Mi-Pad-5-Series.webp', 'Xiaomi Mi Mix 4, Mi CC 11 và Mi Pad 5 Series đạt giấy chứng nhận 3C', 2),
(6, '28-8-2023 04:30:36 PM', 'Samsung-Galaxy-Buds-Pro-LANEIGE-Neo-Cushion-Edition-02', 'img/Samsung-Galaxy-Buds-Pro-LANEIGE-Neo-Cushion-Edition-02.webp', 'Samsung hợp tác cùng LANEIGE ra mắt Galaxy Buds Pro phiên bản giới hạn, giá 4.9 triệu đồng', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `address`, `code`, `date`, `discount`, `email`, `fullname`, `phonenumber`, `province`, `status`, `total`, `userid`) VALUES
(1, 'cho lach, ben tre', '26-8-2023 01:32:07 PM*admin01@gmail.com', '26-8-2023 01:32:07 PM', ' Không có', 'tranhuuloc@gmail.com', 'huu loc', '0777099046', 'Bến Tre', 1, 39790000, 2),
(2, 'cho lach, ben tre', '26-8-2023 01:43:30 PM*admin01@gmail.com', '26-8-2023 01:43:30 PM', ' Không có', 'tranhuuloc@gmail.com', 'huu loc', '0398761257', 'Bến Tre', 1, 4690000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `orderdetailid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`orderdetailid`, `quantity`, `orderid`, `productid`, `color`) VALUES
(1, 1, 1, 2, NULL),
(2, 2, 1, 6, NULL),
(3, 1, 2, 4, 'Trắng');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productid` int(11) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `imagelink` varchar(255) DEFAULT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `colors` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `supples` varchar(255) DEFAULT NULL,
  `brandid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `description`, `imagelink`, `productname`, `colors`, `price`, `state`, `supples`, `brandid`, `categoryid`, `status`) VALUES
(1, 'Bàn phím laptop được thiết kế khoa học với cấu trúc liền khối cùng hành trình phím ngắn. Nhờ vậy bạn có thể bấm phím thoải mái, dễ dàng không bị dính phím. đồng thời tiếng động gây ra từ bàn phím khá nhỏ không làm ồn đến người dùng cũng như môi trường xung quanh.', '/uploads/laptop-asus-vivobook-r564ja-uh51t-2.jpg;/uploads/laptop-asus-vivobook-r564ja-uh51t-3.jpg;', 'Laptop ASUS VivoBook R564JA-UH31T', 'Đen,Đỏ', 21690000, 'Hàng mới chính hãng', 'Nguyên hộp, đầy đủ phụ kiện từ nhà sản xuất', 5, 2, 1),
(2, 'Samsung từng bước khẳng định thương hiệu của mình bằng việc cho ra đời những mẫu flagship ngày càng hiện đại với công nghệ tiến bộ. Điển hình là chiếc điện thoại Samsung Galaxy S21 Ultra 5G  tích hợp mọi tính năng gần như trở thành mẫu smartphone hoàn hảo nhất.', '/uploads/S21-ULTRA.jpg;/uploads/S21-ULTRA-TRANG.jpg', 'Samsung Galaxy S21 Ultra 5G Korea (Likenew)', 'Đen,Trắng', 9290000, 'Máy qua sử dụng', 'Thân máy', 1, 1, 1),
(3, 'Hoàn toàn xứng đáng với những gì được mong chờ, phiên bản cao cấp nhất iPhone Xs Max 64 GB của Apple năm nay nổi bật với chip A12 Bionic mạnh mẽ, màn hình rộng đến 6.5 inch, cùng camera kép trí tuệ nhân tạo và Face ID được nâng cấp.', '/uploads/600_600_600_XSMAX_6_1.jpg;/uploads/600_600_600_xs_max_white_800x800_3_3.jpg;/uploads/600_iphone_xs_max_64gb_likenew.jpg', 'Apple iPhone Xs Max 256GB Quốc Tế (Likenew)', 'Vàng,Bạc,Đen', 8990000, 'Máy qua sử dụng', 'Thân máy', 2, 1, 1),
(4, 'Tai nghe Bluetooth AirPods Pro MagSafe Charge Apple MLWK3 trắng được chế tác với vẻ ngoài tinh giản, gam màu trắng trẻ trung, sáng đẹp, phối hợp tuyệt vời với mọi trang phục từ đời thường đến công sở, dự tiệc của bạn. ', '/uploads/TAI-NGHE-AIRPOD.jpg', 'Apple AirPods Pro 2021 Magsafe', 'Trắng', 4690000, 'Hàng mới chính hãng', 'Fullbox', 2, 6, 1),
(5, 'Black Shark 4 là điện thoại chơi game hàng đầu của Xiaomi trong năm 2021. Những điểm mạnh của Black Shark 4 là tương đối toàn diện. Thiết kế toàn màn hình cao cấp với tốc độ làm mới 144Hz/720Hz. Phần cứng là bộ vi xử lý Snapdragon 870 mạnh mẽ. Tản nhiệt cũng được nâng cấp mạnh mẽ giảm tới 18 độ cho CPU giúp chơi game cấu hình cao không nóng máy. Hơn nữa, Black Shark 4 đã xác lập kỷ lục với pin 4500mAh, hỗ trợ sạc 120W “nhanh nhất thế giới”,… Mang lại hiệu năng vượt trội về nhiều mặt.', '/uploads/black-shark-4-quoc-te-6.jpg;/uploads/black-shark-4-3-2.jpg;/uploads/black-shark-4-quoc-te-4.jpg', 'Xiaomi Black Shark 4 (8GB/128GB) Likenew', 'Trắng,Đen', 5790000, 'Máy qua sử dụng', 'Thân máy', 3, 1, 1),
(6, 'iPad Air 4 2020 – Chip A14 mạnh mẽ cho trải nghiệm hoàn hảo\r\nApple luôn khiến cho cộng đồng công nghệ đứng ngồi không yên mỗi khi cho giới thiệu sản phẩm mới. iPad Air 4 được ra mắt tại sự kiện mà các tín đồ công nghệ nghĩ rằng Apple sẽ trình làng dòng điện thoại iPhone 12 2020, nhưng chiếc tablet này mới chính là nhân vật chính. iPad Air thế hệ 2020 mang những thay đổi về mặt thiết kế cũng như những tính năng mới được tích hợp để tối ưu hóa về hiệu năng, mang đến cho người dùng những trải nghiệm tốt hơn.', '/uploads/IPAD-AIR-4-TRẮNG.jpg;/uploads/IPAD-AIR-4-XÁM.jpg;/uploads/IPAD-AIR-4-XANH-DƯƠNG.jpg;/uploads/IPAD-AIR-4-XANH-LÁ.jpg;', 'iPad Air 10.9 2020 WiFi 64GB I Chính hãng Apple Việt Nam', 'Bạc,Xám,Xanh Dương,Xanh lá', 14900000, 'Hàng mới chính hãng', 'Thân máy', 2, 8, 1),
(31, 'Galaxy A31 là mẫu smartphone tầm trung được ra mắt đầu năm 2020 của Samsung. Thiết bị gây ấn tượng mạnh với ngoại hình thời trang, cụm 4 camera đa chức năng, vân tay dưới màn hình và viên pin khủng lên đến 5000 mAh.\r\n', '/uploads/SS-A31-BLACK-NT-STORE.webp;/uploads/SS-A31-BLUE-NT-STORE.webp;', 'Samsung Galaxy A31 (6GB|128GB) Korea Likenew', 'Đen,Xanh', 2990000, 'Máy qua sử dụng', 'Thân máy', 1, 1, 1),
(32, 'Samsung Galaxy Fold không chỉ sở hữu một màn hình có thể uốn dẻo mà còn có một màn hình riêng, để có thể sử dụng độc lập khi gập máy lại.\r\nKhi mà những chiếc smartphone gần đây đang ngày càng có thiết kế giống nhau thì sự ra đời của Samsung Galaxy Fold thực sự tạo nên làn gió mới trên thị trường.\r\nBạn sẽ có một màn hình với kích thước 7.3 inch giúp bạn có thể sử dụng rất thoải mái như một chiếc máy tính bảng.\r\n\r\n', '/uploads/SAMSUNG-FOLD-1-NT-STORE.webp;/uploads/SAMSUNG-Z-FOLD-1-NTSTORE.webp;', 'Samsung Galaxy Fold Korea (Likenew)', 'Đen,Đa sắc', 7990000, 'Máy qua sử dụng', 'Thân máy', 1, 1, 1),
(33, 'Có thể nói, Samsung Galaxy Note 10 Plus 5G  cũ là sự lựa chọn tuyệt vời cho người dùng đam mê công nghệ có nhu cầu sở hữu một chiếc điện thoại hoàn hảo về mọi mặt. Với Galaxy Note 10 Plus, Samsung đã thật sự mang đến một “chiến binh” có sức mạnh vượt trội, đáp ứng toàn diện các nhu cầu về làm việc và giải trí của người dùng.', '/uploads/NOTE-10-5G-DA-SẮC.webp;/uploads/NOTE-10-5G-DEN.webp;', 'Samsung Galaxy Note 10 Plus 5G Hàn Quốc (Like New)', 'Đen,Đa sắc', 6890000, 'Máy qua sử dụng', 'Thân máy', 1, 1, 1),
(34, 'Galaxy Note 20 5G – một siêu phẩm đến từ nhà Samsung, sở hữu thiết kế nguyên khối thời trang, hiệu năng mạnh mẽ bởi CPU Snapdragon 865+ hàng đầu cùng cụm camera hỗ trợ quay phim 8K, chắc hẳn sẽ mang lại cho bạn những trải nghiệm thú vị và tuyệt vời.', '/uploads/600_galaxy-note-20-256gb-cu-xtmobile.webp;/uploads/600_note_20_xam_xtmobile_min.webp;/uploads/600_samsung_galaxy_note_20.webp;', 'Samsung Galaxy Note 20 5G (8G|256GB) Korea Likenew', 'Đen,Hồng,Xanh bạc hà', 5990000, 'Máy qua sử dụng', 'Thân máy', 1, 1, 1),
(35, 'Sau Galaxy Note 20 thì Galaxy Note 20 Ultra là phiên bản tiếp theo cao cấp hơn thuộc dòng Note 20 Series của Samsung, với nhiều thay đổi, từ cụm camera hỗ trợ lấy nét laser AF cùng ống kính góc rộng mới, màn hình tràn viền lên đến 6.9 inch.', '/uploads/note-20-ultra-5G-3.webp;/uploads/note-20-ultra-5G-2.webp;/uploads/note-20-ultra-5G-1.webp;', 'Samsung Galaxy Note 20 Ultra 5G Korea (Like New)', 'Đen,Trắng,Vàng đồng', 8990000, 'Máy qua sử dụng', 'Thân máy', 1, 1, 1),
(36, 'Samsung Galaxy Z Fold5 là mẫu điện thoại cao cấp được ra mắt vào tháng 07/2023 với nhiều điểm đáng chú ý như thiết kế gập độc đáo, hiệu năng mạnh mẽ cùng camera quay chụp tốt, điều này giúp cho máy thu hút được nhiều sự quan tâm của đông đảo người dùng yêu công nghệ hiện nay.', '/uploads/samsung-galaxy-zfold5-xanh-256gb-1-1.jpg;/uploads/samsung-galaxy-zfold5-kem-256gb-1-1.jpg;/uploads/samsung-galaxy-zfold5-den-256gb-1.jpg;', 'Samsung Galaxy Z Fold5 5G 256GB', 'Đen,Trắng,Xanh da trời', 36990000, 'Hàng mới chính hãng', 'Thân máy', 1, 1, 1),
(37, 'Samsung tiếp tục chứng tỏ sự nỗ lực của mình trong việc cải thiện dòng sản phẩm phân khúc cấp thấp trong năm 2023 bằng việc ra mắt mẫu smartphone Samsung Galaxy A14 4G. Với thiết kế độc đáo và hiện đại, sản phẩm này đáp ứng đầy đủ tiêu chí \"ngon - bổ - rẻ\" với cấu hình ổn định và giá cả cực kỳ hợp lý.', '/uploads/samsung-galaxy-a14-4g-tim-1.jpg;/uploads/samsung-galaxy-a14-tim-1.jpg;', 'Samsung Galaxy A14 6GB ', 'Đỏ đô,Bạc', 4340000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 1, 1, 1),
(38, 'Samsung Galaxy Z Flip5 đã chính thức ra mắt vào ngày 26 tháng 7. Đây là một chiếc điện thoại thông minh có thiết kế độc đáo với màn hình gập, được trang bị bộ vi xử lý cao cấp Snapdragon 8 Gen 2 for Galaxy, RAM 8 GB, bộ nhớ trong 256 GB, camera kép 12 MP và pin 3700 mAh.\r\n', '/uploads/samsung-galaxy-zflip-5-kem-512gb-1.jpg;/uploads/samsung-galaxy-zflip5-xanh-256gb-1-1.jpg;/uploads/samsung-galaxy-zflip-5-xam-256gb-1.jpg;/uploads/samsung-galaxy-zflip-5-tim-256gb-1.jpg;', 'Samsung Galaxy Z Flip5 5G 256GB ', 'Kem,Xám,Tím,Xanh', 21990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 1, 1, 1),
(39, 'Samsung Galaxy A53 5G 128GB trình làng với một thiết kế hiện đại, hiệu năng ổn định cùng một màn hình hiển thị sắc nét, hỗ trợ tần số quét cao giúp bạn có được những phút giây giải trí cực kỳ đã mắt, hay thỏa mãn đam mê nhiếp ảnh trong bạn nhờ trang bị camera có độ phân giải cao.', '/uploads/samsung-galaxy-a53-den-1-1.jpg;/uploads/samsung-galaxy-a53-cam-1-1.jpg;/uploads/samsung-galaxy-a53-trang-1-1.jpg;/uploads/samsung-galaxy-a53-1-1.jpg;', 'Samsung Galaxy A53 5G 128GB', 'Cam,Trắng,Đen,Xanh', 6990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 1, 1, 1),
(40, 'Samsung Galaxy S23 Ultra 5G 256GB là chiếc smartphone cao cấp nhất của nhà Samsung, sở hữu cấu hình không tưởng với con chip khủng được Qualcomm tối ưu riêng cho dòng Galaxy và camera lên đến 200 MP, xứng danh là chiếc flagship Android được mong đợi nhất trong năm 2023.', '/uploads/samsung-galaxy-s23-ultra-kem-1-1.jpg;/uploads/samsung-galaxy-s23-ultra-1-2.jpg;/uploads/samsung-galaxy-s-ultra-tim-1.jpg;/uploads/samsung-galaxy-s23-ultra-xanh-1.jpg;', 'Samsung Galaxy S23 Ultra 5G 256GB', 'Xanh rêu,Tím nhạt,Kem,Đen', 23990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 1, 1, 1),
(41, 'Samsung Galaxy A23 4GB sở hữu bộ thông số kỹ thuật khá ấn tượng trong phân khúc, máy có một hiệu năng ổn định, cụm 4 camera thông minh cùng một diện mạo trẻ trung phù hợp cho mọi đối tượng người dùng.', '/uploads/samsung-galaxy-a23-4g-1.jpg;', 'Samsung Galaxy A23 4GB ', 'Cam', 4400000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 1, 1, 1),
(42, 'iPhone 14 Pro Max một siêu phẩm trong giới smartphone được nhà Táo tung ra thị trường vào tháng 09/2022. Máy trang bị con chip Apple A16 Bionic vô cùng mạnh mẽ, đi kèm theo đó là thiết kế hình màn hình mới, hứa hẹn mang lại những trải nghiệm đầy mới mẻ cho người dùng iPhone.', '/uploads/iphone-14-pro-max-vang-thumb-200x200.jpg;/uploads/iphone-14-pro-max-bac-thumb-200x200.jpg;/uploads/iphone-14-pro-max-den-thumb-200x200.jpg;/uploads/iphone-14-pro-max-tim-thumb-200x200.jpg;', 'iPhone 14 Pro Max 128GB ', 'Tím,Đen,Bạc,Vàng', 26490000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1, 1),
(43, 'iPhone 14 Pro 128GB - Mẫu smartphone đến từ nhà Apple được mong đợi nhất năm 2022, lần này nhà Táo mang đến cho chúng ta một phiên bản với kiểu thiết kế hình notch mới, cấu hình mạnh mẽ nhờ con chip Apple A16 Bionic và cụm camera có độ phân giải được nâng cấp lên đến 48 MP.', '/uploads/iphone-14-pro-den-thumb-200x200.jpg;/uploads/iphone-14-pro-tim-thumb-200x200.jpg;/uploads/iphone-14-pro-bac-thumb-200x200.jpg;/uploads/iphone-14-pro-vang-thumb-200x200.jpg;', 'iPhone 14 Pro 128GB', 'Vàng,Bạc,Tím,Đen', 24460000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1, 1),
(44, 'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.', '/uploads/iphone-xi-den-200x200.jpg;/uploads/iphone-11-trang-200x200.jpg;', 'iPhone 11 64GB', 'Trắng,Đen', 10390000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1, 1),
(45, 'iPhone 14 128GB được xem là mẫu smartphone bùng nổ của nhà táo trong năm 2022, ấn tượng với ngoại hình trẻ trung, màn hình chất lượng đi kèm với những cải tiến về hệ điều hành và thuật toán xử lý hình ảnh, giúp máy trở thành cái tên thu hút được đông đảo người dùng quan tâm tại thời điểm ra mắt.', '/uploads/iPhone-14-plus-thumb-den-200x200.jpg;/uploads/iPhone-14-thumb-trang-200x200.jpg;/uploads/iPhone-14-thumb-do-200x200.jpg;', 'iPhone 14 128GB ', 'Đỏ,Trắng,Đen', 19190000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1, 1),
(46, 'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.\r\nHiệu năng vượt trội nhờ chip Apple A15 Bionic\r\nCon chip Apple A15 Bionic siêu mạnh được sản xuất trên quy trình 5 nm giúp iPhone 13 đạt hiệu năng ấn tượng, với CPU nhanh hơn 50%, GPU nhanh hơn 30% so với các đối thủ trong cùng phân khúc.', '/uploads/iphone-13-pink-2-200x200.jpg;/uploads/iphone-13-starlight-1-200x200.jpg;/uploads/iphone-13-midnight-2-200x200.jpg;', 'iPhone 13 128GB', 'Đen,Trắng,Hồng', 16190000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1, 1),
(47, 'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB.\nHiệu năng vượt xa mọi giới hạn\nApple đã trang bị con chip mới nhất của hãng (tính đến 11/2020) cho iPhone 12 đó là A14 Bionic, được sản xuất trên tiến trình 5 nm với hiệu suất ổn định hơn so với chip A13 được trang bị trên phiên bản tiền nhiệm iPhone 11.', '/uploads/iphone-12-tim-1-200x200.jpg;/uploads/iphone-12-xanh-duong-new-2-200x200.jpg;/uploads/iphone-12-den-new-2-200x200.jpg;', ' iPhone 12 64GB', 'Đen,Xanh dương,Tím', 13990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1, 1),
(48, 'Xiaomi Redmi 12 mẫu điện thoại mới nhất được nhà Xiaomi tung ra vào tháng 06/2023 khiến cho cộng đồng đam mê công nghệ vô cùng thích thú. Máy khoác lên mình một vẻ ngoài cá tính, màn hình lớn đem đến trải nghiệm đã mắt cùng một hiệu năng ổn định với mọi tác vụ.', '/uploads/xiaomi-redmi-12-xanh-duong-thumb-200x200.jpg;/uploads/xiaomi-redmi-12-den-thumb-200x200.jpg;/uploads/xiaomi-redmi-12-bac-thumb-200x200.jpg;', ' Xiaomi Redmi 12 4GB ', 'Bạc,Đen,Xanh dương', 3790000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1, 1),
(49, 'Xiaomi Redmi 12C 64GB một thiết bị di động tầm trung được giới thiệu bởi Xiaomi, với cấu hình vượt trội so với các đối thủ trong cùng phân khúc, điều này nhờ trang bị con chip MediaTek Helio G85 mạnh mẽ giúp máy có thể xử lý tốt nhiều tác vụ. Hơn nữa, với bộ ống kính chất lượng 50 MP cho phép bạn chụp ảnh chất lượng, sắc nét và đẹp mắt.', '/uploads/xiaomi-redmi-12c-grey-thumb-200x200.jpg;/uploads/xiaomi-redmi-12c-blue-thumb-200x200.jpg;/uploads/xiaomi-redmi-12c-green-thumb-200x200.jpg;', 'Xiaomi Redmi 12C 64GB', 'Xanh lá,Xanh dương,Xám', 2590000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1, 1),
(50, 'Redmi Note 12 8GB/256GB - chiếc điện thoại tầm trung mới của hãng điện thoại thông minh Xiaomi được giới thiệu tại Việt Nam. Với vi xử lý Snapdragon 685 mạnh mẽ và camera 50 MP chất lượng cao, chiếc điện thoại này đã thu hút sự chú ý của người dùng trong phân khúc của mình.', '/uploads/xiaomi-redmi-note-12-vang-1-thumb-momo-200x200.jpg;/uploads/xiaomi-redmi-note-12-4g-mono-xanh-256gb-200x200.jpg;/uploads/xiaomi-redmi-note-12-4g-mono-den-256gb-200x200.jpg;', 'Xiaomi Redmi Note 12 (8GB/256GB)', 'Vàng,Xanh lá,Xám', 5990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1, 1),
(51, 'Xiaomi 12T 5G 256GB là smartphone đầu tiên trên thế giới trang bị con chip Dimensity 8100 Ultra nên máy thu hút được khá nhiều sự chú ý vào thời điểm ra mắt, bộ vi xử lý này không chỉ có hiệu năng mạnh mẽ mà nó còn tối ưu được giá thành cho thiết bị, điều này giúp 12T trở thành chiếc điện thoại quốc dân cực kỳ đáng sắm.', '/uploads/xiaomi-12t-thumb-bac-1-200x200.jpg;/uploads/xiaomi-12t-thumb-xanh-1-200x200.jpg;/uploads/xiaomi-12t-thumb-200x200.jpg;', 'Xiaomi 12T 5G 256GB ', 'Đen,Xanh,Bạc', 11990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1, 1),
(52, 'Xiaomi Redmi A1 là mẫu điện thoại giá rẻ nhưng vẫn mang trong mình một thiết kế trẻ trung, hiệu năng tốt cùng viên pin cực trâu, đáp ứng trọn vẹn trải nghiệm cả ngày dài, phù hợp với người dùng muốn chọn mua cho mình một thiết bị có giá thành vừa phải, nhằm đáp ứng nhu cầu sử dụng cơ bản hằng ngày.', '/uploads/Xiaomi-Redmi-A1-thumb-xanh-la-200x200.jpg;/uploads/Xiaomi-Redmi-A1-thumb-den-200x200.jpg;/uploads/Xiaomi-Redmi-A1-thumb-xanh-duong-200x200.jpg;', 'Xiaomi Redmi A1', 'Đen,Xanh lá,Xanh dương', 1590000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1, 1),
(53, 'Xiaomi 13 5G - chiếc điện thoại đáng chú ý trên thị trường với nhiều điểm nâng cấp ấn tượng trong phân khúc giá. Máy mang đến trải nghiệm chụp ảnh thú vị với nhiều bộ lọc màu cũng như chế độ độc đáo mà Leica cung cấp, cùng với đó là chip Snapdragon 8 Gen 2 sở hữu hiệu năng cực kỳ mạnh mẽ giúp mọi trải nghiệm đều trở nên mượt mà.', '/uploads/xiaomi-13-thumb-den-200x200.jpg;/uploads/xiaomi-13-thumb-xanh-200x200.jpg;', 'Xiaomi 13 5G', 'Đen,Xanh lá', 19990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1, 1),
(54, 'Điện thoại Xiaomi đang dần khẳng định chỗ đứng của mình trong phân khúc flagship bằng việc ra mắt Xiaomi 12 với bộ thông số ấn tượng, máy có một thiết kế gọn gàng, hiệu năng mạnh mẽ, màn hình hiển thị chi tiết cùng khả năng chụp ảnh sắc nét nhờ trang bị ống kính đến từ Sony.', '/uploads/Xiaomi-12-tim-thumb-mau-200x200.jpg;/uploads/Xiaomi-12-xanh-duong-thumb-mau-200x200.jpg;/uploads/Xiaomi-12-xam-thumb-mau-200x200.jpg;', 'Xiaomi 12 5G ', 'Xám,Xanh dương,Tím', 11990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1, 1),
(55, 'Xiaomi Redmi Note 12 Pro 5G mẫu điện thoại tầm trung được kỳ vọng sẽ trở thành sản phẩm quốc dân trong năm 2023, nhờ sở hữu khá nhiều sự nâng cấp với camera 50 MP, chip MediaTek mạnh mẽ cùng ngôn ngữ thiết kế mới vô cùng tối giản, hiện đại.', '/uploads/xiaomi-redmi-note-12-pro-den-thumb-200x200.jpg;/uploads/xiaomi-redmi-note-12-pro-trang-thumb-200x200.jpg;/uploads/xiaomi-redmi-note-12-pro-5g-momo-1-200x200.jpg;', 'Xiaomi Redmi Note 12 Pro 5G', 'Đen,Trắng,Xanh dương', 8790000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1, 1),
(56, 'Xiaomi Redmi Note 12 Pro 4G tiếp tục sẽ là mẫu điện thoại tầm trung được nhà Xiaomi giới thiệu đến thị trường Việt Nam trong năm 2023, máy nổi bật với camera 108 MP chất lượng, thiết kế viền mỏng cùng hiệu năng đột phá nhờ trang bị chip Snapdragon 732G.', '/uploads/xiaomi-redmi-12-pro-4g-thumb-200x200.jpg;/uploads/xiaomi-redmi-note-12-pro-4g-den-thumb-200x200.jpg;', 'Xiaomi Redmi Note 12 Pro 128GB', 'Xám,Xanh dương', 6590000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1, 1),
(57, 'Xiaomi Redmi Note 12S sẽ là chiếc điện thoại tiếp theo được nhà Xiaomi tung ra thị trường Việt Nam trong thời gian tới (05/2023). Điện thoại sở hữu một lối thiết kế hiện đại, màn hình hiển thị chi tiết đi cùng với đó là một hiệu năng mượt mà xử lý tốt các tác vụ.', '/uploads/xiaomi-redmi-12s-xanh-duong-thumb-200x200.jpg;/uploads/xiaomi-redmi-note12s-den-thumb-200x200.jpg;', 'Xiaomi Redmi Note 12S ', 'Đen,Xanh dương', 5890000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1, 1),
(58, 'Đến hẹn lại lên, hãng điện thoại OPPO tiếp tục cho ra mắt sản phẩm OPPO Reno10 5G 128GB tại thị trường Việt Nam trong năm 2023. Điện thoại mang trong mình lối thiết kế đẹp mắt, hiệu năng mượt mà xử lý tốt mọi tác vụ, đi cùng bộ ba camera mang đến những bức ảnh đẹp mắt.', '/uploads/oppo-reno10-blue-thumbnew-200x200.jpg;', 'OPPO Reno10 5G 128GB', 'Xanh dương', 9990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(59, 'OPPO Find N2 Flip 5G - chiếc điện thoại gập đầu tiên của OPPO đã được giới thiệu chính thức tại Việt Nam vào tháng 03/2023. Sở hữu cấu hình mạnh mẽ cùng thiết kế siêu nhỏ gọn giúp tối ưu kích thước, chiếc điện thoại sẽ cùng bạn nổi bật trong mọi không gian với vẻ ngoài đầy cá tính.', '/uploads/oppo-find-n2-flip-purple-thumb-1-600x600-1-200x200.jpg;/uploads/oppo-n2-flip-den-thumb-200x200.jpg;', 'OPPO Find N2 Flip 5G ', 'Đen,Tím', 19990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(60, 'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.', '/uploads/oppo-reno8t-den1-thumb-200x200.jpg;/uploads/oppo-reno8t-vang1-thumb-200x200.jpg;', 'OPPO Reno8 T 5G 256GB', 'Đen,Vàng đồng', 10690000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(61, 'OPPO Reno8 Pro 5G là chiếc điện thoại cao cấp được nhà OPPO ra mắt vào thời điểm 09/2022, máy hướng đến sự hoàn thiện cao cấp ở phần thiết kế cùng khả năng quay chụp chuyên nghiệp nhờ trang bị vi xử lý hình ảnh MariSilicon X chuyên dụng.', '/uploads/oppo-reno8-pro-thumb-den-200x200.jpg;/uploads/oppo-reno8-pro-thumb-xanh-1-200x200.jpg;', 'OPPO Reno8 Pro 5G', 'Đen,Xanh ngọc', 17490000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(62, 'OPPO Find X5 Pro 5G có lẽ là cái tên sáng giá được xướng tên trong danh sách điện thoại có thiết kế ấn tượng trong năm 2022. Máy được hãng cho ra mắt với một diện mạo độc lạ chưa từng có, cùng với đó là những nâng cấp về chất lượng ở camera nhờ sự hợp tác với nhà sản xuất máy ảnh Hasselblad. ', '/uploads/oppo-find-x5-pro-den-thumb-200x200.jpg;/uploads/oppo-find-x5-pro-trang-thumb-1-200x200.jpg;', 'OPPO Find X5 Pro 5G', 'Đen,Trắng', 19990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(63, 'Nối tiếp thành công từ thế hệ tiền nhiệm, OPPO Reno10 Pro+ 5G tiếp tục là sản phẩm có kiểu dáng đẹp mắt, cấu hình mạnh mẽ và máy ảnh hàng đầu, đáp ứng đầy đủ nhu cầu của người dùng về một chiếc điện thoại thiên về giải trí, chụp ảnh và làm việc.', '/uploads/oppo-reno-10-pro-plus-thumb-xam-200x200.jpg;/uploads/oppo-reno-10-pro-plus-tim-thumb-200x200.jpg;', 'OPPO Reno10 Pro+ 5G', 'Xám,Tím', 19990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(64, 'OPPO Reno6 Pro 5G - một sản phẩm thuộc dòng Reno6 của OPPO, thỏa mãn những gì người tiêu dùng đã trông đợi với cấu hình khủng cùng hệ thống camera cực ấn tượng và ngoại hình bắt mắt, thật hào hứng mong chờ để được trải nghiệm.', '/uploads/oppo-reno6-pro-grey-200x200.jpg;', 'OPPO Reno6 Pro 5G', 'Xám', 13990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(65, 'Những mẫu điện thoại OPPO cho ra mắt thời gian gần đây (2023) có vẻ ngoài đẹp mắt phù hợp với thị hiếu người tiêu dùng hiện nay. Trong đó OPPO A98 5G mẫu điện thoại mới của điện thoại OPPO A, với lối thiết kế hiện đại, màn hình hiển thị chi tiết thông tin cũng như một hiệu năng ổn định.', '/uploads/oppo-a98-5g-den-thumb-200x200.jpg;/uploads/oppo-a98-5g-xanh-thumb-1-200x200.jpg;', 'OPPO A98 5G', 'Xanh dương,Đen', 8990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(66, 'OPPO đã trình làng mẫu Reno7 Z 5G với thiết kế OPPO Glow độc quyền, camera mang hiệu ứng như máy DSLR chuyên nghiệp cùng viền sáng kép, máy có một cấu hình mạnh mẽ và đạt chứng nhận xếp hạng A về độ mượt.', '/uploads/oppo-reno7-z-5g-thumb-2-1-200x200.jpg;', 'OPPO Reno7 Z 5G', 'Đen', 7490000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(67, 'OPPO A96 là cái tên được nhắc đến khá nhiều trên các diễn đàn công nghệ hiện nay, nhờ sở hữu một ngoại hình hết sức bắt mắt cùng hàng loạt các thông số ấn tượng trong phân khúc giá như hiệu năng cao, camera chụp ảnh sắc nét.', '/uploads/oppo-a96-den-thumb-1-200x200.jpg;/uploads/oppo-a96-hong-thumb-1-200x200.jpg;', 'OPPO A96 ', 'Đen,Hồng', 6190000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(68, 'Nokia G22 là mẫu điện thoại giá rẻ được ra mắt chính thức vào tháng 03/2023 tại thị trường Việt Nam. Máy nổi bật với màn hình lớn, camera có độ phân giải 50 MP cùng một viên pin trâu cho thời gian sử dụng vô cùng ấn tượng.', '/uploads/nokia-g22-xam-thumb-200x200.jpg;/uploads/nokia-g22-xanh-thumb-1-2-200x200.jpg;', 'Nokia G22 ', 'Xám,Xanh dương', 3420000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 9, 1, 1),
(69, 'Nokia 8210 4G có lẽ là một lựa chọn phù hợp với những ai cần cho mình một chiếc điện thoại phổ thông phục vụ cho nhu cầu nghe gọi. Máy có giá thành rẻ và vừa có độ bền cao, giúp cho người dùng có thể tiết kiệm được kha khá số tiền bỏ ra ban đầu cũng như không cần quá lo lắng đến vấn đề hỏng hóc trong lúc sử dụng.', '/uploads/Nokia 8210-do-thumb-200x200.jpg;/uploads/Nokia 8210-trang-thumb-200x200.jpg;/uploads/Nokia 8210-xanh-thumb-200x200.jpg;', 'Nokia 8210 4G', 'Đỏ,Trắng,Xanh', 1590000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 9, 1, 0),
(70, '​Nokia 105 4G - Chiếc điện thoại phổ thông nổi bật với thiết kế sang trọng, khả năng nghe gọi bền bỉ trong thời gian dài, hỗ trợ công nghệ 4G cùng nhiều tiện ích giải trí hấp dẫn khác đến từ nhà Nokia.', '/uploads/nokia-105-4g-black-200x200.jpg;/uploads/nokia-105-4g-blue-200x200.jpg;/uploads/nokia-105-4g-red-200x200.jpg;', 'Nokia 105 4G ', 'Xanh ngọc,Đỏ,Đen', 650000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 9, 1, 1),
(71, 'OPPO A78 một sản phẩm được nhà OPPO cho ra mắt với thiết kế trẻ trung, thiết bị này được đánh giá có hiệu năng ổn định, màn hình sắc nét và viên pin có dung lượng lớn, phù hợp cho người dùng sử dụng lâu dài.', '/uploads/oppo-a78-den-thumb-1-2-200x200.jpg;/uploads/oppo-a78-xanh-thumb-1-200x200.jpg;', 'OPPO A78', 'Xanh,Đen', 6990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 4, 1, 1),
(72, 'Với bộ vi xử lý Intel Core i5 dòng H mạnh mẽ và card đồ họa rời NVIDIA GeForce RTX 2050 4 GB, laptop Asus TUF Gaming F15 FX506HF là một trong những lựa chọn tuyệt vời cho các game thủ và những người dùng làm việc đa tác vụ hoặc liên quan đến đồ họa, kỹ thuật.', '/uploads/asus-tuf-gaming-f15-fx506hf-i5-hn014w-1.jpg;/uploads/asus-tuf-gaming-f15-fx506hf-i5-hn014w-2.jpg;/uploads/asus-tuf-gaming-f15-fx506hf-i5-hn014w-3.jpg;', 'Asus TUF Gaming F15 FX506HF i5 11400H (HN014W)', 'Đen', 16990000, 'Hàng mới chính hãng', 'Sách hướng dẫn, Thùng máy, Sạc Laptop Asus ( 150W ', 5, 2, 1),
(73, 'Laptop Asus Vivobook X515EA i3 1115G4 (EJ3948W) là một trong những mẫu laptop học tập - văn phòng đáng để bạn cân nhắc chọn mua nhờ sở hữu lối thiết kế thanh lịch, hiệu năng ổn định và bộ nhớ lưu trữ đủ dùng.', '/uploads/asus-vivobook-x515ea-i3-ej3948w-1.jpg;/uploads/asus-vivobook-x515ea-i3-ej3948w-2.jpg;/uploads/asus-vivobook-x515ea-i3-ej3948w-3.jpg;', 'Asus Vivobook X515EA i3 1115G4 (EJ3948W)', 'Bạc', 9790000, 'Hàng mới chính hãng', 'Thùng máy, Sạc Laptop Asus ( 45W ), Sách hướng dẫn', 5, 2, 1),
(74, 'Với hiệu năng vượt trội, màn hình OLED sắc nét và thiết kế thời thượng, laptop Asus Vivobook 15 OLED A1505VA i5 13500H (L1052W) là một trong những lựa chọn hàng đầu cho những ai đang tìm kiếm một chiếc laptop học tập - văn phòng chất lượng cao, có thể đáp ứng hoàn hảo nhu cầu công việc, học tập cũng như giải trí thường ngày.', '/uploads/asus-vivobook-15-oled-a1505va-i5-l1052w-glr-abc-def-1.jpg;/uploads/asus-vivobook-15-oled-a1505va-i5-l1052w-glr-abc-def-2.jpg;/uploads/asus-vivobook-15-oled-a1505va-i5-l1052w-glr-abc-def-3.jpg;', 'Asus Vivobook 15 OLED A1505VA i5 13500H (L1052W)', 'Đen', 16990000, 'Hàng mới chính hãng', 'Sách hướng dẫn, Thùng máy, Sạc Laptop Asus ( 65W )', 5, 2, 1),
(76, 'Laptop Asus Gaming ROG Strix G15 G513IH R7 (HN015W) là một trợ thủ đắc lực cho mọi game thủ chuyên nghiệp với phong cách thiết kế vô cùng độc đáo, ấn tượng chuẩn gaming cùng bộ cấu hình đầy mạnh mẽ.', '/uploads/asus-rog-strix-gaming-g513ih-r7-hn015w-1-1.jpg;/uploads/asus-rog-strix-gaming-g513ih-r7-hn015w-2-1.jpg;/uploads/asus-rog-strix-gaming-g513ih-r7-hn015w-3-1.jpg;', 'Asus Gaming ROG Strix G15 G513IH R7 4800H (HN015W)', 'Đen', 17990000, 'Hàng mới chính hãng', 'Dây nguồn, Sách hướng dẫn, Thùng máy, Sạc Laptop Asus', 5, 2, 1),
(77, 'Một dòng laptop gaming được cải tiến hoàn toàn mới đến từ nhà Acer, Aspire 7 Gaming 2023 mang ngoại hình tối giản, đẹp mắt cùng những thông số cấu hình mạnh mẽ, vừa đáp ứng được việc chiến game, vừa xử lý hiệu quả mọi tác vụ thường ngày. Laptop Acer Aspire 7 Gaming A715 76G 5132 i5 12450H (NH.QMESV.002) chắc chắn sẽ là sự lựa chọn hoàn hảo dành cho bạn.', '/uploads/acer-aspire-7-gaming-a715-76g-5132-i5-nhqmesv002-glr-1.jpg;/uploads/acer-aspire-7-gaming-a715-76g-5132-i5-nhqmesv002-glr-2.jpg;/uploads/acer-aspire-7-gaming-a715-76g-5132-i5-nhqmesv002-glr-3.jpg;', 'Acer Aspire 7 Gaming A715 76G 5132 i5 12450H', 'Đen', 15990000, 'Hàng mới chính hãng', 'Sách hướng dẫn, Thùng máy, Sạc Laptop Acer ( 135W )', 10, 2, 1),
(78, 'Nếu đang tìm kiếm một chiếc laptop học tập - văn phòng sở hữu thiết kế thanh lịch, hiện đại cùng thông số cấu hình đủ mạnh để vận hành mượt mà các tác vụ công việc thì laptop Acer Aspire 3 A315 58 54XF i5 (NX.AM0SV.007) là sự lựa chọn lý tưởng dành cho bạn.', '/uploads/acer-aspire-3-a315-58-54xf-i5-nxam0sv007-03.jpg;/uploads/acer-aspire-3-a315-58-54xf-i5-nxam0sv007-ab-1.jpg;/uploads/acer-aspire-3-a315-58-54xf-i5-nxam0sv007-ab-2.jpg;', 'Acer Aspire 3 A315 58 54XF i5 1135G7 (NX.AM0SV.007)', 'Vàng', 12990000, 'Hàng mới chính hãng', 'Sách hướng dẫn, Thùng máy, Sạc Laptop Acer ', 10, 2, 1),
(79, 'Laptop Acer Gaming Nitro 5 AN515 57 53F9 i5 11400H (NH.QENSV.008) sở hữu diện mạo hầm hố đậm chất gaming kết hợp cũng card đồ họa RTX 30 series mang hiệu năng mạnh mẽ. Chiếc laptop gaming này sẽ là người bạn đồng hành tuyệt vời giúp bạn chinh phục mọi chiến trường ảo.', '/uploads/acer-gaming-nitro-5-an515-57-53f9-i5-nhqensv008-glr-1.jpg;/uploads/acer-gaming-nitro-5-an515-57-53f9-i5-nhqensv008-glr-2.jpg;/uploads/acer-gaming-nitro-5-an515-57-53f9-i5-nhqensv008-glr-3.jpg;', 'Acer Gaming Nitro 5 AN515 57 53F9 i5 11400H', 'Đen', 19990000, 'Hàng mới chính hãng', 'Sách hướng dẫn, Thùng máy, Sạc Laptop Acer', 10, 2, 1),
(80, 'Laptop Dell Vostro 15 3520 i5 1235U (5M2TT2) mới nhất đến từ nhà Dell sẽ khiến bạn thực sự ấn tượng với kiểu dáng hiện đại, sở hữu những thông số kỹ thuật mạnh mẽ có thể chạy mượt những tác vụ học tập, văn phòng.', '/uploads/dell-vostro-15-3520-i5-5m2tt2-glr-1.jpg;/uploads/dell-vostro-15-3520-i5-5m2tt2-glr-2.jpg;/uploads/dell-vostro-15-3520-i5-5m2tt2-glr-3-1.jpg;', 'Dell Vostro 15 3520 i5 1235U (5M2TT2)', 'Xám', 16790000, 'Hàng mới chính hãng', 'Thùng máy, Sạc Laptop Dell, Sách hướng dẫn', 15, 2, 1),
(83, 'Không những mang đến cho người dùng hiệu năng ấn tượng nhờ con chip Intel thế hệ 11 tân tiến cùng card rời RTX 30 series, laptop Dell Gaming G15 5511 i5 11400H (70266676) còn sở hữu thiết kế thời thượng, lôi cuốn, hứa hẹn sẽ là người cộng sự lý tưởng cùng bạn chinh phục mọi chiến trường.', '/uploads/dell-gaming-g15-5511-i5-70266676-1-1.jpg;/uploads/dell-gaming-g15-5511-i5-70266676-2-2.jpg;/uploads/dell-gaming-g15-5511-i5-70266676-3-1.jpg;', 'Dell Gaming G15 5511 i5 11400H (70266676)', 'Đen', 19990000, 'Hàng mới chính hãng', ' Dây nguồn, Sách hướng dẫn, Thùng máy, Sạc Laptop Dell', 15, 2, 1),
(84, 'Nếu bạn đang tìm kiếm một chiếc laptop học tập - văn phòng có thể đáp ứng tất tần tật mọi nhu cầu sử dụng hàng ngày từ học tập, làm việc văn phòng đến thiết kế đồ họa cơ bản, còn chần chừ gì nữa mà không tham khảo ngay laptop HP 15s fq2716TU i3 (7C0X3PA).', '/uploads/hp-15s-fq2716tu-i3-7c0x3pa-glr-1.jpg;/uploads/hp-15s-fq2716tu-i3-7c0x3pa-glr-2.jpg;/uploads/hp-15s-fq2716tu-i3-7c0x3pa-glr-3.jpg;', 'HP 15s fq2716TU i3 1115G4 (7C0X3PA)', 'Bạc', 10290000, 'Hàng mới chính hãng', ' Sách hướng dẫn, Thùng máy, Sạc Laptop HP ', 16, 2, 1),
(85, 'Laptop HP VICTUS 15 fa0155TX i5 12450H (81P00PA) hứa hẹn mang đến trải nghiệm làm việc và giải trí tuyệt vời nhờ bộ vi xử lý Intel thế hệ 12 mạnh mẽ, card đồ họa NVIDIA RTX 30-series và màn hình 144 Hz siêu mượt mà.', '/uploads/hp-victus-15-fa0155tx-i5-81p00pa-glr-1-1.jpg;/uploads/hp-victus-15-fa0155tx-i5-81p00pa-glr-2-1.jpg;/uploads/hp-victus-15-fa0155tx-i5-81p00pa-glr-3-1.jpg;', 'HP Gaming VICTUS 15 fa0155TX i5 12450H (81P00PA)', 'Đen', 20990000, 'Hàng mới chính hãng', 'Thùng máy, Sạc Laptop HP ( 200W ), Sách hướng dẫn', 16, 2, 1),
(86, 'Với sức mạnh hiệu năng vượt trội đến từ con chip Intel Gen 13 tân tiến, vẻ ngoài đơn giản mà hiện đại cùng lối thiết kế độc đáo, laptop HP Pavilion X360 14 ek1049TU i5 1335U (80R27PA) sẽ là sự lựa chọn hoàn hảo đáp ứng tốt các tác vụ học tập, làm việc cũng như xem phim, chơi game giải trí.', '/uploads/hp-pavilion-x360-14-ek1049tu-i5-80r27pa-glr-abc-1.jpg;/uploads/hp-pavilion-x360-14-ek1049tu-i5-80r27pa-glr-abc-2.jpg;/uploads/hp-pavilion-x360-14-ek1049tu-i5-80r27pa-glr-abc-3.jpg;', 'HP Pavilion X360 14 ek1049TU i5 1335U (80R27PA)', 'Vàng', 21990000, 'Hàng mới chính hãng', 'Thùng máy, Sạc Laptop HP ( 65W ), Bút cảm ứng, Sách hướng dẫn', 16, 2, 1),
(87, 'Với thiết kế hiện đại cùng nhiều tính năng hữu ích, PC Asus S500SD i3 12100 (312100037W) là một trong những sản phẩm máy tính để bàn Asus mà bạn nên cân nhắc thêm vào giỏ hàng. Thiết bị hứa hẹn sẽ mang đến cho bạn những trải nghiệm tuyệt vời trong công việc và giải trí.', '/uploads/asus-s500sd-i3-312100037w-1.jpg;/uploads/asus-s500sd-i3-312100037w-2.jpg;/uploads/asus-s500sd-i3-312100037w-3.jpg;/uploads/asus-s500sd-i3-312100037w-5.jpg;', 'Asus S500SD i3 12100 (312100037W)', 'Đen', 10090000, 'Hàng mới chính hãng', ' Dây nguồn, Bàn phím ( Có dây ), Chuột ( Có dây ), Sách hướng dẫn', 5, 3, 1),
(88, 'PC Asus S501MD i5 12400 (512400079W) với kiểu dáng hiện đại đi kèm những tính năng và thông số kỹ thuật ấn tượng, hứa hẹn sẽ đáp ứng được mọi nhu cầu sử dụng của người dùng.', '/uploads/asus-s501md-i5-512400079w-1.jpg;/uploads/asus-s501md-i5-512400079w-2.jpg;/uploads/asus-s501md-i5-512400079w-3.jpg;/uploads/asus-s501md-i5-512400079w-5.jpg;', 'Asus S501MD i5 12400 (512400059W)', 'Đen', 12490000, 'Hàng mới chính hãng', 'Chuột ( Có dây ), Bàn phím ( Có dây ), Dây nguồn, Sách hướng dẫn', 5, 3, 1),
(89, 'PC MSI Creator P50 11SI i5 11400 (058XVN) sở hữu thân hình nhỏ gọn tinh tế, được thiết kế dành cho những nhà sáng tạo nội dung có thể làm việc đa tác vụ chuyên nghiệp, hỗ trợ mình biến hóa những ý tưởng trở thành hiện thực.', '/uploads/msi-creator-p50-11si-i5-058xvn-2-1.jpg;/uploads/msi-creator-p50-11si-i5-058xvn-3-1.jpg;/uploads/msi-creator-p50-11si-i5-058xvn-4-1.jpg;/uploads/msi-creator-p50-11si-i5-058xvn-5-1.jpg;', 'MSI Creator P50 11SI i5 11400 (058XVN)', 'Trắng', 24990000, 'Hàng mới chính hãng', 'Dây nguồn, Sách hướng dẫn', 17, 3, 1),
(90, 'Mac Mini 2020 M1(MGNT3SA/A) gây ấn tượng cho người dùng với thiết kế nhỏ gọn, tiện lợi cùng sức mạnh vượt trội đến từ con chip M1 mạnh mẽ, đáp ứng mọi nhu cầu văn phòng, đồ họa chuyên nghiệp.', '/uploads/mac-mini-2020-m1-mgnt3saa-ab-1.jpg;/uploads/mac-mini-2020-m1-mgnt3saa-ab-3.jpg;/uploads/mac-mini-2020-m1-mgnt3saa-ab-4.jpg;', 'Mac mini M1 2020 Silver (MGNT3SA/A)', 'Bạc', 13990000, 'Hàng mới chính hãng', 'Dây nguồn', 2, 3, 1),
(91, 'Laptop MSI Gaming GF63 Thin 11UC i7 11800H (1228VN) được trang bị bộ vi xử lý Intel Core i7 dòng H hiệu năng cao và card đồ họa NVIDIA mạnh mẽ, đáp ứng mọi nhu cầu của game thủ và người dùng làm trong ngành sáng tạo nội dung.', '/uploads/msi-gaming-gf63-thin-11uc-i7-1228vn-1.jpg;/uploads/msi-gaming-gf63-thin-11uc-i7-1228vn-2.jpg;/uploads/msi-gaming-gf63-thin-11uc-i7-1228vn-3.jpg;', 'MSI Gaming GF63 Thin 11UC i7 11800H (1228VN)', 'Đen', 18590000, 'Hàng mới chính hãng', ' Thùng máy, Sạc Laptop MSI ( 120W ), Sách hướng dẫn ', 17, 2, 1),
(92, 'Laptop MSI Modern 15 B12MO i5 1235U (625VN) mang đam mê của bạn bắt nhịp với lối sống năng động hiện đại. Dù là bạn đang bận rộn trong văn phòng hay làm việc trên giảng đường, vi xử lý Intel Core Alder lake thế hệ mới cũng sẽ đáp ứng mọi nhu cầu của bạn.', '/uploads/msi-modern-15-b12mo-i5-625vn-glr-1.jpg;/uploads/msi-modern-15-b12mo-i5-625vn-glr-2.jpg;/uploads/msi-modern-15-b12mo-i5-625vn-glr-3.jpg;', 'MSI Modern 15 B12MO i5 1235U (625VN)', 'Đen', 11990000, 'Hàng mới chính hãng', ' Thùng máy, Sạc Laptop MSI ( 65W ), Sách hướng dẫn', 17, 2, 1),
(93, 'Tai nghe True Wireless Samsung Galaxy Buds Pro là dòng sản phẩm tai nghe không dây thế hệ mới nhất từ Samsung. Với phiên bản lần này được lột xác hoàn toàn về thiết kế cũng như chất âm xứng đáng là lựa chọn hàng đầu cho người dùng đang mong muốn tìm cho mình một chiếc tai nghe không dây cao cấp để đồng hành cùng mình trong công việc và giải trí.', '/uploads/buds-pro_1.png;/uploads/samsung-galaxy-buds-pro-4_1.png;/uploads/samsung-galaxy-buds-pro-6_1.png;', 'Tai nghe Bluetooth Samsung Galaxy Buds Pro', 'Đen,Tím', 4990000, 'Hàng mới chính hãng', 'Fullbox', 1, 6, 1),
(94, 'Nếu bạn đang băn khoăn và chưa biết nên lựa chọn dòng thiết bị âm thanh nào cho dàn tivi của mình thì loa Samsung HW-C400 sẽ là lựa chọn hoàn hảo mà bạn có thể tham khảo thêm. Mẫu loa Samsung này thu hút với thiết kế độc đáo cùng chất lượng âm thanh sâu lắng, mê hoặc người dùng trong từng giai điệu. Dưới này là một vài ưu điểm nổi trội của loa thanh HW-C400 mà bạn có thể xem xét thêm nhé!', '/uploads/vn-essential-b-series-soundbar-h_2_.png;/uploads/vn-essential-b-series-soundbar-h_1_.png;/uploads/vn-essential-b-series-soundbar-h.png;', 'Loa thanh Samsung HW-C400', 'Đen', 1490000, 'Hàng mới chính hãng', 'Loa, Remote, Sách hướng dẫn', 1, 6, 1),
(95, 'Thưởng thức âm thanh chất lượng huẩn studio. Tai nghe Samsung Type-C có khả năng phân tách tín hiệu trái và phải tốt hơn tới 10 lần so với tai nghe 3,5 mm. Cộng thêm DAC tích hợp nâng cao chất lượng âm thanh để mọi ca khúc bạn yêu trở nên sống động bất ngờ.', '/uploads/eo-ic100bwegru_2_2.png;/uploads/2003248594_2.png;/uploads/eo-ic100bbegru_2_2.png;/uploads/2003248588_2.png;', 'Tai nghe Samsung AKG Type C', 'Đen,Trắng', 350000, 'Hàng mới chính hãng', 'Tai nghe, Nút tai nghe cao su.', 1, 6, 1),
(97, 'Xiaomi là thương hiệu vốn nổi tiếng với nhiều người tiêu dùng không chỉ bởi những chiếc điện thoại chất lượng, cấu hình cao giá rẻ mà còn những phụ kiện pin dự phòng cũng được nhiều người tin dùng. Dung lượng 20000mAh, cùng với khả năng sạc nhanh 18W thì pin sạc dự phòng Xiaomi Redmi 20000mAh sạc nhanh 18W là một lựa chọn hợp lý và hấp dẫn.', '/uploads/pin-sac-du-phong-xiaomi-redmi-20000mah-sac-nhanh-18w_2_.webp;/uploads/8ade31fdccf8711816a5714db0a4f034-removebg-preview.webp;/uploads/e3e503071fe06b5800fc264f95fddbca-removebg-preview_1.webp;/uploads/xiao-mi-sac-nhanh.webp;', 'Pin sạc dự phòng Xiaomi Redmi 20000mAh sạc nhanh 18W', 'Đen,Trắng', 580000, 'Hàng mới chính hãng', '1 x Pin dự phòng Sách HDSD 1 x Cáp sạc', 3, 4, 1),
(98, 'Người dùng Mac hẳn không còn xa lạ với bàn phím Apple Magic Keyboard, vốn mang vẻ ngoài sang trọng cùng độ gõ phím êm tay. Nếu bạn muốn nâng cấp bàn phím nhằm phục vụ công việc hiệu quả hơn, bàn phím không dây bluetooth Apple Magic Keyboard 2 kèm phím số sẽ là phụ kiện hoàn hảo.', '/uploads/magic-keyboard-2-phim-so-12.webp;/uploads/magic-keyboard-2-phim-so-7.webp;/uploads/magic-keyboard-2-phim-so-6.webp;/uploads/magic-keyboard-2-phim-so-1.webp;', 'Bàn phím Apple Magic Keyboard 2 Kèm Phím Số | Chính hãng Apple Việt Nam', 'Xám,Trắng', 2790000, 'Hàng mới chính hãng', 'Fullbox', 2, 4, 1),
(99, 'Router WiFi 6 Asus RT-AX55 AX1800 sở hữu tốc độ không dây lên đến 574Mbps trên băng tần 2.4GHz và tốc độ 1.201Mbps trên băng tần 5GHz. Việc chia làm hai băng tần hoạt động độc lập vô cùng có lợi cho việc trải nghiệm mượt mà, ổn định ngay khi nhiều người cùng kết nối vào chung một wifi.', '/uploads/router-wifi-6-asus-rt-ax55-ax1800-8.webp;/uploads/router-wifi-6-asus-rt-ax55-ax1800-2_1.webp;/uploads/router-wifi-6-asus-rt-ax55-ax1800-6.webp;/uploads/4.2.webp;', 'Router WiFi 6 Asus RT-AX55 AX1800', 'Đen,Trắng', 1890000, 'Hàng mới chính hãng', 'RT-AX55 RJ45 x1 Bộ sạc x1 QSG x1 Thẻ bảo hành x1', 5, 4, 1),
(100, 'Thiết kế bằng khung kim loại hiện đại, mỏng nhẹ đem lại cảm giác sang trọng và cao cấp\r\nToàn bộ thân chuột sử dụng cảm ứng hoàn toàn hỗ trợ thao tác nhỏ như cuộn trang, đa nhiệm màn hình,…\r\nSử dụng pin sạc thông qua cổng Lightning với khả năng sạc 2 tiếng có thể sử dụng được trong 1 tháng\r\nKhả năng kết nối không dây thông qua Bluetooth khoảng cách lên tới 10m mà không cần đến đầu thu USB\r\nĐộ phân giải của cảm biến là 1300 DPI, giúp thao tác rê chuột mượt mà hơn', '/uploads/chuot-apple-magic-mouse-2021-4_2_2_2.webp;/uploads/chuot-apple-magic-mouse-2021_1_1_2.webp;', 'Chuột Apple Magic Mouse 2021 MK2E3 - Cũ trầy xước', 'Trắng', 1200000, 'Máy qua sử dụng', 'Dây sạc', 2, 4, 1),
(101, 'Đồng hồ thông minh Xiaomi Redmi Watch 3 Active được làm với kiểu dáng khá giống với Apple Watch. Với dạng mặt chữ nhật cùng nhiều tính năng hiện đại mới, hứa hẹn sẽ là chọn lựa của nhiều người dùng đó nhé!', '/uploads/text_ng_n_28__27.webp;/uploads/xiaomi_1_7.png;', 'Đồng hồ thông minh Xiaomi Redmi Watch 3 Active', 'Đen,Xám', 1290000, 'Hàng mới chính hãng', 'Đầy đủ phụ kiện từ nhà sản xuất', 3, 4, 1),
(102, 'Tai nghe true Wireless của Samsung có sự phát triển khá vượt trội so với những đối thủ khác, và hãng đã phát triển và chuẩn bị cho ra mắt sản phẩm mới mang tên Samsung Galaxy Buds2 Pronày. Nếu bạn quan tâm tới thiết bị này, thì có thể tham khảo thêm thông tin chi tiết ở phía dưới đây nhé.', '/uploads/8_128.webp;/uploads/1_444.webp;/uploads/9_87.webp;', 'Tai nghe không dây Samsung Galaxy Buds2 Pro', 'Đen,Tím', 3790000, 'Hàng mới chính hãng', 'Tai nghe và hộp sạc, Cáp sạc Type-C, Đệm tai nghe, Sách hướng dẫn', 1, 6, 1),
(103, 'Máy ảnh Sony ZV-1 với nhiều tính năng quay chụp như tua chậm, tua nhanh màn lại những thước phim đậm chất điện ảnh. Cụ thể thì máy ảnh Sony giá rẻ với khả năng ghi lại những khoảnh khắc một cách chớp nhoáng và phát chậm với tốc độ giảm 40 lần so với thời gian thực.', '/uploads/may-anh-sony-zv-1_8.webp;/uploads/may-anh-sony-zv-110.webp;/uploads/may-anh-sony-zv-1_11.webp;', 'Máy ảnh kỹ thuật số Sony ZV-1', 'Đen', 17990000, 'Hàng mới chính hãng', 'Sony ZV-1, 01 Pin Sony NP-BX1/M8, Cáp Micro-USB, Wind Screen,, Wind Screen Adapter', 18, 7, 1),
(104, 'Máy ảnh Canon EOS 3000D Kit EF-S 18-55 III tích hợp Cảm biến hình ảnh CMOS APS-C 18 megapixel giúp bắt đủ ánh sáng và chi tiết, chụp hình đẹp ở mọi hoàn cảnh. Ngoài ra, máy ảnh còn đi kèm thêm bộ xử lý hình ảnh DIGIC 4+ mạnh mẽ xử lý để cho ra những bức ảnh có màu sắc chuẩn xác, giàu tương phản và độ đậm nét chính xác, ít nhiễu ngay cả trong điều kiện ánh sáng kém.', '/uploads/10036326-may-anh-canon-eos-3000d-kit-ef-s-18-55mm-den-4_56ru-oy.jpg;/uploads/10036326-may-anh-canon-eos-3000d-kit-ef-s-18-55mm-den-2_yh32-my.jpg;/uploads/10036326-may-anh-canon-eos-3000d-kit-ef-s-18-55mm-den-1.jpg;', 'Máy ảnh Canon EOS 3000D (Kit EF-S 18-55 III)', 'Đen', 12990000, 'Hàng mới chính hãng', 'Fullbox', 14, 7, 1),
(105, 'iPad Pro 11 inch 2021 sở hữu ngoại hình mang nhiều điểm tương tự về ngoại hình với chiếc iPad Pro trước đó. Apple iPad Pro 2021 sử dụng màn hình kích thước 11 inch và sử dụng màn hình LCD truyền thống.  Màn hình trên iPad Pro 2021 này với công nghệ màu ProMotion cùng độ phân giải cao 264 pixel mỗi inch. Màn hình này cũng được trang bị lớp phủ chống bám vân tay và chống phản xạ, nâng cao trải nghiệm cho người dùng.', '/uploads/photo-3-16218735459051861985463.jpg;/uploads/ipad-pro-11-2021_2.jpg;/uploads/ipad-pro-11-2021-2_1.jpg;', 'Apple iPad Pro 11 2021 M1 WiFi 128GB I Chính hãng Apple Việt Nam', 'Bạc,Xám', 21900000, 'Hàng mới chính hãng', 'Máy, Sách hướng dẫn, Cáp Type C – Type C, Củ sạc nhanh rời đầu Type C', 2, 8, 1),
(106, 'Mẫu máy tính bảng Samsung Galaxy Tab S8 Wifi với màn hình kích thước lớn 11 inches giúp người dùng có những trải nghiệm hình ảnh rõ nét. Bên cạnh đó, tablet được trang bị con chip Snapdragon 8 Gen 1 siêu mạnh cùng cụm camera 13MP + 6MP thỏa sức sáng tạo.', '/uploads/galaxy_tab_s8_graphite_r30-002_3.webp;/uploads/galaxy_tab_s8__silver_001_2.webp;/uploads/series_tab_s8001_3.webp;/uploads/tab_s8_2.webp;', 'Samsung Galaxy Tab S8 WIFI', 'Bạc,Xám', 11690000, 'Hàng mới chính hãng', 'Fullbox', 1, 8, 1),
(107, 'Nokia T21 là một cái tên đã không còn quá xa lạ với những tín đồ đam mê công nghệ. Được phát triển từ phiên bản đời trước là Nokia T20, T21 đã có những bước đột phá về thiết kế bên ngoài và cấu hình bên trong, mang tới cho người dùng một trải nghiệm cực kỳ thú vị và mới lạ.', '/uploads/_44rrrr3d.jpg;/uploads/_d_1_1.jpg;/uploads/nokia-t21.png;', 'Nokia T21 4GB 128GB', 'Xám', 5750000, 'Hàng mới chính hãng', 'Fullbox', 9, 8, 1),
(108, 'OPPO Pad Air tuy chỉ mới được ra mắt trong thời gian gần đây nhưng đã thu hút được rất nhiều sự quan tâm từ phía người tiêu dùng và được cho là sản phẩm tốt nhất trong phân khúc giá. Chiếc máy tính bảng OPPO gây ấn tượng bởi thiết kế mỏng nhẹ, dung lượng pin lớn, cùng hiệu năng hoạt động ổn định và nhanh chóng.', '/uploads/6_135.webp;/uploads/3_177.webp;/uploads/okcscsfd.webp;', 'OPPO Pad Air', 'Xám', 6690000, 'Hàng mới chính hãng', 'Máy tính bảng OPPO Pad Air x 1 Cáp sạc USB x 1 Bộ sạc x 1 Hướng dẫn sử dụng x 1 Thẻ bảo hành x 1', 4, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productvalue`
--

CREATE TABLE `productvalue` (
  `valueid` int(11) NOT NULL,
  `valueindex` varchar(255) DEFAULT NULL,
  `valuename` varchar(255) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productvalue`
--

INSERT INTO `productvalue` (`valueid`, `valueindex`, `valuename`, `productid`) VALUES
(5, 'Intel Core I3-1005G1 1.20 GHz up to 3.40 GHz', 'Loại CPU', 1),
(6, 'Intel UHD Graphics', 'Loại card đồ họa', 1),
(7, '4GB', 'Dung lượng RAM', 1),
(8, 'DDR4 2666 MHz', 'Loại RAM', 1),
(9, '128GB SSD', 'Ổ cứng', 1),
(10, '15.6 inches', 'Kích thước màn hình', 1),
(11, '1920 x 1080 pixels (FullHD)', 'Độ phân giải màn hình', 1),
(12, '1 USB 3.2 Gen 1 Type-C\n/1 USB 3.2 Gen 1\n/2 USB 2.0\n/1 HDMI\n/1 headphone/microphone combo jack', 'Cổng giao tiếp', 1),
(13, 'Windows 10 Home SL', 'Hệ điều hành', 1),
(14, '37Whr lithium-ion', 'Pin', 1),
(15, '6.8 inches', 'Kích thước màn hình', 2),
(16, 'Dynamic AMOLED 2X, 120Hz, HDR10+,', 'Công nghệ màn hình', 2),
(17, '108 MP, f/1.8, 24mm + 10 MP, f/4.9, 240mm + 10 MP, f/2.4, 72mm +12 MP, f/2.2, 13mm', 'Camera sau', 2),
(18, '10 MP, f/2.2, 26mm (wide), 1/3.24″, 1.22µm, Dual Pixel PDAF', 'Camera trước', 2),
(19, 'Exynos 2100', 'Chipset', 2),
(20, '12 GB', 'Dung lượng RAM', 2),
(21, '256 GB', 'Bộ nhớ trong', 2),
(22, '5000 mAh', 'Pin', 2),
(23, '1 SIM (Nano-SIM)', 'Thẻ SIM', 2),
(24, 'Android 10', 'Hệ điều hành', 2),
(25, '6.5 inches', 'Kích thước màn hình', 3),
(26, 'Super Retina OLED', 'Công nghệ màn hình', 3),
(27, '12 MP, f/1.8, 26mm (wide), 1/2.55″, 1.4µm, dual pixel PDAF, OIS\r\n12 MP, f/2.4, 52mm (telephoto), 1/3.4″, 1.0µm, PDAF, OIS, 2x optical zoom', 'Camera sau', 3),
(28, '7 MP, f/2.2, 32mm (standard)', 'Camera trước', 3),
(29, 'Apple A12 Bionic (7 nm)', 'Chipset', 3),
(30, '4GB', 'Dung lượng RAM', 3),
(31, '64GB', 'Bộ nhớ trong', 3),
(32, '3174 mAh', 'Pin', 3),
(33, '1 SIM (Nano-SIM)', 'Thẻ SIM', 3),
(34, 'iOS 12', 'Hệ điều hành', 3),
(35, 'Dùng 5 giờ - Sạc 2 giờ', 'Thời gian tai nghe:', 4),
(36, 'Dùng 24 giờ - Sạc 3 giờ', 'Thời gian hộp sạc:', 4),
(37, 'LightningSạc không dâySạc MagSafe', 'Cổng sạc:', 4),
(38, 'Adaptive EQActive Noise CancellationTransparency ModeSpatial AudioCustom High Dynamic Range AmplifierCustom high-excursion Apple driverChip Apple H1', 'Công nghệ âm thanh:', 4),
(39, 'macOS (Macbook, iMac)AndroidiOS (iPhone)iPadOS (iPad)', 'Tương thích:', 4),
(40, 'Chống nước IPX4Sạc không dâyChống ồn chủ độngCó mic thoại', 'Tiện ích:', 4),
(41, 'Bluetooth 5.0', 'Hỗ trợ kết nối:', 4),
(42, 'Cảm ứng lực', 'Điều khiển bằng:', 4),
(43, '6.67 inches', 'Kích thước màn hình', 5),
(44, 'Super AMOLED 144Hz', 'Công nghệ màn hình', 5),
(45, '48 MP, f/1.8, (wide), 1/2.0″, 0.8µm, PDAF\r\n8 MP, f/2.2, 120˚ (ultrawide), 1/4.0″, 1.12µm\r\n5 MP, f/2.4, (macro), AF', 'Camera sau', 5),
(46, '20 MP, f/2.0, (wide), 0.8µm', 'Camera trước', 5),
(47, 'Snapdragon 870 5G (7 nm)', 'Chipset', 5),
(48, '8 GB', 'Dung lượng RAM	', 5),
(49, '128 GB', 'Bộ nhớ trong', 5),
(50, 'Li-Po 4500 mAh, non-removable', 'Pin', 5),
(51, '2 SIM', 'Thẻ SIM', 5),
(52, 'Android 11', 'Hệ điều hành', 5),
(53, '10.9 inches', 'Kích thước màn hình', 6),
(54, 'Liquid Retina', 'Công nghệ màn hình', 6),
(55, '12 MP góc rộng,khẩu độ f/1.8', 'Camera sau', 6),
(56, '7 MP, khẩu độ f/2.2', 'Camera trước', 6),
(57, 'Apple A14 Bionic', 'Chipset', 6),
(58, '4 GB', 'Dung lượng RAM', 6),
(59, '64 GB', 'Bộ nhớ trong', 6),
(60, 'Khoảng 7600 mAh', 'Pin', 6),
(61, 'iOS', 'Hệ điều hành', 6),
(62, '1640 x 2360 pixels', 'Độ phân giải màn hình', 6),
(63, '6.7 inches', 'Kích thước màn hình', 31),
(64, 'Super AMOLED', 'Công nghệ màn hình', 31),
(65, '48 MP, f/2.0, 26mm (wide), 1/2.0″, 0.8µm, PDAF 8 MP, f/2.2, 123˚, (ultrawide), 1/4.0″, 1.12µm 5 MP, f/2.4, (macro) 5 MP, f/2.4, (depth)', 'Camera sau', 31),
(66, '20 MP, f/2.2, (wide)', 'Camera trước', 31),
(67, 'Mediatek MT6768 Helio P65 (12nm)', 'Chipset', 31),
(68, '6 GB', 'Dung lượng RAM', 31),
(69, '128 GB', 'Bộ nhớ trong', 31),
(70, 'Li-Ion 5000 mAh', 'Pin', 31),
(71, '1 SIM (Nano-SIM)', 'Thẻ SIM', 31),
(72, 'Android 11', 'Hệ điều hành', 31),
(73, '7.3 inches, 162.6 cm2', 'Kích thước màn hình', 32),
(74, 'Foldable Dynamic AMOLED, HDR10+', 'Công nghệ màn hình', 32),
(75, '12 MP, f/1.5-2.4, 27mm (wide), 1/2.55″, 1.4µm, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6″, 1.0µm, AF, OIS, 2x optical zoom 16 MP, f/2.2, 12mm (ultrawide), 1/3.1″, 1.0µm', 'Camera sau', 32),
(76, '10 MP, f/2.2, 26mm (wide), 1/3″, 1.22µm 8 MP, f/1.9, 24mm (wide), 1.22µm, depth sensor Cover camera: 10 MP, f/2.2, 26mm (wide), 1/3″, 1.22µm', 'Camera trước', 32),
(77, 'Snapdragon 855', 'Chipset', 32),
(78, '12 GB', 'Dung lượng RAM', 32),
(79, '512 GB', 'Bộ nhớ trong', 32),
(80, '4380 mAh', 'Pin', 32),
(81, '1 SIM (Nano-SIM)', 'Thẻ SIM', 32),
(82, 'Android 10', 'Hệ điều hành', 32),
(83, '6.8 inches', 'Kích thước màn hình', 33),
(84, 'Dynamic AMOLED, HDR10+', 'Công nghệ màn hình', 33),
(85, '12 MP, f/1.5-2.4, 26mm 12 MP, f/2.4, 52mm 16 MP, f/2.2, 12mm', 'Camera sau', 33),
(86, '10 MP, f/2.2, 26mm', 'Camera trước', 33),
(87, 'Exynos 9825', 'Chipset', 33),
(88, '12 GB', 'Dung lượng RAM', 33),
(89, '256 GB', 'Bộ nhớ trong', 33),
(90, 'Li-Ion 4300 mAh', 'Pin', 33),
(91, '2 SIM (Nano-SIM)', 'Thẻ SIM', 33),
(92, 'Android 10', 'Hệ điều hành', 33),
(93, '6.7 inches', 'Kích thước màn hình', 34),
(94, 'Super AMOLED Plus', 'Công nghệ màn hình', 34),
(95, '12 MP, f/1.8, 26mm (wide), 1/1.76″, 1.8µm, Dual Pixel PDAF, OIS 64 MP, f/2.0, 27mm (telephoto), 1/1.72″, 0.8µm, PDAF, OIS, 3x hybrid zoom 12 MP, f/2.2, 120˚, 13mm (ultrawide), 1/2.55″, 1.4µm', 'Camera sau', 34),
(96, '10 MP, f/2.2, 26mm (wide), 1/3.2″, 1.22µm, Dual Pixel PDAF', 'Camera trước', 34),
(97, 'Snapdragon 865 5G+', 'Chipset', 34),
(98, '8 GB', 'Dung lượng RAM', 34),
(99, '256 GB', 'Bộ nhớ trong', 34),
(100, 'Li-Ion 4300 mAh, non-removable', 'Pin', 34),
(101, '1 SIM (Nano-SIM)', 'Thẻ SIM', 34),
(102, '6.9 inches', 'Kích thước màn hình', 35),
(103, 'Dynamic AMOLED 2X, 120Hz', 'Công nghệ màn hình', 35),
(104, '108 MP, f/1.8, 26mm (wide), 1/1.33″, 0.8µm, PDAF, Laser AF, OIS 12 MP, f/3.0, 120mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom 12 MP, f/2.2, 120˚, 13mm (ultrawide), 1/2.55″, 1.4µm', 'Camera sau', 35),
(105, '10 MP, f/2.2, 26mm (wide), 1/3.2″, 1.22µm, Dual Pixel PDAF', 'Camera trước', 35),
(106, 'Snapdragon 865 5G+', 'Chipset', 35),
(107, '12 GB', 'Dung lượng RAM', 35),
(108, '256 GB', 'Bộ nhớ trong', 35),
(109, 'Li-Ion 4500 mAh, non-removable', 'Pin', 35),
(110, '1 SIM (Nano-SIM)', 'Thẻ SIM', 35),
(111, 'Android 10', 'Hệ điều hành', 35),
(112, 'Dynamic AMOLED 2XChính 7.6\" & Phụ 6.2\"', 'Màn hình:', 36),
(113, 'Android 13', 'Hệ điều hành:', 36),
(114, 'Chính 50 MP & Phụ 12 MP, 10 MP', 'Camera sau:', 36),
(115, '10 MP & 4 MP', 'Camera trước:', 36),
(116, 'Snapdragon 8 Gen 2 for Galaxy', 'Chip:', 36),
(117, '12 GB', 'RAM:', 36),
(118, '256 GB', 'Dung lượng lưu trữ:', 36),
(119, '1 Nano SIM & 1 eSIMHỗ trợ 5G', 'SIM:', 36),
(120, 'PLS LCD6.6\"Full HD+', 'Màn hình:', 37),
(121, 'Android 13', 'Hệ điều hành:', 37),
(122, 'Chính 50 MP & Phụ 5 MP, 2 MP', 'Camera sau:', 37),
(123, '13 MP', 'Camera trước:', 37),
(124, 'Exynos 850', 'Chip:', 37),
(125, '6 GB', 'RAM:', 37),
(126, '128 GB', 'Dung lượng lưu trữ:', 37),
(127, '2 Nano SIMHỗ trợ 4G', 'SIM:', 37),
(128, '5000 mAh15 W', 'Pin, Sạc:', 37),
(129, 'Chính: Dynamic AMOLED 2X, Phụ: Super AMOLEDChính 6.7\" & Phụ 3.4\"', 'Màn hình:', 38),
(130, 'Android 13', 'Hệ điều hành:', 38),
(131, '2 camera 12 MP', 'Camera sau:', 38),
(132, '10 MP', 'Camera trước:', 38),
(133, 'Snapdragon 8 Gen 2 for Galaxy', 'Chip:', 38),
(134, '8 GB', 'RAM:', 38),
(135, '256 GB', 'Dung lượng lưu trữ:', 38),
(136, '1 Nano SIM & 1 eSIMHỗ trợ 5G', 'SIM:', 38),
(137, '3700 mAh25 W', 'Pin, Sạc:', 38),
(138, 'Super AMOLED6.5\"Full HD+', 'Màn hình:', 39),
(139, 'Android 12', 'Hệ điều hành:', 39),
(140, 'Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP', 'Camera sau:', 39),
(141, '32 MP', 'Camera trước:', 39),
(142, 'Exynos 1280', 'Chip:', 39),
(143, '8 GB', 'RAM:', 39),
(144, '128 GB', 'Dung lượng lưu trữ:', 39),
(145, '2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 5G', 'SIM:', 39),
(146, '5000 mAh25 W', 'Pin, Sạc:', 39),
(147, 'Dynamic AMOLED 2X6.8\"Quad HD+ (2K+)', 'Màn hình:', 40),
(148, 'Android 13', 'Hệ điều hành:', 40),
(149, 'Chính 200 MP & Phụ 12 MP, 10 MP, 10 MP', 'Camera sau:', 40),
(150, '12 MP', 'Camera trước:', 40),
(151, 'Snapdragon 8 Gen 2 for Galaxy', 'Chip:', 40),
(152, '8 GB', 'RAM:', 40),
(153, '256 GB', 'Dung lượng lưu trữ:', 40),
(154, '2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G', 'SIM:', 40),
(155, '5000 mAh45 W', 'Pin, Sạc:', 40),
(156, 'PLS TFT LCD6.6\"Full HD+', 'Màn hình:', 41),
(157, 'Android 12', 'Hệ điều hành:', 41),
(158, 'Chính 50 MP & Phụ 5 MP, 2 MP, 2 MP', 'Camera sau:', 41),
(159, '8 MP', 'Camera trước:', 41),
(160, 'Snapdragon 680', 'Chip:', 41),
(161, '4 GB', 'RAM:', 41),
(162, '128 GB', 'Dung lượng lưu trữ:', 41),
(163, '2 Nano SIMHỗ trợ 4G', 'SIM:', 41),
(164, '5000 mAh25 W', 'Pin, Sạc:', 41),
(165, 'OLED6.7\"Super Retina XDR', 'Màn hình:', 42),
(166, 'iOS 16', 'Hệ điều hành:', 42),
(167, 'Chính 48 MP & Phụ 12 MP, 12 MP', 'Camera sau:', 42),
(168, '12 MP', 'Camera trước:', 42),
(169, 'Apple A16 Bionic', 'Chip:', 42),
(170, '6 GB', 'RAM:', 42),
(171, '128 GB', 'Dung lượng lưu trữ:', 42),
(172, '1 Nano SIM & 1 eSIMHỗ trợ 5G', 'SIM:', 42),
(173, '4323 mAh20 W', 'Pin, Sạc:', 42),
(174, 'OLED6.1\"Super Retina XDR', 'Màn hình:', 43),
(175, 'iOS 16', 'Hệ điều hành:', 43),
(176, 'Chính 48 MP & Phụ 12 MP, 12 MP', 'Camera sau:', 43),
(177, '12 MP', 'Camera trước:', 43),
(178, 'Apple A16 Bionic', 'Chip:', 43),
(179, '6 GB', 'RAM:', 43),
(180, '128 GB', 'Dung lượng lưu trữ:', 43),
(181, '1 Nano SIM & 1 eSIMHỗ trợ 5G', 'SIM:', 43),
(182, '3200 mAh20 W', 'Pin, Sạc:', 43),
(183, 'IPS LCD6.1\"Liquid Retina', 'Màn hình:', 44),
(184, 'iOS 15', 'Hệ điều hành:', 44),
(185, '2 camera 12 MP', 'Camera sau:', 44),
(186, '12 MP', 'Camera trước:', 44),
(187, 'Apple A13 Bionic', 'Chip:', 44),
(188, '4 GB', 'RAM:', 44),
(189, '64 GB', 'Dung lượng lưu trữ:', 44),
(190, '1 Nano SIM & 1 eSIMHỗ trợ 4G', 'SIM:', 44),
(191, '3110 mAh18 W', 'Pin, Sạc:', 44),
(192, 'OLED6.1\"Super Retina XDR', 'Màn hình:', 45),
(193, 'iOS 16', 'Hệ điều hành:', 45),
(194, '2 camera 12 MP', 'Camera sau:', 45),
(195, '12 MP', 'Camera trước:', 45),
(196, 'Apple A15 Bionic', 'Chip:', 45),
(197, '6 GB', 'RAM:', 45),
(198, '128 GB', 'Dung lượng lưu trữ:', 45),
(199, '1 Nano SIM & 1 eSIMHỗ trợ 5G', 'SIM:', 45),
(200, '3279 mAh20 W', 'Pin, Sạc:', 45),
(201, 'OLED6.1\"Super Retina XDR', 'Màn hình:', 46),
(202, 'iOS 15', 'Hệ điều hành:', 46),
(203, '2 camera 12 MP', 'Camera sau:', 46),
(204, '12 MP', 'Camera trước:', 46),
(205, 'Apple A15 Bionic', 'Chip:', 46),
(206, '4 GB', 'RAM:', 46),
(207, '128 GB', 'Dung lượng lưu trữ:', 46),
(208, '1 Nano SIM & 1 eSIMHỗ trợ 5G', 'SIM:', 46),
(209, '3240 mAh20 W', 'Pin, Sạc:', 46),
(210, 'OLED6.1\"Super Retina XDR', 'Màn hình:', 47),
(211, 'iOS 15', 'Hệ điều hành:', 47),
(212, '2 camera 12 MP', 'Camera sau:', 47),
(213, '12 MP', 'Camera trước:', 47),
(214, 'Apple A14 Bionic', 'Chip:', 47),
(215, '4 GB', 'RAM:', 47),
(216, '64 GB', 'Dung lượng lưu trữ:', 47),
(217, '1 Nano SIM & 1 eSIMHỗ trợ 5G', 'SIM:', 47),
(218, '2815 mAh20 W', 'Pin, Sạc:', 47),
(219, 'IPS LCD6.79\"Full HD+', 'Màn hình:', 48),
(220, 'Android 13', 'Hệ điều hành:', 48),
(221, 'Chính 50 MP & Phụ 8 MP, 2 MP', 'Camera sau:', 48),
(222, '8 MP', 'Camera trước:', 48),
(223, 'MediaTek Helio G88', 'Chip:', 48),
(224, '4 GB', 'RAM:', 48),
(225, '128 GB', 'Dung lượng lưu trữ:', 48),
(226, '2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 4G', 'SIM:', 48),
(227, '5000 mAh18 W', 'Pin, Sạc:', 48),
(228, 'IPS LCD6.71\"HD+', 'Màn hình:', 49),
(229, 'Android 12', 'Hệ điều hành:', 49),
(230, 'Chính 50 MP & Phụ QVGA', 'Camera sau:', 49),
(231, '5 MP', 'Camera trước:', 49),
(232, 'MediaTek Helio G85', 'Chip:', 49),
(233, '4 GB', 'RAM:', 49),
(234, '64 GB', 'Dung lượng lưu trữ:', 49),
(235, '2 Nano SIMHỗ trợ 4G', 'SIM:', 49),
(236, '5000 mAh10 W', 'Pin, Sạc:', 49),
(237, 'AMOLED6.67\"Full HD+', 'Màn hình:', 50),
(238, 'Android 13', 'Hệ điều hành:', 50),
(239, 'Chính 50 MP & Phụ 8 MP, 2 MP', 'Camera sau:', 50),
(240, '13 MP', 'Camera trước:', 50),
(241, 'Snapdragon 685 8 nhân', 'Chip:', 50),
(242, '8 GB', 'RAM:', 50),
(243, '256 GB', 'Dung lượng lưu trữ:', 50),
(244, '2 Nano SIMHỗ trợ 4G', 'SIM:', 50),
(245, '5000 mAh33 W', 'Pin, Sạc:', 50),
(246, 'AMOLED6.67\"1.5K', 'Màn hình:', 51),
(247, 'Android 12', 'Hệ điều hành:', 51),
(248, 'Chính 108 MP & Phụ 8 MP, 2 MP', 'Camera sau:', 51),
(249, '20 MP', 'Camera trước:', 51),
(250, 'MediaTek Dimensity 8100 Ultra 8 nhân', 'Chip:', 51),
(251, '8 GB', 'RAM:', 51),
(252, '256 GB', 'Dung lượng lưu trữ:', 51),
(253, '2 Nano SIMHỗ trợ 5G', 'SIM:', 51),
(254, '5000 mAh120 W', 'Pin, Sạc:', 51),
(255, 'IPS LCD6.52\"HD+', 'Màn hình:', 52),
(256, 'Android 12 (Go Edition)', 'Hệ điều hành:', 52),
(257, 'Chính 8 MP & Phụ QVGA', 'Camera sau:', 52),
(258, '5 MP', 'Camera trước:', 52),
(259, 'MediaTek MT6761 (Helio A22)', 'Chip:', 52),
(260, '2 GB', 'RAM:', 52),
(261, '32 GB', 'Dung lượng lưu trữ:', 52),
(262, '2 Nano SIMHỗ trợ 4G', 'SIM:', 52),
(263, '5000 mAh10 W', 'Pin, Sạc:', 52),
(264, 'AMOLED6.36\"Full HD+', 'Màn hình:', 53),
(265, 'Android 13', 'Hệ điều hành:', 53),
(266, 'Chính 50 MP & Phụ 12 MP, 10 MP', 'Camera sau:', 53),
(267, '32 MP', 'Camera trước:', 53),
(268, 'Snapdragon 8 Gen 2 8 nhân', 'Chip:', 53),
(269, '8 GB', 'RAM:', 53),
(270, '256 GB', 'Dung lượng lưu trữ:', 53),
(271, '2 Nano SIMHỗ trợ 5G', 'SIM:', 53),
(272, '4500 mAh67 W', 'Pin, Sạc:', 53),
(273, 'AMOLED6.28\"Full HD+', 'Màn hình:', 54),
(274, 'Android 12', 'Hệ điều hành:', 54),
(275, 'Chính 50 MP & Phụ 13 MP, 5 MP', 'Camera sau:', 54),
(276, '32 MP', 'Camera trước:', 54),
(277, 'Snapdragon 8 Gen 1', 'Chip:', 54),
(278, '8 GB', 'RAM:', 54),
(279, '256 GB', 'Dung lượng lưu trữ:', 54),
(280, '2 Nano SIMHỗ trợ 5G', 'SIM:', 54),
(281, '4500 mAh67 W', 'Pin, Sạc:', 54),
(282, 'AMOLED6.67\"Full HD+', 'Màn hình:', 55),
(283, 'Android 12', 'Hệ điều hành:', 55),
(284, 'Chính 50 MP & Phụ 8 MP, 2 MP', 'Camera sau:', 55),
(285, '16 MP', 'Camera trước:', 55),
(286, 'MediaTek Dimensity 1080 8 nhân', 'Chip:', 55),
(287, '8 GB', 'RAM:', 55),
(288, '256 GB', 'Dung lượng lưu trữ:', 55),
(289, '2 Nano SIMHỗ trợ 5G', 'SIM:', 55),
(290, '5000 mAh67 W', 'Pin, Sạc:', 55),
(291, 'AMOLED6.67\"Full HD+', 'Màn hình:', 56),
(292, 'Android 11', 'Hệ điều hành:', 56),
(293, 'Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP', 'Camera sau:', 56),
(294, '16 MP', 'Camera trước:', 56),
(295, 'Snapdragon 732G', 'Chip:', 56),
(296, '8 GB', 'RAM:', 56),
(297, '128 GB', 'Dung lượng lưu trữ:', 56),
(298, '2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 4G', 'SIM:', 56),
(299, 'AMOLED6.43\"Full HD+', 'Màn hình:', 57),
(300, 'Android 13', 'Hệ điều hành:', 57),
(301, 'Chính 108 MP & Phụ 8 MP, 2 MP', 'Camera sau:', 57),
(302, '16 MP', 'Camera trước:', 57),
(303, 'MediaTek Helio G96', 'Chip:', 57),
(304, '8 GB', 'RAM:', 57),
(305, '256 GB', 'Dung lượng lưu trữ:', 57),
(306, '2 Nano SIMHỗ trợ 4G', 'SIM:', 57),
(307, '5000 mAh33 W', 'Pin, Sạc:', 57),
(308, 'AMOLED6.7\"Full HD+', 'Màn hình:', 58),
(309, 'Android 13', 'Hệ điều hành:', 58),
(310, 'Chính 64 MP & Phụ 32 MP, 8 MP', 'Camera sau:', 58),
(311, '32 MP', 'Camera trước:', 58),
(312, 'MediaTek Dimensity 7050 5G 8 nhân', 'Chip:', 58),
(313, '8 GB', 'RAM:', 58),
(314, '128 GB', 'Dung lượng lưu trữ:', 58),
(315, '2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 5G', 'SIM:', 58),
(316, '5000 mAh67 W', 'Pin, Sạc:', 58),
(317, 'AMOLEDChính 6.8\" & Phụ 3.26\"Full HD+', 'Màn hình:', 59),
(318, 'Android 13', 'Hệ điều hành:', 59),
(319, 'Chính 50 MP & Phụ 8 MP', 'Camera sau:', 59),
(320, '32 MP', 'Camera trước:', 59),
(321, 'MediaTek Dimensity 9000+ 8 nhân', 'Chip:', 59),
(322, '8 GB', 'RAM:', 59),
(323, '256 GB', 'Dung lượng lưu trữ:', 59),
(324, '2 Nano SIMHỗ trợ 5G', 'SIM:', 59),
(325, '4300 mAh44 W', 'Pin, Sạc:', 59),
(326, 'AMOLED6.7\"Full HD+', 'Màn hình:', 60),
(327, 'Android 13', 'Hệ điều hành:', 60),
(328, 'Chính 108 MP & Phụ 2 MP, 2 MP', 'Camera sau:', 60),
(329, '32 MP', 'Camera trước:', 60),
(330, 'Snapdragon 695 5G', 'Chip:', 60),
(331, '8 GB', 'RAM:', 60),
(332, '256 GB', 'Dung lượng lưu trữ:', 60),
(333, '2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 5G', 'SIM:', 60),
(334, '4800 mAh67 W', 'Pin, Sạc:', 60),
(335, 'AMOLED6.7\"Full HD+', 'Màn hình:', 61),
(336, 'Android 12', 'Hệ điều hành:', 61),
(337, 'Chính 50 MP & Phụ 8 MP, 2 MP', 'Camera sau:', 61),
(338, '32 MP', 'Camera trước:', 61),
(339, 'MediaTek Dimensity 8100 Max 8 nhân', 'Chip:', 61),
(340, '12 GB', 'RAM:', 61),
(341, '256 GB', 'Dung lượng lưu trữ:', 61),
(342, '2 Nano SIMHỗ trợ 5G', 'SIM:', 61),
(343, '4500 mAh80 W', 'Pin, Sạc:', 61),
(344, 'AMOLED6.7\"Quad HD+ (2K+)', 'Màn hình:', 62),
(345, 'Android 12', 'Hệ điều hành:', 62),
(346, 'Chính 50 MP & Phụ 50 MP, 13 MP', 'Camera sau:', 62),
(347, '32 MP', 'Camera trước:', 62),
(348, 'Snapdragon 8 Gen 1', 'Chip:', 62),
(349, '12 GB', 'RAM:', 62),
(350, '256 GB', 'Dung lượng lưu trữ:', 62),
(351, '2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G', 'SIM:', 62),
(352, '5000 mAh80 W', 'Pin, Sạc:', 62),
(353, 'AMOLED6.7\"1.5K+', 'Màn hình:', 63),
(354, 'Android 13', 'Hệ điều hành:', 63),
(355, 'Chính 50 MP & Phụ 64 MP, 8 MP', 'Camera sau:', 63),
(356, '32 MP', 'Camera trước:', 63),
(357, 'Snapdragon 8+ Gen 1', 'Chip:', 63),
(358, '12 GB', 'RAM:', 63),
(359, '256 GB', 'Dung lượng lưu trữ:', 63),
(360, '2 Nano SIMHỗ trợ 5G', 'SIM:', 63),
(361, '4700 mAh100 W', 'Pin, Sạc:', 63),
(362, 'AMOLED6.55\"Full HD+', 'Màn hình:', 64),
(363, 'Android 11', 'Hệ điều hành:', 64),
(364, 'Chính 50 MP & Phụ 16 MP, 13 MP, 2 MP', 'Camera sau:', 64),
(365, '32 MP', 'Camera trước:', 64),
(366, 'Snapdragon 870 5G', 'Chip:', 64),
(367, '12 GB', 'RAM:', 64),
(368, '256 GB', 'Dung lượng lưu trữ:', 64),
(369, '2 Nano SIMHỗ trợ 5G', 'SIM:', 64),
(370, '4500 mAh65 W', 'Pin, Sạc:', 64),
(371, 'LTPS LCD 6.72\" Full HD+', 'Màn hình:', 65),
(372, 'Android 13', 'Hệ điều hành:', 65),
(373, 'Chính 64 MP & Phụ 2 MP, 2 MP', 'Camera sau:', 65),
(374, '32 MP', 'Camera trước:', 65),
(375, 'Snapdragon 695 5G', 'Chip:', 65),
(376, '8 GB', 'RAM:', 65),
(377, '256 GB', 'Dung lượng lưu trữ:', 65),
(378, '2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 5G', 'SIM:', 65),
(379, '5000 mAh67 W', 'Pin, Sạc:', 65),
(380, 'AMOLED 6.43\" Full HD+', 'Màn hình:', 66),
(381, 'Android 11', 'Hệ điều hành:', 66),
(382, 'Chính 64 MP & Phụ 2 MP, 2 MP', 'Camera sau:', 66),
(383, '16 MP', 'Camera trước:', 66),
(384, 'Snapdragon 695 5G', 'Chip:', 66),
(385, '8 GB', 'RAM:', 66),
(386, '128 GB', 'Dung lượng lưu trữ:', 66),
(387, '2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 5G', 'SIM:', 66),
(388, '4500 mAh33 W', 'Pin, Sạc:', 66),
(389, 'IPS LCD 6.59\" Full HD+', 'Màn hình:', 67),
(390, 'Android 11', 'Hệ điều hành:', 67),
(391, 'Chính 50 MP & Phụ 2 MP', 'Camera sau:', 67),
(392, '16 MP', 'Camera trước:', 67),
(393, 'Snapdragon 680', 'Chip:', 67),
(394, '8 GB', 'RAM:', 67),
(395, '128 GB', 'Dung lượng lưu trữ:', 67),
(396, '2 Nano SIMHỗ trợ 4G', 'SIM:', 67),
(397, '5000 mAh 33 W', 'Pin, Sạc:', 67),
(398, 'LCD 6.52\" HD+', 'Màn hình:', 68),
(399, 'Android 12', 'Hệ điều hành:', 68),
(400, 'Chính 50 MP & Phụ 2 MP, 2 MP', 'Camera sau:', 68),
(401, '8 MP', 'Camera trước:', 68),
(402, '8 MP', 'Camera trước:', 68),
(403, 'Unisoc T606', 'Chip:', 68),
(404, '4 GB', 'RAM:', 68),
(405, '128 GB', 'Dung lượng lưu trữ:', 68),
(406, '2 Nano SIMHỗ trợ 4G', 'SIM:', 68),
(407, '5050 mAh20 W', 'Pin, Sạc:', 68),
(408, '2.8\"', 'Màn hình:', 69),
(409, '2 Nano SIMHỗ trợ 4G', 'SIM:', 69),
(410, '2000 số', 'Danh bạ:', 69),
(411, 'MicroSD, hỗ trợ tối đa 32 GB', 'Thẻ nhớ:', 69),
(412, '0.3 MP', 'Camera sau:', 69),
(413, 'FM không cần tai nghe', 'Radio FM:', 69),
(414, '3.5 mm', 'Jack cắm tai nghe:', 69),
(415, '1450 mAh', 'Pin:', 69),
(416, 'TFT LCD1.8\"65.536 màu', 'Màn hình:', 70),
(417, '2 Nano SIMHỗ trợ 4G VoLTE', 'SIM:', 70),
(418, '2000 số', 'Danh bạ:', 70),
(419, 'FM không cần tai nghe', 'Radio FM:', 70),
(420, '3.5 mm', 'Jack cắm tai nghe:', 70),
(421, '1020 mAh', 'Pin:', 70),
(422, 'AMOLED 6.43\" Full HD+', 'Màn hình:', 71),
(423, 'Android 13', 'Hệ điều hành:', 71),
(424, 'Chính 50 MP & Phụ 2 MP', 'Camera sau:', 71),
(425, '8 MP', 'Camera trước:', 71),
(426, 'Snapdragon 680', 'Chip:', 71),
(427, '8 GB', 'RAM:', 71),
(428, '256 GB', 'Dung lượng lưu trữ:', 71),
(429, '2 Nano SIMHỗ trợ 4G', 'SIM:', 71),
(430, '5000 mAh67 W', 'Pin, Sạc:', 71),
(431, 'i5,11400H, 2.7GHz', 'CPU:', 72),
(432, '8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz', 'RAM:', 72),
(433, 'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1 TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', 'Ổ cứng:', 72),
(434, '15.6\"Full HD (1920 x 1080) 144Hz', 'Màn hình:', 72),
(435, 'Card rờiRTX 2050 4GB', 'Card màn hình:', 72),
(436, '1 x Thunderbolt 4 (hỗ trợ DisplayPort)HDMILAN (RJ45) 3 x USB 3.2 Jack tai nghe 3.5 mm', 'Cổng kết nối:', 72),
(437, 'Có đèn bàn phím', 'Đặc biệt:', 72),
(438, 'Windows 11 Home SL', 'Hệ điều hành:', 72),
(439, 'Vỏ nhựa - nắp lưng bằng kim loại', 'Thiết kế:', 72),
(440, 'Dài 359 mm - Rộng 256 mm - Dày 22.8 ~ 24.5 mm - Nặng 2.3 kg', 'Kích thước, khối lượng:', 72),
(441, '2023', 'Thời điểm ra mắt:', 72),
(442, 'i3, 1115G4, 3GHz', 'CPU:', 73),
(443, '8 GB DDR4 2 khe (1 khe 8 GB onboard + 1 khe trống) 3200 MHz', 'RAM:', 73),
(444, '512 GB SSD NVMe PCIe', 'Ổ cứng:', 73),
(445, '15.6\" Full HD (1920 x 1080)', 'Màn hình:', 73),
(446, 'Card tích hợp Intel UHD', 'Card màn hình:', 73),
(447, 'HDMI, 2 x USB 2.0USB Type-C, 1 x USB 3.2, Jack tai nghe 3.5 mm', 'Cổng kết nối:', 73),
(448, 'Windows 11 Home SL', 'Hệ điều hành:', 73),
(449, 'Vỏ nhựa', 'Thiết kế:', 73),
(450, 'Dài 360 mm - Rộng 235 mm - Dày 19.9 mm - Nặng 1.8 kg', 'Kích thước, khối lượng:', 73),
(451, '2022', 'Thời điểm ra mắt:', 73),
(452, 'i5, 13500H, 2.6GHz', 'CPU:', 74),
(453, '8 GB, DDR4 2 khe (1 khe 8 GB onboard + 1 khe trống), 3200 MHz', 'RAM:', 74),
(454, '512 GB SSD NVMe PCIe', 'Ổ cứng:', 74),
(455, '15.6\"Full HD (1920 x 1080) OLED', 'Màn hình:', 74),
(456, 'Card tích hợp, Intel UHD', 'Card màn hình:', 74),
(457, '1 x USB Type-C 3.2 (hỗ trợ Power Delivery), HDMI1 x USB 2.0, 2 x USB 3.2, Jack tai nghe 3.5 mm', 'Cổng kết nối:', 74),
(458, 'Windows 11 Home SL', 'Hệ điều hành:', 74),
(459, 'Vỏ nhựa', 'Thiết kế:', 74),
(460, 'Dài 356.8 mm - Rộng 227.6 mm - Dày 19.9 mm - Nặng 1.7 kg', 'Kích thước, khối lượng:', 74),
(461, '2023', 'Thời điểm ra mắt:', 74),
(466, 'Ryzen 74800H 2.9GHz', 'CPU:', 76),
(467, '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', 'RAM:', 76),
(468, 'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1 TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', 'Ổ cứng:', 76),
(469, '15.6\" Full HD (1920 x 1080) 144Hz', 'Màn hình:', 76),
(470, 'Card rời, GTX 1650 4GB', 'Card màn hình:', 76),
(471, 'USB Type-C (hỗ trợ Power Delivery và DisplayPort)HDMILAN (RJ45)Jack tai nghe 3.5 mm3x Type-A USB 3.2 Gen 1', 'Cổng kết nối:', 76),
(472, 'Có đèn bàn phím', 'Đặc biệt:', 76),
(473, 'Windows 11 Home SL', 'Hệ điều hành:', 76),
(474, 'Vỏ nhựa - nắp lưng bằng kim loại', 'Thiết kế:', 76),
(475, 'Dài 354 mm - Rộng 259 mm - Dày 20.6 mm - Nặng 2.1 kg', 'Kích thước, khối lượng:', 76),
(476, '2021', 'Thời điểm ra mắt:', 76),
(477, 'i5 12450H 2GHz', 'CPU:', 77),
(478, '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', 'RAM:', 77),
(479, '512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)', 'Ổ cứng:', 77),
(480, '15.6\" Full HD (1920 x 1080) 144Hz', 'Màn hình:', 77),
(481, 'Card rời GTX 1650 4GB', 'Card màn hình:', 77),
(482, '1 x USB Type-C (hỗ trợ USB, DisplayPort, Thunderbolt 4)HDMILAN (RJ45)3 x USB 3.2 Jack tai nghe 3.5 mm', 'Cổng kết nối:', 77),
(483, 'Có đèn bàn phím', 'Đặc biệt:', 77),
(484, 'Windows 11 Home SL', 'Hệ điều hành:', 77),
(485, 'Vỏ nhựa - nắp lưng bằng kim loại', 'Thiết kế:', 77),
(486, 'Dài 362.3 mm - Rộng 237.4 mm - Dày 19.9 mm - Nặng 2.1 kg', 'Kích thước, khối lượng:', 77),
(487, '2023', 'Thời điểm ra mắt:', 77),
(488, 'i5 1135G7 2.4GHz', 'CPU:', 78),
(489, '8 GB DDR4 (Onboard 4 GB + 1 khe 4 GB)Từ 2400 MHz (Hãng công bố)', 'RAM:', 78),
(490, '512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2 TB)', 'Ổ cứng:', 78),
(491, '15.6\" Full HD (1920 x 1080)', 'Màn hình:', 78),
(492, 'Card tích hợp Intel Iris Xe', 'Card màn hình:', 78),
(493, 'HDMI LAN (RJ45)1 x USB 2.02 x USB 3.2 Jack tai nghe 3.5 mm', 'Cổng kết nối:', 78),
(494, 'Windows 11 Home SL', 'Hệ điều hành:', 78),
(495, 'Vỏ nhựa', 'Thiết kế:', 78),
(496, 'Dài 363.4 mm - Rộng 238.4 mm - Dày 19.9 mm - Nặng 1.7 kg', 'Kích thước, khối lượng:', 78),
(497, '2021', 'Thời điểm ra mắt:', 78),
(498, 'i5 11400H 2.7GHz', 'CPU:', 79),
(499, '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', 'RAM:', 79),
(500, '512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 2 TB)', 'Ổ cứng:', 79),
(501, '15.6\" Full HD (1920 x 1080) 144Hz', 'Màn hình:', 79),
(502, 'Card rời RTX 3050 4GB', 'Card màn hình:', 79),
(503, '1 x USB Type-C (hỗ trợ USB 3.2, DisplayPort)HDMILAN (RJ45)3 x USB 3.2 Jack tai nghe 3.5 mm', 'Cổng kết nối:', 79),
(504, 'Có đèn bàn phím', 'Đặc biệt:', 79),
(505, 'Windows 11 Home SL', 'Hệ điều hành:', 79),
(506, 'Vỏ nhựa', 'Thiết kế:', 79),
(507, 'Dài 363.4 mm - Rộng 255 mm - Dày 23.9 mm - Nặng 2.2 kg', 'Kích thước, khối lượng:', 79),
(508, '2021', 'Thời điểm ra mắt:', 79),
(509, 'i5 1235U 1.3GHz', 'CPU:', 80),
(510, '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', 'RAM:', 80),
(511, '512 GB SSD NVMe PCIe', 'Ổ cứng:', 80),
(512, '15.6\" Full HD (1920 x 1080) 120Hz', 'Màn hình:', 80),
(513, 'Card tích hợp Intel UHD', 'Card màn hình:', 80),
(514, 'HDMI LAN (RJ45)1 x USB 2.02 x USB 3.2 Jack tai nghe 3.5 mm', 'Cổng kết nối:', 80),
(515, 'Windows 11 Home SL + Office Home & Student vĩnh viễn', 'Hệ điều hành:', 80),
(516, 'Vỏ nhựa', 'Thiết kế:', 80),
(517, 'Dài 358.5 mm - Rộng 235.56 mm - Dày 19 mm - Nặng 1.67 kg', 'Kích thước, khối lượng:', 80),
(518, '2022', 'Thời điểm ra mắt:', 80),
(529, 'i5 11400H 2.7GHz', 'CPU:', 83),
(530, '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', 'RAM:', 83),
(531, '256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 512 GB (2230))', 'Ổ cứng:', 83),
(532, '15.6\" Full HD (1920 x 1080) 120Hz', 'Màn hình:', 83),
(533, 'Card rời RTX 3050 4GB', 'Card màn hình:', 83),
(534, 'HDMI LAN (RJ45)USB Type-C3 x USB 3.2 Jack tai nghe 3.5 mm', 'Cổng kết nối:', 83),
(535, 'Có đèn bàn phím', 'Đặc biệt:', 83),
(536, 'Windows 11 Home SL + Office Home & Student vĩnh viễn', 'Hệ điều hành:', 83),
(537, 'Vỏ nhựa', 'Thiết kế:', 83),
(538, 'Dài 357 mm - Rộng 272 mm - Dày 25 mm - Nặng 2.81 kg', 'Kích thước, khối lượng:', 83),
(539, '2021', 'Thời điểm ra mắt:', 83),
(540, 'i3 1115G4 3GHz', 'CPU:', 84),
(541, '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', 'RAM:', 84),
(542, '512 GB SSD NVMe PCIe', 'Ổ cứng:', 84),
(543, '15.6\" Full HD (1920 x 1080)', 'Màn hình:', 84),
(544, 'Card tích hợp Intel UHD', 'Card màn hình:', 84),
(545, 'HDM I2x SuperSpeed USB AJack tai nghe 3.5 mm1x SuperSpeed USB Type-C', 'Cổng kết nối:', 84),
(546, 'Windows 11 Home SL', 'Hệ điều hành:', 84),
(547, 'Vỏ nhựa', 'Thiết kế:', 84),
(548, 'Dài 358.5 mm - Rộng 242 mm - Dày 17.9 mm - Nặng 1.7 kg', 'Kích thước, khối lượng:', 84),
(549, '2022', 'Thời điểm ra mắt:', 84),
(550, 'i5 12450H 2GHz', 'CPU:', 85),
(551, '16 GB DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB) 3200 MHz', 'RAM:', 85),
(552, '512 GB SSD NVMe PCIe', 'Ổ cứng:', 85),
(553, '15.6\" Full HD (1920 x 1080) 144Hz', 'Màn hình:', 85),
(554, 'Card rời RTX 3050 4GB', 'Card màn hình:', 85),
(555, '1 x USB Type-C 3.2 (hỗ trợ DisplayPort)HDMILAN (RJ45)2 x USB 3.2 Jack tai nghe 3.5 mm', 'Cổng kết nối:', 85),
(556, 'Có đèn bàn phím', 'Đặc biệt:', 85),
(557, 'Windows 11 Home SL', 'Hệ điều hành:', 85),
(558, 'Vỏ nhựa', 'Thiết kế:', 85),
(559, 'Dài 357.9 mm - Rộng 255 mm - Dày 23.5 mm - Nặng 2.31 kg', 'Kích thước, khối lượng:', 85),
(560, '2023', 'Thời điểm ra mắt:', 85),
(561, 'i5 1335U 1.3GHz', 'CPU:', 86),
(562, '16 GB DDR4 (Onboard) 3200 MHz', 'RAM:', 86),
(563, '512 GB SSD NVMe PCIe', 'Ổ cứng:', 86),
(564, '14\" Full HD (1920 x 1080)', 'Màn hình:', 86),
(565, 'Card tích hợp Intel Iris Xe', 'Card màn hình:', 86),
(566, '1 x USB Type-C 3.2 (hỗ trợ Power Delivery và DisplayPort)HDMI2 x USB 3.2 Jack tai nghe 3.5 mm', 'Cổng kết nối:', 86),
(567, 'Có màn hình cảm ứng, Có đèn bàn phím', 'Đặc biệt:', 86),
(568, 'Windows 11 Home SL', 'Hệ điều hành:', 86),
(569, 'Vỏ kim loại - Nắp lưng bằng nhựa', 'Thiết kế:', 86),
(570, 'Dài 322 mm - Rộng 210 mm - Dày 19.9 mm - Nặng 1.53 kg', 'Kích thước, khối lượng:', 86),
(571, '2023', 'Thời điểm ra mắt:', 86),
(572, 'i3 12100 3.30 GHz', 'Công nghệ CPU:', 87),
(573, '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe trống) 3200 MHz 2 khe', 'RAM:', 87),
(574, '256 GB SSD 1 x Hỗ trợ khe cắm SSD M.2 PCIe 4.0 x 162 x Hỗ trợ khe M.2 PCIe 3.0 x 12 x Đầu nối M.2 cho bộ nhớHỗ trợ khe M.2 connector for WiFi4 x Hỗ trợ khe cắm HDD SATA', 'Ổ cứng:', 87),
(575, 'Intel UHD', 'Card màn hình:', 87),
(576, 'Windows 11', 'Hệ điều hành:', 87),
(577, 'Dài 339.6 mm - Rộng 292.7 mm - Dày 94.6 mm - Nặng 5 kg', 'Kích thước:', 87),
(578, 'i5 12400 2.50 GHz', 'Công nghệ CPU:', 88),
(579, '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe trống) 3200 MHz 2 khe', 'RAM:', 88),
(580, '512 GB SSD 1 x Hỗ trợ khe cắm SSD M.2 PCIe 4.0 x 162 x Hỗ trợ khe M.2 PCIe 3.0 x 12 x Đầu nối M.2 cho bộ nhớ1 x Đầu nối M.2 cho WiFi4 x Hỗ trợ khe cắm HDD SATA', 'Ổ cứng:', 88),
(581, 'Intel UHD 730', 'Card màn hình:', 88),
(582, 'Windows 11', 'Hệ điều hành:', 88),
(583, 'Dài 367.8 mm - Rộng 318.9 mm - Dày 160 mm - Nặng 5.9 kg', 'Kích thước:', 88),
(584, 'i5 11400 2.60 GHz', 'Công nghệ CPU:', 89),
(585, '16 GB DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB) 3200 MHz 2 khe', 'RAM:', 89),
(586, '512 GB SSD (Có thể tháo ra, lắp thanh khác tối đa 2 TB) Hỗ trợ khe cắm HDD SATA3 2.5 inch', 'Ổ cứng:', 89),
(587, 'GTX 1660 6GB', 'Card màn hình:', 89),
(588, 'Windows 11', 'Hệ điều hành:', 89),
(589, 'Dài 353.73 mm - Rộng 251.35 mm - Dày 97.56 mm - Nặng 3.4 kg', 'Kích thước:', 89),
(590, 'Apple M1', 'Công nghệ CPU:', 90),
(591, '8 GB', 'RAM:', 90),
(592, '512 GB SSD', 'Ổ cứng:', 90),
(593, '8-core GPU', 'Card màn hình:', 90),
(594, 'HDMI LAN (RJ45)Jack 3.5 mm2 x USB A2 x Thunderbolt 4', 'Cổng kết nối:', 90),
(595, 'Mac OS', 'Hệ điều hành:', 90),
(596, 'Dài 197 mm - Rộng 197 mm - Dày 36 mm - Nặng 1.2 kg', 'Kích thước:', 90),
(597, 'i7 11800H 2.30 GHz', 'CPU:', 91),
(598, '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', 'RAM:', 91),
(599, '512 GB SSD NVMe PCIe Hỗ trợ khe cắm SATA 2.5 inch mở rộng (nâng cấp SSD hoặc HDD đều được)', 'Ổ cứng:', 91),
(600, '15.6\" Full HD (1920 x 1080) 144Hz', 'Màn hình:', 91),
(601, 'Card rời RTX 3050 Max-Q, 4GB', 'Card màn hình:', 91),
(602, 'HDMI LAN (RJ45)USB Type-C3 x USB 3.21x Mic-in Jack tai nghe 3.5 mm', 'Cổng kết nối:', 91),
(603, 'Có đèn bàn phím', 'Đặc biệt:', 91),
(604, 'Windows 11 Home SL', 'Hệ điều hành:', 91),
(605, 'Vỏ kim loại', 'Thiết kế:', 91),
(606, 'Dài 359 mm - Rộng 254 mm - Dày 21.7 mm - Nặng 1.86 kg', 'Kích thước, khối lượng:', 91),
(607, '2023', 'Thời điểm ra mắt:', 91),
(608, 'i5 1235U 1.3GHz', 'CPU:', 92),
(609, '8 GB DDR4 (Onboard) 3200 MHz', 'RAM:', 92),
(610, '512 GB SSD NVMe PCIe', 'Ổ cứng:', 92),
(611, '15.6\" Full HD (1920 x 1080)', 'Màn hình:', 92),
(612, 'Card tích hợp Intel Iris Xe', 'Card màn hình:', 92),
(613, '1 x USB Type-C (hỗ trợ USB, Power Delivery và DisplayPort) HDMI2 x USB 2.01 x USB 3.2 Jack tai nghe 3.5 mm', 'Cổng kết nối:', 92),
(614, 'Có đèn bàn phím', 'Đặc biệt:', 92),
(615, 'Windows 11 Home SL', 'Hệ điều hành:', 92),
(616, 'Vỏ nhựa', 'Thiết kế:', 92),
(617, 'Dài 359 mm - Rộng 241 mm - Dày 19.9 mm - Nặng 1.7 kg', 'Kích thước, khối lượng:', 92),
(618, '2023', 'Thời điểm ra mắt:', 92),
(626, 'Bật ANC: 5 giờ Tắt ANC : 8 giờ', 'Thời lượng pin', 93),
(627, '1 giờ', 'Thời gian sạc', 93),
(628, 'IPX7 (Chống nước 1m trong 30 phút)', 'Chống nước', 93),
(629, 'Chống ồn chủ động', 'Công nghệ âm thanh', 93),
(630, 'Mic đàm thoại chống ồn', 'Micro', 93),
(631, 'Android,Windows,iOS', 'Tương thích', 93),
(632, '11mm', 'Kích thước driver', 93),
(633, '69ms', 'Độ trễ', 93),
(634, '20 W', 'Công suất', 94),
(635, 'Dolby Âm thanh vòm mở rộng', 'Công nghệ âm thanh', 94),
(636, 'Tính năng Night Mode Tính năng Voice Enhance Q-Symphony Tap Sound', 'Tính năng khác', 94),
(637, '10 m', 'Phạm vi kết nối', 94),
(638, 'Samsung Chính hãng', 'Hãng sản xuất', 94),
(639, '928 x 120 x 155 mm', 'Kích thước', 94),
(640, '2.8 kg', 'Trọng lượng', 94),
(641, 'Type C', 'Cổng kết nối', 95),
(642, 'USB Type C', 'Cổng giao tiếp', 95),
(643, '18,35 G', 'Trọng lượng', 95),
(644, 'Samsung chính hãng', 'Hãng sản xuất', 95),
(646, '18W (Max)', 'Công suất đầu ra', 97),
(647, 'Micro-USB / USB-C', 'Cổng sạc vào', 97),
(648, '2 × USB-A', 'Cổng sạc ra', 97),
(649, 'Lithium-ion Polymer', 'Lõi pin', 97),
(650, '20000mAh', 'Dung lượng Pin', 97),
(651, '18W', 'Công suất', 97),
(652, 'Xiaomi', 'Hãng sản xuất', 97),
(653, 'Micro-USB & Type-C: 5V/2.1A, 9V/2.1A, 12V/1.5A', 'Dòng điện vào', 97),
(654, 'Li-ion', 'Lõi pin', 98),
(655, 'Apple Chính hãng', 'Hãng sản xuất', 98),
(656, 'MacOS', 'Tương thích', 98),
(657, 'Bluetooth, Cổng Lightning', 'Cách kết nối', 98),
(658, '10m', 'Độ dài dây / Khoảng cách kết nối', 98),
(659, 'Fullsize', 'Kích thước bàn phím', 98),
(660, 'RJ45 Gigabits WAN x 1 RJ45 Gigabits LAN x 4', 'Cổng giao tiếp', 99),
(661, 'Asus', 'Hãng sản xuất', 99),
(662, 'Wi-Fi 6 (802.11ax)', 'Chuẩn Wi-Fi', 99),
(663, '574 Mbps (2.4 Ghz) 1201 Mbp (5GHz)', 'Độ mạnh của sóng (các thiết bị mạng)', 99),
(664, '2.4GHz & 5GHz', 'Băng tần sóng', 99),
(665, '4 Ăng-ten ngoài', 'Số Ăng ten', 99),
(666, 'Ứng dụng ASUS Router', 'Kết nối và điều khiển', 99),
(667, 'Apple Chính hãng', 'Hãng sản xuất', 100),
(668, 'MacOS, PadOS', 'Tương thích', 100),
(669, 'Bluetooth', 'Cách kết nối', 100),
(670, '10m', 'Độ dài dây / Khoảng cách kết nối', 100),
(671, 'LCD', 'Công nghệ màn hình', 101),
(672, '1.83 inch', 'Kích thước màn hình', 101),
(673, 'Từ 13.5 - 20 cm', 'Kích thước cổ tay phù hợp', 101),
(674, 'Điện thoại chạy Android 6.0 trở lên iPhone chạy iOS 12.0 trở lên', 'Tương thích', 101),
(675, 'Nghe gọi qua Bluetooth', 'Nghe,gọi', 101),
(676, 'Chế độ luyện tập, Theo dõi giấc ngủ, Đo nhịp tim, Đo lượng oxy trong máu', 'Tiện ích sức khoẻ', 101),
(677, 'Chế độ thông minh: 12 ngày Sử dụng liên tục: 8 ngày', 'Thời lượng pin', 101),
(678, 'Xiaomi', 'Hãng sản xuất', 101),
(679, 'Tai nghe: Dùng 8 giờ Hộp sạc: Dùng 29 giờ', 'Thời lượng pin', 102),
(680, 'IPX7', 'Chống nước', 102),
(681, 'Active Noise Cancelling 360 Reality Audio Ambient Sound Âm thanh Hi-Fi', 'Công nghệ âm thanh', 102),
(682, 'Có', 'Micro', 102),
(683, 'Các thiết bị có hỗ trợ Bluetooth', 'Tương thích', 102),
(684, 'Trợ Lý ảo Bixby Tự động kết nối khi mở hộp sạc', 'Tính năng khác', 102),
(685, 'Chạm cảm ứng', 'Phương thức điều khiển', 102),
(686, 'Samsung Chính hãng', 'Hãng sản xuất', 102),
(687, 'Sony', 'Hãng sản xuất', 103),
(688, 'Compact (pns)', 'Loại máy ảnh', 103),
(689, 'Exmor RS CMOS 1.0', 'Loại cảm biến', 103),
(690, 'Zeiss Vario-Sonnar T 10 thấu kính xếp thành 9 nhóm', 'Loại ống kính', 103),
(691, 'F= 9.4 - 25.7 mm', 'Tiêu cự', 103),
(692, 'Tối đa f/1.8 Tối thiểu f/2.8', 'Khẩu độ', 103),
(693, 'Single-shot AF, Automatic AF, Continuous AF, DMF, Manual Focus', 'Chế độ lấy nét', 103),
(694, '5472 x 3648', 'Kích thước ảnh', 103),
(695, '3000D', 'Model', 104),
(696, 'DSLR', 'Loại máy ảnh', 104),
(697, '18 megapixels', 'Độ phân giải máy ảnh', 104),
(698, 'DIGIC 4+', 'Bộ xử lý hình ảnh', 104),
(699, 'Có', 'Chế độ tự động lấy nét', 104),
(700, '100 / 6400 đến 12800', 'Độ nhạy sáng ISO', 104),
(701, 'EF Canon (bao gồm ống kính EF-S)', 'Kiểu ống kính', 104),
(702, '11 inches', 'Kích thước màn hình', 105),
(703, 'IPS LCD', 'Công nghệ màn hình', 105),
(704, '12MP góc rộng 10MP góc siêu rộng', 'Camera sau', 105),
(705, '12MP góc siêu rộng 122 độ', 'Camera trước', 105),
(706, 'Apple M1 8 nhân', 'Chipset', 105),
(707, '8 GB', 'Dung lượng RAM', 105),
(708, '128 GB', 'Bộ nhớ trong', 105),
(709, '7538mAh', 'Pin', 105),
(710, 'iPadOS', 'Hệ điều hành', 105),
(711, '11 inches', 'Kích thước màn hình', 106),
(712, 'TFT LCD', 'Công nghệ màn hình', 106),
(713, 'Camera chính: 13MP Camera góc siêu rộng: 6MP', 'Camera sau', 106),
(714, 'Camera góc siêu rộng 12MP', 'Camera trước', 106),
(715, '8 GB', 'Dung lượng RAM', 106),
(716, '128 GB', 'Bộ nhớ trong', 106),
(717, 'Android 12, UI 4.1.', 'Hệ điều hành', 106),
(718, '2560 x 1600 pixel (2K)', 'Độ phân giải màn hình', 106),
(719, '10.36 inches', 'Kích thước màn hình', 107),
(720, 'IPS LCD', 'Công nghệ màn hình', 107),
(721, '8 MP, AF', 'Camera sau', 107),
(722, '8 MP', 'Camera trước', 107),
(723, '4 GB', 'Dung lượng RAM', 107),
(724, '128 GB', 'Bộ nhớ trong', 107),
(725, 'Nano-SIM', 'Thẻ SIM', 107),
(726, 'Android 12', 'Hệ điều hành', 107),
(727, '1200 x 2000 pixels', 'Độ phân giải màn hình', 107),
(728, '10.36 inches', 'Kích thước màn hình', 108),
(729, 'IPS LCD', 'Công nghệ màn hình', 108),
(730, '8MP (f/2.0)', 'Camera sau', 108),
(731, '5MP (f/2.2)', 'Camera trước', 108),
(732, '4 GB', 'Dung lượng RAM', 108),
(733, '64 GB', 'Bộ nhớ trong', 108),
(734, 'ColorOS 12.1', 'Hệ điều hành', 108),
(735, '1200 x 2000 pixels', 'Độ phân giải màn hình', 108),
(736, '360nits, 120Hz, 1 tỉ màu', 'Tính năng màn hình', 108),
(737, '7100mAh', 'Pin', 108),
(738, 'Snapdragon® 680 8 nhân 6nm', 'Chipset', 108);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_requested_time` varchar(255) DEFAULT NULL,
  `enable` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `address`, `email`, `password`, `phonenumber`, `username`, `otp`, `otp_requested_time`, `enable`) VALUES
(1, 'Ben Tre', 'loctran7129@gmail.com', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', '0777099046', 'huuloc', NULL, NULL, b'1'),
(2, 'Ha Noi', 'admin01@gmail.com', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', '0125678904', 'admin01', NULL, NULL, b'1'),
(4, 'Ben Tre', 'huuloctran129@gmail.com', '$2a$10$hB9eDXRTv9L8u.Y8enCPFetylj/huqjeyPuQOQCxXNRwedOfZaOtm', '0777099046', 'loc tran', NULL, NULL, b'1'),
(5, 'ha noi', 'linhnguyen@gmail.com', '$2a$10$W8NCtz92fejFOBF5PSROGeQysuUIo4FeiM6Mr18xQwa0eOb9SrFny', '0777099046', 'linh', NULL, NULL, b'1'),
(6, 'ha noi', 'admin02@gmail.com', '$2a$10$.tti9BIju9buTCKP11vG8e5WCnkfRktI1/7SEC23PdZU7O5YJY7cy', '0777099046', 'admin02', NULL, NULL, b'1'),
(7, 'TDTU', 'dangminhphong912@gmail.com', '$2a$10$Bb4YgiRlSctl1i6fJt8STuQKMIqHnCpVSIPXA6AfRCqGQell2ZfKe', '0764186912', 'admin', NULL, NULL, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `id` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`id`, `roleid`, `userid`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 2, 4),
(8, 1, 5),
(5, 1, 6),
(10, 1, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brandid`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`cardid`),
  ADD UNIQUE KEY `UK_4n9137eymroecph3qbxpnyhhq` (`numbercard`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`),
  ADD KEY `FKkh5di77cfr01hq05rbcogspec` (`productid`),
  ADD KEY `FKt6jitgcn53wujrlwnnp1tb840` (`userid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`codeid`),
  ADD UNIQUE KEY `UK_i5hiv8ppvfnvvu1vl1c913616` (`codetext`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentid`),
  ADD KEY `FKn2t77p4gasu6hns08t2pycpk9` (`productid`),
  ADD KEY `FKe7pshbkin4984x23q4wboi5ka` (`userid`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`mesid`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`newid`),
  ADD KEY `FKgm0r3h1p9gbo6osd4cabcxuiq` (`userid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `FKdxew8n76x1bnoxjas0qxrlbq6` (`userid`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`orderdetailid`),
  ADD KEY `FK715ucxrvknue1cfnb458qh5n5` (`orderid`),
  ADD KEY `FKlsvx45m4io6a6fdwpa14pvn92` (`productid`);

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
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ROLE_UK` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `USER_ROLE_UK` (`userid`,`roleid`),
  ADD KEY `FKp9uqhbg64l2v6p5i1ixunb645` (`roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brandid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `cardid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `code`
--
ALTER TABLE `code`
  MODIFY `codeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `mesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `newid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `orderdetailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `productvalue`
--
ALTER TABLE `productvalue`
  MODIFY `valueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=739;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FKkh5di77cfr01hq05rbcogspec` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`),
  ADD CONSTRAINT `FKt6jitgcn53wujrlwnnp1tb840` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FKe7pshbkin4984x23q4wboi5ka` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `FKn2t77p4gasu6hns08t2pycpk9` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FKgm0r3h1p9gbo6osd4cabcxuiq` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKdxew8n76x1bnoxjas0qxrlbq6` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK715ucxrvknue1cfnb458qh5n5` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  ADD CONSTRAINT `FKlsvx45m4io6a6fdwpa14pvn92` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`);

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

--
-- Constraints for table `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `FKljkcg6w3npwi6u5ua4gqp59sj` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `FKp9uqhbg64l2v6p5i1ixunb645` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
