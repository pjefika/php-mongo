-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: iboltpag
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) DEFAULT NULL,
  `password` varchar(999) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NULL DEFAULT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',NULL,'Usuário ADM 1',1,'2018-07-22 02:53:07',NULL,NULL),(2,'adm','21232f297a57a5a743894a0e4a801fc3',NULL,'Usuário ADM 2',1,'2018-07-22 14:15:58',NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movement`
--

DROP TABLE IF EXISTS `movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movement` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fk_transaction` int(11) NOT NULL,
  `fk_status` int(11) NOT NULL,
  `datetime_movement` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datetime_process_operation` timestamp NULL DEFAULT NULL,
  `datetime_remittance` timestamp NULL DEFAULT NULL,
  `number_remittance` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movement`
--

LOCK TABLES `movement` WRITE;
/*!40000 ALTER TABLE `movement` DISABLE KEYS */;
INSERT INTO `movement` VALUES (1,11,1,'2018-07-31 16:12:07',NULL,NULL,NULL),(2,13,1,'2018-07-31 21:45:29',NULL,NULL,NULL),(10,13,4,'2018-07-31 19:34:42',NULL,NULL,NULL);
/*!40000 ALTER TABLE `movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `situation` varchar(255) DEFAULT NULL,
  `label` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Pendente','Transação pendente','Boleto','Quando um boleto é gerado e ainda não foi gerado remessa para esta transação.','Pendente'),(2,'Registrando','Transação em registro','Boleto','Quando este boleto entrou em uma remessa.','Registrando'),(3,'Registrado','Transação registrada','Boleto','Quando o boleto já está registrado','Registrado'),(4,'Cancelando','Transação cancelando','Boleto','Quando o boleto está em processo de cancelamento','Cancelando'),(5,'Cancelado','Transação cancelada','Boleto','Quando o boleto está cancelado','Cancelado');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fk_origem` int(11) DEFAULT NULL,
  `fk_forma_pagamento_conta` int(11) DEFAULT NULL,
  `fk_operadora` int(11) NOT NULL,
  `codigo_pagamento` int(11) DEFAULT NULL,
  `identificador` bigint(20) DEFAULT NULL,
  `chave` varchar(10) DEFAULT NULL,
  `codigo_origem` int(10) DEFAULT NULL,
  `data_criacao_origem` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `instrucao_caixa` varchar(255) DEFAULT NULL,
  `data_vencimento_boleto` date DEFAULT NULL,
  `primeira_instrucao_codificada` int(2) DEFAULT NULL,
  `segunda_instrucao_codificada` int(2) DEFAULT NULL,
  `nome_pagador` varchar(120) DEFAULT NULL,
  `documento_pagador` varchar(20) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `email_pagador` varchar(150) DEFAULT NULL,
  `logradouro_pagador` varchar(150) DEFAULT NULL,
  `numero_end_pagador` varchar(20) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `cidade_pagador` varchar(50) DEFAULT NULL,
  `uf_pagador` varchar(2) DEFAULT NULL,
  `num_parcelas` int(3) DEFAULT NULL,
  `valor_parcela` double DEFAULT NULL,
  `status_transacao` varchar(20) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `valor_pago` double DEFAULT NULL,
  `data_hora_criacao` timestamp NULL DEFAULT NULL,
  `tipo_documento_pagador` varchar(20) DEFAULT NULL,
  `cep_pagador` varchar(8) DEFAULT NULL,
  `complemento_end_pagador` varchar(100) DEFAULT NULL,
  `data_origem` date DEFAULT NULL,
  `bairro_pagador` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (11,1,1,1,1,1,'1',1144,'2018-07-28 22:25:54','Não receber após vencimento','2018-07-30',0,0,'João cunha da silva','04562799978','Teste de descrição','ti.breakout@gmail.com','Rua Izabel Gomes Posselt','150',44.88,'Curitiba','PR',NULL,NULL,'Registrando',NULL,NULL,NULL,'CPF','81850716','apto','2018-07-28','Alto Boqueirão'),(13,1,1,1,1,1,'1',457896,'2018-07-31 16:45:29','Não receber após vencimento','2018-08-02',0,0,NULL,'04562799978','Teste de descrição','alberto@email.com','Rua Soldado João José Ramires','100',55.66,'Curitiba','PR',NULL,NULL,'Cancelado',NULL,NULL,NULL,'CPF','81850100','apto','2018-07-31','Alto Boqueirão');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-02  7:34:18
