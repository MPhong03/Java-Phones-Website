-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 27, 2023 at 04:04 PM
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
-- Database: `javaweb3`
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
(14, 'Microsoft');

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
(9, 9990000, 1, 2, 2, 'Trắng');

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
(5, 'Tivi'),
(6, 'Âm thanh'),
(7, 'Máy ảnh'),
(8, 'Tablet'),
(10, 'Tủ lạnh');

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
(2, 'cho lach, ben tre', '26-8-2023 01:43:30 PM*admin01@gmail.com', '26-8-2023 01:43:30 PM', ' Không có', 'tranhuuloc@gmail.com', 'huu loc', '0398761257', 'Bến Tre', 0, 4690000, 2);

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
  `categoryid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `description`, `imagelink`, `productname`, `colors`, `price`, `state`, `supples`, `brandid`, `categoryid`) VALUES
(1, 'Bàn phím laptop được thiết kế khoa học với cấu trúc liền khối cùng hành trình phím ngắn. Nhờ vậy bạn có thể bấm phím thoải mái, dễ dàng không bị dính phím. đồng thời tiếng động gây ra từ bàn phím khá nhỏ không làm ồn đến người dùng cũng như môi trường xung quanh.', '/uploads/laptop-asus-vivobook-r564ja-uh51t-2.jpg;/uploads/laptop-asus-vivobook-r564ja-uh51t-3.jpg;/uploads/laptop-asus-vivobook-r564ja-uh51t-1.jpg;', 'Laptop ASUS VivoBook R564JA-UH31T', 'Đen', 11690000, 'Hàng mới chính hãng', 'Nguyên hộp, đầy đủ phụ kiện từ nhà sản xuất', 5, 2),
(2, 'Samsung từng bước khẳng định thương hiệu của mình bằng việc cho ra đời những mẫu flagship ngày càng hiện đại với công nghệ tiến bộ. Điển hình là chiếc điện thoại Samsung Galaxy S21 Ultra 5G  tích hợp mọi tính năng gần như trở thành mẫu smartphone hoàn hảo nhất.', '/uploads/S21-ULTRA.jpg;/uploads/S21-ULTRA-TRANG.jpg', 'Samsung Galaxy S21 Ultra 5G Korea (Likenew)', 'Đen,Trắng', 9990000, 'Máy qua sử dụng', 'Thân máy', 1, 1),
(3, 'Hoàn toàn xứng đáng với những gì được mong chờ, phiên bản cao cấp nhất iPhone Xs Max 64 GB của Apple năm nay nổi bật với chip A12 Bionic mạnh mẽ, màn hình rộng đến 6.5 inch, cùng camera kép trí tuệ nhân tạo và Face ID được nâng cấp.', '/uploads/600_600_600_XSMAX_6_1.jpg;/uploads/600_600_600_xs_max_white_800x800_3_3.jpg;/uploads/600_iphone_xs_max_64gb_likenew.jpg', 'Apple iPhone Xs Max 256GB Quốc Tế (Likenew)', 'Vàng,Bạc,Đen', 8990000, 'Máy qua sử dụng', 'Thân máy', 2, 1),
(4, 'Tai nghe Bluetooth AirPods Pro MagSafe Charge Apple MLWK3 trắng được chế tác với vẻ ngoài tinh giản, gam màu trắng trẻ trung, sáng đẹp, phối hợp tuyệt vời với mọi trang phục từ đời thường đến công sở, dự tiệc của bạn. ', '/uploads/TAI-NGHE-AIRPOD.jpg', 'Apple AirPods Pro 2021 Magsafe', 'Trắng', 4690000, 'Hàng mới chính hãng', 'Fullbox', 2, 6),
(5, 'Black Shark 4 là điện thoại chơi game hàng đầu của Xiaomi trong năm 2021. Những điểm mạnh của Black Shark 4 là tương đối toàn diện. Thiết kế toàn màn hình cao cấp với tốc độ làm mới 144Hz/720Hz. Phần cứng là bộ vi xử lý Snapdragon 870 mạnh mẽ. Tản nhiệt cũng được nâng cấp mạnh mẽ giảm tới 18 độ cho CPU giúp chơi game cấu hình cao không nóng máy. Hơn nữa, Black Shark 4 đã xác lập kỷ lục với pin 4500mAh, hỗ trợ sạc 120W “nhanh nhất thế giới”,… Mang lại hiệu năng vượt trội về nhiều mặt.', '/uploads/black-shark-4-quoc-te-6.jpg;/uploads/black-shark-4-3-2.jpg;/uploads/black-shark-4-quoc-te-4.jpg;/uploads/black-shark4-4.jpg', 'Xiaomi Black Shark 4 (8GB/128GB) Likenew', 'Trắng,Đen', 5790000, 'Máy qua sử dụng', 'Thân máy', 3, 1),
(6, 'iPad Air 4 2020 – Chip A14 mạnh mẽ cho trải nghiệm hoàn hảo\r\nApple luôn khiến cho cộng đồng công nghệ đứng ngồi không yên mỗi khi cho giới thiệu sản phẩm mới. iPad Air 4 được ra mắt tại sự kiện mà các tín đồ công nghệ nghĩ rằng Apple sẽ trình làng dòng điện thoại iPhone 12 2020, nhưng chiếc tablet này mới chính là nhân vật chính. iPad Air thế hệ 2020 mang những thay đổi về mặt thiết kế cũng như những tính năng mới được tích hợp để tối ưu hóa về hiệu năng, mang đến cho người dùng những trải nghiệm tốt hơn.', '/uploads/IPAD-AIR-4-TRẮNG.jpg;/uploads/IPAD-AIR-4-XÁM.jpg;/uploads/IPAD-AIR-4-XANH-DƯƠNG.jpg;/uploads/IPAD-AIR-4-XANH-LÁ.jpg;', 'iPad Air 10.9 2020 WiFi 64GB I Chính hãng Apple Việt Nam', 'Bạc,Xám,Xanh Dương,Xanh lá', 14900000, 'Hàng mới chính hãng', 'Thân máy', 2, 8),
(31, 'Galaxy A31 là mẫu smartphone tầm trung được ra mắt đầu năm 2020 của Samsung. Thiết bị gây ấn tượng mạnh với ngoại hình thời trang, cụm 4 camera đa chức năng, vân tay dưới màn hình và viên pin khủng lên đến 5000 mAh.\r\n', '/uploads/SS-A31-BLACK-NT-STORE.webp;/uploads/SS-A31-BLUE-NT-STORE.webp;', 'Samsung Galaxy A31 (6GB|128GB) Korea Likenew', 'Đen,Xanh', 2990000, 'Máy qua sử dụng', 'Thân máy', 1, 1),
(32, 'Samsung Galaxy Fold không chỉ sở hữu một màn hình có thể uốn dẻo mà còn có một màn hình riêng, để có thể sử dụng độc lập khi gập máy lại.\r\nKhi mà những chiếc smartphone gần đây đang ngày càng có thiết kế giống nhau thì sự ra đời của Samsung Galaxy Fold thực sự tạo nên làn gió mới trên thị trường.\r\nBạn sẽ có một màn hình với kích thước 7.3 inch giúp bạn có thể sử dụng rất thoải mái như một chiếc máy tính bảng.\r\n\r\n', '/uploads/SAMSUNG-FOLD-1-NT-STORE.webp;/uploads/SAMSUNG-Z-FOLD-1-NTSTORE.webp;', 'Samsung Galaxy Fold Korea (Likenew)', 'Đen,Đa sắc', 7990000, 'Máy qua sử dụng', 'Thân máy', 1, 1),
(33, 'Có thể nói, Samsung Galaxy Note 10 Plus 5G  cũ là sự lựa chọn tuyệt vời cho người dùng đam mê công nghệ có nhu cầu sở hữu một chiếc điện thoại hoàn hảo về mọi mặt. Với Galaxy Note 10 Plus, Samsung đã thật sự mang đến một “chiến binh” có sức mạnh vượt trội, đáp ứng toàn diện các nhu cầu về làm việc và giải trí của người dùng.', '/uploads/NOTE-10-5G-DA-SẮC.webp;/uploads/NOTE-10-5G-DEN.webp;', 'Samsung Galaxy Note 10 Plus 5G Hàn Quốc (Like New)', 'Đen,Đa sắc', 6890000, 'Máy qua sử dụng', 'Thân máy', 1, 1),
(34, 'Galaxy Note 20 5G – một siêu phẩm đến từ nhà Samsung, sở hữu thiết kế nguyên khối thời trang, hiệu năng mạnh mẽ bởi CPU Snapdragon 865+ hàng đầu cùng cụm camera hỗ trợ quay phim 8K, chắc hẳn sẽ mang lại cho bạn những trải nghiệm thú vị và tuyệt vời.', '/uploads/600_galaxy-note-20-256gb-cu-xtmobile.webp;/uploads/600_note_20_xam_xtmobile_min.webp;/uploads/600_samsung_galaxy_note_20.webp;', 'Samsung Galaxy Note 20 5G (8G|256GB) Korea Likenew', 'Đen,Hồng,Xanh bạc hà', 5990000, 'Máy qua sử dụng', 'Thân máy', 1, 1),
(35, 'Sau Galaxy Note 20 thì Galaxy Note 20 Ultra là phiên bản tiếp theo cao cấp hơn thuộc dòng Note 20 Series của Samsung, với nhiều thay đổi, từ cụm camera hỗ trợ lấy nét laser AF cùng ống kính góc rộng mới, màn hình tràn viền lên đến 6.9 inch.', '/uploads/note-20-ultra-5G-3.webp;/uploads/note-20-ultra-5G-2.webp;/uploads/note-20-ultra-5G-1.webp;', 'Samsung Galaxy Note 20 Ultra 5G Korea (Like New)', 'Đen,Trắng,Vàng đồng', 9290000, 'Máy qua sử dụng', 'Thân máy', 1, 1),
(36, 'Samsung Galaxy Z Fold5 là mẫu điện thoại cao cấp được ra mắt vào tháng 07/2023 với nhiều điểm đáng chú ý như thiết kế gập độc đáo, hiệu năng mạnh mẽ cùng camera quay chụp tốt, điều này giúp cho máy thu hút được nhiều sự quan tâm của đông đảo người dùng yêu công nghệ hiện nay.', '/uploads/samsung-galaxy-zfold5-xanh-256gb-1-1.jpg;/uploads/samsung-galaxy-zfold5-kem-256gb-1-1.jpg;/uploads/samsung-galaxy-zfold5-den-256gb-1.jpg;', 'Samsung Galaxy Z Fold5 5G 256GB', 'Đen,Trắng,Xanh da trời', 36990000, 'Hàng mới chính hãng', 'Thân máy', 1, 1),
(37, 'Samsung tiếp tục chứng tỏ sự nỗ lực của mình trong việc cải thiện dòng sản phẩm phân khúc cấp thấp trong năm 2023 bằng việc ra mắt mẫu smartphone Samsung Galaxy A14 4G. Với thiết kế độc đáo và hiện đại, sản phẩm này đáp ứng đầy đủ tiêu chí \"ngon - bổ - rẻ\" với cấu hình ổn định và giá cả cực kỳ hợp lý.', '/uploads/samsung-galaxy-a14-4g-tim-1.jpg;/uploads/samsung-galaxy-a14-tim-1.jpg;', 'Samsung Galaxy A14 6GB ', 'Đỏ đô,Bạc', 4340000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 1, 1),
(38, 'Samsung Galaxy Z Flip5 đã chính thức ra mắt vào ngày 26 tháng 7. Đây là một chiếc điện thoại thông minh có thiết kế độc đáo với màn hình gập, được trang bị bộ vi xử lý cao cấp Snapdragon 8 Gen 2 for Galaxy, RAM 8 GB, bộ nhớ trong 256 GB, camera kép 12 MP và pin 3700 mAh.\r\n', '/uploads/samsung-galaxy-zflip-5-kem-512gb-1.jpg;/uploads/samsung-galaxy-zflip5-xanh-256gb-1-1.jpg;/uploads/samsung-galaxy-zflip-5-xam-256gb-1.jpg;/uploads/samsung-galaxy-zflip-5-tim-256gb-1.jpg;', 'Samsung Galaxy Z Flip5 5G 256GB ', 'Kem,Xám,Tím,Xanh', 21990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 1, 1),
(39, 'Samsung Galaxy A53 5G 128GB trình làng với một thiết kế hiện đại, hiệu năng ổn định cùng một màn hình hiển thị sắc nét, hỗ trợ tần số quét cao giúp bạn có được những phút giây giải trí cực kỳ đã mắt, hay thỏa mãn đam mê nhiếp ảnh trong bạn nhờ trang bị camera có độ phân giải cao.', '/uploads/samsung-galaxy-a53-den-1-1.jpg;/uploads/samsung-galaxy-a53-cam-1-1.jpg;/uploads/samsung-galaxy-a53-trang-1-1.jpg;/uploads/samsung-galaxy-a53-1-1.jpg;', 'Samsung Galaxy A53 5G 128GB', 'Cam,Trắng,Đen,Xanh', 6990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 1, 1),
(40, 'Samsung Galaxy S23 Ultra 5G 256GB là chiếc smartphone cao cấp nhất của nhà Samsung, sở hữu cấu hình không tưởng với con chip khủng được Qualcomm tối ưu riêng cho dòng Galaxy và camera lên đến 200 MP, xứng danh là chiếc flagship Android được mong đợi nhất trong năm 2023.', '/uploads/samsung-galaxy-s23-ultra-kem-1-1.jpg;/uploads/samsung-galaxy-s23-ultra-1-2.jpg;/uploads/samsung-galaxy-s-ultra-tim-1.jpg;/uploads/samsung-galaxy-s23-ultra-xanh-1.jpg;', 'Samsung Galaxy S23 Ultra 5G 256GB', 'Xanh rêu,Tím nhạt,Kem,Đen', 23990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 1, 1),
(41, 'Samsung Galaxy A23 4GB sở hữu bộ thông số kỹ thuật khá ấn tượng trong phân khúc, máy có một hiệu năng ổn định, cụm 4 camera thông minh cùng một diện mạo trẻ trung phù hợp cho mọi đối tượng người dùng.', '/uploads/samsung-galaxy-a23-4g-1.jpg;', 'Samsung Galaxy A23 4GB ', 'Cam', 4400000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 1, 1),
(42, 'iPhone 14 Pro Max một siêu phẩm trong giới smartphone được nhà Táo tung ra thị trường vào tháng 09/2022. Máy trang bị con chip Apple A16 Bionic vô cùng mạnh mẽ, đi kèm theo đó là thiết kế hình màn hình mới, hứa hẹn mang lại những trải nghiệm đầy mới mẻ cho người dùng iPhone.', '/uploads/iphone-14-pro-max-vang-thumb-200x200.jpg;/uploads/iphone-14-pro-max-bac-thumb-200x200.jpg;/uploads/iphone-14-pro-max-den-thumb-200x200.jpg;/uploads/iphone-14-pro-max-tim-thumb-200x200.jpg;', 'iPhone 14 Pro Max 128GB ', 'Tím,Đen,Bạc,Vàng', 26490000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1),
(43, 'iPhone 14 Pro 128GB - Mẫu smartphone đến từ nhà Apple được mong đợi nhất năm 2022, lần này nhà Táo mang đến cho chúng ta một phiên bản với kiểu thiết kế hình notch mới, cấu hình mạnh mẽ nhờ con chip Apple A16 Bionic và cụm camera có độ phân giải được nâng cấp lên đến 48 MP.', '/uploads/iphone-14-pro-den-thumb-200x200.jpg;/uploads/iphone-14-pro-tim-thumb-200x200.jpg;/uploads/iphone-14-pro-bac-thumb-200x200.jpg;/uploads/iphone-14-pro-vang-thumb-200x200.jpg;', 'iPhone 14 Pro 128GB', 'Vàng,Bạc,Tím,Đen', 24460000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1),
(44, 'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.', '/uploads/iphone-xi-den-200x200.jpg;/uploads/iphone-11-trang-200x200.jpg;', 'iPhone 11 64GB', 'Trắng,Đen', 10390000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1),
(45, 'iPhone 14 128GB được xem là mẫu smartphone bùng nổ của nhà táo trong năm 2022, ấn tượng với ngoại hình trẻ trung, màn hình chất lượng đi kèm với những cải tiến về hệ điều hành và thuật toán xử lý hình ảnh, giúp máy trở thành cái tên thu hút được đông đảo người dùng quan tâm tại thời điểm ra mắt.', '/uploads/iPhone-14-plus-thumb-den-200x200.jpg;/uploads/iPhone-14-thumb-trang-200x200.jpg;/uploads/iPhone-14-thumb-do-200x200.jpg;', 'iPhone 14 128GB ', 'Đỏ,Trắng,Đen', 19190000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1),
(46, 'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.\r\nHiệu năng vượt trội nhờ chip Apple A15 Bionic\r\nCon chip Apple A15 Bionic siêu mạnh được sản xuất trên quy trình 5 nm giúp iPhone 13 đạt hiệu năng ấn tượng, với CPU nhanh hơn 50%, GPU nhanh hơn 30% so với các đối thủ trong cùng phân khúc.', '/uploads/iphone-13-pink-2-200x200.jpg;/uploads/iphone-13-starlight-1-200x200.jpg;/uploads/iphone-13-midnight-2-200x200.jpg;', 'iPhone 13 128GB', 'Đen,Trắng,Hồng', 16190000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1),
(47, 'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB.\nHiệu năng vượt xa mọi giới hạn\nApple đã trang bị con chip mới nhất của hãng (tính đến 11/2020) cho iPhone 12 đó là A14 Bionic, được sản xuất trên tiến trình 5 nm với hiệu suất ổn định hơn so với chip A13 được trang bị trên phiên bản tiền nhiệm iPhone 11.', '/uploads/iphone-12-tim-1-200x200.jpg;/uploads/iphone-12-xanh-duong-new-2-200x200.jpg;/uploads/iphone-12-den-new-2-200x200.jpg;', ' iPhone 12 64GB', 'Đen,Xanh dương,Tím', 13990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 2, 1),
(48, 'Xiaomi Redmi 12 mẫu điện thoại mới nhất được nhà Xiaomi tung ra vào tháng 06/2023 khiến cho cộng đồng đam mê công nghệ vô cùng thích thú. Máy khoác lên mình một vẻ ngoài cá tính, màn hình lớn đem đến trải nghiệm đã mắt cùng một hiệu năng ổn định với mọi tác vụ.', '/uploads/xiaomi-redmi-12-xanh-duong-thumb-200x200.jpg;/uploads/xiaomi-redmi-12-den-thumb-200x200.jpg;/uploads/xiaomi-redmi-12-bac-thumb-200x200.jpg;', ' Xiaomi Redmi 12 4GB ', 'Bạc,Đen,Xanh dương', 3790000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1),
(49, 'Xiaomi Redmi 12C 64GB một thiết bị di động tầm trung được giới thiệu bởi Xiaomi, với cấu hình vượt trội so với các đối thủ trong cùng phân khúc, điều này nhờ trang bị con chip MediaTek Helio G85 mạnh mẽ giúp máy có thể xử lý tốt nhiều tác vụ. Hơn nữa, với bộ ống kính chất lượng 50 MP cho phép bạn chụp ảnh chất lượng, sắc nét và đẹp mắt.', '/uploads/xiaomi-redmi-12c-grey-thumb-200x200.jpg;/uploads/xiaomi-redmi-12c-blue-thumb-200x200.jpg;/uploads/xiaomi-redmi-12c-green-thumb-200x200.jpg;', 'Xiaomi Redmi 12C 64GB', 'Xanh lá,Xanh dương,Xám', 2590000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1),
(50, 'Redmi Note 12 8GB/256GB - chiếc điện thoại tầm trung mới của hãng điện thoại thông minh Xiaomi được giới thiệu tại Việt Nam. Với vi xử lý Snapdragon 685 mạnh mẽ và camera 50 MP chất lượng cao, chiếc điện thoại này đã thu hút sự chú ý của người dùng trong phân khúc của mình.', '/uploads/xiaomi-redmi-note-12-vang-1-thumb-momo-200x200.jpg;/uploads/xiaomi-redmi-note-12-4g-mono-xanh-256gb-200x200.jpg;/uploads/xiaomi-redmi-note-12-4g-mono-den-256gb-200x200.jpg;', 'Xiaomi Redmi Note 12 (8GB/256GB)', 'Vàng,Xanh lá,Xám', 5990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1),
(51, 'Xiaomi 12T 5G 256GB là smartphone đầu tiên trên thế giới trang bị con chip Dimensity 8100 Ultra nên máy thu hút được khá nhiều sự chú ý vào thời điểm ra mắt, bộ vi xử lý này không chỉ có hiệu năng mạnh mẽ mà nó còn tối ưu được giá thành cho thiết bị, điều này giúp 12T trở thành chiếc điện thoại quốc dân cực kỳ đáng sắm.', '/uploads/xiaomi-12t-thumb-bac-1-200x200.jpg;/uploads/xiaomi-12t-thumb-xanh-1-200x200.jpg;/uploads/xiaomi-12t-thumb-200x200.jpg;', 'Xiaomi 12T 5G 256GB ', 'Đen,Xanh,Bạc', 11990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1),
(52, 'Xiaomi Redmi A1 là mẫu điện thoại giá rẻ nhưng vẫn mang trong mình một thiết kế trẻ trung, hiệu năng tốt cùng viên pin cực trâu, đáp ứng trọn vẹn trải nghiệm cả ngày dài, phù hợp với người dùng muốn chọn mua cho mình một thiết bị có giá thành vừa phải, nhằm đáp ứng nhu cầu sử dụng cơ bản hằng ngày.', '/uploads/Xiaomi-Redmi-A1-thumb-xanh-la-200x200.jpg;/uploads/Xiaomi-Redmi-A1-thumb-den-200x200.jpg;/uploads/Xiaomi-Redmi-A1-thumb-xanh-duong-200x200.jpg;', 'Xiaomi Redmi A1', 'Đen,Xanh lá,Xanh dương', 1590000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1),
(53, 'Xiaomi 13 5G - chiếc điện thoại đáng chú ý trên thị trường với nhiều điểm nâng cấp ấn tượng trong phân khúc giá. Máy mang đến trải nghiệm chụp ảnh thú vị với nhiều bộ lọc màu cũng như chế độ độc đáo mà Leica cung cấp, cùng với đó là chip Snapdragon 8 Gen 2 sở hữu hiệu năng cực kỳ mạnh mẽ giúp mọi trải nghiệm đều trở nên mượt mà.', '/uploads/xiaomi-13-thumb-den-200x200.jpg;/uploads/xiaomi-13-thumb-xanh-200x200.jpg;', 'Xiaomi 13 5G', 'Đen,Xanh lá', 19990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1),
(54, 'Điện thoại Xiaomi đang dần khẳng định chỗ đứng của mình trong phân khúc flagship bằng việc ra mắt Xiaomi 12 với bộ thông số ấn tượng, máy có một thiết kế gọn gàng, hiệu năng mạnh mẽ, màn hình hiển thị chi tiết cùng khả năng chụp ảnh sắc nét nhờ trang bị ống kính đến từ Sony.', '/uploads/Xiaomi-12-tim-thumb-mau-200x200.jpg;/uploads/Xiaomi-12-xanh-duong-thumb-mau-200x200.jpg;/uploads/Xiaomi-12-xam-thumb-mau-200x200.jpg;', 'Xiaomi 12 5G ', 'Xám,Xanh dương,Tím', 11990000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1),
(55, 'Xiaomi Redmi Note 12 Pro 5G mẫu điện thoại tầm trung được kỳ vọng sẽ trở thành sản phẩm quốc dân trong năm 2023, nhờ sở hữu khá nhiều sự nâng cấp với camera 50 MP, chip MediaTek mạnh mẽ cùng ngôn ngữ thiết kế mới vô cùng tối giản, hiện đại.', '/uploads/xiaomi-redmi-note-12-pro-den-thumb-200x200.jpg;/uploads/xiaomi-redmi-note-12-pro-trang-thumb-200x200.jpg;/uploads/xiaomi-redmi-note-12-pro-5g-momo-1-200x200.jpg;', 'Xiaomi Redmi Note 12 Pro 5G', 'Đen,Trắng,Xanh dương', 8790000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1),
(56, 'Xiaomi Redmi Note 12 Pro 4G tiếp tục sẽ là mẫu điện thoại tầm trung được nhà Xiaomi giới thiệu đến thị trường Việt Nam trong năm 2023, máy nổi bật với camera 108 MP chất lượng, thiết kế viền mỏng cùng hiệu năng đột phá nhờ trang bị chip Snapdragon 732G.', '/uploads/xiaomi-redmi-12-pro-4g-thumb-200x200.jpg;/uploads/xiaomi-redmi-note-12-pro-4g-den-thumb-200x200.jpg;', 'Xiaomi Redmi Note 12 Pro 128GB', 'Xám,Xanh dương', 6590000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1),
(57, 'Xiaomi Redmi Note 12S sẽ là chiếc điện thoại tiếp theo được nhà Xiaomi tung ra thị trường Việt Nam trong thời gian tới (05/2023). Điện thoại sở hữu một lối thiết kế hiện đại, màn hình hiển thị chi tiết đi cùng với đó là một hiệu năng mượt mà xử lý tốt các tác vụ.', '/uploads/xiaomi-redmi-12s-xanh-duong-thumb-200x200.jpg;/uploads/xiaomi-redmi-note12s-den-thumb-200x200.jpg;', 'Xiaomi Redmi Note 12S ', 'Đen,Xanh dương', 5890000, 'Hàng mới chính hãng', 'Thân máy và đầy đủ phụ kiện', 3, 1);

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
(307, '5000 mAh33 W', 'Pin, Sạc:', 57);

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
(6, 'ha noi', 'admin02@gmail.com', '$2a$10$.tti9BIju9buTCKP11vG8e5WCnkfRktI1/7SEC23PdZU7O5YJY7cy', '0777099046', 'admin02', NULL, NULL, b'1');

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
(5, 1, 6);

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
  MODIFY `brandid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `cardid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `productvalue`
--
ALTER TABLE `productvalue`
  MODIFY `valueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
