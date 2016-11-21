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
  CONSTRAINT `StoreID` FOREIGN KEY (`StoreID`) REFERENCES `store` (`Sid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `WarehouseID` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`WareID`,`VendorID`),
  KEY `VID_idx` (`VendorID`),
  CONSTRAINT `VendorID` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`Vid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `WareID` FOREIGN KEY (`WareID`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Pid` int(11) NOT NULL,
  `Pname` varchar(45) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `ProID` FOREIGN KEY (`ProID`) REFERENCES `product` (`Pid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `WarehID` FOREIGN KEY (`WarehID`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sells`
--

DROP TABLE IF EXISTS `sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sells` (
  `ProductID` int(11) NOT NULL,
  `VenID` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`,`VenID`),
  KEY `VendorID_idx` (`VenID`),
  CONSTRAINT `ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`Pid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `VenID` FOREIGN KEY (`VenID`) REFERENCES `vendor` (`Vid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `MngSSN` FOREIGN KEY (`MngSSN`) REFERENCES `employee` (`SSN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PVendor` FOREIGN KEY (`Pvendor`) REFERENCES `vendor` (`Vid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PWarehouse` FOREIGN KEY (`Pwarehouse`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`WarehouseIDs`,`StoreIDs`),
  KEY `StoreID_idx` (`StoreIDs`),
  CONSTRAINT `StoreIDs` FOREIGN KEY (`StoreIDs`) REFERENCES `store` (`Sid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `WarehouseIDs` FOREIGN KEY (`WarehouseIDs`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `PrimaryWarehouse` FOREIGN KEY (`PrimaryWarehouse`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `ManagerID` FOREIGN KEY (`ManagerID`) REFERENCES `employee` (`SSN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-21  2:32:51
