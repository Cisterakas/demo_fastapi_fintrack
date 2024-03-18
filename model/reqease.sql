-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 03:24 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reqease`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_approval`
--

CREATE TABLE `account_approval` (
  `approval_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `approval_date` date NOT NULL,
  `approved` varchar(10) DEFAULT 'FALSE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_approval`
--

INSERT INTO `account_approval` (`approval_id`, `user_id`, `approval_date`, `approved`) VALUES
(1, 1, '2023-12-25', 'TRUE'),
(2, 2, '2023-12-26', 'TRUE'),
(3, 3, '2023-12-28', 'TRUE'),
(4, 4, '2023-12-29', 'TRUE');

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `user_id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`user_id`, `role`) VALUES
(1, 'Registrar'),
(3, 'Developer');

-- --------------------------------------------------------

--
-- Table structure for table `admin_approval`
--

CREATE TABLE `admin_approval` (
  `admin_approval_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `approval_date` date DEFAULT NULL,
  `approved` varchar(20) DEFAULT 'To be approved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_approval`
--

INSERT INTO `admin_approval` (`admin_approval_id`, `request_id`, `admin_id`, `approval_date`, `approved`) VALUES
(1, 1, 1, '2023-12-29', 'TRUE'),
(2, 2, 3, '2023-12-28', 'TRUE'),
(3, 3, 1, '2023-12-29', 'TRUE');

-- --------------------------------------------------------

--
-- Table structure for table `claiming_information`
--

CREATE TABLE `claiming_information` (
  `claiming_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `mode_of_claiming` varchar(50) NOT NULL,
  `claiming_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `claiming_information`
--

INSERT INTO `claiming_information` (`claiming_id`, `request_id`, `mode_of_claiming`, `claiming_date`) VALUES
(1, 1, 'Pick-up', '2023-12-30'),
(2, 2, 'Courier', '2024-01-01'),
(3, 3, 'Email', '2024-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `courier_information`
--

CREATE TABLE `courier_information` (
  `courier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `province` text NOT NULL,
  `municipality` text NOT NULL,
  `barangay` text NOT NULL,
  `present_address` text NOT NULL,
  `delivery_contact` varchar(20) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courier_information`
--

INSERT INTO `courier_information` (`courier_id`, `user_id`, `request_id`, `province`, `municipality`, `barangay`, `present_address`, `delivery_contact`, `email`) VALUES
(1, 2, 1, 'Davao del Sur', 'Davao City', 'Sample Barangay', 'Sample Address', '09123456789', 'sample@email.com'),
(2, 4, 2, 'South Korea', 'Busan', 'Bangkerohan', 'Davao City', '09292929292', 'winter@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `document_request`
--

CREATE TABLE `document_request` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `id_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_request`
--

INSERT INTO `document_request` (`request_id`, `user_id`, `request_date`, `status`, `id_link`) VALUES
(1, 2, '2023-12-27', 'Received', '<sample_link>'),
(2, 4, '2023-12-27', 'Received', '<sample_link>'),
(3, 2, '2024-01-02', 'Received', '<sample_link>');

-- --------------------------------------------------------

--
-- Table structure for table `document_request_item`
--

CREATE TABLE `document_request_item` (
  `item_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_request_item`
--

INSERT INTO `document_request_item` (`item_id`, `request_id`, `document_type_id`, `quantity`) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 1, 7, 3),
(4, 2, 11, 2),
(5, 2, 16, 1),
(6, 3, 20, 10);

-- --------------------------------------------------------

--
-- Table structure for table `document_transaction`
--

CREATE TABLE `document_transaction` (
  `transaction_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_transaction`
--

INSERT INTO `document_transaction` (`transaction_id`, `request_id`, `payment_date`) VALUES
(1, 1, '2023-12-28'),
(2, 2, '2023-12-28'),
(3, 3, '2023-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
  `document_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `unit_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`document_type_id`, `name`, `fee`, `unit_name`) VALUES
(1, 'Authentication', 30.00, 'page'),
(2, 'CAV or Certificate, Authentication, Verification (Local / DFA)', 370.00, 'set'),
(3, 'Certificate of English as Medium of Instruction', 60.00, 'copy'),
(4, 'Certificate of Enrollment', 60.00, 'copy'),
(5, 'Certificate of General WeightedAverage (GWA)', 60.00, 'copy'),
(6, 'Certificate of Government Recognition of the Program', 60.00, 'copy'),
(7, 'Certificate of Grades', 60.00, 'copy'),
(8, 'Certificate of Grades for Written Comprehensive Examination', 60.00, 'copy'),
(9, 'Certificate of Grading System', 60.00, 'copy'),
(10, 'Certificate of Graduation / Degree Completion', 60.00, 'copy'),
(11, 'Certificate of Latin Honor', 60.00, 'copy'),
(12, 'Certificate of Units Earned', 60.00, 'copy'),
(13, 'Certificate True Copy of Special Order (5.0)', 50.00, 'copy'),
(14, 'Certificate of Academic Requirements (CAR)', 60.00, 'copy'),
(15, 'Course Description', 60.00, 'copy'),
(16, 'Diploma', 400.00, 'copy'),
(17, 'Diploma (Second Copy)', 400.00, 'copy'),
(18, 'Honorable Dismissal', 300.00, 'set'),
(19, 'Letter of No Objection', 60.00, 'copy'),
(20, 'Official Transcript of Records', 250.00, 'set'),
(21, 'Related Learning Experience (RLE)', 150.00, 'copy');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `user_id` int(11) NOT NULL,
  `student_school_id` varchar(50) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `address` text NOT NULL,
  `degree` varchar(255) NOT NULL,
  `last_school_year` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`user_id`, `student_school_id`, `contact`, `address`, `degree`, `last_school_year`) VALUES
(2, '220000001482', '09606857736', 'Davao City, Philippines', 'Civil Engineering', '2022-2023'),
(4, '230000008877', '09223242526', 'Seoul, South Korea', 'Arts and Humanities', '2018-2019');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registration_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `middle_name`, `last_name`, `suffix`, `email`, `password`, `registration_date`) VALUES
(1, 'Juvenile Christen', 'Lanticse', 'Bajo', NULL, 'jbajo_220000001294@uic.edu.ph', 'password123', '2023-12-24'),
(2, 'Joshua', 'Mipaña', 'Cister', NULL, 'jcister_220000001482@uic.edu.ph', 'securepass', '2023-12-24'),
(3, 'Jungkook', NULL, 'Jeon', NULL, 'samyang@gmail.com', 'ilovecheese', '2023-12-27'),
(4, 'Min-jeong', NULL, 'Kim', NULL, 'winter@gmail.com', 'ilovesnow', '2023-12-27');

-- --------------------------------------------------------

--
-- Table structure for table `user_feedback`
--

CREATE TABLE `user_feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `feedback_text` text DEFAULT NULL,
  `feedback_rating` int(11) DEFAULT NULL,
  `feedback_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_feedback`
--

INSERT INTO `user_feedback` (`feedback_id`, `user_id`, `request_id`, `feedback_text`, `feedback_rating`, `feedback_date`) VALUES
(1, 2, 1, 'Great service!', 5, '2023-12-30'),
(2, 4, 2, 'Very covenient!', 5, '2023-12-31'),
(3, 2, 3, 'Good', 4, '2024-01-12');

-- --------------------------------------------------------

--
-- Table structure for table `user_transaction_history`
--

CREATE TABLE `user_transaction_history` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `total_amount_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `receipt_link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_transaction_history`
--

INSERT INTO `user_transaction_history` (`transaction_id`, `user_id`, `request_id`, `total_amount_paid`, `receipt_link`) VALUES
(1, 2, 1, 300.00, '<receipt_link>'),
(2, 4, 2, 520.00, '<receipt_link>'),
(3, 2, 3, 2500.00, '<receipt_link>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_approval`
--
ALTER TABLE `account_approval`
  ADD PRIMARY KEY (`approval_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `admin_approval`
--
ALTER TABLE `admin_approval`
  ADD PRIMARY KEY (`admin_approval_id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `claiming_information`
--
ALTER TABLE `claiming_information`
  ADD PRIMARY KEY (`claiming_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `courier_information`
--
ALTER TABLE `courier_information`
  ADD PRIMARY KEY (`courier_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `document_request`
--
ALTER TABLE `document_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `document_request_item`
--
ALTER TABLE `document_request_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `document_type_id` (`document_type_id`);

--
-- Indexes for table `document_transaction`
--
ALTER TABLE `document_transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`document_type_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_feedback`
--
ALTER TABLE `user_feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `user_transaction_history`
--
ALTER TABLE `user_transaction_history`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `request_id` (`request_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_approval`
--
ALTER TABLE `account_approval`
  MODIFY `approval_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_approval`
--
ALTER TABLE `admin_approval`
  MODIFY `admin_approval_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `claiming_information`
--
ALTER TABLE `claiming_information`
  MODIFY `claiming_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `courier_information`
--
ALTER TABLE `courier_information`
  MODIFY `courier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `document_request`
--
ALTER TABLE `document_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `document_request_item`
--
ALTER TABLE `document_request_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `document_transaction`
--
ALTER TABLE `document_transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `document_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_feedback`
--
ALTER TABLE `user_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_transaction_history`
--
ALTER TABLE `user_transaction_history`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_approval`
--
ALTER TABLE `account_approval`
  ADD CONSTRAINT `account_approval_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `admin_approval`
--
ALTER TABLE `admin_approval`
  ADD CONSTRAINT `admin_approval_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `document_request` (`request_id`),
  ADD CONSTRAINT `admin_approval_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `claiming_information`
--
ALTER TABLE `claiming_information`
  ADD CONSTRAINT `claiming_information_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `document_request` (`request_id`);

--
-- Constraints for table `courier_information`
--
ALTER TABLE `courier_information`
  ADD CONSTRAINT `courier_information_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `courier_information_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `document_request` (`request_id`);

--
-- Constraints for table `document_request`
--
ALTER TABLE `document_request`
  ADD CONSTRAINT `document_request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `document_request_item`
--
ALTER TABLE `document_request_item`
  ADD CONSTRAINT `document_request_item_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `document_request` (`request_id`),
  ADD CONSTRAINT `document_request_item_ibfk_2` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`document_type_id`);

--
-- Constraints for table `document_transaction`
--
ALTER TABLE `document_transaction`
  ADD CONSTRAINT `document_transaction_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `document_request` (`request_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user_feedback`
--
ALTER TABLE `user_feedback`
  ADD CONSTRAINT `user_feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `user_feedback_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `document_request` (`request_id`);

--
-- Constraints for table `user_transaction_history`
--
ALTER TABLE `user_transaction_history`
  ADD CONSTRAINT `user_transaction_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `user_transaction_history_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `document_request` (`request_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
