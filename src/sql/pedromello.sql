-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 03-Jan-2021 às 02:32
-- Versão do servidor: 8.0.22-0ubuntu0.20.04.3
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pedromello`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidadão`
--

CREATE TABLE `cidadão` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `documentos` varchar(100) DEFAULT NULL,
  `documentos_cidadao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabela de cidadãos, na qual conectará-se com os documentos e poderá inserir ou visualizar no app.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `documentos`
--

CREATE TABLE `documentos` (
  `id_documentos` varchar(100) NOT NULL,
  `certidao_nascimento` varchar(100) DEFAULT NULL,
  `nome_social` varchar(100) DEFAULT NULL,
  `relatorio_medico` varchar(100) DEFAULT NULL,
  `tipagem_sanguinea` varchar(100) DEFAULT NULL,
  `cidadao_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` varchar(100) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Funcionários do ecossistema';

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cidadão`
--
ALTER TABLE `cidadão`
  ADD UNIQUE KEY `Cidadão_id_IDX` (`id`) USING BTREE,
  ADD UNIQUE KEY `cidadão_FK` (`documentos`) USING BTREE;

--
-- Índices para tabela `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id_documentos`),
  ADD KEY `cidadao_id` (`cidadao_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cidadão`
--
ALTER TABLE `cidadão`
  ADD CONSTRAINT `cidadão_FK` FOREIGN KEY (`documentos`) REFERENCES `documentos` (`id_documentos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cidadão_ibfk_1` FOREIGN KEY (`documentos`) REFERENCES `documentos` (`id_documentos`),
  ADD CONSTRAINT `FK_CidadaoDocumentos` FOREIGN KEY (`documentos`) REFERENCES `documentos` (`id_documentos`);

--
-- Limitadores para a tabela `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`cidadao_id`) REFERENCES `cidadão` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
