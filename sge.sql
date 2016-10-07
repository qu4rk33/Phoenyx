-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Out-2016 às 03:46
-- Versão do servidor: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sge`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `matricula` varchar(5) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `data_nasc` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_nota`
--

CREATE TABLE `aluno_nota` (
  `matricula` varchar(5) NOT NULL,
  `disciplina_id` int(5) NOT NULL,
  `nota` int(11) NOT NULL,
  `ano_letivo` date NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='INCOMPLETO';

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `disciplina_id` varchar(5) NOT NULL,
  `disciplina_nome` varchar(16) NOT NULL,
  `anoserie` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materia`
--

CREATE TABLE `materia` (
  `materia_id` varchar(5) NOT NULL,
  `nome` text NOT NULL,
  `descricao` text NOT NULL,
  `disciplina_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor_disciplinas`
--

CREATE TABLE `professor_disciplinas` (
  `matricula` varchar(10) NOT NULL,
  `disciplina_id` varchar(5) NOT NULL,
  `ano_letivo` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `profs`
--

CREATE TABLE `profs` (
  `matricula` varchar(10) NOT NULL,
  `nome` tinytext NOT NULL,
  `data_nasc` date NOT NULL,
  `cpf` tinyint(11) NOT NULL,
  `telefone_celular` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `profs`
--

INSERT INTO `profs` (`matricula`, `nome`, `data_nasc`, `cpf`, `telefone_celular`, `email`, `data_mod`) VALUES
('1', 'Jacinto ', '1946-09-06', 1, '1', 'jacintao@gmail.com', '2016-09-22 04:31:13');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof_diario`
--

CREATE TABLE `prof_diario` (
  `cod_aula` varchar(10) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `turma` varchar(5) NOT NULL,
  `data` date NOT NULL,
  `disciplina_id` varchar(5) NOT NULL,
  `comentario` int(11) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof_diario_aluno`
--

CREATE TABLE `prof_diario_aluno` (
  `cod_aula` varchar(10) NOT NULL,
  `matricula` varchar(5) NOT NULL,
  `presente` varchar(3) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof_turma`
--

CREATE TABLE `prof_turma` (
  `matricula` varchar(10) NOT NULL,
  `cod_turma` varchar(5) NOT NULL,
  `ano_letivo` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `provas`
--

CREATE TABLE `provas` (
  `cod_prova` varchar(5) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `cod_disciplina` varchar(5) NOT NULL,
  `anoserie` varchar(5) NOT NULL,
  `tipo_avaliacao` varchar(20) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prova_questoes`
--

CREATE TABLE `prova_questoes` (
  `cod_prova` varchar(5) NOT NULL,
  `cod_quest` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `questoes`
--

CREATE TABLE `questoes` (
  `cod_quest` int(12)  PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'codigo associado a questao ( cahave primaria)',
  `autor` varchar(50) NOT NULL COMMENT 'autor da questao; ou cod_prof ou enem,uff etc ',
  `nivel` char(1) NOT NULL COMMENT 'a dificuldade da questao: b>baixo,m>medio,a>alto',
  `tipo` char(1) NOT NULL COMMENT 'd>discursiva e o>objetivas',
  `disciplina_id` varchar(5) NOT NULL,
  `materia_id` varchar(5) NOT NULL,
  `enunciado` text NOT NULL,
  `op1` text NOT NULL,
  `op2` text NOT NULL,
  `op3` text NOT NULL,
  `op4` text NOT NULL,
  `op5` text NOT NULL,
  `gabarito` text NOT NULL,
  `ano_letivo` varchar(4) NOT NULL,
  `anoserie` varchar(5) NOT NULL,
  `visibilidade` varchar(3) NOT NULL COMMENT 'pub:publico ou pri:privado(disponivel somente para o prof criador da questao)',
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `questoes`
--

INSERT INTO `questoes` (`cod_quest`, `autor`, `nivel`, `tipo`, `disciplina_id`, `materia_id`, `enunciado`, `op1`, `op2`, `op3`, `op4`, `op5`, `gabarito`, `ano_letivo`, `anoserie`, `visibilidade`, `data_mod`) VALUES
(0, 'Jacinto', 'B', 'D', 'undef', 'undef', 'Iza é de cu mer ?', '', '', '', '', '', 'sim', '2016', '3º an', 'Púb', '2016-10-06 01:40:41');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_prova`
--

CREATE TABLE `tipo_prova` (
  `tipo_avaliacao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_prova`
--

INSERT INTO `tipo_prova` (`tipo_avaliacao`) VALUES
('1° certificação '),
('1° certificação recuperação '),
('2° certificação '),
('2° certificação recuperação '),
('3° certificação '),
('3° certificação recuperação ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `cod_turma` varchar(5) NOT NULL,
  `anoserie` varchar(6) NOT NULL,
  `sala` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma_aluno`
--

CREATE TABLE `turma_aluno` (
  `cod_turma` varchar(5) NOT NULL,
  `matricula` varchar(5) NOT NULL,
  `ano_letovo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `matricula` varchar(10) NOT NULL,
  `username` tinytext NOT NULL,
  `senha` tinytext NOT NULL,
  `permissao` varchar(10) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`matricula`, `username`, `senha`, `permissao`, `data_mod`) VALUES
('1', 'Jacinto ', '1', 'Professor', '2016-09-22 04:31:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`matricula`);

--
-- Indexes for table `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`disciplina_id`);

--
-- Indexes for table `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`materia_id`);

--
-- Indexes for table `profs`
--
ALTER TABLE `profs`
  ADD PRIMARY KEY (`matricula`);

--
-- Indexes for table `prof_diario`
--
ALTER TABLE `prof_diario`
  ADD PRIMARY KEY (`cod_aula`);

--
-- Indexes for table `provas`
--
ALTER TABLE `provas`
  ADD PRIMARY KEY (`cod_prova`);

--
-- Indexes for table `questoes`
--
ALTER TABLE `questoes`
  ADD PRIMARY KEY (`cod_quest`);

--
-- Indexes for table `tipo_prova`
--
ALTER TABLE `tipo_prova`
  ADD PRIMARY KEY (`tipo_avaliacao`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`cod_turma`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`matricula`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
