-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: ma_bd_offre
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CONTRAT`
--

DROP TABLE IF EXISTS `CONTRAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONTRAT` (
  `NContrat` int NOT NULL AUTO_INCREMENT,
  `DateContrat` datetime DEFAULT NULL,
  `Quantité_négocié` varchar(45) DEFAULT NULL,
  `signé` varchar(45) DEFAULT NULL,
  `Nfournisseur` int unsigned NOT NULL,
  `Nproduit` int NOT NULL,
  PRIMARY KEY (`NContrat`),
  KEY `fk_fournisseur_depui_contrat_idx` (`Nfournisseur`),
  KEY `fk_produit_depuis_contrat_idx` (`Nproduit`),
  CONSTRAINT `fk_fournisseur_depui_contrat` FOREIGN KEY (`Nfournisseur`) REFERENCES `FOURNISSEUR` (`NFournisseur`),
  CONSTRAINT `fk_produit_depuis_contrat` FOREIGN KEY (`Nproduit`) REFERENCES `produit` (`Nproduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='table contrat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTRAT`
--

LOCK TABLES `CONTRAT` WRITE;
/*!40000 ALTER TABLE `CONTRAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONTRAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FOURNISSEUR`
--

DROP TABLE IF EXISTS `FOURNISSEUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FOURNISSEUR` (
  `NFournisseur` int unsigned NOT NULL AUTO_INCREMENT,
  `NomFournisseur` varchar(45) NOT NULL,
  `AdresseFournisseur` varchar(45) NOT NULL,
  `CodePostale` varchar(45) NOT NULL,
  `Ville_Fournisseur` varchar(45) NOT NULL,
  PRIMARY KEY (`NFournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='la table fournisseur ok';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOURNISSEUR`
--

LOCK TABLES `FOURNISSEUR` WRITE;
/*!40000 ALTER TABLE `FOURNISSEUR` DISABLE KEYS */;
/*!40000 ALTER TABLE `FOURNISSEUR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFRE`
--

DROP TABLE IF EXISTS `OFFRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFRE` (
  `NOffre` int NOT NULL AUTO_INCREMENT,
  `DateCloture` datetime DEFAULT NULL,
  `Quantité` int DEFAULT NULL,
  `Nproduit` int NOT NULL,
  PRIMARY KEY (`NOffre`),
  KEY `fk_sur_produit_depuis_offre_idx` (`Nproduit`),
  CONSTRAINT `fk_sur_produit_depuis_offre` FOREIGN KEY (`Nproduit`) REFERENCES `produit` (`Nproduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ma table offre p....';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFRE`
--

LOCK TABLES `OFFRE` WRITE;
/*!40000 ALTER TABLE `OFFRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `Nproduit` int NOT NULL AUTO_INCREMENT,
  `NomProduit` varchar(45) DEFAULT NULL,
  `Prix_unitaire` float NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Nproduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='table produit de notre basse de données ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-08 17:52:16
