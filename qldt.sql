CREATE DATABASE qldt;
USE qldt;

CREATE TABLE `classroom` (
  `id` int(11) NOT NULL,
  `teaching_id` int(11) NOT NULL,
  `classroom_name` varchar(128) NOT NULL,
  `room_code` varchar(64) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `num_of_student_max` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classroom`
--

INSERT INTO `classroom` (`id`, `teaching_id`, `classroom_name`, `room_code`, `start_time`, `end_time`, `num_of_student_max`) VALUES
(1, 1, '1', '101-G2', '07:00:00', '11:00:00', 50),
(2, 13, '2', '107-G2', '13:00:00', '17:00:00', 50),
(3, 2, '3', '103-G2', '13:00:00', '17:00:00', 30),
(4, 14, '4', '301-GĐ2', '13:00:00', '17:00:00', 30),
(5, 15, '5', '308-GĐ2', '13:00:00', '17:00:00', 30),
(6, 16, '6', '101-GĐ3', '07:00:00', '11:00:00', 35),
(7, 17, '7', '103-GĐ3', '07:00:00', '11:00:00', 40);

-- --------------------------------------------------------

--
-- Table structure for table `point`
--

CREATE TABLE `point` (
  `id` int(11) NOT NULL,
  `study_id` int(11) NOT NULL,
  `point_type` varchar(8) NOT NULL,
  `point` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `point`
--

INSERT INTO `point` (`id`, `study_id`, `point_type`, `point`) VALUES
(1, 1, 'GK', '8.50'),
(3, 1, 'CK', '7.25'),
(4, 2, 'GK', '6.00'),
(6, 2, 'CK', '9.00'),
(7, 3, 'GK', '5.00'),
(9, 3, 'CK', '7.00'),
(10, 4, 'GK', '8.50'),
(12, 4, 'CK', '7.25'),
(13, 5, 'GK', '6.00'),
(15, 5, 'CK', '9.00'),
(16, 6, 'GK', '5.00'),
(18, 6, 'CK', '7.00'),
(23, 13, 'GK', '5.50'),
(24, 13, 'CK', '8.50');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `training_institute_code` varchar(32) NOT NULL,
  `training_majors_code` varchar(32) NOT NULL,
  `training_system_code` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--
INSERT INTO `profile` (`id`, `user_id`, `training_institute_code`, `training_majors_code`, `training_system_code`) VALUES
(1, 4, 'FIT', 'CN1', 'CQ'),
(2, 5, 'FIT', 'CN8', 'CLC'),
(3, 8, 'FET', 'CN9', 'CLC'),
(4, 9, 'FIT', 'CN14', 'CLC'),
(5, 10, 'FET', 'CN2', 'CQ');


-- --------------------------------------------------------

--
-- Table structure for table `studying`
--

CREATE TABLE `studying` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_code` varchar(32) NOT NULL,
  `classroom_id` int(11) NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'register',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `studying`
--

INSERT INTO `studying` (`id`, `student_id`, `subject_code`, `classroom_id`, `status`, `start_date`, `end_date`) VALUES
(1, 4, 'PHI1006', 2, 'studying', NULL, NULL),
(2, 4, 'PEC1008', 4, 'studying', NULL, NULL),
(3, 4, 'PHI1002', 5, 'studying', NULL, NULL),
(4, 5, 'HIS1001', 2, 'studying', NULL, NULL),
(5, 5, 'POL1001', 4, 'studying', NULL, NULL),
(6, 5, 'FLF1107', 5, 'studying', NULL, NULL),
(7, 6, 'MAT1093', 2, 'studying', NULL, NULL),
(8, 6, 'MAT1041', 4, 'studying', NULL, NULL),
(9, 6, 'MAT1042', 5, 'studying', NULL, NULL),
(10, 7, 'EPN1095', 2, 'studying', NULL, NULL),
(11, 7, 'EPN1096', 4, 'studying', NULL, NULL),
(12, 7, 'INT1007', 5, 'studying', NULL, NULL),
(13, 5, 'INT1008', 1, 'register', NULL, NULL),
(14, 4, 'ELT2035', 1, 'register', NULL, NULL),
(15, 4, 'INT2210', 3, 'register', NULL, NULL),
(16, 5, 'ELT2029', 3, 'register', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `training_majors_code` varchar(32) NOT NULL,
  `training_system_code` varchar(32) NOT NULL,
  `subject_code` varchar(32) NOT NULL,
  `subject_name` varchar(128) NOT NULL,
  `num_of_credit` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `training_majors_code`, `training_system_code`, `subject_code`, `subject_name`, `num_of_credit`) VALUES
(1, 'CN1', 'CQ', 'PHI1006', 'Triết học Mác – Lênin', 3),
(2, 'CN1', 'CQ', 'PEC1008', 'Kinh tế chính trị Mác – Lênin', 2),
(3, 'CN1', 'CQ', 'PHI1002', 'Chủ nghĩa xã hội khoa học', 2),
(4, 'CN1', 'CQ', 'HIS1001', 'Lịch sử Đảng Cộng sản Việt Nam', 2),
(5, 'CN1', 'CQ', 'POL1001', 'Tư tưởng Hồ Chí Minh', 2),
(6, 'CN1', 'CQ', 'FLF1107', 'Tiếng Anh B1', 5),
(7, 'CN1', 'CQ', 'MAT1093', 'Đại số', 4),
(8, 'CN1', 'CQ', 'MAT1041', 'Giải tích 1', 4),
(9, 'CN1', 'CQ', 'MAT1042', 'Giải tích 2', 4),
(10, 'CN1', 'CQ', 'EPN1095', 'Vật lý đại cương 1', 2),
(11, 'CN1', 'CQ', 'EPN1096', 'Vật lý đại cương 2', 2),
(12, 'CN1', 'CQ', 'INT1007', 'Giới thiệu về Công nghệ thông tin', 3),
(13, 'CN1', 'CQ', 'INT1008', 'Nhập môn lập trình', 3),
(14, 'CN1', 'CQ', 'ELT2035', 'Tín hiệu và hệ thống', 3),
(15, 'CN1', 'CQ', 'INT2210', 'Cấu trúc dữ liệu và giải thuật', 4),
(16, 'CN1', 'CQ', 'ELT2029', 'Xác suất thống kê', 3),
(17, 'CN1', 'CQ', 'INT2215', 'Lập trình nâng cao', 4),
(18, 'CN1', 'CQ', 'INT1050', 'Toán học rời rạc', 4),
(19, 'CN1', 'CQ', 'INT2212', 'Kiến trúc máy tính', 4),
(20, 'CN1', 'CQ', 'INT2214', 'Nguyên lý hệ điều hành', 4),
(21, 'CN1', 'CQ', 'INT2211', 'Cơ sở dữ liệu', 4),
(22, 'CN1', 'CQ', 'INT2213', 'Mạng máy tính', 4),
(23, 'CN1', 'CQ', 'INT2208', 'Công nghệ phần mềm', 3),
(24, 'CN1', 'CQ', 'INT2204', 'Lập trình hướng đối tượng', 3),

(25, 'CN8', 'CLC', 'PHY1100', 'Cơ – Nhiệt', 3),
(26, 'CN8', 'CLC', 'PHY1103', 'Điện và Quang', 3),
(27, 'CN8', 'CLC', 'INT3402', 'Chương trình dịch', 3),
(28, 'CN8', 'CLC', 'INT3404', 'Xử lý ảnh', 3),
(29, 'CN8', 'CLC', 'INT3405', 'Học máy', 3),
(30, 'CN8', 'CLC', 'INT3406', 'Xử lý ngôn ngữ tự nhiên', 3),
(31, 'CN8', 'CLC', 'INT3407', 'Tin sinh học', 3);

-- --------------------------------------------------------

--
-- Table structure for table `teaching`
--

CREATE TABLE `teaching` (
  `id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `subject_code` varchar(32) NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'inprogress'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teaching`
--

INSERT INTO `teaching` (`id`, `lecturer_id`, `subject_code`, `status`) VALUES
(1, 8, 'PHI1006', 'inprogress'),
(2, 8, 'PEC1008', 'inprogress'),
(3, 8, 'PHI1002', 'inprogress'),
(4, 10, 'HIS1001', 'inprogress'),
(5, 10, 'POL1001', 'inprogress'),
(6, 10, 'FLF1107', 'inprogress'),
(7, 10, 'MAT1093', 'inprogress'),
(8, 10, 'MAT1041', 'inprogress'),
(9, 10, 'MAT1042', 'inprogress'),
(10, 9, 'EPN1095', 'inprogress'),
(11, 9, 'EPN1096', 'inprogress'),
(12, 9, 'INT1007', 'inprogress'),
(13, 9, 'INT1008', 'finished'),
(14, 9, 'ELT2035', 'finished'),
(15, 9, 'INT2210', 'finished'),
(16, 9, 'ELT2029', 'inprogress'),
(17, 9, 'INT2215', 'inprogress');

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table `training_institute`
--

CREATE TABLE `training_institute` (
  `id` int(11) NOT NULL,
  `training_institute_code` varchar(32) NOT NULL,
  `training_institute_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `training_institute`
--

INSERT INTO `training_institute` (`id`, `training_institute_code`, `training_institute_name`) VALUES
(1, 'FIT', 'Khoa Công nghệ thông tin'),
(2, 'FET', 'Khoa Điện tử viễn thông'),
(3, 'FEPN', ' Khoa Vật lý kỹ thuật & Công nghệ Nano'),
(4, 'FEMA', 'Khoa Cơ học kỹ thụât & Tự động hoá'),
(5, 'FAT', 'Khoa Công nghệ Nông nghiệp'),
(6, 'CTE', 'Khoa Công nghệ Xây dựng – Giao thông'),
(7, 'SAE', 'Viện Công nghệ Hàng không Vũ trụ'),
(8, 'AVITECH', 'Viện Tiên tiến về Kỹ thuật và Công nghệ'),
(9, 'IAI', 'Viện Trí tuệ Nhân tạo');

--
-- Table structure for table `training_majors`
--

CREATE TABLE `training_majors` (
  `id` int(11) NOT NULL,
  `training_institute_code` varchar(32) NOT NULL,
  `training_system_code` varchar(32) NOT NULL,
  `training_majors_code` varchar(32) NOT NULL,
  `training_majors_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `training_majors`
--

INSERT INTO `training_majors` (`id`, `training_institute_code`, `training_system_code`, `training_majors_code`, `training_majors_name`) VALUES
(1, 'FIT', 'CQ', 'CN1', 'Công nghệ thông tin'),
(2, 'FET', 'CLC', 'CN2', 'Máy tính và Robot'),
(3, 'FEPN', 'CQ', 'CN3', 'Vật lý kỹ thuật'),
(4, 'FEMA', 'CQ', 'CN11', 'Kỹ thuật điều khiển và tự động hóa'),
(5, 'IAI', 'CLC', 'CN12', 'Trí tuệ nhân tạo'),
(6, 'FIT', 'CLC', 'CN8', 'Khoa học Máy tính'),
(7, 'FIT', 'CLC', 'CN14', 'Hệ thống thông tin'),
(8, 'FIT', 'CLC', 'CN15', 'Mạng máy tính và truyền thông dữ liệu'),
(9, 'FET', 'CLC', 'CN9', 'Công nghệ kỹ thuật điện tử – viễn thông');


-- --------------------------------------------------------

--
-- Table structure for table `training_system`
--

CREATE TABLE `training_system` (
  `id` int(11) NOT NULL,
  `training_system_code` varchar(32) NOT NULL,
  `training_system_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `training_system`
--

INSERT INTO `training_system` (`id`, `training_system_code`, `training_system_name`) VALUES
(1, 'CQ', 'Chính quy'),
(2, 'CLC', 'Chất lượng cao');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `user_type` varchar(32) NOT NULL,
  `user_code` varchar(32) DEFAULT NULL,
  `fullname` varchar(128) NOT NULL,
  `dob` date NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `user_type`, `user_code`, `fullname`, `dob`, `phone_number`, `email`, `address`, `status`) VALUES
(1, 'admin', '123123', 'admin', NULL, 'Admin', '1990-10-25', '0329435127', 'admin@gmail.com', 'Hà Nội', 'active'),
(4, '21020411', '123456', 'student', '21020411', 'Nguyễn Thị Thanh Thuỷ', '2003-01-05', '0326813947', 'example2.test@gmail.com', 'Hai Bà Trưng, Hà Nội', 'active'),
(5, '21020272', '123456', 'student', '21020272', 'Cao Thị Phương Anh', '2003-11-26', '0912345678', 'example3.test@gmail.com', 'Hà Nội', 'active'),
(6, '21205064', '123456', 'student', '21205064', 'Tạ Khánh Phương', '2003-07-16', '0372002727', 'example4.test@gmail.com', 'Thị trấn Văng Giang,Hưng Yên', 'active'),
(7, '21205057', '123456', 'student', '21205057', 'Lê Văn Bảo', '2003-10-29', '0374042972', 'example5.test@gmail.com', 'Thường Tín, Hà Nội', 'active'),
(8, 'tuannm', 'tuannm', 'lecturer', 'tuannm', 'Nguyễn Minh Tuấn', '1983-12-10', '0988888888', 'example6.test@gmail.com', 'Hà Nội', 'active'),
(9, 'tiennd', 'tiennd', 'lecturer', 'tiennd', 'Nguyễn Đức Tiến', '1982-07-30', '0911111111', 'example7.test@gmail.com', 'Hà Nội', 'active'),
(10, 'quangnh', 'quangnh', 'lecturer', 'quangnh', 'Nguyễn Hồng Quang', '1977-01-12', '0911111111', 'example8.test@gmail.com', 'Hà Nội', 'active'),
(11, 'ACC', '123456', 'lecturer', '001', 'Acc', '1986-05-01', '54364', 'fxdgsx@sdf.sfd', 'âfsafda', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `point`
--
ALTER TABLE `point`
  ADD PRIMARY KEY (`id`);



--
-- Indexes for table `studying`
--
ALTER TABLE `studying`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teaching`
--
ALTER TABLE `teaching`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training_majors`
--
ALTER TABLE `training_majors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training_system`
--
ALTER TABLE `training_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

--
-- AUTO_INCREMENT for table `classroom`
--
ALTER TABLE `classroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `point`
--
ALTER TABLE `point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `studying`
--
ALTER TABLE `studying`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `teaching`
--
ALTER TABLE `teaching`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Indexes for table `training_institute`
--
ALTER TABLE `training_institute`
  ADD PRIMARY KEY (`id`);


--
-- AUTO_INCREMENT for table `training_majors`
--
ALTER TABLE `training_majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `training_system`
--
ALTER TABLE `training_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

CREATE INDEX idx_icode
ON training_institute (training_institute_code);
ALTER TABLE `training_majors`
ADD FOREIGN KEY (training_institute_code) REFERENCES training_institute(training_institute_code);

ALTER TABLE `profile`
ADD FOREIGN KEY (training_institute_code) REFERENCES training_institute(training_institute_code);

ALTER TABLE `profile`
ADD FOREIGN KEY (user_id) REFERENCES user(id);

CREATE INDEX idx_tcode
ON training_majors (training_majors_code);
ALTER TABLE `subject`
ADD FOREIGN KEY (training_majors_code) REFERENCES training_majors(training_majors_code);

CREATE INDEX idx_tscode
ON training_system (training_system_code);
ALTER TABLE `subject`
ADD FOREIGN KEY (training_system_code) REFERENCES training_system(training_system_code);

ALTER TABLE `training_majors`
ADD FOREIGN KEY (training_system_code) REFERENCES training_system(training_system_code);

ALTER TABLE `user`
ADD FOREIGN KEY (id) REFERENCES studying(id);

CREATE INDEX idx_sjcode
ON subject (subject_code);
ALTER TABLE `studying`
ADD FOREIGN KEY (subject_code) REFERENCES subject(subject_code);

ALTER TABLE `studying`
ADD FOREIGN KEY (classroom_id) REFERENCES classroom(id);

ALTER TABLE `user`
ADD FOREIGN KEY (id) REFERENCES teaching(id);

ALTER TABLE `point`
ADD FOREIGN KEY (study_id) REFERENCES studying(id);

ALTER TABLE `classroom`
ADD FOREIGN KEY (teaching_id) REFERENCES teaching(id);