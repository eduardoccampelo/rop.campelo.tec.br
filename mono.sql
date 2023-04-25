-- MySQL dump 10.13  Distrib 8.0.29, for macos11.6 (x86_64)
--
-- Host: localhost    Database: mono
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abertura_caixas`
--

DROP TABLE IF EXISTS `abertura_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abertura_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor` decimal(10,2) NOT NULL,
  `ultima_venda` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abertura_caixas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `abertura_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abertura_caixas`
--

LOCK TABLES `abertura_caixas` WRITE;
/*!40000 ALTER TABLE `abertura_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `abertura_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agendamentos`
--

DROP TABLE IF EXISTS `agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` int unsigned DEFAULT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `data` date NOT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agendamentos_funcionario_id_foreign` (`funcionario_id`),
  KEY `agendamentos_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `agendamentos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `agendamentos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamentos`
--

LOCK TABLES `agendamentos` WRITE;
/*!40000 ALTER TABLE `agendamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alteracao_estoques`
--

DROP TABLE IF EXISTS `alteracao_estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alteracao_estoques` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alteracao_estoques_produto_id_foreign` (`produto_id`),
  KEY `alteracao_estoques_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `alteracao_estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alteracao_estoques_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alteracao_estoques`
--

LOCK TABLES `alteracao_estoques` WRITE;
/*!40000 ALTER TABLE `alteracao_estoques` DISABLE KEYS */;
/*!40000 ALTER TABLE `alteracao_estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apontamentos`
--

DROP TABLE IF EXISTS `apontamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apontamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apontamentos_produto_id_foreign` (`produto_id`),
  KEY `apontamentos_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `apontamentos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `apontamentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apontamentos`
--

LOCK TABLES `apontamentos` WRITE;
/*!40000 ALTER TABLE `apontamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `apontamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor_post_blog_ecommerces`
--

DROP TABLE IF EXISTS `autor_post_blog_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor_post_blog_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor_post_blog_ecommerces`
--

LOCK TABLES `autor_post_blog_ecommerces` WRITE;
/*!40000 ALTER TABLE `autor_post_blog_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `autor_post_blog_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bairro_deliveries`
--

DROP TABLE IF EXISTS `bairro_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairro_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `valor_repasse` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro_deliveries`
--

LOCK TABLES `bairro_deliveries` WRITE;
/*!40000 ALTER TABLE `bairro_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `bairro_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_mais_vendidos`
--

DROP TABLE IF EXISTS `banner_mais_vendidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner_mais_vendidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto_primario` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto_secundario` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_delivery_id` int unsigned DEFAULT NULL,
  `pack_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banner_mais_vendidos_produto_delivery_id_foreign` (`produto_delivery_id`),
  KEY `banner_mais_vendidos_pack_id_foreign` (`pack_id`),
  CONSTRAINT `banner_mais_vendidos_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `banner_mais_vendidos_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_mais_vendidos`
--

LOCK TABLES `banner_mais_vendidos` WRITE;
/*!40000 ALTER TABLE `banner_mais_vendidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_mais_vendidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_topos`
--

DROP TABLE IF EXISTS `banner_topos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner_topos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_delivery_id` int unsigned DEFAULT NULL,
  `pack_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banner_topos_produto_delivery_id_foreign` (`produto_delivery_id`),
  KEY `banner_topos_pack_id_foreign` (`pack_id`),
  CONSTRAINT `banner_topos_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `banner_topos_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_topos`
--

LOCK TABLES `banner_topos` WRITE;
/*!40000 ALTER TABLE `banner_topos` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_topos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_te_descargas`
--

DROP TABLE IF EXISTS `c_te_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_te_descargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seg_cod_barras` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_te_descargas_info_id_foreign` (`info_id`),
  CONSTRAINT `c_te_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_te_descargas`
--

LOCK TABLES `c_te_descargas` WRITE;
/*!40000 ALTER TABLE `c_te_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_te_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrossel_ecommerces`
--

DROP TABLE IF EXISTS `carrossel_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrossel_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_acao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_botao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrossel_ecommerces`
--

LOCK TABLES `carrossel_ecommerces` WRITE;
/*!40000 ALTER TABLE `carrossel_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrossel_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_adicionals`
--

DROP TABLE IF EXISTS `categoria_adicionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_adicionals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limite_escolha` int NOT NULL,
  `adicional` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_adicionals`
--

LOCK TABLES `categoria_adicionals` WRITE;
/*!40000 ALTER TABLE `categoria_adicionals` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_adicionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_contas`
--

DROP TABLE IF EXISTS `categoria_contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_contas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_contas`
--

LOCK TABLES `categoria_contas` WRITE;
/*!40000 ALTER TABLE `categoria_contas` DISABLE KEYS */;
INSERT INTO `categoria_contas` VALUES (1,'Compras','2022-10-27 17:14:24','2022-10-27 17:14:24'),(2,'Vendas','2022-10-27 17:14:24','2022-10-27 17:14:24');
/*!40000 ALTER TABLE `categoria_contas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_despesa_ctes`
--

DROP TABLE IF EXISTS `categoria_despesa_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_despesa_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_despesa_ctes`
--

LOCK TABLES `categoria_despesa_ctes` WRITE;
/*!40000 ALTER TABLE `categoria_despesa_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_despesa_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_post_blog_ecommerces`
--

DROP TABLE IF EXISTS `categoria_post_blog_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_post_blog_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_post_blog_ecommerces`
--

LOCK TABLES `categoria_post_blog_ecommerces` WRITE;
/*!40000 ALTER TABLE `categoria_post_blog_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_post_blog_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_produto_deliveries`
--

DROP TABLE IF EXISTS `categoria_produto_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_produto_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produto_deliveries`
--

LOCK TABLES `categoria_produto_deliveries` WRITE;
/*!40000 ALTER TABLE `categoria_produto_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_produto_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_produto_ecommerces`
--

DROP TABLE IF EXISTS `categoria_produto_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_produto_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produto_ecommerces`
--

LOCK TABLES `categoria_produto_ecommerces` WRITE;
/*!40000 ALTER TABLE `categoria_produto_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_produto_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_servicos`
--

DROP TABLE IF EXISTS `categoria_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_servicos`
--

LOCK TABLES `categoria_servicos` WRITE;
/*!40000 ALTER TABLE `categoria_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificados`
--

DROP TABLE IF EXISTS `certificados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificados` (
  `arquivo` blob NOT NULL,
  `senha` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificados`
--

LOCK TABLES `certificados` WRITE;
/*!40000 ALTER TABLE `certificados` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidades` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5571 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,'1100015','Alta Floresta D\'Oeste','RO','2022-10-27 17:14:24','2022-10-27 17:14:24'),(2,'1100023','Ariquemes','RO','2022-10-27 17:14:24','2022-10-27 17:14:24'),(3,'1100031','Cabixi','RO','2022-10-27 17:14:24','2022-10-27 17:14:24'),(4,'1100049','Cacoal','RO','2022-10-27 17:14:24','2022-10-27 17:14:24'),(5,'1100056','Cerejeiras','RO','2022-10-27 17:14:24','2022-10-27 17:14:24'),(6,'1100064','Colorado do Oeste','RO','2022-10-27 17:14:24','2022-10-27 17:14:24'),(7,'1100072','Corumbiara','RO','2022-10-27 17:14:24','2022-10-27 17:14:24'),(8,'1100080','Costa Marques','RO','2022-10-27 17:14:24','2022-10-27 17:14:24'),(9,'1100098','Espigao D\'Oeste','RO','2022-10-27 17:14:25','2022-10-27 17:14:25'),(10,'1100106','Guajara-Mirim','RO','2022-10-27 17:14:25','2022-10-27 17:14:25'),(11,'1100114','Jaru','RO','2022-10-27 17:14:25','2022-10-27 17:14:25'),(12,'1100122','Ji-Parana','RO','2022-10-27 17:14:26','2022-10-27 17:14:26'),(13,'1100130','Machadinho D\'Oeste','RO','2022-10-27 17:14:26','2022-10-27 17:14:26'),(14,'1100148','Nova Brasilândia D\'Oeste','RO','2022-10-27 17:14:26','2022-10-27 17:14:26'),(15,'1100155','Ouro Preto do Oeste','RO','2022-10-27 17:14:27','2022-10-27 17:14:27'),(16,'1100189','Pimenta Bueno','RO','2022-10-27 17:14:27','2022-10-27 17:14:27'),(17,'1100205','Porto Velho','RO','2022-10-27 17:14:28','2022-10-27 17:14:28'),(18,'1100254','Presidente Medici','RO','2022-10-27 17:14:28','2022-10-27 17:14:28'),(19,'1100262','Rio Crespo','RO','2022-10-27 17:14:29','2022-10-27 17:14:29'),(20,'1100288','Rolim de Moura','RO','2022-10-27 17:14:29','2022-10-27 17:14:29'),(21,'1100296','Santa Luzia D\'Oeste','RO','2022-10-27 17:14:30','2022-10-27 17:14:30'),(22,'1100304','Vilhena','RO','2022-10-27 17:14:30','2022-10-27 17:14:30'),(23,'1100320','Sao Miguel do Guapore','RO','2022-10-27 17:14:30','2022-10-27 17:14:30'),(24,'1100338','Nova Mamore','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(25,'1100346','Alvorada D\'Oeste','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(26,'1100379','Alto Alegre dos Parecis','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(27,'1100403','Alto Paraiso','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(28,'1100452','Buritis','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(29,'1100502','Novo Horizonte do Oeste','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(30,'1100601','Cacaulândia','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(31,'1100700','Campo Novo de Rondônia','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(32,'1100809','Candeias do Jamari','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(33,'1100908','Castanheiras','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(34,'1100924','Chupinguaia','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(35,'1100940','Cujubim','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(36,'1101005','Governador Jorge Teixeira','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(37,'1101104','Itapua do Oeste','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(38,'1101203','Ministro Andreazza','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(39,'1101302','Mirante da Serra','RO','2022-10-27 17:14:31','2022-10-27 17:14:31'),(40,'1101401','Monte Negro','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(41,'1101435','Nova Uniao','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(42,'1101450','Parecis','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(43,'1101468','Pimenteiras do Oeste','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(44,'1101476','Primavera de Rondônia','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(45,'1101484','Sao Felipe D\'Oeste','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(46,'1101492','Sao Francisco do Guapore','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(47,'1101500','Seringueiras','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(48,'1101559','Teixeiropolis','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(49,'1101609','Theobroma','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(50,'1101708','Urupa','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(51,'1101757','Vale do Anari','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(52,'1101807','Vale do Paraiso','RO','2022-10-27 17:14:32','2022-10-27 17:14:32'),(53,'1200013','Acrelândia','AC','2022-10-27 17:14:32','2022-10-27 17:14:32'),(54,'1200054','Assis Brasil','AC','2022-10-27 17:14:32','2022-10-27 17:14:32'),(55,'1200104','Brasileia','AC','2022-10-27 17:14:32','2022-10-27 17:14:32'),(56,'1200138','Bujari','AC','2022-10-27 17:14:32','2022-10-27 17:14:32'),(57,'1200179','Capixaba','AC','2022-10-27 17:14:32','2022-10-27 17:14:32'),(58,'1200203','Cruzeiro do Sul','AC','2022-10-27 17:14:32','2022-10-27 17:14:32'),(59,'1200252','Epitaciolândia','AC','2022-10-27 17:14:32','2022-10-27 17:14:32'),(60,'1200302','Feijo','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(61,'1200328','Jordao','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(62,'1200336','Mâncio Lima','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(63,'1200344','Manoel Urbano','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(64,'1200351','Marechal Thaumaturgo','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(65,'1200385','Placido de Castro','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(66,'1200393','Porto Walter','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(67,'1200401','Rio Branco','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(68,'1200427','Rodrigues Alves','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(69,'1200435','Santa Rosa do Purus','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(70,'1200450','Senador Guiomard','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(71,'1200500','Sena Madureira','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(72,'1200609','Tarauaca','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(73,'1200708','Xapuri','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(74,'1200807','Porto Acre','AC','2022-10-27 17:14:33','2022-10-27 17:14:33'),(75,'1300029','Alvaraes','AM','2022-10-27 17:14:33','2022-10-27 17:14:33'),(76,'1300060','Amatura','AM','2022-10-27 17:14:33','2022-10-27 17:14:33'),(77,'1300086','Anama','AM','2022-10-27 17:14:33','2022-10-27 17:14:33'),(78,'1300102','Anori','AM','2022-10-27 17:14:33','2022-10-27 17:14:33'),(79,'1300144','Apui','AM','2022-10-27 17:14:33','2022-10-27 17:14:33'),(80,'1300201','Atalaia do Norte','AM','2022-10-27 17:14:33','2022-10-27 17:14:33'),(81,'1300300','Autazes','AM','2022-10-27 17:14:33','2022-10-27 17:14:33'),(82,'1300409','Barcelos','AM','2022-10-27 17:14:34','2022-10-27 17:14:34'),(83,'1300508','Barreirinha','AM','2022-10-27 17:14:34','2022-10-27 17:14:34'),(84,'1300607','Benjamin Constant','AM','2022-10-27 17:14:34','2022-10-27 17:14:34'),(85,'1300631','Beruri','AM','2022-10-27 17:14:34','2022-10-27 17:14:34'),(86,'1300680','Boa Vista do Ramos','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(87,'1300706','Boca do Acre','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(88,'1300805','Borba','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(89,'1300839','Caapiranga','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(90,'1300904','Canutama','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(91,'1301001','Carauari','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(92,'1301100','Careiro','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(93,'1301159','Careiro da Varzea','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(94,'1301209','Coari','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(95,'1301308','Codajas','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(96,'1301407','Eirunepe','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(97,'1301506','Envira','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(98,'1301605','Fonte Boa','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(99,'1301654','Guajara','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(100,'1301704','Humaita','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(101,'1301803','Ipixuna','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(102,'1301852','Iranduba','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(103,'1301902','Itacoatiara','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(104,'1301951','Itamarati','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(105,'1302009','Itapiranga','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(106,'1302108','Japura','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(107,'1302207','Jurua','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(108,'1302306','Jutai','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(109,'1302405','Labrea','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(110,'1302504','Manacapuru','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(111,'1302553','Manaquiri','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(112,'1302603','Manaus','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(113,'1302702','Manicore','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(114,'1302801','Maraa','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(115,'1302900','Maues','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(116,'1303007','Nhamunda','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(117,'1303106','Nova Olinda do Norte','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(118,'1303205','Novo Airao','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(119,'1303304','Novo Aripuana','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(120,'1303403','Parintins','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(121,'1303502','Pauini','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(122,'1303536','Presidente Figueiredo','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(123,'1303569','Rio Preto da Eva','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(124,'1303601','Santa Isabel do Rio Negro','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(125,'1303700','Santo Antônio do Iça','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(126,'1303809','Sao Gabriel da Cachoeira','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(127,'1303908','Sao Paulo de Olivença','AM','2022-10-27 17:14:35','2022-10-27 17:14:35'),(128,'1303957','Sao Sebastiao do Uatuma','AM','2022-10-27 17:14:36','2022-10-27 17:14:36'),(129,'1304005','Silves','AM','2022-10-27 17:14:36','2022-10-27 17:14:36'),(130,'1304062','Tabatinga','AM','2022-10-27 17:14:36','2022-10-27 17:14:36'),(131,'1304104','Tapaua','AM','2022-10-27 17:14:37','2022-10-27 17:14:37'),(132,'1304203','Tefe','AM','2022-10-27 17:14:37','2022-10-27 17:14:37'),(133,'1304237','Tonantins','AM','2022-10-27 17:14:38','2022-10-27 17:14:38'),(134,'1304260','Uarini','AM','2022-10-27 17:14:38','2022-10-27 17:14:38'),(135,'1304302','Urucara','AM','2022-10-27 17:14:38','2022-10-27 17:14:38'),(136,'1304401','Urucurituba','AM','2022-10-27 17:14:39','2022-10-27 17:14:39'),(137,'1400027','Amajari','RR','2022-10-27 17:14:39','2022-10-27 17:14:39'),(138,'1400050','Alto Alegre','RR','2022-10-27 17:14:39','2022-10-27 17:14:39'),(139,'1400100','Boa Vista','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(140,'1400159','Bonfim','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(141,'1400175','Canta','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(142,'1400209','Caracarai','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(143,'1400233','Caroebe','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(144,'1400282','Iracema','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(145,'1400308','Mucajai','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(146,'1400407','Normandia','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(147,'1400456','Pacaraima','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(148,'1400472','Rorainopolis','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(149,'1400506','Sao Joao da Baliza','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(150,'1400605','Sao Luiz','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(151,'1400704','Uiramuta','RR','2022-10-27 17:14:40','2022-10-27 17:14:40'),(152,'1500107','Abaetetuba','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(153,'1500131','Abel Figueiredo','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(154,'1500206','Acara','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(155,'1500305','Afua','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(156,'1500347','agua Azul do Norte','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(157,'1500404','Alenquer','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(158,'1500503','Almeirim','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(159,'1500602','Altamira','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(160,'1500701','Anajas','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(161,'1500800','Ananindeua','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(162,'1500859','Anapu','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(163,'1500909','Augusto Corrêa','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(164,'1500958','Aurora do Para','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(165,'1501006','Aveiro','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(166,'1501105','Bagre','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(167,'1501204','Baiao','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(168,'1501253','Bannach','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(169,'1501303','Barcarena','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(170,'1501402','Belem','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(171,'1501451','Belterra','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(172,'1501501','Benevides','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(173,'1501576','Bom Jesus do Tocantins','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(174,'1501600','Bonito','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(175,'1501709','Bragança','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(176,'1501725','Brasil Novo','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(177,'1501758','Brejo Grande do Araguaia','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(178,'1501782','Breu Branco','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(179,'1501808','Breves','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(180,'1501907','Bujaru','PA','2022-10-27 17:14:40','2022-10-27 17:14:40'),(181,'1501956','Cachoeira do Piria','PA','2022-10-27 17:14:41','2022-10-27 17:14:41'),(182,'1502004','Cachoeira do Arari','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(183,'1502103','Cameta','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(184,'1502152','Canaa dos Carajas','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(185,'1502202','Capanema','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(186,'1502301','Capitao Poço','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(187,'1502400','Castanhal','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(188,'1502509','Chaves','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(189,'1502608','Colares','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(190,'1502707','Conceiçao do Araguaia','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(191,'1502756','Concordia do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(192,'1502764','Cumaru do Norte','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(193,'1502772','Curionopolis','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(194,'1502806','Curralinho','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(195,'1502855','Curua','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(196,'1502905','Curuça','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(197,'1502939','Dom Eliseu','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(198,'1502954','Eldorado dos Carajas','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(199,'1503002','Faro','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(200,'1503044','Floresta do Araguaia','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(201,'1503077','Garrafao do Norte','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(202,'1503093','Goianesia do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(203,'1503101','Gurupa','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(204,'1503200','Igarape-Açu','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(205,'1503309','Igarape-Miri','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(206,'1503408','Inhangapi','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(207,'1503457','Ipixuna do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(208,'1503507','Irituia','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(209,'1503606','Itaituba','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(210,'1503705','Itupiranga','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(211,'1503754','Jacareacanga','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(212,'1503804','Jacunda','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(213,'1503903','Juruti','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(214,'1504000','Limoeiro do Ajuru','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(215,'1504059','Mae do Rio','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(216,'1504109','Magalhaes Barata','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(217,'1504208','Maraba','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(218,'1504307','Maracana','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(219,'1504406','Marapanim','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(220,'1504422','Marituba','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(221,'1504455','Medicilândia','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(222,'1504505','Melgaço','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(223,'1504604','Mocajuba','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(224,'1504703','Moju','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(225,'1504752','Mojui dos Campos','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(226,'1504802','Monte Alegre','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(227,'1504901','Muana','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(228,'1504950','Nova Esperança do Piria','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(229,'1504976','Nova Ipixuna','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(230,'1505007','Nova Timboteua','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(231,'1505031','Novo Progresso','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(232,'1505064','Novo Repartimento','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(233,'1505106','obidos','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(234,'1505205','Oeiras do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(235,'1505304','Oriximina','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(236,'1505403','Ourem','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(237,'1505437','Ourilândia do Norte','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(238,'1505486','Pacaja','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(239,'1505494','Palestina do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(240,'1505502','Paragominas','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(241,'1505536','Parauapebas','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(242,'1505551','Pau D\'Arco','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(243,'1505601','Peixe-Boi','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(244,'1505635','Piçarra','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(245,'1505650','Placas','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(246,'1505700','Ponta de Pedras','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(247,'1505809','Portel','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(248,'1505908','Porto de Moz','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(249,'1506005','Prainha','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(250,'1506104','Primavera','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(251,'1506112','Quatipuru','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(252,'1506138','Redençao','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(253,'1506161','Rio Maria','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(254,'1506187','Rondon do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(255,'1506195','Ruropolis','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(256,'1506203','Salinopolis','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(257,'1506302','Salvaterra','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(258,'1506351','Santa Barbara do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(259,'1506401','Santa Cruz do Arari','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(260,'1506500','Santa Isabel do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(261,'1506559','Santa Luzia do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(262,'1506583','Santa Maria das Barreiras','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(263,'1506609','Santa Maria do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(264,'1506708','Santana do Araguaia','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(265,'1506807','Santarem','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(266,'1506906','Santarem Novo','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(267,'1507003','Santo Antônio do Taua','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(268,'1507102','Sao Caetano de Odivelas','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(269,'1507151','Sao Domingos do Araguaia','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(270,'1507201','Sao Domingos do Capim','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(271,'1507300','Sao Felix do Xingu','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(272,'1507409','Sao Francisco do Para','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(273,'1507458','Sao Geraldo do Araguaia','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(274,'1507466','Sao Joao da Ponta','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(275,'1507474','Sao Joao de Pirabas','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(276,'1507508','Sao Joao do Araguaia','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(277,'1507607','Sao Miguel do Guama','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(278,'1507706','Sao Sebastiao da Boa Vista','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(279,'1507755','Sapucaia','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(280,'1507805','Senador Jose Porfirio','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(281,'1507904','Soure','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(282,'1507953','Tailândia','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(283,'1507961','Terra Alta','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(284,'1507979','Terra Santa','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(285,'1508001','Tome-Açu','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(286,'1508035','Tracuateua','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(287,'1508050','Trairao','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(288,'1508084','Tucuma','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(289,'1508100','Tucurui','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(290,'1508126','Ulianopolis','PA','2022-10-27 17:14:42','2022-10-27 17:14:42'),(291,'1508159','Uruara','PA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(292,'1508209','Vigia','PA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(293,'1508308','Viseu','PA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(294,'1508357','Vitoria do Xingu','PA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(295,'1508407','Xinguara','PA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(296,'1600055','Serra do Navio','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(297,'1600105','Amapa','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(298,'1600154','Pedra Branca do Amapari','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(299,'1600204','Calçoene','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(300,'1600212','Cutias','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(301,'1600238','Ferreira Gomes','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(302,'1600253','Itaubal','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(303,'1600279','Laranjal do Jari','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(304,'1600303','Macapa','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(305,'1600402','Mazagao','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(306,'1600501','Oiapoque','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(307,'1600535','Porto Grande','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(308,'1600550','Pracuuba','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(309,'1600600','Santana','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(310,'1600709','Tartarugalzinho','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(311,'1600808','Vitoria do Jari','AP','2022-10-27 17:14:43','2022-10-27 17:14:43'),(312,'1700251','Abreulândia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(313,'1700301','Aguiarnopolis','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(314,'1700350','Aliança do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(315,'1700400','Almas','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(316,'1700707','Alvorada','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(317,'1701002','Ananas','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(318,'1701051','Angico','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(319,'1701101','Aparecida do Rio Negro','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(320,'1701309','Aragominas','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(321,'1701903','Araguacema','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(322,'1702000','Araguaçu','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(323,'1702109','Araguaina','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(324,'1702158','Araguana','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(325,'1702208','Araguatins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(326,'1702307','Arapoema','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(327,'1702406','Arraias','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(328,'1702554','Augustinopolis','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(329,'1702703','Aurora do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(330,'1702901','Axixa do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(331,'1703008','Babaçulândia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(332,'1703057','Bandeirantes do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(333,'1703073','Barra do Ouro','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(334,'1703107','Barrolândia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(335,'1703206','Bernardo Sayao','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(336,'1703305','Bom Jesus do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(337,'1703602','Brasilândia do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(338,'1703701','Brejinho de Nazare','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(339,'1703800','Buriti do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(340,'1703826','Cachoeirinha','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(341,'1703842','Campos Lindos','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(342,'1703867','Cariri do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(343,'1703883','Carmolândia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(344,'1703891','Carrasco Bonito','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(345,'1703909','Caseara','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(346,'1704105','Centenario','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(347,'1704600','Chapada de Areia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(348,'1705102','Chapada da Natividade','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(349,'1705508','Colinas do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(350,'1705557','Combinado','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(351,'1705607','Conceiçao do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(352,'1706001','Couto Magalhaes','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(353,'1706100','Cristalândia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(354,'1706258','Crixas do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(355,'1706506','Darcinopolis','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(356,'1707009','Dianopolis','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(357,'1707108','Divinopolis do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(358,'1707207','Dois Irmaos do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(359,'1707306','Duere','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(360,'1707405','Esperantina','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(361,'1707553','Fatima','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(362,'1707652','Figueiropolis','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(363,'1707702','Filadelfia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(364,'1708205','Formoso do Araguaia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(365,'1708254','Fortaleza do Tabocao','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(366,'1708304','Goianorte','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(367,'1709005','Goiatins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(368,'1709302','Guarai','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(369,'1709500','Gurupi','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(370,'1709807','Ipueiras','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(371,'1710508','Itacaja','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(372,'1710706','Itaguatins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(373,'1710904','Itapiratins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(374,'1711100','Itapora do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(375,'1711506','Jau do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(376,'1711803','Juarina','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(377,'1711902','Lagoa da Confusao','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(378,'1711951','Lagoa do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(379,'1712009','Lajeado','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(380,'1712157','Lavandeira','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(381,'1712405','Lizarda','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(382,'1712454','Luzinopolis','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(383,'1712504','Marianopolis do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(384,'1712702','Mateiros','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(385,'1712801','Maurilândia do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(386,'1713205','Miracema do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(387,'1713304','Miranorte','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(388,'1713601','Monte do Carmo','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(389,'1713700','Monte Santo do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(390,'1713809','Palmeiras do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(391,'1713957','Muricilândia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(392,'1714203','Natividade','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(393,'1714302','Nazare','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(394,'1714880','Nova Olinda','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(395,'1715002','Nova Rosalândia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(396,'1715101','Novo Acordo','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(397,'1715150','Novo Alegre','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(398,'1715259','Novo Jardim','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(399,'1715507','Oliveira de Fatima','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(400,'1715705','Palmeirante','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(401,'1715754','Palmeiropolis','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(402,'1716109','Paraiso do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(403,'1716208','Parana','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(404,'1716307','Pau D\'Arco','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(405,'1716505','Pedro Afonso','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(406,'1716604','Peixe','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(407,'1716653','Pequizeiro','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(408,'1716703','Colmeia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(409,'1717008','Pindorama do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(410,'1717206','Piraquê','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(411,'1717503','Pium','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(412,'1717800','Ponte Alta do Bom Jesus','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(413,'1717909','Ponte Alta do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(414,'1718006','Porto Alegre do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(415,'1718204','Porto Nacional','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(416,'1718303','Praia Norte','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(417,'1718402','Presidente Kennedy','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(418,'1718451','Pugmil','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(419,'1718501','Recursolândia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(420,'1718550','Riachinho','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(421,'1718659','Rio da Conceiçao','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(422,'1718709','Rio dos Bois','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(423,'1718758','Rio Sono','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(424,'1718808','Sampaio','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(425,'1718840','Sandolândia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(426,'1718865','Santa Fe do Araguaia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(427,'1718881','Santa Maria do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(428,'1718899','Santa Rita do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(429,'1718907','Santa Rosa do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(430,'1719004','Santa Tereza do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(431,'1720002','Santa Terezinha do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(432,'1720101','Sao Bento do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(433,'1720150','Sao Felix do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(434,'1720200','Sao Miguel do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(435,'1720259','Sao Salvador do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(436,'1720309','Sao Sebastiao do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(437,'1720499','Sao Valerio','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(438,'1720655','Silvanopolis','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(439,'1720804','Sitio Novo do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(440,'1720853','Sucupira','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(441,'1720903','Taguatinga','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(442,'1720937','Taipas do Tocantins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(443,'1720978','Talisma','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(444,'1721000','Palmas','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(445,'1721109','Tocantinia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(446,'1721208','Tocantinopolis','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(447,'1721257','Tupirama','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(448,'1721307','Tupiratins','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(449,'1722081','Wanderlândia','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(450,'1722107','Xambioa','TO','2022-10-27 17:14:43','2022-10-27 17:14:43'),(451,'2100055','Açailândia','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(452,'2100105','Afonso Cunha','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(453,'2100154','agua Doce do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(454,'2100204','Alcântara','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(455,'2100303','Aldeias Altas','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(456,'2100402','Altamira do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(457,'2100436','Alto Alegre do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(458,'2100477','Alto Alegre do Pindare','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(459,'2100501','Alto Parnaiba','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(460,'2100550','Amapa do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(461,'2100600','Amarante do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(462,'2100709','Anajatuba','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(463,'2100808','Anapurus','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(464,'2100832','Apicum-Açu','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(465,'2100873','Araguana','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(466,'2100907','Araioses','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(467,'2100956','Arame','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(468,'2101004','Arari','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(469,'2101103','Axixa','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(470,'2101202','Bacabal','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(471,'2101251','Bacabeira','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(472,'2101301','Bacuri','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(473,'2101350','Bacurituba','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(474,'2101400','Balsas','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(475,'2101509','Barao de Grajau','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(476,'2101608','Barra do Corda','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(477,'2101707','Barreirinhas','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(478,'2101731','Belagua','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(479,'2101772','Bela Vista do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(480,'2101806','Benedito Leite','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(481,'2101905','Bequimao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(482,'2101939','Bernardo do Mearim','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(483,'2101970','Boa Vista do Gurupi','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(484,'2102002','Bom Jardim','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(485,'2102036','Bom Jesus das Selvas','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(486,'2102077','Bom Lugar','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(487,'2102101','Brejo','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(488,'2102150','Brejo de Areia','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(489,'2102200','Buriti','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(490,'2102309','Buriti Bravo','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(491,'2102325','Buriticupu','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(492,'2102358','Buritirana','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(493,'2102374','Cachoeira Grande','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(494,'2102408','Cajapio','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(495,'2102507','Cajari','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(496,'2102556','Campestre do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(497,'2102606','Cândido Mendes','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(498,'2102705','Cantanhede','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(499,'2102754','Capinzal do Norte','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(500,'2102804','Carolina','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(501,'2102903','Carutapera','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(502,'2103000','Caxias','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(503,'2103109','Cedral','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(504,'2103125','Central do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(505,'2103158','Centro do Guilherme','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(506,'2103174','Centro Novo do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(507,'2103208','Chapadinha','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(508,'2103257','Cidelândia','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(509,'2103307','Codo','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(510,'2103406','Coelho Neto','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(511,'2103505','Colinas','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(512,'2103554','Conceiçao do Lago-Açu','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(513,'2103604','Coroata','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(514,'2103703','Cururupu','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(515,'2103752','Davinopolis','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(516,'2103802','Dom Pedro','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(517,'2103901','Duque Bacelar','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(518,'2104008','Esperantinopolis','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(519,'2104057','Estreito','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(520,'2104073','Feira Nova do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(521,'2104081','Fernando Falcao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(522,'2104099','Formosa da Serra Negra','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(523,'2104107','Fortaleza dos Nogueiras','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(524,'2104206','Fortuna','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(525,'2104305','Godofredo Viana','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(526,'2104404','Gonçalves Dias','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(527,'2104503','Governador Archer','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(528,'2104552','Governador Edison Lobao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(529,'2104602','Governador Eugênio Barros','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(530,'2104628','Governador Luiz Rocha','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(531,'2104651','Governador Newton Bello','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(532,'2104677','Governador Nunes Freire','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(533,'2104701','Graça Aranha','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(534,'2104800','Grajau','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(535,'2104909','Guimaraes','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(536,'2105005','Humberto de Campos','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(537,'2105104','Icatu','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(538,'2105153','Igarape do Meio','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(539,'2105203','Igarape Grande','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(540,'2105302','Imperatriz','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(541,'2105351','Itaipava do Grajau','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(542,'2105401','Itapecuru Mirim','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(543,'2105427','Itinga do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(544,'2105450','Jatoba','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(545,'2105476','Jenipapo dos Vieiras','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(546,'2105500','Joao Lisboa','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(547,'2105609','Joselândia','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(548,'2105658','Junco do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(549,'2105708','Lago da Pedra','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(550,'2105807','Lago do Junco','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(551,'2105906','Lago Verde','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(552,'2105922','Lagoa do Mato','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(553,'2105948','Lago dos Rodrigues','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(554,'2105963','Lagoa Grande do Maranhao','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(555,'2105989','Lajeado Novo','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(556,'2106003','Lima Campos','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(557,'2106102','Loreto','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(558,'2106201','Luis Domingues','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(559,'2106300','Magalhaes de Almeida','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(560,'2106326','Maracaçume','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(561,'2106359','Maraja do Sena','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(562,'2106375','Maranhaozinho','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(563,'2106409','Mata Roma','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(564,'2106508','Matinha','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(565,'2106607','Matoes','MA','2022-10-27 17:14:43','2022-10-27 17:14:43'),(566,'2106631','Matoes do Norte','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(567,'2106672','Milagres do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(568,'2106706','Mirador','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(569,'2106755','Miranda do Norte','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(570,'2106805','Mirinzal','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(571,'2106904','Monçao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(572,'2107001','Montes Altos','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(573,'2107100','Morros','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(574,'2107209','Nina Rodrigues','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(575,'2107258','Nova Colinas','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(576,'2107308','Nova Iorque','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(577,'2107357','Nova Olinda do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(578,'2107407','Olho D\'agua das Cunhas','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(579,'2107456','Olinda Nova do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(580,'2107506','Paço do Lumiar','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(581,'2107605','Palmeirândia','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(582,'2107704','Paraibano','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(583,'2107803','Parnarama','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(584,'2107902','Passagem Franca','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(585,'2108009','Pastos Bons','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(586,'2108058','Paulino Neves','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(587,'2108108','Paulo Ramos','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(588,'2108207','Pedreiras','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(589,'2108256','Pedro do Rosario','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(590,'2108306','Penalva','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(591,'2108405','Peri Mirim','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(592,'2108454','Peritoro','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(593,'2108504','Pindare-Mirim','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(594,'2108603','Pinheiro','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(595,'2108702','Pio XII','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(596,'2108801','Pirapemas','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(597,'2108900','Poçao de Pedras','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(598,'2109007','Porto Franco','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(599,'2109056','Porto Rico do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(600,'2109106','Presidente Dutra','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(601,'2109205','Presidente Juscelino','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(602,'2109239','Presidente Medici','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(603,'2109270','Presidente Sarney','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(604,'2109304','Presidente Vargas','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(605,'2109403','Primeira Cruz','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(606,'2109452','Raposa','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(607,'2109502','Riachao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(608,'2109551','Ribamar Fiquene','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(609,'2109601','Rosario','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(610,'2109700','Sambaiba','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(611,'2109759','Santa Filomena do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(612,'2109809','Santa Helena','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(613,'2109908','Santa Inês','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(614,'2110005','Santa Luzia','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(615,'2110039','Santa Luzia do Parua','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(616,'2110104','Santa Quiteria do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(617,'2110203','Santa Rita','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(618,'2110237','Santana do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(619,'2110278','Santo Amaro do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(620,'2110302','Santo Antônio dos Lopes','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(621,'2110401','Sao Benedito do Rio Preto','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(622,'2110500','Sao Bento','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(623,'2110609','Sao Bernardo','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(624,'2110658','Sao Domingos do Azeitao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(625,'2110708','Sao Domingos do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(626,'2110807','Sao Felix de Balsas','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(627,'2110856','Sao Francisco do Brejao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(628,'2110906','Sao Francisco do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(629,'2111003','Sao Joao Batista','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(630,'2111029','Sao Joao do Caru','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(631,'2111052','Sao Joao do Paraiso','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(632,'2111078','Sao Joao do Soter','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(633,'2111102','Sao Joao dos Patos','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(634,'2111201','Sao Jose de Ribamar','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(635,'2111250','Sao Jose dos Basilios','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(636,'2111300','Sao Luis','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(637,'2111409','Sao Luis Gonzaga do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(638,'2111508','Sao Mateus do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(639,'2111532','Sao Pedro da agua Branca','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(640,'2111573','Sao Pedro dos Crentes','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(641,'2111607','Sao Raimundo das Mangabeiras','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(642,'2111631','Sao Raimundo do Doca Bezerra','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(643,'2111672','Sao Roberto','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(644,'2111706','Sao Vicente Ferrer','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(645,'2111722','Satubinha','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(646,'2111748','Senador Alexandre Costa','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(647,'2111763','Senador La Rocque','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(648,'2111789','Serrano do Maranhao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(649,'2111805','Sitio Novo','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(650,'2111904','Sucupira do Norte','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(651,'2111953','Sucupira do Riachao','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(652,'2112001','Tasso Fragoso','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(653,'2112100','Timbiras','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(654,'2112209','Timon','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(655,'2112233','Trizidela do Vale','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(656,'2112274','Tufilândia','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(657,'2112308','Tuntum','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(658,'2112407','Turiaçu','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(659,'2112456','Turilândia','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(660,'2112506','Tutoia','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(661,'2112605','Urbano Santos','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(662,'2112704','Vargem Grande','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(663,'2112803','Viana','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(664,'2112852','Vila Nova dos Martirios','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(665,'2112902','Vitoria do Mearim','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(666,'2113009','Vitorino Freire','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(667,'2114007','Ze Doca','MA','2022-10-27 17:14:44','2022-10-27 17:14:44'),(668,'2200053','Acaua','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(669,'2200103','Agricolândia','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(670,'2200202','agua Branca','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(671,'2200251','Alagoinha do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(672,'2200277','Alegrete do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(673,'2200301','Alto Longa','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(674,'2200400','Altos','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(675,'2200459','Alvorada do Gurgueia','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(676,'2200509','Amarante','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(677,'2200608','Angical do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(678,'2200707','Anisio de Abreu','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(679,'2200806','Antônio Almeida','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(680,'2200905','Aroazes','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(681,'2200954','Aroeiras do Itaim','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(682,'2201002','Arraial','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(683,'2201051','Assunçao do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(684,'2201101','Avelino Lopes','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(685,'2201150','Baixa Grande do Ribeiro','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(686,'2201176','Barra D\'Alcântara','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(687,'2201200','Barras','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(688,'2201309','Barreiras do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(689,'2201408','Barro Duro','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(690,'2201507','Batalha','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(691,'2201556','Bela Vista do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(692,'2201572','Belem do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(693,'2201606','Beneditinos','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(694,'2201705','Bertolinia','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(695,'2201739','Betânia do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(696,'2201770','Boa Hora','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(697,'2201804','Bocaina','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(698,'2201903','Bom Jesus','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(699,'2201919','Bom Principio do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(700,'2201929','Bonfim do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(701,'2201945','Boqueirao do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(702,'2201960','Brasileira','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(703,'2201988','Brejo do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(704,'2202000','Buriti dos Lopes','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(705,'2202026','Buriti dos Montes','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(706,'2202059','Cabeceiras do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(707,'2202075','Cajazeiras do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(708,'2202083','Cajueiro da Praia','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(709,'2202091','Caldeirao Grande do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(710,'2202109','Campinas do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(711,'2202117','Campo Alegre do Fidalgo','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(712,'2202133','Campo Grande do Piaui','PI','2022-10-27 17:14:44','2022-10-27 17:14:44'),(713,'2202174','Campo Largo do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(714,'2202208','Campo Maior','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(715,'2202251','Canavieira','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(716,'2202307','Canto do Buriti','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(717,'2202406','Capitao de Campos','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(718,'2202455','Capitao Gervasio Oliveira','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(719,'2202505','Caracol','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(720,'2202539','Caraubas do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(721,'2202554','Caridade do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(722,'2202604','Castelo do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(723,'2202653','Caxingo','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(724,'2202703','Cocal','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(725,'2202711','Cocal de Telha','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(726,'2202729','Cocal dos Alves','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(727,'2202737','Coivaras','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(728,'2202752','Colônia do Gurgueia','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(729,'2202778','Colônia do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(730,'2202802','Conceiçao do Caninde','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(731,'2202851','Coronel Jose Dias','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(732,'2202901','Corrente','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(733,'2203008','Cristalândia do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(734,'2203107','Cristino Castro','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(735,'2203206','Curimata','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(736,'2203230','Currais','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(737,'2203255','Curralinhos','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(738,'2203271','Curral Novo do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(739,'2203305','Demerval Lobao','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(740,'2203354','Dirceu Arcoverde','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(741,'2203404','Dom Expedito Lopes','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(742,'2203420','Domingos Mourao','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(743,'2203453','Dom Inocêncio','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(744,'2203503','Elesbao Veloso','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(745,'2203602','Eliseu Martins','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(746,'2203701','Esperantina','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(747,'2203750','Fartura do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(748,'2203800','Flores do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(749,'2203859','Floresta do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(750,'2203909','Floriano','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(751,'2204006','Francinopolis','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(752,'2204105','Francisco Ayres','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(753,'2204154','Francisco Macedo','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(754,'2204204','Francisco Santos','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(755,'2204303','Fronteiras','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(756,'2204352','Geminiano','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(757,'2204402','Gilbues','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(758,'2204501','Guadalupe','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(759,'2204550','Guaribas','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(760,'2204600','Hugo Napoleao','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(761,'2204659','Ilha Grande','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(762,'2204709','Inhuma','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(763,'2204808','Ipiranga do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(764,'2204907','Isaias Coelho','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(765,'2205003','Itainopolis','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(766,'2205102','Itaueira','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(767,'2205151','Jacobina do Piaui','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(768,'2205201','Jaicos','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(769,'2205250','Jardim do Mulato','PI','2022-10-27 17:14:45','2022-10-27 17:14:45'),(770,'2205276','Jatoba do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(771,'2205300','Jerumenha','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(772,'2205359','Joao Costa','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(773,'2205409','Joaquim Pires','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(774,'2205458','Joca Marques','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(775,'2205508','Jose de Freitas','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(776,'2205516','Juazeiro do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(777,'2205524','Julio Borges','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(778,'2205532','Jurema','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(779,'2205540','Lagoinha do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(780,'2205557','Lagoa Alegre','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(781,'2205565','Lagoa do Barro do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(782,'2205573','Lagoa de Sao Francisco','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(783,'2205581','Lagoa do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(784,'2205599','Lagoa do Sitio','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(785,'2205607','Landri Sales','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(786,'2205706','Luis Correia','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(787,'2205805','Luzilândia','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(788,'2205854','Madeiro','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(789,'2205904','Manoel Emidio','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(790,'2205953','Marcolândia','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(791,'2206001','Marcos Parente','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(792,'2206050','Massapê do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(793,'2206100','Matias Olimpio','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(794,'2206209','Miguel Alves','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(795,'2206308','Miguel Leao','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(796,'2206357','Milton Brandao','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(797,'2206407','Monsenhor Gil','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(798,'2206506','Monsenhor Hipolito','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(799,'2206605','Monte Alegre do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(800,'2206654','Morro Cabeça no Tempo','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(801,'2206670','Morro do Chapeu do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(802,'2206696','Murici dos Portelas','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(803,'2206704','Nazare do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(804,'2206720','Nazaria','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(805,'2206753','Nossa Senhora de Nazare','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(806,'2206803','Nossa Senhora dos Remedios','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(807,'2206902','Novo Oriente do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(808,'2206951','Novo Santo Antônio','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(809,'2207009','Oeiras','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(810,'2207108','Olho D\'agua do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(811,'2207207','Padre Marcos','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(812,'2207306','Paes Landim','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(813,'2207355','Pajeu do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(814,'2207405','Palmeira do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(815,'2207504','Palmeirais','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(816,'2207553','Paqueta','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(817,'2207603','Parnagua','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(818,'2207702','Parnaiba','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(819,'2207751','Passagem Franca do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(820,'2207777','Patos do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(821,'2207793','Pau D\'Arco do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(822,'2207801','Paulistana','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(823,'2207850','Pavussu','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(824,'2207900','Pedro II','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(825,'2207934','Pedro Laurentino','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(826,'2207959','Nova Santa Rita','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(827,'2208007','Picos','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(828,'2208106','Pimenteiras','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(829,'2208205','Pio IX','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(830,'2208304','Piracuruca','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(831,'2208403','Piripiri','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(832,'2208502','Porto','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(833,'2208551','Porto Alegre do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(834,'2208601','Prata do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(835,'2208650','Queimada Nova','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(836,'2208700','Redençao do Gurgueia','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(837,'2208809','Regeneraçao','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(838,'2208858','Riacho Frio','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(839,'2208874','Ribeira do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(840,'2208908','Ribeiro Gonçalves','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(841,'2209005','Rio Grande do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(842,'2209104','Santa Cruz do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(843,'2209153','Santa Cruz dos Milagres','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(844,'2209203','Santa Filomena','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(845,'2209302','Santa Luz','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(846,'2209351','Santana do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(847,'2209377','Santa Rosa do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(848,'2209401','Santo Antônio de Lisboa','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(849,'2209450','Santo Antônio dos Milagres','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(850,'2209500','Santo Inacio do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(851,'2209559','Sao Braz do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(852,'2209609','Sao Felix do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(853,'2209658','Sao Francisco de Assis do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(854,'2209708','Sao Francisco do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(855,'2209757','Sao Gonçalo do Gurgueia','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(856,'2209807','Sao Gonçalo do Piaui','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(857,'2209856','Sao Joao da Canabrava','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(858,'2209872','Sao Joao da Fronteira','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(859,'2209906','Sao Joao da Serra','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(860,'2209955','Sao Joao da Varjota','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(861,'2209971','Sao Joao do Arraial','PI','2022-10-27 17:14:46','2022-10-27 17:14:46'),(862,'2210003','Sao Joao do Piaui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(863,'2210052','Sao Jose do Divino','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(864,'2210102','Sao Jose do Peixe','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(865,'2210201','Sao Jose do Piaui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(866,'2210300','Sao Juliao','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(867,'2210359','Sao Lourenço do Piaui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(868,'2210375','Sao Luis do Piaui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(869,'2210383','Sao Miguel da Baixa Grande','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(870,'2210391','Sao Miguel do Fidalgo','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(871,'2210409','Sao Miguel do Tapuio','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(872,'2210508','Sao Pedro do Piaui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(873,'2210607','Sao Raimundo Nonato','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(874,'2210623','Sebastiao Barros','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(875,'2210631','Sebastiao Leal','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(876,'2210656','Sigefredo Pacheco','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(877,'2210706','Simoes','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(878,'2210805','Simplicio Mendes','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(879,'2210904','Socorro do Piaui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(880,'2210938','Sussuapara','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(881,'2210953','Tamboril do Piaui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(882,'2210979','Tanque do Piaui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(883,'2211001','Teresina','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(884,'2211100','Uniao','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(885,'2211209','Uruçui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(886,'2211308','Valença do Piaui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(887,'2211357','Varzea Branca','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(888,'2211407','Varzea Grande','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(889,'2211506','Vera Mendes','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(890,'2211605','Vila Nova do Piaui','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(891,'2211704','Wall Ferraz','PI','2022-10-27 17:14:47','2022-10-27 17:14:47'),(892,'2300101','Abaiara','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(893,'2300150','Acarape','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(894,'2300200','Acarau','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(895,'2300309','Acopiara','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(896,'2300408','Aiuaba','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(897,'2300507','Alcântaras','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(898,'2300606','Altaneira','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(899,'2300705','Alto Santo','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(900,'2300754','Amontada','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(901,'2300804','Antonina do Norte','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(902,'2300903','Apuiares','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(903,'2301000','Aquiraz','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(904,'2301109','Aracati','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(905,'2301208','Aracoiaba','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(906,'2301257','Ararenda','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(907,'2301307','Araripe','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(908,'2301406','Aratuba','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(909,'2301505','Arneiroz','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(910,'2301604','Assare','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(911,'2301703','Aurora','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(912,'2301802','Baixio','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(913,'2301851','Banabuiu','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(914,'2301901','Barbalha','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(915,'2301950','Barreira','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(916,'2302008','Barro','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(917,'2302057','Barroquinha','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(918,'2302107','Baturite','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(919,'2302206','Beberibe','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(920,'2302305','Bela Cruz','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(921,'2302404','Boa Viagem','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(922,'2302503','Brejo Santo','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(923,'2302602','Camocim','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(924,'2302701','Campos Sales','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(925,'2302800','Caninde','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(926,'2302909','Capistrano','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(927,'2303006','Caridade','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(928,'2303105','Carire','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(929,'2303204','Caririaçu','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(930,'2303303','Carius','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(931,'2303402','Carnaubal','CE','2022-10-27 17:14:47','2022-10-27 17:14:47'),(932,'2303501','Cascavel','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(933,'2303600','Catarina','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(934,'2303659','Catunda','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(935,'2303709','Caucaia','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(936,'2303808','Cedro','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(937,'2303907','Chaval','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(938,'2303931','Choro','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(939,'2303956','Chorozinho','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(940,'2304004','Coreau','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(941,'2304103','Crateus','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(942,'2304202','Crato','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(943,'2304236','Croata','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(944,'2304251','Cruz','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(945,'2304269','Deputado Irapuan Pinheiro','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(946,'2304277','Ererê','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(947,'2304285','Eusebio','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(948,'2304301','Farias Brito','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(949,'2304350','Forquilha','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(950,'2304400','Fortaleza','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(951,'2304459','Fortim','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(952,'2304509','Frecheirinha','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(953,'2304608','General Sampaio','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(954,'2304657','Graça','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(955,'2304707','Granja','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(956,'2304806','Granjeiro','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(957,'2304905','Groairas','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(958,'2304954','Guaiuba','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(959,'2305001','Guaraciaba do Norte','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(960,'2305100','Guaramiranga','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(961,'2305209','Hidrolândia','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(962,'2305233','Horizonte','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(963,'2305266','Ibaretama','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(964,'2305308','Ibiapina','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(965,'2305332','Ibicuitinga','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(966,'2305357','Icapui','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(967,'2305407','Ico','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(968,'2305506','Iguatu','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(969,'2305605','Independência','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(970,'2305654','Ipaporanga','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(971,'2305704','Ipaumirim','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(972,'2305803','Ipu','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(973,'2305902','Ipueiras','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(974,'2306009','Iracema','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(975,'2306108','Irauçuba','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(976,'2306207','Itaiçaba','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(977,'2306256','Itaitinga','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(978,'2306306','Itapage','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(979,'2306405','Itapipoca','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(980,'2306504','Itapiuna','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(981,'2306553','Itarema','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(982,'2306603','Itatira','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(983,'2306702','Jaguaretama','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(984,'2306801','Jaguaribara','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(985,'2306900','Jaguaribe','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(986,'2307007','Jaguaruana','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(987,'2307106','Jardim','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(988,'2307205','Jati','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(989,'2307254','Jijoca de Jericoacoara','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(990,'2307304','Juazeiro do Norte','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(991,'2307403','Jucas','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(992,'2307502','Lavras da Mangabeira','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(993,'2307601','Limoeiro do Norte','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(994,'2307635','Madalena','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(995,'2307650','Maracanau','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(996,'2307700','Maranguape','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(997,'2307809','Marco','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(998,'2307908','Martinopole','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(999,'2308005','Massapê','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(1000,'2308104','Mauriti','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(1001,'2308203','Meruoca','CE','2022-10-27 17:14:48','2022-10-27 17:14:48'),(1002,'2308302','Milagres','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1003,'2308351','Milha','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1004,'2308377','Miraima','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1005,'2308401','Missao Velha','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1006,'2308500','Mombaça','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1007,'2308609','Monsenhor Tabosa','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1008,'2308708','Morada Nova','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1009,'2308807','Moraujo','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1010,'2308906','Morrinhos','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1011,'2309003','Mucambo','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1012,'2309102','Mulungu','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1013,'2309201','Nova Olinda','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1014,'2309300','Nova Russas','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1015,'2309409','Novo Oriente','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1016,'2309458','Ocara','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1017,'2309508','Oros','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1018,'2309607','Pacajus','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1019,'2309706','Pacatuba','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1020,'2309805','Pacoti','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1021,'2309904','Pacuja','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1022,'2310001','Palhano','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1023,'2310100','Palmacia','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1024,'2310209','Paracuru','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1025,'2310258','Paraipaba','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1026,'2310308','Parambu','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1027,'2310407','Paramoti','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1028,'2310506','Pedra Branca','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1029,'2310605','Penaforte','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1030,'2310704','Pentecoste','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1031,'2310803','Pereiro','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1032,'2310852','Pindoretama','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1033,'2310902','Piquet Carneiro','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1034,'2310951','Pires Ferreira','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1035,'2311009','Poranga','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1036,'2311108','Porteiras','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1037,'2311207','Potengi','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1038,'2311231','Potiretama','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1039,'2311264','Quiterianopolis','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1040,'2311306','Quixada','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1041,'2311355','Quixelô','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1042,'2311405','Quixeramobim','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1043,'2311504','Quixere','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1044,'2311603','Redençao','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1045,'2311702','Reriutaba','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1046,'2311801','Russas','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1047,'2311900','Saboeiro','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1048,'2311959','Salitre','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1049,'2312007','Santana do Acarau','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1050,'2312106','Santana do Cariri','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1051,'2312205','Santa Quiteria','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1052,'2312304','Sao Benedito','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1053,'2312403','Sao Gonçalo do Amarante','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1054,'2312502','Sao Joao do Jaguaribe','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1055,'2312601','Sao Luis do Curu','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1056,'2312700','Senador Pompeu','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1057,'2312809','Senador Sa','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1058,'2312908','Sobral','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1059,'2313005','Solonopole','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1060,'2313104','Tabuleiro do Norte','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1061,'2313203','Tamboril','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1062,'2313252','Tarrafas','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1063,'2313302','Taua','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1064,'2313351','Tejuçuoca','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1065,'2313401','Tiangua','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1066,'2313500','Trairi','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1067,'2313559','Tururu','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1068,'2313609','Ubajara','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1069,'2313708','Umari','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1070,'2313757','Umirim','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1071,'2313807','Uruburetama','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1072,'2313906','Uruoca','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1073,'2313955','Varjota','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1074,'2314003','Varzea Alegre','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1075,'2314102','Viçosa do Ceara','CE','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1076,'2400109','Acari','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1077,'2400208','Açu','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1078,'2400307','Afonso Bezerra','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1079,'2400406','agua Nova','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1080,'2400505','Alexandria','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1081,'2400604','Almino Afonso','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1082,'2400703','Alto do Rodrigues','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1083,'2400802','Angicos','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1084,'2400901','Antônio Martins','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1085,'2401008','Apodi','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1086,'2401107','Areia Branca','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1087,'2401206','Arês','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1088,'2401305','Augusto Severo','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1089,'2401404','Baia Formosa','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1090,'2401453','Barauna','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1091,'2401503','Barcelona','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1092,'2401602','Bento Fernandes','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1093,'2401651','Bodo','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1094,'2401701','Bom Jesus','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1095,'2401800','Brejinho','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1096,'2401859','Caiçara do Norte','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1097,'2401909','Caiçara do Rio do Vento','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1098,'2402006','Caico','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1099,'2402105','Campo Redondo','RN','2022-10-27 17:14:49','2022-10-27 17:14:49'),(1100,'2402204','Canguaretama','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1101,'2402303','Caraubas','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1102,'2402402','Carnauba dos Dantas','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1103,'2402501','Carnaubais','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1104,'2402600','Ceara-Mirim','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1105,'2402709','Cerro Cora','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1106,'2402808','Coronel Ezequiel','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1107,'2402907','Coronel Joao Pessoa','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1108,'2403004','Cruzeta','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1109,'2403103','Currais Novos','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1110,'2403202','Doutor Severiano','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1111,'2403251','Parnamirim','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1112,'2403301','Encanto','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1113,'2403400','Equador','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1114,'2403509','Espirito Santo','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1115,'2403608','Extremoz','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1116,'2403707','Felipe Guerra','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1117,'2403756','Fernando Pedroza','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1118,'2403806','Florânia','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1119,'2403905','Francisco Dantas','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1120,'2404002','Frutuoso Gomes','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1121,'2404101','Galinhos','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1122,'2404200','Goianinha','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1123,'2404309','Governador Dix-Sept Rosado','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1124,'2404408','Grossos','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1125,'2404507','Guamare','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1126,'2404606','Ielmo Marinho','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1127,'2404705','Ipanguaçu','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1128,'2404804','Ipueira','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1129,'2404853','Itaja','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1130,'2404903','Itau','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1131,'2405009','Jaçana','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1132,'2405108','Jandaira','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1133,'2405207','Janduis','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1134,'2405306','Januario Cicco','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1135,'2405405','Japi','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1136,'2405504','Jardim de Angicos','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1137,'2405603','Jardim de Piranhas','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1138,'2405702','Jardim do Serido','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1139,'2405801','Joao Câmara','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1140,'2405900','Joao Dias','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1141,'2406007','Jose da Penha','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1142,'2406106','Jucurutu','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1143,'2406155','Jundia','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1144,'2406205','Lagoa D\'Anta','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1145,'2406304','Lagoa de Pedras','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1146,'2406403','Lagoa de Velhos','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1147,'2406502','Lagoa Nova','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1148,'2406601','Lagoa Salgada','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1149,'2406700','Lajes','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1150,'2406809','Lajes Pintadas','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1151,'2406908','Lucrecia','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1152,'2407005','Luis Gomes','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1153,'2407104','Macaiba','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1154,'2407203','Macau','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1155,'2407252','Major Sales','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1156,'2407302','Marcelino Vieira','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1157,'2407401','Martins','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1158,'2407500','Maxaranguape','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1159,'2407609','Messias Targino','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1160,'2407708','Montanhas','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1161,'2407807','Monte Alegre','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1162,'2407906','Monte das Gameleiras','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1163,'2408003','Mossoro','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1164,'2408102','Natal','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1165,'2408201','Nisia Floresta','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1166,'2408300','Nova Cruz','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1167,'2408409','Olho-D\'agua do Borges','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1168,'2408508','Ouro Branco','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1169,'2408607','Parana','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1170,'2408706','Parau','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1171,'2408805','Parazinho','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1172,'2408904','Parelhas','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1173,'2408953','Rio do Fogo','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1174,'2409100','Passa e Fica','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1175,'2409209','Passagem','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1176,'2409308','Patu','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1177,'2409332','Santa Maria','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1178,'2409407','Pau dos Ferros','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1179,'2409506','Pedra Grande','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1180,'2409605','Pedra Preta','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1181,'2409704','Pedro Avelino','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1182,'2409803','Pedro Velho','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1183,'2409902','Pendências','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1184,'2410009','Piloes','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1185,'2410108','Poço Branco','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1186,'2410207','Portalegre','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1187,'2410256','Porto do Mangue','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1188,'2410306','Presidente Juscelino','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1189,'2410405','Pureza','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1190,'2410504','Rafael Fernandes','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1191,'2410603','Rafael Godeiro','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1192,'2410702','Riacho da Cruz','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1193,'2410801','Riacho de Santana','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1194,'2410900','Riachuelo','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1195,'2411007','Rodolfo Fernandes','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1196,'2411056','Tibau','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1197,'2411106','Ruy Barbosa','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1198,'2411205','Santa Cruz','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1199,'2411403','Santana do Matos','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1200,'2411429','Santana do Serido','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1201,'2411502','Santo Antônio','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1202,'2411601','Sao Bento do Norte','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1203,'2411700','Sao Bento do Trairi','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1204,'2411809','Sao Fernando','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1205,'2411908','Sao Francisco do Oeste','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1206,'2412005','Sao Gonçalo do Amarante','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1207,'2412104','Sao Joao do Sabugi','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1208,'2412203','Sao Jose de Mipibu','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1209,'2412302','Sao Jose do Campestre','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1210,'2412401','Sao Jose do Serido','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1211,'2412500','Sao Miguel','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1212,'2412559','Sao Miguel do Gostoso','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1213,'2412609','Sao Paulo do Potengi','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1214,'2412708','Sao Pedro','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1215,'2412807','Sao Rafael','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1216,'2412906','Sao Tome','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1217,'2413003','Sao Vicente','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1218,'2413102','Senador Eloi de Souza','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1219,'2413201','Senador Georgino Avelino','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1220,'2413300','Serra de Sao Bento','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1221,'2413359','Serra do Mel','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1222,'2413409','Serra Negra do Norte','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1223,'2413508','Serrinha','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1224,'2413557','Serrinha dos Pintos','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1225,'2413607','Severiano Melo','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1226,'2413706','Sitio Novo','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1227,'2413805','Taboleiro Grande','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1228,'2413904','Taipu','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1229,'2414001','Tangara','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1230,'2414100','Tenente Ananias','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1231,'2414159','Tenente Laurentino Cruz','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1232,'2414209','Tibau do Sul','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1233,'2414308','Timbauba dos Batistas','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1234,'2414407','Touros','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1235,'2414456','Triunfo Potiguar','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1236,'2414506','Umarizal','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1237,'2414605','Upanema','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1238,'2414704','Varzea','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1239,'2414753','Venha-Ver','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1240,'2414803','Vera Cruz','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1241,'2414902','Viçosa','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1242,'2415008','Vila Flor','RN','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1243,'2500106','agua Branca','PB','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1244,'2500205','Aguiar','PB','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1245,'2500304','Alagoa Grande','PB','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1246,'2500403','Alagoa Nova','PB','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1247,'2500502','Alagoinha','PB','2022-10-27 17:14:50','2022-10-27 17:14:50'),(1248,'2500536','Alcantil','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1249,'2500577','Algodao de Jandaira','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1250,'2500601','Alhandra','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1251,'2500700','Sao Joao do Rio do Peixe','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1252,'2500734','Amparo','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1253,'2500775','Aparecida','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1254,'2500809','Araçagi','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1255,'2500908','Arara','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1256,'2501005','Araruna','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1257,'2501104','Areia','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1258,'2501153','Areia de Baraunas','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1259,'2501203','Areial','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1260,'2501302','Aroeiras','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1261,'2501351','Assunçao','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1262,'2501401','Baia da Traiçao','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1263,'2501500','Bananeiras','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1264,'2501534','Barauna','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1265,'2501575','Barra de Santana','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1266,'2501609','Barra de Santa Rosa','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1267,'2501708','Barra de Sao Miguel','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1268,'2501807','Bayeux','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1269,'2501906','Belem','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1270,'2502003','Belem do Brejo do Cruz','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1271,'2502052','Bernardino Batista','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1272,'2502102','Boa Ventura','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1273,'2502151','Boa Vista','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1274,'2502201','Bom Jesus','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1275,'2502300','Bom Sucesso','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1276,'2502409','Bonito de Santa Fe','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1277,'2502508','Boqueirao','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1278,'2502607','Igaracy','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1279,'2502706','Borborema','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1280,'2502805','Brejo do Cruz','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1281,'2502904','Brejo dos Santos','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1282,'2503001','Caapora','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1283,'2503100','Cabaceiras','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1284,'2503209','Cabedelo','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1285,'2503308','Cachoeira dos indios','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1286,'2503407','Cacimba de Areia','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1287,'2503506','Cacimba de Dentro','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1288,'2503555','Cacimbas','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1289,'2503605','Caiçara','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1290,'2503704','Cajazeiras','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1291,'2503753','Cajazeirinhas','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1292,'2503803','Caldas Brandao','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1293,'2503902','Camalau','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1294,'2504009','Campina Grande','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1295,'2504033','Capim','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1296,'2504074','Caraubas','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1297,'2504108','Carrapateira','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1298,'2504157','Casserengue','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1299,'2504207','Catingueira','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1300,'2504306','Catole do Rocha','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1301,'2504355','Caturite','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1302,'2504405','Conceiçao','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1303,'2504504','Condado','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1304,'2504603','Conde','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1305,'2504702','Congo','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1306,'2504801','Coremas','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1307,'2504850','Coxixola','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1308,'2504900','Cruz do Espirito Santo','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1309,'2505006','Cubati','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1310,'2505105','Cuite','PB','2022-10-27 17:14:51','2022-10-27 17:14:51'),(1311,'2505204','Cuitegi','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1312,'2505238','Cuite de Mamanguape','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1313,'2505279','Curral de Cima','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1314,'2505303','Curral Velho','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1315,'2505352','Damiao','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1316,'2505402','Desterro','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1317,'2505501','Vista Serrana','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1318,'2505600','Diamante','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1319,'2505709','Dona Inês','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1320,'2505808','Duas Estradas','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1321,'2505907','Emas','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1322,'2506004','Esperança','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1323,'2506103','Fagundes','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1324,'2506202','Frei Martinho','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1325,'2506251','Gado Bravo','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1326,'2506301','Guarabira','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1327,'2506400','Gurinhem','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1328,'2506509','Gurjao','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1329,'2506608','Ibiara','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1330,'2506707','Imaculada','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1331,'2506806','Inga','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1332,'2506905','Itabaiana','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1333,'2507002','Itaporanga','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1334,'2507101','Itapororoca','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1335,'2507200','Itatuba','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1336,'2507309','Jacarau','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1337,'2507408','Jerico','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1338,'2507507','Joao Pessoa','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1339,'2507606','Juarez Tavora','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1340,'2507705','Juazeirinho','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1341,'2507804','Junco do Serido','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1342,'2507903','Juripiranga','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1343,'2508000','Juru','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1344,'2508109','Lagoa','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1345,'2508208','Lagoa de Dentro','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1346,'2508307','Lagoa Seca','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1347,'2508406','Lastro','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1348,'2508505','Livramento','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1349,'2508554','Logradouro','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1350,'2508604','Lucena','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1351,'2508703','Mae D\'agua','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1352,'2508802','Malta','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1353,'2508901','Mamanguape','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1354,'2509008','Manaira','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1355,'2509057','Marcaçao','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1356,'2509107','Mari','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1357,'2509156','Marizopolis','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1358,'2509206','Massaranduba','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1359,'2509305','Mataraca','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1360,'2509339','Matinhas','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1361,'2509370','Mato Grosso','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1362,'2509396','Matureia','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1363,'2509404','Mogeiro','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1364,'2509503','Montadas','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1365,'2509602','Monte Horebe','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1366,'2509701','Monteiro','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1367,'2509800','Mulungu','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1368,'2509909','Natuba','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1369,'2510006','Nazarezinho','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1370,'2510105','Nova Floresta','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1371,'2510204','Nova Olinda','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1372,'2510303','Nova Palmeira','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1373,'2510402','Olho D\'agua','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1374,'2510501','Olivedos','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1375,'2510600','Ouro Velho','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1376,'2510659','Parari','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1377,'2510709','Passagem','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1378,'2510808','Patos','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1379,'2510907','Paulista','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1380,'2511004','Pedra Branca','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1381,'2511103','Pedra Lavrada','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1382,'2511202','Pedras de Fogo','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1383,'2511301','Pianco','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1384,'2511400','Picui','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1385,'2511509','Pilar','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1386,'2511608','Piloes','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1387,'2511707','Piloezinhos','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1388,'2511806','Pirpirituba','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1389,'2511905','Pitimbu','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1390,'2512002','Pocinhos','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1391,'2512036','Poço Dantas','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1392,'2512077','Poço de Jose de Moura','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1393,'2512101','Pombal','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1394,'2512200','Prata','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1395,'2512309','Princesa Isabel','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1396,'2512408','Puxinana','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1397,'2512507','Queimadas','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1398,'2512606','Quixaba','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1399,'2512705','Remigio','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1400,'2512721','Pedro Regis','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1401,'2512747','Riachao','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1402,'2512754','Riachao do Bacamarte','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1403,'2512762','Riachao do Poço','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1404,'2512788','Riacho de Santo Antônio','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1405,'2512804','Riacho dos Cavalos','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1406,'2512903','Rio Tinto','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1407,'2513000','Salgadinho','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1408,'2513109','Salgado de Sao Felix','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1409,'2513158','Santa Cecilia','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1410,'2513208','Santa Cruz','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1411,'2513307','Santa Helena','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1412,'2513356','Santa Inês','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1413,'2513406','Santa Luzia','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1414,'2513505','Santana de Mangueira','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1415,'2513604','Santana dos Garrotes','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1416,'2513653','Joca Claudino','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1417,'2513703','Santa Rita','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1418,'2513802','Santa Teresinha','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1419,'2513851','Santo Andre','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1420,'2513901','Sao Bento','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1421,'2513927','Sao Bentinho','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1422,'2513943','Sao Domingos do Cariri','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1423,'2513968','Sao Domingos','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1424,'2513984','Sao Francisco','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1425,'2514008','Sao Joao do Cariri','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1426,'2514107','Sao Joao do Tigre','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1427,'2514206','Sao Jose da Lagoa Tapada','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1428,'2514305','Sao Jose de Caiana','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1429,'2514404','Sao Jose de Espinharas','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1430,'2514453','Sao Jose dos Ramos','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1431,'2514503','Sao Jose de Piranhas','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1432,'2514552','Sao Jose de Princesa','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1433,'2514602','Sao Jose do Bonfim','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1434,'2514651','Sao Jose do Brejo do Cruz','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1435,'2514701','Sao Jose do Sabugi','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1436,'2514800','Sao Jose dos Cordeiros','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1437,'2514909','Sao Mamede','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1438,'2515005','Sao Miguel de Taipu','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1439,'2515104','Sao Sebastiao de Lagoa de Roça','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1440,'2515203','Sao Sebastiao do Umbuzeiro','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1441,'2515302','Sape','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1442,'2515401','Sao Vicente do Serido','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1443,'2515500','Serra Branca','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1444,'2515609','Serra da Raiz','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1445,'2515708','Serra Grande','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1446,'2515807','Serra Redonda','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1447,'2515906','Serraria','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1448,'2515930','Sertaozinho','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1449,'2515971','Sobrado','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1450,'2516003','Solânea','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1451,'2516102','Soledade','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1452,'2516151','Sossêgo','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1453,'2516201','Sousa','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1454,'2516300','Sume','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1455,'2516409','Tacima','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1456,'2516508','Taperoa','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1457,'2516607','Tavares','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1458,'2516706','Teixeira','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1459,'2516755','Tenorio','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1460,'2516805','Triunfo','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1461,'2516904','Uirauna','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1462,'2517001','Umbuzeiro','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1463,'2517100','Varzea','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1464,'2517209','Vieiropolis','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1465,'2517407','Zabelê','PB','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1466,'2600054','Abreu e Lima','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1467,'2600104','Afogados da Ingazeira','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1468,'2600203','Afrânio','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1469,'2600302','Agrestina','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1470,'2600401','agua Preta','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1471,'2600500','aguas Belas','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1472,'2600609','Alagoinha','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1473,'2600708','Aliança','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1474,'2600807','Altinho','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1475,'2600906','Amaraji','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1476,'2601003','Angelim','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1477,'2601052','Araçoiaba','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1478,'2601102','Araripina','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1479,'2601201','Arcoverde','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1480,'2601300','Barra de Guabiraba','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1481,'2601409','Barreiros','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1482,'2601508','Belem de Maria','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1483,'2601607','Belem do Sao Francisco','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1484,'2601706','Belo Jardim','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1485,'2601805','Betânia','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1486,'2601904','Bezerros','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1487,'2602001','Bodoco','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1488,'2602100','Bom Conselho','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1489,'2602209','Bom Jardim','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1490,'2602308','Bonito','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1491,'2602407','Brejao','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1492,'2602506','Brejinho','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1493,'2602605','Brejo da Madre de Deus','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1494,'2602704','Buenos Aires','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1495,'2602803','Buique','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1496,'2602902','Cabo de Santo Agostinho','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1497,'2603009','Cabrobo','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1498,'2603108','Cachoeirinha','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1499,'2603207','Caetes','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1500,'2603306','Calçado','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1501,'2603405','Calumbi','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1502,'2603454','Camaragibe','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1503,'2603504','Camocim de Sao Felix','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1504,'2603603','Camutanga','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1505,'2603702','Canhotinho','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1506,'2603801','Capoeiras','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1507,'2603900','Carnaiba','PE','2022-10-27 17:14:52','2022-10-27 17:14:52'),(1508,'2603926','Carnaubeira da Penha','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1509,'2604007','Carpina','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1510,'2604106','Caruaru','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1511,'2604155','Casinhas','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1512,'2604205','Catende','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1513,'2604304','Cedro','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1514,'2604403','Cha de Alegria','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1515,'2604502','Cha Grande','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1516,'2604601','Condado','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1517,'2604700','Correntes','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1518,'2604809','Cortês','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1519,'2604908','Cumaru','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1520,'2605004','Cupira','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1521,'2605103','Custodia','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1522,'2605152','Dormentes','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1523,'2605202','Escada','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1524,'2605301','Exu','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1525,'2605400','Feira Nova','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1526,'2605459','Fernando de Noronha','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1527,'2605509','Ferreiros','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1528,'2605608','Flores','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1529,'2605707','Floresta','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1530,'2605806','Frei Miguelinho','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1531,'2605905','Gameleira','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1532,'2606002','Garanhuns','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1533,'2606101','Gloria do Goita','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1534,'2606200','Goiana','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1535,'2606309','Granito','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1536,'2606408','Gravata','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1537,'2606507','Iati','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1538,'2606606','Ibimirim','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1539,'2606705','Ibirajuba','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1540,'2606804','Igarassu','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1541,'2606903','Iguaraci','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1542,'2607000','Inaja','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1543,'2607109','Ingazeira','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1544,'2607208','Ipojuca','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1545,'2607307','Ipubi','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1546,'2607406','Itacuruba','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1547,'2607505','Itaiba','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1548,'2607604','Ilha de Itamaraca','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1549,'2607653','Itambe','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1550,'2607703','Itapetim','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1551,'2607752','Itapissuma','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1552,'2607802','Itaquitinga','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1553,'2607901','Jaboatao dos Guararapes','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1554,'2607950','Jaqueira','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1555,'2608008','Jatauba','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1556,'2608057','Jatoba','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1557,'2608107','Joao Alfredo','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1558,'2608206','Joaquim Nabuco','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1559,'2608255','Jucati','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1560,'2608305','Jupi','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1561,'2608404','Jurema','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1562,'2608453','Lagoa do Carro','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1563,'2608503','Lagoa de Itaenga','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1564,'2608602','Lagoa do Ouro','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1565,'2608701','Lagoa dos Gatos','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1566,'2608750','Lagoa Grande','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1567,'2608800','Lajedo','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1568,'2608909','Limoeiro','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1569,'2609006','Macaparana','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1570,'2609105','Machados','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1571,'2609154','Manari','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1572,'2609204','Maraial','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1573,'2609303','Mirandiba','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1574,'2609402','Moreno','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1575,'2609501','Nazare da Mata','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1576,'2609600','Olinda','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1577,'2609709','Orobo','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1578,'2609808','Oroco','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1579,'2609907','Ouricuri','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1580,'2610004','Palmares','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1581,'2610103','Palmeirina','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1582,'2610202','Panelas','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1583,'2610301','Paranatama','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1584,'2610400','Parnamirim','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1585,'2610509','Passira','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1586,'2610608','Paudalho','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1587,'2610707','Paulista','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1588,'2610806','Pedra','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1589,'2610905','Pesqueira','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1590,'2611002','Petrolândia','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1591,'2611101','Petrolina','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1592,'2611200','Poçao','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1593,'2611309','Pombos','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1594,'2611408','Primavera','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1595,'2611507','Quipapa','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1596,'2611533','Quixaba','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1597,'2611606','Recife','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1598,'2611705','Riacho das Almas','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1599,'2611804','Ribeirao','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1600,'2611903','Rio Formoso','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1601,'2612000','Saire','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1602,'2612109','Salgadinho','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1603,'2612208','Salgueiro','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1604,'2612307','Saloa','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1605,'2612406','Sanharo','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1606,'2612455','Santa Cruz','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1607,'2612471','Santa Cruz da Baixa Verde','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1608,'2612505','Santa Cruz do Capibaribe','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1609,'2612554','Santa Filomena','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1610,'2612604','Santa Maria da Boa Vista','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1611,'2612703','Santa Maria do Cambuca','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1612,'2612802','Santa Terezinha','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1613,'2612901','Sao Benedito do Sul','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1614,'2613008','Sao Bento do Una','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1615,'2613107','Sao Caitano','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1616,'2613206','Sao Joao','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1617,'2613305','Sao Joaquim do Monte','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1618,'2613404','Sao Jose da Coroa Grande','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1619,'2613503','Sao Jose do Belmonte','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1620,'2613602','Sao Jose do Egito','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1621,'2613701','Sao Lourenço da Mata','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1622,'2613800','Sao Vicente Ferrer','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1623,'2613909','Serra Talhada','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1624,'2614006','Serrita','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1625,'2614105','Sertânia','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1626,'2614204','Sirinhaem','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1627,'2614303','Moreilândia','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1628,'2614402','Solidao','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1629,'2614501','Surubim','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1630,'2614600','Tabira','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1631,'2614709','Tacaimbo','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1632,'2614808','Tacaratu','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1633,'2614857','Tamandare','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1634,'2615003','Taquaritinga do Norte','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1635,'2615102','Terezinha','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1636,'2615201','Terra Nova','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1637,'2615300','Timbauba','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1638,'2615409','Toritama','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1639,'2615508','Tracunhaem','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1640,'2615607','Trindade','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1641,'2615706','Triunfo','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1642,'2615805','Tupanatinga','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1643,'2615904','Tuparetama','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1644,'2616001','Venturosa','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1645,'2616100','Verdejante','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1646,'2616183','Vertente do Lerio','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1647,'2616209','Vertentes','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1648,'2616308','Vicência','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1649,'2616407','Vitoria de Santo Antao','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1650,'2616506','Xexeu','PE','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1651,'2700102','agua Branca','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1652,'2700201','Anadia','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1653,'2700300','Arapiraca','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1654,'2700409','Atalaia','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1655,'2700508','Barra de Santo Antônio','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1656,'2700607','Barra de Sao Miguel','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1657,'2700706','Batalha','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1658,'2700805','Belem','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1659,'2700904','Belo Monte','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1660,'2701001','Boca da Mata','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1661,'2701100','Branquinha','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1662,'2701209','Cacimbinhas','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1663,'2701308','Cajueiro','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1664,'2701357','Campestre','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1665,'2701407','Campo Alegre','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1666,'2701506','Campo Grande','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1667,'2701605','Canapi','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1668,'2701704','Capela','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1669,'2701803','Carneiros','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1670,'2701902','Cha Preta','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1671,'2702009','Coite do Noia','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1672,'2702108','Colônia Leopoldina','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1673,'2702207','Coqueiro Seco','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1674,'2702306','Coruripe','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1675,'2702355','Craibas','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1676,'2702405','Delmiro Gouveia','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1677,'2702504','Dois Riachos','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1678,'2702553','Estrela de Alagoas','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1679,'2702603','Feira Grande','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1680,'2702702','Feliz Deserto','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1681,'2702801','Flexeiras','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1682,'2702900','Girau do Ponciano','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1683,'2703007','Ibateguara','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1684,'2703106','Igaci','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1685,'2703205','Igreja Nova','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1686,'2703304','Inhapi','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1687,'2703403','Jacare dos Homens','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1688,'2703502','Jacuipe','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1689,'2703601','Japaratinga','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1690,'2703700','Jaramataia','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1691,'2703759','Jequia da Praia','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1692,'2703809','Joaquim Gomes','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1693,'2703908','Jundia','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1694,'2704005','Junqueiro','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1695,'2704104','Lagoa da Canoa','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1696,'2704203','Limoeiro de Anadia','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1697,'2704302','Maceio','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1698,'2704401','Major Isidoro','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1699,'2704500','Maragogi','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1700,'2704609','Maravilha','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1701,'2704708','Marechal Deodoro','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1702,'2704807','Maribondo','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1703,'2704906','Mar Vermelho','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1704,'2705002','Mata Grande','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1705,'2705101','Matriz de Camaragibe','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1706,'2705200','Messias','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1707,'2705309','Minador do Negrao','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1708,'2705408','Monteiropolis','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1709,'2705507','Murici','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1710,'2705606','Novo Lino','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1711,'2705705','Olho D\'agua das Flores','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1712,'2705804','Olho D\'agua do Casado','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1713,'2705903','Olho D\'agua Grande','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1714,'2706000','Olivença','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1715,'2706109','Ouro Branco','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1716,'2706208','Palestina','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1717,'2706307','Palmeira dos indios','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1718,'2706406','Pao de Açucar','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1719,'2706422','Pariconha','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1720,'2706448','Paripueira','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1721,'2706505','Passo de Camaragibe','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1722,'2706604','Paulo Jacinto','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1723,'2706703','Penedo','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1724,'2706802','Piaçabuçu','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1725,'2706901','Pilar','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1726,'2707008','Pindoba','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1727,'2707107','Piranhas','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1728,'2707206','Poço das Trincheiras','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1729,'2707305','Porto Calvo','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1730,'2707404','Porto de Pedras','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1731,'2707503','Porto Real do Colegio','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1732,'2707602','Quebrangulo','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1733,'2707701','Rio Largo','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1734,'2707800','Roteiro','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1735,'2707909','Santa Luzia do Norte','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1736,'2708006','Santana do Ipanema','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1737,'2708105','Santana do Mundau','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1738,'2708204','Sao Bras','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1739,'2708303','Sao Jose da Laje','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1740,'2708402','Sao Jose da Tapera','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1741,'2708501','Sao Luis do Quitunde','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1742,'2708600','Sao Miguel dos Campos','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1743,'2708709','Sao Miguel dos Milagres','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1744,'2708808','Sao Sebastiao','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1745,'2708907','Satuba','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1746,'2708956','Senador Rui Palmeira','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1747,'2709004','Tanque D\'Arca','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1748,'2709103','Taquarana','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1749,'2709152','Teotônio Vilela','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1750,'2709202','Traipu','AL','2022-10-27 17:14:53','2022-10-27 17:14:53'),(1751,'2709301','Uniao dos Palmares','AL','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1752,'2709400','Viçosa','AL','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1753,'2800100','Amparo de Sao Francisco','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1754,'2800209','Aquidaba','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1755,'2800308','Aracaju','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1756,'2800407','Araua','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1757,'2800506','Areia Branca','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1758,'2800605','Barra dos Coqueiros','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1759,'2800670','Boquim','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1760,'2800704','Brejo Grande','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1761,'2801009','Campo do Brito','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1762,'2801108','Canhoba','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1763,'2801207','Caninde de Sao Francisco','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1764,'2801306','Capela','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1765,'2801405','Carira','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1766,'2801504','Carmopolis','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1767,'2801603','Cedro de Sao Joao','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1768,'2801702','Cristinapolis','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1769,'2801900','Cumbe','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1770,'2802007','Divina Pastora','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1771,'2802106','Estância','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1772,'2802205','Feira Nova','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1773,'2802304','Frei Paulo','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1774,'2802403','Gararu','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1775,'2802502','General Maynard','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1776,'2802601','Gracho Cardoso','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1777,'2802700','Ilha das Flores','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1778,'2802809','Indiaroba','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1779,'2802908','Itabaiana','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1780,'2803005','Itabaianinha','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1781,'2803104','Itabi','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1782,'2803203','Itaporanga D\'Ajuda','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1783,'2803302','Japaratuba','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1784,'2803401','Japoata','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1785,'2803500','Lagarto','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1786,'2803609','Laranjeiras','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1787,'2803708','Macambira','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1788,'2803807','Malhada dos Bois','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1789,'2803906','Malhador','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1790,'2804003','Maruim','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1791,'2804102','Moita Bonita','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1792,'2804201','Monte Alegre de Sergipe','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1793,'2804300','Muribeca','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1794,'2804409','Neopolis','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1795,'2804458','Nossa Senhora Aparecida','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1796,'2804508','Nossa Senhora da Gloria','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1797,'2804607','Nossa Senhora das Dores','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1798,'2804706','Nossa Senhora de Lourdes','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1799,'2804805','Nossa Senhora do Socorro','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1800,'2804904','Pacatuba','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1801,'2805000','Pedra Mole','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1802,'2805109','Pedrinhas','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1803,'2805208','Pinhao','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1804,'2805307','Pirambu','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1805,'2805406','Poço Redondo','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1806,'2805505','Poço Verde','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1807,'2805604','Porto da Folha','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1808,'2805703','Propria','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1809,'2805802','Riachao do Dantas','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1810,'2805901','Riachuelo','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1811,'2806008','Ribeiropolis','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1812,'2806107','Rosario do Catete','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1813,'2806206','Salgado','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1814,'2806305','Santa Luzia do Itanhy','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1815,'2806404','Santana do Sao Francisco','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1816,'2806503','Santa Rosa de Lima','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1817,'2806602','Santo Amaro das Brotas','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1818,'2806701','Sao Cristovao','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1819,'2806800','Sao Domingos','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1820,'2806909','Sao Francisco','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1821,'2807006','Sao Miguel do Aleixo','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1822,'2807105','Simao Dias','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1823,'2807204','Siriri','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1824,'2807303','Telha','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1825,'2807402','Tobias Barreto','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1826,'2807501','Tomar do Geru','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1827,'2807600','Umbauba','SE','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1828,'2900108','Abaira','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1829,'2900207','Abare','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1830,'2900306','Acajutiba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1831,'2900355','Adustina','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1832,'2900405','agua Fria','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1833,'2900504','erico Cardoso','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1834,'2900603','Aiquara','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1835,'2900702','Alagoinhas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1836,'2900801','Alcobaça','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1837,'2900900','Almadina','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1838,'2901007','Amargosa','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1839,'2901106','Amelia Rodrigues','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1840,'2901155','America Dourada','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1841,'2901205','Anage','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1842,'2901304','Andarai','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1843,'2901353','Andorinha','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1844,'2901403','Angical','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1845,'2901502','Anguera','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1846,'2901601','Antas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1847,'2901700','Antônio Cardoso','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1848,'2901809','Antônio Gonçalves','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1849,'2901908','Apora','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1850,'2901957','Apuarema','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1851,'2902005','Aracatu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1852,'2902054','Araças','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1853,'2902104','Araci','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1854,'2902203','Aramari','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1855,'2902252','Arataca','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1856,'2902302','Aratuipe','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1857,'2902401','Aurelino Leal','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1858,'2902500','Baianopolis','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1859,'2902609','Baixa Grande','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1860,'2902658','Banzaê','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1861,'2902708','Barra','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1862,'2902807','Barra da Estiva','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1863,'2902906','Barra do Choça','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1864,'2903003','Barra do Mendes','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1865,'2903102','Barra do Rocha','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1866,'2903201','Barreiras','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1867,'2903235','Barro Alto','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1868,'2903276','Barrocas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1869,'2903300','Barro Preto','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1870,'2903409','Belmonte','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1871,'2903508','Belo Campo','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1872,'2903607','Biritinga','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1873,'2903706','Boa Nova','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1874,'2903805','Boa Vista do Tupim','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1875,'2903904','Bom Jesus da Lapa','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1876,'2903953','Bom Jesus da Serra','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1877,'2904001','Boninal','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1878,'2904050','Bonito','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1879,'2904100','Boquira','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1880,'2904209','Botupora','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1881,'2904308','Brejoes','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1882,'2904407','Brejolândia','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1883,'2904506','Brotas de Macaubas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1884,'2904605','Brumado','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1885,'2904704','Buerarema','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1886,'2904753','Buritirama','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1887,'2904803','Caatiba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1888,'2904852','Cabaceiras do Paraguaçu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1889,'2904902','Cachoeira','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1890,'2905008','Cacule','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1891,'2905107','Caem','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1892,'2905156','Caetanos','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1893,'2905206','Caetite','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1894,'2905305','Cafarnaum','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1895,'2905404','Cairu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1896,'2905503','Caldeirao Grande','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1897,'2905602','Camacan','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1898,'2905701','Camaçari','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1899,'2905800','Camamu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1900,'2905909','Campo Alegre de Lourdes','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1901,'2906006','Campo Formoso','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1902,'2906105','Canapolis','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1903,'2906204','Canarana','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1904,'2906303','Canavieiras','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1905,'2906402','Candeal','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1906,'2906501','Candeias','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1907,'2906600','Candiba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1908,'2906709','Cândido Sales','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1909,'2906808','Cansançao','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1910,'2906824','Canudos','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1911,'2906857','Capela do Alto Alegre','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1912,'2906873','Capim Grosso','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1913,'2906899','Caraibas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1914,'2906907','Caravelas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1915,'2907004','Cardeal da Silva','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1916,'2907103','Carinhanha','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1917,'2907202','Casa Nova','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1918,'2907301','Castro Alves','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1919,'2907400','Catolândia','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1920,'2907509','Catu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1921,'2907558','Caturama','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1922,'2907608','Central','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1923,'2907707','Chorrocho','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1924,'2907806','Cicero Dantas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1925,'2907905','Cipo','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1926,'2908002','Coaraci','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1927,'2908101','Cocos','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1928,'2908200','Conceiçao da Feira','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1929,'2908309','Conceiçao do Almeida','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1930,'2908408','Conceiçao do Coite','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1931,'2908507','Conceiçao do Jacuipe','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1932,'2908606','Conde','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1933,'2908705','Condeuba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1934,'2908804','Contendas do Sincora','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1935,'2908903','Coraçao de Maria','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1936,'2909000','Cordeiros','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1937,'2909109','Coribe','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1938,'2909208','Coronel Joao Sa','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1939,'2909307','Correntina','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1940,'2909406','Cotegipe','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1941,'2909505','Cravolândia','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1942,'2909604','Crisopolis','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1943,'2909703','Cristopolis','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1944,'2909802','Cruz das Almas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1945,'2909901','Curaça','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1946,'2910008','Dario Meira','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1947,'2910057','Dias D\'avila','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1948,'2910107','Dom Basilio','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1949,'2910206','Dom Macedo Costa','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1950,'2910305','Elisio Medrado','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1951,'2910404','Encruzilhada','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1952,'2910503','Entre Rios','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1953,'2910602','Esplanada','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1954,'2910701','Euclides da Cunha','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1955,'2910727','Eunapolis','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1956,'2910750','Fatima','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1957,'2910776','Feira da Mata','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1958,'2910800','Feira de Santana','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1959,'2910859','Filadelfia','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1960,'2910909','Firmino Alves','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1961,'2911006','Floresta Azul','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1962,'2911105','Formosa do Rio Preto','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1963,'2911204','Gandu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1964,'2911253','Gaviao','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1965,'2911303','Gentio do Ouro','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1966,'2911402','Gloria','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1967,'2911501','Gongogi','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1968,'2911600','Governador Mangabeira','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1969,'2911659','Guajeru','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1970,'2911709','Guanambi','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1971,'2911808','Guaratinga','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1972,'2911857','Heliopolis','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1973,'2911907','Iaçu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1974,'2912004','Ibiassucê','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1975,'2912103','Ibicarai','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1976,'2912202','Ibicoara','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1977,'2912301','Ibicui','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1978,'2912400','Ibipeba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1979,'2912509','Ibipitanga','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1980,'2912608','Ibiquera','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1981,'2912707','Ibirapitanga','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1982,'2912806','Ibirapua','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1983,'2912905','Ibirataia','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1984,'2913002','Ibitiara','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1985,'2913101','Ibitita','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1986,'2913200','Ibotirama','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1987,'2913309','Ichu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1988,'2913408','Igapora','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1989,'2913457','Igrapiuna','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1990,'2913507','Iguai','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1991,'2913606','Ilheus','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1992,'2913705','Inhambupe','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1993,'2913804','Ipecaeta','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1994,'2913903','Ipiau','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1995,'2914000','Ipira','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1996,'2914109','Ipupiara','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1997,'2914208','Irajuba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1998,'2914307','Iramaia','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(1999,'2914406','Iraquara','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2000,'2914505','Irara','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2001,'2914604','Irecê','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2002,'2914653','Itabela','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2003,'2914703','Itaberaba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2004,'2914802','Itabuna','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2005,'2914901','Itacare','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2006,'2915007','Itaete','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2007,'2915106','Itagi','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2008,'2915205','Itagiba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2009,'2915304','Itagimirim','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2010,'2915353','Itaguaçu da Bahia','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2011,'2915403','Itaju do Colônia','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2012,'2915502','Itajuipe','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2013,'2915601','Itamaraju','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2014,'2915700','Itamari','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2015,'2915809','Itambe','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2016,'2915908','Itanagra','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2017,'2916005','Itanhem','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2018,'2916104','Itaparica','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2019,'2916203','Itape','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2020,'2916302','Itapebi','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2021,'2916401','Itapetinga','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2022,'2916500','Itapicuru','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2023,'2916609','Itapitanga','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2024,'2916708','Itaquara','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2025,'2916807','Itarantim','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2026,'2916856','Itatim','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2027,'2916906','Itiruçu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2028,'2917003','Itiuba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2029,'2917102','Itororo','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2030,'2917201','Ituaçu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2031,'2917300','Itubera','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2032,'2917334','Iuiu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2033,'2917359','Jaborandi','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2034,'2917409','Jacaraci','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2035,'2917508','Jacobina','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2036,'2917607','Jaguaquara','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2037,'2917706','Jaguarari','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2038,'2917805','Jaguaripe','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2039,'2917904','Jandaira','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2040,'2918001','Jequie','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2041,'2918100','Jeremoabo','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2042,'2918209','Jiquiriça','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2043,'2918308','Jitauna','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2044,'2918357','Joao Dourado','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2045,'2918407','Juazeiro','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2046,'2918456','Jucuruçu','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2047,'2918506','Jussara','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2048,'2918555','Jussari','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2049,'2918605','Jussiape','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2050,'2918704','Lafaiete Coutinho','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2051,'2918753','Lagoa Real','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2052,'2918803','Laje','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2053,'2918902','Lajedao','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2054,'2919009','Lajedinho','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2055,'2919058','Lajedo do Tabocal','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2056,'2919108','Lamarao','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2057,'2919157','Lapao','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2058,'2919207','Lauro de Freitas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2059,'2919306','Lençois','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2060,'2919405','Licinio de Almeida','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2061,'2919504','Livramento de Nossa Senhora','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2062,'2919553','Luis Eduardo Magalhaes','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2063,'2919603','Macajuba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2064,'2919702','Macarani','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2065,'2919801','Macaubas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2066,'2919900','Macurure','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2067,'2919926','Madre de Deus','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2068,'2919959','Maetinga','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2069,'2920007','Maiquinique','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2070,'2920106','Mairi','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2071,'2920205','Malhada','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2072,'2920304','Malhada de Pedras','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2073,'2920403','Manoel Vitorino','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2074,'2920452','Mansidao','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2075,'2920502','Maracas','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2076,'2920601','Maragogipe','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2077,'2920700','Marau','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2078,'2920809','Marcionilio Souza','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2079,'2920908','Mascote','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2080,'2921005','Mata de Sao Joao','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2081,'2921054','Matina','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2082,'2921104','Medeiros Neto','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2083,'2921203','Miguel Calmon','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2084,'2921302','Milagres','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2085,'2921401','Mirangaba','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2086,'2921450','Mirante','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2087,'2921500','Monte Santo','BA','2022-10-27 17:14:54','2022-10-27 17:14:54'),(2088,'2921609','Morpara','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2089,'2921708','Morro do Chapeu','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2090,'2921807','Mortugaba','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2091,'2921906','Mucugê','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2092,'2922003','Mucuri','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2093,'2922052','Mulungu do Morro','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2094,'2922102','Mundo Novo','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2095,'2922201','Muniz Ferreira','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2096,'2922250','Muquem de Sao Francisco','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2097,'2922300','Muritiba','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2098,'2922409','Mutuipe','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2099,'2922508','Nazare','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2100,'2922607','Nilo Peçanha','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2101,'2922656','Nordestina','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2102,'2922706','Nova Canaa','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2103,'2922730','Nova Fatima','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2104,'2922755','Nova Ibia','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2105,'2922805','Nova Itarana','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2106,'2922854','Nova Redençao','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2107,'2922904','Nova Soure','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2108,'2923001','Nova Viçosa','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2109,'2923035','Novo Horizonte','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2110,'2923050','Novo Triunfo','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2111,'2923100','Olindina','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2112,'2923209','Oliveira dos Brejinhos','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2113,'2923308','Ouriçangas','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2114,'2923357','Ourolândia','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2115,'2923407','Palmas de Monte Alto','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2116,'2923506','Palmeiras','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2117,'2923605','Paramirim','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2118,'2923704','Paratinga','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2119,'2923803','Paripiranga','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2120,'2923902','Pau Brasil','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2121,'2924009','Paulo Afonso','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2122,'2924058','Pe de Serra','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2123,'2924108','Pedrao','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2124,'2924207','Pedro Alexandre','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2125,'2924306','Piata','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2126,'2924405','Pilao Arcado','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2127,'2924504','Pindai','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2128,'2924603','Pindobaçu','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2129,'2924652','Pintadas','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2130,'2924678','Pirai do Norte','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2131,'2924702','Piripa','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2132,'2924801','Piritiba','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2133,'2924900','Planaltino','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2134,'2925006','Planalto','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2135,'2925105','Poçoes','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2136,'2925204','Pojuca','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2137,'2925253','Ponto Novo','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2138,'2925303','Porto Seguro','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2139,'2925402','Potiragua','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2140,'2925501','Prado','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2141,'2925600','Presidente Dutra','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2142,'2925709','Presidente Jânio Quadros','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2143,'2925758','Presidente Tancredo Neves','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2144,'2925808','Queimadas','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2145,'2925907','Quijingue','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2146,'2925931','Quixabeira','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2147,'2925956','Rafael Jambeiro','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2148,'2926004','Remanso','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2149,'2926103','Retirolândia','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2150,'2926202','Riachao das Neves','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2151,'2926301','Riachao do Jacuipe','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2152,'2926400','Riacho de Santana','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2153,'2926509','Ribeira do Amparo','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2154,'2926608','Ribeira do Pombal','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2155,'2926657','Ribeirao do Largo','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2156,'2926707','Rio de Contas','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2157,'2926806','Rio do Antônio','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2158,'2926905','Rio do Pires','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2159,'2927002','Rio Real','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2160,'2927101','Rodelas','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2161,'2927200','Ruy Barbosa','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2162,'2927309','Salinas da Margarida','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2163,'2927408','Salvador','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2164,'2927507','Santa Barbara','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2165,'2927606','Santa Brigida','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2166,'2927705','Santa Cruz Cabralia','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2167,'2927804','Santa Cruz da Vitoria','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2168,'2927903','Santa Inês','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2169,'2928000','Santaluz','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2170,'2928059','Santa Luzia','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2171,'2928109','Santa Maria da Vitoria','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2172,'2928208','Santana','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2173,'2928307','Santanopolis','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2174,'2928406','Santa Rita de Cassia','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2175,'2928505','Santa Teresinha','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2176,'2928604','Santo Amaro','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2177,'2928703','Santo Antônio de Jesus','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2178,'2928802','Santo Estêvao','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2179,'2928901','Sao Desiderio','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2180,'2928950','Sao Domingos','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2181,'2929008','Sao Felix','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2182,'2929057','Sao Felix do Coribe','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2183,'2929107','Sao Felipe','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2184,'2929206','Sao Francisco do Conde','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2185,'2929255','Sao Gabriel','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2186,'2929305','Sao Gonçalo dos Campos','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2187,'2929354','Sao Jose da Vitoria','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2188,'2929370','Sao Jose do Jacuipe','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2189,'2929404','Sao Miguel das Matas','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2190,'2929503','Sao Sebastiao do Passe','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2191,'2929602','Sapeaçu','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2192,'2929701','Satiro Dias','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2193,'2929750','Saubara','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2194,'2929800','Saude','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2195,'2929909','Seabra','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2196,'2930006','Sebastiao Laranjeiras','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2197,'2930105','Senhor do Bonfim','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2198,'2930154','Serra do Ramalho','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2199,'2930204','Sento Se','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2200,'2930303','Serra Dourada','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2201,'2930402','Serra Preta','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2202,'2930501','Serrinha','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2203,'2930600','Serrolândia','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2204,'2930709','Simoes Filho','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2205,'2930758','Sitio do Mato','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2206,'2930766','Sitio do Quinto','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2207,'2930774','Sobradinho','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2208,'2930808','Souto Soares','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2209,'2930907','Tabocas do Brejo Velho','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2210,'2931004','Tanhaçu','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2211,'2931053','Tanque Novo','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2212,'2931103','Tanquinho','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2213,'2931202','Taperoa','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2214,'2931301','Tapiramuta','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2215,'2931350','Teixeira de Freitas','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2216,'2931400','Teodoro Sampaio','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2217,'2931509','Teofilândia','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2218,'2931608','Teolândia','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2219,'2931707','Terra Nova','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2220,'2931806','Tremedal','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2221,'2931905','Tucano','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2222,'2932002','Uaua','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2223,'2932101','Ubaira','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2224,'2932200','Ubaitaba','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2225,'2932309','Ubata','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2226,'2932408','Uibai','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2227,'2932457','Umburanas','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2228,'2932507','Una','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2229,'2932606','Urandi','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2230,'2932705','Uruçuca','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2231,'2932804','Utinga','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2232,'2932903','Valença','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2233,'2933000','Valente','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2234,'2933059','Varzea da Roça','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2235,'2933109','Varzea do Poço','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2236,'2933158','Varzea Nova','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2237,'2933174','Varzedo','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2238,'2933208','Vera Cruz','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2239,'2933257','Vereda','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2240,'2933307','Vitoria da Conquista','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2241,'2933406','Wagner','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2242,'2933455','Wanderley','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2243,'2933505','Wenceslau Guimaraes','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2244,'2933604','Xique-Xique','BA','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2245,'3100104','Abadia dos Dourados','MG','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2246,'3100203','Abaete','MG','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2247,'3100302','Abre Campo','MG','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2248,'3100401','Acaiaca','MG','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2249,'3100500','Açucena','MG','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2250,'3100609','agua Boa','MG','2022-10-27 17:14:55','2022-10-27 17:14:55'),(2251,'3100708','agua Comprida','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2252,'3100807','Aguanil','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2253,'3100906','aguas Formosas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2254,'3101003','aguas Vermelhas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2255,'3101102','Aimores','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2256,'3101201','Aiuruoca','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2257,'3101300','Alagoa','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2258,'3101409','Albertina','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2259,'3101508','Alem Paraiba','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2260,'3101607','Alfenas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2261,'3101631','Alfredo Vasconcelos','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2262,'3101706','Almenara','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2263,'3101805','Alpercata','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2264,'3101904','Alpinopolis','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2265,'3102001','Alterosa','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2266,'3102050','Alto Caparao','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2267,'3102100','Alto Rio Doce','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2268,'3102209','Alvarenga','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2269,'3102308','Alvinopolis','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2270,'3102407','Alvorada de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2271,'3102506','Amparo do Serra','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2272,'3102605','Andradas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2273,'3102704','Cachoeira de Pajeu','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2274,'3102803','Andrelândia','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2275,'3102852','Angelândia','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2276,'3102902','Antônio Carlos','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2277,'3103009','Antônio Dias','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2278,'3103108','Antônio Prado de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2279,'3103207','Araçai','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2280,'3103306','Aracitaba','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2281,'3103405','Araçuai','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2282,'3103504','Araguari','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2283,'3103603','Arantina','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2284,'3103702','Araponga','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2285,'3103751','Arapora','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2286,'3103801','Arapua','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2287,'3103900','Araujos','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2288,'3104007','Araxa','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2289,'3104106','Arceburgo','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2290,'3104205','Arcos','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2291,'3104304','Areado','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2292,'3104403','Argirita','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2293,'3104452','Aricanduva','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2294,'3104502','Arinos','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2295,'3104601','Astolfo Dutra','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2296,'3104700','Ataleia','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2297,'3104809','Augusto de Lima','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2298,'3104908','Baependi','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2299,'3105004','Baldim','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2300,'3105103','Bambui','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2301,'3105202','Bandeira','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2302,'3105301','Bandeira do Sul','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2303,'3105400','Barao de Cocais','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2304,'3105509','Barao de Monte Alto','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2305,'3105608','Barbacena','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2306,'3105707','Barra Longa','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2307,'3105905','Barroso','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2308,'3106002','Bela Vista de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2309,'3106101','Belmiro Braga','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2310,'3106200','Belo Horizonte','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2311,'3106309','Belo Oriente','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2312,'3106408','Belo Vale','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2313,'3106507','Berilo','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2314,'3106606','Bertopolis','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2315,'3106655','Berizal','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2316,'3106705','Betim','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2317,'3106804','Bias Fortes','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2318,'3106903','Bicas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2319,'3107000','Biquinhas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2320,'3107109','Boa Esperança','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2321,'3107208','Bocaina de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2322,'3107307','Bocaiuva','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2323,'3107406','Bom Despacho','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2324,'3107505','Bom Jardim de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2325,'3107604','Bom Jesus da Penha','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2326,'3107703','Bom Jesus do Amparo','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2327,'3107802','Bom Jesus do Galho','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2328,'3107901','Bom Repouso','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2329,'3108008','Bom Sucesso','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2330,'3108107','Bonfim','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2331,'3108206','Bonfinopolis de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2332,'3108255','Bonito de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2333,'3108305','Borda da Mata','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2334,'3108404','Botelhos','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2335,'3108503','Botumirim','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2336,'3108552','Brasilândia de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2337,'3108602','Brasilia de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2338,'3108701','Bras Pires','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2339,'3108800','Braunas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2340,'3108909','Brazopolis','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2341,'3109006','Brumadinho','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2342,'3109105','Bueno Brandao','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2343,'3109204','Buenopolis','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2344,'3109253','Bugre','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2345,'3109303','Buritis','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2346,'3109402','Buritizeiro','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2347,'3109451','Cabeceira Grande','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2348,'3109501','Cabo Verde','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2349,'3109600','Cachoeira da Prata','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2350,'3109709','Cachoeira de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2351,'3109808','Cachoeira Dourada','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2352,'3109907','Caetanopolis','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2353,'3110004','Caete','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2354,'3110103','Caiana','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2355,'3110202','Cajuri','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2356,'3110301','Caldas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2357,'3110400','Camacho','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2358,'3110509','Camanducaia','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2359,'3110608','Cambui','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2360,'3110707','Cambuquira','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2361,'3110806','Campanario','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2362,'3110905','Campanha','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2363,'3111002','Campestre','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2364,'3111101','Campina Verde','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2365,'3111150','Campo Azul','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2366,'3111200','Campo Belo','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2367,'3111309','Campo do Meio','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2368,'3111408','Campo Florido','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2369,'3111507','Campos Altos','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2370,'3111606','Campos Gerais','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2371,'3111705','Canaa','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2372,'3111804','Canapolis','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2373,'3111903','Cana Verde','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2374,'3112000','Candeias','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2375,'3112059','Cantagalo','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2376,'3112109','Caparao','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2377,'3112208','Capela Nova','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2378,'3112307','Capelinha','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2379,'3112406','Capetinga','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2380,'3112505','Capim Branco','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2381,'3112604','Capinopolis','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2382,'3112653','Capitao Andrade','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2383,'3112703','Capitao Eneas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2384,'3112802','Capitolio','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2385,'3112901','Caputira','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2386,'3113008','Carai','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2387,'3113107','Caranaiba','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2388,'3113206','Carandai','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2389,'3113305','Carangola','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2390,'3113404','Caratinga','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2391,'3113503','Carbonita','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2392,'3113602','Careaçu','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2393,'3113701','Carlos Chagas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2394,'3113800','Carmesia','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2395,'3113909','Carmo da Cachoeira','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2396,'3114006','Carmo da Mata','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2397,'3114105','Carmo de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2398,'3114204','Carmo do Cajuru','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2399,'3114303','Carmo do Paranaiba','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2400,'3114402','Carmo do Rio Claro','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2401,'3114501','Carmopolis de Minas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2402,'3114550','Carneirinho','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2403,'3114600','Carrancas','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2404,'3114709','Carvalhopolis','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2405,'3114808','Carvalhos','MG','2022-10-27 17:14:56','2022-10-27 17:14:56'),(2406,'3114907','Casa Grande','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2407,'3115003','Cascalho Rico','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2408,'3115102','Cassia','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2409,'3115201','Conceiçao da Barra de Minas','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2410,'3115300','Cataguases','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2411,'3115359','Catas Altas','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2412,'3115409','Catas Altas da Noruega','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2413,'3115458','Catuji','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2414,'3115474','Catuti','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2415,'3115508','Caxambu','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2416,'3115607','Cedro do Abaete','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2417,'3115706','Central de Minas','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2418,'3115805','Centralina','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2419,'3115904','Chacara','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2420,'3116001','Chale','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2421,'3116100','Chapada do Norte','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2422,'3116159','Chapada Gaucha','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2423,'3116209','Chiador','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2424,'3116308','Cipotânea','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2425,'3116407','Claraval','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2426,'3116506','Claro dos Poçoes','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2427,'3116605','Claudio','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2428,'3116704','Coimbra','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2429,'3116803','Coluna','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2430,'3116902','Comendador Gomes','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2431,'3117009','Comercinho','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2432,'3117108','Conceiçao da Aparecida','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2433,'3117207','Conceiçao das Pedras','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2434,'3117306','Conceiçao das Alagoas','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2435,'3117405','Conceiçao de Ipanema','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2436,'3117504','Conceiçao do Mato Dentro','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2437,'3117603','Conceiçao do Para','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2438,'3117702','Conceiçao do Rio Verde','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2439,'3117801','Conceiçao dos Ouros','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2440,'3117836','Cônego Marinho','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2441,'3117876','Confins','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2442,'3117900','Congonhal','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2443,'3118007','Congonhas','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2444,'3118106','Congonhas do Norte','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2445,'3118205','Conquista','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2446,'3118304','Conselheiro Lafaiete','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2447,'3118403','Conselheiro Pena','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2448,'3118502','Consolaçao','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2449,'3118601','Contagem','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2450,'3118700','Coqueiral','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2451,'3118809','Coraçao de Jesus','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2452,'3118908','Cordisburgo','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2453,'3119005','Cordislândia','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2454,'3119104','Corinto','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2455,'3119203','Coroaci','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2456,'3119302','Coromandel','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2457,'3119401','Coronel Fabriciano','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2458,'3119500','Coronel Murta','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2459,'3119609','Coronel Pacheco','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2460,'3119708','Coronel Xavier Chaves','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2461,'3119807','Corrego Danta','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2462,'3119906','Corrego do Bom Jesus','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2463,'3119955','Corrego Fundo','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2464,'3120003','Corrego Novo','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2465,'3120102','Couto de Magalhaes de Minas','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2466,'3120151','Crisolita','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2467,'3120201','Cristais','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2468,'3120300','Cristalia','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2469,'3120409','Cristiano Otoni','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2470,'3120508','Cristina','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2471,'3120607','Crucilândia','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2472,'3120706','Cruzeiro da Fortaleza','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2473,'3120805','Cruzilia','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2474,'3120839','Cuparaque','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2475,'3120870','Curral de Dentro','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2476,'3120904','Curvelo','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2477,'3121001','Datas','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2478,'3121100','Delfim Moreira','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2479,'3121209','Delfinopolis','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2480,'3121258','Delta','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2481,'3121308','Descoberto','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2482,'3121407','Desterro de Entre Rios','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2483,'3121506','Desterro do Melo','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2484,'3121605','Diamantina','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2485,'3121704','Diogo de Vasconcelos','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2486,'3121803','Dionisio','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2487,'3121902','Divinesia','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2488,'3122009','Divino','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2489,'3122108','Divino das Laranjeiras','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2490,'3122207','Divinolândia de Minas','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2491,'3122306','Divinopolis','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2492,'3122355','Divisa Alegre','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2493,'3122405','Divisa Nova','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2494,'3122454','Divisopolis','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2495,'3122470','Dom Bosco','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2496,'3122504','Dom Cavati','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2497,'3122603','Dom Joaquim','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2498,'3122702','Dom Silverio','MG','2022-10-27 17:14:57','2022-10-27 17:14:57'),(2499,'3122801','Dom Viçoso','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2500,'3122900','Dona Eusebia','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2501,'3123007','Dores de Campos','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2502,'3123106','Dores de Guanhaes','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2503,'3123205','Dores do Indaia','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2504,'3123304','Dores do Turvo','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2505,'3123403','Doresopolis','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2506,'3123502','Douradoquara','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2507,'3123528','Durande','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2508,'3123601','Eloi Mendes','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2509,'3123700','Engenheiro Caldas','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2510,'3123809','Engenheiro Navarro','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2511,'3123858','Entre Folhas','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2512,'3123908','Entre Rios de Minas','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2513,'3124005','Ervalia','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2514,'3124104','Esmeraldas','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2515,'3124203','Espera Feliz','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2516,'3124302','Espinosa','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2517,'3124401','Espirito Santo do Dourado','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2518,'3124500','Estiva','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2519,'3124609','Estrela Dalva','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2520,'3124708','Estrela do Indaia','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2521,'3124807','Estrela do Sul','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2522,'3124906','Eugenopolis','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2523,'3125002','Ewbank da Câmara','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2524,'3125101','Extrema','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2525,'3125200','Fama','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2526,'3125309','Faria Lemos','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2527,'3125408','Felicio dos Santos','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2528,'3125507','Sao Gonçalo do Rio Preto','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2529,'3125606','Felisburgo','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2530,'3125705','Felixlândia','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2531,'3125804','Fernandes Tourinho','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2532,'3125903','Ferros','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2533,'3125952','Fervedouro','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2534,'3126000','Florestal','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2535,'3126109','Formiga','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2536,'3126208','Formoso','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2537,'3126307','Fortaleza de Minas','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2538,'3126406','Fortuna de Minas','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2539,'3126505','Francisco Badaro','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2540,'3126604','Francisco Dumont','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2541,'3126703','Francisco Sa','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2542,'3126752','Franciscopolis','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2543,'3126802','Frei Gaspar','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2544,'3126901','Frei Inocêncio','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2545,'3126950','Frei Lagonegro','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2546,'3127008','Fronteira','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2547,'3127057','Fronteira dos Vales','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2548,'3127073','Fruta de Leite','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2549,'3127107','Frutal','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2550,'3127206','Funilândia','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2551,'3127305','Galileia','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2552,'3127339','Gameleiras','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2553,'3127354','Glaucilândia','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2554,'3127370','Goiabeira','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2555,'3127388','Goiana','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2556,'3127404','Gonçalves','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2557,'3127503','Gonzaga','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2558,'3127602','Gouveia','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2559,'3127701','Governador Valadares','MG','2022-10-27 17:14:58','2022-10-27 17:14:58'),(2560,'3127800','Grao Mogol','MG','2022-10-27 17:14:59','2022-10-27 17:14:59'),(2561,'3127909','Grupiara','MG','2022-10-27 17:14:59','2022-10-27 17:14:59'),(2562,'3128006','Guanhaes','MG','2022-10-27 17:14:59','2022-10-27 17:14:59'),(2563,'3128105','Guape','MG','2022-10-27 17:14:59','2022-10-27 17:14:59'),(2564,'3128204','Guaraciaba','MG','2022-10-27 17:14:59','2022-10-27 17:14:59'),(2565,'3128253','Guaraciama','MG','2022-10-27 17:14:59','2022-10-27 17:14:59'),(2566,'3128303','Guaranesia','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2567,'3128402','Guarani','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2568,'3128501','Guarara','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2569,'3128600','Guarda-Mor','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2570,'3128709','Guaxupe','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2571,'3128808','Guidoval','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2572,'3128907','Guimarânia','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2573,'3129004','Guiricema','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2574,'3129103','Gurinhata','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2575,'3129202','Heliodora','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2576,'3129301','Iapu','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2577,'3129400','Ibertioga','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2578,'3129509','Ibia','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2579,'3129608','Ibiai','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2580,'3129657','Ibiracatu','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2581,'3129707','Ibiraci','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2582,'3129806','Ibirite','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2583,'3129905','Ibitiura de Minas','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2584,'3130002','Ibituruna','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2585,'3130051','Icarai de Minas','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2586,'3130101','Igarape','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2587,'3130200','Igaratinga','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2588,'3130309','Iguatama','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2589,'3130408','Ijaci','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2590,'3130507','Ilicinea','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2591,'3130556','Imbe de Minas','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2592,'3130606','Inconfidentes','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2593,'3130655','Indaiabira','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2594,'3130705','Indianopolis','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2595,'3130804','Ingai','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2596,'3130903','Inhapim','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2597,'3131000','Inhauma','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2598,'3131109','Inimutaba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2599,'3131158','Ipaba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2600,'3131208','Ipanema','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2601,'3131307','Ipatinga','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2602,'3131406','Ipiaçu','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2603,'3131505','Ipuiuna','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2604,'3131604','Irai de Minas','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2605,'3131703','Itabira','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2606,'3131802','Itabirinha','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2607,'3131901','Itabirito','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2608,'3132008','Itacambira','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2609,'3132107','Itacarambi','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2610,'3132206','Itaguara','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2611,'3132305','Itaipe','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2612,'3132404','Itajuba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2613,'3132503','Itamarandiba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2614,'3132602','Itamarati de Minas','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2615,'3132701','Itambacuri','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2616,'3132800','Itambe do Mato Dentro','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2617,'3132909','Itamogi','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2618,'3133006','Itamonte','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2619,'3133105','Itanhandu','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2620,'3133204','Itanhomi','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2621,'3133303','Itaobim','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2622,'3133402','Itapagipe','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2623,'3133501','Itapecerica','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2624,'3133600','Itapeva','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2625,'3133709','Itatiaiuçu','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2626,'3133758','Itau de Minas','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2627,'3133808','Itauna','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2628,'3133907','Itaverava','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2629,'3134004','Itinga','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2630,'3134103','Itueta','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2631,'3134202','Ituiutaba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2632,'3134301','Itumirim','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2633,'3134400','Iturama','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2634,'3134509','Itutinga','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2635,'3134608','Jaboticatubas','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2636,'3134707','Jacinto','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2637,'3134806','Jacui','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2638,'3134905','Jacutinga','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2639,'3135001','Jaguaraçu','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2640,'3135050','Jaiba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2641,'3135076','Jampruca','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2642,'3135100','Janauba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2643,'3135209','Januaria','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2644,'3135308','Japaraiba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2645,'3135357','Japonvar','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2646,'3135407','Jeceaba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2647,'3135456','Jenipapo de Minas','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2648,'3135506','Jequeri','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2649,'3135605','Jequitai','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2650,'3135704','Jequitiba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2651,'3135803','Jequitinhonha','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2652,'3135902','Jesuânia','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2653,'3136009','Joaima','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2654,'3136108','Joanesia','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2655,'3136207','Joao Monlevade','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2656,'3136306','Joao Pinheiro','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2657,'3136405','Joaquim Felicio','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2658,'3136504','Jordânia','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2659,'3136520','Jose Gonçalves de Minas','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2660,'3136553','Jose Raydan','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2661,'3136579','Josenopolis','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2662,'3136603','Nova Uniao','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2663,'3136652','Juatuba','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2664,'3136702','Juiz de Fora','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2665,'3136801','Juramento','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2666,'3136900','Juruaia','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2667,'3136959','Juvenilia','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2668,'3137007','Ladainha','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2669,'3137106','Lagamar','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2670,'3137205','Lagoa da Prata','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2671,'3137304','Lagoa dos Patos','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2672,'3137403','Lagoa Dourada','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2673,'3137502','Lagoa Formosa','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2674,'3137536','Lagoa Grande','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2675,'3137601','Lagoa Santa','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2676,'3137700','Lajinha','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2677,'3137809','Lambari','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2678,'3137908','Lamim','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2679,'3138005','Laranjal','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2680,'3138104','Lassance','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2681,'3138203','Lavras','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2682,'3138302','Leandro Ferreira','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2683,'3138351','Leme do Prado','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2684,'3138401','Leopoldina','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2685,'3138500','Liberdade','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2686,'3138609','Lima Duarte','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2687,'3138625','Limeira do Oeste','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2688,'3138658','Lontra','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2689,'3138674','Luisburgo','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2690,'3138682','Luislândia','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2691,'3138708','Luminarias','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2692,'3138807','Luz','MG','2022-10-27 17:15:00','2022-10-27 17:15:00'),(2693,'3138906','Machacalis','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2694,'3139003','Machado','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2695,'3139102','Madre de Deus de Minas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2696,'3139201','Malacacheta','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2697,'3139250','Mamonas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2698,'3139300','Manga','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2699,'3139409','Manhuaçu','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2700,'3139508','Manhumirim','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2701,'3139607','Mantena','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2702,'3139706','Maravilhas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2703,'3139805','Mar de Espanha','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2704,'3139904','Maria da Fe','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2705,'3140001','Mariana','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2706,'3140100','Marilac','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2707,'3140159','Mario Campos','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2708,'3140209','Maripa de Minas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2709,'3140308','Marlieria','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2710,'3140407','Marmelopolis','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2711,'3140506','Martinho Campos','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2712,'3140530','Martins Soares','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2713,'3140555','Mata Verde','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2714,'3140605','Materlândia','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2715,'3140704','Mateus Leme','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2716,'3140803','Matias Barbosa','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2717,'3140852','Matias Cardoso','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2718,'3140902','Matipo','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2719,'3141009','Mato Verde','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2720,'3141108','Matozinhos','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2721,'3141207','Matutina','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2722,'3141306','Medeiros','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2723,'3141405','Medina','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2724,'3141504','Mendes Pimentel','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2725,'3141603','Mercês','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2726,'3141702','Mesquita','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2727,'3141801','Minas Novas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2728,'3141900','Minduri','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2729,'3142007','Mirabela','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2730,'3142106','Miradouro','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2731,'3142205','Mirai','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2732,'3142254','Miravânia','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2733,'3142304','Moeda','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2734,'3142403','Moema','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2735,'3142502','Monjolos','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2736,'3142601','Monsenhor Paulo','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2737,'3142700','Montalvânia','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2738,'3142809','Monte Alegre de Minas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2739,'3142908','Monte Azul','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2740,'3143005','Monte Belo','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2741,'3143104','Monte Carmelo','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2742,'3143153','Monte Formoso','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2743,'3143203','Monte Santo de Minas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2744,'3143302','Montes Claros','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2745,'3143401','Monte Siao','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2746,'3143450','Montezuma','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2747,'3143500','Morada Nova de Minas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2748,'3143609','Morro da Garça','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2749,'3143708','Morro do Pilar','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2750,'3143807','Munhoz','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2751,'3143906','Muriae','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2752,'3144003','Mutum','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2753,'3144102','Muzambinho','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2754,'3144201','Nacip Raydan','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2755,'3144300','Nanuque','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2756,'3144359','Naque','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2757,'3144375','Natalândia','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2758,'3144409','Natercia','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2759,'3144508','Nazareno','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2760,'3144607','Nepomuceno','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2761,'3144656','Ninheira','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2762,'3144672','Nova Belem','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2763,'3144706','Nova Era','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2764,'3144805','Nova Lima','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2765,'3144904','Nova Modica','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2766,'3145000','Nova Ponte','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2767,'3145059','Nova Porteirinha','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2768,'3145109','Nova Resende','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2769,'3145208','Nova Serrana','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2770,'3145307','Novo Cruzeiro','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2771,'3145356','Novo Oriente de Minas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2772,'3145372','Novorizonte','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2773,'3145406','Olaria','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2774,'3145455','Olhos-D\'agua','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2775,'3145505','Olimpio Noronha','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2776,'3145604','Oliveira','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2777,'3145703','Oliveira Fortes','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2778,'3145802','Onça de Pitangui','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2779,'3145851','Oratorios','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2780,'3145877','Orizânia','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2781,'3145901','Ouro Branco','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2782,'3146008','Ouro Fino','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2783,'3146107','Ouro Preto','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2784,'3146206','Ouro Verde de Minas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2785,'3146255','Padre Carvalho','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2786,'3146305','Padre Paraiso','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2787,'3146404','Paineiras','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2788,'3146503','Pains','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2789,'3146552','Pai Pedro','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2790,'3146602','Paiva','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2791,'3146701','Palma','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2792,'3146750','Palmopolis','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2793,'3146909','Papagaios','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2794,'3147006','Paracatu','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2795,'3147105','Para de Minas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2796,'3147204','Paraguaçu','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2797,'3147303','Paraisopolis','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2798,'3147402','Paraopeba','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2799,'3147501','Passabem','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2800,'3147600','Passa Quatro','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2801,'3147709','Passa Tempo','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2802,'3147808','Passa-Vinte','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2803,'3147907','Passos','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2804,'3147956','Patis','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2805,'3148004','Patos de Minas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2806,'3148103','Patrocinio','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2807,'3148202','Patrocinio do Muriae','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2808,'3148301','Paula Cândido','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2809,'3148400','Paulistas','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2810,'3148509','Pavao','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2811,'3148608','Peçanha','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2812,'3148707','Pedra Azul','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2813,'3148756','Pedra Bonita','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2814,'3148806','Pedra do Anta','MG','2022-10-27 17:15:01','2022-10-27 17:15:01'),(2815,'3148905','Pedra do Indaia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2816,'3149002','Pedra Dourada','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2817,'3149101','Pedralva','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2818,'3149150','Pedras de Maria da Cruz','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2819,'3149200','Pedrinopolis','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2820,'3149309','Pedro Leopoldo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2821,'3149408','Pedro Teixeira','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2822,'3149507','Pequeri','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2823,'3149606','Pequi','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2824,'3149705','Perdigao','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2825,'3149804','Perdizes','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2826,'3149903','Perdoes','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2827,'3149952','Periquito','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2828,'3150000','Pescador','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2829,'3150109','Piau','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2830,'3150158','Piedade de Caratinga','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2831,'3150208','Piedade de Ponte Nova','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2832,'3150307','Piedade do Rio Grande','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2833,'3150406','Piedade dos Gerais','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2834,'3150505','Pimenta','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2835,'3150539','Pingo-D\'agua','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2836,'3150570','Pintopolis','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2837,'3150604','Piracema','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2838,'3150703','Pirajuba','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2839,'3150802','Piranga','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2840,'3150901','Piranguçu','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2841,'3151008','Piranguinho','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2842,'3151107','Pirapetinga','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2843,'3151206','Pirapora','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2844,'3151305','Pirauba','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2845,'3151404','Pitangui','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2846,'3151503','Piumhi','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2847,'3151602','Planura','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2848,'3151701','Poço Fundo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2849,'3151800','Poços de Caldas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2850,'3151909','Pocrane','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2851,'3152006','Pompeu','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2852,'3152105','Ponte Nova','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2853,'3152131','Ponto Chique','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2854,'3152170','Ponto dos Volantes','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2855,'3152204','Porteirinha','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2856,'3152303','Porto Firme','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2857,'3152402','Pote','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2858,'3152501','Pouso Alegre','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2859,'3152600','Pouso Alto','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2860,'3152709','Prados','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2861,'3152808','Prata','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2862,'3152907','Pratapolis','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2863,'3153004','Pratinha','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2864,'3153103','Presidente Bernardes','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2865,'3153202','Presidente Juscelino','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2866,'3153301','Presidente Kubitschek','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2867,'3153400','Presidente Olegario','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2868,'3153509','Alto Jequitiba','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2869,'3153608','Prudente de Morais','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2870,'3153707','Quartel Geral','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2871,'3153806','Queluzito','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2872,'3153905','Raposos','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2873,'3154002','Raul Soares','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2874,'3154101','Recreio','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2875,'3154150','Reduto','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2876,'3154200','Resende Costa','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2877,'3154309','Resplendor','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2878,'3154408','Ressaquinha','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2879,'3154457','Riachinho','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2880,'3154507','Riacho dos Machados','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2881,'3154606','Ribeirao das Neves','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2882,'3154705','Ribeirao Vermelho','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2883,'3154804','Rio Acima','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2884,'3154903','Rio Casca','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2885,'3155009','Rio Doce','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2886,'3155108','Rio do Prado','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2887,'3155207','Rio Espera','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2888,'3155306','Rio Manso','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2889,'3155405','Rio Novo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2890,'3155504','Rio Paranaiba','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2891,'3155603','Rio Pardo de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2892,'3155702','Rio Piracicaba','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2893,'3155801','Rio Pomba','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2894,'3155900','Rio Preto','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2895,'3156007','Rio Vermelho','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2896,'3156106','Ritapolis','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2897,'3156205','Rochedo de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2898,'3156304','Rodeiro','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2899,'3156403','Romaria','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2900,'3156452','Rosario da Limeira','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2901,'3156502','Rubelita','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2902,'3156601','Rubim','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2903,'3156700','Sabara','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2904,'3156809','Sabinopolis','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2905,'3156908','Sacramento','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2906,'3157005','Salinas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2907,'3157104','Salto da Divisa','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2908,'3157203','Santa Barbara','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2909,'3157252','Santa Barbara do Leste','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2910,'3157278','Santa Barbara do Monte Verde','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2911,'3157302','Santa Barbara do Tugurio','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2912,'3157336','Santa Cruz de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2913,'3157377','Santa Cruz de Salinas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2914,'3157401','Santa Cruz do Escalvado','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2915,'3157500','Santa Efigênia de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2916,'3157609','Santa Fe de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2917,'3157658','Santa Helena de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2918,'3157708','Santa Juliana','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2919,'3157807','Santa Luzia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2920,'3157906','Santa Margarida','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2921,'3158003','Santa Maria de Itabira','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2922,'3158102','Santa Maria do Salto','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2923,'3158201','Santa Maria do Suaçui','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2924,'3158300','Santana da Vargem','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2925,'3158409','Santana de Cataguases','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2926,'3158508','Santana de Pirapama','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2927,'3158607','Santana do Deserto','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2928,'3158706','Santana do Garambeu','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2929,'3158805','Santana do Jacare','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2930,'3158904','Santana do Manhuaçu','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2931,'3158953','Santana do Paraiso','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2932,'3159001','Santana do Riacho','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2933,'3159100','Santana dos Montes','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2934,'3159209','Santa Rita de Caldas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2935,'3159308','Santa Rita de Jacutinga','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2936,'3159357','Santa Rita de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2937,'3159407','Santa Rita de Ibitipoca','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2938,'3159506','Santa Rita do Itueto','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2939,'3159605','Santa Rita do Sapucai','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2940,'3159704','Santa Rosa da Serra','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2941,'3159803','Santa Vitoria','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2942,'3159902','Santo Antônio do Amparo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2943,'3160009','Santo Antônio do Aventureiro','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2944,'3160108','Santo Antônio do Grama','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2945,'3160207','Santo Antônio do Itambe','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2946,'3160306','Santo Antônio do Jacinto','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2947,'3160405','Santo Antônio do Monte','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2948,'3160454','Santo Antônio do Retiro','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2949,'3160504','Santo Antônio do Rio Abaixo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2950,'3160603','Santo Hipolito','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2951,'3160702','Santos Dumont','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2952,'3160801','Sao Bento Abade','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2953,'3160900','Sao Bras do Suaçui','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2954,'3160959','Sao Domingos das Dores','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2955,'3161007','Sao Domingos do Prata','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2956,'3161056','Sao Felix de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2957,'3161106','Sao Francisco','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2958,'3161205','Sao Francisco de Paula','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2959,'3161304','Sao Francisco de Sales','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2960,'3161403','Sao Francisco do Gloria','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2961,'3161502','Sao Geraldo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2962,'3161601','Sao Geraldo da Piedade','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2963,'3161650','Sao Geraldo do Baixio','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2964,'3161700','Sao Gonçalo do Abaete','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2965,'3161809','Sao Gonçalo do Para','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2966,'3161908','Sao Gonçalo do Rio Abaixo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2967,'3162005','Sao Gonçalo do Sapucai','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2968,'3162104','Sao Gotardo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2969,'3162203','Sao Joao Batista do Gloria','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2970,'3162252','Sao Joao da Lagoa','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2971,'3162302','Sao Joao da Mata','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2972,'3162401','Sao Joao da Ponte','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2973,'3162450','Sao Joao das Missoes','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2974,'3162500','Sao Joao del Rei','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2975,'3162559','Sao Joao do Manhuaçu','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2976,'3162575','Sao Joao do Manteninha','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2977,'3162609','Sao Joao do Oriente','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2978,'3162658','Sao Joao do Pacui','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2979,'3162708','Sao Joao do Paraiso','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2980,'3162807','Sao Joao Evangelista','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2981,'3162906','Sao Joao Nepomuceno','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2982,'3162922','Sao Joaquim de Bicas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2983,'3162948','Sao Jose da Barra','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2984,'3162955','Sao Jose da Lapa','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2985,'3163003','Sao Jose da Safira','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2986,'3163102','Sao Jose da Varginha','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2987,'3163201','Sao Jose do Alegre','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2988,'3163300','Sao Jose do Divino','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2989,'3163409','Sao Jose do Goiabal','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2990,'3163508','Sao Jose do Jacuri','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2991,'3163607','Sao Jose do Mantimento','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2992,'3163706','Sao Lourenço','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2993,'3163805','Sao Miguel do Anta','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2994,'3163904','Sao Pedro da Uniao','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2995,'3164001','Sao Pedro dos Ferros','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2996,'3164100','Sao Pedro do Suaçui','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2997,'3164209','Sao Romao','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2998,'3164308','Sao Roque de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(2999,'3164407','Sao Sebastiao da Bela Vista','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3000,'3164431','Sao Sebastiao da Vargem Alegre','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3001,'3164472','Sao Sebastiao do Anta','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3002,'3164506','Sao Sebastiao do Maranhao','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3003,'3164605','Sao Sebastiao do Oeste','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3004,'3164704','Sao Sebastiao do Paraiso','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3005,'3164803','Sao Sebastiao do Rio Preto','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3006,'3164902','Sao Sebastiao do Rio Verde','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3007,'3165008','Sao Tiago','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3008,'3165107','Sao Tomas de Aquino','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3009,'3165206','Sao Thome das Letras','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3010,'3165305','Sao Vicente de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3011,'3165404','Sapucai-Mirim','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3012,'3165503','Sardoa','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3013,'3165537','Sarzedo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3014,'3165552','Setubinha','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3015,'3165560','Sem-Peixe','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3016,'3165578','Senador Amaral','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3017,'3165602','Senador Cortes','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3018,'3165701','Senador Firmino','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3019,'3165800','Senador Jose Bento','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3020,'3165909','Senador Modestino Gonçalves','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3021,'3166006','Senhora de Oliveira','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3022,'3166105','Senhora do Porto','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3023,'3166204','Senhora dos Remedios','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3024,'3166303','Sericita','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3025,'3166402','Seritinga','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3026,'3166501','Serra Azul de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3027,'3166600','Serra da Saudade','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3028,'3166709','Serra dos Aimores','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3029,'3166808','Serra do Salitre','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3030,'3166907','Serrania','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3031,'3166956','Serranopolis de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3032,'3167004','Serranos','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3033,'3167103','Serro','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3034,'3167202','Sete Lagoas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3035,'3167301','Silveirânia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3036,'3167400','Silvianopolis','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3037,'3167509','Simao Pereira','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3038,'3167608','Simonesia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3039,'3167707','Sobralia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3040,'3167806','Soledade de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3041,'3167905','Tabuleiro','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3042,'3168002','Taiobeiras','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3043,'3168051','Taparuba','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3044,'3168101','Tapira','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3045,'3168200','Tapirai','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3046,'3168309','Taquaraçu de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3047,'3168408','Tarumirim','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3048,'3168507','Teixeiras','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3049,'3168606','Teofilo Otoni','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3050,'3168705','Timoteo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3051,'3168804','Tiradentes','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3052,'3168903','Tiros','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3053,'3169000','Tocantins','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3054,'3169059','Tocos do Moji','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3055,'3169109','Toledo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3056,'3169208','Tombos','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3057,'3169307','Três Coraçoes','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3058,'3169356','Três Marias','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3059,'3169406','Três Pontas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3060,'3169505','Tumiritinga','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3061,'3169604','Tupaciguara','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3062,'3169703','Turmalina','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3063,'3169802','Turvolândia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3064,'3169901','Uba','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3065,'3170008','Ubai','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3066,'3170057','Ubaporanga','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3067,'3170107','Uberaba','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3068,'3170206','Uberlândia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3069,'3170305','Umburatiba','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3070,'3170404','Unai','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3071,'3170438','Uniao de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3072,'3170479','Uruana de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3073,'3170503','Urucânia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3074,'3170529','Urucuia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3075,'3170578','Vargem Alegre','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3076,'3170602','Vargem Bonita','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3077,'3170651','Vargem Grande do Rio Pardo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3078,'3170701','Varginha','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3079,'3170750','Varjao de Minas','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3080,'3170800','Varzea da Palma','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3081,'3170909','Varzelândia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3082,'3171006','Vazante','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3083,'3171030','Verdelândia','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3084,'3171071','Veredinha','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3085,'3171105','Verissimo','MG','2022-10-27 17:15:02','2022-10-27 17:15:02'),(3086,'3171154','Vermelho Novo','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3087,'3171204','Vespasiano','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3088,'3171303','Viçosa','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3089,'3171402','Vieiras','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3090,'3171501','Mathias Lobato','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3091,'3171600','Virgem da Lapa','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3092,'3171709','Virginia','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3093,'3171808','Virginopolis','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3094,'3171907','Virgolândia','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3095,'3172004','Visconde do Rio Branco','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3096,'3172103','Volta Grande','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3097,'3172202','Wenceslau Braz','MG','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3098,'3200102','Afonso Claudio','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3099,'3200136','aguia Branca','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3100,'3200169','agua Doce do Norte','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3101,'3200201','Alegre','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3102,'3200300','Alfredo Chaves','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3103,'3200359','Alto Rio Novo','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3104,'3200409','Anchieta','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3105,'3200508','Apiaca','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3106,'3200607','Aracruz','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3107,'3200706','Atilio Vivacqua','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3108,'3200805','Baixo Guandu','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3109,'3200904','Barra de Sao Francisco','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3110,'3201001','Boa Esperança','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3111,'3201100','Bom Jesus do Norte','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3112,'3201159','Brejetuba','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3113,'3201209','Cachoeiro de Itapemirim','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3114,'3201308','Cariacica','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3115,'3201407','Castelo','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3116,'3201506','Colatina','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3117,'3201605','Conceiçao da Barra','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3118,'3201704','Conceiçao do Castelo','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3119,'3201803','Divino de Sao Lourenço','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3120,'3201902','Domingos Martins','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3121,'3202009','Dores do Rio Preto','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3122,'3202108','Ecoporanga','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3123,'3202207','Fundao','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3124,'3202256','Governador Lindenberg','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3125,'3202306','Guaçui','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3126,'3202405','Guarapari','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3127,'3202454','Ibatiba','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3128,'3202504','Ibiraçu','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3129,'3202553','Ibitirama','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3130,'3202603','Iconha','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3131,'3202652','Irupi','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3132,'3202702','Itaguaçu','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3133,'3202801','Itapemirim','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3134,'3202900','Itarana','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3135,'3203007','Iuna','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3136,'3203056','Jaguare','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3137,'3203106','Jerônimo Monteiro','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3138,'3203130','Joao Neiva','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3139,'3203163','Laranja da Terra','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3140,'3203205','Linhares','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3141,'3203304','Mantenopolis','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3142,'3203320','Marataizes','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3143,'3203346','Marechal Floriano','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3144,'3203353','Marilândia','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3145,'3203403','Mimoso do Sul','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3146,'3203502','Montanha','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3147,'3203601','Mucurici','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3148,'3203700','Muniz Freire','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3149,'3203809','Muqui','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3150,'3203908','Nova Venecia','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3151,'3204005','Pancas','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3152,'3204054','Pedro Canario','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3153,'3204104','Pinheiros','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3154,'3204203','Piuma','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3155,'3204252','Ponto Belo','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3156,'3204302','Presidente Kennedy','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3157,'3204351','Rio Bananal','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3158,'3204401','Rio Novo do Sul','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3159,'3204500','Santa Leopoldina','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3160,'3204559','Santa Maria de Jetiba','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3161,'3204609','Santa Teresa','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3162,'3204658','Sao Domingos do Norte','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3163,'3204708','Sao Gabriel da Palha','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3164,'3204807','Sao Jose do Calçado','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3165,'3204906','Sao Mateus','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3166,'3204955','Sao Roque do Canaa','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3167,'3205002','Serra','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3168,'3205010','Sooretama','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3169,'3205036','Vargem Alta','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3170,'3205069','Venda Nova do Imigrante','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3171,'3205101','Viana','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3172,'3205150','Vila Pavao','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3173,'3205176','Vila Valerio','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3174,'3205200','Vila Velha','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3175,'3205309','Vitoria','ES','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3176,'3300100','Angra dos Reis','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3177,'3300159','Aperibe','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3178,'3300209','Araruama','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3179,'3300225','Areal','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3180,'3300233','Armaçao dos Buzios','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3181,'3300258','Arraial do Cabo','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3182,'3300308','Barra do Pirai','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3183,'3300407','Barra Mansa','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3184,'3300456','Belford Roxo','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3185,'3300506','Bom Jardim','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3186,'3300605','Bom Jesus do Itabapoana','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3187,'3300704','Cabo Frio','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3188,'3300803','Cachoeiras de Macacu','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3189,'3300902','Cambuci','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3190,'3300936','Carapebus','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3191,'3300951','Comendador Levy Gasparian','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3192,'3301009','Campos dos Goytacazes','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3193,'3301108','Cantagalo','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3194,'3301157','Cardoso Moreira','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3195,'3301207','Carmo','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3196,'3301306','Casimiro de Abreu','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3197,'3301405','Conceiçao de Macabu','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3198,'3301504','Cordeiro','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3199,'3301603','Duas Barras','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3200,'3301702','Duque de Caxias','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3201,'3301801','Engenheiro Paulo de Frontin','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3202,'3301850','Guapimirim','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3203,'3301876','Iguaba Grande','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3204,'3301900','Itaborai','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3205,'3302007','Itaguai','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3206,'3302056','Italva','RJ','2022-10-27 17:15:03','2022-10-27 17:15:03'),(3207,'3302106','Itaocara','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3208,'3302205','Itaperuna','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3209,'3302254','Itatiaia','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3210,'3302270','Japeri','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3211,'3302304','Laje do Muriae','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3212,'3302403','Macae','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3213,'3302452','Macuco','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3214,'3302502','Mage','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3215,'3302601','Mangaratiba','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3216,'3302700','Marica','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3217,'3302809','Mendes','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3218,'3302858','Mesquita','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3219,'3302908','Miguel Pereira','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3220,'3303005','Miracema','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3221,'3303104','Natividade','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3222,'3303203','Nilopolis','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3223,'3303302','Niteroi','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3224,'3303401','Nova Friburgo','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3225,'3303500','Nova Iguaçu','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3226,'3303609','Paracambi','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3227,'3303708','Paraiba do Sul','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3228,'3303807','Paraty','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3229,'3303856','Paty do Alferes','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3230,'3303906','Petropolis','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3231,'3303955','Pinheiral','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3232,'3304003','Pirai','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3233,'3304102','Porciuncula','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3234,'3304110','Porto Real','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3235,'3304128','Quatis','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3236,'3304144','Queimados','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3237,'3304151','Quissama','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3238,'3304201','Resende','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3239,'3304300','Rio Bonito','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3240,'3304409','Rio Claro','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3241,'3304508','Rio das Flores','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3242,'3304524','Rio das Ostras','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3243,'3304557','Rio de Janeiro','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3244,'3304607','Santa Maria Madalena','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3245,'3304706','Santo Antônio de Padua','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3246,'3304755','Sao Francisco de Itabapoana','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3247,'3304805','Sao Fidelis','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3248,'3304904','Sao Gonçalo','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3249,'3305000','Sao Joao da Barra','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3250,'3305109','Sao Joao de Meriti','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3251,'3305133','Sao Jose de Uba','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3252,'3305158','Sao Jose do Vale do Rio Preto','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3253,'3305208','Sao Pedro da Aldeia','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3254,'3305307','Sao Sebastiao do Alto','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3255,'3305406','Sapucaia','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3256,'3305505','Saquarema','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3257,'3305554','Seropedica','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3258,'3305604','Silva Jardim','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3259,'3305703','Sumidouro','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3260,'3305752','Tangua','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3261,'3305802','Teresopolis','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3262,'3305901','Trajano de Moraes','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3263,'3306008','Três Rios','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3264,'3306107','Valença','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3265,'3306156','Varre-Sai','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3266,'3306206','Vassouras','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3267,'3306305','Volta Redonda','RJ','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3268,'3500105','Adamantina','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3269,'3500204','Adolfo','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3270,'3500303','Aguai','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3271,'3500402','aguas da Prata','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3272,'3500501','aguas de Lindoia','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3273,'3500550','aguas de Santa Barbara','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3274,'3500600','aguas de Sao Pedro','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3275,'3500709','Agudos','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3276,'3500758','Alambari','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3277,'3500808','Alfredo Marcondes','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3278,'3500907','Altair','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3279,'3501004','Altinopolis','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3280,'3501103','Alto Alegre','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3281,'3501152','Aluminio','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3282,'3501202','alvares Florence','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3283,'3501301','alvares Machado','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3284,'3501400','alvaro de Carvalho','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3285,'3501509','Alvinlândia','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3286,'3501608','Americana','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3287,'3501707','Americo Brasiliense','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3288,'3501806','Americo de Campos','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3289,'3501905','Amparo','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3290,'3502002','Analândia','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3291,'3502101','Andradina','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3292,'3502200','Angatuba','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3293,'3502309','Anhembi','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3294,'3502408','Anhumas','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3295,'3502507','Aparecida','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3296,'3502606','Aparecida D\'Oeste','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3297,'3502705','Apiai','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3298,'3502754','Araçariguama','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3299,'3502804','Araçatuba','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3300,'3502903','Araçoiaba da Serra','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3301,'3503000','Aramina','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3302,'3503109','Arandu','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3303,'3503158','Arapei','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3304,'3503208','Araraquara','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3305,'3503307','Araras','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3306,'3503356','Arco-iris','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3307,'3503406','Arealva','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3308,'3503505','Areias','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3309,'3503604','Areiopolis','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3310,'3503703','Ariranha','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3311,'3503802','Artur Nogueira','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3312,'3503901','Aruja','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3313,'3503950','Aspasia','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3314,'3504008','Assis','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3315,'3504107','Atibaia','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3316,'3504206','Auriflama','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3317,'3504305','Avai','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3318,'3504404','Avanhandava','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3319,'3504503','Avare','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3320,'3504602','Bady Bassitt','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3321,'3504701','Balbinos','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3322,'3504800','Balsamo','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3323,'3504909','Bananal','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3324,'3505005','Barao de Antonina','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3325,'3505104','Barbosa','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3326,'3505203','Bariri','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3327,'3505302','Barra Bonita','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3328,'3505351','Barra do Chapeu','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3329,'3505401','Barra do Turvo','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3330,'3505500','Barretos','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3331,'3505609','Barrinha','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3332,'3505708','Barueri','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3333,'3505807','Bastos','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3334,'3505906','Batatais','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3335,'3506003','Bauru','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3336,'3506102','Bebedouro','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3337,'3506201','Bento de Abreu','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3338,'3506300','Bernardino de Campos','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3339,'3506359','Bertioga','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3340,'3506409','Bilac','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3341,'3506508','Birigui','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3342,'3506607','Biritiba-Mirim','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3343,'3506706','Boa Esperança do Sul','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3344,'3506805','Bocaina','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3345,'3506904','Bofete','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3346,'3507001','Boituva','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3347,'3507100','Bom Jesus dos Perdoes','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3348,'3507159','Bom Sucesso de Itarare','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3349,'3507209','Bora','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3350,'3507308','Boraceia','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3351,'3507407','Borborema','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3352,'3507456','Borebi','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3353,'3507506','Botucatu','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3354,'3507605','Bragança Paulista','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3355,'3507704','Brauna','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3356,'3507753','Brejo Alegre','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3357,'3507803','Brodowski','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3358,'3507902','Brotas','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3359,'3508009','Buri','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3360,'3508108','Buritama','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3361,'3508207','Buritizal','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3362,'3508306','Cabralia Paulista','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3363,'3508405','Cabreuva','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3364,'3508504','Caçapava','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3365,'3508603','Cachoeira Paulista','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3366,'3508702','Caconde','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3367,'3508801','Cafelândia','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3368,'3508900','Caiabu','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3369,'3509007','Caieiras','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3370,'3509106','Caiua','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3371,'3509205','Cajamar','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3372,'3509254','Cajati','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3373,'3509304','Cajobi','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3374,'3509403','Cajuru','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3375,'3509452','Campina do Monte Alegre','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3376,'3509502','Campinas','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3377,'3509601','Campo Limpo Paulista','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3378,'3509700','Campos do Jordao','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3379,'3509809','Campos Novos Paulista','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3380,'3509908','Cananeia','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3381,'3509957','Canas','SP','2022-10-27 17:15:04','2022-10-27 17:15:04'),(3382,'3510005','Cândido Mota','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3383,'3510104','Cândido Rodrigues','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3384,'3510153','Canitar','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3385,'3510203','Capao Bonito','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3386,'3510302','Capela do Alto','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3387,'3510401','Capivari','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3388,'3510500','Caraguatatuba','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3389,'3510609','Carapicuiba','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3390,'3510708','Cardoso','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3391,'3510807','Casa Branca','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3392,'3510906','Cassia dos Coqueiros','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3393,'3511003','Castilho','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3394,'3511102','Catanduva','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3395,'3511201','Catigua','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3396,'3511300','Cedral','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3397,'3511409','Cerqueira Cesar','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3398,'3511508','Cerquilho','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3399,'3511607','Cesario Lange','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3400,'3511706','Charqueada','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3401,'3511904','Clementina','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3402,'3512001','Colina','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3403,'3512100','Colômbia','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3404,'3512209','Conchal','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3405,'3512308','Conchas','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3406,'3512407','Cordeiropolis','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3407,'3512506','Coroados','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3408,'3512605','Coronel Macedo','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3409,'3512704','Corumbatai','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3410,'3512803','Cosmopolis','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3411,'3512902','Cosmorama','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3412,'3513009','Cotia','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3413,'3513108','Cravinhos','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3414,'3513207','Cristais Paulista','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3415,'3513306','Cruzalia','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3416,'3513405','Cruzeiro','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3417,'3513504','Cubatao','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3418,'3513603','Cunha','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3419,'3513702','Descalvado','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3420,'3513801','Diadema','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3421,'3513850','Dirce Reis','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3422,'3513900','Divinolândia','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3423,'3514007','Dobrada','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3424,'3514106','Dois Corregos','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3425,'3514205','Dolcinopolis','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3426,'3514304','Dourado','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3427,'3514403','Dracena','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3428,'3514502','Duartina','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3429,'3514601','Dumont','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3430,'3514700','Echapora','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3431,'3514809','Eldorado','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3432,'3514908','Elias Fausto','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3433,'3514924','Elisiario','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3434,'3514957','Embauba','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3435,'3515004','Embu das Artes','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3436,'3515103','Embu-Guaçu','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3437,'3515129','Emilianopolis','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3438,'3515152','Engenheiro Coelho','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3439,'3515186','Espirito Santo do Pinhal','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3440,'3515194','Espirito Santo do Turvo','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3441,'3515202','Estrela D\'Oeste','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3442,'3515301','Estrela do Norte','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3443,'3515350','Euclides da Cunha Paulista','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3444,'3515400','Fartura','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3445,'3515509','Fernandopolis','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3446,'3515608','Fernando Prestes','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3447,'3515657','Fernao','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3448,'3515707','Ferraz de Vasconcelos','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3449,'3515806','Flora Rica','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3450,'3515905','Floreal','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3451,'3516002','Florida Paulista','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3452,'3516101','Florinia','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3453,'3516200','Franca','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3454,'3516309','Francisco Morato','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3455,'3516408','Franco da Rocha','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3456,'3516507','Gabriel Monteiro','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3457,'3516606','Galia','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3458,'3516705','Garça','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3459,'3516804','Gastao Vidigal','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3460,'3516853','Gaviao Peixoto','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3461,'3516903','General Salgado','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3462,'3517000','Getulina','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3463,'3517109','Glicerio','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3464,'3517208','Guaiçara','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3465,'3517307','Guaimbê','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3466,'3517406','Guaira','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3467,'3517505','Guapiaçu','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3468,'3517604','Guapiara','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3469,'3517703','Guara','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3470,'3517802','Guaraçai','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3471,'3517901','Guaraci','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3472,'3518008','Guarani D\'Oeste','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3473,'3518107','Guaranta','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3474,'3518206','Guararapes','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3475,'3518305','Guararema','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3476,'3518404','Guaratingueta','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3477,'3518503','Guarei','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3478,'3518602','Guariba','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3479,'3518701','Guaruja','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3480,'3518800','Guarulhos','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3481,'3518859','Guatapara','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3482,'3518909','Guzolândia','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3483,'3519006','Herculândia','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3484,'3519055','Holambra','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3485,'3519071','Hortolândia','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3486,'3519105','Iacanga','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3487,'3519204','Iacri','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3488,'3519253','Iaras','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3489,'3519303','Ibate','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3490,'3519402','Ibira','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3491,'3519501','Ibirarema','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3492,'3519600','Ibitinga','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3493,'3519709','Ibiuna','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3494,'3519808','Icem','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3495,'3519907','Iepê','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3496,'3520004','Igaraçu do Tietê','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3497,'3520103','Igarapava','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3498,'3520202','Igarata','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3499,'3520301','Iguape','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3500,'3520400','Ilhabela','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3501,'3520426','Ilha Comprida','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3502,'3520442','Ilha Solteira','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3503,'3520509','Indaiatuba','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3504,'3520608','Indiana','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3505,'3520707','Indiapora','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3506,'3520806','Inubia Paulista','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3507,'3520905','Ipaussu','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3508,'3521002','Ipero','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3509,'3521101','Ipeuna','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3510,'3521150','Ipigua','SP','2022-10-27 17:15:05','2022-10-27 17:15:05'),(3511,'3521200','Iporanga','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3512,'3521309','Ipua','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3513,'3521408','Iracemapolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3514,'3521507','Irapua','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3515,'3521606','Irapuru','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3516,'3521705','Itabera','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3517,'3521804','Itai','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3518,'3521903','Itajobi','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3519,'3522000','Itaju','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3520,'3522109','Itanhaem','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3521,'3522158','Itaoca','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3522,'3522208','Itapecerica da Serra','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3523,'3522307','Itapetininga','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3524,'3522406','Itapeva','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3525,'3522505','Itapevi','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3526,'3522604','Itapira','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3527,'3522653','Itapirapua Paulista','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3528,'3522703','Itapolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3529,'3522802','Itaporanga','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3530,'3522901','Itapui','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3531,'3523008','Itapura','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3532,'3523107','Itaquaquecetuba','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3533,'3523206','Itarare','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3534,'3523305','Itariri','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3535,'3523404','Itatiba','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3536,'3523503','Itatinga','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3537,'3523602','Itirapina','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3538,'3523701','Itirapua','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3539,'3523800','Itobi','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3540,'3523909','Itu','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3541,'3524006','Itupeva','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3542,'3524105','Ituverava','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3543,'3524204','Jaborandi','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3544,'3524303','Jaboticabal','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3545,'3524402','Jacarei','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3546,'3524501','Jaci','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3547,'3524600','Jacupiranga','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3548,'3524709','Jaguariuna','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3549,'3524808','Jales','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3550,'3524907','Jambeiro','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3551,'3525003','Jandira','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3552,'3525102','Jardinopolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3553,'3525201','Jarinu','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3554,'3525300','Jau','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3555,'3525409','Jeriquara','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3556,'3525508','Joanopolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3557,'3525607','Joao Ramalho','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3558,'3525706','Jose Bonifacio','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3559,'3525805','Julio Mesquita','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3560,'3525854','Jumirim','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3561,'3525904','Jundiai','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3562,'3526001','Junqueiropolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3563,'3526100','Juquia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3564,'3526209','Juquitiba','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3565,'3526308','Lagoinha','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3566,'3526407','Laranjal Paulista','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3567,'3526506','Lavinia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3568,'3526605','Lavrinhas','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3569,'3526704','Leme','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3570,'3526803','Lençois Paulista','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3571,'3526902','Limeira','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3572,'3527009','Lindoia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3573,'3527108','Lins','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3574,'3527207','Lorena','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3575,'3527256','Lourdes','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3576,'3527306','Louveira','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3577,'3527405','Lucelia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3578,'3527504','Lucianopolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3579,'3527603','Luis Antônio','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3580,'3527702','Luiziânia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3581,'3527801','Lupercio','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3582,'3527900','Lutecia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3583,'3528007','Macatuba','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3584,'3528106','Macaubal','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3585,'3528205','Macedônia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3586,'3528304','Magda','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3587,'3528403','Mairinque','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3588,'3528502','Mairipora','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3589,'3528601','Manduri','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3590,'3528700','Maraba Paulista','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3591,'3528809','Maracai','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3592,'3528858','Marapoama','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3593,'3528908','Mariapolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3594,'3529005','Marilia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3595,'3529104','Marinopolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3596,'3529203','Martinopolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3597,'3529302','Matao','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3598,'3529401','Maua','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3599,'3529500','Mendonça','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3600,'3529609','Meridiano','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3601,'3529658','Mesopolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3602,'3529708','Miguelopolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3603,'3529807','Mineiros do Tietê','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3604,'3529906','Miracatu','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3605,'3530003','Mira Estrela','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3606,'3530102','Mirandopolis','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3607,'3530201','Mirante do Paranapanema','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3608,'3530300','Mirassol','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3609,'3530409','Mirassolândia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3610,'3530508','Mococa','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3611,'3530607','Mogi das Cruzes','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3612,'3530706','Mogi Guaçu','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3613,'3530805','Moji Mirim','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3614,'3530904','Mombuca','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3615,'3531001','Monçoes','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3616,'3531100','Mongagua','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3617,'3531209','Monte Alegre do Sul','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3618,'3531308','Monte Alto','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3619,'3531407','Monte Aprazivel','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3620,'3531506','Monte Azul Paulista','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3621,'3531605','Monte Castelo','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3622,'3531704','Monteiro Lobato','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3623,'3531803','Monte Mor','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3624,'3531902','Morro Agudo','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3625,'3532009','Morungaba','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3626,'3532058','Motuca','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3627,'3532108','Murutinga do Sul','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3628,'3532157','Nantes','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3629,'3532207','Narandiba','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3630,'3532306','Natividade da Serra','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3631,'3532405','Nazare Paulista','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3632,'3532504','Neves Paulista','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3633,'3532603','Nhandeara','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3634,'3532702','Nipoa','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3635,'3532801','Nova Aliança','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3636,'3532827','Nova Campina','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3637,'3532843','Nova Canaa Paulista','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3638,'3532868','Nova Castilho','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3639,'3532900','Nova Europa','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3640,'3533007','Nova Granada','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3641,'3533106','Nova Guataporanga','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3642,'3533205','Nova Independência','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3643,'3533254','Novais','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3644,'3533304','Nova Luzitânia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3645,'3533403','Nova Odessa','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3646,'3533502','Novo Horizonte','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3647,'3533601','Nuporanga','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3648,'3533700','Ocauçu','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3649,'3533809','oleo','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3650,'3533908','Olimpia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3651,'3534005','Onda Verde','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3652,'3534104','Oriente','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3653,'3534203','Orindiuva','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3654,'3534302','Orlândia','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3655,'3534401','Osasco','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3656,'3534500','Oscar Bressane','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3657,'3534609','Osvaldo Cruz','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3658,'3534708','Ourinhos','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3659,'3534757','Ouroeste','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3660,'3534807','Ouro Verde','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3661,'3534906','Pacaembu','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3662,'3535002','Palestina','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3663,'3535101','Palmares Paulista','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3664,'3535200','Palmeira D\'Oeste','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3665,'3535309','Palmital','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3666,'3535408','Panorama','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3667,'3535507','Paraguaçu Paulista','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3668,'3535606','Paraibuna','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3669,'3535705','Paraiso','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3670,'3535804','Paranapanema','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3671,'3535903','Paranapua','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3672,'3536000','Parapua','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3673,'3536109','Pardinho','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3674,'3536208','Pariquera-Açu','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3675,'3536257','Parisi','SP','2022-10-27 17:15:06','2022-10-27 17:15:06'),(3676,'3536307','Patrocinio Paulista','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3677,'3536406','Pauliceia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3678,'3536505','Paulinia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3679,'3536570','Paulistânia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3680,'3536604','Paulo de Faria','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3681,'3536703','Pederneiras','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3682,'3536802','Pedra Bela','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3683,'3536901','Pedranopolis','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3684,'3537008','Pedregulho','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3685,'3537107','Pedreira','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3686,'3537156','Pedrinhas Paulista','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3687,'3537206','Pedro de Toledo','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3688,'3537305','Penapolis','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3689,'3537404','Pereira Barreto','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3690,'3537503','Pereiras','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3691,'3537602','Peruibe','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3692,'3537701','Piacatu','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3693,'3537800','Piedade','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3694,'3537909','Pilar do Sul','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3695,'3538006','Pindamonhangaba','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3696,'3538105','Pindorama','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3697,'3538204','Pinhalzinho','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3698,'3538303','Piquerobi','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3699,'3538501','Piquete','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3700,'3538600','Piracaia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3701,'3538709','Piracicaba','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3702,'3538808','Piraju','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3703,'3538907','Pirajui','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3704,'3539004','Pirangi','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3705,'3539103','Pirapora do Bom Jesus','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3706,'3539202','Pirapozinho','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3707,'3539301','Pirassununga','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3708,'3539400','Piratininga','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3709,'3539509','Pitangueiras','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3710,'3539608','Planalto','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3711,'3539707','Platina','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3712,'3539806','Poa','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3713,'3539905','Poloni','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3714,'3540002','Pompeia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3715,'3540101','Pongai','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3716,'3540200','Pontal','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3717,'3540259','Pontalinda','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3718,'3540309','Pontes Gestal','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3719,'3540408','Populina','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3720,'3540507','Porangaba','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3721,'3540606','Porto Feliz','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3722,'3540705','Porto Ferreira','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3723,'3540754','Potim','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3724,'3540804','Potirendaba','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3725,'3540853','Pracinha','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3726,'3540903','Pradopolis','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3727,'3541000','Praia Grande','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3728,'3541059','Pratânia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3729,'3541109','Presidente Alves','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3730,'3541208','Presidente Bernardes','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3731,'3541307','Presidente Epitacio','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3732,'3541406','Presidente Prudente','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3733,'3541505','Presidente Venceslau','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3734,'3541604','Promissao','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3735,'3541653','Quadra','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3736,'3541703','Quata','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3737,'3541802','Queiroz','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3738,'3541901','Queluz','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3739,'3542008','Quintana','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3740,'3542107','Rafard','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3741,'3542206','Rancharia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3742,'3542305','Redençao da Serra','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3743,'3542404','Regente Feijo','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3744,'3542503','Reginopolis','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3745,'3542602','Registro','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3746,'3542701','Restinga','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3747,'3542800','Ribeira','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3748,'3542909','Ribeirao Bonito','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3749,'3543006','Ribeirao Branco','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3750,'3543105','Ribeirao Corrente','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3751,'3543204','Ribeirao do Sul','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3752,'3543238','Ribeirao dos indios','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3753,'3543253','Ribeirao Grande','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3754,'3543303','Ribeirao Pires','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3755,'3543402','Ribeirao Preto','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3756,'3543501','Riversul','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3757,'3543600','Rifaina','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3758,'3543709','Rincao','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3759,'3543808','Rinopolis','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3760,'3543907','Rio Claro','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3761,'3544004','Rio das Pedras','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3762,'3544103','Rio Grande da Serra','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3763,'3544202','Riolândia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3764,'3544251','Rosana','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3765,'3544301','Roseira','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3766,'3544400','Rubiacea','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3767,'3544509','Rubineia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3768,'3544608','Sabino','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3769,'3544707','Sagres','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3770,'3544806','Sales','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3771,'3544905','Sales Oliveira','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3772,'3545001','Salesopolis','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3773,'3545100','Salmourao','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3774,'3545159','Saltinho','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3775,'3545209','Salto','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3776,'3545308','Salto de Pirapora','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3777,'3545407','Salto Grande','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3778,'3545506','Sandovalina','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3779,'3545605','Santa Adelia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3780,'3545704','Santa Albertina','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3781,'3545803','Santa Barbara D\'Oeste','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3782,'3546009','Santa Branca','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3783,'3546108','Santa Clara D\'Oeste','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3784,'3546207','Santa Cruz da Conceiçao','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3785,'3546256','Santa Cruz da Esperança','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3786,'3546306','Santa Cruz das Palmeiras','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3787,'3546405','Santa Cruz do Rio Pardo','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3788,'3546504','Santa Ernestina','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3789,'3546603','Santa Fe do Sul','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3790,'3546702','Santa Gertrudes','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3791,'3546801','Santa Isabel','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3792,'3546900','Santa Lucia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3793,'3547007','Santa Maria da Serra','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3794,'3547106','Santa Mercedes','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3795,'3547205','Santana da Ponte Pensa','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3796,'3547304','Santana de Parnaiba','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3797,'3547403','Santa Rita D\'Oeste','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3798,'3547502','Santa Rita do Passa Quatro','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3799,'3547601','Santa Rosa de Viterbo','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3800,'3547650','Santa Salete','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3801,'3547700','Santo Anastacio','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3802,'3547809','Santo Andre','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3803,'3547908','Santo Antônio da Alegria','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3804,'3548005','Santo Antônio de Posse','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3805,'3548054','Santo Antônio do Aracangua','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3806,'3548104','Santo Antônio do Jardim','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3807,'3548203','Santo Antônio do Pinhal','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3808,'3548302','Santo Expedito','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3809,'3548401','Santopolis do Aguapei','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3810,'3548500','Santos','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3811,'3548609','Sao Bento do Sapucai','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3812,'3548708','Sao Bernardo do Campo','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3813,'3548807','Sao Caetano do Sul','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3814,'3548906','Sao Carlos','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3815,'3549003','Sao Francisco','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3816,'3549102','Sao Joao da Boa Vista','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3817,'3549201','Sao Joao das Duas Pontes','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3818,'3549250','Sao Joao de Iracema','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3819,'3549300','Sao Joao do Pau D\'Alho','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3820,'3549409','Sao Joaquim da Barra','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3821,'3549508','Sao Jose da Bela Vista','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3822,'3549607','Sao Jose do Barreiro','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3823,'3549706','Sao Jose do Rio Pardo','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3824,'3549805','Sao Jose do Rio Preto','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3825,'3549904','Sao Jose dos Campos','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3826,'3549953','Sao Lourenço da Serra','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3827,'3550001','Sao Luis do Paraitinga','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3828,'3550100','Sao Manuel','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3829,'3550209','Sao Miguel Arcanjo','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3830,'3550308','Sao Paulo','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3831,'3550407','Sao Pedro','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3832,'3550506','Sao Pedro do Turvo','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3833,'3550605','Sao Roque','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3834,'3550704','Sao Sebastiao','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3835,'3550803','Sao Sebastiao da Grama','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3836,'3550902','Sao Simao','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3837,'3551009','Sao Vicente','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3838,'3551108','Sarapui','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3839,'3551207','Sarutaia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3840,'3551306','Sebastianopolis do Sul','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3841,'3551405','Serra Azul','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3842,'3551504','Serrana','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3843,'3551603','Serra Negra','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3844,'3551702','Sertaozinho','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3845,'3551801','Sete Barras','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3846,'3551900','Severinia','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3847,'3552007','Silveiras','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3848,'3552106','Socorro','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3849,'3552205','Sorocaba','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3850,'3552304','Sud Mennucci','SP','2022-10-27 17:15:07','2022-10-27 17:15:07'),(3851,'3552403','Sumare','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3852,'3552502','Suzano','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3853,'3552551','Suzanapolis','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3854,'3552601','Tabapua','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3855,'3552700','Tabatinga','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3856,'3552809','Taboao da Serra','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3857,'3552908','Taciba','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3858,'3553005','Taguai','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3859,'3553104','Taiaçu','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3860,'3553203','Taiuva','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3861,'3553302','Tambau','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3862,'3553401','Tanabi','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3863,'3553500','Tapirai','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3864,'3553609','Tapiratiba','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3865,'3553658','Taquaral','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3866,'3553708','Taquaritinga','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3867,'3553807','Taquarituba','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3868,'3553856','Taquarivai','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3869,'3553906','Tarabai','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3870,'3553955','Taruma','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3871,'3554003','Tatui','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3872,'3554102','Taubate','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3873,'3554201','Tejupa','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3874,'3554300','Teodoro Sampaio','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3875,'3554409','Terra Roxa','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3876,'3554508','Tietê','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3877,'3554607','Timburi','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3878,'3554656','Torre de Pedra','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3879,'3554706','Torrinha','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3880,'3554755','Trabiju','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3881,'3554805','Tremembe','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3882,'3554904','Três Fronteiras','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3883,'3554953','Tuiuti','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3884,'3555000','Tupa','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3885,'3555109','Tupi Paulista','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3886,'3555208','Turiuba','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3887,'3555307','Turmalina','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3888,'3555356','Ubarana','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3889,'3555406','Ubatuba','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3890,'3555505','Ubirajara','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3891,'3555604','Uchoa','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3892,'3555703','Uniao Paulista','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3893,'3555802','Urânia','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3894,'3555901','Uru','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3895,'3556008','Urupês','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3896,'3556107','Valentim Gentil','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3897,'3556206','Valinhos','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3898,'3556305','Valparaiso','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3899,'3556354','Vargem','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3900,'3556404','Vargem Grande do Sul','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3901,'3556453','Vargem Grande Paulista','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3902,'3556503','Varzea Paulista','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3903,'3556602','Vera Cruz','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3904,'3556701','Vinhedo','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3905,'3556800','Viradouro','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3906,'3556909','Vista Alegre do Alto','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3907,'3556958','Vitoria Brasil','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3908,'3557006','Votorantim','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3909,'3557105','Votuporanga','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3910,'3557154','Zacarias','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3911,'3557204','Chavantes','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3912,'3557303','Estiva Gerbi','SP','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3913,'4100103','Abatia','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3914,'4100202','Adrianopolis','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3915,'4100301','Agudos do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3916,'4100400','Almirante Tamandare','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3917,'4100459','Altamira do Parana','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3918,'4100509','Altônia','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3919,'4100608','Alto Parana','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3920,'4100707','Alto Piquiri','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3921,'4100806','Alvorada do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3922,'4100905','Amapora','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3923,'4101002','Ampere','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3924,'4101051','Anahy','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3925,'4101101','Andira','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3926,'4101150','Ângulo','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3927,'4101200','Antonina','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3928,'4101309','Antônio Olinto','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3929,'4101408','Apucarana','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3930,'4101507','Arapongas','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3931,'4101606','Arapoti','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3932,'4101655','Arapua','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3933,'4101705','Araruna','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3934,'4101804','Araucaria','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3935,'4101853','Ariranha do Ivai','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3936,'4101903','Assai','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3937,'4102000','Assis Chateaubriand','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3938,'4102109','Astorga','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3939,'4102208','Atalaia','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3940,'4102307','Balsa Nova','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3941,'4102406','Bandeirantes','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3942,'4102505','Barbosa Ferraz','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3943,'4102604','Barracao','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3944,'4102703','Barra do Jacare','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3945,'4102752','Bela Vista da Caroba','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3946,'4102802','Bela Vista do Paraiso','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3947,'4102901','Bituruna','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3948,'4103008','Boa Esperança','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3949,'4103024','Boa Esperança do Iguaçu','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3950,'4103040','Boa Ventura de Sao Roque','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3951,'4103057','Boa Vista da Aparecida','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3952,'4103107','Bocaiuva do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3953,'4103156','Bom Jesus do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3954,'4103206','Bom Sucesso','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3955,'4103222','Bom Sucesso do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3956,'4103305','Borrazopolis','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3957,'4103354','Braganey','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3958,'4103370','Brasilândia do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3959,'4103404','Cafeara','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3960,'4103453','Cafelândia','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3961,'4103479','Cafezal do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3962,'4103503','California','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3963,'4103602','Cambara','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3964,'4103701','Cambe','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3965,'4103800','Cambira','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3966,'4103909','Campina da Lagoa','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3967,'4103958','Campina do Simao','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3968,'4104006','Campina Grande do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3969,'4104055','Campo Bonito','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3970,'4104105','Campo do Tenente','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3971,'4104204','Campo Largo','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3972,'4104253','Campo Magro','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3973,'4104303','Campo Mourao','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3974,'4104402','Cândido de Abreu','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3975,'4104428','Candoi','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3976,'4104451','Cantagalo','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3977,'4104501','Capanema','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3978,'4104600','Capitao Leônidas Marques','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3979,'4104659','Carambei','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3980,'4104709','Carlopolis','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3981,'4104808','Cascavel','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3982,'4104907','Castro','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3983,'4105003','Catanduvas','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3984,'4105102','Centenario do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3985,'4105201','Cerro Azul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3986,'4105300','Ceu Azul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3987,'4105409','Chopinzinho','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3988,'4105508','Cianorte','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3989,'4105607','cidades Gaucha','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3990,'4105706','Clevelândia','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3991,'4105805','Colombo','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3992,'4105904','Colorado','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3993,'4106001','Congonhinhas','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3994,'4106100','Conselheiro Mairinck','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3995,'4106209','Contenda','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3996,'4106308','Corbelia','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3997,'4106407','Cornelio Procopio','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3998,'4106456','Coronel Domingos Soares','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(3999,'4106506','Coronel Vivida','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4000,'4106555','Corumbatai do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4001,'4106571','Cruzeiro do Iguaçu','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4002,'4106605','Cruzeiro do Oeste','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4003,'4106704','Cruzeiro do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4004,'4106803','Cruz Machado','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4005,'4106852','Cruzmaltina','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4006,'4106902','Curitiba','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4007,'4107009','Curiuva','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4008,'4107108','Diamante do Norte','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4009,'4107124','Diamante do Sul','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4010,'4107157','Diamante D\'Oeste','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4011,'4107207','Dois Vizinhos','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4012,'4107256','Douradina','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4013,'4107306','Doutor Camargo','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4014,'4107405','Eneas Marques','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4015,'4107504','Engenheiro Beltrao','PR','2022-10-27 17:15:08','2022-10-27 17:15:08'),(4016,'4107520','Esperança Nova','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4017,'4107538','Entre Rios do Oeste','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4018,'4107546','Espigao Alto do Iguaçu','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4019,'4107553','Farol','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4020,'4107603','Faxinal','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4021,'4107652','Fazenda Rio Grande','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4022,'4107702','Fênix','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4023,'4107736','Fernandes Pinheiro','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4024,'4107751','Figueira','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4025,'4107801','Florai','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4026,'4107850','Flor da Serra do Sul','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4027,'4107900','Floresta','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4028,'4108007','Florestopolis','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4029,'4108106','Florida','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4030,'4108205','Formosa do Oeste','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4031,'4108304','Foz do Iguaçu','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4032,'4108320','Francisco Alves','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4033,'4108403','Francisco Beltrao','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4034,'4108452','Foz do Jordao','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4035,'4108502','General Carneiro','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4036,'4108551','Godoy Moreira','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4037,'4108601','Goioerê','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4038,'4108650','Goioxim','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4039,'4108700','Grandes Rios','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4040,'4108809','Guaira','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4041,'4108908','Guairaça','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4042,'4108957','Guamiranga','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4043,'4109005','Guapirama','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4044,'4109104','Guaporema','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4045,'4109203','Guaraci','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4046,'4109302','Guaraniaçu','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4047,'4109401','Guarapuava','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4048,'4109500','Guaraqueçaba','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4049,'4109609','Guaratuba','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4050,'4109658','Honorio Serpa','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4051,'4109708','Ibaiti','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4052,'4109757','Ibema','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4053,'4109807','Ibipora','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4054,'4109906','Icaraima','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4055,'4110003','Iguaraçu','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4056,'4110052','Iguatu','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4057,'4110078','Imbau','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4058,'4110102','Imbituva','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4059,'4110201','Inacio Martins','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4060,'4110300','Inaja','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4061,'4110409','Indianopolis','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4062,'4110508','Ipiranga','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4063,'4110607','Ipora','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4064,'4110656','Iracema do Oeste','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4065,'4110706','Irati','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4066,'4110805','Iretama','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4067,'4110904','Itaguaje','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4068,'4110953','Itaipulândia','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4069,'4111001','Itambaraca','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4070,'4111100','Itambe','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4071,'4111209','Itapejara D\'Oeste','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4072,'4111258','Itaperuçu','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4073,'4111308','Itauna do Sul','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4074,'4111407','Ivai','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4075,'4111506','Ivaipora','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4076,'4111555','Ivate','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4077,'4111605','Ivatuba','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4078,'4111704','Jaboti','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4079,'4111803','Jacarezinho','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4080,'4111902','Jaguapita','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4081,'4112009','Jaguariaiva','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4082,'4112108','Jandaia do Sul','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4083,'4112207','Janiopolis','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4084,'4112306','Japira','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4085,'4112405','Japura','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4086,'4112504','Jardim Alegre','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4087,'4112603','Jardim Olinda','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4088,'4112702','Jataizinho','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4089,'4112751','Jesuitas','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4090,'4112801','Joaquim Tavora','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4091,'4112900','Jundiai do Sul','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4092,'4112959','Juranda','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4093,'4113007','Jussara','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4094,'4113106','Kalore','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4095,'4113205','Lapa','PR','2022-10-27 17:15:09','2022-10-27 17:15:09'),(4096,'4113254','Laranjal','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4097,'4113304','Laranjeiras do Sul','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4098,'4113403','Leopolis','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4099,'4113429','Lidianopolis','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4100,'4113452','Lindoeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4101,'4113502','Loanda','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4102,'4113601','Lobato','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4103,'4113700','Londrina','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4104,'4113734','Luiziana','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4105,'4113759','Lunardelli','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4106,'4113809','Lupionopolis','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4107,'4113908','Mallet','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4108,'4114005','Mamborê','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4109,'4114104','Mandaguaçu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4110,'4114203','Mandaguari','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4111,'4114302','Mandirituba','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4112,'4114351','Manfrinopolis','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4113,'4114401','Mangueirinha','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4114,'4114500','Manoel Ribas','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4115,'4114609','Marechal Cândido Rondon','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4116,'4114708','Maria Helena','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4117,'4114807','Marialva','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4118,'4114906','Marilândia do Sul','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4119,'4115002','Marilena','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4120,'4115101','Mariluz','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4121,'4115200','Maringa','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4122,'4115309','Mariopolis','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4123,'4115358','Maripa','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4124,'4115408','Marmeleiro','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4125,'4115457','Marquinho','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4126,'4115507','Marumbi','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4127,'4115606','Matelândia','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4128,'4115705','Matinhos','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4129,'4115739','Mato Rico','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4130,'4115754','Maua da Serra','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4131,'4115804','Medianeira','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4132,'4115853','Mercedes','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4133,'4115903','Mirador','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4134,'4116000','Miraselva','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4135,'4116059','Missal','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4136,'4116109','Moreira Sales','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4137,'4116208','Morretes','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4138,'4116307','Munhoz de Melo','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4139,'4116406','Nossa Senhora das Graças','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4140,'4116505','Nova Aliança do Ivai','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4141,'4116604','Nova America da Colina','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4142,'4116703','Nova Aurora','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4143,'4116802','Nova Cantu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4144,'4116901','Nova Esperança','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4145,'4116950','Nova Esperança do Sudoeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4146,'4117008','Nova Fatima','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4147,'4117057','Nova Laranjeiras','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4148,'4117107','Nova Londrina','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4149,'4117206','Nova Olimpia','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4150,'4117214','Nova Santa Barbara','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4151,'4117222','Nova Santa Rosa','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4152,'4117255','Nova Prata do Iguaçu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4153,'4117271','Nova Tebas','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4154,'4117297','Novo Itacolomi','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4155,'4117305','Ortigueira','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4156,'4117404','Ourizona','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4157,'4117453','Ouro Verde do Oeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4158,'4117503','Paiçandu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4159,'4117602','Palmas','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4160,'4117701','Palmeira','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4161,'4117800','Palmital','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4162,'4117909','Palotina','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4163,'4118006','Paraiso do Norte','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4164,'4118105','Paranacity','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4165,'4118204','Paranagua','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4166,'4118303','Paranapoema','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4167,'4118402','Paranavai','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4168,'4118451','Pato Bragado','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4169,'4118501','Pato Branco','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4170,'4118600','Paula Freitas','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4171,'4118709','Paulo Frontin','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4172,'4118808','Peabiru','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4173,'4118857','Perobal','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4174,'4118907','Perola','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4175,'4119004','Perola D\'Oeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4176,'4119103','Piên','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4177,'4119152','Pinhais','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4178,'4119202','Pinhalao','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4179,'4119251','Pinhal de Sao Bento','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4180,'4119301','Pinhao','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4181,'4119400','Pirai do Sul','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4182,'4119509','Piraquara','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4183,'4119608','Pitanga','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4184,'4119657','Pitangueiras','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4185,'4119707','Planaltina do Parana','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4186,'4119806','Planalto','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4187,'4119905','Ponta Grossa','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4188,'4119954','Pontal do Parana','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4189,'4120002','Porecatu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4190,'4120101','Porto Amazonas','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4191,'4120150','Porto Barreiro','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4192,'4120200','Porto Rico','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4193,'4120309','Porto Vitoria','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4194,'4120333','Prado Ferreira','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4195,'4120358','Pranchita','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4196,'4120408','Presidente Castelo Branco','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4197,'4120507','Primeiro de Maio','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4198,'4120606','Prudentopolis','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4199,'4120655','Quarto Centenario','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4200,'4120705','Quatigua','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4201,'4120804','Quatro Barras','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4202,'4120853','Quatro Pontes','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4203,'4120903','Quedas do Iguaçu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4204,'4121000','Querência do Norte','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4205,'4121109','Quinta do Sol','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4206,'4121208','Quitandinha','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4207,'4121257','Ramilândia','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4208,'4121307','Rancho Alegre','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4209,'4121356','Rancho Alegre D\'Oeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4210,'4121406','Realeza','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4211,'4121505','Rebouças','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4212,'4121604','Renascença','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4213,'4121703','Reserva','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4214,'4121752','Reserva do Iguaçu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4215,'4121802','Ribeirao Claro','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4216,'4121901','Ribeirao do Pinhal','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4217,'4122008','Rio Azul','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4218,'4122107','Rio Bom','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4219,'4122156','Rio Bonito do Iguaçu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4220,'4122172','Rio Branco do Ivai','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4221,'4122206','Rio Branco do Sul','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4222,'4122305','Rio Negro','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4223,'4122404','Rolândia','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4224,'4122503','Roncador','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4225,'4122602','Rondon','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4226,'4122651','Rosario do Ivai','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4227,'4122701','Sabaudia','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4228,'4122800','Salgado Filho','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4229,'4122909','Salto do Itarare','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4230,'4123006','Salto do Lontra','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4231,'4123105','Santa Amelia','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4232,'4123204','Santa Cecilia do Pavao','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4233,'4123303','Santa Cruz de Monte Castelo','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4234,'4123402','Santa Fe','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4235,'4123501','Santa Helena','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4236,'4123600','Santa Inês','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4237,'4123709','Santa Isabel do Ivai','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4238,'4123808','Santa Izabel do Oeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4239,'4123824','Santa Lucia','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4240,'4123857','Santa Maria do Oeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4241,'4123907','Santa Mariana','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4242,'4123956','Santa Mônica','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4243,'4124004','Santana do Itarare','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4244,'4124020','Santa Tereza do Oeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4245,'4124053','Santa Terezinha de Itaipu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4246,'4124103','Santo Antônio da Platina','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4247,'4124202','Santo Antônio do Caiua','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4248,'4124301','Santo Antônio do Paraiso','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4249,'4124400','Santo Antônio do Sudoeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4250,'4124509','Santo Inacio','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4251,'4124608','Sao Carlos do Ivai','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4252,'4124707','Sao Jerônimo da Serra','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4253,'4124806','Sao Joao','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4254,'4124905','Sao Joao do Caiua','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4255,'4125001','Sao Joao do Ivai','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4256,'4125100','Sao Joao do Triunfo','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4257,'4125209','Sao Jorge D\'Oeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4258,'4125308','Sao Jorge do Ivai','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4259,'4125357','Sao Jorge do Patrocinio','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4260,'4125407','Sao Jose da Boa Vista','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4261,'4125456','Sao Jose das Palmeiras','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4262,'4125506','Sao Jose dos Pinhais','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4263,'4125555','Sao Manoel do Parana','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4264,'4125605','Sao Mateus do Sul','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4265,'4125704','Sao Miguel do Iguaçu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4266,'4125753','Sao Pedro do Iguaçu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4267,'4125803','Sao Pedro do Ivai','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4268,'4125902','Sao Pedro do Parana','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4269,'4126009','Sao Sebastiao da Amoreira','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4270,'4126108','Sao Tome','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4271,'4126207','Sapopema','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4272,'4126256','Sarandi','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4273,'4126272','Saudade do Iguaçu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4274,'4126306','Senges','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4275,'4126355','Serranopolis do Iguaçu','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4276,'4126405','Sertaneja','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4277,'4126504','Sertanopolis','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4278,'4126603','Siqueira Campos','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4279,'4126652','Sulina','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4280,'4126678','Tamarana','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4281,'4126702','Tamboara','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4282,'4126801','Tapejara','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4283,'4126900','Tapira','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4284,'4127007','Teixeira Soares','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4285,'4127106','Telêmaco Borba','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4286,'4127205','Terra Boa','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4287,'4127304','Terra Rica','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4288,'4127403','Terra Roxa','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4289,'4127502','Tibagi','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4290,'4127601','Tijucas do Sul','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4291,'4127700','Toledo','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4292,'4127809','Tomazina','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4293,'4127858','Três Barras do Parana','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4294,'4127882','Tunas do Parana','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4295,'4127908','Tuneiras do Oeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4296,'4127957','Tupassi','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4297,'4127965','Turvo','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4298,'4128005','Ubirata','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4299,'4128104','Umuarama','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4300,'4128203','Uniao da Vitoria','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4301,'4128302','Uniflor','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4302,'4128401','Urai','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4303,'4128500','Wenceslau Braz','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4304,'4128534','Ventania','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4305,'4128559','Vera Cruz do Oeste','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4306,'4128609','Verê','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4307,'4128625','Alto Paraiso','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4308,'4128633','Doutor Ulysses','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4309,'4128658','Virmond','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4310,'4128708','Vitorino','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4311,'4128807','Xambrê','PR','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4312,'4200051','Abdon Batista','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4313,'4200101','Abelardo Luz','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4314,'4200200','Agrolândia','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4315,'4200309','Agronômica','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4316,'4200408','agua Doce','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4317,'4200507','aguas de Chapeco','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4318,'4200556','aguas Frias','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4319,'4200606','aguas Mornas','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4320,'4200705','Alfredo Wagner','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4321,'4200754','Alto Bela Vista','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4322,'4200804','Anchieta','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4323,'4200903','Angelina','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4324,'4201000','Anita Garibaldi','SC','2022-10-27 17:15:10','2022-10-27 17:15:10'),(4325,'4201109','Anitapolis','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4326,'4201208','Antônio Carlos','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4327,'4201257','Apiuna','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4328,'4201273','Arabuta','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4329,'4201307','Araquari','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4330,'4201406','Ararangua','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4331,'4201505','Armazem','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4332,'4201604','Arroio Trinta','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4333,'4201653','Arvoredo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4334,'4201703','Ascurra','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4335,'4201802','Atalanta','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4336,'4201901','Aurora','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4337,'4201950','Balneario Arroio do Silva','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4338,'4202008','Balneario Camboriu','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4339,'4202057','Balneario Barra do Sul','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4340,'4202073','Balneario Gaivota','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4341,'4202081','Bandeirante','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4342,'4202099','Barra Bonita','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4343,'4202107','Barra Velha','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4344,'4202131','Bela Vista do Toldo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4345,'4202156','Belmonte','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4346,'4202206','Benedito Novo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4347,'4202305','Biguaçu','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4348,'4202404','Blumenau','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4349,'4202438','Bocaina do Sul','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4350,'4202453','Bombinhas','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4351,'4202503','Bom Jardim da Serra','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4352,'4202537','Bom Jesus','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4353,'4202578','Bom Jesus do Oeste','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4354,'4202602','Bom Retiro','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4355,'4202701','Botuvera','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4356,'4202800','Braço do Norte','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4357,'4202859','Braço do Trombudo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4358,'4202875','Brunopolis','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4359,'4202909','Brusque','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4360,'4203006','Caçador','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4361,'4203105','Caibi','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4362,'4203154','Calmon','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4363,'4203204','Camboriu','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4364,'4203253','Capao Alto','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4365,'4203303','Campo Alegre','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4366,'4203402','Campo Belo do Sul','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4367,'4203501','Campo Erê','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4368,'4203600','Campos Novos','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4369,'4203709','Canelinha','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4370,'4203808','Canoinhas','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4371,'4203907','Capinzal','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4372,'4203956','Capivari de Baixo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4373,'4204004','Catanduvas','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4374,'4204103','Caxambu do Sul','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4375,'4204152','Celso Ramos','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4376,'4204178','Cerro Negro','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4377,'4204194','Chapadao do Lageado','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4378,'4204202','Chapeco','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4379,'4204251','Cocal do Sul','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4380,'4204301','Concordia','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4381,'4204350','Cordilheira Alta','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4382,'4204400','Coronel Freitas','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4383,'4204459','Coronel Martins','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4384,'4204509','Corupa','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4385,'4204558','Correia Pinto','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4386,'4204608','Criciuma','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4387,'4204707','Cunha Pora','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4388,'4204756','Cunhatai','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4389,'4204806','Curitibanos','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4390,'4204905','Descanso','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4391,'4205001','Dionisio Cerqueira','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4392,'4205100','Dona Emma','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4393,'4205159','Doutor Pedrinho','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4394,'4205175','Entre Rios','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4395,'4205191','Ermo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4396,'4205209','Erval Velho','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4397,'4205308','Faxinal dos Guedes','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4398,'4205357','Flor do Sertao','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4399,'4205407','Florianopolis','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4400,'4205431','Formosa do Sul','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4401,'4205456','Forquilhinha','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4402,'4205506','Fraiburgo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4403,'4205555','Frei Rogerio','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4404,'4205605','Galvao','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4405,'4205704','Garopaba','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4406,'4205803','Garuva','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4407,'4205902','Gaspar','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4408,'4206009','Governador Celso Ramos','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4409,'4206108','Grao Para','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4410,'4206207','Gravatal','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4411,'4206306','Guabiruba','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4412,'4206405','Guaraciaba','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4413,'4206504','Guaramirim','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4414,'4206603','Guaruja do Sul','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4415,'4206652','Guatambu','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4416,'4206702','Herval D\'Oeste','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4417,'4206751','Ibiam','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4418,'4206801','Ibicare','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4419,'4206900','Ibirama','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4420,'4207007','Içara','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4421,'4207106','Ilhota','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4422,'4207205','Imarui','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4423,'4207304','Imbituba','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4424,'4207403','Imbuia','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4425,'4207502','Indaial','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4426,'4207577','Iomerê','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4427,'4207601','Ipira','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4428,'4207650','Ipora do Oeste','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4429,'4207684','Ipuaçu','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4430,'4207700','Ipumirim','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4431,'4207759','Iraceminha','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4432,'4207809','Irani','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4433,'4207858','Irati','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4434,'4207908','Irineopolis','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4435,'4208005','Ita','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4436,'4208104','Itaiopolis','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4437,'4208203','Itajai','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4438,'4208302','Itapema','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4439,'4208401','Itapiranga','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4440,'4208450','Itapoa','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4441,'4208500','Ituporanga','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4442,'4208609','Jabora','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4443,'4208708','Jacinto Machado','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4444,'4208807','Jaguaruna','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4445,'4208906','Jaragua do Sul','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4446,'4208955','Jardinopolis','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4447,'4209003','Joaçaba','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4448,'4209102','Joinville','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4449,'4209151','Jose Boiteux','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4450,'4209177','Jupia','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4451,'4209201','Lacerdopolis','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4452,'4209300','Lages','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4453,'4209409','Laguna','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4454,'4209458','Lajeado Grande','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4455,'4209508','Laurentino','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4456,'4209607','Lauro Muller','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4457,'4209706','Lebon Regis','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4458,'4209805','Leoberto Leal','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4459,'4209854','Lindoia do Sul','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4460,'4209904','Lontras','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4461,'4210001','Luiz Alves','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4462,'4210035','Luzerna','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4463,'4210050','Macieira','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4464,'4210100','Mafra','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4465,'4210209','Major Gercino','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4466,'4210308','Major Vieira','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4467,'4210407','Maracaja','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4468,'4210506','Maravilha','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4469,'4210555','Marema','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4470,'4210605','Massaranduba','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4471,'4210704','Matos Costa','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4472,'4210803','Meleiro','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4473,'4210852','Mirim Doce','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4474,'4210902','Modelo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4475,'4211009','Mondai','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4476,'4211058','Monte Carlo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4477,'4211108','Monte Castelo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4478,'4211207','Morro da Fumaça','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4479,'4211256','Morro Grande','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4480,'4211306','Navegantes','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4481,'4211405','Nova Erechim','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4482,'4211454','Nova Itaberaba','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4483,'4211504','Nova Trento','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4484,'4211603','Nova Veneza','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4485,'4211652','Novo Horizonte','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4486,'4211702','Orleans','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4487,'4211751','Otacilio Costa','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4488,'4211801','Ouro','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4489,'4211850','Ouro Verde','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4490,'4211876','Paial','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4491,'4211892','Painel','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4492,'4211900','Palhoça','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4493,'4212007','Palma Sola','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4494,'4212056','Palmeira','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4495,'4212106','Palmitos','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4496,'4212205','Papanduva','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4497,'4212239','Paraiso','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4498,'4212254','Passo de Torres','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4499,'4212270','Passos Maia','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4500,'4212304','Paulo Lopes','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4501,'4212403','Pedras Grandes','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4502,'4212502','Penha','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4503,'4212601','Peritiba','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4504,'4212650','Pescaria Brava','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4505,'4212700','Petrolândia','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4506,'4212809','Balneario Piçarras','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4507,'4212908','Pinhalzinho','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4508,'4213005','Pinheiro Preto','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4509,'4213104','Piratuba','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4510,'4213153','Planalto Alegre','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4511,'4213203','Pomerode','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4512,'4213302','Ponte Alta','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4513,'4213351','Ponte Alta do Norte','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4514,'4213401','Ponte Serrada','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4515,'4213500','Porto Belo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4516,'4213609','Porto Uniao','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4517,'4213708','Pouso Redondo','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4518,'4213807','Praia Grande','SC','2022-10-27 17:15:11','2022-10-27 17:15:11'),(4519,'4213906','Presidente Castello Branco','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4520,'4214003','Presidente Getulio','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4521,'4214102','Presidente Nereu','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4522,'4214151','Princesa','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4523,'4214201','Quilombo','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4524,'4214300','Rancho Queimado','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4525,'4214409','Rio das Antas','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4526,'4214508','Rio do Campo','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4527,'4214607','Rio do Oeste','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4528,'4214706','Rio dos Cedros','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4529,'4214805','Rio do Sul','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4530,'4214904','Rio Fortuna','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4531,'4215000','Rio Negrinho','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4532,'4215059','Rio Rufino','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4533,'4215075','Riqueza','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4534,'4215109','Rodeio','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4535,'4215208','Romelândia','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4536,'4215307','Salete','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4537,'4215356','Saltinho','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4538,'4215406','Salto Veloso','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4539,'4215455','Sangao','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4540,'4215505','Santa Cecilia','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4541,'4215554','Santa Helena','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4542,'4215604','Santa Rosa de Lima','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4543,'4215653','Santa Rosa do Sul','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4544,'4215679','Santa Terezinha','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4545,'4215687','Santa Terezinha do Progresso','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4546,'4215695','Santiago do Sul','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4547,'4215703','Santo Amaro da Imperatriz','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4548,'4215752','Sao Bernardino','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4549,'4215802','Sao Bento do Sul','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4550,'4215901','Sao Bonifacio','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4551,'4216008','Sao Carlos','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4552,'4216057','Sao Cristovao do Sul','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4553,'4216107','Sao Domingos','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4554,'4216206','Sao Francisco do Sul','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4555,'4216255','Sao Joao do Oeste','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4556,'4216305','Sao Joao Batista','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4557,'4216354','Sao Joao do Itaperiu','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4558,'4216404','Sao Joao do Sul','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4559,'4216503','Sao Joaquim','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4560,'4216602','Sao Jose','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4561,'4216701','Sao Jose do Cedro','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4562,'4216800','Sao Jose do Cerrito','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4563,'4216909','Sao Lourenço do Oeste','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4564,'4217006','Sao Ludgero','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4565,'4217105','Sao Martinho','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4566,'4217154','Sao Miguel da Boa Vista','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4567,'4217204','Sao Miguel do Oeste','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4568,'4217253','Sao Pedro de Alcântara','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4569,'4217303','Saudades','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4570,'4217402','Schroeder','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4571,'4217501','Seara','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4572,'4217550','Serra Alta','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4573,'4217600','Sideropolis','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4574,'4217709','Sombrio','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4575,'4217758','Sul Brasil','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4576,'4217808','Taio','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4577,'4217907','Tangara','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4578,'4217956','Tigrinhos','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4579,'4218004','Tijucas','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4580,'4218103','Timbe do Sul','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4581,'4218202','Timbo','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4582,'4218251','Timbo Grande','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4583,'4218301','Três Barras','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4584,'4218350','Treviso','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4585,'4218400','Treze de Maio','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4586,'4218509','Treze Tilias','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4587,'4218608','Trombudo Central','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4588,'4218707','Tubarao','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4589,'4218756','Tunapolis','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4590,'4218806','Turvo','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4591,'4218855','Uniao do Oeste','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4592,'4218905','Urubici','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4593,'4218954','Urupema','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4594,'4219002','Urussanga','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4595,'4219101','Vargeao','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4596,'4219150','Vargem','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4597,'4219176','Vargem Bonita','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4598,'4219200','Vidal Ramos','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4599,'4219309','Videira','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4600,'4219358','Vitor Meireles','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4601,'4219408','Witmarsum','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4602,'4219507','Xanxerê','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4603,'4219606','Xavantina','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4604,'4219705','Xaxim','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4605,'4219853','Zortea','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4606,'4220000','Balneario Rincao','SC','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4607,'4300034','Acegua','RS','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4608,'4300059','agua Santa','RS','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4609,'4300109','Agudo','RS','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4610,'4300208','Ajuricaba','RS','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4611,'4300307','Alecrim','RS','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4612,'4300406','Alegrete','RS','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4613,'4300455','Alegria','RS','2022-10-27 17:15:12','2022-10-27 17:15:12'),(4614,'4300471','Almirante Tamandare do Sul','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4615,'4300505','Alpestre','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4616,'4300554','Alto Alegre','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4617,'4300570','Alto Feliz','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4618,'4300604','Alvorada','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4619,'4300638','Amaral Ferrador','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4620,'4300646','Ametista do Sul','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4621,'4300661','Andre da Rocha','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4622,'4300703','Anta Gorda','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4623,'4300802','Antônio Prado','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4624,'4300851','Arambare','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4625,'4300877','Ararica','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4626,'4300901','Aratiba','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4627,'4301008','Arroio do Meio','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4628,'4301057','Arroio do Sal','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4629,'4301073','Arroio do Padre','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4630,'4301107','Arroio dos Ratos','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4631,'4301206','Arroio do Tigre','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4632,'4301305','Arroio Grande','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4633,'4301404','Arvorezinha','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4634,'4301503','Augusto Pestana','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4635,'4301552','aurea','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4636,'4301602','Bage','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4637,'4301636','Balneario Pinhal','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4638,'4301651','Barao','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4639,'4301701','Barao de Cotegipe','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4640,'4301750','Barao do Triunfo','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4641,'4301800','Barracao','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4642,'4301859','Barra do Guarita','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4643,'4301875','Barra do Quarai','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4644,'4301909','Barra do Ribeiro','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4645,'4301925','Barra do Rio Azul','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4646,'4301958','Barra Funda','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4647,'4302006','Barros Cassal','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4648,'4302055','Benjamin Constant do Sul','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4649,'4302105','Bento Gonçalves','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4650,'4302154','Boa Vista das Missoes','RS','2022-10-27 17:15:13','2022-10-27 17:15:13'),(4651,'4302204','Boa Vista do Burica','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4652,'4302220','Boa Vista do Cadeado','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4653,'4302238','Boa Vista do Incra','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4654,'4302253','Boa Vista do Sul','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4655,'4302303','Bom Jesus','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4656,'4302352','Bom Principio','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4657,'4302378','Bom Progresso','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4658,'4302402','Bom Retiro do Sul','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4659,'4302451','Boqueirao do Leao','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4660,'4302501','Bossoroca','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4661,'4302584','Bozano','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4662,'4302600','Braga','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4663,'4302659','Brochier','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4664,'4302709','Butia','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4665,'4302808','Caçapava do Sul','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4666,'4302907','Cacequi','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4667,'4303004','Cachoeira do Sul','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4668,'4303103','Cachoeirinha','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4669,'4303202','Cacique Doble','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4670,'4303301','Caibate','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4671,'4303400','Caiçara','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4672,'4303509','Camaqua','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4673,'4303558','Camargo','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4674,'4303608','Cambara do Sul','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4675,'4303673','Campestre da Serra','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4676,'4303707','Campina das Missoes','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4677,'4303806','Campinas do Sul','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4678,'4303905','Campo Bom','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4679,'4304002','Campo Novo','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4680,'4304101','Campos Borges','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4681,'4304200','Candelaria','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4682,'4304309','Cândido Godoi','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4683,'4304358','Candiota','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4684,'4304408','Canela','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4685,'4304507','Canguçu','RS','2022-10-27 17:15:14','2022-10-27 17:15:14'),(4686,'4304606','Canoas','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4687,'4304614','Canudos do Vale','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4688,'4304622','Capao Bonito do Sul','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4689,'4304630','Capao da Canoa','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4690,'4304655','Capao do Cipo','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4691,'4304663','Capao do Leao','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4692,'4304671','Capivari do Sul','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4693,'4304689','Capela de Santana','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4694,'4304697','Capitao','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4695,'4304705','Carazinho','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4696,'4304713','Caraa','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4697,'4304804','Carlos Barbosa','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4698,'4304853','Carlos Gomes','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4699,'4304903','Casca','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4700,'4304952','Caseiros','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4701,'4305009','Catuipe','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4702,'4305108','Caxias do Sul','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4703,'4305116','Centenario','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4704,'4305124','Cerrito','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4705,'4305132','Cerro Branco','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4706,'4305157','Cerro Grande','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4707,'4305173','Cerro Grande do Sul','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4708,'4305207','Cerro Largo','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4709,'4305306','Chapada','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4710,'4305355','Charqueadas','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4711,'4305371','Charrua','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4712,'4305405','Chiapetta','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4713,'4305439','Chui','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4714,'4305447','Chuvisca','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4715,'4305454','Cidreira','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4716,'4305504','Ciriaco','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4717,'4305587','Colinas','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4718,'4305603','Colorado','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4719,'4305702','Condor','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4720,'4305801','Constantina','RS','2022-10-27 17:15:15','2022-10-27 17:15:15'),(4721,'4305835','Coqueiro Baixo','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4722,'4305850','Coqueiros do Sul','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4723,'4305871','Coronel Barros','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4724,'4305900','Coronel Bicaco','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4725,'4305934','Coronel Pilar','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4726,'4305959','Cotipora','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4727,'4305975','Coxilha','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4728,'4306007','Crissiumal','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4729,'4306056','Cristal','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4730,'4306072','Cristal do Sul','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4731,'4306106','Cruz Alta','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4732,'4306130','Cruzaltense','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4733,'4306205','Cruzeiro do Sul','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4734,'4306304','David Canabarro','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4735,'4306320','Derrubadas','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4736,'4306353','Dezesseis de Novembro','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4737,'4306379','Dilermando de Aguiar','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4738,'4306403','Dois Irmaos','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4739,'4306429','Dois Irmaos das Missoes','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4740,'4306452','Dois Lajeados','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4741,'4306502','Dom Feliciano','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4742,'4306551','Dom Pedro de Alcântara','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4743,'4306601','Dom Pedrito','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4744,'4306700','Dona Francisca','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4745,'4306734','Doutor Mauricio Cardoso','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4746,'4306759','Doutor Ricardo','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4747,'4306767','Eldorado do Sul','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4748,'4306809','Encantado','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4749,'4306908','Encruzilhada do Sul','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4750,'4306924','Engenho Velho','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4751,'4306932','Entre-Ijuis','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4752,'4306957','Entre Rios do Sul','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4753,'4306973','Erebango','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4754,'4307005','Erechim','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4755,'4307054','Ernestina','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4756,'4307104','Herval','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4757,'4307203','Erval Grande','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4758,'4307302','Erval Seco','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4759,'4307401','Esmeralda','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4760,'4307450','Esperança do Sul','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4761,'4307500','Espumoso','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4762,'4307559','Estaçao','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4763,'4307609','Estância Velha','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4764,'4307708','Esteio','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4765,'4307807','Estrela','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4766,'4307815','Estrela Velha','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4767,'4307831','Eugênio de Castro','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4768,'4307864','Fagundes Varela','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4769,'4307906','Farroupilha','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4770,'4308003','Faxinal do Soturno','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4771,'4308052','Faxinalzinho','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4772,'4308078','Fazenda Vilanova','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4773,'4308102','Feliz','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4774,'4308201','Flores da Cunha','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4775,'4308250','Floriano Peixoto','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4776,'4308300','Fontoura Xavier','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4777,'4308409','Formigueiro','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4778,'4308433','Forquetinha','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4779,'4308458','Fortaleza dos Valos','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4780,'4308508','Frederico Westphalen','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4781,'4308607','Garibaldi','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4782,'4308656','Garruchos','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4783,'4308706','Gaurama','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4784,'4308805','General Câmara','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4785,'4308854','Gentil','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4786,'4308904','Getulio Vargas','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4787,'4309001','Girua','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4788,'4309050','Glorinha','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4789,'4309100','Gramado','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4790,'4309126','Gramado dos Loureiros','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4791,'4309159','Gramado Xavier','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4792,'4309209','Gravatai','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4793,'4309258','Guabiju','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4794,'4309308','Guaiba','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4795,'4309407','Guapore','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4796,'4309506','Guarani das Missoes','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4797,'4309555','Harmonia','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4798,'4309571','Herveiras','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4799,'4309605','Horizontina','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4800,'4309654','Hulha Negra','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4801,'4309704','Humaita','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4802,'4309753','Ibarama','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4803,'4309803','Ibiaça','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4804,'4309902','Ibiraiaras','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4805,'4309951','Ibirapuita','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4806,'4310009','Ibiruba','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4807,'4310108','Igrejinha','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4808,'4310207','Ijui','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4809,'4310306','Ilopolis','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4810,'4310330','Imbe','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4811,'4310363','Imigrante','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4812,'4310405','Independência','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4813,'4310413','Inhacora','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4814,'4310439','Ipê','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4815,'4310462','Ipiranga do Sul','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4816,'4310504','Irai','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4817,'4310538','Itaara','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4818,'4310553','Itacurubi','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4819,'4310579','Itapuca','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4820,'4310603','Itaqui','RS','2022-10-27 17:15:16','2022-10-27 17:15:16'),(4821,'4310652','Itati','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4822,'4310702','Itatiba do Sul','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4823,'4310751','Ivora','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4824,'4310801','Ivoti','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4825,'4310850','Jaboticaba','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4826,'4310876','Jacuizinho','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4827,'4310900','Jacutinga','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4828,'4311007','Jaguarao','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4829,'4311106','Jaguari','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4830,'4311122','Jaquirana','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4831,'4311130','Jari','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4832,'4311155','Joia','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4833,'4311205','Julio de Castilhos','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4834,'4311239','Lagoa Bonita do Sul','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4835,'4311254','Lagoao','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4836,'4311270','Lagoa dos Três Cantos','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4837,'4311304','Lagoa Vermelha','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4838,'4311403','Lajeado','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4839,'4311429','Lajeado do Bugre','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4840,'4311502','Lavras do Sul','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4841,'4311601','Liberato Salzano','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4842,'4311627','Lindolfo Collor','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4843,'4311643','Linha Nova','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4844,'4311700','Machadinho','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4845,'4311718','Maçambara','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4846,'4311734','Mampituba','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4847,'4311759','Manoel Viana','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4848,'4311775','Maquine','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4849,'4311791','Marata','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4850,'4311809','Marau','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4851,'4311908','Marcelino Ramos','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4852,'4311981','Mariana Pimentel','RS','2022-10-27 17:15:17','2022-10-27 17:15:17'),(4853,'4312005','Mariano Moro','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4854,'4312054','Marques de Souza','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4855,'4312104','Mata','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4856,'4312138','Mato Castelhano','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4857,'4312153','Mato Leitao','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4858,'4312179','Mato Queimado','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4859,'4312203','Maximiliano de Almeida','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4860,'4312252','Minas do Leao','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4861,'4312302','Miraguai','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4862,'4312351','Montauri','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4863,'4312377','Monte Alegre dos Campos','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4864,'4312385','Monte Belo do Sul','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4865,'4312401','Montenegro','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4866,'4312427','Mormaço','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4867,'4312443','Morrinhos do Sul','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4868,'4312450','Morro Redondo','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4869,'4312476','Morro Reuter','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4870,'4312500','Mostardas','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4871,'4312609','Muçum','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4872,'4312617','Muitos Capoes','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4873,'4312625','Muliterno','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4874,'4312658','Nao-Me-Toque','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4875,'4312674','Nicolau Vergueiro','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4876,'4312708','Nonoai','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4877,'4312757','Nova Alvorada','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4878,'4312807','Nova Araça','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4879,'4312906','Nova Bassano','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4880,'4312955','Nova Boa Vista','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4881,'4313003','Nova Brescia','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4882,'4313011','Nova Candelaria','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4883,'4313037','Nova Esperança do Sul','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4884,'4313060','Nova Hartz','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4885,'4313086','Nova Padua','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4886,'4313102','Nova Palma','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4887,'4313201','Nova Petropolis','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4888,'4313300','Nova Prata','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4889,'4313334','Nova Ramada','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4890,'4313359','Nova Roma do Sul','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4891,'4313375','Nova Santa Rita','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4892,'4313391','Novo Cabrais','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4893,'4313409','Novo Hamburgo','RS','2022-10-27 17:15:18','2022-10-27 17:15:18'),(4894,'4313425','Novo Machado','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4895,'4313441','Novo Tiradentes','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4896,'4313466','Novo Xingu','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4897,'4313490','Novo Barreiro','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4898,'4313508','Osorio','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4899,'4313607','Paim Filho','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4900,'4313656','Palmares do Sul','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4901,'4313706','Palmeira das Missoes','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4902,'4313805','Palmitinho','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4903,'4313904','Panambi','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4904,'4313953','Pantano Grande','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4905,'4314001','Parai','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4906,'4314027','Paraiso do Sul','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4907,'4314035','Pareci Novo','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4908,'4314050','Parobe','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4909,'4314068','Passa Sete','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4910,'4314076','Passo do Sobrado','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4911,'4314100','Passo Fundo','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4912,'4314134','Paulo Bento','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4913,'4314159','Paverama','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4914,'4314175','Pedras Altas','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4915,'4314209','Pedro Osorio','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4916,'4314308','Pejuçara','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4917,'4314407','Pelotas','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4918,'4314423','Picada Cafe','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4919,'4314456','Pinhal','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4920,'4314464','Pinhal da Serra','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4921,'4314472','Pinhal Grande','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4922,'4314498','Pinheirinho do Vale','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4923,'4314506','Pinheiro Machado','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4924,'4314548','Pinto Bandeira','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4925,'4314555','Pirapo','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4926,'4314605','Piratini','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4927,'4314704','Planalto','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4928,'4314753','Poço das Antas','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4929,'4314779','Pontao','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4930,'4314787','Ponte Preta','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4931,'4314803','Portao','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4932,'4314902','Porto Alegre','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4933,'4315008','Porto Lucena','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4934,'4315057','Porto Maua','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4935,'4315073','Porto Vera Cruz','RS','2022-10-27 17:15:19','2022-10-27 17:15:19'),(4936,'4315107','Porto Xavier','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4937,'4315131','Pouso Novo','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4938,'4315149','Presidente Lucena','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4939,'4315156','Progresso','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4940,'4315172','Protasio Alves','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4941,'4315206','Putinga','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4942,'4315305','Quarai','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4943,'4315313','Quatro Irmaos','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4944,'4315321','Quevedos','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4945,'4315354','Quinze de Novembro','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4946,'4315404','Redentora','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4947,'4315453','Relvado','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4948,'4315503','Restinga Seca','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4949,'4315552','Rio dos indios','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4950,'4315602','Rio Grande','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4951,'4315701','Rio Pardo','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4952,'4315750','Riozinho','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4953,'4315800','Roca Sales','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4954,'4315909','Rodeio Bonito','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4955,'4315958','Rolador','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4956,'4316006','Rolante','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4957,'4316105','Ronda Alta','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4958,'4316204','Rondinha','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4959,'4316303','Roque Gonzales','RS','2022-10-27 17:15:20','2022-10-27 17:15:20'),(4960,'4316402','Rosario do Sul','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4961,'4316428','Sagrada Familia','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4962,'4316436','Saldanha Marinho','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4963,'4316451','Salto do Jacui','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4964,'4316477','Salvador das Missoes','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4965,'4316501','Salvador do Sul','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4966,'4316600','Sananduva','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4967,'4316709','Santa Barbara do Sul','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4968,'4316733','Santa Cecilia do Sul','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4969,'4316758','Santa Clara do Sul','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4970,'4316808','Santa Cruz do Sul','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4971,'4316907','Santa Maria','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4972,'4316956','Santa Maria do Herval','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4973,'4316972','Santa Margarida do Sul','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4974,'4317004','Santana da Boa Vista','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4975,'4317103','Sant\'Ana do Livramento','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4976,'4317202','Santa Rosa','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4977,'4317251','Santa Tereza','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4978,'4317301','Santa Vitoria do Palmar','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4979,'4317400','Santiago','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4980,'4317509','Santo Ângelo','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4981,'4317558','Santo Antônio do Palma','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4982,'4317608','Santo Antônio da Patrulha','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4983,'4317707','Santo Antônio das Missoes','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4984,'4317756','Santo Antônio do Planalto','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4985,'4317806','Santo Augusto','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4986,'4317905','Santo Cristo','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4987,'4317954','Santo Expedito do Sul','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4988,'4318002','Sao Borja','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4989,'4318051','Sao Domingos do Sul','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4990,'4318101','Sao Francisco de Assis','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4991,'4318200','Sao Francisco de Paula','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4992,'4318309','Sao Gabriel','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4993,'4318408','Sao Jerônimo','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4994,'4318424','Sao Joao da Urtiga','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4995,'4318432','Sao Joao do Polêsine','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4996,'4318440','Sao Jorge','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4997,'4318457','Sao Jose das Missoes','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4998,'4318465','Sao Jose do Herval','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(4999,'4318481','Sao Jose do Hortêncio','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(5000,'4318499','Sao Jose do Inhacora','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(5001,'4318507','Sao Jose do Norte','RS','2022-10-27 17:15:21','2022-10-27 17:15:21'),(5002,'4318606','Sao Jose do Ouro','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5003,'4318614','Sao Jose do Sul','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5004,'4318622','Sao Jose dos Ausentes','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5005,'4318705','Sao Leopoldo','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5006,'4318804','Sao Lourenço do Sul','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5007,'4318903','Sao Luiz Gonzaga','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5008,'4319000','Sao Marcos','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5009,'4319109','Sao Martinho','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5010,'4319125','Sao Martinho da Serra','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5011,'4319158','Sao Miguel das Missoes','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5012,'4319208','Sao Nicolau','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5013,'4319307','Sao Paulo das Missoes','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5014,'4319356','Sao Pedro da Serra','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5015,'4319364','Sao Pedro das Missoes','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5016,'4319372','Sao Pedro do Butia','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5017,'4319406','Sao Pedro do Sul','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5018,'4319505','Sao Sebastiao do Cai','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5019,'4319604','Sao Sepe','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5020,'4319703','Sao Valentim','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5021,'4319711','Sao Valentim do Sul','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5022,'4319737','Sao Valerio do Sul','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5023,'4319752','Sao Vendelino','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5024,'4319802','Sao Vicente do Sul','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5025,'4319901','Sapiranga','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5026,'4320008','Sapucaia do Sul','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5027,'4320107','Sarandi','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5028,'4320206','Seberi','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5029,'4320230','Sede Nova','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5030,'4320263','Segredo','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5031,'4320305','Selbach','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5032,'4320321','Senador Salgado Filho','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5033,'4320354','Sentinela do Sul','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5034,'4320404','Serafina Corrêa','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5035,'4320453','Serio','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5036,'4320503','Sertao','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5037,'4320552','Sertao Santana','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5038,'4320578','Sete de Setembro','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5039,'4320602','Severiano de Almeida','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5040,'4320651','Silveira Martins','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5041,'4320677','Sinimbu','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5042,'4320701','Sobradinho','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5043,'4320800','Soledade','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5044,'4320859','Tabai','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5045,'4320909','Tapejara','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5046,'4321006','Tapera','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5047,'4321105','Tapes','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5048,'4321204','Taquara','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5049,'4321303','Taquari','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5050,'4321329','Taquaruçu do Sul','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5051,'4321352','Tavares','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5052,'4321402','Tenente Portela','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5053,'4321436','Terra de Areia','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5054,'4321451','Teutônia','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5055,'4321469','Tio Hugo','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5056,'4321477','Tiradentes do Sul','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5057,'4321493','Toropi','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5058,'4321501','Torres','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5059,'4321600','Tramandai','RS','2022-10-27 17:15:22','2022-10-27 17:15:22'),(5060,'4321626','Travesseiro','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5061,'4321634','Três Arroios','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5062,'4321667','Três Cachoeiras','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5063,'4321709','Três Coroas','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5064,'4321808','Três de Maio','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5065,'4321832','Três Forquilhas','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5066,'4321857','Três Palmeiras','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5067,'4321907','Três Passos','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5068,'4321956','Trindade do Sul','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5069,'4322004','Triunfo','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5070,'4322103','Tucunduva','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5071,'4322152','Tunas','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5072,'4322186','Tupanci do Sul','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5073,'4322202','Tupancireta','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5074,'4322251','Tupandi','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5075,'4322301','Tuparendi','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5076,'4322327','Turuçu','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5077,'4322343','Ubiretama','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5078,'4322350','Uniao da Serra','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5079,'4322376','Unistalda','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5080,'4322400','Uruguaiana','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5081,'4322509','Vacaria','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5082,'4322525','Vale Verde','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5083,'4322533','Vale do Sol','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5084,'4322541','Vale Real','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5085,'4322558','Vanini','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5086,'4322608','Venâncio Aires','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5087,'4322707','Vera Cruz','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5088,'4322806','Veranopolis','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5089,'4322855','Vespasiano Correa','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5090,'4322905','Viadutos','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5091,'4323002','Viamao','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5092,'4323101','Vicente Dutra','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5093,'4323200','Victor Graeff','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5094,'4323309','Vila Flores','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5095,'4323358','Vila Lângaro','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5096,'4323408','Vila Maria','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5097,'4323457','Vila Nova do Sul','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5098,'4323507','Vista Alegre','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5099,'4323606','Vista Alegre do Prata','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5100,'4323705','Vista Gaucha','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5101,'4323754','Vitoria das Missoes','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5102,'4323770','Westfalia','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5103,'4323804','Xangri-la','RS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5104,'5000203','agua Clara','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5105,'5000252','Alcinopolis','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5106,'5000609','Amambai','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5107,'5000708','Anastacio','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5108,'5000807','Anaurilândia','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5109,'5000856','Angelica','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5110,'5000906','Antônio Joao','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5111,'5001003','Aparecida do Taboado','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5112,'5001102','Aquidauana','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5113,'5001243','Aral Moreira','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5114,'5001508','Bandeirantes','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5115,'5001904','Bataguassu','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5116,'5002001','Bataypora','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5117,'5002100','Bela Vista','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5118,'5002159','Bodoquena','MS','2022-10-27 17:15:23','2022-10-27 17:15:23'),(5119,'5002209','Bonito','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5120,'5002308','Brasilândia','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5121,'5002407','Caarapo','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5122,'5002605','Camapua','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5123,'5002704','Campo Grande','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5124,'5002803','Caracol','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5125,'5002902','Cassilândia','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5126,'5002951','Chapadao do Sul','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5127,'5003108','Corguinho','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5128,'5003157','Coronel Sapucaia','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5129,'5003207','Corumba','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5130,'5003256','Costa Rica','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5131,'5003306','Coxim','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5132,'5003454','Deodapolis','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5133,'5003488','Dois Irmaos do Buriti','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5134,'5003504','Douradina','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5135,'5003702','Dourados','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5136,'5003751','Eldorado','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5137,'5003801','Fatima do Sul','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5138,'5003900','Figueirao','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5139,'5004007','Gloria de Dourados','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5140,'5004106','Guia Lopes da Laguna','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5141,'5004304','Iguatemi','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5142,'5004403','Inocência','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5143,'5004502','Itapora','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5144,'5004601','Itaquirai','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5145,'5004700','Ivinhema','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5146,'5004809','Japora','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5147,'5004908','Jaraguari','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5148,'5005004','Jardim','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5149,'5005103','Jatei','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5150,'5005152','Juti','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5151,'5005202','Ladario','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5152,'5005251','Laguna Carapa','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5153,'5005400','Maracaju','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5154,'5005608','Miranda','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5155,'5005681','Mundo Novo','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5156,'5005707','Navirai','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5157,'5005806','Nioaque','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5158,'5006002','Nova Alvorada do Sul','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5159,'5006200','Nova Andradina','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5160,'5006259','Novo Horizonte do Sul','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5161,'5006275','Paraiso das aguas','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5162,'5006309','Paranaiba','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5163,'5006358','Paranhos','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5164,'5006408','Pedro Gomes','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5165,'5006606','Ponta Pora','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5166,'5006903','Porto Murtinho','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5167,'5007109','Ribas do Rio Pardo','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5168,'5007208','Rio Brilhante','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5169,'5007307','Rio Negro','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5170,'5007406','Rio Verde de Mato Grosso','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5171,'5007505','Rochedo','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5172,'5007554','Santa Rita do Pardo','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5173,'5007695','Sao Gabriel do Oeste','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5174,'5007703','Sete Quedas','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5175,'5007802','Selviria','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5176,'5007901','Sidrolândia','MS','2022-10-27 17:15:24','2022-10-27 17:15:24'),(5177,'5007935','Sonora','MS','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5178,'5007950','Tacuru','MS','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5179,'5007976','Taquarussu','MS','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5180,'5008008','Terenos','MS','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5181,'5008305','Três Lagoas','MS','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5182,'5008404','Vicentina','MS','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5183,'5100102','Acorizal','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5184,'5100201','agua Boa','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5185,'5100250','Alta Floresta','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5186,'5100300','Alto Araguaia','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5187,'5100359','Alto Boa Vista','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5188,'5100409','Alto Garças','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5189,'5100508','Alto Paraguai','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5190,'5100607','Alto Taquari','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5191,'5100805','Apiacas','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5192,'5101001','Araguaiana','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5193,'5101209','Araguainha','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5194,'5101258','Araputanga','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5195,'5101308','Arenapolis','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5196,'5101407','Aripuana','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5197,'5101605','Barao de Melgaço','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5198,'5101704','Barra do Bugres','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5199,'5101803','Barra do Garças','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5200,'5101852','Bom Jesus do Araguaia','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5201,'5101902','Brasnorte','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5202,'5102504','Caceres','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5203,'5102603','Campinapolis','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5204,'5102637','Campo Novo do Parecis','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5205,'5102678','Campo Verde','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5206,'5102686','Campos de Julio','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5207,'5102694','Canabrava do Norte','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5208,'5102702','Canarana','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5209,'5102793','Carlinda','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5210,'5102850','Castanheira','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5211,'5103007','Chapada dos Guimaraes','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5212,'5103056','Claudia','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5213,'5103106','Cocalinho','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5214,'5103205','Colider','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5215,'5103254','Colniza','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5216,'5103304','Comodoro','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5217,'5103353','Confresa','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5218,'5103361','Conquista D\'Oeste','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5219,'5103379','Cotriguaçu','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5220,'5103403','Cuiaba','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5221,'5103437','Curvelândia','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5222,'5103452','Denise','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5223,'5103502','Diamantino','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5224,'5103601','Dom Aquino','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5225,'5103700','Feliz Natal','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5226,'5103809','Figueiropolis D\'Oeste','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5227,'5103858','Gaucha do Norte','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5228,'5103908','General Carneiro','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5229,'5103957','Gloria D\'Oeste','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5230,'5104104','Guaranta do Norte','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5231,'5104203','Guiratinga','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5232,'5104500','Indiavai','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5233,'5104526','Ipiranga do Norte','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5234,'5104542','Itanhanga','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5235,'5104559','Itauba','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5236,'5104609','Itiquira','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5237,'5104807','Jaciara','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5238,'5104906','Jangada','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5239,'5105002','Jauru','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5240,'5105101','Juara','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5241,'5105150','Juina','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5242,'5105176','Juruena','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5243,'5105200','Juscimeira','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5244,'5105234','Lambari D\'Oeste','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5245,'5105259','Lucas do Rio Verde','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5246,'5105309','Luciara','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5247,'5105507','Vila Bela da Santissima Trindade','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5248,'5105580','Marcelândia','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5249,'5105606','Matupa','MT','2022-10-27 17:15:25','2022-10-27 17:15:25'),(5250,'5105622','Mirassol D\'Oeste','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5251,'5105903','Nobres','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5252,'5106000','Nortelândia','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5253,'5106109','Nossa Senhora do Livramento','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5254,'5106158','Nova Bandeirantes','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5255,'5106174','Nova Nazare','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5256,'5106182','Nova Lacerda','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5257,'5106190','Nova Santa Helena','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5258,'5106208','Nova Brasilândia','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5259,'5106216','Nova Canaa do Norte','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5260,'5106224','Nova Mutum','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5261,'5106232','Nova Olimpia','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5262,'5106240','Nova Ubirata','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5263,'5106257','Nova Xavantina','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5264,'5106265','Novo Mundo','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5265,'5106273','Novo Horizonte do Norte','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5266,'5106281','Novo Sao Joaquim','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5267,'5106299','Paranaita','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5268,'5106307','Paranatinga','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5269,'5106315','Novo Santo Antônio','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5270,'5106372','Pedra Preta','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5271,'5106422','Peixoto de Azevedo','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5272,'5106455','Planalto da Serra','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5273,'5106505','Pocone','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5274,'5106653','Pontal do Araguaia','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5275,'5106703','Ponte Branca','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5276,'5106752','Pontes e Lacerda','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5277,'5106778','Porto Alegre do Norte','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5278,'5106802','Porto dos Gauchos','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5279,'5106828','Porto Esperidiao','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5280,'5106851','Porto Estrela','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5281,'5107008','Poxoreo','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5282,'5107040','Primavera do Leste','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5283,'5107065','Querência','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5284,'5107107','Sao Jose dos Quatro Marcos','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5285,'5107156','Reserva do Cabaçal','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5286,'5107180','Ribeirao Cascalheira','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5287,'5107198','Ribeiraozinho','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5288,'5107206','Rio Branco','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5289,'5107248','Santa Carmem','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5290,'5107263','Santo Afonso','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5291,'5107297','Sao Jose do Povo','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5292,'5107305','Sao Jose do Rio Claro','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5293,'5107354','Sao Jose do Xingu','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5294,'5107404','Sao Pedro da Cipa','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5295,'5107578','Rondolândia','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5296,'5107602','Rondonopolis','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5297,'5107701','Rosario Oeste','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5298,'5107743','Santa Cruz do Xingu','MT','2022-10-27 17:15:26','2022-10-27 17:15:26'),(5299,'5107750','Salto do Ceu','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5300,'5107768','Santa Rita do Trivelato','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5301,'5107776','Santa Terezinha','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5302,'5107792','Santo Antônio do Leste','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5303,'5107800','Santo Antônio do Leverger','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5304,'5107859','Sao Felix do Araguaia','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5305,'5107875','Sapezal','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5306,'5107883','Serra Nova Dourada','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5307,'5107909','Sinop','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5308,'5107925','Sorriso','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5309,'5107941','Tabapora','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5310,'5107958','Tangara da Serra','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5311,'5108006','Tapurah','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5312,'5108055','Terra Nova do Norte','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5313,'5108105','Tesouro','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5314,'5108204','Torixoreu','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5315,'5108303','Uniao do Sul','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5316,'5108352','Vale de Sao Domingos','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5317,'5108402','Varzea Grande','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5318,'5108501','Vera','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5319,'5108600','Vila Rica','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5320,'5108808','Nova Guarita','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5321,'5108857','Nova Marilândia','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5322,'5108907','Nova Maringa','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5323,'5108956','Nova Monte Verde','MT','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5324,'5200050','Abadia de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5325,'5200100','Abadiânia','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5326,'5200134','Acreuna','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5327,'5200159','Adelândia','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5328,'5200175','agua Fria de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5329,'5200209','agua Limpa','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5330,'5200258','aguas Lindas de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5331,'5200308','Alexânia','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5332,'5200506','Aloândia','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5333,'5200555','Alto Horizonte','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5334,'5200605','Alto Paraiso de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5335,'5200803','Alvorada do Norte','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5336,'5200829','Amaralina','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5337,'5200852','Americano do Brasil','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5338,'5200902','Amorinopolis','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5339,'5201108','Anapolis','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5340,'5201207','Anhanguera','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5341,'5201306','Anicuns','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5342,'5201405','Aparecida de Goiânia','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5343,'5201454','Aparecida do Rio Doce','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5344,'5201504','Apore','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5345,'5201603','Araçu','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5346,'5201702','Aragarças','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5347,'5201801','Aragoiânia','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5348,'5202155','Araguapaz','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5349,'5202353','Arenopolis','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5350,'5202502','Aruana','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5351,'5202601','Aurilândia','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5352,'5202809','Avelinopolis','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5353,'5203104','Baliza','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5354,'5203203','Barro Alto','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5355,'5203302','Bela Vista de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5356,'5203401','Bom Jardim de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5357,'5203500','Bom Jesus de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5358,'5203559','Bonfinopolis','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5359,'5203575','Bonopolis','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5360,'5203609','Brazabrantes','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5361,'5203807','Britânia','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5362,'5203906','Buriti Alegre','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5363,'5203939','Buriti de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5364,'5203962','Buritinopolis','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5365,'5204003','Cabeceiras','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5366,'5204102','Cachoeira Alta','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5367,'5204201','Cachoeira de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5368,'5204250','Cachoeira Dourada','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5369,'5204300','Caçu','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5370,'5204409','Caiapônia','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5371,'5204508','Caldas Novas','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5372,'5204557','Caldazinha','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5373,'5204607','Campestre de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5374,'5204656','Campinaçu','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5375,'5204706','Campinorte','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5376,'5204805','Campo Alegre de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5377,'5204854','Campo Limpo de Goias','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5378,'5204904','Campos Belos','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5379,'5204953','Campos Verdes','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5380,'5205000','Carmo do Rio Verde','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5381,'5205059','Castelândia','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5382,'5205109','Catalao','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5383,'5205208','Caturai','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5384,'5205307','Cavalcante','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5385,'5205406','Ceres','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5386,'5205455','Cezarina','GO','2022-10-27 17:15:27','2022-10-27 17:15:27'),(5387,'5205471','Chapadao do Ceu','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5388,'5205497','cidades Ocidental','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5389,'5205513','Cocalzinho de Goias','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5390,'5205521','Colinas do Sul','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5391,'5205703','Corrego do Ouro','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5392,'5205802','Corumba de Goias','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5393,'5205901','Corumbaiba','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5394,'5206206','Cristalina','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5395,'5206305','Cristianopolis','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5396,'5206404','Crixas','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5397,'5206503','Crominia','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5398,'5206602','Cumari','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5399,'5206701','Damianopolis','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5400,'5206800','Damolândia','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5401,'5206909','Davinopolis','GO','2022-10-27 17:15:28','2022-10-27 17:15:28'),(5402,'5207105','Diorama','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5403,'5207253','Doverlândia','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5404,'5207352','Edealina','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5405,'5207402','Edeia','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5406,'5207501','Estrela do Norte','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5407,'5207535','Faina','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5408,'5207600','Fazenda Nova','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5409,'5207808','Firminopolis','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5410,'5207907','Flores de Goias','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5411,'5208004','Formosa','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5412,'5208103','Formoso','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5413,'5208152','Gameleira de Goias','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5414,'5208301','Divinopolis de Goias','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5415,'5208400','Goianapolis','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5416,'5208509','Goiandira','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5417,'5208608','Goianesia','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5418,'5208707','Goiânia','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5419,'5208806','Goianira','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5420,'5208905','Goias','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5421,'5209101','Goiatuba','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5422,'5209150','Gouvelândia','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5423,'5209200','Guapo','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5424,'5209291','Guaraita','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5425,'5209408','Guarani de Goias','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5426,'5209457','Guarinos','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5427,'5209606','Heitorai','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5428,'5209705','Hidrolândia','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5429,'5209804','Hidrolina','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5430,'5209903','Iaciara','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5431,'5209937','Inaciolândia','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5432,'5209952','Indiara','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5433,'5210000','Inhumas','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5434,'5210109','Ipameri','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5435,'5210158','Ipiranga de Goias','GO','2022-10-27 17:15:29','2022-10-27 17:15:29'),(5436,'5210208','Ipora','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5437,'5210307','Israelândia','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5438,'5210406','Itaberai','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5439,'5210562','Itaguari','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5440,'5210604','Itaguaru','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5441,'5210802','Itaja','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5442,'5210901','Itapaci','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5443,'5211008','Itapirapua','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5444,'5211206','Itapuranga','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5445,'5211305','Itaruma','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5446,'5211404','Itauçu','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5447,'5211503','Itumbiara','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5448,'5211602','Ivolândia','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5449,'5211701','Jandaia','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5450,'5211800','Jaragua','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5451,'5211909','Jatai','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5452,'5212006','Jaupaci','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5453,'5212055','Jesupolis','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5454,'5212105','Joviânia','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5455,'5212204','Jussara','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5456,'5212253','Lagoa Santa','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5457,'5212303','Leopoldo de Bulhoes','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5458,'5212501','Luziânia','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5459,'5212600','Mairipotaba','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5460,'5212709','Mambai','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5461,'5212808','Mara Rosa','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5462,'5212907','Marzagao','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5463,'5212956','Matrincha','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5464,'5213004','Maurilândia','GO','2022-10-27 17:15:30','2022-10-27 17:15:30'),(5465,'5213053','Mimoso de Goias','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5466,'5213087','Minaçu','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5467,'5213103','Mineiros','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5468,'5213400','Moipora','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5469,'5213509','Monte Alegre de Goias','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5470,'5213707','Montes Claros de Goias','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5471,'5213756','Montividiu','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5472,'5213772','Montividiu do Norte','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5473,'5213806','Morrinhos','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5474,'5213855','Morro Agudo de Goias','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5475,'5213905','Mossâmedes','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5476,'5214002','Mozarlândia','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5477,'5214051','Mundo Novo','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5478,'5214101','Mutunopolis','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5479,'5214408','Nazario','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5480,'5214507','Neropolis','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5481,'5214606','Niquelândia','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5482,'5214705','Nova America','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5483,'5214804','Nova Aurora','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5484,'5214838','Nova Crixas','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5485,'5214861','Nova Gloria','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5486,'5214879','Nova Iguaçu de Goias','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5487,'5214903','Nova Roma','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5488,'5215009','Nova Veneza','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5489,'5215207','Novo Brasil','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5490,'5215231','Novo Gama','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5491,'5215256','Novo Planalto','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5492,'5215306','Orizona','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5493,'5215405','Ouro Verde de Goias','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5494,'5215504','Ouvidor','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5495,'5215603','Padre Bernardo','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5496,'5215652','Palestina de Goias','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5497,'5215702','Palmeiras de Goias','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5498,'5215801','Palmelo','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5499,'5215900','Palminopolis','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5500,'5216007','Panama','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5501,'5216304','Paranaiguara','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5502,'5216403','Parauna','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5503,'5216452','Perolândia','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5504,'5216809','Petrolina de Goias','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5505,'5216908','Pilar de Goias','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5506,'5217104','Piracanjuba','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5507,'5217203','Piranhas','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5508,'5217302','Pirenopolis','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5509,'5217401','Pires do Rio','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5510,'5217609','Planaltina','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5511,'5217708','Pontalina','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5512,'5218003','Porangatu','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5513,'5218052','Porteirao','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5514,'5218102','Portelândia','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5515,'5218300','Posse','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5516,'5218391','Professor Jamil','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5517,'5218508','Quirinopolis','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5518,'5218607','Rialma','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5519,'5218706','Rianapolis','GO','2022-10-27 17:15:31','2022-10-27 17:15:31'),(5520,'5218789','Rio Quente','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5521,'5218805','Rio Verde','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5522,'5218904','Rubiataba','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5523,'5219001','Sanclerlândia','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5524,'5219100','Santa Barbara de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5525,'5219209','Santa Cruz de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5526,'5219258','Santa Fe de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5527,'5219308','Santa Helena de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5528,'5219357','Santa Isabel','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5529,'5219407','Santa Rita do Araguaia','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5530,'5219456','Santa Rita do Novo Destino','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5531,'5219506','Santa Rosa de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5532,'5219605','Santa Tereza de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5533,'5219704','Santa Terezinha de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5534,'5219712','Santo Antônio da Barra','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5535,'5219738','Santo Antônio de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5536,'5219753','Santo Antônio do Descoberto','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5537,'5219803','Sao Domingos','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5538,'5219902','Sao Francisco de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5539,'5220009','Sao Joao D\'Aliança','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5540,'5220058','Sao Joao da Parauna','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5541,'5220108','Sao Luis de Montes Belos','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5542,'5220157','Sao Luiz do Norte','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5543,'5220207','Sao Miguel do Araguaia','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5544,'5220264','Sao Miguel do Passa Quatro','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5545,'5220280','Sao Patricio','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5546,'5220405','Sao Simao','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5547,'5220454','Senador Canedo','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5548,'5220504','Serranopolis','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5549,'5220603','Silvânia','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5550,'5220686','Simolândia','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5551,'5220702','Sitio D\'Abadia','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5552,'5221007','Taquaral de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5553,'5221080','Teresina de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5554,'5221197','Terezopolis de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5555,'5221304','Três Ranchos','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5556,'5221403','Trindade','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5557,'5221452','Trombas','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5558,'5221502','Turvânia','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5559,'5221551','Turvelândia','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5560,'5221577','Uirapuru','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5561,'5221601','Uruaçu','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5562,'5221700','Uruana','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5563,'5221809','Urutai','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5564,'5221858','Valparaiso de Goias','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5565,'5221908','Varjao','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5566,'5222005','Vianopolis','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5567,'5222054','Vicentinopolis','GO','2022-10-27 17:15:32','2022-10-27 17:15:32'),(5568,'5222203','Vila Boa','GO','2022-10-27 17:15:33','2022-10-27 17:15:33'),(5569,'5222302','Vila Propicio','GO','2022-10-27 17:15:33','2022-10-27 17:15:33'),(5570,'5300108','Brasilia','DF','2022-10-27 17:15:33','2022-10-27 17:15:33');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciots`
--

DROP TABLE IF EXISTS `ciots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ciots_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `ciots_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciots`
--

LOCK TABLES `ciots` WRITE;
/*!40000 ALTER TABLE `ciots` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_deliveries`
--

DROP TABLE IF EXISTS `cliente_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobre_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` int NOT NULL,
  `data_token` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` tinyint(1) NOT NULL,
  `referencia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_deliveries`
--

LOCK TABLES `cliente_deliveries` WRITE;
/*!40000 ALTER TABLE `cliente_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_ecommerces`
--

DROP TABLE IF EXISTS `cliente_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobre_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_ecommerces`
--

LOCK TABLES `cliente_ecommerces` WRITE;
/*!40000 ALTER TABLE `cliente_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000.000.000-00',
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie_rg` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `consumidor_final` int NOT NULL,
  `contribuinte` int NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `limite_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rua_cobranca` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_cobranca` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro_cobranca` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_cobranca` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_cobranca_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_cidade_id_foreign` (`cidade_id`),
  KEY `clientes_cidade_cobranca_id_foreign` (`cidade_cobranca_id`),
  CONSTRAINT `clientes_cidade_cobranca_id_foreign` FOREIGN KEY (`cidade_cobranca_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `clientes_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigo_descontos`
--

DROP TABLE IF EXISTS `codigo_descontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigo_descontos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` int NOT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `push` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_descontos_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `codigo_descontos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigo_descontos`
--

LOCK TABLES `codigo_descontos` WRITE;
/*!40000 ALTER TABLE `codigo_descontos` DISABLE KEYS */;
/*!40000 ALTER TABLE `codigo_descontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comissao_vendas`
--

DROP TABLE IF EXISTS `comissao_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comissao_vendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` int unsigned DEFAULT NULL,
  `venda_id` int NOT NULL,
  `tabela` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comissao_vendas_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `comissao_vendas_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comissao_vendas`
--

LOCK TABLES `comissao_vendas` WRITE;
/*!40000 ALTER TABLE `comissao_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `comissao_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complemento_deliveries`
--

DROP TABLE IF EXISTS `complemento_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complemento_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `categoria_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complemento_deliveries_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `complemento_deliveries_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_adicionals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complemento_deliveries`
--

LOCK TABLES `complemento_deliveries` WRITE;
/*!40000 ALTER TABLE `complemento_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `complemento_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componente_ctes`
--

DROP TABLE IF EXISTS `componente_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `cte_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `componente_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `componente_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente_ctes`
--

LOCK TABLES `componente_ctes` WRITE;
/*!40000 ALTER TABLE `componente_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `componente_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xml_path` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nf` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_emissao` int NOT NULL,
  `estado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `dfe_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compras_fornecedor_id_foreign` (`fornecedor_id`),
  KEY `compras_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `compras_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compras_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_caixas`
--

DROP TABLE IF EXISTS `config_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `finalizar` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reiniciar` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editar_desconto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editar_acrescimo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editar_observacao` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setar_valor_recebido` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_dinheiro` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_debito` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_credito` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_pix` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setar_leitor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_recebido_automatico` tinyint(1) NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `impressora_modelo` int NOT NULL DEFAULT '80',
  `modelo_pdv` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `config_caixas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `config_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_caixas`
--

LOCK TABLES `config_caixas` WRITE;
/*!40000 ALTER TABLE `config_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_ecommerces`
--

DROP TABLE IF EXISTS `config_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_facebook` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_twiter` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_instagram` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frete_gratis_valor` decimal(10,2) NOT NULL,
  `mercadopago_public_key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mercadopago_access_token` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionamento` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `politica_privacidade` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_mapa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor_principal` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tema_ecommerce` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_api` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_ecommerces`
--

LOCK TABLES `config_ecommerces` WRITE;
/*!40000 ALTER TABLE `config_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_notas`
--

DROP TABLE IF EXISTS `config_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_notas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipio` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codPais` int NOT NULL,
  `codMun` int NOT NULL,
  `UF` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_CSOSN_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_COFINS_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_PIS_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_IPI_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frete_padrao` int NOT NULL,
  `tipo_pagamento_padrao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nat_op_padrao` int NOT NULL,
  `ambiente` int NOT NULL,
  `cUF` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_serie_nfe` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_serie_nfce` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultimo_numero_nfe` int NOT NULL,
  `ultimo_numero_nfce` int NOT NULL,
  `ultimo_numero_cte` int NOT NULL,
  `ultimo_numero_mdfe` int NOT NULL,
  `csc` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csc_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificado_a3` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_notas`
--

LOCK TABLES `config_notas` WRITE;
/*!40000 ALTER TABLE `config_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_pagars`
--

DROP TABLE IF EXISTS `conta_pagars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_pagars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `compra_id` int unsigned DEFAULT NULL,
  `categoria_id` int unsigned NOT NULL,
  `referencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date_register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_vencimento` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conta_pagars_compra_id_foreign` (`compra_id`),
  KEY `conta_pagars_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `conta_pagars_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_contas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conta_pagars_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_pagars`
--

LOCK TABLES `conta_pagars` WRITE;
/*!40000 ALTER TABLE `conta_pagars` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_pagars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_recebers`
--

DROP TABLE IF EXISTS `conta_recebers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_recebers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `venda_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `categoria_id` int unsigned NOT NULL,
  `referencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_recebido` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date_register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_vencimento` date NOT NULL,
  `data_recebimento` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conta_recebers_venda_id_foreign` (`venda_id`),
  KEY `conta_recebers_usuario_id_foreign` (`usuario_id`),
  KEY `conta_recebers_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `conta_recebers_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_contas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conta_recebers_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conta_recebers_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_recebers`
--

LOCK TABLES `conta_recebers` WRITE;
/*!40000 ALTER TABLE `conta_recebers` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_recebers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_ecommerces`
--

DROP TABLE IF EXISTS `contato_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_ecommerces`
--

LOCK TABLES `contato_ecommerces` WRITE;
/*!40000 ALTER TABLE `contato_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_funcionarios`
--

DROP TABLE IF EXISTS `contato_funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_funcionarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionario_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contato_funcionarios_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `contato_funcionarios_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_funcionarios`
--

LOCK TABLES `contato_funcionarios` WRITE;
/*!40000 ALTER TABLE `contato_funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato_funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotacaos`
--

DROP TABLE IF EXISTS `cotacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotacaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int unsigned NOT NULL,
  `forma_pagamento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsavel` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resposta` tinyint(1) NOT NULL,
  `ativa` tinyint(1) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `escolhida` tinyint(1) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cotacaos_fornecedor_id_foreign` (`fornecedor_id`),
  CONSTRAINT `cotacaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotacaos`
--

LOCK TABLES `cotacaos` WRITE;
/*!40000 ALTER TABLE `cotacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito_vendas`
--

DROP TABLE IF EXISTS `credito_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credito_vendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `venda_id` int unsigned NOT NULL,
  `cliente_id` int unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credito_vendas_venda_id_foreign` (`venda_id`),
  KEY `credito_vendas_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `credito_vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `credito_vendas_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito_vendas`
--

LOCK TABLES `credito_vendas` WRITE;
/*!40000 ALTER TABLE `credito_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctes`
--

DROP TABLE IF EXISTS `ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `chave_nfe` varchar(450) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remetente_id` int unsigned NOT NULL,
  `destinatario_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned NOT NULL,
  `tomador` int NOT NULL,
  `municipio_envio` int unsigned NOT NULL,
  `municipio_inicio` int unsigned NOT NULL,
  `municipio_fim` int unsigned NOT NULL,
  `logradouro_tomador` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_tomador` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro_tomador` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep_tomador` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipio_tomador` int unsigned DEFAULT NULL,
  `valor_transporte` decimal(10,2) NOT NULL,
  `valor_receber` decimal(10,2) NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `produto_predominante` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_previsata_entrega` date NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_cce` int NOT NULL,
  `cte_numero` int NOT NULL DEFAULT '0',
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_xml` varchar(51) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `retira` tinyint(1) NOT NULL,
  `detalhes_retira` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modal` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `veiculo_id` int unsigned NOT NULL,
  `tpDoc` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descOutros` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nDoc` int NOT NULL,
  `vDocFisc` decimal(10,2) NOT NULL,
  `globalizado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctes_remetente_id_foreign` (`remetente_id`),
  KEY `ctes_destinatario_id_foreign` (`destinatario_id`),
  KEY `ctes_usuario_id_foreign` (`usuario_id`),
  KEY `ctes_natureza_id_foreign` (`natureza_id`),
  KEY `ctes_municipio_envio_foreign` (`municipio_envio`),
  KEY `ctes_municipio_inicio_foreign` (`municipio_inicio`),
  KEY `ctes_municipio_fim_foreign` (`municipio_fim`),
  KEY `ctes_municipio_tomador_foreign` (`municipio_tomador`),
  KEY `ctes_veiculo_id_foreign` (`veiculo_id`),
  CONSTRAINT `ctes_destinatario_id_foreign` FOREIGN KEY (`destinatario_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ctes_municipio_envio_foreign` FOREIGN KEY (`municipio_envio`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_municipio_fim_foreign` FOREIGN KEY (`municipio_fim`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_municipio_inicio_foreign` FOREIGN KEY (`municipio_inicio`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_municipio_tomador_foreign` FOREIGN KEY (`municipio_tomador`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `ctes_remetente_id_foreign` FOREIGN KEY (`remetente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ctes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `ctes_veiculo_id_foreign` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctes`
--

LOCK TABLES `ctes` WRITE;
/*!40000 ALTER TABLE `ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curtida_produto_ecommerces`
--

DROP TABLE IF EXISTS `curtida_produto_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curtida_produto_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curtida_produto_ecommerces_produto_id_foreign` (`produto_id`),
  KEY `curtida_produto_ecommerces_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `curtida_produto_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `curtida_produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curtida_produto_ecommerces`
--

LOCK TABLES `curtida_produto_ecommerces` WRITE;
/*!40000 ALTER TABLE `curtida_produto_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `curtida_produto_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_configs`
--

DROP TABLE IF EXISTS `delivery_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_configs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `link_face` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_twiteer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_google` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_medio_entrega` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_maximo_cancelamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `nome_exibicao_web` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `politica_privacidade` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_km` decimal(10,2) NOT NULL,
  `entrega_gratis_ate` int NOT NULL,
  `maximo_km_entrega` int NOT NULL,
  `usar_bairros` tinyint(1) NOT NULL,
  `maximo_adicionais` int NOT NULL,
  `maximo_adicionais_pizza` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_configs`
--

LOCK TABLES `delivery_configs` WRITE;
/*!40000 ALTER TABLE `delivery_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa_ctes`
--

DROP TABLE IF EXISTS `despesa_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despesa_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` int unsigned NOT NULL,
  `cte_id` int unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `despesa_ctes_categoria_id_foreign` (`categoria_id`),
  KEY `despesa_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `despesa_ctes_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_despesa_ctes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `despesa_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa_ctes`
--

LOCK TABLES `despesa_ctes` WRITE;
/*!40000 ALTER TABLE `despesa_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `despesa_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucaos`
--

DROP TABLE IF EXISTS `devolucaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned NOT NULL,
  `transportadora_id` int unsigned DEFAULT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_devolvido` decimal(10,2) NOT NULL,
  `motivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` int NOT NULL,
  `devolucao_parcial` tinyint(1) NOT NULL,
  `chave_nf_entrada` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nNf` int NOT NULL,
  `tipo` int NOT NULL,
  `vFrete` decimal(10,2) NOT NULL,
  `vDesc` decimal(10,2) NOT NULL,
  `chave_gerada` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_gerado` int NOT NULL,
  `sequencia_cce` int NOT NULL DEFAULT '0',
  `transportadora_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_cidade` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_ie` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_endereco` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_quantidade` decimal(6,2) NOT NULL DEFAULT '0.00',
  `frete_especie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_marca` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_tipo` int NOT NULL DEFAULT '0',
  `veiculo_placa` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `veiculo_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_peso_bruto` decimal(10,3) NOT NULL DEFAULT '0.000',
  `frete_peso_liquido` decimal(10,3) NOT NULL DEFAULT '0.000',
  `despesa_acessorias` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devolucaos_fornecedor_id_foreign` (`fornecedor_id`),
  KEY `devolucaos_usuario_id_foreign` (`usuario_id`),
  KEY `devolucaos_natureza_id_foreign` (`natureza_id`),
  KEY `devolucaos_transportadora_id_foreign` (`transportadora_id`),
  CONSTRAINT `devolucaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`),
  CONSTRAINT `devolucaos_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `devolucaos_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`),
  CONSTRAINT `devolucaos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucaos`
--

LOCK TABLES `devolucaos` WRITE;
/*!40000 ALTER TABLE `devolucaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisao_grades`
--

DROP TABLE IF EXISTS `divisao_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisao_grades` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_divisao` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisao_grades`
--

LOCK TABLES `divisao_grades` WRITE;
/*!40000 ALTER TABLE `divisao_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `divisao_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dre_categorias`
--

DROP TABLE IF EXISTS `dre_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dre_categorias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dre_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dre_categorias_dre_id_foreign` (`dre_id`),
  CONSTRAINT `dre_categorias_dre_id_foreign` FOREIGN KEY (`dre_id`) REFERENCES `dres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dre_categorias`
--

LOCK TABLES `dre_categorias` WRITE;
/*!40000 ALTER TABLE `dre_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `dre_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dres`
--

DROP TABLE IF EXISTS `dres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dres` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `observacao` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentual_imposto` decimal(5,2) NOT NULL DEFAULT '0.00',
  `lucro_prejuizo` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dres`
--

LOCK TABLES `dres` WRITE;
/*!40000 ALTER TABLE `dres` DISABLE KEYS */;
/*!40000 ALTER TABLE `dres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_deliveries`
--

DROP TABLE IF EXISTS `endereco_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro_id` int NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `endereco_deliveries_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `endereco_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_deliveries`
--

LOCK TABLES `endereco_deliveries` WRITE;
/*!40000 ALTER TABLE `endereco_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_ecommerces`
--

DROP TABLE IF EXISTS `endereco_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `endereco_ecommerces_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `endereco_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_ecommerces`
--

LOCK TABLES `endereco_ecommerces` WRITE;
/*!40000 ALTER TABLE `endereco_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escritorio_contabils`
--

DROP TABLE IF EXISTS `escritorio_contabils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escritorio_contabils` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escritorio_contabils`
--

LOCK TABLES `escritorio_contabils` WRITE;
/*!40000 ALTER TABLE `escritorio_contabils` DISABLE KEYS */;
/*!40000 ALTER TABLE `escritorio_contabils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoques`
--

DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoques` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor_compra` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estoques_produto_id_foreign` (`produto_id`),
  CONSTRAINT `estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura_orcamentos`
--

DROP TABLE IF EXISTS `fatura_orcamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura_orcamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `orcamento_id` int unsigned DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fatura_orcamentos_orcamento_id_foreign` (`orcamento_id`),
  CONSTRAINT `fatura_orcamentos_orcamento_id_foreign` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura_orcamentos`
--

LOCK TABLES `fatura_orcamentos` WRITE;
/*!40000 ALTER TABLE `fatura_orcamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura_orcamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedors`
--

DROP TABLE IF EXISTS `fornecedors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie_rg` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fornecedors_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `fornecedors_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedors`
--

LOCK TABLES `fornecedors` WRITE;
/*!40000 ALTER TABLE `fornecedors` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fretes`
--

DROP TABLE IF EXISTS `fretes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fretes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `placa` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tipo` int NOT NULL,
  `qtdVolumes` int NOT NULL,
  `numeracaoVolumes` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `especie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso_liquido` decimal(8,3) NOT NULL,
  `peso_bruto` decimal(8,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fretes`
--

LOCK TABLES `fretes` WRITE;
/*!40000 ALTER TABLE `fretes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fretes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionamento_deliveries`
--

DROP TABLE IF EXISTS `funcionamento_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionamento_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `dia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inicio_expediente` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fim_expediente` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionamento_deliveries`
--

LOCK TABLES `funcionamento_deliveries` WRITE;
/*!40000 ALTER TABLE `funcionamento_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionamento_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario_os`
--

DROP TABLE IF EXISTS `funcionario_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario_os` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `ordem_servico_id` int unsigned NOT NULL,
  `funcionario_id` int unsigned NOT NULL,
  `funcao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_os_usuario_id_foreign` (`usuario_id`),
  KEY `funcionario_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  KEY `funcionario_os_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `funcionario_os_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `funcionario_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  CONSTRAINT `funcionario_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_os`
--

LOCK TABLES `funcionario_os` WRITE;
/*!40000 ALTER TABLE `funcionario_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000.000.000-00',
  `rg` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `data_registro` date NOT NULL,
  `percentual_comissao` decimal(6,2) NOT NULL DEFAULT '0.00',
  `salario` decimal(10,2) NOT NULL DEFAULT '0.00',
  `usuario_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionarios_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `funcionarios_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_b_p_t_s`
--

DROP TABLE IF EXISTS `i_b_p_t_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `i_b_p_t_s` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versao` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_b_p_t_s`
--

LOCK TABLES `i_b_p_t_s` WRITE;
/*!40000 ALTER TABLE `i_b_p_t_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_b_p_t_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagem_produto_ecommerces`
--

DROP TABLE IF EXISTS `imagem_produto_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagem_produto_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imagem_produto_ecommerces_produto_id_foreign` (`produto_id`),
  CONSTRAINT `imagem_produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagem_produto_ecommerces`
--

LOCK TABLES `imagem_produto_ecommerces` WRITE;
/*!40000 ALTER TABLE `imagem_produto_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagem_produto_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagens_produto_deliveries`
--

DROP TABLE IF EXISTS `imagens_produto_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagens_produto_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `path` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imagens_produto_deliveries_produto_id_foreign` (`produto_id`),
  CONSTRAINT `imagens_produto_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagens_produto_deliveries`
--

LOCK TABLES `imagens_produto_deliveries` WRITE;
/*!40000 ALTER TABLE `imagens_produto_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagens_produto_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_descargas`
--

DROP TABLE IF EXISTS `info_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_descargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `tp_unid_transp` int NOT NULL,
  `id_unid_transp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `info_descargas_mdfe_id_foreign` (`mdfe_id`),
  KEY `info_descargas_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `info_descargas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `info_descargas_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_descargas`
--

LOCK TABLES `info_descargas` WRITE;
/*!40000 ALTER TABLE `info_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informativo_ecommerces`
--

DROP TABLE IF EXISTS `informativo_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informativo_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informativo_ecommerces`
--

LOCK TABLES `informativo_ecommerces` WRITE;
/*!40000 ALTER TABLE `informativo_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `informativo_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_agendamentos`
--

DROP TABLE IF EXISTS `item_agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_agendamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `servico_id` int unsigned NOT NULL,
  `agendamento_id` int unsigned NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_agendamentos_servico_id_foreign` (`servico_id`),
  KEY `item_agendamentos_agendamento_id_foreign` (`agendamento_id`),
  CONSTRAINT `item_agendamentos_agendamento_id_foreign` FOREIGN KEY (`agendamento_id`) REFERENCES `agendamentos` (`id`),
  CONSTRAINT `item_agendamentos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_agendamentos`
--

LOCK TABLES `item_agendamentos` WRITE;
/*!40000 ALTER TABLE `item_agendamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_compras`
--

DROP TABLE IF EXISTS `item_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_compras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `compra_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `unidade_compra` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validade` date DEFAULT NULL,
  `cfop_entrada` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `codigo_siad` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_compras_compra_id_foreign` (`compra_id`),
  KEY `item_compras_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_compras_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  CONSTRAINT `item_compras_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_compras`
--

LOCK TABLES `item_compras` WRITE;
/*!40000 ALTER TABLE `item_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_cotacaos`
--

DROP TABLE IF EXISTS `item_cotacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_cotacaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cotacao_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_cotacaos_cotacao_id_foreign` (`cotacao_id`),
  KEY `item_cotacaos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_cotacaos_cotacao_id_foreign` FOREIGN KEY (`cotacao_id`) REFERENCES `cotacaos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_cotacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_cotacaos`
--

LOCK TABLES `item_cotacaos` WRITE;
/*!40000 ALTER TABLE `item_cotacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_cotacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_devolucaos`
--

DROP TABLE IF EXISTS `item_devolucaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_devolucaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cod` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ncm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codBarras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_unit` decimal(10,2) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `item_parcial` tinyint(1) NOT NULL,
  `unidade_medida` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_csosn` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_pis` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_cofins` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_ipi` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perc_icms` decimal(8,2) NOT NULL,
  `perc_pis` decimal(8,2) NOT NULL,
  `perc_cofins` decimal(8,2) NOT NULL,
  `perc_ipi` decimal(8,2) NOT NULL,
  `pRedBC` decimal(8,2) NOT NULL,
  `devolucao_id` int unsigned NOT NULL,
  `vBCSTRet` decimal(8,2) NOT NULL DEFAULT '0.00',
  `vFrete` decimal(8,2) NOT NULL DEFAULT '0.00',
  `modBCST` decimal(8,2) NOT NULL,
  `vBCST` decimal(8,2) NOT NULL,
  `pICMSST` decimal(8,2) NOT NULL,
  `vICMSST` decimal(8,2) NOT NULL,
  `pMVAST` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_devolucaos_devolucao_id_foreign` (`devolucao_id`),
  CONSTRAINT `item_devolucaos_devolucao_id_foreign` FOREIGN KEY (`devolucao_id`) REFERENCES `devolucaos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_devolucaos`
--

LOCK TABLES `item_devolucaos` WRITE;
/*!40000 ALTER TABLE `item_devolucaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_devolucaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_dves`
--

DROP TABLE IF EXISTS `item_dves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_dves` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `numero_nfe` int NOT NULL,
  `produto_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_dves`
--

LOCK TABLES `item_dves` WRITE;
/*!40000 ALTER TABLE `item_dves` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_dves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_i_b_t_e_s`
--

DROP TABLE IF EXISTS `item_i_b_t_e_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_i_b_t_e_s` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ibte_id` int unsigned NOT NULL,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacional_federal` decimal(5,2) NOT NULL,
  `importado_federal` decimal(5,2) NOT NULL,
  `estadual` decimal(5,2) NOT NULL,
  `municipal` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_i_b_t_e_s_ibte_id_foreign` (`ibte_id`),
  CONSTRAINT `item_i_b_t_e_s_ibte_id_foreign` FOREIGN KEY (`ibte_id`) REFERENCES `i_b_p_t_s` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_i_b_t_e_s`
--

LOCK TABLES `item_i_b_t_e_s` WRITE;
/*!40000 ALTER TABLE `item_i_b_t_e_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_i_b_t_e_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_orcamentos`
--

DROP TABLE IF EXISTS `item_orcamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_orcamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `orcamento_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_orcamentos_orcamento_id_foreign` (`orcamento_id`),
  KEY `item_orcamentos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_orcamentos_orcamento_id_foreign` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamentos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_orcamentos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_orcamentos`
--

LOCK TABLES `item_orcamentos` WRITE;
/*!40000 ALTER TABLE `item_orcamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_orcamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pack_produto_deliveries`
--

DROP TABLE IF EXISTS `item_pack_produto_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pack_produto_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_delivery_id` int unsigned DEFAULT NULL,
  `pack_id` int unsigned DEFAULT NULL,
  `quantidade` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pack_produto_deliveries_produto_delivery_id_foreign` (`produto_delivery_id`),
  KEY `item_pack_produto_deliveries_pack_id_foreign` (`pack_id`),
  CONSTRAINT `item_pack_produto_deliveries_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pack_produto_deliveries_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pack_produto_deliveries`
--

LOCK TABLES `item_pack_produto_deliveries` WRITE;
/*!40000 ALTER TABLE `item_pack_produto_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pack_produto_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_complemento_deliveries`
--

DROP TABLE IF EXISTS `item_pedido_complemento_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_complemento_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido_id` int unsigned NOT NULL,
  `complemento_id` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_complemento_deliveries_item_pedido_id_foreign` (`item_pedido_id`),
  KEY `item_pedido_complemento_deliveries_complemento_id_foreign` (`complemento_id`),
  CONSTRAINT `item_pedido_complemento_deliveries_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_complemento_deliveries_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_complemento_deliveries`
--

LOCK TABLES `item_pedido_complemento_deliveries` WRITE;
/*!40000 ALTER TABLE `item_pedido_complemento_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_complemento_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_complemento_locals`
--

DROP TABLE IF EXISTS `item_pedido_complemento_locals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_complemento_locals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido` int unsigned NOT NULL,
  `complemento_id` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_complemento_locals_item_pedido_foreign` (`item_pedido`),
  KEY `item_pedido_complemento_locals_complemento_id_foreign` (`complemento_id`),
  CONSTRAINT `item_pedido_complemento_locals_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_complemento_locals_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_complemento_locals`
--

LOCK TABLES `item_pedido_complemento_locals` WRITE;
/*!40000 ALTER TABLE `item_pedido_complemento_locals` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_complemento_locals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_deliveries`
--

DROP TABLE IF EXISTS `item_pedido_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `pedido_id` int unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `impresso` tinyint(1) NOT NULL DEFAULT '0',
  `quantidade` decimal(8,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamanho_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_deliveries_produto_id_foreign` (`produto_id`),
  KEY `item_pedido_deliveries_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedido_deliveries_tamanho_id_foreign` (`tamanho_id`),
  CONSTRAINT `item_pedido_deliveries_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_deliveries_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_deliveries`
--

LOCK TABLES `item_pedido_deliveries` WRITE;
/*!40000 ALTER TABLE `item_pedido_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_ecommerces`
--

DROP TABLE IF EXISTS `item_pedido_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_ecommerces_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedido_ecommerces_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_pedido_ecommerces_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_ecommerces`
--

LOCK TABLES `item_pedido_ecommerces` WRITE;
/*!40000 ALTER TABLE `item_pedido_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedidos`
--

DROP TABLE IF EXISTS `item_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `pedido_id` int unsigned NOT NULL,
  `tamanho_pizza_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `observacao` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `impresso` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedidos_produto_id_foreign` (`produto_id`),
  KEY `item_pedidos_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedidos_tamanho_pizza_id_foreign` (`tamanho_pizza_id`),
  KEY `item_pedidos_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_pedidos_tamanho_pizza_id_foreign` FOREIGN KEY (`tamanho_pizza_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedidos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedidos`
--

LOCK TABLES `item_pedidos` WRITE;
/*!40000 ALTER TABLE `item_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pizza_pedido_locals`
--

DROP TABLE IF EXISTS `item_pizza_pedido_locals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pizza_pedido_locals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido` int unsigned NOT NULL,
  `sabor_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pizza_pedido_locals_item_pedido_foreign` (`item_pedido`),
  KEY `item_pizza_pedido_locals_sabor_id_foreign` (`sabor_id`),
  CONSTRAINT `item_pizza_pedido_locals_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pizza_pedido_locals_sabor_id_foreign` FOREIGN KEY (`sabor_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pizza_pedido_locals`
--

LOCK TABLES `item_pizza_pedido_locals` WRITE;
/*!40000 ALTER TABLE `item_pizza_pedido_locals` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pizza_pedido_locals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pizza_pedidos`
--

DROP TABLE IF EXISTS `item_pizza_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pizza_pedidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido` int unsigned NOT NULL,
  `sabor_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pizza_pedidos_item_pedido_foreign` (`item_pedido`),
  KEY `item_pizza_pedidos_sabor_id_foreign` (`sabor_id`),
  CONSTRAINT `item_pizza_pedidos_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedido_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pizza_pedidos_sabor_id_foreign` FOREIGN KEY (`sabor_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pizza_pedidos`
--

LOCK TABLES `item_pizza_pedidos` WRITE;
/*!40000 ALTER TABLE `item_pizza_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pizza_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_receitas`
--

DROP TABLE IF EXISTS `item_receitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_receitas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned DEFAULT NULL,
  `receita_id` int unsigned DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `medida` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_receitas_produto_id_foreign` (`produto_id`),
  KEY `item_receitas_receita_id_foreign` (`receita_id`),
  CONSTRAINT `item_receitas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_receitas_receita_id_foreign` FOREIGN KEY (`receita_id`) REFERENCES `receitas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_receitas`
--

LOCK TABLES `item_receitas` WRITE;
/*!40000 ALTER TABLE `item_receitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_receitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda_caixas`
--

DROP TABLE IF EXISTS `item_venda_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `venda_caixa_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `item_pedido_id` int unsigned DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_venda_caixas_venda_caixa_id_foreign` (`venda_caixa_id`),
  KEY `item_venda_caixas_produto_id_foreign` (`produto_id`),
  KEY `item_venda_caixas_item_pedido_id_foreign` (`item_pedido_id`),
  CONSTRAINT `item_venda_caixas_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_venda_caixas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_venda_caixas_venda_caixa_id_foreign` FOREIGN KEY (`venda_caixa_id`) REFERENCES `venda_caixas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda_caixas`
--

LOCK TABLES `item_venda_caixas` WRITE;
/*!40000 ALTER TABLE `item_venda_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_venda_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_vendas`
--

DROP TABLE IF EXISTS `item_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_vendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `venda_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_vendas_venda_id_foreign` (`venda_id`),
  KEY `item_vendas_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_vendas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_vendas_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_vendas`
--

LOCK TABLES `item_vendas` WRITE;
/*!40000 ALTER TABLE `item_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lacre_transportes`
--

DROP TABLE IF EXISTS `lacre_transportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lacre_transportes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lacre_transportes_info_id_foreign` (`info_id`),
  CONSTRAINT `lacre_transportes_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lacre_transportes`
--

LOCK TABLES `lacre_transportes` WRITE;
/*!40000 ALTER TABLE `lacre_transportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lacre_transportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lacre_unidade_cargas`
--

DROP TABLE IF EXISTS `lacre_unidade_cargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lacre_unidade_cargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lacre_unidade_cargas_info_id_foreign` (`info_id`),
  CONSTRAINT `lacre_unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lacre_unidade_cargas`
--

LOCK TABLES `lacre_unidade_cargas` WRITE;
/*!40000 ALTER TABLE `lacre_unidade_cargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `lacre_unidade_cargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lancamento_categorias`
--

DROP TABLE IF EXISTS `lancamento_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lancamento_categorias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` int unsigned NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `percentual` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lancamento_categorias_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `lancamento_categorias_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `dre_categorias` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lancamento_categorias`
--

LOCK TABLES `lancamento_categorias` WRITE;
/*!40000 ALTER TABLE `lancamento_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `lancamento_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_complemento_deliveries`
--

DROP TABLE IF EXISTS `lista_complemento_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_complemento_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `complemento_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lista_complemento_deliveries_produto_id_foreign` (`produto_id`),
  KEY `lista_complemento_deliveries_complemento_id_foreign` (`complemento_id`),
  CONSTRAINT `lista_complemento_deliveries_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lista_complemento_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_complemento_deliveries`
--

LOCK TABLES `lista_complemento_deliveries` WRITE;
/*!40000 ALTER TABLE `lista_complemento_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_complemento_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_precos`
--

DROP TABLE IF EXISTS `lista_precos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_precos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentual_alteracao` decimal(4,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_precos`
--

LOCK TABLES `lista_precos` WRITE;
/*!40000 ALTER TABLE `lista_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_precos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manifesta_dves`
--

DROP TABLE IF EXISTS `manifesta_dves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manifesta_dves` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `num_prot` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_emissao` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_evento` int NOT NULL,
  `fatura_salva` tinyint(1) NOT NULL,
  `tipo` int NOT NULL,
  `nsu` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manifesta_dves`
--

LOCK TABLES `manifesta_dves` WRITE;
/*!40000 ALTER TABLE `manifesta_dves` DISABLE KEYS */;
/*!40000 ALTER TABLE `manifesta_dves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdves`
--

DROP TABLE IF EXISTS `mdves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdves` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uf_inicio` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf_fim` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encerrado` tinyint(1) NOT NULL,
  `data_inicio_viagem` date NOT NULL,
  `carga_posterior` tinyint(1) NOT NULL,
  `cnpj_contratante` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `veiculo_tracao_id` int unsigned NOT NULL,
  `veiculo_reboque_id` int unsigned NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdfe_numero` int NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocolo` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seguradora_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seguradora_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_apolice` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_averbacao` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `info_complementar` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_adicional_fisco` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condutor_nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condutor_cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lac_rodo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_emit` int NOT NULL,
  `tp_transp` int NOT NULL,
  `produto_pred_nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_pred_ncm` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_pred_cod_barras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_carrega` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_descarrega` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_carga` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdves_veiculo_tracao_id_foreign` (`veiculo_tracao_id`),
  KEY `mdves_veiculo_reboque_id_foreign` (`veiculo_reboque_id`),
  CONSTRAINT `mdves_veiculo_reboque_id_foreign` FOREIGN KEY (`veiculo_reboque_id`) REFERENCES `veiculos` (`id`),
  CONSTRAINT `mdves_veiculo_tracao_id_foreign` FOREIGN KEY (`veiculo_tracao_id`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdves`
--

LOCK TABLES `mdves` WRITE;
/*!40000 ALTER TABLE `mdves` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida_ctes`
--

DROP TABLE IF EXISTS `medida_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cod_unidade` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_medida` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `cte_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medida_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `medida_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida_ctes`
--

LOCK TABLES `medida_ctes` WRITE;
/*!40000 ALTER TABLE `medida_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `medida_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercado_configs`
--

DROP TABLE IF EXISTS `mercado_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mercado_configs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionamento` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_de_produtos` int NOT NULL,
  `total_de_clientes` int NOT NULL,
  `total_de_funcionarios` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercado_configs`
--

LOCK TABLES `mercado_configs` WRITE;
/*!40000 ALTER TABLE `mercado_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mercado_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1464 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1331,'2014_10_12_000000_create_usuario_table',1),(1332,'2014_10_12_100000_create_password_resets_table',1),(1333,'2014_10_12_100000_create_tela_pedidos_table',1),(1334,'2019_01_13_074542_create_bairro_deliveries_table',1),(1335,'2019_01_14_173256_create_categoria_contas_table',1),(1336,'2019_02_05_224101_create_cidades_table',1),(1337,'2019_02_10_132730_create_categorias_table',1),(1338,'2019_02_10_170842_create_produtos_table',1),(1339,'2019_02_10_182200_create_clientes_table',1),(1340,'2019_02_11_003750_create_fornecedores_table',1),(1341,'2019_02_13_025957_create_ordem_servico_table',1),(1342,'2019_02_13_043706_create_compras_table',1),(1343,'2019_02_13_043951_create_item_compra_table',1),(1344,'2019_02_13_212540_create_estoque_table',1),(1345,'2019_03_07_124329_create_transportadoras_table',1),(1346,'2019_09_06_132659_create_natureza_operacaos_table',1),(1347,'2019_09_06_233629_create_fretes_table',1),(1348,'2019_09_07_000028_create_funcionarios_table',1),(1349,'2019_09_07_000243_create_contato_funcionarios_table',1),(1350,'2019_09_07_000401_create_vendas_table',1),(1351,'2019_09_07_000402_create_orcamentos_table',1),(1352,'2019_09_07_000602_create_item_vendas_table',1),(1353,'2019_09_07_000603_create_item_orcamentos_table',1),(1354,'2019_09_07_001421_create_categoria_servicos_table',1),(1355,'2019_09_07_001450_create_servicos_table',1),(1356,'2019_09_07_001649_create_servico_os_table',1),(1357,'2019_09_09_060514_create_relatorio_os_table',1),(1358,'2019_09_10_120640_create_funcionario_os_table',1),(1359,'2019_09_13_124343_create_conta_pagars_table',1),(1360,'2019_09_16_133536_create_receitas_table',1),(1361,'2019_09_16_134008_create_item_receitas_table',1),(1362,'2019_09_17_104549_create_apontamentos_table',1),(1363,'2019_09_18_120307_create_config_notas_table',1),(1364,'2019_09_20_072219_create_conta_recebers_table',1),(1365,'2019_09_20_190012_create_credito_vendas_table',1),(1366,'2019_09_25_221701_create_escritorio_contabils_table',1),(1367,'2019_09_27_201804_create_venda_caixas_table',1),(1368,'2019_09_27_201839_create_sangria_caixas_table',1),(1369,'2019_09_27_202513_create_abertura_caixas_table',1),(1370,'2019_10_08_020219_create_cotacaos_table',1),(1371,'2019_10_08_020521_create_item_cotacaos_table',1),(1372,'2019_11_18_142053_create_cliente_deliveries_table',1),(1373,'2019_11_18_173451_create_categoria_produto_deliveries_table',1),(1374,'2019_11_18_173545_create_endereco_deliveries_table',1),(1375,'2019_11_18_174144_create_delivery_configs_table',1),(1376,'2019_11_18_174210_create_tamanho_pizzas_table',1),(1377,'2019_11_18_174216_create_produto_deliveries_table',1),(1378,'2019_11_18_174216_create_produto_pizzas_table',1),(1379,'2019_11_18_174238_create_codigo_descontos_table',1),(1380,'2019_11_18_174240_create_pedido_deliveries_table',1),(1381,'2019_11_18_174253_create_item_pedido_deliveries_table',1),(1382,'2019_11_18_174254_create_item_pizza_pedidos_table',1),(1383,'2019_11_18_182024_create_imagens_produto_deliveries_table',1),(1384,'2019_11_18_182201_create_funcionamento_deliveries_table',1),(1385,'2019_11_24_081143_create_categoria_adicionals_table',1),(1386,'2019_11_25_114233_create_complemento_deliveries_table',1),(1387,'2019_11_25_115042_create_lista_complemento_deliveries_table',1),(1388,'2019_11_25_115947_create_item_pedido_complemento_deliveries_table',1),(1389,'2019_12_12_113546_create_veiculos_table',1),(1390,'2019_12_12_113547_create_ctes_table',1),(1391,'2019_12_12_113840_create_medida_ctes_table',1),(1392,'2019_12_14_232910_create_componente_ctes_table',1),(1393,'2019_12_19_184011_create_produto_favorito_deliveries_table',1),(1394,'2019_12_24_105307_create_tributacaos_table',1),(1395,'2019_12_27_081743_create_token_cliente_deliveries_table',1),(1396,'2020_01_03_003420_create_mesas_table',1),(1397,'2020_01_03_121157_create_certificados_table',1),(1398,'2020_01_04_003419_create_pushes_table',1),(1399,'2020_01_04_003420_create_pedidos_table',1),(1400,'2020_01_04_003421_create_item_pedidos_table',1),(1401,'2020_01_04_003422_create_item_venda_caixas_table',1),(1402,'2020_01_18_084439_create_item_pizza_pedido_locals_table',1),(1403,'2020_01_19_003305_create_item_pedido_complemento_locals_table',1),(1404,'2020_01_19_201036_create_categoria_despesa_ctes_table',1),(1405,'2020_01_19_201358_create_despesa_ctes_table',1),(1406,'2020_01_20_004105_create_receita_ctes_table',1),(1407,'2020_02_26_100343_create_token_webs_table',1),(1408,'2020_02_27_182503_create_devolucaos_table',1),(1409,'2020_02_27_182519_create_item_devolucaos_table',1),(1410,'2020_03_01_085359_create_mdves_table',1),(1411,'2020_03_02_205916_create_municipio_carregamentos_table',1),(1412,'2020_03_02_205937_create_percursos_table',1),(1413,'2020_03_03_080744_create_ciots_table',1),(1414,'2020_03_03_080847_create_vale_pedagios_table',1),(1415,'2020_03_03_081000_create_info_descargas_table',1),(1416,'2020_03_03_081214_create_n_fe_descargas_table',1),(1417,'2020_03_03_081236_create_c_te_descargas_table',1),(1418,'2020_03_03_081412_create_lacre_unidade_cargas_table',1),(1419,'2020_03_03_081444_create_unidade_cargas_table',1),(1420,'2020_03_03_081503_create_lacre_transportes_table',1),(1421,'2020_05_16_002118_create_manifesta_dves_table',1),(1422,'2020_05_29_164157_create_pedido_pag_seguros_table',1),(1423,'2020_06_18_133755_create_pedido_deletes_table',1),(1424,'2020_06_23_095357_create_pack_produto_deliveries_table',1),(1425,'2020_06_23_095512_create_item_pack_produto_deliveries_table',1),(1426,'2020_06_24_093940_create_mercado_configs_table',1),(1427,'2020_06_24_095935_create_banner_mais_vendidos_table',1),(1428,'2020_06_24_095959_create_banner_topos_table',1),(1429,'2020_07_06_155337_create_fatura_orcamentos_table',1),(1430,'2020_08_05_073712_create_lista_precos_table',1),(1431,'2020_08_05_074304_create_produto_lista_precos_table',1),(1432,'2020_08_19_094151_create_alteracao_estoques_table',1),(1433,'2020_09_09_084728_create_pedido_qr_code_clientes_table',1),(1434,'2020_09_09_103043_create_item_dves_table',1),(1435,'2020_11_16_155356_create_empresas_table',1),(1436,'2020_11_22_171953_create_motoboys_table',1),(1437,'2020_11_22_172042_create_pedido_motoboys_table',1),(1438,'2020_11_24_081612_create_comissao_vendas_table',1),(1439,'2020_11_26_081725_create_suprimento_caixas_table',1),(1440,'2021_01_24_132506_create_agendamentos_table',1),(1441,'2021_01_24_133704_create_item_agendamentos_table',1),(1442,'2021_07_12_093843_create_dres_table',1),(1443,'2021_07_12_094001_create_dre_categorias_table',1),(1444,'2021_07_12_094014_create_lancamento_categorias_table',1),(1445,'2021_07_12_094135_create_i_b_p_t_s_table',1),(1446,'2021_07_12_094201_create_item_i_b_t_e_s_table',1),(1447,'2021_07_19_124531_create_config_ecommerces_table',1),(1448,'2021_07_19_124550_create_categoria_produto_ecommerces_table',1),(1449,'2021_07_19_124631_create_produto_ecommerces_table',1),(1450,'2021_07_19_124649_create_imagem_produto_ecommerces_table',1),(1451,'2021_07_19_124703_create_carrossel_ecommerces_table',1),(1452,'2021_07_19_124719_create_autor_post_blog_ecommerces_table',1),(1453,'2021_07_19_124735_create_categoria_post_blog_ecommerces_table',1),(1454,'2021_07_19_124749_create_post_blog_ecommerces_table',1),(1455,'2021_07_19_124802_create_contato_ecommerces_table',1),(1456,'2021_07_19_124909_create_informativo_ecommerces_table',1),(1457,'2021_07_19_124928_create_cliente_ecommerces_table',1),(1458,'2021_07_19_124941_create_endereco_ecommerces_table',1),(1459,'2021_07_19_124952_create_pedido_ecommerces_table',1),(1460,'2021_07_19_125005_create_item_pedido_ecommerces_table',1),(1461,'2021_07_19_125033_create_curtida_produto_ecommerces_table',1),(1462,'2021_08_12_074523_create_config_caixas_table',1),(1463,'2021_10_31_113153_create_divisao_grades_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motoboys`
--

DROP TABLE IF EXISTS `motoboys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motoboys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone1` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone2` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone3` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rg` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_transporte` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motoboys`
--

LOCK TABLES `motoboys` WRITE;
/*!40000 ALTER TABLE `motoboys` DISABLE KEYS */;
/*!40000 ALTER TABLE `motoboys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio_carregamentos`
--

DROP TABLE IF EXISTS `municipio_carregamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio_carregamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `municipio_carregamentos_mdfe_id_foreign` (`mdfe_id`),
  KEY `municipio_carregamentos_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `municipio_carregamentos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `municipio_carregamentos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio_carregamentos`
--

LOCK TABLES `municipio_carregamentos` WRITE;
/*!40000 ALTER TABLE `municipio_carregamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio_carregamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_fe_descargas`
--

DROP TABLE IF EXISTS `n_fe_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_fe_descargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seg_cod_barras` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `n_fe_descargas_info_id_foreign` (`info_id`),
  CONSTRAINT `n_fe_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_fe_descargas`
--

LOCK TABLES `n_fe_descargas` WRITE;
/*!40000 ALTER TABLE `n_fe_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `n_fe_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `natureza_operacaos`
--

DROP TABLE IF EXISTS `natureza_operacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `natureza_operacaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `natureza` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CFOP_entrada_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CFOP_entrada_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CFOP_saida_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CFOP_saida_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `natureza_operacaos`
--

LOCK TABLES `natureza_operacaos` WRITE;
/*!40000 ALTER TABLE `natureza_operacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `natureza_operacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamentos`
--

DROP TABLE IF EXISTS `orcamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orcamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned DEFAULT NULL,
  `frete_id` int unsigned DEFAULT NULL,
  `transportadora_id` int unsigned DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_enviado` tinyint(1) NOT NULL,
  `validade` date NOT NULL,
  `venda_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orcamentos_cliente_id_foreign` (`cliente_id`),
  KEY `orcamentos_usuario_id_foreign` (`usuario_id`),
  KEY `orcamentos_natureza_id_foreign` (`natureza_id`),
  KEY `orcamentos_frete_id_foreign` (`frete_id`),
  KEY `orcamentos_transportadora_id_foreign` (`transportadora_id`),
  CONSTRAINT `orcamentos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `orcamentos_frete_id_foreign` FOREIGN KEY (`frete_id`) REFERENCES `fretes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orcamentos_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `orcamentos_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orcamentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamentos`
--

LOCK TABLES `orcamentos` WRITE;
/*!40000 ALTER TABLE `orcamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `orcamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servicos`
--

DROP TABLE IF EXISTS `ordem_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `estado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pd',
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'av',
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_prevista_finalizacao` date NOT NULL DEFAULT '1981-01-01',
  `NfNumero` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordem_servicos_cliente_id_foreign` (`cliente_id`),
  KEY `ordem_servicos_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `ordem_servicos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ordem_servicos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servicos`
--

LOCK TABLES `ordem_servicos` WRITE;
/*!40000 ALTER TABLE `ordem_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pack_produto_deliveries`
--

DROP TABLE IF EXISTS `pack_produto_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pack_produto_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pack_produto_deliveries`
--

LOCK TABLES `pack_produto_deliveries` WRITE;
/*!40000 ALTER TABLE `pack_produto_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `pack_produto_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `pedido_deletes`
--

DROP TABLE IF EXISTS `pedido_deletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_deletes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido_id` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_insercao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_deletes`
--

LOCK TABLES `pedido_deletes` WRITE;
/*!40000 ALTER TABLE `pedido_deletes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_deletes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_deliveries`
--

DROP TABLE IF EXISTS `pedido_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) NOT NULL,
  `troco_para` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivoEstado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco_id` int unsigned DEFAULT NULL,
  `cupom_id` int unsigned DEFAULT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `app` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_deliveries_cliente_id_foreign` (`cliente_id`),
  KEY `pedido_deliveries_endereco_id_foreign` (`endereco_id`),
  KEY `pedido_deliveries_cupom_id_foreign` (`cupom_id`),
  CONSTRAINT `pedido_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_deliveries_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `codigo_descontos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_deliveries_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_deliveries`
--

LOCK TABLES `pedido_deliveries` WRITE;
/*!40000 ALTER TABLE `pedido_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_ecommerces`
--

DROP TABLE IF EXISTS `pedido_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned DEFAULT NULL,
  `endereco_id` int unsigned DEFAULT NULL,
  `status` int NOT NULL,
  `status_preparacao` int NOT NULL,
  `codigo_rastreio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_total` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `tipo_frete` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venda_id` int NOT NULL DEFAULT '0',
  `numero_nfe` int NOT NULL DEFAULT '0',
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rand_pedido` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_boleto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transacao_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `forma_pagamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status_pagamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status_detalhe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_ecommerces_cliente_id_foreign` (`cliente_id`),
  KEY `pedido_ecommerces_endereco_id_foreign` (`endereco_id`),
  CONSTRAINT `pedido_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_ecommerces_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_ecommerces`
--

LOCK TABLES `pedido_ecommerces` WRITE;
/*!40000 ALTER TABLE `pedido_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_motoboys`
--

DROP TABLE IF EXISTS `pedido_motoboys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_motoboys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `motoboy_id` int unsigned DEFAULT NULL,
  `pedido_id` int unsigned DEFAULT NULL,
  `valor` decimal(7,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `observacao` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_motoboys_motoboy_id_foreign` (`motoboy_id`),
  KEY `pedido_motoboys_pedido_id_foreign` (`pedido_id`),
  CONSTRAINT `pedido_motoboys_motoboy_id_foreign` FOREIGN KEY (`motoboy_id`) REFERENCES `motoboys` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_motoboys_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_motoboys`
--

LOCK TABLES `pedido_motoboys` WRITE;
/*!40000 ALTER TABLE `pedido_motoboys` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_motoboys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_pag_seguros`
--

DROP TABLE IF EXISTS `pedido_pag_seguros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_pag_seguros` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pedido_delivery_id` int unsigned NOT NULL,
  `numero_cartao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_impresso` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_transacao` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bandeira` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parcelas` int NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_pag_seguros_pedido_delivery_id_foreign` (`pedido_delivery_id`),
  CONSTRAINT `pedido_pag_seguros_pedido_delivery_id_foreign` FOREIGN KEY (`pedido_delivery_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_pag_seguros`
--

LOCK TABLES `pedido_pag_seguros` WRITE;
/*!40000 ALTER TABLE `pedido_pag_seguros` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_pag_seguros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_qr_code_clientes`
--

DROP TABLE IF EXISTS `pedido_qr_code_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_qr_code_clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` int unsigned DEFAULT NULL,
  `hash` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_qr_code_clientes_pedido_id_foreign` (`pedido_id`),
  CONSTRAINT `pedido_qr_code_clientes_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_qr_code_clientes`
--

LOCK TABLES `pedido_qr_code_clientes` WRITE;
/*!40000 ALTER TABLE `pedido_qr_code_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_qr_code_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `comanda` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `mesa_id` int unsigned DEFAULT NULL,
  `bairro_id` int unsigned DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desativado` tinyint(1) NOT NULL,
  `referencia_cliete` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mesa_ativa` tinyint(1) NOT NULL DEFAULT '1',
  `fechar_mesa` tinyint(1) NOT NULL DEFAULT '0',
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imprimir` tinyint(1) NOT NULL DEFAULT '0',
  `finalizado_atendimeto` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_mesa_id_foreign` (`mesa_id`),
  KEY `pedidos_bairro_id_foreign` (`bairro_id`),
  CONSTRAINT `pedidos_bairro_id_foreign` FOREIGN KEY (`bairro_id`) REFERENCES `bairro_deliveries` (`id`),
  CONSTRAINT `pedidos_mesa_id_foreign` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percursos`
--

DROP TABLE IF EXISTS `percursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `percursos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `percursos_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `percursos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percursos`
--

LOCK TABLES `percursos` WRITE;
/*!40000 ALTER TABLE `percursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `percursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_blog_ecommerces`
--

DROP TABLE IF EXISTS `post_blog_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_blog_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` int unsigned NOT NULL,
  `autor_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_blog_ecommerces_categoria_id_foreign` (`categoria_id`),
  KEY `post_blog_ecommerces_autor_id_foreign` (`autor_id`),
  CONSTRAINT `post_blog_ecommerces_autor_id_foreign` FOREIGN KEY (`autor_id`) REFERENCES `autor_post_blog_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_blog_ecommerces_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_post_blog_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_blog_ecommerces`
--

LOCK TABLES `post_blog_ecommerces` WRITE;
/*!40000 ALTER TABLE `post_blog_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_blog_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_deliveries`
--

DROP TABLE IF EXISTS `produto_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `categoria_id` int unsigned NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredientes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `valor_anterior` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `auto_atendimento` tinyint(1) NOT NULL DEFAULT '0',
  `destaque` tinyint(1) NOT NULL,
  `limite_diario` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_deliveries_produto_id_foreign` (`produto_id`),
  KEY `produto_deliveries_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `produto_deliveries_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produto_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_deliveries`
--

LOCK TABLES `produto_deliveries` WRITE;
/*!40000 ALTER TABLE `produto_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_ecommerces`
--

DROP TABLE IF EXISTS `produto_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `categoria_id` int unsigned NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `controlar_estoque` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `destaque` tinyint(1) NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor` decimal(10,2) NOT NULL,
  `percentual_desconto_view` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_ecommerces_produto_id_foreign` (`produto_id`),
  KEY `produto_ecommerces_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `produto_ecommerces_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produto_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_ecommerces`
--

LOCK TABLES `produto_ecommerces` WRITE;
/*!40000 ALTER TABLE `produto_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_favorito_deliveries`
--

DROP TABLE IF EXISTS `produto_favorito_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_favorito_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `cliente_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_favorito_deliveries_produto_id_foreign` (`produto_id`),
  KEY `produto_favorito_deliveries_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `produto_favorito_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produto_favorito_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_favorito_deliveries`
--

LOCK TABLES `produto_favorito_deliveries` WRITE;
/*!40000 ALTER TABLE `produto_favorito_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_favorito_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_lista_precos`
--

DROP TABLE IF EXISTS `produto_lista_precos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_lista_precos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lista_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `percentual_lucro` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_lista_precos_lista_id_foreign` (`lista_id`),
  KEY `produto_lista_precos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `produto_lista_precos_lista_id_foreign` FOREIGN KEY (`lista_id`) REFERENCES `lista_precos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produto_lista_precos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_lista_precos`
--

LOCK TABLES `produto_lista_precos` WRITE;
/*!40000 ALTER TABLE `produto_lista_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_lista_precos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_pizzas`
--

DROP TABLE IF EXISTS `produto_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_pizzas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned DEFAULT NULL,
  `tamanho_id` int unsigned DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_pizzas_produto_id_foreign` (`produto_id`),
  KEY `produto_pizzas_tamanho_id_foreign` (`tamanho_id`),
  CONSTRAINT `produto_pizzas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produto_pizzas_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_pizzas`
--

LOCK TABLES `produto_pizzas` WRITE;
/*!40000 ALTER TABLE `produto_pizzas` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` int unsigned NOT NULL,
  `valor_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor_compra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `NCM` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `codBarras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CEST` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_CSOSN` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_PIS` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_COFINS` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_IPI` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unidade_compra` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversao_unitaria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `unidade_venda` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `composto` tinyint(1) NOT NULL DEFAULT '0',
  `valor_livre` tinyint(1) NOT NULL,
  `perc_icms` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_pis` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_cofins` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_ipi` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_iss` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pRedBC` decimal(5,2) NOT NULL DEFAULT '0.00',
  `cBenef` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cListServ` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CFOP_saida_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CFOP_saida_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_anp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao_anp` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perc_glp` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_gnn` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_gni` decimal(5,2) NOT NULL DEFAULT '0.00',
  `valor_partida` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unidade_tributavel` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quantidade_tributavel` decimal(10,2) NOT NULL DEFAULT '0.00',
  `imagem` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alerta_vencimento` int NOT NULL,
  `gerenciar_estoque` tinyint(1) NOT NULL,
  `estoque_minimo` int NOT NULL DEFAULT '0',
  `referencia` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `referencia_balanca` int NOT NULL DEFAULT '0',
  `tela_id` int unsigned DEFAULT NULL,
  `largura` decimal(6,2) NOT NULL DEFAULT '0.00',
  `comprimento` decimal(6,2) NOT NULL DEFAULT '0.00',
  `altura` decimal(6,2) NOT NULL DEFAULT '0.00',
  `peso_liquido` decimal(8,3) NOT NULL DEFAULT '0.000',
  `peso_bruto` decimal(8,3) NOT NULL DEFAULT '0.000',
  `referencia_grade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `grade` tinyint(1) NOT NULL DEFAULT '0',
  `str_grade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `passageiros` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cor_veiculo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `chassi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `combustivel` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `numero_motor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ano` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modelo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `perc_icms_interestadual` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_icms_interno` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_fcp_interestadual` decimal(10,2) NOT NULL DEFAULT '0.00',
  `origem` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produtos_categoria_id_foreign` (`categoria_id`),
  KEY `produtos_tela_id_foreign` (`tela_id`),
  CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produtos_tela_id_foreign` FOREIGN KEY (`tela_id`) REFERENCES `tela_pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pushes`
--

DROP TABLE IF EXISTS `pushes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pushes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned DEFAULT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_img` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia_produto` int NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pushes_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `pushes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pushes`
--

LOCK TABLES `pushes` WRITE;
/*!40000 ALTER TABLE `pushes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pushes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita_ctes`
--

DROP TABLE IF EXISTS `receita_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receita_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cte_id` int unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receita_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `receita_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita_ctes`
--

LOCK TABLES `receita_ctes` WRITE;
/*!40000 ALTER TABLE `receita_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `receita_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receitas`
--

DROP TABLE IF EXISTS `receitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receitas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rendimento` double(8,2) NOT NULL,
  `valor_custo` decimal(10,2) NOT NULL,
  `tempo_preparo` int NOT NULL,
  `pizza` tinyint(1) NOT NULL,
  `pedacos` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receitas_produto_id_foreign` (`produto_id`),
  CONSTRAINT `receitas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receitas`
--

LOCK TABLES `receitas` WRITE;
/*!40000 ALTER TABLE `receitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `receitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio_os`
--

DROP TABLE IF EXISTS `relatorio_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatorio_os` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `ordem_servico_id` int unsigned NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relatorio_os_usuario_id_foreign` (`usuario_id`),
  KEY `relatorio_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  CONSTRAINT `relatorio_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  CONSTRAINT `relatorio_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_os`
--

LOCK TABLES `relatorio_os` WRITE;
/*!40000 ALTER TABLE `relatorio_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sangria_caixas`
--

DROP TABLE IF EXISTS `sangria_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sangria_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sangria_caixas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `sangria_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sangria_caixas`
--

LOCK TABLES `sangria_caixas` WRITE;
/*!40000 ALTER TABLE `sangria_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `sangria_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico_os`
--

DROP TABLE IF EXISTS `servico_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico_os` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `servico_id` int unsigned NOT NULL,
  `ordem_servico_id` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servico_os_servico_id_foreign` (`servico_id`),
  KEY `servico_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  CONSTRAINT `servico_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  CONSTRAINT `servico_os_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico_os`
--

LOCK TABLES `servico_os` WRITE;
/*!40000 ALTER TABLE `servico_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `unidade_cobranca` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_servico` int NOT NULL,
  `comissao` decimal(6,2) NOT NULL DEFAULT '0.00',
  `categoria_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servicos_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `servicos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suprimento_caixas`
--

DROP TABLE IF EXISTS `suprimento_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suprimento_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `usuario_id` int unsigned NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `suprimento_caixas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `suprimento_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suprimento_caixas`
--

LOCK TABLES `suprimento_caixas` WRITE;
/*!40000 ALTER TABLE `suprimento_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `suprimento_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanho_pizzas`
--

DROP TABLE IF EXISTS `tamanho_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tamanho_pizzas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedacos` int NOT NULL,
  `maximo_sabores` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanho_pizzas`
--

LOCK TABLES `tamanho_pizzas` WRITE;
/*!40000 ALTER TABLE `tamanho_pizzas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tamanho_pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tela_pedidos`
--

DROP TABLE IF EXISTS `tela_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tela_pedidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alerta_amarelo` int NOT NULL DEFAULT '0',
  `alerta_vermelho` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tela_pedidos`
--

LOCK TABLES `tela_pedidos` WRITE;
/*!40000 ALTER TABLE `tela_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tela_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_cliente_deliveries`
--

DROP TABLE IF EXISTS `token_cliente_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_cliente_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `token_cliente_deliveries_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `token_cliente_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_cliente_deliveries`
--

LOCK TABLES `token_cliente_deliveries` WRITE;
/*!40000 ALTER TABLE `token_cliente_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_cliente_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_webs`
--

DROP TABLE IF EXISTS `token_webs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_webs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `token_webs_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `token_webs_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_webs`
--

LOCK TABLES `token_webs` WRITE;
/*!40000 ALTER TABLE `token_webs` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_webs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportadoras`
--

DROP TABLE IF EXISTS `transportadoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportadoras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj_cpf` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000.000.000-00',
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transportadoras_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `transportadoras_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportadoras`
--

LOCK TABLES `transportadoras` WRITE;
/*!40000 ALTER TABLE `transportadoras` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributacaos`
--

DROP TABLE IF EXISTS `tributacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributacaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `icms` decimal(4,2) NOT NULL,
  `pis` decimal(4,2) NOT NULL,
  `cofins` decimal(4,2) NOT NULL,
  `ipi` decimal(4,2) NOT NULL,
  `ncm_padrao` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000.00.00',
  `regime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributacaos`
--

LOCK TABLES `tributacaos` WRITE;
/*!40000 ALTER TABLE `tributacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_cargas`
--

DROP TABLE IF EXISTS `unidade_cargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_cargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `id_unidade_carga` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidade_cargas_info_id_foreign` (`info_id`),
  CONSTRAINT `unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_cargas`
--

LOCK TABLES `unidade_cargas` WRITE;
/*!40000 ALTER TABLE `unidade_cargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade_cargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adm` tinyint(1) NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL,
  `acesso_cliente` tinyint(1) NOT NULL,
  `acesso_fornecedor` tinyint(1) NOT NULL,
  `acesso_produto` tinyint(1) NOT NULL,
  `acesso_financeiro` tinyint(1) NOT NULL,
  `acesso_caixa` tinyint(1) NOT NULL,
  `acesso_estoque` tinyint(1) NOT NULL,
  `acesso_compra` tinyint(1) NOT NULL,
  `acesso_fiscal` tinyint(1) NOT NULL,
  `venda_nao_fiscal` tinyint(1) NOT NULL,
  `acesso_cte` tinyint(1) NOT NULL,
  `acesso_mdfe` tinyint(1) NOT NULL,
  `tema` int NOT NULL DEFAULT '1',
  `tema_menu` int NOT NULL DEFAULT '1',
  `permissao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Usuário','usuario',1,'202cb962ac59075b964b07152d234b70','',1,1,1,1,1,1,1,1,1,1,1,1,1,1,'[\"\\/categorias\",\"\\/produtos\",\"\\/clientes\",\"\\/fornecedores\",\"\\/transportadoras\",\"\\/funcionarios\",\"\\/categoriasServico\",\"\\/servicos\",\"\\/listaDePrecos\",\"\\/categoriasConta\",\"\\/veiculos\",\"\\/usuarios\",\"\\/compraFiscal\",\"\\/compraManual\",\"\\/compras\",\"\\/cotacao\",\"\\/dfe\",\"\\/estoque\",\"\\/estoque\\/apontamentoProducao\",\"\\/vendas\\/lista\",\"\\/vendas\\/nova\",\"\\/frenteCaixa\",\"\\/orcamentoVenda\",\"\\/ordemServico\",\"\\/vendasEmCredito\",\"\\/devolucao\",\"\\/agendamentos\",\"\\/contasPagar\",\"\\/contasReceber\",\"\\/fluxoCaixa\",\"\\/graficos\",\"\\/pedidos\",\"\\/telasPedido\",\"\\/controleCozinha\\/selecionar\",\"\\/mesas\",\"\\/pedidos\\/controleComandas\",\"\\/cte\",\"\\/cte\\/nova\",\"\\/categoriaDespesa\",\"\\/mdfe\",\"\\/mdfe\\/nova\",\"\\/relatorios\",\"\\/dre\",\"\\/deliveryCategoria\",\"\\/deliveryProduto\",\"\\/deliveryComplemento\",\"\\/bairrosDelivery\",\"\\/pedidosDelivery\",\"\\/pedidosDelivery\\/frente\",\"\\/configDelivery\",\"\\/funcionamentoDelivery\",\"\\/push\",\"\\/tamanhosPizza\",\"\\/motoboys\",\"\\/codigoDesconto\",\"\\/configNF\",\"\\/escritorio\",\"\\/naturezaOperacao\",\"\\/tributos\",\"\\/enviarXml\",\"\\/ibpt\",\"\\/categoriaEcommerce\",\"\\/produtoEcommerce\",\"\\/pedidosEcommerce\",\"\\/configEcommerce\",\"\\/carrosselEcommerce\",\"\\/autorPost\",\"\\/categoriaPosts\",\"\\/postBlog\",\"\\/contatoEcommerce\",\"\\/informativoEcommerce\",\"\\/clienteEcommerce\",\"\\/configEcommerce\\/verSite\"]','2022-10-27 17:14:24','2022-10-27 17:14:24');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vale_pedagios`
--

DROP TABLE IF EXISTS `vale_pedagios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vale_pedagios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cnpj_fornecedor` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj_fornecedor_pagador` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_compra` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vale_pedagios_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `vale_pedagios_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vale_pedagios`
--

LOCK TABLES `vale_pedagios` WRITE;
/*!40000 ALTER TABLE `vale_pedagios` DISABLE KEYS */;
/*!40000 ALTER TABLE `vale_pedagios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `placa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rntrc` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_carroceira` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_rodado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tara` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidade` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_ie` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_tp` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_caixas`
--

DROP TABLE IF EXISTS `venda_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) NOT NULL,
  `dinheiro_recebido` decimal(10,2) NOT NULL,
  `troco` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NFcNumero` int NOT NULL DEFAULT '0',
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_xml` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido_delivery_id` int NOT NULL,
  `tipo_pagamento_1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_pagamento_1` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tipo_pagamento_2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_pagamento_2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tipo_pagamento_3` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_pagamento_3` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bandeira_cartao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cAut_cartao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descricao_pag_outros` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_caixas_cliente_id_foreign` (`cliente_id`),
  KEY `venda_caixas_usuario_id_foreign` (`usuario_id`),
  KEY `venda_caixas_natureza_id_foreign` (`natureza_id`),
  CONSTRAINT `venda_caixas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `venda_caixas_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `venda_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_caixas`
--

LOCK TABLES `venda_caixas` WRITE;
/*!40000 ALTER TABLE `venda_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned NOT NULL,
  `frete_id` int unsigned DEFAULT NULL,
  `transportadora_id` int unsigned DEFAULT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_cce` int NOT NULL,
  `NfNumero` int NOT NULL DEFAULT '0',
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_xml` varchar(51) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido_ecommerce_id` int NOT NULL DEFAULT '0',
  `bandeira_cartao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cAut_cartao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descricao_pag_outros` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendas_cliente_id_foreign` (`cliente_id`),
  KEY `vendas_usuario_id_foreign` (`usuario_id`),
  KEY `vendas_natureza_id_foreign` (`natureza_id`),
  KEY `vendas_frete_id_foreign` (`frete_id`),
  KEY `vendas_transportadora_id_foreign` (`transportadora_id`),
  CONSTRAINT `vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `vendas_frete_id_foreign` FOREIGN KEY (`frete_id`) REFERENCES `fretes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vendas_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `vendas_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vendas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-27 14:15:49
