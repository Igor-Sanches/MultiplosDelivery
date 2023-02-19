-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: multiplosdelivery
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `account_transactions`
--

DROP TABLE IF EXISTS `account_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_transactions`
--

LOCK TABLES `account_transactions` WRITE;
/*!40000 ALTER TABLE `account_transactions` DISABLE KEYS */;
INSERT INTO `account_transactions` VALUES (1,'store',1,140.00,25.00,'DEPOSITO','MES 10/22','2022-10-29 14:13:00','2022-10-29 14:13:00');
/*!40000 ALTER TABLE `account_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `add_ons`
--

DROP TABLE IF EXISTS `add_ons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `add_ons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_ons`
--

LOCK TABLES `add_ons` WRITE;
/*!40000 ALTER TABLE `add_ons` DISABLE KEYS */;
INSERT INTO `add_ons` VALUES (1,'TOMATE',2.00,'2022-10-26 00:49:51','2022-10-26 00:49:51',1,1),(2,'QUEIJO',5.00,'2022-10-26 00:50:07','2022-10-26 00:50:07',1,1),(3,'Cebola',100.00,'2022-12-26 19:49:42','2022-12-26 19:49:42',1,1);
/*!40000 ALTER TABLE `add_ons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Master admin',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_wallets`
--

DROP TABLE IF EXISTS `admin_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `digital_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `manual_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_wallets`
--

LOCK TABLES `admin_wallets` WRITE;
/*!40000 ALTER TABLE `admin_wallets` DISABLE KEYS */;
INSERT INTO `admin_wallets` VALUES (1,1,201.00,945.00,707.00,'2022-12-22 04:51:09','2022-12-28 19:13:23',0.00);
/*!40000 ALTER TABLE `admin_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint unsigned NOT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  `is_logged_in` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Múltiplos','Delivery','989890909000','admin@demo.com','2022-09-30-633766038a552.png','$2y$10$/vQdb5BMmGMV8NvLFEBczujp9HAkDx8fpqKKTNeBH7bArNpToxPha','TYINcJtVvfdT2fXzlmbCZiCpFU9PdID8TbfwRn9ZwWCzcAwdBIeKGpPLodRX','2022-09-30 16:04:43','2022-11-30 03:40:46',1,NULL,1);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_historicals`
--

DROP TABLE IF EXISTS `affiliate_historicals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliate_historicals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('reference','affiliate') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `affiliate_id` int NOT NULL,
  `order_id` int NOT NULL,
  `store_id` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `delivery_charge` decimal(8,2) DEFAULT '0.00',
  `percentage` double DEFAULT NULL,
  `money` double DEFAULT NULL,
  `value_gain` decimal(8,2) NOT NULL,
  `is_first_purchase` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_historicals`
--

LOCK TABLES `affiliate_historicals` WRITE;
/*!40000 ALTER TABLE `affiliate_historicals` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_historicals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Sabor','2022-10-02 00:03:51','2022-10-02 00:03:51'),(2,'Cor','2022-10-14 22:52:53','2022-10-14 22:52:53');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ISPB` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `participate_of_compe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_access` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_of_operation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES ('001','00000000','BCO DO BRASIL S.A.','001','Sim','RSFN','Banco do Brasil S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('003','04902979','BCO DA AMAZONIA S.A.','003','Sim','RSFN','Banco da Amazônia S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('004','07237373','BCO DO NORDESTE DO BRASIL S.A.','004','Sim','RSFN','Banco do Nordeste do Brasil S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('007','33657248','BNDES','007','Não','RSFN','Banco Nacional de Desenvolvimento Econômico e Social BNDES','30/06/2014','2022-11-11 01:22:48','2022-11-11 16:33:35'),('010','81723108','CREDICOAMO','010','Sim','RSFN','Credicoamo Crédito Rural Cooperativa','10/12/2012','2022-11-11 01:22:48','2022-11-11 16:33:35'),('011','61809182','C.SUISSE HEDGING-GRIFFO CV S/A','011','Não','RSFN','Credit Suisse Hedging-Griffo Corretora de Valores S.A.','28/06/2011','2022-11-11 01:22:48','2022-11-11 16:33:35'),('012','04866275','BANCO INBURSA','012','Não','RSFN','Banco Inbursa S.A.','04/05/2017','2022-11-11 01:22:47','2022-11-11 16:33:35'),('014','09274232','NATIXIS BRASIL S.A. BM','014','Não','RSFN','Natixis Brasil S.A. Banco Múltiplo','08/08/2008','2022-11-11 01:22:48','2022-11-11 16:33:35'),('015','02819125','UBS BRASIL CCTVM S.A.','015','Não','RSFN','UBS Brasil Corretora de Câmbio, Títulos e Valores Mobiliários S.A.','15/03/2011','2022-11-11 01:22:47','2022-11-11 16:33:35'),('016','04715685','CCM DESP TRÂNS SC E RS','016','Não','RSFN','Coop de Créd. Mútuo dos Despachantes de Trânsito de SC e Rio Grande do Sul','08/05/2012','2022-11-11 01:22:47','2022-11-11 16:33:35'),('017','42272526','BNY MELLON BCO S.A.','017','Sim','RSFN','BNY Mellon Banco S.A.','19/11/2012','2022-11-11 01:22:48','2022-11-11 16:33:35'),('018','57839805','BCO TRICURY S.A.','018','Sim','RSFN','Banco Tricury S.A.','05/08/2013','2022-11-11 01:22:48','2022-11-11 16:33:35'),('021','28127603','BCO BANESTES S.A.','021','Sim','RSFN','Banestes S.A. Banco do Estado do Espírito Santo','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('024','10866788','BCO BANDEPE S.A.','024','Não','RSFN','Banco Bandepe S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('025','03323840','BCO ALFA S.A.','025','Sim','RSFN','Banco Alfa S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('029','33885724','BANCO ITAÚ CONSIGNADO S.A.','029','Não','RSFN','Banco Itaú Consignado S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('033','90400888','BCO SANTANDER (BRASIL) S.A.','033','Sim','RSFN','Banco Santander (Brasil) S. A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('036','06271464','BCO BBI S.A.','036','Sim','RSFN','Banco Bradesco BBI S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('037','04913711','BCO DO EST. DO PA S.A.','037','Sim','RSFN','Banco do Estado do Pará S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('040','03609817','BCO CARGILL S.A.','040','Sim','RSFN','Banco Cargill S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('041','92702067','BCO DO ESTADO DO RS S.A.','041','Sim','RSFN','Banco do Estado do Rio Grande do Sul S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('047','13009717','BCO DO EST. DE SE S.A.','047','Sim','RSFN','Banco do Estado de Sergipe S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('060','04913129','CONFIDENCE CC S.A.','060','Não','Internet','Confidence Corretora de Câmbio S.A.','21/09/2010','2022-11-11 01:22:47','2022-11-11 16:33:35'),('062','03012230','HIPERCARD BM S.A.','062','Sim','RSFN','Hipercard Banco Múltiplo S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('063','04184779','BANCO BRADESCARD','063','Sim','RSFN','Banco Bradescard S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('064','04332281','GOLDMAN SACHS DO BRASIL BM S.A','064','Não','RSFN','Goldman Sachs do Brasil  Banco Múltiplo S. A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('065','48795256','BCO ANDBANK S.A.','065','Sim','RSFN','Banco AndBank (Brasil) S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('066','02801938','BCO MORGAN STANLEY S.A.','066','Não','RSFN','Banco Morgan Stanley S. A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('069','61033106','BCO CREFISA S.A.','069','Sim','RSFN','Banco Crefisa S.A.','18/11/2005','2022-11-11 01:22:48','2022-11-11 16:33:35'),('070','00000208','BRB - BCO DE BRASILIA S.A.','070','Sim','RSFN','Banco de Brasília S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('074','03017677','BCO. J.SAFRA S.A.','074','Sim','RSFN','Banco J. Safra S.A.','26/08/2004','2022-11-11 01:22:47','2022-11-11 16:33:35'),('075','03532415','BCO ABN AMRO S.A.','075','Não','RSFN','Banco ABN Amro S.A.','11/11/2005','2022-11-11 01:22:47','2022-11-11 16:33:35'),('076','07656500','BCO KDB BRASIL S.A.','076','Não','RSFN','Banco KDB do Brasil S.A.','10/04/2006','2022-11-11 01:22:48','2022-11-11 16:33:35'),('077','00416968','BANCO INTER','077','Sim','RSFN','Banco Inter S.A.','15/08/2008','2022-11-11 01:22:47','2022-11-11 16:33:35'),('078','34111187','HAITONG BI DO BRASIL S.A.','078','Não','RSFN','Haitong Banco de Investimento do Brasil S.A.','31/07/2008','2022-11-11 01:22:48','2022-11-11 16:33:35'),('079','09516419','BCO ORIGINAL DO AGRO S/A','079','Sim','RSFN','Banco Original do Agronegócio S.A.','25/07/2008','2022-11-11 01:22:48','2022-11-11 16:33:35'),('080','73622748','B&T CC LTDA.','080','Não','Internet','BT Corretora de Câmbio Ltda.','18/11/2010','2022-11-11 01:22:48','2022-11-11 16:33:35'),('081','10264663','BBN BCO BRASILEIRO DE NEGOCIOS S.A.','081','Não','RSFN','BBN Banco Brasileiro de Negocios S.A.','24/10/2008','2022-11-11 01:22:48','2022-11-11 16:33:35'),('082','07679404','BANCO TOPÁZIO S.A.','082','Não','RSFN','Banco Topazio S.A.','12/06/2009','2022-11-11 01:22:48','2022-11-11 16:33:35'),('083','10690848','BCO DA CHINA BRASIL S.A.','083','Sim','RSFN','Banco da China Brasil S.A.','14/07/2009','2022-11-11 01:22:48','2022-11-11 16:33:35'),('084','02398976','UNIPRIME NORTE DO PARANÁ - CC','084','Sim','RSFN','Uniprime Norte do Paraná - Cooperativa de Crédito Ltda.','24/11/2009','2022-11-11 01:22:47','2022-11-11 16:33:35'),('085','05463212','CCC CECRED','085','Sim','RSFN','Cooperativa Central de Crédito Urbano - Cecred','17/05/2010','2022-11-11 01:22:47','2022-11-11 16:33:35'),('089','62109566','CCR REG MOGIANA','089','Sim','RSFN','Cooperativa de Crédito Rural da Região da Mogiana','30/08/2010','2022-11-11 01:22:48','2022-11-11 16:33:35'),('091','01634601','CCCM UNICRED CENTRAL RS','091','Não','RSFN','Central de Cooperativas de Economia e Crédito Mútuo do Est RS - Unicred','22/11/2010','2022-11-11 01:22:47','2022-11-11 16:33:35'),('092','12865507','BRK S.A. CFI','092','Não','RSFN','BRK S.A. Crédito, Financiamento e Investimento','01/07/2010','2022-11-11 01:22:48','2022-11-11 16:33:35'),('093','07945233','PÓLOCRED SCMEPP LTDA.','093','Não','RSFN','Pólocred Sociedade de Crédito ao Microempreendedor e à Empresa de Pequeno Porte','09/11/2010','2022-11-11 01:22:48','2022-11-11 16:33:35'),('094','11758741','BANCO FINAXIS','094','Sim','RSFN','Banco Finaxis S.A.','23/08/2010','2022-11-11 01:22:48','2022-11-11 16:33:35'),('095','11703662','BCO CONFIDENCE DE CÂMBIO S.A.','095','Não','RSFN','Banco Confidence de Câmbio S.A.','22/06/2010','2022-11-11 01:22:48','2022-11-11 16:33:35'),('096','00997185','BANCO BM&FBOVESPA','096','Não','RSFN','Banco BMFBovespa de Serviços de Liquidação e Custódia S/A','12/11/2004','2022-11-11 01:22:47','2022-11-11 16:33:35'),('097','04632856','CCC NOROESTE BRASILEIRO LTDA.','097','Sim','RSFN','Cooperativa Central de Crédito Noroeste Brasileiro Ltda - CentralCredi','08/02/2011','2022-11-11 01:22:47','2022-11-11 16:33:35'),('098','78157146','CREDIALIANÇA CCR','098','Sim','RSFN','Credialiança Cooperativa de Crédito Rural','18/01/2011','2022-11-11 01:22:48','2022-11-11 16:33:35'),('099','03046391','UNIPRIME CENTRAL CCC LTDA.','099','Sim','RSFN','Uniprime Central – Central Interestadual de Cooperativas de Crédito Ltda.','11/01/2011','2022-11-11 01:22:47','2022-11-11 16:33:35'),('100','00806535','PLANNER CV S.A.','100','Não','RSFN','Planner Corretora de Valores S.A.','27/04/2011','2022-11-11 01:22:47','2022-11-11 16:33:35'),('101','62287735','RENASCENCA DTVM LTDA','101','Não','RSFN','Renascença Distribuidora de Títulos e Valores Mobiliários Ltda.','22/04/2010','2022-11-11 01:22:48','2022-11-11 16:33:35'),('102','02332886','XP INVESTIMENTOS CCTVM S/A','102','Não','RSFN','XP Investimentos Corretora de Câmbio Títulos e Valores Mobiliários S.A.','22/11/2011','2022-11-11 01:22:47','2022-11-11 16:33:35'),('104','00360305','CAIXA ECONOMICA FEDERAL','104','Sim','RSFN','Caixa Econômica Federal','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('105','07652226','LECCA CFI S.A.','105','Não','RSFN','Lecca Crédito, Financiamento e Investimento S/A','27/12/2011','2022-11-11 01:22:48','2022-11-11 16:33:35'),('107','15114366','BCO BOCOM BBM S.A.','107','Sim','RSFN','Banco Bocom BBM S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('108','01800019','PORTOCRED S.A. - CFI','108','Não','RSFN','PortoCred S.A. Crédito, Financiamento e Investimento','03/11/2011','2022-11-11 01:22:47','2022-11-11 16:33:35'),('111','36113876','OLIVEIRA TRUST DTVM S.A.','111','Não','RSFN','Oliveira Trust Distribuidora de Títulos e Valores Mobiliários S.A.','24/03/2011','2022-11-11 01:22:48','2022-11-11 16:33:35'),('113','61723847','MAGLIANO S.A. CCVM','113','Não','RSFN','Magliano S.A. Corretora de Cambio e Valores Mobiliarios','28/11/2011','2022-11-11 01:22:48','2022-11-11 16:33:35'),('114','05790149','CENTRAL COOPERATIVA DE CRÉDITO NO ESTADO DO ESPÍRITO SANTO','114','Sim','RSFN','Central Cooperativa de Crédito no Estado do Espírito Santo - CECOOP','27/10/2011','2022-11-11 01:22:47','2022-11-11 16:33:35'),('117','92856905','ADVANCED CC LTDA','117','Não','Internet','Advanced Corretora de Câmbio Ltda.','03/10/2011','2022-11-11 01:22:48','2022-11-11 16:33:35'),('118','11932017','STANDARD CHARTERED BI S.A.','118','Não','RSFN','Standard Chartered Bank (Brasil) S.A. Banco de Investimento','26/09/2011','2022-11-11 01:22:48','2022-11-11 16:33:35'),('119','13720915','BCO WESTERN UNION','119','Não','RSFN','Banco Western Union do Brasil S.A.','10/10/2011','2022-11-11 01:22:48','2022-11-11 16:33:35'),('120','33603457','BCO RODOBENS S.A.','120','Sim','RSFN','Banco Rodobens SA','06/02/2012','2022-11-11 01:22:48','2022-11-11 16:33:35'),('121','10664513','BCO AGIBANK S.A.','121','Sim','RSFN','Banco Agibank S.A.','04/04/2012','2022-11-11 01:22:48','2022-11-11 16:33:35'),('122','33147315','BCO BRADESCO BERJ S.A.','122','Sim','RSFN','Banco Bradesco BERJ S.A.','08/11/2011','2022-11-11 01:22:48','2022-11-11 16:33:35'),('124','15357060','BCO WOORI BANK DO BRASIL S.A.','124','Sim','RSFN','Banco Woori Bank do Brasil S.A.','09/08/2012','2022-11-11 01:22:48','2022-11-11 16:33:35'),('125','45246410','BRASIL PLURAL S.A. BCO.','125','Sim','RSFN','Brasil Plural S.A. Banco Múltiplo','19/11/2012','2022-11-11 01:22:48','2022-11-11 16:33:35'),('126','13220493','BR PARTNERS BI','126','Não','RSFN','BR Partners Banco de Investimento S.A.','04/01/2013','2022-11-11 01:22:48','2022-11-11 16:33:35'),('127','09512542','CODEPE CVC S.A.','127','Não','Internet','Codepe Corretora de Valores e Câmbio S.A.','09/11/2012','2022-11-11 01:22:48','2022-11-11 16:33:35'),('128','19307785','MS BANK S.A. BCO DE CÂMBIO','128','Não','RSFN','MS Bank S.A. Banco de Câmbio','27/04/2015','2022-11-11 01:22:48','2022-11-11 16:33:35'),('129','18520834','UBS BRASIL BI S.A.','129','Não','RSFN','UBS Brasil Banco de Investimento S.A.','12/03/2014','2022-11-11 01:22:48','2022-11-11 16:33:35'),('130','09313766','CARUANA SCFI','130','Não','RSFN','Caruana S.A. Sociedade de Crédito, Financiamento e Investimento','12/08/2013','2022-11-11 01:22:48','2022-11-11 16:33:35'),('131','61747085','TULLETT PREBON BRASIL CVC LTDA','131','Não','RSFN','Tullett Prebon Brasil Corretora de Valores e Câmbio Ltda.','15/07/2013','2022-11-11 01:22:48','2022-11-11 16:33:35'),('132','17453575','ICBC DO BRASIL BM S.A.','132','Sim','RSFN','ICBC do Brasil Banco Múltiplo S.A.','26/09/2013','2022-11-11 01:22:48','2022-11-11 16:33:35'),('133','10398952','CRESOL CONFEDERAÇÃO','133','Sim','RSFN','Confederação Nacional das Cooperativas Centrais de Crédito e Economia Familiar e','02/05/2016','2022-11-11 01:22:48','2022-11-11 16:33:35'),('134','33862244','BGC LIQUIDEZ DTVM LTDA','134','Não','RSFN','BGC Liquidez Distribuidora de Títulos e Valores Mobiliários Ltda.','28/07/2014','2022-11-11 01:22:48','2022-11-11 16:33:35'),('135','33918160','GRADUAL CCTVM S.A.','135','Não','RSFN','Gradual Corretora de Câmbio, Títulos e Valores Mobiliários S.A.','02/05/2016','2022-11-11 01:22:48','2022-11-11 16:33:35'),('136','00315557','CONF NAC COOP CENTRAIS UNICRED','136','Sim','RSFN','Confederação Nacional das Cooperativas Centrais Unicred Ltda – Unicred do Brasil','28/07/2014','2022-11-11 01:22:47','2022-11-11 16:33:35'),('137','12586596','MULTIMONEY CC LTDA.','137','Não','Internet','Multimoney Corretora de Câmbio Ltda','26/11/2014','2022-11-11 01:22:48','2022-11-11 16:33:35'),('138','10853017','GET MONEY CC LTDA','138','Não','Internet','Get Money Corretora de Câmbio S.A.','14/07/2014','2022-11-11 01:22:48','2022-11-11 16:33:35'),('139','55230916','INTESA SANPAOLO BRASIL S.A. BM','139','Não','RSFN','Intesa Sanpaolo Brasil S.A. - Banco Múltiplo','08/05/2015','2022-11-11 01:22:48','2022-11-11 16:33:35'),('140','62169875','EASYNVEST - TÍTULO CV SA','140','Não','RSFN','Easynvest - Título Corretora de Valores SA','26/05/2015','2022-11-11 01:22:48','2022-11-11 16:33:35'),('142','16944141','BROKER BRASIL CC LTDA.','142','Não','RSFN','Broker Brasil Corretora de Câmbio Ltda.','23/06/2015','2022-11-11 01:22:48','2022-11-11 16:33:35'),('143','02992317','TREVISO CC S.A.','143','Não','Internet','Treviso Corretora de Câmbio S.A.','24/08/2015','2022-11-11 01:22:47','2022-11-11 16:33:35'),('144','13059145','BEXS BCO DE CAMBIO S.A.','144','Não','RSFN','Bexs Banco de Câmbio S.A.','23/05/2016','2022-11-11 01:22:48','2022-11-11 16:33:35'),('145','50579044','LEVYCAM CCV LTDA','145','Não','Internet','Levycam - Corretora de Câmbio e Valores Ltda.','16/06/2015','2022-11-11 01:22:48','2022-11-11 16:33:35'),('146','24074692','GUITTA CC LTDA','146','Não','Internet','Guitta Corretora de Câmbio Ltda.','20/05/2015','2022-11-11 01:22:48','2022-11-11 16:33:35'),('149','15581638','FACTA S.A. CFI','149','Não','RSFN','Facta Financeira S.A. - Crédito Financiamento e Investimento','08/07/2015','2022-11-11 01:22:48','2022-11-11 16:33:35'),('157','09105360','ICAP DO BRASIL CTVM LTDA.','157','Não','RSFN','ICAP do Brasil Corretora de Títulos e Valores Mobiliários Ltda.','12/02/2016','2022-11-11 01:22:48','2022-11-11 16:33:35'),('159','05442029','CASA CREDITO S.A. SCM','159','Não','Internet','Casa do Crédito S.A. Sociedade de Crédito ao Microempreendedor','04/09/2017','2022-11-11 01:22:47','2022-11-11 16:33:35'),('163','23522214','COMMERZBANK BRASIL S.A. - BCO MÚLTIPLO','163','Sim','RSFN','Commerzbank Brasil S.A. - Banco Múltiplo','10/08/2016','2022-11-11 01:22:48','2022-11-11 16:33:35'),('169','71371686','BCO OLÉ BONSUCESSO CONSIGNADO S.A.','169','Não','RSFN','Banco Olé Bonsucesso Consignado S.A.','16/11/2016','2022-11-11 01:22:48','2022-11-11 16:33:35'),('172','05452073','ALBATROSS CCV S.A','172','Não','Internet','Albatross Corretora de Câmbio e Valores S.A','14/09/2017','2022-11-11 01:22:47','2022-11-11 16:33:35'),('173','13486793','BRL TRUST DTVM SA','173','Não','RSFN','BRL Trust Distribuidora de Títulos e Valores Mobiliários S.A.','28/11/2016','2022-11-11 01:22:48','2022-11-11 16:33:35'),('174','43180355','PERNAMBUCANAS FINANC S.A. CFI','174','Não','RSFN','Pernambucanas Financiadora S.A. Crédito, Financiamento e Investimento','21/11/2017','2022-11-11 01:22:48','2022-11-11 16:33:35'),('177','65913436','GUIDE','177','Não','RSFN','Guide Investimentos S.A. Corretora de Valores','08/05/2017','2022-11-11 01:22:48','2022-11-11 16:33:35'),('180','02685483','CM CAPITAL MARKETS CCTVM LTDA','180','Não','RSFN','CM Capital Markets Corretora de Câmbio, Títulos e Valores Mobiliários Ltda.','20/01/2017','2022-11-11 01:22:47','2022-11-11 16:33:35'),('182','27406222','DACASA FINANCEIRA S/A - SCFI','182','Não','RSFN','Dacasa Financeira S/A - Sociedade de Crédito, Financiamento e Investimento','09/08/2017','2022-11-11 01:22:48','2022-11-11 16:33:35'),('183','09210106','SOCRED S.A. SCM','183','Não','Internet','Socred S.A. - Sociedade de Crédito ao Microempreendedor','12/06/2017','2022-11-11 01:22:48','2022-11-11 16:33:35'),('184','17298092','BCO ITAÚ BBA S.A.','184','Não','RSFN','Banco Itaú BBA S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('188','33775974','ATIVA S.A. INVESTIMENTOS CCTVM','188','Não','RSFN','Ativa Investimentos S.A. Corretora de Títulos Câmbio e Valores','28/07/2017','2022-11-11 01:22:48','2022-11-11 16:33:35'),('189','07512441','HS FINANCEIRA','189','Não','RSFN','HS Financeira S/A Crédito, Financiamento e Investimentos','05/06/2017','2022-11-11 01:22:47','2022-11-11 16:33:35'),('190','03973814','SERVICOOP','190','Não','RSFN','Cooperativa de Economia e Crédito Mútuo dos Servidores Públicos Estaduais do Rio','16/10/2017','2022-11-11 01:22:47','2022-11-11 16:33:35'),('191','04257795','NOVA FUTURA CTVM LTDA.','191','Não','RSFN','Nova Futura Corretora de Títulos e Valores Mobiliários Ltda.','22/06/2017','2022-11-11 01:22:47','2022-11-11 16:33:35'),('194','20155248','PARMETAL DTVM LTDA','194','Não','RSFN','Parmetal Distribuidora de Títulos e Valores Mobiliários Ltda.','25/10/2017','2022-11-11 01:22:48','2022-11-11 16:33:35'),('196','32648370','FAIR CC S.A.','196','Não','Internet','Fair Corretora de Câmbio S.A.','11/09/2017','2022-11-11 01:22:48','2022-11-11 16:33:35'),('197','16501555','STONE PAGAMENTOS S.A.','197','Não','RSFN','Stone Pagamentos S.A.','18/10/2017','2022-11-11 01:22:48','2022-11-11 16:33:35'),('204','59438325','BCO BRADESCO CARTOES S.A.','204','Sim','RSFN','Banco Bradesco Cartões S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('208','30306294','BANCO BTG PACTUAL S.A.','208','Sim','RSFN','Banco BTG Pactual S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('212','92894922','BANCO ORIGINAL','212','Sim','RSFN','Banco Original S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('213','54403563','BCO ARBI S.A.','213','Sim','RSFN','Banco Arbi S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('217','91884981','BANCO JOHN DEERE S.A.','217','Sim','RSFN','Banco John Deere S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('218','71027866','BCO BS2 S.A.','218','Sim','RSFN','Banco BS2 S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('222','75647891','BCO CRÉDIT AGRICOLE BR S.A.','222','Sim','RSFN','Banco Credit Agrícole Brasil S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('224','58616418','BCO FIBRA S.A.','224','Sim','RSFN','Banco Fibra S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('233','62421979','BANCO CIFRA','233','Não','RSFN','Banco Cifra S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('237','60746948','BCO BRADESCO S.A.','237','Sim','RSFN','Banco Bradesco S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('241','31597552','BCO CLASSICO S.A.','241','Sim','RSFN','Banco Clássico S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('243','33923798','BCO MÁXIMA S.A.','243','Sim','RSFN','Banco Máxima S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('246','28195667','BCO ABC BRASIL S.A.','246','Sim','RSFN','Banco ABC Brasil S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('249','61182408','BANCO INVESTCRED UNIBANCO S.A.','249','Sim','RSFN','Banco Investcred Unibanco S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('250','50585090','BCV','250','Não','RSFN','BCV - Banco de Crédito e Varejo S/A','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('253','52937216','BEXS CC S.A.','253','Não','Internet','Bexs Corretora de Câmbio S/A','11/11/2016','2022-11-11 01:22:48','2022-11-11 16:33:35'),('254','14388334','PARANA BCO S.A.','254','Sim','RSFN','Parana Banco S. A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('260','18236120','NU PAGAMENTOS S.A.','260','Não','RSFN','Nu Pagamentos S.A.','10/10/2017','2022-11-11 01:22:48','2022-11-11 16:33:35'),('265','33644196','BCO FATOR S.A.','265','Sim','RSFN','Banco Fator S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('266','33132044','BCO CEDULA S.A.','266','Sim','RSFN','Banco Cédula S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('268','14511781','BARIGUI CH','268','Não','RSFN','Barigui Companhia Hipotecária','21/12/2017','2022-11-11 01:22:48','2022-11-11 16:33:35'),('269','53518684','HSBC BANCO DE INVESTIMENTO','269','Não','RSFN','HSBC Brasil S.A. Banco de Investimento','07/02/2018','2022-11-11 01:22:48','2022-11-11 16:33:35'),('271','27842177','IB CCTVM LTDA','271','Não','Internet','IB Corretora de Câmbio, Títulos e Valores Mobiliários Ltda.','26/02/2018','2022-11-11 01:22:48','2022-11-11 16:33:35'),('300','33042151','BCO LA NACION ARGENTINA','300','Sim','RSFN','Banco de la Nacion Argentina','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('318','61186680','BCO BMG S.A.','318','Sim','RSFN','Banco BMG S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('320','07450604','BCO CCB BRASIL S.A.','320','Sim','RSFN','China Construction Bank (Brasil) Banco Múltiplo S/A','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('341','60701190','ITAÚ UNIBANCO BM S.A.','341','Sim','RSFN','Itaú Unibanco  S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('366','61533584','BCO SOCIETE GENERALE BRASIL','366','Sim','RSFN','Banco Société Générale Brasil S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('370','61088183','BCO MIZUHO S.A.','370','Não','RSFN','Banco Mizuho do Brasil S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('376','33172537','BCO J.P. MORGAN S.A.','376','Sim','RSFN','Banco J. P. Morgan S. A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('389','17184037','BCO MERCANTIL DO BRASIL S.A.','389','Sim','RSFN','Banco Mercantil do Brasil S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('394','07207996','BCO BRADESCO FINANC. S.A.','394','Sim','RSFN','Banco Bradesco Financiamentos S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('399','01701201','KIRTON BANK','399','Sim','RSFN','Kirton Bank S.A. - Banco Múltiplo','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('412','15173776','BCO CAPITAL S.A.','412','Sim','RSFN','Banco Capital S. A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('422','58160789','BCO SAFRA S.A.','422','Sim','RSFN','Banco Safra S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('456','60498557','BCO MUFG BRASIL S.A.','456','Sim','RSFN','Banco MUFG Brasil S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('464','60518222','BCO SUMITOMO MITSUI BRASIL S.A.','464','Sim','RSFN','Banco Sumitomo Mitsui Brasileiro S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('473','33466988','BCO CAIXA GERAL BRASIL S.A.','473','Sim','RSFN','Banco Caixa Geral - Brasil S.A.','31/03/2009','2022-11-11 01:22:48','2022-11-11 16:33:35'),('477','33042953','CITIBANK N.A.','477','Sim','RSFN','Citibank N.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('479','60394079','BCO ITAUBANK S.A.','479','Não','RSFN','Banco ItauBank S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('487','62331228','DEUTSCHE BANK S.A.BCO ALEMAO','487','Sim','RSFN','Deutsche Bank S.A. - Banco Alemão','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('488','46518205','JPMORGAN CHASE BANK','488','Não','RSFN','JPMorgan Chase Bank, National Association','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('492','49336860','ING BANK N.V.','492','Não','RSFN','ING Bank N.V.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('494','51938876','BCO REP ORIENTAL URUGUAY BCE','494','Não','RSFN','Banco de La Republica Oriental del Uruguay','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('495','44189447','BCO LA PROVINCIA B AIRES BCE','495','Não','RSFN','Banco de La Provincia de Buenos Aires','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('505','32062580','BCO CREDIT SUISSE (BRL) S.A.','505','Sim','RSFN','Banco Credit Suisse (Brasil) S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('545','17352220','SENSO CCVM S.A.','545','Não','Internet','Senso Corretora de Câmbio e Valores Mobiliários S.A.','27/09/2010','2022-11-11 01:22:48','2022-11-11 16:33:35'),('600','59118133','BCO LUSO BRASILEIRO S.A.','600','Sim','RSFN','Banco Luso Brasileiro S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('604','31895683','BCO INDUSTRIAL DO BRASIL S.A.','604','Sim','RSFN','Banco Industrial do Brasil S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('610','78626983','BCO VR S.A.','610','Sim','RSFN','Banco VR S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('611','61820817','BCO PAULISTA S.A.','611','Sim','RSFN','Banco Paulista S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('612','31880826','BCO GUANABARA S.A.','612','Sim','RSFN','Banco Guanabara S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('613','60850229','OMNI BANCO S.A.','613','Sim','RSFN','Omni Banco S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('623','59285411','BANCO PAN','623','Sim','RSFN','Banco Pan S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('626','61348538','BCO FICSA S.A.','626','Sim','RSFN','Banco Ficsa S. A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('630','58497702','BCO INTERCAP S.A.','630','Não','RSFN','Banco Intercap S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('633','68900810','BCO RENDIMENTO S.A.','633','Sim','RSFN','Banco Rendimento S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('634','17351180','BCO TRIANGULO S.A.','634','Sim','RSFN','Banco Triângulo S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('637','60889128','BCO SOFISA S.A.','637','Sim','RSFN','Banco Sofisa S. A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('641','33870163','BCO ALVORADA S.A.','641','Não','RSFN','Banco Alvorada S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('643','62144175','BCO PINE S.A.','643','Sim','RSFN','Banco Pine S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('652','60872504','ITAÚ UNIBANCO HOLDING BM S.A.','652','Sim','RSFN','Itaú Unibanco Holding S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('653','61024352','BCO INDUSVAL S.A.','653','Sim','RSFN','Banco Indusval S. A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('654','92874270','BCO A.J. RENNER S.A.','654','Sim','RSFN','Banco A. J. Renner S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('655','59588111','BCO VOTORANTIM S.A.','655','Sim','RSFN','Banco Votorantim S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('707','62232889','BCO DAYCOVAL S.A','707','Sim','RSFN','Banco Daycoval S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('712','78632767','BCO OURINVEST S.A.','712','Não','RSFN','Banco Ourinvest S.A.','28/01/2014','2022-11-11 01:22:48','2022-11-11 16:33:35'),('719','33884941','BANIF BRASIL BM S.A.','719','Sim','RSFN','Banif - Bco Internacional do Funchal (Brasil) S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('735','00253448','BANCO NEON S.A.','735','Sim','RSFN','Banco Neon S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('739','00558456','BCO CETELEM S.A.','739','Sim','RSFN','Banco Cetelem S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('741','00517645','BCO RIBEIRAO PRETO S.A.','741','Sim','RSFN','Banco Ribeirão Preto S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('743','00795423','BANCO SEMEAR','743','Sim','RSFN','Banco Semear S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('745','33479023','BCO CITIBANK S.A.','745','Sim','RSFN','Banco Citibank S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('746','30723886','BCO MODAL S.A.','746','Sim','RSFN','Banco Modal S.A.','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('747','01023570','BCO RABOBANK INTL BRASIL S.A.','747','Sim','RSFN','Banco Rabobank International Brasil S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('748','01181521','BCO COOPERATIVO SICREDI S.A.','748','Sim','RSFN','Banco Cooperativo Sicredi S. A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('751','29030467','SCOTIABANK BRASIL','751','Sim','RSFN','Scotiabank Brasil S.A. Banco Múltiplo','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('752','01522368','BCO BNP PARIBAS BRASIL S A','752','Sim','RSFN','Banco BNP Paribas Brasil S.A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('753','74828799','NOVO BCO CONTINENTAL S.A. - BM','753','Sim','RSFN','Novo Banco Continental S.A. - Banco Múltiplo','22/04/2002','2022-11-11 01:22:48','2022-11-11 16:33:35'),('754','76543115','BANCO SISTEMA','754','Não','RSFN','Banco Sistema S.A.','15/07/2015','2022-11-11 01:22:48','2022-11-11 16:33:35'),('755','62073200','BOFA MERRILL LYNCH BM S.A.','755','Sim','RSFN','Bank of America Merrill Lynch Banco Múltiplo S.A.','09/11/2007','2022-11-11 01:22:48','2022-11-11 16:33:35'),('756','02038232','BANCOOB','756','Sim','RSFN','Banco Cooperativo do Brasil S/A - Bancoob','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35'),('757','02318507','BCO KEB HANA DO BRASIL S.A.','757','Sim','RSFN','Banco Keb Hana do Brasil S. A.','22/04/2002','2022-11-11 01:22:47','2022-11-11 16:33:35');
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint unsigned NOT NULL,
  `module_id` bigint unsigned NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `clickable` tinyint(1) NOT NULL DEFAULT '1',
  `default_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banners_module_id_foreign` (`module_id`),
  CONSTRAINT `banners_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'Teste','store_wise','2022-10-14-6348fba3c4e03.png',1,'1','2022-10-14 06:03:15','2022-10-14 06:03:26',1,1,1,1,NULL),(2,'Teste 1','store_wise','2022-10-14-6348fbde08401.png',1,'2','2022-10-14 06:04:14','2022-10-21 23:32:12',1,3,1,1,NULL),(3,'Teste','store_wise','2022-10-16-634c080dcab78.png',1,'3','2022-10-16 13:33:01','2022-10-16 13:33:12',1,2,1,1,NULL),(4,'Teste 4','store_wise','2022-10-16-634c085c24a54.png',1,'4','2022-10-16 13:34:20','2022-10-21 23:06:17',1,4,0,1,NULL),(5,'teste novo','store_wise','2022-10-21-6352b908221b1.png',1,'...','2022-10-21 15:21:44','2022-12-28 18:51:35',1,1,1,0,NULL),(6,'re','store_wise','2022-12-16-639cfdb0b5847.png',1,'...','2022-12-16 23:22:24','2022-12-16 23:22:24',1,3,0,1,NULL);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_settings`
--

LOCK TABLES `business_settings` WRITE;
/*!40000 ALTER TABLE `business_settings` DISABLE KEYS */;
INSERT INTO `business_settings` VALUES (2,'stripe','{\"status\":\"0\",\"api_key\":null,\"published_key\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(4,'mail_config','{\"status\":0,\"name\":\"M\\u00faltiplos Delivery\",\"host\":\"mail.6amtech.com\",\"driver\":\"smtp\",\"port\":\"587\",\"username\":\"info@6amtech.com\",\"email_id\":\"info@6amtech.com\",\"encryption\":\"tls\",\"password\":\"password\"}','2022-10-16 21:42:39','2022-12-17 03:41:40'),(5,'fcm_project_id','AAAAh4QfyYU:APA91bFhyfhQOHPsTuJN_0tkMrdVA2GaWYgdtZ-DiHmd4s_dcuzrVu-g0mWXNr3lhW--8Ftcj621iCpgxqSRqVmvWo3Rod0Rc4oQ55P9hGhhfYunTz2DyBHd_D-afxCKa0KMUJ8y77Z1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(6,'push_notification_key','AAAAh4QfyYU:APA91bFhyfhQOHPsTuJN_0tkMrdVA2GaWYgdtZ-DiHmd4s_dcuzrVu-g0mWXNr3lhW--8Ftcj621iCpgxqSRqVmvWo3Rod0Rc4oQ55P9hGhhfYunTz2DyBHd_D-afxCKa0KMUJ8y77Z1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(7,'order_pending_message','{\"status\":1,\"message\":\"Seu pedido foi feito com sucesso\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(8,'order_confirmation_msg','{\"status\":1,\"message\":\"Seu pedido foi confirmado\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(9,'order_processing_message','{\"status\":1,\"message\":\"Seu pedido foi iniciado para cozinhar\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(10,'out_for_delivery_message','{\"status\":1,\"message\":\"Your food is ready for delivery\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(11,'order_delivered_message','{\"status\":1,\"message\":\"Seu pedido foi entregue\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(12,'delivery_boy_assign_message','{\"status\":1,\"message\":\"Seu pedido foi atribuído a um entregador\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(13,'delivery_boy_start_message','{\"status\":1,\"message\":\"Seu pedido foi retirado pelo entregador\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(14,'delivery_boy_delivered_message','{\"status\":1,\"message\":\"Pedido entregue com sucesso\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(15,'terms_and_conditions','<h1><strong>Em produ&ccedil;&atilde;o:</strong></h1>\r\n\r\n<p>Em produ&ccedil;&atilde;o:</p>\r\n\r\n<p>Em produ&ccedil;&atilde;o:</p>\r\n\r\n<p>Em produ&ccedil;&atilde;o:</p>\r\n\r\n<p>Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:</p>','2022-10-16 21:42:39','2022-10-21 16:41:19'),(16,'business_name','Múltiplos Delivery','2022-10-16 21:42:39','2022-10-16 21:42:39'),(17,'currency','BRL','2022-10-16 21:42:39','2022-10-16 21:42:39'),(18,'logo','logo.png','2022-10-16 21:42:39','2022-10-16 21:42:39'),(19,'phone','99889439834934','2022-10-16 21:42:39','2022-10-16 21:42:39'),(20,'email_address','admin@gmail.com','2022-10-16 21:42:39','2022-10-16 21:42:39'),(21,'address','Anajatuba','2022-10-16 21:42:39','2022-10-16 21:42:39'),(22,'footer_text','Todos os diretos reservados @ 2022','2022-10-16 21:42:39','2022-10-16 21:42:39'),(23,'customer_verification','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(24,'map_api_key','AIzaSyAJQVkKZK-0TDQJm71vddtnIuRFHUN1tEk','2022-10-16 21:42:39','2022-10-16 21:42:39'),(25,'about_us','<h1><strong>Em produ&ccedil;&atilde;o:</strong></h1>\r\n\r\n<p>Em produ&ccedil;&atilde;o:</p>\r\n\r\n<p>Em produ&ccedil;&atilde;o:</p>\r\n\r\n<p>Em produ&ccedil;&atilde;o:</p>\r\n\r\n<p>Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:</p>','2022-10-16 21:42:39','2022-10-21 16:41:52'),(26,'privacy_policy','<h2>Em produ&ccedil;&atilde;o:</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Em produ&ccedil;&atilde;o:</p>\r\n\r\n<p>Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:Em produ&ccedil;&atilde;o:</p>\r\n\r\n<p>&nbsp;</p>','2022-10-16 21:42:39','2022-10-21 16:40:18'),(27,'minimum_shipping_charge','10','2022-10-16 21:42:39','2022-10-16 21:42:39'),(28,'per_km_shipping_charge','12','2022-10-16 21:42:39','2022-10-16 21:42:39'),(30,'ssl_commerz_payment','{\"status\":\"0\",\"store_id\":null,\"store_password\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(31,'razor_pay','{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(32,'paypal','{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(33,'paystack','{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(34,'senang_pay','{\"status\":\"1\",\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(35,'order_handover_message','{\"status\":1,\"message\":\"Delivery man is on the way\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(36,'order_cancled_message','{\"status\":1,\"message\":\"Order is canceled by your request\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(37,'timezone','America/Sao_Paulo','2022-10-16 21:42:39','2022-10-16 21:42:39'),(38,'order_delivery_verification',NULL,'2022-10-16 21:42:39','2022-10-16 21:42:39'),(39,'currency_symbol_position','left','2022-10-16 21:42:39','2022-10-16 21:42:39'),(40,'schedule_order','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(41,'app_minimum_version','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(42,'tax',NULL,'2022-10-16 21:42:39','2022-10-16 21:42:39'),(44,'country','BR','2022-10-16 21:42:39','2022-10-16 21:42:39'),(45,'app_url','https://www.google.com','2022-10-16 21:42:39','2022-10-16 21:42:39'),(46,'default_location','{\"lat\":\"-3.2705705156853546\",\"lng\":\"-44.618357108438936\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(47,'twilio_sms','{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(48,'nexmo_sms','{\"status\":\"0\",\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(49,'2factor_sms','{\"status\":\"0\",\"api_key\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(50,'msg91_sms','{\"status\":\"0\",\"template_id\":null,\"authkey\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(51,'free_delivery_over',NULL,'2022-10-16 21:42:39','2022-10-16 21:42:39'),(52,'maintenance_mode','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(53,'app_minimum_version_ios',NULL,'2022-10-16 21:42:39','2022-10-16 21:42:39'),(54,'app_minimum_version_android',NULL,'2022-10-16 21:42:39','2022-10-16 21:42:39'),(55,'app_url_ios',NULL,'2022-10-16 21:42:39','2022-10-16 21:42:39'),(56,'app_url_android',NULL,'2022-10-16 21:42:39','2022-10-16 21:42:39'),(57,'flutterwave','{\"status\":1,\"public_key\":\"FLWPUBK_TEST-3f6a0b6c3d621c4ecbb9beeff516c92b-X\",\"secret_key\":\"FLWSECK_TEST-ec27426eb062491500a9eb95723b5436-X\",\"hash\":\"FLWSECK_TEST951e36220f66\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(58,'dm_maximum_orders','2','2022-10-16 21:42:39','2022-10-16 21:42:39'),(59,'order_confirmation_model','store','2022-10-16 21:42:39','2022-10-16 21:42:39'),(60,'popular_food','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(61,'popular_restaurant','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(62,'new_restaurant','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(63,'mercadopago','{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(64,'map_api_key_server','AIzaSyAJQVkKZK-0TDQJm71vddtnIuRFHUN1tEk','2022-10-16 21:42:39','2022-10-16 21:42:39'),(66,'most_reviewed_foods','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(67,'landing_page_text','{\"header_title_1\":\"Food App\",\"header_title_2\":\"Why stay hungry when you can order from StackFood\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"StackFood is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer & Restaurant Owner\",\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(68,'landing_page_links','{\"app_url_android_status\":\"1\",\"app_url_android\":\"https://play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https://www.apple.com/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https://stackfood.6amtech.com/\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(69,'speciality','[[\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},[\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},[\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]','2022-10-16 21:42:39','2022-10-16 21:42:39'),(70,'testimonial','[[\"img\":\"img-1.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Arn                    aliquam amet animi blanditiis consequatur debitis dictarn                    distinctio, enim error eum iste libero modi nam natusrn                    perferendis possimus quasi sint sit tempora voluptatem. Est,rn                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},[\"img\":\"img-2.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},[\"img\":\"img-3.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},[\"img\":\"img-4.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]','2022-10-16 21:42:39','2022-10-16 21:42:39'),(71,'landing_page_images','{\"top_content_image\":\"double_screen_image.png\",\"about_us_image\":\"about_us_image.png\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(72,'paymob_accept','{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(73,'admin_order_notification','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(76,'service_charge','12','2022-10-16 21:42:39','2022-10-16 21:42:39'),(77,'social_login','[[\"login_medium\":\"google\",\"client_id\":null,\"client_secret\":null,\"status\":\"0\"},[\"login_medium\":\"facebook\",\"client_id\":null,\"client_secret\":null,\"status\":\"0\"}]','2022-10-16 21:42:39','2022-10-16 21:42:39'),(78,'language','[\"pt-BR\"]','2022-10-16 21:42:39','2022-10-16 21:42:39'),(79,'timeformat','24','2022-10-16 21:42:39','2022-10-16 21:42:39'),(80,'canceled_by_restaurant','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(81,'canceled_by_deliveryman','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(82,'show_dm_earning',NULL,'2022-10-16 21:42:39','2022-10-16 21:42:39'),(83,'recaptcha','{\"status\":\"1\",\"site_key\":null,\"secret_key\":null}','2022-11-15 12:27:01','2022-11-15 12:27:01'),(84,'toggle_veg_non_veg','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(85,'toggle_dm_registration','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(86,'toggle_restaurant_registration','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(87,'order_refunded_message','{\"status\":1,\"message\":\"Order is refunded successfully\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(88,'liqpay','{\"status\":\"1\",\"public_key\":null,\"private_key\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(89,'klarna','{\"status\":\"1\",\"region\":\"america\",\"username\":\"PN06804_1a368db08f6d\",\"password\":\"6ljrP6BDJNKT6F2y\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(90,'fatoorah','{\"status\":\"1\",\"api_key\":\"rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(91,'bkash','{\"status\":\"1\",\"api_key\":\"5tunt4masn6pv2hnvte1sb5n3j\",\"api_secret\":\"1vggbqd4hqk9g96o9rrrp2jftvek578v7d2bnerim12a87dbrrka\",\"username\":\"sandboxTestUser\",\"password\":\"hWD@8vtzw0\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(92,'paytabs','{\"status\":\"1\",\"profile_id\":null,\"server_key\":null,\"base_url\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(93,'paytm','{\"status\":\"1\",\"paytm_merchant_key\":null,\"paytm_merchant_mid\":null,\"paytm_merchant_website\":null,\"paytm_refund_url\":null}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(94,'schedule_order_slot_duration','15','2022-10-16 21:42:39','2022-10-16 21:42:39'),(95,'digit_after_decimal_point','2','2022-10-16 21:42:39','2022-10-16 21:42:39'),(96,'icon','icon.png','2022-10-16 21:42:39','2022-10-16 21:42:39'),(97,'toggle_store_registration','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(98,'canceled_by_store','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(99,'parcel_per_km_shipping_charge','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(100,'parcel_minimum_shipping_charge','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(101,'parcel_commission_dm','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(102,'landing_page_links','{\"app_url_android_status\":\"1\",\"app_url_android\":\"https://play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https://www.apple.com/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https://stackfood.6amtech.com/\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(103,'wallet_status','1','2022-10-16 21:42:39','2022-10-16 21:42:39'),(104,'loyalty_point_status','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(105,'ref_earning_status','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(106,'wallet_add_refund','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(107,'loyalty_point_exchange_rate','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(108,'ref_earning_exchange_rate','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(109,'loyalty_point_item_purchase_point','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(110,'loyalty_point_minimum_point','0','2022-10-16 21:42:39','2022-10-16 21:42:39'),(111,'dm_tips_status',NULL,'2022-10-16 21:42:39','2022-10-16 21:42:39'),(112,'free_delivery_over_status',NULL,'2022-10-16 21:42:39','2022-10-16 21:42:39'),(117,'payment_credit_card','{\"status\":\"1\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(118,'payment_debit_card','{\"status\":\"1\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(119,'payment_pix','{\"status\":\"1\"}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(120,'cash_payment','{\"status\":1}','2022-10-16 21:42:39','2022-10-16 21:42:39'),(121,'single_referral_bonus','1',NULL,NULL),(122,'money_referral_bonus','2.50',NULL,NULL),(123,'percentage_referral_bonus','1',NULL,NULL),(124,'fcm_credentials','{\r\n  \"apiKey\": \"AIzaSyCc6vVqyYAqAJuPCrEj6SIfFtolMYtD_8g\",\r\n  \"authDomain\": \"multiplosdelivery-5e66d.firebaseapp.com\",\r\n  \"projectId\": \"multiplosdelivery-5e66d\",\r\n  \"storageBucket\": \"multiplosdelivery-5e66d.appspot.com\",\r\n  \"messagingSenderId\": \"582037260677\",\r\n  \"appId\": \"1:582037260677:web:67cd19f9e5c18c093f5cec\",\r\n  \"measurementId\": \"G-N7M1RDEN02\"\r\n}',NULL,NULL),(128,'cashback_store_available','1',NULL,NULL),(129,'delivery_type','1',NULL,NULL),(130,'delivery_charge','2.50',NULL,NULL),(131,'commission_fee','50',NULL,NULL),(132,'cash_on_delivery','{\"status\":1}',NULL,NULL),(133,'digital_payment','{\"status\":1}',NULL,NULL),(134,'social_login','{\"status\":0}',NULL,NULL),(135,'refund_active_status','{\"status\":1}',NULL,NULL),(136,'wallet_add_fund_bonus','1',NULL,NULL),(137,'admin_commission','10',NULL,NULL),(138,'cashback_default','0.20',NULL,NULL),(139,'is_delivery_radius','0',NULL,NULL),(140,'payment_credit_card_offline','{\"status\":1}',NULL,NULL),(141,'payment_debit_card_offline','{\"status\":1}',NULL,NULL),(142,'payment_pix_offline','{\"status\":1}',NULL,NULL),(143,'delivery_charge_comission','0',NULL,NULL),(144,'opening_time','',NULL,NULL),(145,'closing_time',NULL,NULL,NULL),(147,'test','{\"request\":{\"cart\":\"[{\\\"item_id\\\":3,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"7.2\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[],\\\"quantity\\\":1,\\\"add_on_ids\\\":[],\\\"add_ons\\\":[],\\\"add_on_qtys\\\":[]}]\",\"coupon_discount_amount\":\"0.0\",\"order_amount\":\"7.2\",\"order_type\":\"delivery\",\"payment_method\":\"cash_on_delivery\",\"store_id\":\"2\",\"distance\":\"7.269\",\"discount_amount\":\"0.7999999999999998\",\"tax_amount\":\"0.0\",\"address\":\"Q9PW+48 Anajatuba, MA, Brazil\",\"latitude\":\"-3.2146457\",\"thing\":\"0.0\",\"longitude\":\"-44.6042104\",\"contact_person_name\":\"Joao F\",\"contact_person_number\":\"+5598985766143\",\"address_type\":\"others\",\"road\":null,\"house\":null,\"floor\":null,\"dm_tips\":null},\"header\":{\"host\":[\"403c-2804-3048-4100-3a1-9011-e27b-91ca-cfd6.sa.ngrok.io\"],\"user-agent\":[\"Dart\\/2.18 (dart:io)\"],\"content-length\":[\"3241\"],\"accept-encoding\":[\"gzip\"],\"authorization\":[\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNzllNjIwM2Q4YmE2MDY5NWYzYzJmMjBlYjE2NjZiMTlhNzdjNTlkNWY4OGFlZDYyNDc2ZmNiNTExYzVkMTFmODE1ZGFhODRiYWViNGE1N2QiLCJpYXQiOjE2NzE1NTY5NzkuMjI1MzkyLCJuYmYiOjE2NzE1NTY5NzkuMjI1Mzk3LCJleHAiOjE3MDMwOTI5NzkuMTkxMzU2LCJzdWIiOiIxMyIsInNjb3BlcyI6W119.SKhRes2wt5Tgh6xDEIAdYb_qgT0o0Hy78Rg-h2sKVxUbI3REdoXaoGkgu9blDXrPpSlC5RHEK-fD6f7WgiuK6IA3LDkUI0g8CblifVaHnJzmZjx4NT8CyshwJ_L_bkgalrm8OAoFsDBXD7Rf8iY0eAAu2m3ZhBDk-6F3gL7PddR_HkffUv9cIYaeN5K1V7FaTOvlr4StUb24XSyqNIAwArcPbdinULH-qW-JgHTIEv6YSF_05KsffRLa4OHyBQmeyLeY_Xs-zZr8z97FNFYbN2cCiIvHew0bivi0p4iwze6OIimjVRf2F8WcmzA2XifmWRLF-RyR-ifItxsjPb3P_YoCufpMh9zdJe0nVdcG_xZYrajwKHFx3Z6ye8utKeGw-Uog5zH3TlP4LIj5YKkgpTngUg7DjenazRBhANm6uUj6ynbC-o5PF_WsMH287NAx2RdF8itpR6a6zENVgpyAgQrxAjAcMXKJdCfpQq97wtjAXvixfGdry1ppIkPwTRiwB-Y-Ki7Hy106KINx0zFDroyzkRPYQX-e1ge1AelBV97qrQMAhH0_pZqJI0qHSaakxKYfbFcIbMw8BCM6bcf6xAKN7yuOBey3ZuVgI7L6ER8hJsB4VWp-6TalLh2AWe0QUKO4p0qgbi3wil3XZqwwdzMRZgek06syrYp6H373PiA\"],\"content-type\":[\"multipart\\/form-data; boundary=dart-http-boundary-Fmn.CQe1O0w+kRPOpX-ej5dMCT6aakNp8XfpxOmdtPGlqD9P0dx\"],\"latitude\":[\"\\\"-3.2146457\\\"\"],\"longitude\":[\"\\\"-44.6042104\\\"\"],\"moduleid\":[\"3\"],\"x-forwarded-for\":[\"168.232.134.183\"],\"x-forwarded-proto\":[\"https\"],\"x-localization\":[\"pt\"],\"zoneid\":[\"[1]\"]}}',NULL,NULL),(148,'opening_timexx','{\"cart\":\"[{\\\"item_id\\\":1,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"35.0\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[{\\\"type\\\":\\\"QUATROQUEIJOS\\\",\\\"price\\\":35.0,\\\"stock\\\":0}],\\\"quantity\\\":2,\\\"add_on_ids\\\":[1],\\\"add_ons\\\":[{\\\"id\\\":1,\\\"name\\\":\\\"TOMATE\\\",\\\"price\\\":2.0}],\\\"add_on_qtys\\\":[2]},{\\\"item_id\\\":1,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"35.0\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[{\\\"type\\\":\\\"QUATROQUEIJOS\\\",\\\"price\\\":35.0,\\\"stock\\\":0}],\\\"quantity\\\":1,\\\"add_on_ids\\\":[1,2],\\\"add_ons\\\":[{\\\"id\\\":1,\\\"name\\\":\\\"TOMATE\\\",\\\"price\\\":2.0},{\\\"id\\\":2,\\\"name\\\":\\\"QUEIJO\\\",\\\"price\\\":5.0}],\\\"add_on_qtys\\\":[1,1]},{\\\"item_id\\\":1,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"35.0\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[{\\\"type\\\":\\\"QUATROQUEIJOS\\\",\\\"price\\\":35.0,\\\"stock\\\":0}],\\\"quantity\\\":1,\\\"add_on_ids\\\":[1,2],\\\"add_ons\\\":[{\\\"id\\\":1,\\\"name\\\":\\\"TOMATE\\\",\\\"price\\\":2.0},{\\\"id\\\":2,\\\"name\\\":\\\"QUEIJO\\\",\\\"price\\\":5.0}],\\\"add_on_qtys\\\":[1,1]},{\\\"item_id\\\":1,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"35.0\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[{\\\"type\\\":\\\"QUATROQUEIJOS\\\",\\\"price\\\":35.0,\\\"stock\\\":0}],\\\"quantity\\\":1,\\\"add_on_ids\\\":[1,2,3],\\\"add_ons\\\":[{\\\"id\\\":1,\\\"name\\\":\\\"TOMATE\\\",\\\"price\\\":2.0},{\\\"id\\\":2,\\\"name\\\":\\\"QUEIJO\\\",\\\"price\\\":5.0},{\\\"id\\\":3,\\\"name\\\":\\\"Cebola\\\",\\\"price\\\":100.0}],\\\"add_on_qtys\\\":[1,1,1]},{\\\"item_id\\\":1,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"35.0\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[{\\\"type\\\":\\\"QUATROQUEIJOS\\\",\\\"price\\\":35.0,\\\"stock\\\":0}],\\\"quantity\\\":1,\\\"add_on_ids\\\":[3],\\\"add_ons\\\":[{\\\"id\\\":3,\\\"name\\\":\\\"Cebola\\\",\\\"price\\\":100.0}],\\\"add_on_qtys\\\":[1]},{\\\"item_id\\\":1,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"35.0\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[{\\\"type\\\":\\\"QUATROQUEIJOS\\\",\\\"price\\\":35.0,\\\"stock\\\":0}],\\\"quantity\\\":1,\\\"add_on_ids\\\":[2,3],\\\"add_ons\\\":[{\\\"id\\\":2,\\\"name\\\":\\\"QUEIJO\\\",\\\"price\\\":5.0},{\\\"id\\\":3,\\\"name\\\":\\\"Cebola\\\",\\\"price\\\":100.0}],\\\"add_on_qtys\\\":[1,1]},{\\\"item_id\\\":1,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"35.0\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[{\\\"type\\\":\\\"QUATROQUEIJOS\\\",\\\"price\\\":35.0,\\\"stock\\\":0}],\\\"quantity\\\":1,\\\"add_on_ids\\\":[3],\\\"add_ons\\\":[{\\\"id\\\":3,\\\"name\\\":\\\"Cebola\\\",\\\"price\\\":100.0}],\\\"add_on_qtys\\\":[1]},{\\\"item_id\\\":1,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"35.0\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[{\\\"type\\\":\\\"QUATROQUEIJOS\\\",\\\"price\\\":35.0,\\\"stock\\\":0}],\\\"quantity\\\":1,\\\"add_on_ids\\\":[2],\\\"add_ons\\\":[{\\\"id\\\":2,\\\"name\\\":\\\"QUEIJO\\\",\\\"price\\\":5.0}],\\\"add_on_qtys\\\":[1]}]\",\"coupon_discount_amount\":\"0.0\",\"order_amount\":\"750.0\",\"order_type\":\"delivery\",\"payment_method\":\"cash_on_delivery\",\"store_id\":\"1\",\"distance\":\"5.733\",\"discount_amount\":\"0.0\",\"tax_amount\":\"0.0\",\"address\":\"Q9PW+48 Anajatuba, MA, Brazil\",\"latitude\":\"-3.2146457\",\"thing\":\"0.0\",\"longitude\":\"-44.6042104\",\"contact_person_name\":\"Joao F\",\"contact_person_number\":\"+5598985766143\",\"address_type\":\"others\",\"road\":null,\"house\":null,\"floor\":null,\"dm_tips\":null}',NULL,NULL),(149,'xxxxx','{\"header\":{\"host\":[\"ade0-2804-3048-4100-3a1-55e6-2f6b-3b58-dbe.sa.ngrok.io\"],\"user-agent\":[\"Dart\\/2.18 (dart:io)\"],\"content-length\":[\"3507\"],\"accept-encoding\":[\"gzip\"],\"authorization\":[\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZTc2MTZmNWJlZGJkODQyMmRiMmExOWE3MTVlN2Y1NzUzNmI4MjZlMWFiZDljZTYxODM5ZTE4ODEzMWQ3M2ZhOWY2MGFiOTQ1MDhjM2NhZjgiLCJpYXQiOjE2NzIzODA5MTMuMjgzMTY0LCJuYmYiOjE2NzIzODA5MTMuMjgzMTY3LCJleHAiOjE3MDM5MTY5MTMuMjQyMTI3LCJzdWIiOiIxNCIsInNjb3BlcyI6W119.mdzixuBSFLqx0-ONRsNSJKAjGcX9mq679IkfAHLxgfdO2vA10ImVMPyyKfWPCl0R_q3lwl2hWeHo3_OZmyLgQYCFwhvselte-6Orxas4y6IwxxQlDQYrUpPDeH-jQFyZqovOQ8TKTo8lItRu7UsYDwllHAsjvfSJ95iILGOQwI9eTyYvRNgwl0O_MEnBUdyeaa1rlRbn7FzOSOiDGbiM4sZXpmXjSjhw2NpI27vJTQ-uRvtnbIdGtZpBlIP_o-WN84NI0LGFA00NMQ3ObJJjZ14jBB-h2cEqC90fQONw_dE15h1FByA1tjYaOHt5HG-diUq8nKxcSgGVxBxuL4fX-tji-_DxyAD9UHPJr9w2h8wm6cvrbyRrK-LTrc9-E2hWS_qy-opsAwNGtboQmNybOkKn1kggkpf3MuEFuL6vNZL6rLmVsN-SQGqBTyXWftOwzk0cF5t8MpzJcQEYZ2HHA57ZzIEsRWONSkENCmvZmIeR7UIXj7Q4TS75uYUJEHvEcwsoFVRWdmgbGjEinr_Ve5J4Lpif1SQBwf8k53DcEmYY3A_myMiCtEKmxkhdoJdkyqQJXmecATrYrqOzs8eKqtW3Y2yhIpBmM9EsENvZWshIVKexDzRc6SC55co7jmV1SiZJXV2gpuwQQ6wl_ZOSN-1kFZTx9Q03qwd-sOZ0w9U\"],\"content-type\":[\"multipart\\/form-data; boundary=dart-http-boundary-3De9b_2PPB3J.LjN4mz-.9koDgoCUg.it5B8WQSEu1wTyy3Xzt0\"],\"latitude\":[\"\\\"-3.2147259\\\"\"],\"longitude\":[\"\\\"-44.6041769\\\"\"],\"moduleid\":[\"1\"],\"x-forwarded-for\":[\"168.232.134.232\"],\"x-forwarded-proto\":[\"https\"],\"x-localization\":[\"pt\"],\"zoneid\":[\"[1]\"]},\"body\":{\"cart\":\"[{\\\"item_id\\\":1,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"35.0\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[{\\\"type\\\":\\\"QUATROQUEIJOS\\\",\\\"price\\\":35.0,\\\"stock\\\":0}],\\\"quantity\\\":4,\\\"add_on_ids\\\":[],\\\"add_ons\\\":[],\\\"add_on_qtys\\\":[]},{\\\"item_id\\\":1,\\\"item_campaign_id\\\":null,\\\"price\\\":\\\"35.0\\\",\\\"variant\\\":\\\"\\\",\\\"variation\\\":[{\\\"type\\\":\\\"QUATROQUEIJOS\\\",\\\"price\\\":35.0,\\\"stock\\\":0}],\\\"quantity\\\":1,\\\"add_on_ids\\\":[1],\\\"add_ons\\\":[{\\\"id\\\":1,\\\"name\\\":\\\"TOMATE\\\",\\\"price\\\":2.0}],\\\"add_on_qtys\\\":[1]}]\",\"coupon_discount_amount\":\"0.0\",\"order_amount\":\"177.0\",\"order_type\":\"delivery\",\"payment_method\":\"cash_on_delivery\",\"store_id\":\"1\",\"distance\":\"5.728\",\"discount_amount\":\"0.0\",\"tax_amount\":\"0.0\",\"address\":\"Q9PW+48 Anajatuba, MA, Brazil\",\"latitude\":\"-3.2147259\",\"thing\":\"0.0\",\"longitude\":\"-44.6041769\",\"contact_person_name\":\"Igor Sanches\",\"contact_person_number\":\"+5598985766514\",\"address_type\":\"others\",\"road\":null,\"house\":null,\"floor\":null,\"dm_tips\":null}}',NULL,NULL);
/*!40000 ALTER TABLE `business_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_store`
--

DROP TABLE IF EXISTS `campaign_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_store` (
  `campaign_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_store`
--

LOCK TABLES `campaign_store` WRITE;
/*!40000 ALTER TABLE `campaign_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `module_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_module_id_foreign` (`module_id`),
  CONSTRAINT `campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashback_historials`
--

DROP TABLE IF EXISTS `cashback_historials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashback_historials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `store_id` int NOT NULL,
  `order_id` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `delivery_charge` decimal(8,2) DEFAULT '0.00',
  `cashback` decimal(8,2) NOT NULL,
  `cashback_percentage` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashback_historials`
--

LOCK TABLES `cashback_historials` WRITE;
/*!40000 ALTER TABLE `cashback_historials` DISABLE KEYS */;
INSERT INTO `cashback_historials` VALUES (1,14,1,1000,288.00,0.00,8.64,3,'2022-12-28 19:13:23','2022-12-28 19:13:23');
/*!40000 ALTER TABLE `cashback_historials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int NOT NULL,
  `position` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `module_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_module_id_foreign` (`module_id`),
  CONSTRAINT `categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Pizzaria','2022-10-03-633b11b55ce05.png',0,0,1,'2022-10-01 22:41:59','2022-10-03 16:45:41',0,1),(2,'Pizza','def.png',1,1,1,'2022-10-01 22:43:58','2022-10-01 22:43:58',0,1),(3,'Burgers','2022-10-03-633b4f6bdcd50.png',0,0,1,'2022-10-03 21:08:59','2022-10-03 21:08:59',0,1),(4,'Açaí','2022-10-03-633b5115399f8.png',0,0,1,'2022-10-03 21:16:05','2022-10-03 21:16:05',0,1),(5,'Restaurante','2022-10-03-633b51f723bad.png',0,0,1,'2022-10-03 21:19:51','2022-10-16 16:43:09',0,1),(6,'Lanchonete','2022-10-03-633b545d6017a.png',0,0,1,'2022-10-03 21:30:05','2022-10-03 21:30:05',0,1),(7,'Padaria','2022-10-03-633b551aa11c7.png',0,0,1,'2022-10-03 21:33:14','2022-10-03 21:33:14',0,1),(8,'Bar','2022-10-03-633b55bcdb225.png',0,0,1,'2022-10-03 21:35:56','2022-10-03 21:35:56',0,1),(9,'Mercado','2022-10-03-633b63eb172e5.png',0,0,1,'2022-10-03 22:36:27','2022-11-15 22:35:21',0,3),(10,'Frutaria','2022-10-03-633b66a0711cf.png',0,0,1,'2022-10-03 22:48:00','2022-10-03 22:48:00',0,3),(11,'Açougue','2022-10-03-633b6741efb8c.png',0,0,1,'2022-10-03 22:50:41','2022-10-03 22:50:41',0,3),(12,'Peixaria','2022-10-03-633b6773c4d44.png',0,0,1,'2022-10-03 22:51:31','2022-10-03 22:51:31',0,3),(13,'Vestuário','2022-10-03-633b6a0a322fd.png',0,0,1,'2022-10-03 23:02:34','2022-10-22 00:07:10',0,4),(14,'Moveis e eletrônicos','2022-10-03-633b6a8c8021d.png',0,0,1,'2022-10-03 23:04:44','2022-10-22 00:07:21',1,4),(15,'Pet Shop','2022-10-03-633b6ac1112ce.png',0,0,1,'2022-10-03 23:05:37','2022-10-03 23:05:37',0,4),(16,'Papelaria','2022-10-03-633b6b444e26f.png',0,0,1,'2022-10-03 23:07:48','2022-10-03 23:07:48',0,4),(17,'Sex Shop','2022-10-03-633b6b863c37c.png',0,0,1,'2022-10-03 23:08:54','2022-10-03 23:08:54',0,4),(18,'Farmácia','2022-10-03-633b6bae23491.png',0,0,1,'2022-10-03 23:09:34','2022-10-03 23:09:34',0,2),(19,'Ótica','2022-10-03-633b6bcf80b90.png',0,0,1,'2022-10-03 23:10:07','2022-10-03 23:10:07',0,2),(20,'Eletrônicos','def.png',14,1,1,'2022-10-03 23:11:42','2022-10-03 23:11:42',0,4),(21,'Moda masculina','def.png',13,1,1,'2022-10-03 23:12:30','2022-10-03 23:12:30',0,4),(22,'Gêneros alimentícios','def.png',9,1,1,'2022-10-03 23:13:17','2022-10-03 23:13:17',0,3),(23,'Água & Gás','2022-10-03-633b8a40e43be.png',0,0,1,'2022-10-04 01:20:00','2022-10-04 01:20:00',0,3),(24,'Vitaminas','def.png',18,1,1,'2022-10-14 23:14:59','2022-10-14 23:14:59',0,2),(25,'Equipamentos','def.png',18,1,1,'2022-10-14 23:16:06','2022-10-14 23:16:06',0,2);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint NOT NULL DEFAULT '0',
  `feedback` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `reply` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned NOT NULL,
  `sender_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_id` bigint unsigned NOT NULL,
  `receiver_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_message_id` bigint unsigned DEFAULT NULL,
  `last_message_time` timestamp NULL DEFAULT NULL,
  `unread_message_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (1,1,'customer',0,'admin',2,'2022-10-01 06:29:11',0,'2022-10-01 06:28:11','2022-10-01 06:29:28'),(2,4,'customer',5,'vendor',6,'2022-10-14 16:47:30',0,'2022-10-14 16:10:28','2022-10-14 16:48:03');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint DEFAULT '0',
  `module_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`),
  KEY `coupons_module_id_foreign` (`module_id`),
  CONSTRAINT `coupons_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'US Dollar','USD','$',1.00,NULL,NULL),(2,'Canadian Dollar','CAD','CA$',1.00,NULL,NULL),(3,'Euro','EUR','€',1.00,NULL,NULL),(4,'United Arab Emirates Dirham','AED','د.إ.‏',1.00,NULL,NULL),(5,'Afghan Afghani','AFN','؋',1.00,NULL,NULL),(6,'Albanian Lek','ALL','L',1.00,NULL,NULL),(7,'Armenian Dram','AMD','֏',1.00,NULL,NULL),(8,'Argentine Peso','ARS','$',1.00,NULL,NULL),(9,'Australian Dollar','AUD','$',1.00,NULL,NULL),(10,'Azerbaijani Manat','AZN','₼',1.00,NULL,NULL),(11,'Bosnia-Herzegovina Convertible Mark','BAM','KM',1.00,NULL,NULL),(12,'Bangladeshi Taka','BDT','৳',1.00,NULL,NULL),(13,'Bulgarian Lev','BGN','лв.',1.00,NULL,NULL),(14,'Bahraini Dinar','BHD','د.ب.‏',1.00,NULL,NULL),(15,'Burundian Franc','BIF','FBu',1.00,NULL,NULL),(16,'Brunei Dollar','BND','B$',1.00,NULL,NULL),(17,'Bolivian Boliviano','BOB','Bs',1.00,NULL,NULL),(18,'Brazilian Real','BRL','R$',1.00,NULL,NULL),(19,'Botswanan Pula','BWP','P',1.00,NULL,NULL),(20,'Belarusian Ruble','BYN','Br',1.00,NULL,NULL),(21,'Belize Dollar','BZD','$',1.00,NULL,NULL),(22,'Congolese Franc','CDF','FC',1.00,NULL,NULL),(23,'Swiss Franc','CHF','CHf',1.00,NULL,NULL),(24,'Chilean Peso','CLP','$',1.00,NULL,NULL),(25,'Chinese Yuan','CNY','¥',1.00,NULL,NULL),(26,'Colombian Peso','COP','$',1.00,NULL,NULL),(27,'Costa Rican Colón','CRC','₡',1.00,NULL,NULL),(28,'Cape Verdean Escudo','CVE','$',1.00,NULL,NULL),(29,'Czech Republic Koruna','CZK','Kč',1.00,NULL,NULL),(30,'Djiboutian Franc','DJF','Fdj',1.00,NULL,NULL),(31,'Danish Krone','DKK','Kr.',1.00,NULL,NULL),(32,'Dominican Peso','DOP','RD$',1.00,NULL,NULL),(33,'Algerian Dinar','DZD','د.ج.‏',1.00,NULL,NULL),(34,'Estonian Kroon','EEK','kr',1.00,NULL,NULL),(35,'Egyptian Pound','EGP','E£‏',1.00,NULL,NULL),(36,'Eritrean Nakfa','ERN','Nfk',1.00,NULL,NULL),(37,'Ethiopian Birr','ETB','Br',1.00,NULL,NULL),(38,'British Pound Sterling','GBP','£',1.00,NULL,NULL),(39,'Georgian Lari','GEL','GEL',1.00,NULL,NULL),(40,'Ghanaian Cedi','GHS','GH¢',1.00,NULL,NULL),(41,'Guinean Franc','GNF','FG',1.00,NULL,NULL),(42,'Guatemalan Quetzal','GTQ','Q',1.00,NULL,NULL),(43,'Hong Kong Dollar','HKD','HK$',1.00,NULL,NULL),(44,'Honduran Lempira','HNL','L',1.00,NULL,NULL),(45,'Croatian Kuna','HRK','kn',1.00,NULL,NULL),(46,'Hungarian Forint','HUF','Ft',1.00,NULL,NULL),(47,'Indonesian Rupiah','IDR','Rp',1.00,NULL,NULL),(48,'Israeli New Sheqel','ILS','₪',1.00,NULL,NULL),(49,'Indian Rupee','INR','₹',1.00,NULL,NULL),(50,'Iraqi Dinar','IQD','ع.د',1.00,NULL,NULL),(51,'Iranian Rial','IRR','﷼',1.00,NULL,NULL),(52,'Icelandic Króna','ISK','kr',1.00,NULL,NULL),(53,'Jamaican Dollar','JMD','$',1.00,NULL,NULL),(54,'Jordanian Dinar','JOD','د.ا‏',1.00,NULL,NULL),(55,'Japanese Yen','JPY','¥',1.00,NULL,NULL),(56,'Kenyan Shilling','KES','Ksh',1.00,NULL,NULL),(57,'Cambodian Riel','KHR','៛',1.00,NULL,NULL),(58,'Comorian Franc','KMF','FC',1.00,NULL,NULL),(59,'South Korean Won','KRW','CF',1.00,NULL,NULL),(60,'Kuwaiti Dinar','KWD','د.ك.‏',1.00,NULL,NULL),(61,'Kazakhstani Tenge','KZT','₸.',1.00,NULL,NULL),(62,'Lebanese Pound','LBP','ل.ل.‏',1.00,NULL,NULL),(63,'Sri Lankan Rupee','LKR','Rs',1.00,NULL,NULL),(64,'Lithuanian Litas','LTL','Lt',1.00,NULL,NULL),(65,'Latvian Lats','LVL','Ls',1.00,NULL,NULL),(66,'Libyan Dinar','LYD','د.ل.‏',1.00,NULL,NULL),(67,'Moroccan Dirham','MAD','د.م.‏',1.00,NULL,NULL),(68,'Moldovan Leu','MDL','L',1.00,NULL,NULL),(69,'Malagasy Ariary','MGA','Ar',1.00,NULL,NULL),(70,'Macedonian Denar','MKD','Ден',1.00,NULL,NULL),(71,'Myanma Kyat','MMK','K',1.00,NULL,NULL),(72,'Macanese Pataca','MOP','MOP$',1.00,NULL,NULL),(73,'Mauritian Rupee','MUR','Rs',1.00,NULL,NULL),(74,'Mexican Peso','MXN','$',1.00,NULL,NULL),(75,'Malaysian Ringgit','MYR','RM',1.00,NULL,NULL),(76,'Mozambican Metical','MZN','MT',1.00,NULL,NULL),(77,'Namibian Dollar','NAD','N$',1.00,NULL,NULL),(78,'Nigerian Naira','NGN','₦',1.00,NULL,NULL),(79,'Nicaraguan Córdoba','NIO','C$',1.00,NULL,NULL),(80,'Norwegian Krone','NOK','kr',1.00,NULL,NULL),(81,'Nepalese Rupee','NPR','Re.',1.00,NULL,NULL),(82,'New Zealand Dollar','NZD','$',1.00,NULL,NULL),(83,'Omani Rial','OMR','ر.ع.‏',1.00,NULL,NULL),(84,'Panamanian Balboa','PAB','B/.',1.00,NULL,NULL),(85,'Peruvian Nuevo Sol','PEN','S/',1.00,NULL,NULL),(86,'Philippine Peso','PHP','₱',1.00,NULL,NULL),(87,'Pakistani Rupee','PKR','Rs',1.00,NULL,NULL),(88,'Polish Zloty','PLN','zł',1.00,NULL,NULL),(89,'Paraguayan Guarani','PYG','₲',1.00,NULL,NULL),(90,'Qatari Rial','QAR','ر.ق.‏',1.00,NULL,NULL),(91,'Romanian Leu','RON','lei',1.00,NULL,NULL),(92,'Serbian Dinar','RSD','din.',1.00,NULL,NULL),(93,'Russian Ruble','RUB','₽.',1.00,NULL,NULL),(94,'Rwandan Franc','RWF','FRw',1.00,NULL,NULL),(95,'Saudi Riyal','SAR','ر.س.‏',1.00,NULL,NULL),(96,'Sudanese Pound','SDG','ج.س.',1.00,NULL,NULL),(97,'Swedish Krona','SEK','kr',1.00,NULL,NULL),(98,'Singapore Dollar','SGD','$',1.00,NULL,NULL),(99,'Somali Shilling','SOS','Sh.so.',1.00,NULL,NULL),(100,'Syrian Pound','SYP','LS‏',1.00,NULL,NULL),(101,'Thai Baht','THB','฿',1.00,NULL,NULL),(102,'Tunisian Dinar','TND','د.ت‏',1.00,NULL,NULL),(103,'Tongan Paʻanga','TOP','T$',1.00,NULL,NULL),(104,'Turkish Lira','TRY','₺',1.00,NULL,NULL),(105,'Trinidad and Tobago Dollar','TTD','$',1.00,NULL,NULL),(106,'New Taiwan Dollar','TWD','NT$',1.00,NULL,NULL),(107,'Tanzanian Shilling','TZS','TSh',1.00,NULL,NULL),(108,'Ukrainian Hryvnia','UAH','₴',1.00,NULL,NULL),(109,'Ugandan Shilling','UGX','USh',1.00,NULL,NULL),(110,'Uruguayan Peso','UYU','$',1.00,NULL,NULL),(111,'Uzbekistan Som','UZS','so\'m',1.00,NULL,NULL),(112,'Venezuelan Bolívar','VEF','Bs.F.',1.00,NULL,NULL),(113,'Vietnamese Dong','VND','₫',1.00,NULL,NULL),(114,'CFA Franc BEAC','XAF','FCFA',1.00,NULL,NULL),(115,'CFA Franc BCEAO','XOF','CFA',1.00,NULL,NULL),(116,'Yemeni Rial','YER','﷼‏',1.00,NULL,NULL),(117,'South African Rand','ZAR','R',1.00,NULL,NULL),(118,'Zambian Kwacha','ZMK','ZK',1.00,NULL,NULL),(119,'Zimbabwean Dollar','ZWL','Z$',1.00,NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `contact_person_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint unsigned NOT NULL,
  `floor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_addresses`
--

LOCK TABLES `customer_addresses` WRITE;
/*!40000 ALTER TABLE `customer_addresses` DISABLE KEYS */;
INSERT INTO `customer_addresses` VALUES (1,'home','+5598984859580','R. Benedito Leite, 14 - Anajatuba, MA, 65490-000, Brazil','-3.2705506476401793','-44.618251249194145',13,'Adriano Rodrigues','2022-10-14 05:10:16','2022-10-14 05:10:16',1,NULL,NULL,NULL),(2,'office','+5598984859580','R. Benedito Leite, 14 A - Anajatuba, MA, 65490-000, Brazil','-3.270549643450024','-44.61825091391802',13,'Adriano Rodrigues','2022-10-15 10:01:46','2022-12-28 00:33:23',1,'Andar 2','rrkkr','Casa 31');
/*!40000 ALTER TABLE `customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_m_reviews`
--

DROP TABLE IF EXISTS `d_m_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_m_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_m_reviews`
--

LOCK TABLES `d_m_reviews` WRITE;
/*!40000 ALTER TABLE `d_m_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_m_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_histories`
--

DROP TABLE IF EXISTS `delivery_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_histories`
--

LOCK TABLES `delivery_histories` WRITE;
/*!40000 ALTER TABLE `delivery_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_man_wallets`
--

DROP TABLE IF EXISTS `delivery_man_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_man_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint unsigned NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_man_wallets`
--

LOCK TABLES `delivery_man_wallets` WRITE;
/*!40000 ALTER TABLE `delivery_man_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_man_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_men`
--

DROP TABLE IF EXISTS `delivery_men`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_men` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `earning` tinyint(1) NOT NULL DEFAULT '1',
  `current_orders` int NOT NULL DEFAULT '0',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `store_id` bigint DEFAULT NULL,
  `application_status` enum('approved','denied','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `order_count` int unsigned NOT NULL DEFAULT '0',
  `assigned_order_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_men_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_men`
--

LOCK TABLES `delivery_men` WRITE;
/*!40000 ALTER TABLE `delivery_men` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_men` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `store_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verifications`
--

DROP TABLE IF EXISTS `email_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verifications`
--

LOCK TABLES `email_verifications` WRITE;
/*!40000 ALTER TABLE `email_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_roles`
--

DROP TABLE IF EXISTS `employee_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_roles`
--

LOCK TABLES `employee_roles` WRITE;
/*!40000 ALTER TABLE `employee_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `amount` decimal(8,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_campaigns`
--

DROP TABLE IF EXISTS `item_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_campaigns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `category_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `store_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `module_id` bigint unsigned NOT NULL,
  `stock` int DEFAULT '0',
  `unit_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_campaigns_module_id_foreign` (`module_id`),
  CONSTRAINT `item_campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_campaigns`
--

LOCK TABLES `item_campaigns` WRITE;
/*!40000 ALTER TABLE `item_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `category_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `store_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int NOT NULL DEFAULT '0',
  `avg_rating` double(16,14) NOT NULL DEFAULT '0.00000000000000',
  `rating_count` int NOT NULL DEFAULT '0',
  `rating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` bigint unsigned NOT NULL,
  `stock` int DEFAULT '0',
  `unit_id` bigint unsigned DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `items_module_id_foreign` (`module_id`),
  CONSTRAINT `items_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Pizza Tamanho familia','Pizza 8 fatias. Escolha o sabor','2022-10-01-6338c35714e1a.png',2,'[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}]','[{\"type\":\"QUATROQUEIJOS\",\"price\":35,\"stock\":0},{\"type\":\"FRANGOCOMCATUPIRY\",\"price\":38,\"stock\":0},{\"type\":\"PORTUGUESA\",\"price\":45,\"stock\":0}]','[\"1\",\"2\",\"3\"]','[\"1\"]','[{\"name\":\"choice_1\",\"title\":\"Sabor\",\"options\":[\"QUATRO QUEIJOS\",\" FRANGO COM CATUPIRY\",\" PORTUGUESA\"]}]',35.00,0.00,'percent',0.00,'percent','00:00:00','23:59:59',0,1,1,'2022-10-01 22:46:47','2022-12-28 19:13:23',23,5.00000000000000,1,'{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}',1,0,1,'[]'),(2,'Arroz','teste teste teste','2022-10-03-633b716588608.png',22,'[{\"id\":\"9\",\"position\":1},{\"id\":\"22\",\"position\":2}]','[]','[]','[]','[]',6.00,0.00,'percent',0.00,'percent','00:00:00','23:59:59',0,1,2,'2022-10-03 23:33:57','2022-12-30 06:36:02',1,0.00000000000000,0,NULL,3,47,100,'[]'),(3,'Café','teste teste','2022-10-03-633b71d444c3e.png',22,'[{\"id\":\"9\",\"position\":1},{\"id\":\"22\",\"position\":2}]','[]','[]','[]','[]',8.00,0.00,'percent',10.00,'percent','00:00:00','23:59:59',0,1,2,'2022-10-03 23:35:48','2022-12-30 06:36:02',0,0.00000000000000,0,NULL,3,12,100,'[]'),(4,'Açúcar','teste teste teste','2022-10-03-633b72420c35a.png',22,'[{\"id\":\"9\",\"position\":1},{\"id\":\"22\",\"position\":2}]','[]','[]','[]','[]',5.50,0.00,'percent',0.00,'percent','00:00:00','23:59:59',0,1,2,'2022-10-03 23:37:38','2022-12-17 04:43:22',2,0.00000000000000,0,NULL,3,0,1,'[]'),(5,'ventilador','teste teste teste','2022-10-14-6349e8040280a.png',20,'[{\"id\":\"14\",\"position\":1},{\"id\":\"20\",\"position\":2}]','[]','[]','[]','[]',100.00,0.00,'percent',0.00,'percent','00:00:00','23:59:59',0,1,4,'2022-10-14 22:51:48','2022-12-22 03:45:52',0,0.00000000000000,0,NULL,4,40,1,'[\"2022-10-14-6349e8040233e.png\"]'),(6,'Camisa Masculina','Camisa Masculina','2022-10-14-6349e9670804f.png',21,'[{\"id\":\"13\",\"position\":1},{\"id\":\"21\",\"position\":2}]','[{\"type\":\"AzulP\",\"price\":50,\"stock\":5},{\"type\":\"AzulM\",\"price\":50,\"stock\":1},{\"type\":\"BrancaM\",\"price\":50,\"stock\":1}]','[]','[\"2\"]','[{\"name\":\"choice_2\",\"title\":\"Cor\",\"options\":[\"Azul P\",\" Azul M\",\" Branca M\"]}]',50.00,0.00,'percent',0.00,'percent','00:00:00','23:59:59',0,1,4,'2022-10-14 22:57:43','2022-12-22 03:42:41',0,0.00000000000000,0,NULL,4,7,3,'[\"2022-10-14-6349ef67d5294.png\"]'),(7,'Vitamina D','Vitamina D\r\nVitamina D\r\nVitamina D','2022-10-14-6349ee2721647.png',24,'[{\"id\":\"18\",\"position\":1},{\"id\":\"24\",\"position\":2}]','[]','[]','[]','[]',26.84,0.00,'percent',0.00,'percent','00:00:00','23:59:59',0,1,3,'2022-10-14 23:17:59','2022-10-14 23:17:59',0,0.00000000000000,0,NULL,2,20,3,'[\"2022-10-14-6349ee272116a.png\"]'),(8,'Medidor de pressão','Medidor de pressão \r\nMedidor de pressão Medidor de pressão','2022-10-14-6349ee9342b6e.png',25,'[{\"id\":\"18\",\"position\":1},{\"id\":\"25\",\"position\":2}]','[]','[]','[]','[]',150.00,0.00,'percent',19.00,'amount','00:00:00','23:59:59',0,1,3,'2022-10-14 23:19:47','2022-10-26 01:31:26',0,0.00000000000000,0,NULL,2,50,3,'[\"2022-10-14-6349ee934273f.png\"]');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty_point_transactions`
--

DROP TABLE IF EXISTS `loyalty_point_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_point_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `transaction_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `debit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty_point_transactions`
--

LOCK TABLES `loyalty_point_transactions` WRITE;
/*!40000 ALTER TABLE `loyalty_point_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyalty_point_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint unsigned DEFAULT NULL,
  `sender_id` bigint unsigned DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Kk',NULL,1,'2022-10-01 06:28:11','2022-10-23 18:47:10'),(2,1,2,'jkewkewkj',NULL,1,'2022-10-01 06:29:11','2022-10-01 06:29:28'),(3,2,4,'Oi',NULL,1,'2022-10-14 16:10:28','2022-10-14 16:46:39'),(4,2,4,'Teste',NULL,1,'2022-10-14 16:10:40','2022-10-14 16:46:39'),(5,2,5,'Oi',NULL,1,'2022-10-14 16:46:57','2022-10-20 23:37:07'),(6,2,5,'Estamos com problemas no envío',NULL,1,'2022-10-14 16:47:30','2022-10-20 23:37:07');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2016_06_01_000001_create_oauth_auth_codes_table',30),(2,'2016_06_01_000002_create_oauth_access_tokens_table',30),(3,'2016_06_01_000003_create_oauth_refresh_tokens_table',30),(4,'2016_06_01_000004_create_oauth_clients_table',30),(5,'2016_06_01_000005_create_oauth_personal_access_clients_table',30),(8,'2021_06_17_054551_create_soft_credentials_table',31),(9,'2022_04_10_030533_create_newsletters_table',32),(10,'2022_04_12_015827_create_social_media_table',32),(11,'2022_04_12_215009_create_jobs_table',32),(12,'2022_04_21_145207_add_column_to_modules_table',32),(13,'2022_05_12_170027_add_column_to_customer_addresses_table',33),(14,'2022_05_14_155444_add_all_zones_column_to_modules_table',33),(15,'2022_05_26_120821_change_data_column_to_user_notifiations_table',33),(17,'2022_03_31_103827_create_loyalty_point_transactions_table',34),(18,'2022_04_09_161150_add_wallet_point_columns_to_users_table',34),(19,'2022_05_14_122133_add_dm_tips_column_to_orders_table',34),(20,'2022_05_14_122603_add_dm_tips_column_to_order_transactions_table',34),(21,'2022_05_17_153333_add_ref_code_to_users_table',34),(22,'2022_07_31_103626_add_free_delivery_by_column_to_orders_table',35),(23,'2022_09_10_112137_create_user_infos_table',36),(24,'2022_09_10_112203_create_conversations_table',36),(25,'2022_09_10_112220_create_messages_table',36),(26,'2022_03_31_103418_create_wallet_transactions_table',37),(27,'2022_10_18_092639_create_refunds_table',38),(28,'2022_10_18_093323_add_refund_request_cancel_column_to_orders_table',38),(29,'2022_10_18_093529_create_refund_reasons_table',38),(30,'2022_10_19_150319_add_delivery_column_to_parcel_categories_table',38),(31,'2022_10_19_165501_add_default_link_column_to_banners_table',38),(32,'2022_10_20_105050_module_zone',38),(33,'2022_10_22_115553_add_is_logged_column_to_admins_table',38),(34,'2022_10_22_122336_add_is_logged_column_to_vendor_employees_table',39),(35,'2022_10_25_153214_add_payment_method_columns_to_zones_table',38),(36,'2022_10_31_165427_add_rename_delivery_charge_column_to_stores_table',40),(37,'2022_11_05_094404_add_delivery_fee_comission_to_order_transactions_table',38),(38,'2022_11_13_130054_create_contacts_table',41),(39,'2022_11_15_111925_create_expenses_table',41),(40,'2022_11_15_112413_add_expense_column_to_order_transactions_table',38),(41,'2022_12_11_182236_create_cashback_historials_table',42),(42,'2022_12_12_135928_create_affiliate_historicals_table',43);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_types`
--

DROP TABLE IF EXISTS `module_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_types`
--

LOCK TABLES `module_types` WRITE;
/*!40000 ALTER TABLE `module_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_zone`
--

DROP TABLE IF EXISTS `module_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_zone` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module_id` bigint unsigned NOT NULL,
  `zone_id` bigint unsigned NOT NULL,
  `per_km_shipping_charge` double(23,2) DEFAULT NULL,
  `minimum_shipping_charge` double(23,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_zone`
--

LOCK TABLES `module_zone` WRITE;
/*!40000 ALTER TABLE `module_zone` DISABLE KEYS */;
INSERT INTO `module_zone` VALUES (1,1,1,0.00,0.00),(2,2,1,0.00,0.00),(3,3,1,0.00,0.00),(4,4,1,0.00,0.00);
/*!40000 ALTER TABLE `module_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `stores_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_id` int NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `all_zone_service` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'COMIDA','food','2022-09-30-6337887a81b52.png',1,1,'2022-10-01 00:23:22','2022-10-04 01:22:41','2022-10-03-633b8ae13ab49.png',2,'<p>Lanchonetes</p>',0),(2,'FARMÁCIA','pharmacy','2022-10-03-633b06053c39b.png',1,1,'2022-10-03 15:55:49','2022-11-15 22:33:28','2022-10-03-633b060536c60.png',1,NULL,0),(3,'SUPER MERCADO','grocery','2022-10-03-633b0b47472a3.png',1,1,'2022-10-03 16:18:15','2022-11-15 22:36:18','2022-10-03-633b0b473b502.png',1,NULL,0),(4,'SHOPING','ecommerce','2022-10-03-633b0e6a7da5c.png',1,1,'2022-10-03 16:31:38','2022-12-04 07:33:42','2022-10-03-633b0e6a7b5d2.png',1,NULL,1);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subscribers email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `newsletters_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Teste 1','Teste 1 Teste 1','2022-10-14-6349f1919b950.png',1,'2022-10-14 23:32:33','2022-10-14 23:32:33','customer',1),(2,'Teste','Essa é uma notificação de teste',NULL,1,'2022-11-06 18:56:23','2022-11-06 18:56:23','customer',NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('0a6ea910ba4e45d80209bddbe034698a624af72ec02606e12a2049154dad41a8a3fee5d5f2ea8266',4,3,'RestaurantCustomerAuth','[]',0,'2022-10-19 16:40:56','2022-10-19 16:40:56','2023-10-19 13:40:56'),('29754fc0a220cfc4db1b8c78b2edd388b3e1f2b92b10830b69acdf72e1e95fd172f3793c764a1b83',8,3,'RestaurantCustomerAuth','[]',0,'2022-12-04 07:11:36','2022-12-04 07:11:36','2023-12-04 04:11:36'),('2987b3f3f121419a052657c25dbd7841b87f736fd7c48fda5377368f25ade26486405bf13a9ec0d1',5,3,'RestaurantCustomerAuth','[]',0,'2022-11-06 18:42:23','2022-11-06 18:42:23','2023-11-06 15:42:23'),('2e0a279ae04279669a08c809a6baf3f47fe46a8602a5b02fcfe78bbe9d981a64c87dbbc0ff688868',1,3,'RestaurantCustomerAuth','[]',0,'2022-10-19 17:04:05','2022-10-19 17:04:05','2023-10-19 14:04:05'),('3a0b496893d5a72336d5080c8e1096518bd60809eb2cc571607da8a4572b2cb9162aea79181ed9a0',6,3,'RestaurantCustomerAuth','[]',0,'2022-11-13 13:51:45','2022-11-13 13:51:45','2023-11-13 10:51:45'),('3c53e1392ff21ba4299a6f3fb8b8229bf985c6b811d70c1304580d0c8a54590bf2542fb679870a62',4,3,'RestaurantCustomerAuth','[]',0,'2022-10-14 05:05:18','2022-10-14 05:05:18','2023-10-14 02:05:18'),('49f14cde0df8233ea7901b6ee36ca27df6478b6c46193bc859bb0ac210087ed94c613cce6c4c056c',7,3,'RestaurantCustomerAuth','[]',0,'2022-11-14 03:13:52','2022-11-14 03:13:52','2023-11-14 00:13:52'),('4ad580811a694d2269944c33cea1b2a5664d96f8f31d8bdae0de43faa0ec68f88fcba8cbe991ceca',1,3,'RestaurantCustomerAuth','[]',0,'2022-10-21 18:36:07','2022-10-21 18:36:07','2023-10-21 15:36:07'),('5453010b70f0b0c126a1f89ea3cc01a4365a164c62132c099ccc8634bbe9cda48ec239d30db39c56',2,3,'RestaurantCustomerAuth','[]',0,'2022-10-01 06:10:25','2022-10-01 06:10:25','2023-10-01 03:10:25'),('54dd47f79c2d73fbf5544c0621904fca6b71c97fb8ebe256342bdc6d8c57bc9edcd1ac1608d88675',10,3,'RestaurantCustomerAuth','[]',0,'2022-12-05 02:55:35','2022-12-05 02:55:35','2023-12-04 23:55:35'),('770c0c8c1b4f1b72ba1026863244653eb74959e7e58ab1f5373845c6ab0bbb34d1890461b53dbe2d',2,3,'RestaurantCustomerAuth','[]',0,'2022-10-01 06:26:40','2022-10-01 06:26:40','2023-10-01 03:26:40'),('77527e19e01f90f54568b2c98db6808545a97005f4636b82a39a65ea77a60152ffa98e1ec0b015ca',1,3,'RestaurantCustomerAuth','[]',0,'2022-10-19 17:04:05','2022-10-19 17:04:05','2023-10-19 14:04:05'),('79e6203d8ba60695f3c2f20eb1666b19a77c59d5f88aed62476fcb511c5d11f815daa84baeb4a57d',13,3,'RestaurantCustomerAuth','[]',0,'2022-12-20 17:22:59','2022-12-20 17:22:59','2023-12-20 14:22:59'),('8be12c06b82965f20af145d385c099db3b959933e8ed45f52a23c0aa048afd2acbdc538bd55ec826',14,3,'RestaurantCustomerAuth','[]',0,'2022-12-27 23:36:05','2022-12-27 23:36:05','2023-12-27 20:36:05'),('8cf5ace289fa4a5ef5b251d6fb811da97a683d0fb2b69caa3922622edfe8b89d5fbac8eea2816b8a',4,3,'RestaurantCustomerAuth','[]',0,'2022-10-21 22:20:00','2022-10-21 22:20:00','2023-10-21 19:20:00'),('91c86321a37d1f064f3ee0018a2e181c518ff4ab5f71ad08e23b8fadc1f14fa2faf04364f3825a18',5,3,'RestaurantCustomerAuth','[]',0,'2022-11-06 18:41:28','2022-11-06 18:41:28','2023-11-06 15:41:28'),('97158cfa458b193176746bf4581909f4ec182dd8b585ba3ca58d5334cd61d4d76d175e13a62277ca',3,3,'RestaurantCustomerAuth','[]',0,'2022-10-14 04:07:40','2022-10-14 04:07:40','2023-10-14 01:07:40'),('9ff8041d1a29a758e707de5629fd033259b1be38b126e83329325368c635f2182b59af5ff8be195c',1,3,'RestaurantCustomerAuth','[]',0,'2022-10-28 02:45:21','2022-10-28 02:45:21','2023-10-27 23:45:21'),('a3bbaf9cf2d5717d79b55d6e1d1ff23ad9d6f9428f23824a5067a2defd9a35365580a67878a695ec',1,3,'RestaurantCustomerAuth','[]',0,'2022-10-21 22:15:36','2022-10-21 22:15:36','2023-10-21 19:15:36'),('a60e94ce72e18186b310c78052d6122e82938cb5ae4f30eae0d539ac5508a017a1c52612573374fd',3,3,'RestaurantCustomerAuth','[]',0,'2022-10-14 04:08:32','2022-10-14 04:08:32','2023-10-14 01:08:32'),('a6330c89c3183b3059694eb9127cfc434b4f391c4c6b7689ab2ef1995fcc9df5453c175fea663935',13,3,'RestaurantCustomerAuth','[]',0,'2022-12-19 03:44:01','2022-12-19 03:44:01','2023-12-19 00:44:01'),('c2205bc50c4a0db3b9a6921aa2a326fd931df9229552f6ecfc2f142091c554db54d79da8e3885bb8',4,3,'RestaurantCustomerAuth','[]',0,'2022-10-14 05:06:55','2022-10-14 05:06:55','2023-10-14 02:06:55'),('c770d1a46e0b7d0cbe933db29146c6a4fd90732f4addc698c2036957c7a66dd95e4b2cec234fc8de',12,3,'RestaurantCustomerAuth','[]',0,'2022-12-14 04:34:19','2022-12-14 04:34:19','2023-12-14 01:34:19'),('d1c5000bd894266ad0261a758ff3added5a73b943a15903e7d6d202b48f8ddd712afee15e933bd3d',1,3,'RestaurantCustomerAuth','[]',0,'2022-10-09 23:43:19','2022-10-09 23:43:19','2023-10-09 20:43:19'),('d39c9bc44354ba4c791d40e181012b7379e17240156f57af712a8cc4890e3e5044242ee260714868',12,3,'RestaurantCustomerAuth','[]',0,'2022-12-14 04:32:58','2022-12-14 04:32:58','2023-12-14 01:32:58'),('da05c9e4e607e2f0aedbdf9f1295cfe171884385eb70b239219b5fe74679153d45fdd1985ced4538',6,3,'RestaurantCustomerAuth','[]',0,'2022-11-13 13:51:20','2022-11-13 13:51:20','2023-11-13 10:51:20'),('e2d9e279a0b60a680fc1e8e80be1aaac3f8751254c7dcd166f4162598b2bff533afd6826785503cc',14,3,'RestaurantCustomerAuth','[]',0,'2022-12-27 17:19:50','2022-12-27 17:19:50','2023-12-27 14:19:50'),('e3f9dd0d5ec406cb6c2d80fd83ec2bbd2d46af48bdffd55bb04346617f6c6f688a3ed6828c3fc0d8',9,3,'RestaurantCustomerAuth','[]',0,'2022-12-04 07:23:54','2022-12-04 07:23:54','2023-12-04 04:23:54'),('e6b212da94b2660ff523b49fc2427a6c107eadac858d16f8c6cd07a7511edbfa6441124ea06f3ff9',11,3,'RestaurantCustomerAuth','[]',0,'2022-12-05 03:16:20','2022-12-05 03:16:20','2023-12-05 00:16:20'),('e7616f5bedbd8422db2a19a715e7f57536b826e1abd9ce61839e188131d73fa9f60ab94508c3caf8',14,3,'RestaurantCustomerAuth','[]',0,'2022-12-30 06:15:13','2022-12-30 06:15:13','2023-12-30 03:15:13'),('e89a6535fea8bbbbcbf0a39854e34361116b0e925948693cfbae9d1f0c15a8a45c43d28bdc9a2013',13,3,'RestaurantCustomerAuth','[]',0,'2022-12-17 04:18:06','2022-12-17 04:18:06','2023-12-17 01:18:06'),('f6ebfe9e298109351fb1cfc4fb2ec87ee880a93ddd4d668d639eb6c4da504259e228392e99d87f6e',1,3,'RestaurantCustomerAuth','[]',0,'2022-10-14 03:45:22','2022-10-14 03:45:22','2023-10-14 00:45:22'),('fcd43db5f92c3b32396d023d501a1f3a06772f2b1ee01ca8092b174adb39339c84a2496bf94ee198',13,3,'RestaurantCustomerAuth','[]',0,'2022-12-14 17:24:27','2022-12-14 17:24:27','2023-12-14 14:24:27'),('ff5b043bbd489f595a6ce139021af83b7e7cf0db4d34da3d1cea6901f5d9c5d6a3bf812458b10060',1,3,'RestaurantCustomerAuth','[]',0,'2022-10-01 06:00:34','2022-10-01 06:00:34','2023-10-01 03:00:34');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','qBN0j6SW6nIf47748tgxaKxnqKqCacTxa6gii8yc',NULL,'http://localhost',1,0,0,'2021-08-19 20:44:50','2021-08-19 20:44:50'),(2,NULL,'Laravel Password Grant Client','oqQ90HOU0egjgQ01LRzHo9rADUavq16jzWm1TrjT','users','http://localhost',0,1,0,'2021-08-19 20:44:50','2021-08-19 20:44:50'),(3,NULL,'stackfood Personal Access Client','iRxXixYp4CDo7TWbWNCMelAUwgtScaEMGudnbHQk',NULL,'http://localhost',1,0,0,'2022-01-05 10:22:36','2022-01-05 10:22:36'),(4,NULL,'stackfood Password Grant Client','FzGJ1vSlbfGP2mWqF6V575QgVCEfbBHVNA41ApeC','users','http://localhost',0,1,0,'2022-01-05 10:22:36','2022-01-05 10:22:36');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-08-19 20:44:50','2021-08-19 20:44:50'),(2,3,'2022-01-05 10:22:36','2022-01-05 10:22:36');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery_histories`
--

DROP TABLE IF EXISTS `order_delivery_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery_histories`
--

LOCK TABLES `order_delivery_histories` WRITE;
/*!40000 ALTER TABLE `order_delivery_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_delivery_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `item_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `variation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount_on_item` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int NOT NULL DEFAULT '1',
  `tax_amount` decimal(24,2) NOT NULL DEFAULT '1.00',
  `variant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint unsigned DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,1000,35.00,'{\"id\":1,\"name\":\"Pizza Tamanho familia\",\"description\":\"Pizza 8 fatias. Escolha o sabor\",\"image\":\"2022-10-01-6338c35714e1a.png\",\"category_id\":2,\"category_ids\":[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}],\"variations\":[{\"type\":\"QUATROQUEIJOS\",\"price\":35,\"stock\":0},{\"type\":\"FRANGOCOMCATUPIRY\",\"price\":38,\"stock\":0},{\"type\":\"PORTUGUESA\",\"price\":45,\"stock\":0}],\"add_ons\":[{\"id\":1,\"name\":\"TOMATE\",\"price\":2,\"created_at\":\"2022-10-26T00:49:51.000000Z\",\"updated_at\":\"2022-10-26T00:49:51.000000Z\",\"store_id\":1,\"status\":1},{\"id\":2,\"name\":\"QUEIJO\",\"price\":5,\"created_at\":\"2022-10-26T00:50:07.000000Z\",\"updated_at\":\"2022-10-26T00:50:07.000000Z\",\"store_id\":1,\"status\":1},{\"id\":3,\"name\":\"Cebola\",\"price\":100,\"created_at\":\"2022-12-26T19:49:42.000000Z\",\"updated_at\":\"2022-12-26T19:49:42.000000Z\",\"store_id\":1,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Sabor\",\"options\":[\"QUATRO QUEIJOS\",\" FRANGO COM CATUPIRY\",\" PORTUGUESA\"]}],\"price\":35,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:00:00\",\"available_time_ends\":\"23:59:59\",\"veg\":0,\"status\":1,\"store_id\":1,\"created_at\":\"2022-10-01T22:46:47.000000Z\",\"updated_at\":\"2022-12-28T19:13:23.000000Z\",\"order_count\":23,\"avg_rating\":5,\"rating_count\":1,\"module_id\":1,\"stock\":0,\"unit_id\":1,\"images\":[],\"store_name\":\"Loja One\",\"zone_id\":1,\"store_discount\":0,\"schedule_order\":true,\"cashback\":\"3.00\",\"unit_type\":\"KG\",\"module\":{\"id\":1,\"module_name\":\"COMIDA\",\"module_type\":\"food\",\"thumbnail\":\"2022-09-30-6337887a81b52.png\",\"status\":\"1\",\"stores_count\":1,\"created_at\":\"2022-10-01T00:23:22.000000Z\",\"updated_at\":\"2022-10-04T01:22:41.000000Z\",\"icon\":\"2022-10-03-633b8ae13ab49.png\",\"theme_id\":2,\"description\":\"<p>Lanchonetes<\\/p>\",\"all_zone_service\":0,\"translations\":[]},\"store\":{\"id\":1,\"name\":\"Loja One\",\"phone\":\"3232323322332\",\"email\":\"admin@gmail.com\",\"logo\":\"2022-09-30-6337947d5028f.png\",\"latitude\":\"-3.2505662466646488\",\"longitude\":\"-44.609719562967925\",\"address\":\"Centro\",\"footer_text\":null,\"minimum_order\":0,\"schedule_order\":true,\"status\":1,\"vendor_id\":1,\"created_at\":\"2022-10-01T01:14:37.000000Z\",\"updated_at\":\"2022-12-30T06:51:34.000000Z\",\"rating\":[1,0,0,0,0],\"cover_photo\":\"2022-09-30-6337947d51df9.png\",\"delivery\":true,\"take_away\":true,\"item_section\":true,\"tax\":0,\"zone_id\":1,\"reviews_section\":true,\"active\":true,\"off_day\":\" \",\"self_delivery_system\":1,\"pos_system\":true,\"minimum_shipping_charge\":0,\"delivery_time\":\"10-50 min\",\"veg\":1,\"non_veg\":1,\"order_count\":19,\"total_order\":48,\"module_id\":1,\"order_place_to_schedule_interval\":null,\"featured\":1,\"delivery_type\":1,\"payment_offline\":true,\"payment_pix_offline\":true,\"payment_credit_card_offline\":true,\"payment_debit_card_offline\":true,\"is_own_driver\":1,\"per_km_shipping_charge\":0,\"free_delivery\":false,\"gst_status\":false,\"gst_code\":\"\",\"free_delivery_2\":false,\"cashback\":\"3.00\"},\"unit\":{\"id\":1,\"unit\":\"KG\",\"created_at\":\"2022-10-02T00:04:33.000000Z\",\"updated_at\":\"2022-10-02T00:04:33.000000Z\"}}','[{\"type\":\"QUATROQUEIJOS\",\"price\":35,\"stock\":0}]','[]',0.00,'discount_on_product',4,0.00,'\"\"','2022-12-30 06:52:49','2022-12-30 06:52:49',NULL,0.00),(2,1,1000,35.00,'{\"id\":1,\"name\":\"Pizza Tamanho familia\",\"description\":\"Pizza 8 fatias. Escolha o sabor\",\"image\":\"2022-10-01-6338c35714e1a.png\",\"category_id\":2,\"category_ids\":[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}],\"variations\":[{\"type\":\"QUATROQUEIJOS\",\"price\":35,\"stock\":0},{\"type\":\"FRANGOCOMCATUPIRY\",\"price\":38,\"stock\":0},{\"type\":\"PORTUGUESA\",\"price\":45,\"stock\":0}],\"add_ons\":[{\"id\":1,\"name\":\"TOMATE\",\"price\":2,\"created_at\":\"2022-10-26T00:49:51.000000Z\",\"updated_at\":\"2022-10-26T00:49:51.000000Z\",\"store_id\":1,\"status\":1},{\"id\":2,\"name\":\"QUEIJO\",\"price\":5,\"created_at\":\"2022-10-26T00:50:07.000000Z\",\"updated_at\":\"2022-10-26T00:50:07.000000Z\",\"store_id\":1,\"status\":1},{\"id\":3,\"name\":\"Cebola\",\"price\":100,\"created_at\":\"2022-12-26T19:49:42.000000Z\",\"updated_at\":\"2022-12-26T19:49:42.000000Z\",\"store_id\":1,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Sabor\",\"options\":[\"QUATRO QUEIJOS\",\" FRANGO COM CATUPIRY\",\" PORTUGUESA\"]}],\"price\":35,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:00:00\",\"available_time_ends\":\"23:59:59\",\"veg\":0,\"status\":1,\"store_id\":1,\"created_at\":\"2022-10-01T22:46:47.000000Z\",\"updated_at\":\"2022-12-28T19:13:23.000000Z\",\"order_count\":23,\"avg_rating\":5,\"rating_count\":1,\"module_id\":1,\"stock\":0,\"unit_id\":1,\"images\":[],\"store_name\":\"Loja One\",\"zone_id\":1,\"store_discount\":0,\"schedule_order\":true,\"cashback\":\"3.00\",\"unit_type\":\"KG\",\"module\":{\"id\":1,\"module_name\":\"COMIDA\",\"module_type\":\"food\",\"thumbnail\":\"2022-09-30-6337887a81b52.png\",\"status\":\"1\",\"stores_count\":1,\"created_at\":\"2022-10-01T00:23:22.000000Z\",\"updated_at\":\"2022-10-04T01:22:41.000000Z\",\"icon\":\"2022-10-03-633b8ae13ab49.png\",\"theme_id\":2,\"description\":\"<p>Lanchonetes<\\/p>\",\"all_zone_service\":0,\"translations\":[]},\"store\":{\"id\":1,\"name\":\"Loja One\",\"phone\":\"3232323322332\",\"email\":\"admin@gmail.com\",\"logo\":\"2022-09-30-6337947d5028f.png\",\"latitude\":\"-3.2505662466646488\",\"longitude\":\"-44.609719562967925\",\"address\":\"Centro\",\"footer_text\":null,\"minimum_order\":0,\"schedule_order\":true,\"status\":1,\"vendor_id\":1,\"created_at\":\"2022-10-01T01:14:37.000000Z\",\"updated_at\":\"2022-12-30T06:51:34.000000Z\",\"rating\":[1,0,0,0,0],\"cover_photo\":\"2022-09-30-6337947d51df9.png\",\"delivery\":true,\"take_away\":true,\"item_section\":true,\"tax\":0,\"zone_id\":1,\"reviews_section\":true,\"active\":true,\"off_day\":\" \",\"self_delivery_system\":1,\"pos_system\":true,\"minimum_shipping_charge\":0,\"delivery_time\":\"10-50 min\",\"veg\":1,\"non_veg\":1,\"order_count\":19,\"total_order\":48,\"module_id\":1,\"order_place_to_schedule_interval\":null,\"featured\":1,\"delivery_type\":1,\"payment_offline\":true,\"payment_pix_offline\":true,\"payment_credit_card_offline\":true,\"payment_debit_card_offline\":true,\"is_own_driver\":1,\"per_km_shipping_charge\":0,\"free_delivery\":false,\"gst_status\":false,\"gst_code\":\"\",\"free_delivery_2\":false,\"cashback\":\"3.00\"},\"unit\":{\"id\":1,\"unit\":\"KG\",\"created_at\":\"2022-10-02T00:04:33.000000Z\",\"updated_at\":\"2022-10-02T00:04:33.000000Z\"}}','[{\"type\":\"QUATROQUEIJOS\",\"price\":35,\"stock\":0}]','[{\"id\":1,\"name\":\"TOMATE\",\"price\":2,\"quantity\":1}]',0.00,'discount_on_product',1,0.00,'\"\"','2022-12-30 06:52:49','2022-12-30 06:52:49',NULL,2.00),(3,1,1001,35.00,'{\"id\":1,\"name\":\"Pizza Tamanho familia\",\"description\":\"Pizza 8 fatias. Escolha o sabor\",\"image\":\"2022-10-01-6338c35714e1a.png\",\"category_id\":2,\"category_ids\":[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}],\"variations\":[{\"type\":\"QUATROQUEIJOS\",\"price\":35,\"stock\":0},{\"type\":\"FRANGOCOMCATUPIRY\",\"price\":38,\"stock\":0},{\"type\":\"PORTUGUESA\",\"price\":45,\"stock\":0}],\"add_ons\":[{\"id\":1,\"name\":\"TOMATE\",\"price\":2,\"created_at\":\"2022-10-26T00:49:51.000000Z\",\"updated_at\":\"2022-10-26T00:49:51.000000Z\",\"store_id\":1,\"status\":1},{\"id\":2,\"name\":\"QUEIJO\",\"price\":5,\"created_at\":\"2022-10-26T00:50:07.000000Z\",\"updated_at\":\"2022-10-26T00:50:07.000000Z\",\"store_id\":1,\"status\":1},{\"id\":3,\"name\":\"Cebola\",\"price\":100,\"created_at\":\"2022-12-26T19:49:42.000000Z\",\"updated_at\":\"2022-12-26T19:49:42.000000Z\",\"store_id\":1,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Sabor\",\"options\":[\"QUATRO QUEIJOS\",\" FRANGO COM CATUPIRY\",\" PORTUGUESA\"]}],\"price\":35,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:00:00\",\"available_time_ends\":\"23:59:59\",\"veg\":0,\"status\":1,\"store_id\":1,\"created_at\":\"2022-10-01T22:46:47.000000Z\",\"updated_at\":\"2022-12-28T19:13:23.000000Z\",\"order_count\":23,\"avg_rating\":5,\"rating_count\":1,\"module_id\":1,\"stock\":0,\"unit_id\":1,\"images\":[],\"store_name\":\"Loja One\",\"zone_id\":1,\"store_discount\":0,\"schedule_order\":true,\"cashback\":\"3.00\",\"unit_type\":\"KG\",\"module\":{\"id\":1,\"module_name\":\"COMIDA\",\"module_type\":\"food\",\"thumbnail\":\"2022-09-30-6337887a81b52.png\",\"status\":\"1\",\"stores_count\":1,\"created_at\":\"2022-10-01T00:23:22.000000Z\",\"updated_at\":\"2022-10-04T01:22:41.000000Z\",\"icon\":\"2022-10-03-633b8ae13ab49.png\",\"theme_id\":2,\"description\":\"<p>Lanchonetes<\\/p>\",\"all_zone_service\":0,\"translations\":[]},\"store\":{\"id\":1,\"name\":\"Loja One\",\"phone\":\"3232323322332\",\"email\":\"admin@gmail.com\",\"logo\":\"2022-09-30-6337947d5028f.png\",\"latitude\":\"-3.2505662466646488\",\"longitude\":\"-44.609719562967925\",\"address\":\"Centro\",\"footer_text\":null,\"minimum_order\":0,\"schedule_order\":true,\"status\":1,\"vendor_id\":1,\"created_at\":\"2022-10-01T01:14:37.000000Z\",\"updated_at\":\"2022-12-30T06:52:49.000000Z\",\"rating\":[1,0,0,0,0],\"cover_photo\":\"2022-09-30-6337947d51df9.png\",\"delivery\":true,\"take_away\":true,\"item_section\":true,\"tax\":0,\"zone_id\":1,\"reviews_section\":true,\"active\":true,\"off_day\":\" \",\"self_delivery_system\":1,\"pos_system\":true,\"minimum_shipping_charge\":0,\"delivery_time\":\"10-50 min\",\"veg\":1,\"non_veg\":1,\"order_count\":19,\"total_order\":49,\"module_id\":1,\"order_place_to_schedule_interval\":null,\"featured\":1,\"delivery_type\":1,\"payment_offline\":true,\"payment_pix_offline\":true,\"payment_credit_card_offline\":true,\"payment_debit_card_offline\":true,\"is_own_driver\":1,\"per_km_shipping_charge\":0,\"free_delivery\":false,\"gst_status\":false,\"gst_code\":\"\",\"free_delivery_2\":false,\"cashback\":\"3.00\"},\"unit\":{\"id\":1,\"unit\":\"KG\",\"created_at\":\"2022-10-02T00:04:33.000000Z\",\"updated_at\":\"2022-10-02T00:04:33.000000Z\"}}','[{\"type\":\"QUATROQUEIJOS\",\"price\":35,\"stock\":0}]','[]',0.00,'discount_on_product',4,0.00,'\"\"','2022-12-30 06:53:23','2022-12-30 06:53:23',NULL,0.00),(4,1,1001,35.00,'{\"id\":1,\"name\":\"Pizza Tamanho familia\",\"description\":\"Pizza 8 fatias. Escolha o sabor\",\"image\":\"2022-10-01-6338c35714e1a.png\",\"category_id\":2,\"category_ids\":[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}],\"variations\":[{\"type\":\"QUATROQUEIJOS\",\"price\":35,\"stock\":0},{\"type\":\"FRANGOCOMCATUPIRY\",\"price\":38,\"stock\":0},{\"type\":\"PORTUGUESA\",\"price\":45,\"stock\":0}],\"add_ons\":[{\"id\":1,\"name\":\"TOMATE\",\"price\":2,\"created_at\":\"2022-10-26T00:49:51.000000Z\",\"updated_at\":\"2022-10-26T00:49:51.000000Z\",\"store_id\":1,\"status\":1},{\"id\":2,\"name\":\"QUEIJO\",\"price\":5,\"created_at\":\"2022-10-26T00:50:07.000000Z\",\"updated_at\":\"2022-10-26T00:50:07.000000Z\",\"store_id\":1,\"status\":1},{\"id\":3,\"name\":\"Cebola\",\"price\":100,\"created_at\":\"2022-12-26T19:49:42.000000Z\",\"updated_at\":\"2022-12-26T19:49:42.000000Z\",\"store_id\":1,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Sabor\",\"options\":[\"QUATRO QUEIJOS\",\" FRANGO COM CATUPIRY\",\" PORTUGUESA\"]}],\"price\":35,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:00:00\",\"available_time_ends\":\"23:59:59\",\"veg\":0,\"status\":1,\"store_id\":1,\"created_at\":\"2022-10-01T22:46:47.000000Z\",\"updated_at\":\"2022-12-28T19:13:23.000000Z\",\"order_count\":23,\"avg_rating\":5,\"rating_count\":1,\"module_id\":1,\"stock\":0,\"unit_id\":1,\"images\":[],\"store_name\":\"Loja One\",\"zone_id\":1,\"store_discount\":0,\"schedule_order\":true,\"cashback\":\"3.00\",\"unit_type\":\"KG\",\"module\":{\"id\":1,\"module_name\":\"COMIDA\",\"module_type\":\"food\",\"thumbnail\":\"2022-09-30-6337887a81b52.png\",\"status\":\"1\",\"stores_count\":1,\"created_at\":\"2022-10-01T00:23:22.000000Z\",\"updated_at\":\"2022-10-04T01:22:41.000000Z\",\"icon\":\"2022-10-03-633b8ae13ab49.png\",\"theme_id\":2,\"description\":\"<p>Lanchonetes<\\/p>\",\"all_zone_service\":0,\"translations\":[]},\"store\":{\"id\":1,\"name\":\"Loja One\",\"phone\":\"3232323322332\",\"email\":\"admin@gmail.com\",\"logo\":\"2022-09-30-6337947d5028f.png\",\"latitude\":\"-3.2505662466646488\",\"longitude\":\"-44.609719562967925\",\"address\":\"Centro\",\"footer_text\":null,\"minimum_order\":0,\"schedule_order\":true,\"status\":1,\"vendor_id\":1,\"created_at\":\"2022-10-01T01:14:37.000000Z\",\"updated_at\":\"2022-12-30T06:52:49.000000Z\",\"rating\":[1,0,0,0,0],\"cover_photo\":\"2022-09-30-6337947d51df9.png\",\"delivery\":true,\"take_away\":true,\"item_section\":true,\"tax\":0,\"zone_id\":1,\"reviews_section\":true,\"active\":true,\"off_day\":\" \",\"self_delivery_system\":1,\"pos_system\":true,\"minimum_shipping_charge\":0,\"delivery_time\":\"10-50 min\",\"veg\":1,\"non_veg\":1,\"order_count\":19,\"total_order\":49,\"module_id\":1,\"order_place_to_schedule_interval\":null,\"featured\":1,\"delivery_type\":1,\"payment_offline\":true,\"payment_pix_offline\":true,\"payment_credit_card_offline\":true,\"payment_debit_card_offline\":true,\"is_own_driver\":1,\"per_km_shipping_charge\":0,\"free_delivery\":false,\"gst_status\":false,\"gst_code\":\"\",\"free_delivery_2\":false,\"cashback\":\"3.00\"},\"unit\":{\"id\":1,\"unit\":\"KG\",\"created_at\":\"2022-10-02T00:04:33.000000Z\",\"updated_at\":\"2022-10-02T00:04:33.000000Z\"}}','[{\"type\":\"QUATROQUEIJOS\",\"price\":35,\"stock\":0}]','[{\"id\":1,\"name\":\"TOMATE\",\"price\":2,\"quantity\":1}]',0.00,'discount_on_product',1,0.00,'\"\"','2022-12-30 06:53:23','2022-12-30 06:53:23',NULL,2.00);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transactions`
--

DROP TABLE IF EXISTS `order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `store_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `commission_store` decimal(24,2) DEFAULT NULL,
  `received_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint unsigned DEFAULT NULL,
  `module_id` bigint unsigned NOT NULL,
  `parcel_catgory_id` bigint unsigned DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT '0.00',
  `admin_commission` decimal(24,2) DEFAULT NULL,
  `admin_expense` decimal(24,2) DEFAULT NULL,
  `delivery_fee_comission` decimal(24,2) DEFAULT NULL,
  `cashback_generated` decimal(24,2) DEFAULT '0.00',
  `cashback` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_transactions_zone_id_index` (`zone_id`),
  KEY `order_transactions_module_id_foreign` (`module_id`),
  CONSTRAINT `order_transactions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transactions`
--

LOCK TABLES `order_transactions` WRITE;
/*!40000 ALTER TABLE `order_transactions` DISABLE KEYS */;
INSERT INTO `order_transactions` VALUES (1,1,NULL,1000,288.00,259.20,NULL,'store',NULL,'2022-12-28 19:13:22','2022-12-28 19:13:22',0.00,0.00,0.00,1,1,NULL,0.00,28.80,0.00,0.00,8.64,3);
/*!40000 ALTER TABLE `order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `store_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `store_discount_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT '0.00',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  `module_id` bigint unsigned NOT NULL,
  `order_attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parcel_category_id` bigint unsigned DEFAULT NULL,
  `receiver_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `charge_payer` enum('sender','receiver') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` double(16,3) NOT NULL DEFAULT '0.000',
  `dm_tips` double(24,2) NOT NULL DEFAULT '0.00',
  `free_delivery_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_wallet_value` tinyint DEFAULT '0',
  `wallet_value` decimal(24,2) DEFAULT '0.00',
  `cashback_generate` decimal(24,2) DEFAULT '0.00',
  `payment_online` tinyint DEFAULT '0',
  `thing` decimal(24,2) NOT NULL DEFAULT '0.00',
  `refund_request_canceled` timestamp NULL DEFAULT NULL,
  `cashback_generated` decimal(24,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `zone_id` (`zone_id`),
  KEY `orders_module_id_foreign` (`module_id`),
  CONSTRAINT `orders_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1000,14,177.00,0.00,'','unpaid','pending',0.00,'cash_on_delivery',NULL,NULL,NULL,NULL,NULL,'delivery',1,1,'2022-12-30 06:52:49','2022-12-30 06:53:04',0.00,'2022-12-30 06:52:49',NULL,'5782','2022-12-30 06:52:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"contact_person_name\":\"Igor Sanches\",\"contact_person_number\":\"+5598985766514\",\"address_type\":\"others\",\"address\":\"Q9PW+48 Anajatuba, MA, Brazil\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"-44.6041769\",\"latitude\":\"-3.2147259\"}',0,0.00,0.00,NULL,0.00,0,NULL,1,1,NULL,NULL,NULL,NULL,5.728,0.00,NULL,0,0.00,0.00,0,0.00,NULL,5.31),(1001,14,177.00,0.00,'','unpaid','pending',0.00,'cash_on_delivery',NULL,NULL,NULL,NULL,NULL,'delivery',1,1,'2022-12-30 06:53:23','2022-12-30 06:54:22',0.00,'2022-12-30 06:53:23',NULL,'5066','2022-12-30 06:53:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"contact_person_name\":\"Igor Sanches\",\"contact_person_number\":\"+5598985766514\",\"address_type\":\"others\",\"address\":\"Q9PW+48 Anajatuba, MA, Brazil\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"-44.6041769\",\"latitude\":\"-3.2147259\"}',0,0.00,0.00,NULL,0.00,0,NULL,1,1,NULL,NULL,NULL,NULL,5.728,0.00,NULL,0,0.00,0.00,0,0.00,NULL,5.31);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcel_categories`
--

DROP TABLE IF EXISTS `parcel_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcel_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `orders_count` int NOT NULL DEFAULT '0',
  `module_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parcel_per_km_shipping_charge` double(23,2) DEFAULT NULL,
  `parcel_minimum_shipping_charge` double(23,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parcel_categories_name_unique` (`name`),
  KEY `parcel_categories_module_id_foreign` (`module_id`),
  CONSTRAINT `parcel_categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcel_categories`
--

LOCK TABLES `parcel_categories` WRITE;
/*!40000 ALTER TABLE `parcel_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `parcel_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_verifications`
--

DROP TABLE IF EXISTS `phone_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_verifications_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_verifications`
--

LOCK TABLES `phone_verifications` WRITE;
/*!40000 ALTER TABLE `phone_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provide_d_m_earnings`
--

DROP TABLE IF EXISTS `provide_d_m_earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provide_d_m_earnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint unsigned NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provide_d_m_earnings`
--

LOCK TABLES `provide_d_m_earnings` WRITE;
/*!40000 ALTER TABLE `provide_d_m_earnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `provide_d_m_earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_reasons`
--

DROP TABLE IF EXISTS `refund_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_reasons`
--

LOCK TABLES `refund_reasons` WRITE;
/*!40000 ALTER TABLE `refund_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_note` text COLLATE utf8mb4_unicode_ci,
  `admin_note` text COLLATE utf8mb4_unicode_ci,
  `refund_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `refund_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refund_method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `module_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_module_id_foreign` (`module_id`),
  CONSTRAINT `reviews_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,4,'Bom','[]',5,100005,'2022-10-19 02:38:45','2022-10-19 02:38:45',NULL,1,1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media`
--

LOCK TABLES `social_media` WRITE;
/*!40000 ALTER TABLE `social_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soft_credentials`
--

DROP TABLE IF EXISTS `soft_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soft_credentials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soft_credentials`
--

LOCK TABLES `soft_credentials` WRITE;
/*!40000 ALTER TABLE `soft_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `soft_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_schedule`
--

DROP TABLE IF EXISTS `store_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_schedule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `day` int NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_schedule`
--

LOCK TABLES `store_schedule` WRITE;
/*!40000 ALTER TABLE `store_schedule` DISABLE KEYS */;
INSERT INTO `store_schedule` VALUES (2,1,4,'01:20:00','22:20:00',NULL,NULL),(3,1,0,'01:20:00','22:20:59','2022-12-25 18:39:27','2022-12-25 18:39:27'),(4,1,1,'01:20:00','22:22:00',NULL,NULL),(5,1,3,'02:20:00','22:22:00',NULL,NULL),(6,1,5,'01:29:00','22:22:00',NULL,NULL),(7,2,5,'02:20:00','22:22:59','2022-12-30 06:35:13','2022-12-30 06:35:13');
/*!40000 ALTER TABLE `store_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_wallets`
--

DROP TABLE IF EXISTS `store_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00',
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_wallets`
--

LOCK TABLES `store_wallets` WRITE;
/*!40000 ALTER TABLE `store_wallets` DISABLE KEYS */;
INSERT INTO `store_wallets` VALUES (1,1,1809.00,0.00,0.00,358.00,'2022-12-22 04:51:09','2022-12-28 19:13:23'),(2,3,0.00,0.00,0.00,0.00,'2022-12-30 06:34:44','2022-12-30 06:34:44'),(3,2,0.00,0.00,0.00,0.00,'2022-12-30 06:34:58','2022-12-30 06:34:58');
/*!40000 ALTER TABLE `store_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `footer_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT '0.00',
  `schedule_order` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `vendor_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT '1',
  `take_away` tinyint(1) NOT NULL DEFAULT '1',
  `item_section` tinyint(1) NOT NULL DEFAULT '1',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint unsigned DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `off_day` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT '0',
  `pos_system` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_shipping_charge` decimal(24,2) NOT NULL DEFAULT '2.00',
  `delivery_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT '1',
  `non_veg` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int unsigned NOT NULL DEFAULT '0',
  `total_order` int unsigned NOT NULL DEFAULT '0',
  `module_id` bigint unsigned NOT NULL,
  `order_place_to_schedule_interval` int DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `comission` decimal(8,2) NOT NULL DEFAULT '0.50',
  `cashback_store` decimal(8,2) NOT NULL DEFAULT '0.50',
  `delivery_type` int NOT NULL DEFAULT '1',
  `no_cashback_default` tinyint(1) NOT NULL DEFAULT '1',
  `no_commission_default` tinyint(1) NOT NULL DEFAULT '1',
  `payment_offline` tinyint(1) NOT NULL DEFAULT '1',
  `payment_pix_offline` tinyint(1) NOT NULL DEFAULT '1',
  `payment_credit_card_offline` tinyint(1) NOT NULL DEFAULT '1',
  `payment_debit_card_offline` tinyint(1) NOT NULL DEFAULT '1',
  `is_own_driver` tinyint DEFAULT '1',
  `per_km_shipping_charge` double(16,3) unsigned NOT NULL DEFAULT '0.000',
  `is_delivery_radius` tinyint DEFAULT '0',
  `delivery_radius` double DEFAULT '1000',
  `free_delivery` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurants_phone_unique` (`phone`),
  KEY `stores_module_id_foreign` (`module_id`),
  CONSTRAINT `stores_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Loja One','3232323322332','admin@gmail.com','2022-09-30-6337947d5028f.png','-3.2505662466646488','-44.609719562967925','Centro',NULL,0.00,1,1,1,'2022-10-01 01:14:37','2022-12-30 06:53:23','{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}','2022-09-30-6337947d51df9.png',1,1,1,0.00,1,1,1,' ',NULL,1,1,0.00,'10-50 min',1,1,19,50,1,NULL,1,10.00,3.00,1,1,0,1,1,1,1,1,0.000,0,1000,0),(2,'Loja Teste Anajajatuba','98984859580','lojateste@demo.com','2022-10-03-633b6f2333046.png','-3.2713758379104183','-44.61844388668774','Rua Benedito Leite, 14 Centro Anajatuba',NULL,0.00,1,1,2,'2022-10-03 23:24:19','2022-12-30 06:36:02',NULL,'2022-10-03-633b6f2336816.png',1,1,1,0.00,1,1,1,' ',NULL,1,0,0.00,'10-50 min',1,1,33,51,3,0,1,10.00,2.00,1,0,0,1,1,1,1,1,0.000,0,10.11,0),(3,'Teste saúde','9999999999','saude@teste.com','2022-10-14-6349e3f3e3ed3.png','-3.264256','-44.6122713','Rua da Seringueira, 11 São Raimundo',NULL,0.00,0,1,3,'2022-10-14 22:34:27','2022-10-14 22:34:53',NULL,'2022-10-14-6349e3f3eb3cd.png',1,1,1,0.00,1,1,1,' ',NULL,0,0,0.00,'10-50 min',1,1,0,0,2,0,1,10.00,5.00,1,1,1,1,1,1,1,1,0.000,0,10.11,0),(4,'Teste Shoping','1114444777','shoping@teste.com','2022-10-14-6349e57a3d293.png','-3.2668311','-44.61739619999999','Rua Humberto de Campos, 10 centro',NULL,0.00,1,1,4,'2022-10-14 22:40:58','2022-12-22 03:47:23',NULL,'2022-10-14-6349e57a3d790.png',1,1,1,0.00,1,1,1,' ',NULL,1,0,10.00,'10-45 min',0,0,2,5,4,NULL,1,5.00,5.00,2,1,1,1,1,1,1,1,0.000,0,10.11,0);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_deliverymen`
--

DROP TABLE IF EXISTS `track_deliverymen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_deliverymen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_deliverymen`
--

LOCK TABLES `track_deliverymen` WRITE;
/*!40000 ALTER TABLE `track_deliverymen` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_deliverymen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `translationable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_translationable_id_index` (`translationable_id`),
  KEY `translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'App\\Models\\Module',1,'pt','module_name','COMIDA',NULL,NULL),(2,'App\\Models\\Module',1,'pt','description','<p>Lanchonetes</p>',NULL,NULL),(3,'App\\Models\\Category',1,'pt','name','Pizzaria',NULL,NULL),(4,'App\\Models\\Category',2,'pt','name','Pizza',NULL,NULL),(5,'App\\Models\\Item',1,'pt','name','Pizza Tamanho familia',NULL,NULL),(6,'App\\Models\\Item',1,'pt','description','Pizza 8 fatias. Escolha o sabor',NULL,NULL),(7,'App\\Models\\Module',2,'pt','module_name','FARMÁCIA',NULL,NULL),(8,'App\\Models\\Module',3,'pt','module_name','SUPER MERCADO',NULL,NULL),(9,'App\\Models\\Module',4,'pt','module_name','SHOPING',NULL,NULL),(10,'App\\Models\\Category',3,'pt','name','Burgers',NULL,NULL),(11,'App\\Models\\Category',4,'pt','name','Açaí',NULL,NULL),(12,'App\\Models\\Category',5,'pt','name','Restaurante',NULL,NULL),(13,'App\\Models\\Category',6,'pt','name','Lanchonete',NULL,NULL),(14,'App\\Models\\Category',7,'pt','name','Padaria',NULL,NULL),(15,'App\\Models\\Category',8,'pt','name','Bar',NULL,NULL),(16,'App\\Models\\Category',9,'pt','name','Mercado',NULL,NULL),(17,'App\\Models\\Category',10,'pt','name','Frutaria',NULL,NULL),(18,'App\\Models\\Category',11,'pt','name','Açougue',NULL,NULL),(19,'App\\Models\\Category',12,'pt','name','Peixaria',NULL,NULL),(20,'App\\Models\\Category',13,'pt','name','Vestuário',NULL,NULL),(21,'App\\Models\\Category',14,'pt','name','Moveis e eletrônicos',NULL,NULL),(22,'App\\Models\\Category',15,'pt','name','Pet Shop',NULL,NULL),(23,'App\\Models\\Category',16,'pt','name','Papelaria',NULL,NULL),(24,'App\\Models\\Category',17,'pt','name','Sex Shop',NULL,NULL),(25,'App\\Models\\Category',18,'pt','name','Farmácia',NULL,NULL),(26,'App\\Models\\Category',19,'pt','name','Ótica',NULL,NULL),(27,'App\\Models\\Category',20,'pt','name','Eletrônicos',NULL,NULL),(28,'App\\Models\\Category',21,'pt','name','Moda masculina',NULL,NULL),(29,'App\\Models\\Category',22,'pt','name','Gêneros alimentícios',NULL,NULL),(30,'App\\Models\\Item',2,'pt','name','Arroz',NULL,NULL),(31,'App\\Models\\Item',2,'pt','description','teste teste teste',NULL,NULL),(32,'App\\Models\\Item',3,'pt','name','Café',NULL,NULL),(33,'App\\Models\\Item',3,'pt','description','teste teste',NULL,NULL),(34,'App\\Models\\Item',4,'pt','name','Açúcar',NULL,NULL),(35,'App\\Models\\Item',4,'pt','description','teste teste teste',NULL,NULL),(36,'App\\Models\\Category',23,'pt','name','Água & Gás',NULL,NULL),(37,'App\\Models\\Item',5,'pt','name','ventilador',NULL,NULL),(38,'App\\Models\\Item',5,'pt','description','teste teste teste',NULL,NULL),(39,'App\\Models\\Item',6,'pt','name','Camisa Masculina',NULL,NULL),(40,'App\\Models\\Item',6,'pt','description','Camisa Masculina',NULL,NULL),(41,'App\\Models\\Category',24,'pt','name','Vitaminas',NULL,NULL),(42,'App\\Models\\Category',25,'pt','name','Equipamentos',NULL,NULL),(43,'App\\Models\\Item',7,'pt','name','Vitamina D',NULL,NULL),(44,'App\\Models\\Item',7,'pt','description','Vitamina D\r\nVitamina D\r\nVitamina D',NULL,NULL),(45,'App\\Models\\Item',8,'pt','name','Medidor de pressão',NULL,NULL),(46,'App\\Models\\Item',8,'pt','description','Medidor de pressão \r\nMedidor de pressão Medidor de pressão',NULL,NULL),(47,'App\\Models\\AddOn',1,'pt','name','TOMATE',NULL,NULL),(48,'App\\Models\\AddOn',2,'pt','name','QUEIJO',NULL,NULL),(49,'App\\Models\\AddOn',3,'pt-BR','name','Cebola',NULL,NULL),(50,'App\\Models\\Item',1,'pt-BR','name','Pizza Tamanho familia',NULL,NULL),(51,'App\\Models\\Item',1,'pt-BR','description','Pizza 8 fatias. Escolha o sabor',NULL,NULL);
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'KG','2022-10-02 00:04:33','2022-10-02 00:04:33'),(2,'L','2022-10-02 00:04:42','2022-10-02 00:04:42'),(3,'UN','2022-10-14 22:52:30','2022-10-14 22:52:30');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `deliveryman_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_infos`
--

LOCK TABLES `user_infos` WRITE;
/*!40000 ALTER TABLE `user_infos` DISABLE KEYS */;
INSERT INTO `user_infos` VALUES (1,'Igor','Sanches','+5598984300288','www@live.com',NULL,NULL,2,NULL,NULL,'2022-10-01 06:28:03','2022-10-01 06:28:03'),(2,'Múltiplos','Delivery','989890909000','admin@demo.com','2022-09-30-633766038a552.png',1,NULL,NULL,NULL,'2022-10-01 06:29:11','2022-10-01 06:29:11'),(3,'igor','Sanches','+5598985766514','igordutra2014@live.com',NULL,NULL,1,NULL,NULL,'2022-10-10 01:21:42','2022-10-10 01:21:42'),(4,'Adriano','Rodrigues','+5598984859580','adriansantosid@gmail.com','2022-10-14-6348eede142ce.png',NULL,4,NULL,NULL,'2022-10-14 16:10:21','2022-10-14 16:10:21'),(5,'Loja One','','3232323322332','admin@gmail.com','2022-09-30-6337947d5028f.png',NULL,NULL,1,NULL,'2022-10-14 16:10:21','2022-10-14 16:10:21'),(6,'Loja Teste Anajajatuba','','98984859580','lojateste@demo.com','2022-10-03-633b6f2333046.png',NULL,NULL,2,NULL,'2022-10-15 05:07:33','2022-10-15 05:07:33'),(7,'Teste','Teste','+5531987654321','teste@gmail.com',NULL,NULL,6,NULL,NULL,'2022-11-13 13:52:49','2022-11-13 13:52:49'),(8,'Joao','F','+5598985766143','igordutra201@live.com',NULL,NULL,13,NULL,NULL,'2022-12-25 18:55:34','2022-12-25 18:55:34');
/*!40000 ALTER TABLE `user_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint unsigned DEFAULT NULL,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notifications`
--

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
INSERT INTO `user_notifications` VALUES (1,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-14 15:43:25','2022-10-14 15:43:25'),(2,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-14 15:43:25','2022-10-14 15:43:25'),(3,'{\"title\":\"Pedido\",\"description\":\"Your order is confirmed\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-14 15:55:29','2022-10-14 15:55:29'),(4,'{\"title\":\"Pedido\",\"description\":\"Your order is started for cooking\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-14 15:59:43','2022-10-14 15:59:43'),(5,'{\"title\":\"Pedido\",\"description\":\"Your food is ready for delivery\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-14 16:00:51','2022-10-14 16:00:51'),(6,'{\"title\":\"Pedido\",\"description\":\"Your food is ready for delivery\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,NULL,1,NULL,'2022-10-14 16:00:51','2022-10-14 16:00:51'),(7,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-14 16:12:43','2022-10-14 16:12:43'),(8,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100002,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-14 16:12:43','2022-10-14 16:12:43'),(9,'{\"title\":\"Pedido\",\"description\":\"Your order is confirmed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-14 16:14:21','2022-10-14 16:14:21'),(10,'{\"title\":\"Pedido\",\"description\":\"Your order is started for cooking\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-14 16:14:47','2022-10-14 16:14:47'),(11,'{\"title\":\"Pedido\",\"description\":\"Delivery man is on the way\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-14 16:15:09','2022-10-14 16:15:09'),(12,'{\"title\":\"Pedido\",\"description\":\"Your order is started for cooking\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-14 22:26:54','2022-10-14 22:26:54'),(13,'{\"title\":\"Pedido\",\"description\":\"Order is canceled by your request\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-14 22:27:31','2022-10-14 22:27:31'),(14,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-15 05:01:36','2022-10-15 05:01:36'),(15,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100003,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-10-15 05:01:36','2022-10-15 05:01:36'),(16,'{\"title\":\"Pedido\",\"description\":\"Your order is confirmed\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-15 05:04:58','2022-10-15 05:04:58'),(17,'{\"title\":\"Pedido\",\"description\":\"Your order is started for cooking\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-15 05:05:30','2022-10-15 05:05:30'),(18,'{\"title\":\"Pedido\",\"description\":\"Delivery man is on the way\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-15 05:05:45','2022-10-15 05:05:45'),(19,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-15 09:53:38','2022-10-15 09:53:38'),(20,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100004,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-15 09:53:39','2022-10-15 09:53:39'),(21,'{\"title\":\"Pedido\",\"description\":\"Your order is confirmed\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-15 09:56:26','2022-10-15 09:56:26'),(22,'{\"title\":\"Pedido\",\"description\":\"Your order is started for cooking\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-15 09:57:04','2022-10-15 09:57:04'),(23,'{\"title\":\"Pedido\",\"description\":\"Delivery man is on the way\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-15 09:57:25','2022-10-15 09:57:25'),(24,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,3,NULL,NULL,'2022-10-19 02:01:35','2022-10-19 02:01:35'),(25,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-19 02:01:35','2022-10-19 02:01:35'),(26,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:11:42','2022-10-19 02:11:42'),(27,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100002,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-19 02:11:43','2022-10-19 02:11:43'),(28,'{\"title\":\"Pedido\",\"description\":\"Your order is confirmed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:13:45','2022-10-19 02:13:45'),(29,'{\"title\":\"Pedido\",\"description\":\"Your order is started for cooking\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:14:10','2022-10-19 02:14:10'),(30,'{\"title\":\"Pedido\",\"description\":\"Delivery man is on the way\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:15:09','2022-10-19 02:15:09'),(31,'{\"title\":\"Pedido\",\"description\":\"Your order is delivered\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:15:53','2022-10-19 02:15:53'),(32,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:20:05','2022-10-19 02:20:05'),(33,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100003,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-19 02:20:05','2022-10-19 02:20:05'),(34,'{\"title\":\"Pedido\",\"description\":\"Order is canceled by your request\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:22:22','2022-10-19 02:22:22'),(35,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:25:19','2022-10-19 02:25:19'),(36,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100004,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-19 02:25:19','2022-10-19 02:25:19'),(37,'{\"title\":\"Pedido\",\"description\":\"Order is canceled by your request\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,3,NULL,NULL,'2022-10-19 02:27:50','2022-10-19 02:27:50'),(38,'{\"title\":\"Pedido\",\"description\":\"Order is canceled by your request\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:30:30','2022-10-19 02:30:30'),(39,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:31:44','2022-10-19 02:31:44'),(40,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100005,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-19 02:31:45','2022-10-19 02:31:45'),(41,'{\"title\":\"Pedido\",\"description\":\"Your order is confirmed\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:35:29','2022-10-19 02:35:29'),(42,'{\"title\":\"Pedido\",\"description\":\"Your order is started for cooking\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:35:38','2022-10-19 02:35:38'),(43,'{\"title\":\"Pedido\",\"description\":\"Delivery man is on the way\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:35:50','2022-10-19 02:35:50'),(44,'{\"title\":\"Pedido\",\"description\":\"Your order is delivered\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 02:36:00','2022-10-19 02:36:00'),(45,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 16:37:34','2022-10-19 16:37:34'),(46,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100006,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-19 16:37:34','2022-10-19 16:37:34'),(47,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-19 16:41:43','2022-10-19 16:41:43'),(48,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-19 16:41:43','2022-10-19 16:41:43'),(49,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-19 17:05:36','2022-10-19 17:05:36'),(50,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100002,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-19 17:05:37','2022-10-19 17:05:37'),(51,'{\"title\":\"Pedido\",\"description\":\"Order is canceled by your request\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-20 23:33:07','2022-10-20 23:33:07'),(52,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 00:18:37','2022-10-22 00:18:37'),(53,'{\"title\":\"Pedido\",\"description\":\"Order is canceled by your request\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 00:28:57','2022-10-22 00:28:57'),(54,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 00:29:26','2022-10-22 00:29:26'),(55,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100004,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-22 00:29:26','2022-10-22 00:29:26'),(56,'{\"title\":\"Pedido\",\"description\":\"Your order is successfully placed\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 00:41:41','2022-10-22 00:41:41'),(57,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100005,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-22 00:41:41','2022-10-22 00:41:41'),(58,'{\"title\":\"Pedido\",\"description\":\"Your order is confirmed\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 00:46:18','2022-10-22 00:46:18'),(59,'{\"title\":\"Pedido\",\"description\":\"Your order is started for cooking\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 00:47:03','2022-10-22 00:47:03'),(60,'{\"title\":\"Pedido\",\"description\":\"Delivery man is on the way\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 00:47:11','2022-10-22 00:47:11'),(61,'{\"title\":\"Pedido\",\"description\":\"Your order is delivered\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 00:47:25','2022-10-22 00:47:25'),(62,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-22 02:05:38','2022-10-22 02:05:38'),(63,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-22 02:06:29','2022-10-22 02:06:29'),(64,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100006,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-10-22 02:06:29','2022-10-22 02:06:29'),(65,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-22 02:11:58','2022-10-22 02:11:58'),(66,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-22 02:21:10','2022-10-22 02:21:10'),(67,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-22 02:22:36','2022-10-22 02:22:36'),(68,'{\"title\":\"Pedido\",\"description\":\"Order is canceled by your request\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 02:22:52','2022-10-22 02:22:52'),(69,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 02:28:49','2022-10-22 02:28:49'),(70,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100008,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-22 02:28:49','2022-10-22 02:28:49'),(71,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}',1,1,NULL,NULL,'2022-10-22 02:47:00','2022-10-22 02:47:00'),(72,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100009,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-10-22 02:47:00','2022-10-22 02:47:00'),(73,'{\"title\":\"Pedido\",\"description\":\"Order is canceled by your request\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-22 03:28:31','2022-10-22 03:28:31'),(74,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-23 15:01:50','2022-10-23 15:01:50'),(75,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100010,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-10-23 15:01:50','2022-10-23 15:01:50'),(76,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-23 15:02:19','2022-10-23 15:02:19'),(77,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-23 15:02:37','2022-10-23 15:02:37'),(78,'{\"title\":\"Pedido\",\"description\":\"Delivery man is on the way\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-23 15:03:08','2022-10-23 15:03:08'),(79,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-23 15:03:47','2022-10-23 15:03:47'),(80,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-25 17:13:29','2022-10-25 17:13:29'),(81,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100011,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-10-25 17:13:29','2022-10-25 17:13:29'),(82,'{\"title\":\"Pedido\",\"description\":\"Order is canceled by your request\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-10-28 15:39:45','2022-10-28 15:39:45'),(83,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}',1,6,NULL,NULL,'2022-11-13 13:54:33','2022-11-13 13:54:33'),(84,'{\"title\":\"Pedido\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}',1,4,NULL,NULL,'2022-11-14 02:15:39','2022-11-14 02:15:39'),(85,'{\"title\":\"Pedido\",\"description\":\"Novo pedido feito\",\"order_id\":100013,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,4,NULL,'2022-11-14 02:15:39','2022-11-14 02:15:39'),(86,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-07 18:37:38','2022-12-07 18:37:38'),(87,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100014,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-07 18:37:38','2022-12-07 18:37:38'),(88,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-07 18:43:47','2022-12-07 18:43:47'),(89,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-07 18:43:54','2022-12-07 18:43:54'),(90,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-07 18:44:01','2022-12-07 18:44:01'),(91,'{\"title\":\"Ordem\",\"description\":\"Your food is ready for delivery\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-07 18:44:09','2022-12-07 18:44:09'),(92,'{\"title\":\"Ordem\",\"description\":\"Your food is ready for delivery\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}',1,NULL,2,NULL,'2022-12-07 18:44:09','2022-12-07 18:44:09'),(93,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-07 18:52:17','2022-12-07 18:52:17'),(94,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 00:54:17','2022-12-12 00:54:17'),(95,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-12 00:54:17','2022-12-12 00:54:17'),(96,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 00:57:31','2022-12-12 00:57:31'),(97,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 00:57:54','2022-12-12 00:57:54'),(98,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 02:04:27','2022-12-12 02:04:27'),(99,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100002,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-12 02:04:27','2022-12-12 02:04:27'),(100,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 02:05:22','2022-12-12 02:05:22'),(101,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 02:36:17','2022-12-12 02:36:17'),(102,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100003,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-12 02:36:17','2022-12-12 02:36:17'),(103,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 02:40:15','2022-12-12 02:40:15'),(104,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 02:48:09','2022-12-12 02:48:09'),(105,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100004,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-12 02:48:09','2022-12-12 02:48:09'),(106,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 02:48:47','2022-12-12 02:48:47'),(107,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:06:43','2022-12-12 03:06:43'),(108,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100005,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-12 03:06:43','2022-12-12 03:06:43'),(109,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:07:27','2022-12-12 03:07:27'),(110,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:14:40','2022-12-12 03:14:40'),(111,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100006,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-12 03:14:40','2022-12-12 03:14:40'),(112,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:15:06','2022-12-12 03:15:06'),(113,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:47:00','2022-12-12 03:47:00'),(114,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100007,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-12 03:47:01','2022-12-12 03:47:01'),(115,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:50:43','2022-12-12 03:50:43'),(116,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100008,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-12 03:50:43','2022-12-12 03:50:43'),(117,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:52:12','2022-12-12 03:52:12'),(118,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100009,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-12 03:52:12','2022-12-12 03:52:12'),(119,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:54:05','2022-12-12 03:54:05'),(120,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:54:10','2022-12-12 03:54:10'),(121,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:54:16','2022-12-12 03:54:16'),(122,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:56:58','2022-12-12 03:56:58'),(123,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:57:04','2022-12-12 03:57:04'),(124,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:57:30','2022-12-12 03:57:30'),(125,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:59:24','2022-12-12 03:59:24'),(126,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:59:28','2022-12-12 03:59:28'),(127,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 03:59:32','2022-12-12 03:59:32'),(128,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:01:41','2022-12-12 04:01:41'),(129,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100010,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-12 04:01:41','2022-12-12 04:01:41'),(130,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:02:37','2022-12-12 04:02:37'),(131,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:02:42','2022-12-12 04:02:42'),(132,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:02:46','2022-12-12 04:02:46'),(133,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:02:56','2022-12-12 04:02:56'),(134,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:03:29','2022-12-12 04:03:29'),(135,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100011,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-12 04:03:29','2022-12-12 04:03:29'),(136,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:03:47','2022-12-12 04:03:47'),(137,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:03:50','2022-12-12 04:03:50'),(138,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:04:58','2022-12-12 04:04:58'),(139,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:05:19','2022-12-12 04:05:19'),(140,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100012,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-12 04:05:19','2022-12-12 04:05:19'),(141,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:05:30','2022-12-12 04:05:30'),(142,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:05:38','2022-12-12 04:05:38'),(143,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:05:52','2022-12-12 04:05:52'),(144,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-12 04:07:45','2022-12-12 04:07:45'),(145,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 00:33:35','2022-12-13 00:33:35'),(146,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100013,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,4,NULL,'2022-12-13 00:33:35','2022-12-13 00:33:35'),(147,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 00:56:36','2022-12-13 00:56:36'),(148,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 01:01:05','2022-12-13 01:01:05'),(149,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100014,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-13 01:01:05','2022-12-13 01:01:05'),(150,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 02:12:16','2022-12-13 02:12:16'),(151,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100015,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 02:15:51','2022-12-13 02:15:51'),(152,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100015,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-13 02:15:51','2022-12-13 02:15:51'),(153,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100015,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 02:16:24','2022-12-13 02:16:24'),(154,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100016,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 02:19:11','2022-12-13 02:19:11'),(155,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100016,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-13 02:19:11','2022-12-13 02:19:11'),(156,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100016,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 02:21:16','2022-12-13 02:21:16'),(157,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100017,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 02:21:32','2022-12-13 02:21:32'),(158,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100017,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-13 02:21:32','2022-12-13 02:21:32'),(159,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100017,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 02:23:35','2022-12-13 02:23:35'),(160,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100018,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 02:23:59','2022-12-13 02:23:59'),(161,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100018,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-13 02:23:59','2022-12-13 02:23:59'),(162,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100018,\"image\":\"\",\"type\":\"order_status\"}',1,11,NULL,NULL,'2022-12-13 02:24:29','2022-12-13 02:24:29'),(163,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 05:36:17','2022-12-14 05:36:17'),(164,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 05:36:17','2022-12-14 05:36:17'),(165,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 05:36:51','2022-12-14 05:36:51'),(166,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 05:40:07','2022-12-14 05:40:07'),(167,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 05:40:07','2022-12-14 05:40:07'),(168,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 05:40:33','2022-12-14 05:40:33'),(169,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 05:58:33','2022-12-14 05:58:33'),(170,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100002,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 05:58:33','2022-12-14 05:58:33'),(171,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 05:58:58','2022-12-14 05:58:58'),(172,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 06:01:25','2022-12-14 06:01:25'),(173,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100003,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 06:01:25','2022-12-14 06:01:25'),(174,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 06:02:16','2022-12-14 06:02:16'),(175,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 06:02:33','2022-12-14 06:02:33'),(176,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100004,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 06:02:33','2022-12-14 06:02:33'),(177,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 06:03:43','2022-12-14 06:03:43'),(178,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 06:03:53','2022-12-14 06:03:53'),(179,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100005,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 06:03:54','2022-12-14 06:03:54'),(180,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,12,NULL,NULL,'2022-12-14 06:04:17','2022-12-14 06:04:17'),(181,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:28:20','2022-12-14 17:28:20'),(182,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100006,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 17:28:20','2022-12-14 17:28:20'),(183,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:28:46','2022-12-14 17:28:46'),(184,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:31:15','2022-12-14 17:31:15'),(185,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100007,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 17:31:15','2022-12-14 17:31:15'),(186,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:31:28','2022-12-14 17:31:28'),(187,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:33:19','2022-12-14 17:33:19'),(188,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100008,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 17:33:19','2022-12-14 17:33:19'),(189,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:33:31','2022-12-14 17:33:31'),(190,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:34:44','2022-12-14 17:34:44'),(191,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100009,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 17:34:44','2022-12-14 17:34:44'),(192,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:36:16','2022-12-14 17:36:16'),(193,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:36:36','2022-12-14 17:36:36'),(194,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100010,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 17:36:36','2022-12-14 17:36:36'),(195,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:36:52','2022-12-14 17:36:52'),(196,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:37:17','2022-12-14 17:37:17'),(197,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100011,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 17:37:18','2022-12-14 17:37:18'),(198,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:37:34','2022-12-14 17:37:34'),(199,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:37:51','2022-12-14 17:37:51'),(200,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100012,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 17:37:51','2022-12-14 17:37:51'),(201,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:38:05','2022-12-14 17:38:05'),(202,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:42:08','2022-12-14 17:42:08'),(203,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100013,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-14 17:42:08','2022-12-14 17:42:08'),(204,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-14 17:42:31','2022-12-14 17:42:31'),(205,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100017,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-17 04:43:22','2022-12-17 04:43:22'),(206,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100018,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-17 05:17:01','2022-12-17 05:17:01'),(207,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100018,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-17 05:17:01','2022-12-17 05:17:01'),(208,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 17:23:37','2022-12-20 17:23:37'),(209,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-20 17:23:37','2022-12-20 17:23:37'),(210,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 17:23:56','2022-12-20 17:23:56'),(211,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 17:24:16','2022-12-20 17:24:16'),(212,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 17:24:44','2022-12-20 17:24:44'),(213,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 17:40:13','2022-12-20 17:40:13'),(214,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 17:40:30','2022-12-20 17:40:30'),(215,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 17:40:45','2022-12-20 17:40:45'),(216,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 17:41:03','2022-12-20 17:41:03'),(217,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 18:05:32','2022-12-20 18:05:32'),(218,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100005,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-20 18:05:32','2022-12-20 18:05:32'),(219,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 18:05:48','2022-12-20 18:05:48'),(220,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 18:06:25','2022-12-20 18:06:25'),(221,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 18:06:35','2022-12-20 18:06:35'),(222,'{\"title\":\"Ordem\",\"description\":\"Your food is ready for delivery\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 18:06:45','2022-12-20 18:06:45'),(223,'{\"title\":\"Ordem\",\"description\":\"Your food is ready for delivery\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}',1,NULL,2,NULL,'2022-12-20 18:06:46','2022-12-20 18:06:46'),(224,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-20 23:58:29','2022-12-20 23:58:29'),(225,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100006,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-20 23:58:29','2022-12-20 23:58:29'),(226,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-21 00:24:45','2022-12-21 00:24:45'),(227,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100007,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-21 00:25:43','2022-12-21 00:25:43'),(228,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-21 00:26:42','2022-12-21 00:26:42'),(229,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100008,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-21 00:28:11','2022-12-21 00:28:11'),(230,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-21 00:29:15','2022-12-21 00:29:15'),(231,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100009,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-21 00:30:17','2022-12-21 00:30:17'),(232,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-21 00:31:37','2022-12-21 00:31:37'),(233,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-21 00:33:00','2022-12-21 00:33:00'),(234,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100011,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-21 00:33:00','2022-12-21 00:33:00'),(235,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-21 00:33:08','2022-12-21 00:33:08'),(236,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100012,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-21 00:33:09','2022-12-21 00:33:09'),(237,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-21 00:39:23','2022-12-21 00:39:23'),(238,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100013,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-21 00:39:23','2022-12-21 00:39:23'),(239,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-21 00:57:17','2022-12-21 00:57:17'),(240,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-21 00:57:17','2022-12-21 00:57:17'),(241,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-21 01:03:19','2022-12-21 01:03:19'),(242,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100002,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-21 01:03:20','2022-12-21 01:03:20'),(243,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-21 01:04:42','2022-12-21 01:04:42'),(244,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":100003,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,4,NULL,'2022-12-21 01:04:43','2022-12-21 01:04:43'),(245,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1004,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-22 03:42:41','2022-12-22 03:42:41'),(246,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1004,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,4,NULL,'2022-12-22 03:42:41','2022-12-22 03:42:41'),(247,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1005,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-22 03:45:52','2022-12-22 03:45:52'),(248,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1005,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,4,NULL,'2022-12-22 03:45:53','2022-12-22 03:45:53'),(249,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":1005,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-22 03:47:24','2022-12-22 03:47:24'),(250,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1006,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-22 03:53:07','2022-12-22 03:53:07'),(251,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1006,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-22 03:53:08','2022-12-22 03:53:08'),(252,'{\"title\":\"Ordem\",\"description\":\"Order is canceled by your request\",\"order_id\":1006,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-22 04:02:37','2022-12-22 04:02:37'),(253,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-22 04:50:03','2022-12-22 04:50:03'),(254,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1000,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-22 04:50:03','2022-12-22 04:50:03'),(255,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-22 04:50:19','2022-12-22 04:50:19'),(256,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-22 04:51:02','2022-12-22 04:51:02'),(257,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-22 04:51:06','2022-12-22 04:51:06'),(258,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-22 04:51:09','2022-12-22 04:51:09'),(259,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 18:39:43','2022-12-25 18:39:43'),(260,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1000,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-25 18:39:43','2022-12-25 18:39:43'),(261,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 18:39:58','2022-12-25 18:39:58'),(262,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":1001,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 18:46:57','2022-12-25 18:46:57'),(263,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-25 18:46:57','2022-12-25 18:46:57'),(264,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":1001,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 18:47:29','2022-12-25 18:47:29'),(265,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1002,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 18:49:57','2022-12-25 18:49:57'),(266,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1002,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-25 18:49:57','2022-12-25 18:49:57'),(267,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":1002,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 18:50:14','2022-12-25 18:50:14'),(268,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":1003,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 18:50:38','2022-12-25 18:50:38'),(269,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1003,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-25 18:50:38','2022-12-25 18:50:38'),(270,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":1003,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 18:51:01','2022-12-25 18:51:01'),(271,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":1004,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 18:53:03','2022-12-25 18:53:03'),(272,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1004,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-25 18:53:03','2022-12-25 18:53:03'),(273,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":1004,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 18:53:32','2022-12-25 18:53:32'),(274,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1005,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 19:30:21','2022-12-25 19:30:21'),(275,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1005,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-25 19:30:21','2022-12-25 19:30:21'),(276,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":1005,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 19:30:47','2022-12-25 19:30:47'),(277,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1006,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 19:33:45','2022-12-25 19:33:45'),(278,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1006,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-25 19:33:45','2022-12-25 19:33:45'),(279,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":1006,\"image\":\"\",\"type\":\"order_status\"}',1,13,NULL,NULL,'2022-12-25 19:34:03','2022-12-25 19:34:03'),(280,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-28 19:12:37','2022-12-28 19:12:37'),(281,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1000,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-28 19:12:37','2022-12-28 19:12:37'),(282,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-28 19:13:05','2022-12-28 19:13:05'),(283,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-28 19:13:15','2022-12-28 19:13:15'),(284,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-28 19:13:18','2022-12-28 19:13:18'),(285,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi entregue\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-28 19:13:23','2022-12-28 19:13:23'),(286,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1001,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:19:38','2022-12-30 06:19:38'),(287,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:19:38','2022-12-30 06:19:38'),(288,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:28:38','2022-12-30 06:28:38'),(289,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1000,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:28:38','2022-12-30 06:28:38'),(290,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:30:01','2022-12-30 06:30:01'),(291,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1000,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:30:01','2022-12-30 06:30:01'),(292,'{\"title\":\"Ordem\",\"description\":\"Order is canceled by your request\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:30:28','2022-12-30 06:30:28'),(293,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1001,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:30:38','2022-12-30 06:30:38'),(294,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:30:38','2022-12-30 06:30:38'),(295,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1002,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:31:18','2022-12-30 06:31:18'),(296,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1002,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:31:19','2022-12-30 06:31:19'),(297,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1003,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:31:58','2022-12-30 06:31:58'),(298,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1003,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:31:58','2022-12-30 06:31:58'),(299,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:33:02','2022-12-30 06:33:02'),(300,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1000,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:33:02','2022-12-30 06:33:02'),(301,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1001,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:33:40','2022-12-30 06:33:40'),(302,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:33:41','2022-12-30 06:33:41'),(303,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1002,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:33:53','2022-12-30 06:33:53'),(304,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1002,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:33:54','2022-12-30 06:33:54'),(305,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1003,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:36:03','2022-12-30 06:36:03'),(306,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1003,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2022-12-30 06:36:03','2022-12-30 06:36:03'),(307,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1004,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:46:44','2022-12-30 06:46:44'),(308,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1004,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:46:45','2022-12-30 06:46:45'),(309,'{\"title\":\"Ordem\",\"description\":\"Order is canceled by your request\",\"order_id\":1004,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:47:59','2022-12-30 06:47:59'),(310,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi confirmado\",\"order_id\":1002,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:48:08','2022-12-30 06:48:08'),(311,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi iniciado para cozinhar\",\"order_id\":1002,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:48:13','2022-12-30 06:48:13'),(312,'{\"title\":\"Ordem\",\"description\":\"Delivery man is on the way\",\"order_id\":1002,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:48:17','2022-12-30 06:48:17'),(313,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1005,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:48:59','2022-12-30 06:48:59'),(314,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1005,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:48:59','2022-12-30 06:48:59'),(315,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1006,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:50:47','2022-12-30 06:50:47'),(316,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1006,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:50:47','2022-12-30 06:50:47'),(317,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1007,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:51:02','2022-12-30 06:51:02'),(318,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1007,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:51:02','2022-12-30 06:51:02'),(319,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1008,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:51:34','2022-12-30 06:51:34'),(320,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1008,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:51:35','2022-12-30 06:51:35'),(321,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1000,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:52:49','2022-12-30 06:52:49'),(322,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1000,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:52:50','2022-12-30 06:52:50'),(323,'{\"title\":\"Ordem\",\"description\":\"Seu pedido foi feito com sucesso\",\"order_id\":1001,\"image\":\"\",\"type\":\"order_status\"}',1,14,NULL,NULL,'2022-12-30 06:53:23','2022-12-30 06:53:23'),(324,'{\"title\":\"Ordem\",\"description\":\"Novo pedido feito\",\"order_id\":1001,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,1,NULL,'2022-12-30 06:53:24','2022-12-30 06:53:24');
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int NOT NULL DEFAULT '0',
  `login_medium` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  `wallet_balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `loyalty_point` decimal(24,3) NOT NULL DEFAULT '0.000',
  `ref_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_balance_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `registered_with_the_code` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_ref_code_unique` (`ref_code`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  KEY `users_zone_id_index` (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,'Jfjf','Ufuf','+559857646166','ufjfk@jdjd.ck',NULL,1,NULL,'$2y$10$k5sfaBev6T00FcMlpAHNbOMNKlofR83EAh2YsK1ajF1yYD4c1LwRC',NULL,'2022-12-04 07:23:53','2022-12-13 02:24:28',NULL,'@',1,0,NULL,NULL,1,0.000,0.000,'ufjfk90000','',NULL,0.00,0),(12,'Igor','D','+5598985766145','igordutra20141997x@gmail.com',NULL,1,'2022-12-14 04:32:58','$2y$10$Imo.IGF6ZRp7acOzceN1AOiDSOXHjBMSAokkPn/Ew4icF3IerzyLC',NULL,'2022-12-14 04:32:58','2022-12-22 03:47:23',NULL,'cCCq9GfxSS6XHp5E0DMFbQ:APA91bFdlrz2PrA2iaiYwAYFi51qQSpmNZgioAaXMS19QliaKeFEjpzcCzrvd1v6rHhs2kBJ0QtqwS7sZCk4wywci7InfkOaL5QEH8OTrPJY25UWVo-L-JcBzUtp43UVJ1LSTl9Y_7vJ',1,6,NULL,NULL,1,0.000,0.000,'HNSOEK',NULL,NULL,0.00,0),(13,'Joao','F','+5598985766143','igordutra201@live.com',NULL,1,'2022-12-14 17:24:26','$2y$10$1D09Z9ba9g8eX4E1GjfgGuHcpfk8ATFNGwuXO9jhym8BaJYOH694C',NULL,'2022-12-14 17:24:26','2022-12-25 19:34:02','[7]','dr-WTTg3QzeAfSjdX6Tr64:APA91bGYNN835XJZK06TXh5q8LRR8MhzkX5qCLtuNsx3YPwRyPmVoD0AoBPPbnc74napoJmEY3PGE16mC7xWJ0pw6zrqNnsB-lG0CfCWxaIyhalj-K12y7havWI3KCxqFm9fjbwsYhrR',1,14,NULL,NULL,1,0.000,0.000,'V9XXAD','',NULL,0.00,1),(14,'Igor','Sanches','+5598985766514','igordutra20141997@gmail.com',NULL,1,'2022-12-27 17:19:50','$2y$10$SBfk6GXMjPa7GwhaDS1S3OjeWMidJ/9oDzrP27A9yM0bwvGyNTgl.',NULL,'2022-12-27 17:19:50','2022-12-30 06:19:37',NULL,'cnS3Dp3YTqaUBtVerwaL5R:APA91bHUO4IqEd5ZmOUVj1Pk8tJB8n6QZXb3dTHMBWW7peXfseK8MosL4jT4ctivTdPlT90qeiDKMxRZDDdDCawyldyi7IPM-guXcpg9yqfMYt6mnD9F3lQwnkGYGw1Pmjjtlujjzl7F',1,1,NULL,NULL,1,8.640,0.000,'GQETZ8',NULL,NULL,8.64,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_employees`
--

DROP TABLE IF EXISTS `vendor_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint unsigned NOT NULL,
  `vendor_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendor_employees_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_employees`
--

LOCK TABLES `vendor_employees` WRITE;
/*!40000 ALTER TABLE `vendor_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `account_type` enum('current_account','savings_account') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ENUM(‘cpf’, ‘cnp’j)',
  `holder_name` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ENUM(‘cpf’, ‘cnpj’, ‘phone’, ‘email’, ‘random’)',
  `cpf_holder` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pix_key_type` enum('cpf','cnpj','phone','email','random') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pix_key` varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `firebase_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int DEFAULT '0',
  `branch` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_phone_unique` (`phone`),
  UNIQUE KEY `vendors_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'Store','One','3232323322332','admin@gmail.com',NULL,'$2y$10$CVRpschEHaxqGNJcSW816OiQHzxTJqYJxI.i0ZfY6KcScL5R0DtbO','NZ4c7ppr2o8VFBDa8F6OXNQV1bA2S46cnC6UULxV81bZ44tqipUkRN76cSkv','2022-10-01 01:14:37','2022-12-25 22:47:22','4343443','current_account','ekekkltt','443.434.434-43','cpf','443.434.434-34',NULL,1,NULL,NULL,3,'4434'),(2,'Adriano','Santos','98984859580','lojateste@demo.com',NULL,'$2y$10$MRZlb7ntZ5NHuEzTZU1DZu9hTkWHT5Fui1I/OVTvxGqoI44ia.3uK','9GogzJnXRMEy6PGrMoTQPlDfxEewjda9KBRHUmyG0ObfwcXIMcqj5VYi3IrA','2022-10-03 23:24:19','2022-10-23 14:49:57','0',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),(3,'teste','teste','9999999999','saude@teste.com',NULL,'$2y$10$gtVjznr7rkWvhu3T6KpIZ.91zShyqTDiKsQvg5wj5PNWLzPQ5jSTa',NULL,'2022-10-14 22:34:27','2022-10-14 22:34:27','0',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),(4,'teste','teste','1114444777','shoping@teste.com',NULL,'$2y$10$QHur6iQ2Ti43n5FiwlrVvugA4xY4QdK6O7w1bHwB1qg1gF6M4FKYO',NULL,'2022-10-14 22:40:58','2022-10-22 17:21:27','0',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `transaction_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` tinyint(1) DEFAULT '0',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
INSERT INTO `wallet_transactions` VALUES (1,14,'120dc611-de43-486a-ab15-cfc67a58fb98',1,'Cashback referente a pedido #1000 na loja Loja One','cashback','1000',8.64,0,8.64,'2022-12-28 19:13:23','2022-12-28 19:13:23'),(2,15,'120dc611-de43-486a-ab15-cfc67a58fb93',1,'Cashback referente a pedido #1000 na loja Loja One','reference','1000',29.22,0,8.64,'2022-12-28 19:13:23','2022-12-28 19:13:23');
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES (1,2,NULL,'2022-10-01 06:27:53','2022-10-01 06:27:53',1),(2,3,3,'2022-10-20 02:28:40','2022-10-20 02:28:40',NULL),(6,4,2,'2022-10-22 00:13:21','2022-10-22 00:13:21',NULL),(7,4,NULL,'2022-10-22 00:13:54','2022-10-22 00:13:54',1),(8,4,NULL,'2022-10-22 00:14:48','2022-10-22 00:14:48',2),(9,4,3,'2022-10-22 00:14:58','2022-10-22 00:14:58',NULL),(10,4,1,'2022-10-22 00:15:35','2022-10-22 00:15:35',NULL),(11,11,NULL,'2022-12-14 03:43:28','2022-12-14 03:43:28',2);
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw_requests`
--

DROP TABLE IF EXISTS `withdraw_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdraw_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned NOT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  `transaction_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_requests`
--

LOCK TABLES `withdraw_requests` WRITE;
/*!40000 ALTER TABLE `withdraw_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraw_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_wise_topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash_on_delivery` tinyint DEFAULT '1',
  `payment_credit_card_offline` tinyint DEFAULT '1',
  `payment_debit_card_offline` tinyint DEFAULT '1',
  `payment_pix_offline` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zones_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,'Anajatuba',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0�v��bMF�����\�		��v��?F�\�5�|f	��v��pNF��g�\n�bv��dZF��}\�3\Z\n��v��bMF�����\�		�',1,'2022-10-01 00:26:14','2022-12-04 16:59:24','zone_1_store','zone_1_customer','zone_1_delivery_man',1,1,1,1);
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-30 14:34:30
