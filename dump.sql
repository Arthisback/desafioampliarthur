-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.9.1-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para medicalchallenge
CREATE DATABASE IF NOT EXISTS `medicalchallenge` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `medicalchallenge`;

-- Copiando estrutura para tabela medicalchallenge.agendamentos
CREATE TABLE IF NOT EXISTS `agendamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) DEFAULT NULL,
  `id_profissional` int(11) NOT NULL,
  `dh_inicio` datetime NOT NULL,
  `dh_fim` datetime NOT NULL,
  `id_convenio` int(11) DEFAULT NULL,
  `id_procedimento` int(11) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agendamento_id_convenio_idx` (`id_convenio`),
  KEY `agendamento_id_procedimento_idx` (`id_procedimento`),
  KEY `agendamento_id_profissional_idx` (`id_profissional`),
  KEY `agendamento_id_paciente_idx` (`id_paciente`),
  CONSTRAINT `agendamento_id_convenio` FOREIGN KEY (`id_convenio`) REFERENCES `convenios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agendamento_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agendamento_id_procedimento` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agendamento_id_profissional` FOREIGN KEY (`id_profissional`) REFERENCES `profissionais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela medicalchallenge.agendamentos: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `agendamentos` DISABLE KEYS */;
INSERT INTO `agendamentos` (`id`, `id_paciente`, `id_profissional`, `dh_inicio`, `dh_fim`, `id_convenio`, `id_procedimento`, `observacoes`) VALUES
	(1, 1, 85217, '2021-05-12 11:15:00', '2021-05-12 11:30:00', 1, 1, 'Primeira consulta do paciente.'),
	(2, 1, 85217, '2021-05-14 08:00:00', '2021-05-14 08:30:00', 1, 2, 'Retorno do paciente.'),
	(3, 3, 85218, '2021-06-01 14:30:00', '2021-06-01 14:45:00', 4, 3, 'Acompanhamento de rotina.'),
	(4, 10268, 1, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 5, 1, 'primeira consulta do paciente'),
	(5, 10272, 2, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 3, 1, '100'),
	(6, 10269, 1, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 2, 1, 'não cobrar'),
	(7, 10275, 1, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 2, 1, ''),
	(8, 10274, 2, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 5, 1, 'paciente com dores fortes'),
	(9, 10276, 2, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 5, 1, 'parente do Dr. Lucas'),
	(10, 10269, 1, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 2, 1, 'xxx'),
	(11, 10270, 2, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 5, 1, ''),
	(12, 10272, 1, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 3, 2, ''),
	(13, 10275, 2, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 2, 1, ''),
	(14, 10268, 2, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 5, 2, ''),
	(15, 10270, 1, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 5, 1, 'paciente indicado pela filha do dr.'),
	(16, 10272, 1, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 3, 1, ''),
	(17, 10271, 2, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 3, 1, '…'),
	(18, 10271, 1, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 3, 3, ''),
	(19, 10274, 1, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 5, 2, 'X-x-x-x'),
	(20, 10277, 1, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 3, 1, ''),
	(21, 10268, 2, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 5, 3, 'dores de cabeça muito fortes'),
	(22, 10276, 2, '1969-12-31 21:00:00', '1969-12-31 21:00:00', 5, 1, 'queixa de dor na coluna');
/*!40000 ALTER TABLE `agendamentos` ENABLE KEYS */;

-- Copiando estrutura para tabela medicalchallenge.convenios
CREATE TABLE IF NOT EXISTS `convenios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela medicalchallenge.convenios: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `convenios` DISABLE KEYS */;
INSERT INTO `convenios` (`id`, `nome`, `descricao`) VALUES
	(1, 'Particular', 'Convênio Particular (Padrão)'),
	(2, 'DevMed', 'Convênio da Empresa Dev'),
	(3, 'Migração', NULL),
	(4, 'MigraMed', 'Convênio dos Funcionário de Migração da Empresa Dev'),
	(5, 'Hospital', NULL);
/*!40000 ALTER TABLE `convenios` ENABLE KEYS */;

-- Copiando estrutura para tabela medicalchallenge.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sexo` enum('Masculino','Feminino') NOT NULL,
  `nascimento` date DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `id_convenio` int(11) DEFAULT NULL,
  `cod_referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paciente_id_convenio_idx` (`id_convenio`),
  CONSTRAINT `paciente_id_convenio` FOREIGN KEY (`id_convenio`) REFERENCES `convenios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10278 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela medicalchallenge.pacientes: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` (`id`, `nome`, `sexo`, `nascimento`, `cpf`, `rg`, `id_convenio`, `cod_referencia`) VALUES
	(1, 'Paciente de Testes', 'Masculino', '1989-05-12', '000.000.000-00', '00000-0', 1, NULL),
	(2, 'Fulano de Tal', 'Masculino', '1974-06-19', '111.111.111-22', '11111-2', 1, NULL),
	(3, 'Ciclano de Tal', 'Masculino', '2001-12-25', '222.222.222-33', '22222-3', 4, NULL),
	(4, 'Rúben Rebelo César', 'Masculino', '1990-02-05', '908.394.690-80', '27.046.463-3', 5, NULL),
	(5, 'Lázaro Goulart Camarinho', 'Masculino', '1983-04-06', '095.805.480-05', '25.903.805-2', 2, NULL),
	(6, 'Gabrielly Sesimbra Candeias', 'Feminino', '1967-12-12', '207.182.310-90', '41.845.430-9', 5, NULL),
	(7, 'Hernâni Fidalgo Brito', 'Masculino', '1969-12-31', '307.522.380-86', '42.896.829-6', 3, NULL),
	(8, 'Isaac Severiano Nunes', 'Masculino', '1969-12-31', '007.217.650-41', '49.040.121-1', 3, NULL),
	(9, 'Amélie Azenha Fontoura', 'Feminino', '1969-12-31', '610.800.760-50', '26.659.290-9', 5, NULL),
	(10, 'Joel Medina Covilhã', 'Masculino', '1969-12-31', '468.052.020-51', '13.060.699-6', 2, NULL),
	(11, 'Lorenzo Milheirão Remígio', 'Masculino', '1969-12-31', '247.294.840-96', '45.056.413-7', 5, NULL),
	(12, 'Gabriella Fialho Feijó', 'Feminino', '1969-12-31', '454.421.590-00', '42.395.070-8', 3, NULL),
	(10268, 'Rúben Rebelo César', 'Masculino', NULL, NULL, NULL, NULL, NULL),
	(10269, 'Lázaro Goulart Camarinho', 'Masculino', NULL, NULL, NULL, NULL, NULL),
	(10270, 'Gabrielly Sesimbra Candeias', 'Masculino', NULL, NULL, NULL, NULL, NULL),
	(10271, 'Hernâni Fidalgo Brito', 'Masculino', NULL, NULL, NULL, NULL, NULL),
	(10272, 'Isaac Severiano Nunes', 'Masculino', NULL, NULL, NULL, NULL, NULL),
	(10274, 'Amélie Azenha Fontoura', 'Masculino', NULL, NULL, NULL, NULL, NULL),
	(10275, 'Joel Medina Covilhã', 'Masculino', NULL, NULL, NULL, NULL, NULL),
	(10276, 'Lorenzo Milheirão Remígio', 'Masculino', NULL, NULL, NULL, NULL, NULL),
	(10277, 'Gabriella Fialho Feijó', 'Masculino', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;

-- Copiando estrutura para tabela medicalchallenge.procedimentos
CREATE TABLE IF NOT EXISTS `procedimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela medicalchallenge.procedimentos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `procedimentos` DISABLE KEYS */;
INSERT INTO `procedimentos` (`id`, `nome`, `descricao`) VALUES
	(1, 'Consulta', 'Procedimento Padrão da Clínica'),
	(2, 'Retorno', 'Pacientes em Caráter de Retorno'),
	(3, 'Acompanhamento', 'Consulta de Acompanhamento');
/*!40000 ALTER TABLE `procedimentos` ENABLE KEYS */;

-- Copiando estrutura para tabela medicalchallenge.profissionais
CREATE TABLE IF NOT EXISTS `profissionais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `crm` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85220 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela medicalchallenge.profissionais: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `profissionais` DISABLE KEYS */;
INSERT INTO `profissionais` (`id`, `nome`, `crm`) VALUES
	(1, 'Pietro', NULL),
	(2, 'Dr. Lucas', NULL),
	(85217, 'Dr. Lucas KNE', NULL),
	(85218, 'Dr. Analista Pietro', NULL),
	(85219, 'Suporte MedicalChallenge', NULL);
/*!40000 ALTER TABLE `profissionais` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
