-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 07-Set-2016 às 05:49
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 5.5.35

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sge`
--
DROP DATABASE `sge`;
CREATE DATABASE IF NOT EXISTS `sge` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sge`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--
-- Criação: 04-Set-2016 às 18:46
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `matricula` varchar(5) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `data_nasc` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `aluno`:
--   `matricula`
--       `usuario` -> `matricula`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_nota`
--
-- Criação: 07-Set-2016 às 02:33
--

DROP TABLE IF EXISTS `aluno_nota`;
CREATE TABLE IF NOT EXISTS `aluno_nota` (
  `matricula` varchar(5) NOT NULL,
  `disciplina_id` int(5) NOT NULL,
  `nota` int(11) NOT NULL,
  `tipo_avaliacao` varchar(30) NOT NULL,
  `ano_letivo` year(4) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='INCOMPLETO';

--
-- RELATIONS FOR TABLE `aluno_nota`:
--   `disciplina_id`
--       `disciplinas` -> `disciplina_id`
--   `matricula`
--       `aluno` -> `matricula`
--   `tipo_avaliacao`
--       `tipo_prova` -> `tipo_avaliacao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--
-- Criação: 04-Set-2016 às 13:56
--

DROP TABLE IF EXISTS `disciplinas`;
CREATE TABLE IF NOT EXISTS `disciplinas` (
  `disciplina_id` varchar(5) NOT NULL,
  `disciplina_nome` varchar(16) NOT NULL,
  `anoserie` varchar(5) NOT NULL,
  PRIMARY KEY (`disciplina_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `disciplinas`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `materia`
--
-- Criação: 04-Set-2016 às 13:57
--

DROP TABLE IF EXISTS `materia`;
CREATE TABLE IF NOT EXISTS `materia` (
  `materia_id` varchar(5) NOT NULL,
  `nome` text NOT NULL,
  `descricao` text NOT NULL,
  `disciplina_id` varchar(5) NOT NULL,
  PRIMARY KEY (`materia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `materia`:
--   `disciplina_id`
--       `disciplinas` -> `disciplina_id`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof_diario`
--
-- Criação: 04-Set-2016 às 23:54
--

DROP TABLE IF EXISTS `prof_diario`;
CREATE TABLE IF NOT EXISTS `prof_diario` (
  `cod_aula` varchar(10) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `turma` varchar(5) NOT NULL,
  `disciplina_id` varchar(5) NOT NULL,
  `data` date NOT NULL,
  `comentario` int(11) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `prof_diario`:
--   `disciplina_id`
--       `disciplinas` -> `disciplina_id`
--   `matricula`
--       `profs` -> `matricula`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof_diario_aluno`
--
-- Criação: 04-Set-2016 às 19:20
--

DROP TABLE IF EXISTS `prof_diario_aluno`;
CREATE TABLE IF NOT EXISTS `prof_diario_aluno` (
  `cod_aula` varchar(10) NOT NULL,
  `matricula` varchar(5) NOT NULL,
  `presente` varchar(3) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `prof_diario_aluno`:
--   `cod_aula`
--       `prof_diario` -> `cod_aula`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof_turma`
--
-- Criação: 29-Ago-2016 às 03:15
--

DROP TABLE IF EXISTS `prof_turma`;
CREATE TABLE IF NOT EXISTS `prof_turma` (
  `matricula` varchar(10) NOT NULL,
  `cod_turma` varchar(5) NOT NULL,
  `ano_letivo` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `prof_turma`:
--   `cod_turma`
--       `turma` -> `cod_turma`
--   `matricula`
--       `profs` -> `matricula`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor_disciplinas`
--
-- Criação: 04-Set-2016 às 12:55
--

DROP TABLE IF EXISTS `professor_disciplinas`;
CREATE TABLE IF NOT EXISTS `professor_disciplinas` (
  `matricula` varchar(10) NOT NULL,
  `disciplina_id` varchar(5) NOT NULL,
  `ano_letivo` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `professor_disciplinas`:
--   `disciplina_id`
--       `disciplinas` -> `disciplina_id`
--   `matricula`
--       `profs` -> `matricula`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `profs`
--
-- Criação: 04-Set-2016 às 14:36
--

DROP TABLE IF EXISTS `profs`;
CREATE TABLE IF NOT EXISTS `profs` (
  `matricula` varchar(10) NOT NULL,
  `nome` tinytext NOT NULL,
  `data_nasc` date NOT NULL,
  `cpf` tinyint(11) NOT NULL,
  `telefone_celular` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `profs`:
--   `matricula`
--       `usuario` -> `matricula`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `prova_questoes`
--
-- Criação: 29-Ago-2016 às 02:30
--

DROP TABLE IF EXISTS `prova_questoes`;
CREATE TABLE IF NOT EXISTS `prova_questoes` (
  `cod_prova` varchar(5) NOT NULL,
  `cod_quest` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `prova_questoes`:
--   `cod_prova`
--       `provas` -> `cod_prova`
--   `cod_quest`
--       `questoes` -> `cod_quest`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `provas`
--
-- Criação: 04-Set-2016 às 13:58
--

DROP TABLE IF EXISTS `provas`;
CREATE TABLE IF NOT EXISTS `provas` (
  `cod_prova` varchar(5) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `cod_disciplina` varchar(5) NOT NULL,
  `anoserie` varchar(5) NOT NULL,
  `tipo_avaliacao` varchar(30) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_prova`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `provas`:
--   `cod_disciplina`
--       `disciplinas` -> `disciplina_id`
--   `matricula`
--       `profs` -> `matricula`
--   `tipo_avaliacao`
--       `tipo_prova` -> `tipo_avaliacao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `questoes`
--
-- Criação: 04-Set-2016 às 14:22
--

DROP TABLE IF EXISTS `questoes`;
CREATE TABLE IF NOT EXISTS `questoes` (
  `cod_quest` int(12) NOT NULL COMMENT 'codigo associado a questao ( cahave primaria)',
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
  `anocriacao` year(4) NOT NULL,
  `anoserie` varchar(5) NOT NULL,
  `visibilidade` varchar(3) NOT NULL COMMENT 'pub:publico ou pri:privado(disponivel somente para o prof criador da questao)',
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_quest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `questoes`:
--   `autor`
--       `profs` -> `matricula`
--   `disciplina_id`
--       `disciplinas` -> `disciplina_id`
--   `materia_id`
--       `materia` -> `materia_id`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_prova`
--
-- Criação: 07-Set-2016 às 02:40
--

DROP TABLE IF EXISTS `tipo_prova`;
CREATE TABLE IF NOT EXISTS `tipo_prova` (
  `tipo_avaliacao` varchar(2) NOT NULL,
  `descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`tipo_avaliacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tipo_prova`:
--

--
-- Extraindo dados da tabela `tipo_prova`
--

INSERT INTO `tipo_prova` (`tipo_avaliacao`, `descricao`) VALUES
('1', '1° certificaÃ§Ã£o '),
('1r', '1° certificaÃ§Ã£o recuperaÃ§Ã£'),
('2', '2° certificaÃ§Ã£o '),
('2r', '2° certificaÃ§Ã£o recuperaÃ§Ã£'),
('3', '3° certificaÃ§Ã£o '),
('3r', '3° certificaÃ§Ã£o recuperaÃ§Ã£');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--
-- Criação: 04-Set-2016 às 13:00
--

DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `cod_turma` varchar(5) NOT NULL,
  `anoserie` varchar(6) NOT NULL,
  `sala` varchar(5) NOT NULL,
  PRIMARY KEY (`cod_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `turma`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma_aluno`
--
-- Criação: 04-Set-2016 às 18:46
--

DROP TABLE IF EXISTS `turma_aluno`;
CREATE TABLE IF NOT EXISTS `turma_aluno` (
  `cod_turma` varchar(5) NOT NULL,
  `matricula` varchar(5) NOT NULL,
  `ano_letovo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `turma_aluno`:
--   `cod_turma`
--       `turma` -> `cod_turma`
--   `matricula`
--       `aluno` -> `matricula`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--
-- Criação: 04-Set-2016 às 18:43
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `matricula` varchar(10) NOT NULL,
  `senha` tinytext NOT NULL,
  `permicao` varchar(10) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `usuario`:
--

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`matricula`, `senha`, `permicao`, `data_mod`) VALUES
('0001', '1111', 'prof', '2016-08-29 13:44:38'),
('0002', '???????????', 'prof', '2016-08-29 13:49:07');


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for aluno
--

--
-- Metadata for aluno_nota
--

--
-- Metadata for disciplinas
--

--
-- Metadata for materia
--

--
-- Metadata for prof_diario
--

--
-- Metadata for prof_diario_aluno
--

--
-- Metadata for prof_turma
--

--
-- Metadata for professor_disciplinas
--

--
-- Metadata for profs
--

--
-- Metadata for prova_questoes
--

--
-- Metadata for provas
--

--
-- Metadata for questoes
--

--
-- Metadata for tipo_prova
--

--
-- Extraindo dados da tabela `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'sge', 'tipo_prova', '{"sorted_col":"`tipo_prova`.`descricao` ASC"}', '2016-09-07 02:45:43');

--
-- Metadata for turma
--

--
-- Metadata for turma_aluno
--

--
-- Metadata for usuario
--

--
-- Metadata for sge
--

--
-- Extraindo dados da tabela `pma__relation`
--

INSERT INTO `pma__relation` (`master_db`, `master_table`, `master_field`, `foreign_db`, `foreign_table`, `foreign_field`) VALUES
('sge', 'aluno', 'matricula', 'sge', 'usuario', 'matricula'),
('sge', 'aluno_nota', 'disciplina_id', 'sge', 'disciplinas', 'disciplina_id'),
('sge', 'aluno_nota', 'matricula', 'sge', 'aluno', 'matricula'),
('sge', 'aluno_nota', 'tipo_avaliacao', 'sge', 'tipo_prova', 'tipo_avaliacao'),
('sge', 'materia', 'disciplina_id', 'sge', 'disciplinas', 'disciplina_id'),
('sge', 'prof_diario', 'disciplina_id', 'sge', 'disciplinas', 'disciplina_id'),
('sge', 'prof_diario', 'matricula', 'sge', 'profs', 'matricula'),
('sge', 'prof_diario_aluno', 'cod_aula', 'sge', 'prof_diario', 'cod_aula'),
('sge', 'prof_turma', 'cod_turma', 'sge', 'turma', 'cod_turma'),
('sge', 'prof_turma', 'matricula', 'sge', 'profs', 'matricula'),
('sge', 'professor_disciplinas', 'disciplina_id', 'sge', 'disciplinas', 'disciplina_id'),
('sge', 'professor_disciplinas', 'matricula', 'sge', 'profs', 'matricula'),
('sge', 'profs', 'matricula', 'sge', 'usuario', 'matricula'),
('sge', 'prova_questoes', 'cod_prova', 'sge', 'provas', 'cod_prova'),
('sge', 'prova_questoes', 'cod_quest', 'sge', 'questoes', 'cod_quest'),
('sge', 'provas', 'cod_disciplina', 'sge', 'disciplinas', 'disciplina_id'),
('sge', 'provas', 'matricula', 'sge', 'profs', 'matricula'),
('sge', 'provas', 'tipo_avaliacao', 'sge', 'tipo_prova', 'tipo_avaliacao'),
('sge', 'questoes', 'autor', 'sge', 'profs', 'matricula'),
('sge', 'questoes', 'disciplina_id', 'sge', 'disciplinas', 'disciplina_id'),
('sge', 'questoes', 'materia_id', 'sge', 'materia', 'materia_id'),
('sge', 'turma_aluno', 'cod_turma', 'sge', 'turma', 'cod_turma'),
('sge', 'turma_aluno', 'matricula', 'sge', 'aluno', 'matricula');

--
-- Extraindo dados da tabela `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_descr`) VALUES
('sge', 'arq1');

SET @LAST_PAGE = LAST_INSERT_ID();

--
-- Extraindo dados da tabela `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('sge', 'aluno', @LAST_PAGE, 70, 330),
('sge', 'aluno_nota', @LAST_PAGE, 270, 360),
('sge', 'disciplinas', @LAST_PAGE, 480, 360),
('sge', 'materia', @LAST_PAGE, 480, 460),
('sge', 'prof_diario', @LAST_PAGE, 280, 630),
('sge', 'prof_diario_aluno', @LAST_PAGE, 500, 630),
('sge', 'prof_turma', @LAST_PAGE, 480, 140),
('sge', 'professor_disciplinas', @LAST_PAGE, 480, 30),
('sge', 'profs', @LAST_PAGE, 70, 140),
('sge', 'prova_questoes', @LAST_PAGE, 1000, 170),
('sge', 'provas', @LAST_PAGE, 1000, 20),
('sge', 'questoes', @LAST_PAGE, 1000, 250),
('sge', 'tipo_prova', @LAST_PAGE, 1200, 110),
('sge', 'turma', @LAST_PAGE, 480, 250),
('sge', 'turma_aluno', @LAST_PAGE, 280, 250),
('sge', 'usuario', @LAST_PAGE, 70, 20);

--
-- Extraindo dados da tabela `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_descr`) VALUES
('sge', 'prof e quest');

SET @LAST_PAGE = LAST_INSERT_ID();

--
-- Extraindo dados da tabela `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('sge', 'disciplinas', @LAST_PAGE, 480, 360),
('sge', 'materia', @LAST_PAGE, 480, 460),
('sge', 'prof_turma', @LAST_PAGE, 480, 150),
('sge', 'professor_disciplinas', @LAST_PAGE, 480, 30),
('sge', 'profs', @LAST_PAGE, 70, 140),
('sge', 'prova_questoes', @LAST_PAGE, 1000, 170),
('sge', 'provas', @LAST_PAGE, 1000, 20),
('sge', 'questoes', @LAST_PAGE, 1000, 250),
('sge', 'tipo_prova', @LAST_PAGE, 1190, 100),
('sge', 'turma', @LAST_PAGE, 480, 250),
('sge', 'usuario', @LAST_PAGE, 70, 20);

--
-- Extraindo dados da tabela `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_descr`) VALUES
('sge', 'aluno');

SET @LAST_PAGE = LAST_INSERT_ID();

--
-- Extraindo dados da tabela `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('sge', 'aluno', @LAST_PAGE, 50, 250),
('sge', 'aluno_nota', @LAST_PAGE, 430, 270),
('sge', 'disciplinas', @LAST_PAGE, 430, 460),
('sge', 'prof_diario', @LAST_PAGE, 860, 10),
('sge', 'prof_diario_aluno', @LAST_PAGE, 860, 220),
('sge', 'prof_turma', @LAST_PAGE, 600, 10),
('sge', 'profs', @LAST_PAGE, 220, 10),
('sge', 'turma', @LAST_PAGE, 610, 170),
('sge', 'turma_aluno', @LAST_PAGE, 430, 170),
('sge', 'usuario', @LAST_PAGE, 50, 10);

--
-- Extraindo dados da tabela `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_descr`) VALUES
('sge', 'BD SGE');

SET @LAST_PAGE = LAST_INSERT_ID();

--
-- Extraindo dados da tabela `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('sge', 'disciplinas', @LAST_PAGE, 480, 360),
('sge', 'materia', @LAST_PAGE, 480, 460),
('sge', 'prof_turma', @LAST_PAGE, 480, 150),
('sge', 'professor_disciplinas', @LAST_PAGE, 480, 30),
('sge', 'profs', @LAST_PAGE, 70, 140),
('sge', 'prova_questoes', @LAST_PAGE, 1000, 170),
('sge', 'provas', @LAST_PAGE, 1000, 20),
('sge', 'questoes', @LAST_PAGE, 1000, 250),
('sge', 'tipo_prova', @LAST_PAGE, 1240, 100),
('sge', 'turma', @LAST_PAGE, 480, 250),
('sge', 'usuario', @LAST_PAGE, 70, 20);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
