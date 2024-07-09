-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioadmzepe
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `emprestimos`
--

DROP TABLE IF EXISTS `emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos` (
  `id_emprestimo` bigint NOT NULL,
  `data_emprestimo` datetime(6) NOT NULL,
  `data_entrega` datetime(6) NOT NULL,
  `devolucao` varchar(255) NOT NULL,
  `estudante_id_estudante` bigint DEFAULT NULL,
  `livro_id_livro` bigint DEFAULT NULL,
  PRIMARY KEY (`id_emprestimo`),
  UNIQUE KEY `UK9fqd1hrpjhaqqm5t43lji6g35` (`livro_id_livro`),
  KEY `FK3deqtgq0vktic5drvp5fiytde` (`estudante_id_estudante`),
  CONSTRAINT `FK3deqtgq0vktic5drvp5fiytde` FOREIGN KEY (`estudante_id_estudante`) REFERENCES `estudantes` (`id_estudante`),
  CONSTRAINT `FK7h1f0439k48f8dagdu5ktfetk` FOREIGN KEY (`livro_id_livro`) REFERENCES `livros` (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos`
--

LOCK TABLES `emprestimos` WRITE;
/*!40000 ALTER TABLE `emprestimos` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprestimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimos_seq`
--

DROP TABLE IF EXISTS `emprestimos_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos_seq`
--

LOCK TABLES `emprestimos_seq` WRITE;
/*!40000 ALTER TABLE `emprestimos_seq` DISABLE KEYS */;
INSERT INTO `emprestimos_seq` VALUES (1);
/*!40000 ALTER TABLE `emprestimos_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudantes`
--

DROP TABLE IF EXISTS `estudantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudantes` (
  `id_estudante` bigint NOT NULL,
  `email` varchar(255) NOT NULL,
  `matricula` bigint NOT NULL,
  `nascimento` datetime(6) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estudante`),
  UNIQUE KEY `UK3clhwl2qjbup9m41a4424bua2` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudantes`
--

LOCK TABLES `estudantes` WRITE;
/*!40000 ALTER TABLE `estudantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudantes_seq`
--

DROP TABLE IF EXISTS `estudantes_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudantes_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudantes_seq`
--

LOCK TABLES `estudantes_seq` WRITE;
/*!40000 ALTER TABLE `estudantes_seq` DISABLE KEYS */;
INSERT INTO `estudantes_seq` VALUES (1);
/*!40000 ALTER TABLE `estudantes_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `id_livro` bigint NOT NULL,
  `ano` int NOT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `editora` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `emprestimo_id_emprestimo` bigint DEFAULT NULL,
  PRIMARY KEY (`id_livro`),
  UNIQUE KEY `UKb74w7dvhx74vsyyvlbaxl8yk9` (`emprestimo_id_emprestimo`),
  CONSTRAINT `FK7gu1k05p20tef9l5ufovlrv7w` FOREIGN KEY (`emprestimo_id_emprestimo`) REFERENCES `emprestimos` (`id_emprestimo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros_seq`
--

DROP TABLE IF EXISTS `livros_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros_seq`
--

LOCK TABLES `livros_seq` WRITE;
/*!40000 ALTER TABLE `livros_seq` DISABLE KEYS */;
INSERT INTO `livros_seq` VALUES (1);
/*!40000 ALTER TABLE `livros_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-21 10:00:02
