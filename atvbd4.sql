-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Ago-2022 às 09:42
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `atvbd4`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `Nome` varchar(50) NOT NULL,
  `Sigla` varchar(10) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `Coordenador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`Nome`, `Sigla`, `Codigo`, `Coordenador`) VALUES
('Tec. Telematica', 'DTT', 121, 121031),
('Tec. Construção de Edifícios', 'DCE', 122, 122047),
('Eng. Computação', 'DEC', 125, 125331);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependente`
--

CREATE TABLE `dependente` (
  `MatricProf` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `RG` varchar(12) NOT NULL,
  `DataNasc` date NOT NULL,
  `Sexo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `dependente`
--

INSERT INTO `dependente` (`MatricProf`, `Nome`, `RG`, `DataNasc`, `Sexo`) VALUES
(121003, 'Henrique Lopes', '214365879-01', '2022-03-08', 'M'),
(121003, 'Laura Medeiros', '987654321-01', '2022-11-16', 'F'),
(125332, 'Claudia Baetas', '123456789-01', '2020-01-01', 'F');

-- --------------------------------------------------------

--
-- Estrutura da tabela `email`
--

CREATE TABLE `email` (
  `MatProf` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `email`
--

INSERT INTO `email` (`MatProf`, `email`) VALUES
(121003, 'Pedro@yahoo.com.br'),
(122045, 'Bento@yahoo.com.br'),
(125332, 'Joana@yahoo.com.br'),
(125335, 'João@yahoo.com.br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `Nome` varchar(50) NOT NULL,
  `SNome` varchar(50) NOT NULL,
  `Matricula` int(11) NOT NULL,
  `DataNasc` date NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Salario` decimal(10,2) NOT NULL,
  `Matric_Coord_Area` int(11) DEFAULT NULL,
  `Depto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`Nome`, `SNome`, `Matricula`, `DataNasc`, `Sexo`, `Salario`, `Matric_Coord_Area`, `Depto`) VALUES
('Pedro', 'Pereira da Siva', 121003, '1982-03-25', 'M', '4000.00', NULL, 121),
('José Maria', 'Campos', 121031, '1978-04-10', 'M', '7000.00', 121003, 121),
('Bento', 'Diniz Costa', 122045, '1980-11-27', 'M', '4000.00', NULL, 122),
('Ana Clara', 'Araújo Santos', 122047, '1994-12-30', 'F', '7200.00', 122045, 122),
('Maria Luiza', 'Machado', 125331, '1974-08-16', 'F', '6800.00', 125332, 125),
('Joana Maria', 'Pereira', 125332, '1990-06-12', 'F', '4500.00', NULL, 125),
('João Carlos', 'Matos Cavalcanti', 125335, '1976-07-22', 'M', '3700.00', 125332, 125);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `Nome` varchar(50) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `Depto` int(11) DEFAULT NULL,
  `Duraçao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`Nome`, `Codigo`, `Depto`, `Duraçao`) VALUES
('Eletricidade Estatica', 0, 125, 200),
('Wi-fi', 1, 121, 205),
('Concreto', 2, 122, 220),
('Aplicações de Big Data', 3, 125, 500);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `MatricProf` int(11) NOT NULL,
  `telefone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`MatricProf`, `telefone`) VALUES
(121003, 12341234),
(121003, 43214321),
(125332, 56785678);

-- --------------------------------------------------------

--
-- Estrutura da tabela `trabalha_em`
--

CREATE TABLE `trabalha_em` (
  `MatricProf` int(11) NOT NULL,
  `CodProj` int(11) NOT NULL,
  `Horas` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `trabalha_em`
--

INSERT INTO `trabalha_em` (`MatricProf`, `CodProj`, `Horas`) VALUES
(121003, 1, '00:00:08'),
(122045, 2, '00:00:08'),
(125332, 0, '00:00:08');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `Coordenador` (`Coordenador`);

--
-- Índices para tabela `dependente`
--
ALTER TABLE `dependente`
  ADD PRIMARY KEY (`MatricProf`,`RG`);

--
-- Índices para tabela `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`MatProf`,`email`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`Matricula`),
  ADD KEY `Matric_Coord_Area` (`Matric_Coord_Area`),
  ADD KEY `Depto` (`Depto`);

--
-- Índices para tabela `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `Depto` (`Depto`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`MatricProf`,`telefone`);

--
-- Índices para tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD PRIMARY KEY (`MatricProf`,`CodProj`),
  ADD KEY `CodProj` (`CodProj`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`Coordenador`) REFERENCES `professor` (`Matricula`);

--
-- Limitadores para a tabela `dependente`
--
ALTER TABLE `dependente`
  ADD CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`MatricProf`) REFERENCES `professor` (`Matricula`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`Matric_Coord_Area`) REFERENCES `professor` (`Matricula`),
  ADD CONSTRAINT `professor_ibfk_2` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Codigo`);

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Codigo`);

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`MatricProf`) REFERENCES `professor` (`Matricula`);

--
-- Limitadores para a tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD CONSTRAINT `trabalha_em_ibfk_1` FOREIGN KEY (`MatricProf`) REFERENCES `professor` (`Matricula`),
  ADD CONSTRAINT `trabalha_em_ibfk_2` FOREIGN KEY (`CodProj`) REFERENCES `projeto` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
