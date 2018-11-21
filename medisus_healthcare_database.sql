-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: medisus_healthcare_database
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `serial_no` varchar(20) NOT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `doctor_id` varchar(20) DEFAULT NULL,
  `date` varchar(12) DEFAULT NULL,
  `time` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`serial_no`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES ('SL001','P004','D0104001','12-12-2016','09:00 AM'),('SL002','P006','D0104002','01-03-2017','10:00 AM'),('SL003','P008','D0109012','05-04-2017','09:30 PM'),('SL004','P009','D0104002','01-02-2017','10:30 AM'),('SL005','P010','D0108007','11-06-2017','03:00 PM'),('SL006','P012','D0104001','01-03-2017','09:30 AM'),('SL007','P001','D0104001','01-04-2017','10:00 AM'),('SL008','P007','D0104002','06-05-2017','11:00 AM'),('SL009','P011','D0103001','14-04-2017','04:00 PM'),('SL010','P013','D0107005','25-06-2017','10:00 AM');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `bill_code` varchar(20) NOT NULL,
  `numberofdays` int(20) DEFAULT NULL,
  `medicine_charge` int(100) DEFAULT NULL,
  `equipment_charge` int(100) DEFAULT NULL,
  `treatment_charge` int(100) DEFAULT NULL,
  `room_charge` int(100) DEFAULT NULL,
  `nursing_charge` int(100) DEFAULT NULL,
  `lab_charge` int(100) DEFAULT NULL,
  `doctor_charge` int(100) DEFAULT NULL,
  `advance_payment` int(100) DEFAULT NULL,
  `health_card` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('BILL01',7,3500,200,200000,4000,2000,800,1000,0,'Yes'),('BILL02',6,2500,300,400000,2000,1000,300,1000,0,'Yes'),('BILL03',2,3000,800,2000000,2300,800,500,1000,0,'Yes'),('BILL04',5,4500,100,100000,3400,600,1200,1000,0,'Yes'),('BILL05',17,9500,300,800000,1900,3200,700,1000,0,'Yes'),('BILL06',12,20500,600,1000000,8900,4300,800,1000,0,'Yes'),('BILL07',15,3500,100,270000,6700,1800,1500,1000,0,'Yes'),('BILL08',3,400,1000,40000,900,900,800,1000,0,'Yes'),('BILL09',19,1500,1200,270000,2200,2000,900,1000,0,'Yes'),('BILL10',21,10500,700,199000,2100,2000,750,1000,0,'Yes'),('BILL11',6,4500,900,98000,1200,1600,1300,1000,0,'Yes'),('BILL12',7,3200,300,130000,4000,800,200,1000,0,'Yes'),('BILL13',11,3200,300,13000,6000,500,200,1000,0,'Yes');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_name` varchar(30) NOT NULL,
  `location` varchar(20) DEFAULT NULL,
  `building` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`department_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Cardiology Dept.','3rd Floor','2nd'),('Gynecology Dept.','5th Floor','2nd'),('Medicine Dept.','1st Floor','1st'),('Neurology Dept.','4th Floor','1st'),('Orthopedic Dept.','6th Floor','1st'),('Surgery Dept.','2nd Floor','2nd');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosis` (
  `diagnosis_no` varchar(20) NOT NULL,
  `doctor_id` varchar(20) DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  `date` varchar(12) DEFAULT NULL,
  `reference` varchar(30) DEFAULT NULL,
  `catagory` varchar(20) DEFAULT NULL,
  `visit` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`diagnosis_no`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES ('DIG01','D0104001','A damage in','31-12-2016',NULL,'Inpatient','New'),('DIG02','D0104002','A damage in','01-04-2017',NULL,'Inpatient','New'),('DIG03','D0109012','A damage in','12-04-2017',NULL,'Inpatient','Old'),('DIG04','D0104002','A damage in','08-02-2017',NULL,'Inpatient','New'),('DIG05','D0108007','A damage in','16-06-2017',NULL,'Inpatient','Old'),('DIG06','D0104001','A damage in','04-03-2017',NULL,'Inpatient','New'),('DIG07','D0104001','A damage in','02-04-2017',NULL,'Outpatient','New'),('DIG08','D0104002','A damage in','07-05-2017',NULL,'Outpatient','New'),('DIG09','D0103001','A damage in','15-04-2017',NULL,'Outpatient','Old'),('DIG10','D0107005','A damage in','26-06-2017',NULL,'Outpatient','New');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `doctor_id` varchar(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `speciality` varchar(30) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `charge` int(11) DEFAULT NULL,
  `working_hour` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('D0103001','Dr. Harisul Hoque','Cardiology','Cardiology Dept.','Half Time',500,'03:00 PM - 07:00 PM'),('D0104001','Dr. Md. Matlebur Rahman','Medicine','Medicine Dept.','Half Time',400,'08:00 AM - 12:00 PM'),('D0104002','Prof. Dr. Mahbub Anwar','Medicine','Medicine Dept.','Full Time',800,'09:00 AM - 06:00 PM'),('D0106001','Prof. Dr. Md. Badrul Alam','Neurology','Neurology Dept.','Full Time',1000,'06:00 AM - 12:00 AM'),('D0107005','Prof. Dr. Maliha Rashid','Gynecology','Gynecology Dept.','Half Time',1000,'08:00 AM - 12:00 PM'),('D0108007','Prof. Dr. A. S. M. Jakaria','Orthopedic','Orthopedic Dept.','Full Time',800,'02:00 PM - 10:00 PM'),('D0109012','Dr. Md. Majharul Shaheen','General Surgery','Surgery Dept.','Intern',400,'09:00 PM - 12:00 AM');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency`
--

DROP TABLE IF EXISTS `emergency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emergency` (
  `eroom_id` varchar(10) NOT NULL,
  `ebed_id` varchar(10) NOT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `date_admitted` varchar(12) DEFAULT NULL,
  `date_discharged` varchar(12) DEFAULT NULL,
  `price_perhour` varchar(20) DEFAULT NULL,
  `bill_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`eroom_id`,`ebed_id`),
  KEY `patient_id` (`patient_id`),
  KEY `bill_code` (`bill_code`),
  CONSTRAINT `emergency_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE,
  CONSTRAINT `emergency_ibfk_2` FOREIGN KEY (`bill_code`) REFERENCES `bill` (`bill_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency`
--

LOCK TABLES `emergency` WRITE;
/*!40000 ALTER TABLE `emergency` DISABLE KEYS */;
INSERT INTO `emergency` VALUES ('ER01','01','P002','09-04-2017','15-04-2017','200','BILL11'),('ER02','01','P003','14-05-2017','27-05-2017','300','BILL12'),('ER02','02','P005','12-06-2017','29-06-2017','300','BILL13');
/*!40000 ALTER TABLE `emergency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` varchar(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `qualification` varchar(70) DEFAULT NULL,
  `experience` varchar(30) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `contact_number` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('D0103001','Dr. Harisul Hoque',49,'MALE','MBBS, MD (Cardiology)','3 YEARS',50000,'01913943458'),('D0104001','Dr. Md. Matlebur Rahman',48,'MALE','MBBS, MCPS, FCPS (Medicine)','6 YEARS',60000,'01753948616'),('D0104002','Prof. Dr. Mahbub Anwar',57,'MALE','MBBS, DTCD, MD (Chest), FCCP (USA), FRCP (Edin)','12 YEARS',90000,'01753853663'),('D0106001','Prof. Dr. Md. Badrul Alam',73,'MALE','MBBS,FCPS Child Neurologist. Prof. & Head','13 YEARS',110000,'01755673721'),('D0107005','Prof. Dr. Maliha Rashid',43,'FEMALE','MBBS(Dhaka), FCPS (Gyane)','5 YEARS',42000,'01750934871'),('D0108007','Prof. Dr. A. S. M. Jakaria',63,'MALE','MBBS, MS (Orth) Professor & Head Orthopedics DMC','8 YEARS',92000,'01521346281'),('D0109012','Dr. Md. Majharul Shaheen',56,'MALE','MBBS (DMC), FCPS (ENT), MS (ENT), Fellow in Micro Surgery (Bankok)','2 YEARS',72000,'01842378453'),('N0101002','Parvin Alam',29,'FEMALE','BTEC Level 3 Diploma','2 YEARS',12000,'01756503490'),('N0101003','Sabina Islam',31,'FEMALE','GCSE in Urology','1 YEAR',11000,'01756504512'),('N0101004','Sharmin Rahman',22,'FEMALE','Diploma in Medicine','3 YEARS',9000,'01756503409'),('N0101005','Rakibul Islam',34,'MALE','G. N. M. in Biology','5 YEARS',13000,'01756509867');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_bill_history`
--

DROP TABLE IF EXISTS `equipment_bill_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_bill_history` (
  `bill_code` varchar(20) NOT NULL,
  `equipment_code` varchar(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  PRIMARY KEY (`bill_code`,`equipment_code`),
  KEY `equipment_code` (`equipment_code`),
  CONSTRAINT `equipment_bill_history_ibfk_1` FOREIGN KEY (`bill_code`) REFERENCES `bill` (`bill_code`),
  CONSTRAINT `equipment_bill_history_ibfk_2` FOREIGN KEY (`equipment_code`) REFERENCES `equipments` (`equipment_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_bill_history`
--

LOCK TABLES `equipment_bill_history` WRITE;
/*!40000 ALTER TABLE `equipment_bill_history` DISABLE KEYS */;
INSERT INTO `equipment_bill_history` VALUES ('BILL01','EQ004',1,20),('BILL02','EQ001',1,200),('BILL03','EQ005',1,60),('BILL04','EQ003',1,1000),('BILL05','EQ003',1,1000);
/*!40000 ALTER TABLE `equipment_bill_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments`
--

DROP TABLE IF EXISTS `equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipments` (
  `equipment_code` varchar(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  `stock_limited` int(100) DEFAULT NULL,
  PRIMARY KEY (`equipment_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments`
--

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
INSERT INTO `equipments` VALUES ('EQ001','Food',200,3000),('EQ002','Water  Bottle',15,2000),('EQ003','HFA',1000,300),('EQ004','Bandages',20,400),('EQ005','Tweezers',60,250);
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inpatient`
--

DROP TABLE IF EXISTS `inpatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inpatient` (
  `patient_id` varchar(20) NOT NULL,
  `room_id` varchar(10) DEFAULT NULL,
  `bed_id` varchar(10) DEFAULT NULL,
  `date_admitted` varchar(12) DEFAULT NULL,
  `date_discharged` varchar(12) DEFAULT NULL,
  `diagnosis_no` varchar(20) DEFAULT NULL,
  `labreport_no` varchar(20) DEFAULT NULL,
  `advance_payment` int(11) DEFAULT NULL,
  `bill_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `room_id` (`room_id`),
  KEY `labreport_no` (`labreport_no`),
  KEY `bill_code` (`bill_code`),
  KEY `diagnosis_no` (`diagnosis_no`),
  CONSTRAINT `inpatient_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `inpatient_ibfk_2` FOREIGN KEY (`diagnosis_no`) REFERENCES `diagnosis` (`diagnosis_no`),
  CONSTRAINT `inpatient_ibfk_3` FOREIGN KEY (`labreport_no`) REFERENCES `labreport` (`labreport_no`),
  CONSTRAINT `inpatient_ibfk_4` FOREIGN KEY (`bill_code`) REFERENCES `bill` (`bill_code`),
  CONSTRAINT `inpatient_ibfk_5` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `inpatient_ibfk_6` FOREIGN KEY (`diagnosis_no`) REFERENCES `diagnosis` (`diagnosis_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inpatient`
--

LOCK TABLES `inpatient` WRITE;
/*!40000 ALTER TABLE `inpatient` DISABLE KEYS */;
INSERT INTO `inpatient` VALUES ('P004','7A03','01','01-01-2017','Staying','DIG01','LAB01',6000,'BILL01'),('P006','7A03','02','02-04-2017','Staying','DIG02','LAB02',5000,'BILL02'),('P008','5A04','01','13-04-2017','Staying','DIG03','LAB03',100000,'BILL03'),('P009','5A04','02','09-02-2017','Staying','DIG04','LAB04',NULL,'BILL04'),('P010','7A03','03','17-06-2017','Staying','DIG05','LAB05',NULL,'BILL05'),('P012','5A04','03','05-03-2017','Staying','DIG06','LAB06',NULL,'BILL06');
/*!40000 ALTER TABLE `inpatient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labreport`
--

DROP TABLE IF EXISTS `labreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labreport` (
  `labreport_no` varchar(20) NOT NULL,
  `test_name` varchar(30) NOT NULL,
  `lab_charge` int(100) DEFAULT NULL,
  PRIMARY KEY (`labreport_no`,`test_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labreport`
--

LOCK TABLES `labreport` WRITE;
/*!40000 ALTER TABLE `labreport` DISABLE KEYS */;
INSERT INTO `labreport` VALUES ('LAB01','Biopsy Test',300),('LAB01','Blood Test',200),('LAB01','Urine Test',200),('LAB02','CT Scan',900),('LAB02','MRI Test',1000),('LAB03','Endoscopy',1200),('LAB04','ECG',600),('LAB04','Xray',400),('LAB05','Anoscopy Test',800),('LAB06','CT Scan',900),('LAB06','MRI Test',1000),('LAB06','Xray',400),('LAB07','Blood Test',200),('LAB08','Urine Test',200),('LAB09','Biopsy Test',300),('LAB10','MRI Test',1000);
/*!40000 ALTER TABLE `labreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicince_bill_history`
--

DROP TABLE IF EXISTS `medicince_bill_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicince_bill_history` (
  `bill_code` varchar(20) NOT NULL,
  `medicine_code` varchar(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  PRIMARY KEY (`bill_code`,`medicine_code`),
  KEY `medicine_code` (`medicine_code`),
  CONSTRAINT `medicince_bill_history_ibfk_1` FOREIGN KEY (`bill_code`) REFERENCES `bill` (`bill_code`),
  CONSTRAINT `medicince_bill_history_ibfk_2` FOREIGN KEY (`medicine_code`) REFERENCES `medicine` (`medicine_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicince_bill_history`
--

LOCK TABLES `medicince_bill_history` WRITE;
/*!40000 ALTER TABLE `medicince_bill_history` DISABLE KEYS */;
INSERT INTO `medicince_bill_history` VALUES ('BILL01','MED001',1,200),('BILL01','MED003',1,1000),('BILL01','MED007',1,450),('BILL02','MED001',1,200),('BILL02','MED005',1,60),('BILL03','MED009',1,100),('BILL04','MED002',1,150),('BILL04','MED010',1,200),('BILL05','MED006',1,2000),('BILL05','MED007',1,450);
/*!40000 ALTER TABLE `medicince_bill_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine` (
  `medicine_code` varchar(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  `stock_limited` int(100) DEFAULT NULL,
  PRIMARY KEY (`medicine_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES ('MED001','Synthroid','levothyroxine',200,3000),('MED002','Crestor','rosuvastatin',150,2500),('MED003','Ventolin HFA','albuterol',1000,300),('MED004','Nexium','esomeprazole',80,400),('MED005','Advair','Diskus',60,250),('MED006','Lantus Solostar','insulin glargine',2000,30),('MED007','Vyvanse','lisdexamfetamine',450,300),('MED008','Lyrica','pregabalin',175,250),('MED009','Spiriva Handihaler','tiotropium',100,500),('MED010','Januvia','sitagliptin',200,200);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse` (
  `nurse_id` varchar(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `working_hour` varchar(20) DEFAULT NULL,
  `room_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nurse_id`),
  CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`nurse_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES ('N0101002','Parvin Alam','Morning Shift','5A04'),('N0101003','Sabina Islam','Night Shift','3B02'),('N0101004','Sharmin Rahman','Evening Shift','4C07'),('N0101005','Rakibul Islam','Night Shift','2A03');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outpatient`
--

DROP TABLE IF EXISTS `outpatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outpatient` (
  `patient_id` varchar(20) NOT NULL,
  `date` varchar(12) DEFAULT NULL,
  `diagnosis_no` varchar(20) DEFAULT NULL,
  `labreport_no` varchar(20) DEFAULT NULL,
  `bill_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `diagnosis_no` (`diagnosis_no`),
  KEY `labreport_no` (`labreport_no`),
  KEY `bill_code` (`bill_code`),
  CONSTRAINT `outpatient_ibfk_1` FOREIGN KEY (`diagnosis_no`) REFERENCES `diagnosis` (`diagnosis_no`),
  CONSTRAINT `outpatient_ibfk_2` FOREIGN KEY (`labreport_no`) REFERENCES `labreport` (`labreport_no`),
  CONSTRAINT `outpatient_ibfk_3` FOREIGN KEY (`bill_code`) REFERENCES `bill` (`bill_code`),
  CONSTRAINT `outpatient_ibfk_4` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outpatient`
--

LOCK TABLES `outpatient` WRITE;
/*!40000 ALTER TABLE `outpatient` DISABLE KEYS */;
INSERT INTO `outpatient` VALUES ('P001','02-04-2017','DIG07','LAB07','BILL07'),('P007','07-05-2017','DIG08','LAB08','BILL08'),('P011','15-04-2017','DIG09','LAB09','BILL09'),('P013','26-06-2017','DIG10','LAB10','BILL10');
/*!40000 ALTER TABLE `outpatient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patient_id` varchar(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `diseases` varchar(30) DEFAULT NULL,
  `contact_number` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('P001','Sami Ansari',23,'Male','Niketon','Mumps','01756534902'),('P002','Nadira Haider',24,'Female','Uttara','Pregnancy','01646504512'),('P003','Azwad Rab',27,'Male','Malibag','Bone Accident','01936504512'),('P004','Minhaj Jami',22,'Male','Dhanmondi','Chikungunia','01756094571'),('P005','Kazi Hafsa',25,'Female','Mirpur','Skin Burn','01756508723'),('P006','Atanu Das Bapan',33,'Male','Rampura','Chicken POX','01756093742'),('P007','Tonmoy Hossain',12,'Male','Mohammadpur','Child Care','01759860121'),('P008','Shakkhor Alam',26,'Male','Modhubag','Cancer','01756504512'),('P009','Alvin Sachie',26,'Male','Cantonment','Virus Infection','01756591562'),('P010','Syed Fahim',42,'Male','Dhanmondi','Cholera','01756801389'),('P011','Imtiyaz Hira',62,'Male','Tejgaon','Diabetes','01756504512'),('P012','Sakib Eshrak',23,'Male','Mohakhali','Dengue','01521207987'),('P013','Towfika Disha',22,'Female','Mirpur','Insomniac','01756523097');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receptionist` (
  `receptionist_id` varchar(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `working_hour` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`receptionist_id`),
  CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`receptionist_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionist`
--

LOCK TABLES `receptionist` WRITE;
/*!40000 ALTER TABLE `receptionist` DISABLE KEYS */;
/*!40000 ALTER TABLE `receptionist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` varchar(10) NOT NULL,
  `bed_id` varchar(10) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `price_perday` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`,`bed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('5A03','01','Double','Empty',400),('5A03','02','Double','Empty',400),('5A04','01','Ward','Fill-UP',300),('5A04','02','Ward','Fill-UP',300),('5A04','03','Ward','Fill-UP',300),('7A02','01','Single','Empty',600),('7A03','01','Ward','Fill-UP',200),('7A03','02','Ward','Fill-UP',200),('7A03','03','Ward','Fill-UP',200);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment` (
  `treatment_code` varchar(20) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  PRIMARY KEY (`treatment_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES ('T001','Esophagectomy',3000000),('T002','Surgical Ventricular Restoration',2000000),('T003','Coronary Revascularization',1500000),('T004','Separation of Conjoined Twins',2000000),('T005','Craniectomy',1200000),('T006','Spinal Osteomyelitis Surgery',2050000),('T007','Bladder Cystectomy',800000),('T008','Thoracic Aortic Dissection Repair',200000),('T009','Bariatric surgeries/Gastric yypass',100000);
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_bill_history`
--

DROP TABLE IF EXISTS `treatment_bill_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment_bill_history` (
  `bill_code` varchar(20) NOT NULL,
  `treatment_code` varchar(20) NOT NULL,
  `price` int(20) DEFAULT NULL,
  PRIMARY KEY (`bill_code`,`treatment_code`),
  KEY `treatment_code` (`treatment_code`),
  CONSTRAINT `treatment_bill_history_ibfk_1` FOREIGN KEY (`bill_code`) REFERENCES `bill` (`bill_code`),
  CONSTRAINT `treatment_bill_history_ibfk_2` FOREIGN KEY (`treatment_code`) REFERENCES `treatment` (`treatment_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_bill_history`
--

LOCK TABLES `treatment_bill_history` WRITE;
/*!40000 ALTER TABLE `treatment_bill_history` DISABLE KEYS */;
INSERT INTO `treatment_bill_history` VALUES ('BILL01','T001',3000000),('BILL02','T005',1200000),('BILL03','T003',1500000),('BILL04','T002',2000000),('BILL05','T007',800000);
/*!40000 ALTER TABLE `treatment_bill_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-14  0:53:23
