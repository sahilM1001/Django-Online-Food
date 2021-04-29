-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2021 at 11:26 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinefooddeliverysystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_tbl`
--

CREATE TABLE `cart_tbl` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `delivery report`
-- (See below for the actual view)
--
CREATE TABLE `delivery report` (
`d_status` varchar(15)
,`o_date` date
,`d_address` text
,`u_name` varchar(25)
,`type_name` varchar(20)
,`d_id` int(10)
,`o_id` int(10)
,`u_id` int(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `feedback reports`
-- (See below for the actual view)
--
CREATE TABLE `feedback reports` (
`u_id` int(10)
,`fd_details` text
,`fd_date` date
,`u_name` varchar(25)
,`u_email` varchar(25)
,`fd_id` int(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `food items report`
-- (See below for the actual view)
--
CREATE TABLE `food items report` (
`f_id` int(10)
,`f_name` varchar(25)
,`f_price` int(5)
,`category_name` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders report`
-- (See below for the actual view)
--
CREATE TABLE `orders report` (
`u_id` int(10)
,`u_name` varchar(25)
,`u_mobile_no` varchar(10)
,`u_address` varchar(150)
,`o_id` int(10)
,`o_date` date
,`o_amount` int(5)
,`o_qty` int(5)
,`f_name` varchar(25)
,`f_price` int(5)
,`pyt_mode` varchar(10)
,`pyt_date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `payment reports`
-- (See below for the actual view)
--
CREATE TABLE `payment reports` (
`o_id` int(10)
,`pyt_id` int(5)
,`o_id1` int(10)
,`pyt_mode` varchar(10)
,`pyt_date` date
,`u_name` varchar(25)
,`u_mobile_no` varchar(10)
,`o_date` date
,`o_amount` int(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(5) NOT NULL COMMENT 'This field stores category ID',
  `category_name` varchar(15) NOT NULL COMMENT 'This field stores Category Name '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(102, 'Chinese'),
(109, 'Continental'),
(107, 'Desserts'),
(106, 'Drinks'),
(103, 'Italian'),
(110, 'Mexican'),
(101, 'Punjabi'),
(105, 'Snacks'),
(104, 'South Indian');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery`
--

CREATE TABLE `tbl_delivery` (
  `d_id` int(10) NOT NULL COMMENT 'This field will store Delivery ID',
  `o_id` int(10) NOT NULL COMMENT 'This field will store Order ID for the Corresponding Payment',
  `d_address` text NOT NULL COMMENT 'This field will store Delivery Address for the Order ID',
  `d_status` varchar(15) NOT NULL COMMENT 'This field will store delivery status for the Order ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_delivery`
--

INSERT INTO `tbl_delivery` (`d_id`, `o_id`, `d_address`, `d_status`) VALUES
(501, 302, '1, Mudra Apartments, Stadium Road\r\n\r\nAhmedabad, Gujarat, 380014', 'Preparing'),
(502, 304, 'B605 Ratnadeep Twr Bh C P Nagar Soc, Ghatlodia\r\n\r\nAhmedabad, Gujarat, 380061', 'Picked Up'),
(503, 306, '3rd Floor Golden Plaza, Opp Arya Samaj Mandir, O/s Raipur Gt\r\n\r\nAhmedabad, Gujarat, 380022', 'Delivered'),
(504, 308, 'Dhanlaxmi Chambers, Ashram Road\r\n\r\nAhmedabad, Gujarat, 380014', 'Picked up'),
(505, 310, 'L-93, L-93, Odhav\r\n\r\nAhmedabad, Gujarat, 382415', 'Delivered'),
(506, 309, 'Lal Darwaja\r\n\r\nAhmedabad, Gujarat, 380001', 'Preparing'),
(507, 307, '12/a, Tej Complex, Mithakhali\r\n\r\nAhmedabad, Gujarat, 380009', 'Picked Up'),
(508, 305, '04-mar, Nr Jain Temple, Navrangpura\r\n\r\nAhmedabad, Gujarat, 380009', 'Preparing'),
(509, 303, 'Bhudarpura Road, Ambawadi Market, Ambawadi\r\n\r\nAhmedabad, Gujarat, 380006', 'Delivered'),
(510, 301, 'Rajvi Complex, Opp Rambaug Police Station, Maninagar\r\n\r\nAhmedabad, Gujarat, 380008', 'Preparing');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedbacks`
--

CREATE TABLE `tbl_feedbacks` (
  `fd_id` int(5) NOT NULL COMMENT 'This field will store Feedback ID',
  `u_id` int(10) NOT NULL COMMENT 'This field will store User ID corresponding to the Feedback ID ',
  `fd_details` text NOT NULL COMMENT 'This field will store Feedback Details',
  `fd_date` date NOT NULL COMMENT 'This field will store Feedback Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_feedbacks`
--

INSERT INTO `tbl_feedbacks` (`fd_id`, `u_id`, `fd_details`, `fd_date`) VALUES
(601, 123, 'The food was fresh, properly prepared and a great value for the price. We highly recommend it. The breakfast buffet on Sunday was equally as good.', '2021-01-04'),
(602, 118, 'This place is welcoming with charming service and food. ', '2021-02-09'),
(603, 122, 'Been coming here since it first opened and have never had any complaints.The food is fantastic and the staff are always friendly and helpful.Chilly Chicken Masala to die for.', '2020-12-26'),
(604, 125, 'Great food and service, would highly recommend...Went there on mothering Sunday... Everything perfect. Such friendly staff', '2021-02-01'),
(605, 119, 'This is the original and authentic Indian restaurant I would like to say original flavour of Indian food service is five star', '2021-02-08'),
(606, 121, 'The food was amazing, and we enjoyed perfect wait service', '2021-01-08'),
(607, 117, 'It was beautiful-peaceful and relaxing. Staff was outstanding. The restaurant was exceptional along with the hosts and servers.', '2021-01-10'),
(608, 120, 'We went for a meal to celebrate a birthday, and as usual had a fantastic meal. Great service, great food and great value for money.', '2020-12-19'),
(609, 124, 'Excellent environment, friendly service, great menu choices and really decent food and at affordable prices. Will be back.', '2020-12-31'),
(610, 111, 'We are happy to hear you had a positive experience, We value your input and encourage you to let us know more details about your experience with us.', '2021-02-12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food_items`
--

CREATE TABLE `tbl_food_items` (
  `f_id` int(10) NOT NULL COMMENT 'This field stores food item''s ID',
  `f_category_id` int(5) NOT NULL COMMENT 'This field stores food''s Category ID',
  `f_name` varchar(25) NOT NULL COMMENT 'This will store Food Item''s Name',
  `f_price` int(5) NOT NULL COMMENT 'This Will Store Food Item''s Price',
  `f_desc` varchar(255) DEFAULT NULL,
  `f_img_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_food_items`
--

INSERT INTO `tbl_food_items` (`f_id`, `f_category_id`, `f_name`, `f_price`, `f_desc`, `f_img_file`) VALUES
(202, 104, 'Mysore Masala Dosa', 120, 'Just arrived from Mysore. Masala Dosa As best as it can be', 'mysoreDosa.jpg'),
(203, 102, 'Schezwan Fried Rice', 180, 'A chinese rice dish cooked with an indian twist', 'schezwanRice.jpg'),
(204, 105, 'Vada pau', 25, NULL, 'vadaPau.jpg'),
(205, 106, 'Guava Juice', 90, NULL, 'guava.jpg'),
(206, 103, 'Double Cheese Pizza', 250, NULL, 'cheesePizza.jpg'),
(207, 107, 'Choco Lava Cake', 120, NULL, 'chocoLava.jpg'),
(208, 103, 'White Pasta', 150, NULL, 'whitePasta.jpg'),
(209, 101, 'Paneer Bhurji Naan Combo', 210, NULL, 'paneer.jpg'),
(210, 101, 'Dal Rice Combo', 190, 'Home-style cooked tadka dal with the best basmati rice, topped with fresh cilantro', 'dalCombo.jpg'),
(211, 101, 'Veg Kolhapuri', 210, NULL, 'vegKolhapuri.jpg'),
(212, 101, 'Veg Toofani', 195, NULL, 'vegToofani.jpg'),
(213, 101, 'Kaju Curry ', 230, NULL, 'kajuCurry.jpg'),
(214, 102, 'Veg Manchurian', 190, 'Spicy Manchurian balls topped with seasonal veggies', 'vegManchurian.jpg'),
(215, 102, 'Hakka Noodles', 200, 'Authentic chinese noodles', 'hakkaNoodles.jpg'),
(216, 102, 'Momos', 80, 'Indian styled Momos', 'vegMomos.jpg'),
(217, 104, 'Idli Sambhar', 70, 'South Indian food at its best', 'idliSambar.jpg'),
(218, 104, 'Uttapam', 110, 'Uttapam topped with onions and cheese', 'vegUttapam.jpg'),
(219, 103, 'bruschetta', 250, NULL, 'bruschetta.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `o_detail_id` int(10) NOT NULL COMMENT 'This field will store Order  Details ID',
  `o_id` int(10) NOT NULL COMMENT 'This field will store Order ID corresponding to the Order Detail ID',
  `o_status` varchar(15) NOT NULL COMMENT 'This field will store Order Status',
  `o_qty` int(5) NOT NULL COMMENT 'This field will store Order Quantity',
  `f_id` int(10) NOT NULL COMMENT 'This field will store Food Item''s ID in the order',
  `pyt_id` int(5) NOT NULL COMMENT 'This field will store Payment Details for the Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`o_detail_id`, `o_id`, `o_status`, `o_qty`, `f_id`, `pyt_id`) VALUES
(502, 303, 'Delivered', 1, 206, 401),
(503, 305, 'Not Delivered', 3, 204, 409),
(504, 307, 'Delivered', 4, 205, 408),
(505, 309, 'Not Delivered', 2, 210, 401),
(506, 302, 'Not Delivered', 2, 202, 407),
(507, 310, 'Not Delivered', 1, 208, 409),
(508, 304, 'Delivered', 2, 207, 402),
(509, 306, 'Delivered', 3, 204, 406),
(510, 308, 'Delivered', 1, 203, 410);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_master`
--

CREATE TABLE `tbl_order_master` (
  `o_id` int(10) NOT NULL COMMENT 'This will store Order ID',
  `u_id` int(10) NOT NULL COMMENT 'This field stores User ID related with the Order',
  `o_date` date NOT NULL COMMENT 'This field will store Order Date',
  `o_amount` int(5) NOT NULL COMMENT 'This field will Store Order Amount'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order_master`
--

INSERT INTO `tbl_order_master` (`o_id`, `u_id`, `o_date`, `o_amount`) VALUES
(301, 122, '2021-03-23', 250),
(302, 120, '2021-02-27', 320),
(303, 117, '2021-01-10', 460),
(304, 123, '2020-12-31', 300),
(305, 119, '2021-01-10', 210),
(306, 118, '2021-02-27', 400),
(307, 123, '2021-03-14', 620),
(308, 121, '2021-02-05', 280),
(309, 122, '2021-01-30', 330),
(310, 120, '2021-02-22', 140);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pyt`
--

CREATE TABLE `tbl_pyt` (
  `pyt_id` int(5) NOT NULL COMMENT 'This field will store Order''s Payment ID',
  `o_id` int(10) NOT NULL COMMENT 'This field will store order ID for the corresponding Payment ID',
  `pyt_mode` varchar(10) NOT NULL COMMENT 'This Field will store Payment Mode',
  `pyt_date` date NOT NULL COMMENT 'This Field will store Payment Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pyt`
--

INSERT INTO `tbl_pyt` (`pyt_id`, `o_id`, `pyt_mode`, `pyt_date`) VALUES
(401, 303, 'Cod', '2021-01-30'),
(402, 309, 'online', '2020-12-31'),
(403, 306, 'online', '2021-01-05'),
(404, 301, 'Cod', '2021-01-28'),
(405, 307, 'online', '2021-03-23'),
(406, 310, 'online', '2021-02-27'),
(407, 302, 'Cod', '2021-02-27'),
(408, 304, 'Cod', '2021-03-14'),
(409, 305, 'online', '2021-02-22'),
(410, 308, 'Cod', '2021-02-05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `u_id` int(10) NOT NULL COMMENT 'UserID of the users will be stored here',
  `type_id` int(5) NOT NULL COMMENT 'User''s Type ID will be stored here',
  `u_name` varchar(25) NOT NULL COMMENT 'User''s Name will be stored here',
  `u_mobile_no` varchar(10) NOT NULL COMMENT 'User''s mobile number will be stored',
  `u_email` varchar(25) NOT NULL COMMENT 'User''s Email will be stored here',
  `u_address` varchar(150) NOT NULL COMMENT 'User''s address will be stored here',
  `u_dob` date NOT NULL COMMENT 'User''s date will be stored here',
  `u_password` varchar(10) NOT NULL COMMENT 'User''s Password will be stored here'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`u_id`, `type_id`, `u_name`, `u_mobile_no`, `u_email`, `u_address`, `u_dob`, `u_password`) VALUES
(111, 1, 'Ayush Sharma', '9865321470', 'ayush123@gmail.com', '5-6x, Dhanalaxmi Apt, L B S Marg, Manor Pada, Thane (w)\r\nMumbai(Mah) - 400601', '1994-08-13', 'Ayush123'),
(112, 2, 'Mahesh Doshi', '8543619724', 'mahesh1@gmail.com', 'Bapunagar Cross Road, Nr Diamond Market Vijay Chowk, Bapunagar\r\n\r\nAhmedabad, Gujarat, 380024', '1989-11-09', 'Mahesh1'),
(113, 2, 'Rakesh Nair', '9512348671', 'rakesh2@gmail.com', 'B-163/8, B-163/8, Navdeep House, Ashram Road\r\n\r\nAhmedabad, Gujarat, 380014', '1995-06-25', 'Rakesh2'),
(114, 2, 'Sunil Sahu', '9582134675', 'sunil3@gmail.com', '3, Navtar Gopal Society, Isanpur\r\nAhmedabad, Gujarat, 380008', '1985-01-30', 'sunil3'),
(115, 2, 'Tausif Khan', '9814700230', 'tausif4@gmail.com', 'A/2, Bhatt Brothers Estate, Nagarwel Hanuman Road, Nr. Vasant Estate, Amraiwadi\r\n\r\nAhmedabad, Gujarat, 380026', '1988-05-15', 'tausif4'),
(116, 2, 'Prakash Patel', '6859231474', 'prakash5@gmail.com', '13, Hiramoti Market, Jayhind Char Rasta, Maninagar\r\n\r\nAhmedabad, Gujarat, 382210', '1981-02-26', 'prakash5'),
(117, 3, 'Sahil mansuri', '9586231470', 'sahil01@gmail.com', '208 Peoples Plaza, Nr Memnagar Fire Station, Navrangpura\r\n\r\nAhmedabad, Gujarat, 380009', '2000-01-10', 'Sahil01'),
(118, 3, 'Sourav Agrawal', '9857641100', 'sourav02@gmail.com', '3, Surya Complex, C.g.road, Nr.swastik Char Rasta, Navrangpura\r\n\r\nAhmedabad, Gujarat, 380009', '2000-10-20', 'sourav02'),
(119, 3, 'Divyansh Jain', '9584712123', 'divyansh03@gmail.com', '16 1st Flr, 16 1st Floor, Royal Chambers, Gheekanta Crossing Road, Relief Road\r\n\r\nAhmedabad, Gujarat, 380001', '2000-08-18', 'Divyansh03'),
(120, 3, 'Preet Shah', '9563214545', 'preet04@gmail.com', '291, Bhikshukh Gruh, Odhav\r\n\r\nAhmedabad, Gujarat, 382415', '2002-09-05', 'Preet04'),
(121, 3, 'Deepali singh', '6598321475', 'deepali05@gmail.com', 'G-10, Anandnagar Road, Opp Sachin Tower, Satellite\r\n\r\nAhmedabad, Gujarat, 380015', '2004-08-29', 'Deepali05'),
(122, 3, 'Tejas Patel', '6235984177', 'tejas06@gmail.com', '41, New Prabhunagar Society, Asarwa\r\n\r\nAhmedabad, Gujarat, 380016', '2001-10-11', 'Tejas06@gm'),
(123, 3, 'Mayur Shrivastav', '8569326589', 'mayur07@gmail.com', '301/b, 7 Vedant, Kalpana Colony, Navrangpura\r\n\r\nAhmedabad, Gujarat, 380009', '1998-12-25', 'Mayur07'),
(124, 3, 'Mayank Jain', '8965471114', 'mayank08@gmail.com', '501, New York Plaza, Judges Bunglow, Premchand Nagaro Road\r\n\r\nAhmedabad, Gujarat, 380015', '1999-03-06', 'Mayank08'),
(125, 3, 'Harshal Sharma', '8947114701', 'harshal09@gmail.com', '78, Gopinath Estaste-1, Nh No 8, S;s Chawl, Odhav\r\n\r\nAhmedabad, Gujarat, 382415', '2001-12-17', 'Harshal09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_type`
--

CREATE TABLE `tbl_user_type` (
  `type_id` int(5) NOT NULL COMMENT 'Type ID for users will be stored here',
  `type_name` varchar(20) NOT NULL COMMENT 'Type Name related to the user will be stored here'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_type`
--

INSERT INTO `tbl_user_type` (`type_id`, `type_name`) VALUES
(1, 'Admin'),
(2, 'Restaurant'),
(3, 'user');

-- --------------------------------------------------------

--
-- Structure for view `delivery report`
--
DROP TABLE IF EXISTS `delivery report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `delivery report`  AS SELECT `tbl_delivery`.`d_status` AS `d_status`, `tbl_order_master`.`o_date` AS `o_date`, `tbl_delivery`.`d_address` AS `d_address`, `tbl_user`.`u_name` AS `u_name`, `tbl_user_type`.`type_name` AS `type_name`, `tbl_delivery`.`d_id` AS `d_id`, `tbl_delivery`.`o_id` AS `o_id`, `tbl_user`.`u_id` AS `u_id` FROM (((`tbl_delivery` join `tbl_order_master` on(`tbl_order_master`.`o_id` = `tbl_delivery`.`o_id`)) join `tbl_user` on(`tbl_user`.`u_id` = `tbl_order_master`.`u_id`)) join `tbl_user_type` on(`tbl_user_type`.`type_id` = `tbl_user`.`type_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `feedback reports`
--
DROP TABLE IF EXISTS `feedback reports`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `feedback reports`  AS SELECT `tbl_feedbacks`.`u_id` AS `u_id`, `tbl_feedbacks`.`fd_details` AS `fd_details`, `tbl_feedbacks`.`fd_date` AS `fd_date`, `tbl_user`.`u_name` AS `u_name`, `tbl_user`.`u_email` AS `u_email`, `tbl_feedbacks`.`fd_id` AS `fd_id` FROM (`tbl_feedbacks` join `tbl_user` on(`tbl_user`.`u_id` = `tbl_feedbacks`.`u_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `food items report`
--
DROP TABLE IF EXISTS `food items report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `food items report`  AS SELECT `tbl_food_items`.`f_id` AS `f_id`, `tbl_food_items`.`f_name` AS `f_name`, `tbl_food_items`.`f_price` AS `f_price`, `tbl_category`.`category_name` AS `category_name` FROM (`tbl_category` join `tbl_food_items` on(`tbl_category`.`category_id` = `tbl_food_items`.`f_category_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `orders report`
--
DROP TABLE IF EXISTS `orders report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders report`  AS SELECT `tbl_user`.`u_id` AS `u_id`, `tbl_user`.`u_name` AS `u_name`, `tbl_user`.`u_mobile_no` AS `u_mobile_no`, `tbl_user`.`u_address` AS `u_address`, `tbl_order_master`.`o_id` AS `o_id`, `tbl_order_master`.`o_date` AS `o_date`, `tbl_order_master`.`o_amount` AS `o_amount`, `tbl_order_details`.`o_qty` AS `o_qty`, `tbl_food_items`.`f_name` AS `f_name`, `tbl_food_items`.`f_price` AS `f_price`, `tbl_pyt`.`pyt_mode` AS `pyt_mode`, `tbl_pyt`.`pyt_date` AS `pyt_date` FROM ((((`tbl_order_master` join `tbl_user` on(`tbl_user`.`u_id` = `tbl_order_master`.`u_id`)) join `tbl_order_details` on(`tbl_order_master`.`o_id` = `tbl_order_details`.`o_id`)) join `tbl_food_items` on(`tbl_food_items`.`f_id` = `tbl_order_details`.`f_id`)) join `tbl_pyt` on(`tbl_pyt`.`pyt_id` = `tbl_order_details`.`pyt_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `payment reports`
--
DROP TABLE IF EXISTS `payment reports`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `payment reports`  AS SELECT `tbl_order_master`.`o_id` AS `o_id`, `tbl_pyt`.`pyt_id` AS `pyt_id`, `tbl_pyt`.`o_id` AS `o_id1`, `tbl_pyt`.`pyt_mode` AS `pyt_mode`, `tbl_pyt`.`pyt_date` AS `pyt_date`, `tbl_user`.`u_name` AS `u_name`, `tbl_user`.`u_mobile_no` AS `u_mobile_no`, `tbl_order_master`.`o_date` AS `o_date`, `tbl_order_master`.`o_amount` AS `o_amount` FROM ((`tbl_pyt` join `tbl_order_master` on(`tbl_order_master`.`o_id` = `tbl_pyt`.`o_id`)) join `tbl_user` on(`tbl_order_master`.`u_id` = `tbl_user`.`u_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `tbl_delivery`
--
ALTER TABLE `tbl_delivery`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `tbl_feedbacks`
--
ALTER TABLE `tbl_feedbacks`
  ADD PRIMARY KEY (`fd_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `tbl_food_items`
--
ALTER TABLE `tbl_food_items`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `f_category_id` (`f_category_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`o_detail_id`),
  ADD KEY `o_id` (`o_id`),
  ADD KEY `f_id` (`f_id`),
  ADD KEY `pyt_id` (`pyt_id`);

--
-- Indexes for table `tbl_order_master`
--
ALTER TABLE `tbl_order_master`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `tbl_pyt`
--
ALTER TABLE `tbl_pyt`
  ADD PRIMARY KEY (`pyt_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `u_mobile_no` (`u_mobile_no`),
  ADD UNIQUE KEY `u_email` (`u_email`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `tbl_user_type`
--
ALTER TABLE `tbl_user_type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_delivery`
--
ALTER TABLE `tbl_delivery`
  MODIFY `d_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'This field will store Delivery ID', AUTO_INCREMENT=511;

--
-- AUTO_INCREMENT for table `tbl_feedbacks`
--
ALTER TABLE `tbl_feedbacks`
  MODIFY `fd_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'This field will store Feedback ID', AUTO_INCREMENT=611;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `o_detail_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'This field will store Order  Details ID', AUTO_INCREMENT=511;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_delivery`
--
ALTER TABLE `tbl_delivery`
  ADD CONSTRAINT `tbl_delivery_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `tbl_order_master` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_feedbacks`
--
ALTER TABLE `tbl_feedbacks`
  ADD CONSTRAINT `tbl_feedbacks_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_food_items`
--
ALTER TABLE `tbl_food_items`
  ADD CONSTRAINT `tbl_food_items_ibfk_1` FOREIGN KEY (`f_category_id`) REFERENCES `tbl_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD CONSTRAINT `tbl_order_details_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `tbl_order_master` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_details_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `tbl_food_items` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_details_ibfk_3` FOREIGN KEY (`pyt_id`) REFERENCES `tbl_pyt` (`pyt_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_order_master`
--
ALTER TABLE `tbl_order_master`
  ADD CONSTRAINT `tbl_order_master_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pyt`
--
ALTER TABLE `tbl_pyt`
  ADD CONSTRAINT `tbl_pyt_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `tbl_order_master` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tbl_user_type` (`type_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
