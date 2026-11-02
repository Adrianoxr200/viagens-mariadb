-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb-215849-db.mariadb-215849:10002
-- Tempo de geração: 02-Nov-2026 às 15:27
-- Versão do servidor: 11.1.2-MariaDB-1:11.1.2+maria~ubu2004
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_tcgpokemon_cards`
--
CREATE DATABASE IF NOT EXISTS `db_tcgpokemon_cards` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `db_tcgpokemon_cards`;
--
-- Banco de dados: `viagens`
--
CREATE DATABASE IF NOT EXISTS `viagens` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `viagens`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'Nome do destino',
  `descricao` varchar(255) NOT NULL COMMENT 'Descrição do destino'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `destinos`
--

INSERT INTO `destinos` (`id`, `nome`, `descricao`) VALUES
(1, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(2, 'Chapada dos Veadeiros', 'Parque nacional conhecido por suas cachoeiras e formações rochosas'),
(3, 'Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura'),
(4, 'Fernando de Noronha', 'Arquipélago vulcânico famoso pelas praias preservadas e vida marinha'),
(5, 'Gramado', 'Cidade charmosa na serra gaúcha com influência europeia e clima frio'),
(6, 'Jericoacoara', 'Vila de pescadores rústica cercada por dunas, lagoas e mar tranquilo'),
(7, 'Ouro Preto', 'Cidade histórica mineira com arquitetura barroca e ladeiras de pedra'),
(8, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL COMMENT 'Referência ao ID do usuário que fez a reserva',
  `id_destino` int(11) DEFAULT NULL COMMENT 'Referência ao ID do destino da reserva',
  `data` date DEFAULT NULL COMMENT 'Data da reserva',
  `status` varchar(255) DEFAULT 'pendente' COMMENT 'Status da reserva (confirmada, cancelada, etc.)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `reservas`
--

INSERT INTO `reservas` (`id`, `id_usuario`, `id_destino`, `data`, `status`) VALUES
(3, 3, 3, '2023-09-20', 'cancelada'),
(4, 1, 1, '2026-06-15', 'confirmada'),
(5, 2, 3, '2026-07-20', 'pendente'),
(6, 3, 2, '2026-08-10', 'confirmada'),
(7, 4, 5, '2026-09-05', 'cancelada'),
(8, 5, 4, '2026-10-12', 'pendente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'Nome do usuário',
  `email` varchar(255) NOT NULL COMMENT 'Endereço de e-mail do usuário',
  `data_nascimento` date NOT NULL COMMENT 'Data de nascimento do usuário',
  `rua` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `data_nascimento`, `rua`, `numero`, `cidade`, `estado`) VALUES
(1, 'João Silva', 'joao@example.com', '1990-05-15', 'Rua A', ' 123', ' Cidade X', ' Estado Y'),
(2, 'Maria Santos', 'maria@example.com', '1985-08-22', 'Rua B', ' 456', ' Cidade Y', ' Estado Z'),
(3, 'Pedro Souza', 'pedro@example.com', '1998-02-10', 'Avenida C', ' 789', ' Cidade X', ' Estado Y'),
(4, 'Fernanda Rocha', 'fernanda@example.com', '1992-07-19', 'Rua F', ' 303', ' Cidade Y', ' Estado Z'),
(5, 'Juliana Alves', 'juliana@example.com', '1993-09-04', 'Rua H', ' 505', ' Cidade X', ' Estado Y'),
(6, 'Carlos Lima', 'carlos@example.com', '1988-11-30', 'Avenida E', ' 202', ' Cidade X', ' Estado Y'),
(7, 'Lucas Martins', 'lucas@example.com', '2000-01-25', 'Avenida G', ' 404', ' Cidade Z', ' Estado W'),
(8, 'Ana Costa', 'ana@example.com', '1995-03-12', 'Rua D', ' 101', ' Cidade Z', ' Estado W');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservas_usuarios` (`id_usuario`),
  ADD KEY `fk_reservas_destinos` (`id_destino`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_reservas_destinos` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id`),
  ADD CONSTRAINT `fk_reservas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
