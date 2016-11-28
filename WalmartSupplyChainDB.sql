CREATE DATABASE  IF NOT EXISTS `walmartsupplychain` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `walmartsupplychain`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: walmartsupplychain
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `carries`
--

DROP TABLE IF EXISTS `carries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carries` (
  `StoreIDc` int(11) NOT NULL,
  `ProductIDc` int(11) NOT NULL,
  `Quantityc` int(11) DEFAULT NULL,
  `Pricec` float DEFAULT NULL,
  PRIMARY KEY (`StoreIDc`,`ProductIDc`),
  KEY `ProductID_idx` (`ProductIDc`),
  CONSTRAINT `ProductIDc` FOREIGN KEY (`ProductIDc`) REFERENCES `product` (`Pid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `StoreIDc` FOREIGN KEY (`StoreIDc`) REFERENCES `store` (`Sid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carries`
--

LOCK TABLES `carries` WRITE;
/*!40000 ALTER TABLE `carries` DISABLE KEYS */;
INSERT INTO `carries` VALUES (1,1,32,10),(1,2,20,NULL),(1,4,15,NULL),(1,7,20,NULL),(2,3,2,10),(3,4,15,NULL),(3,6,6,NULL),(5,4,100,NULL);
/*!40000 ALTER TABLE `carries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `SSN` int(11) NOT NULL,
  `StartDate` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Salary` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `DoB` varchar(45) DEFAULT NULL,
  `WarehouseID` int(11) DEFAULT NULL,
  `StoreID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `WarehouseID_idx` (`WarehouseID`),
  KEY `StoreID_idx` (`StoreID`),
  CONSTRAINT `StoreID` FOREIGN KEY (`StoreID`) REFERENCES `store` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WarehouseID` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (111223333,'12/12/16','dave','9163335555','20','123 test ','11/12/16',1,NULL),(123121235,'03/23/16','steve','9137438554','201','123 not a test lane','03/11/15',NULL,1),(123445555,'12341254','asdf','asdf','asg','afgerg','ag',NULL,NULL),(222556666,'asdfwer','dave','1321451','1112222','asdfasd','agwreg',7,NULL),(444225555,'12/12/16','stevet','4565555555','5','123 test test','12/12/16',NULL,NULL),(444556665,'12/12/16','rad','2225555555','23','sadfas','12/12/16',10,NULL),(444556666,'12/12/16','dtj','95456','20','123 tewt','30/12/16',9,NULL),(555333333,'12/12/16','tset','916513215','2000','1235 test','12/12/16',NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersfrom`
--

DROP TABLE IF EXISTS `ordersfrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordersfrom` (
  `WareID` int(11) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  PRIMARY KEY (`WareID`,`VendorID`),
  KEY `VID_idx` (`VendorID`),
  KEY `ProdID_idx` (`ProductID`),
  CONSTRAINT `ProdID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VendorID` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`Vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WareID` FOREIGN KEY (`WareID`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersfrom`
--

LOCK TABLES `ordersfrom` WRITE;
/*!40000 ALTER TABLE `ordersfrom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordersfrom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Pid` int(11) NOT NULL,
  `Pname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'grapes'),(2,'apples'),(3,'toys'),(4,'stuff'),(5,'non-stuff items'),(6,'non-non-stuff items'),(7,'test'),(8,'pinecones');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receives`
--

DROP TABLE IF EXISTS `receives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receives` (
  `WarehID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`WarehID`,`ProID`),
  KEY `ProductID_idx` (`ProID`),
  CONSTRAINT `ProID` FOREIGN KEY (`ProID`) REFERENCES `product` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WarehID` FOREIGN KEY (`WarehID`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receives`
--

LOCK TABLES `receives` WRITE;
/*!40000 ALTER TABLE `receives` DISABLE KEYS */;
INSERT INTO `receives` VALUES (1,1,140),(1,4,100),(2,3,13),(2,4,35),(3,1,10),(3,2,80),(3,7,200),(6,6,40),(9,6,250);
/*!40000 ALTER TABLE `receives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sells`
--

DROP TABLE IF EXISTS `sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sells` (
  `ProductID` int(11) NOT NULL,
  `VenID` int(11) NOT NULL,
  `QuantityProd` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`VenID`),
  KEY `VendorID_idx` (`VenID`),
  CONSTRAINT `ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`Pid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `VenID` FOREIGN KEY (`VenID`) REFERENCES `vendor` (`Vid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sells`
--

LOCK TABLES `sells` WRITE;
/*!40000 ALTER TABLE `sells` DISABLE KEYS */;
INSERT INTO `sells` VALUES (1,3,500),(2,5,534),(3,4,300),(4,2,150),(6,1,250),(6,2,445),(8,1,200),(8,6,200);
/*!40000 ALTER TABLE `sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `Sid` int(11) NOT NULL,
  `Pvendor` int(11) DEFAULT NULL,
  `Pwarehouse` int(11) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `MngSSN` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sid`),
  KEY `PVendor_idx` (`Pvendor`),
  KEY `PWarehouse_idx` (`Pwarehouse`),
  KEY `MngSSN_idx` (`MngSSN`),
  CONSTRAINT `MngSSN` FOREIGN KEY (`MngSSN`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PVendor` FOREIGN KEY (`Pvendor`) REFERENCES `vendor` (`Vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PWarehouse` FOREIGN KEY (`Pwarehouse`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,NULL,NULL,'235asdfgtsdg sdg',123121235),(2,2,2,'123 irregular lane',NULL),(3,3,1,'123 irregulae',NULL),(4,NULL,NULL,'asdfsadfkl;',NULL),(5,NULL,NULL,'123123',NULL),(6,NULL,NULL,'45645',NULL);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplies` (
  `WarehouseIDs` int(11) NOT NULL,
  `StoreIDs` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `ProdIDnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`WarehouseIDs`,`StoreIDs`),
  KEY `StoreID_idx` (`StoreIDs`),
  KEY `ProdID_idxs` (`ProdIDnum`),
  CONSTRAINT `ProdIDs` FOREIGN KEY (`ProdIDnum`) REFERENCES `product` (`Pid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `StoreIDs` FOREIGN KEY (`StoreIDs`) REFERENCES `store` (`Sid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `WarehouseIDs` FOREIGN KEY (`WarehouseIDs`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `Vid` int(11) NOT NULL,
  `Vname` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `PrimaryWarehouse` int(11) DEFAULT NULL,
  `ProductsSupplied` int(11) DEFAULT NULL,
  PRIMARY KEY (`Vid`),
  KEY `PrimaryWarehouse_idx` (`PrimaryWarehouse`),
  KEY `Product_idx` (`ProductsSupplied`),
  CONSTRAINT `PrimaryWarehouse` FOREIGN KEY (`PrimaryWarehouse`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ProdSupplied` FOREIGN KEY (`ProductsSupplied`) REFERENCES `product` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'Test toys ','123 test street',NULL,NULL),(2,'vendor2','123 regular lane',2,2),(3,'vendor3','123 regu3ne',3,2),(4,'vendor4','123 3',4,1),(5,'vendor5','123 5',5,1),(6,'pinecone vendor','123 pinecone lane',NULL,NULL);
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `WarehouseID` int(11) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`WarehouseID`),
  KEY `Manager_idx` (`ManagerID`),
  CONSTRAINT `ManagerID` FOREIGN KEY (`ManagerID`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'12 not 3',111223333),(2,'123 lonelier lane',NULL),(3,'123 lone lane',NULL),(4,'123 elbow room',NULL),(5,'123 asdfasdf',NULL),(6,'23626',NULL),(7,'12345',222556666),(8,'123 whatever',NULL),(9,'123456',444556666),(10,'123453',444556665);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-27 21:57:24
