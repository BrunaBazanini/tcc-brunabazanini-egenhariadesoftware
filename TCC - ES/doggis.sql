-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2020 at 11:06 PM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doggis`
--

-- --------------------------------------------------------

--
-- Table structure for table `alergia`
--

CREATE TABLE `alergia` (
  `pk_codAlergia` int(10) NOT NULL,
  `tipoAlergia` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `pk_codCliente` int(10) NOT NULL,
  `cpfCliente` int(11) NOT NULL,
  `emailCliente` varchar(255) NOT NULL,
  `identidadeCliente` int(10) NOT NULL,
  `nomeCliente` varchar(255) NOT NULL,
  `qtdPatazAcumuladas` int(10) NOT NULL,
  `fk_codPet` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fabricanteproduto`
--

CREATE TABLE `fabricanteproduto` (
  `pk_codFabricanteProduto` int(10) NOT NULL,
  `nomeFabricanteProduto` varchar(255) NOT NULL,
  `enderecoFabricanteProduto` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `funcionario`
--

CREATE TABLE `funcionario` (
  `pk_codFuncionario` int(10) NOT NULL,
  `fk_codPerfilFuncioario` int(10) NOT NULL,
  `fk_codTipoPet` int(10) NOT NULL,
  `registroVeteriario` int(25) DEFAULT NULL,
  `nomeFuncionario` varchar(255) NOT NULL,
  `cpfFuncionario` int(11) NOT NULL,
  `identidadeRgFuncionario` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logservico`
--

CREATE TABLE `logservico` (
  `pk_codLog` int(10) NOT NULL,
  `fk_codServico` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perfilfuncionario`
--

CREATE TABLE `perfilfuncionario` (
  `pk_codPerfilFuncionario` int(10) NOT NULL,
  `nomePerfilFuncionario` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `pk_codPet` int(10) NOT NULL,
  `fk_codCliente` int(10) NOT NULL,
  `fk_codTipoPet` int(10) NOT NULL,
  `fk_codPortePet` int(10) NOT NULL,
  `fk_codAlergia` int(10) NOT NULL,
  `nomePet` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `portepet`
--

CREATE TABLE `portepet` (
  `pk_codPortePet` int(10) NOT NULL,
  `nomePortePet` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produto`
--

CREATE TABLE `produto` (
  `pk_codProduto` int(10) NOT NULL,
  `fk_codStatusProtudo` int(10) NOT NULL,
  `fk_codFabricanteProduto` int(10) NOT NULL,
  `fk_codPromocao` int(10) NOT NULL,
  `tipoProduto` varchar(255) NOT NULL,
  `nomeProduto` varchar(255) NOT NULL,
  `especificacoesProduto` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promocao`
--

CREATE TABLE `promocao` (
  `pk_codPromocao` int(10) NOT NULL,
  `fk_codProduto` int(10) NOT NULL,
  `valorDesconto` float NOT NULL,
  `tipoPromocao` varchar(255) NOT NULL,
  `dataInicialPromocao` datetime NOT NULL,
  `dataFinalPromocao` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servico`
--

CREATE TABLE `servico` (
  `pk_codServico` int(10) NOT NULL,
  `fk_codProdutoUtilizado` int(10) NOT NULL,
  `fk_codFuncionarioPrestouServico` int(10) NOT NULL,
  `fk_codCliente` int(10) NOT NULL,
  `tipoServico` varchar(255) NOT NULL,
  `tempoDeServicoEstimado` datetime NOT NULL,
  `precoServico` float NOT NULL,
  `dataServico` datetime NOT NULL,
  `qtdPatazProvidoAoCliente` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statusproduto`
--

CREATE TABLE `statusproduto` (
  `pk_codStatusProduto` int(10) NOT NULL,
  `nomeStatusProduto` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipopet`
--

CREATE TABLE `tipopet` (
  `pk_codTipoPet` int(10) NOT NULL,
  `tipoPet` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alergia`
--
ALTER TABLE `alergia`
  ADD PRIMARY KEY (`pk_codAlergia`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`pk_codCliente`);

--
-- Indexes for table `fabricanteproduto`
--
ALTER TABLE `fabricanteproduto`
  ADD PRIMARY KEY (`pk_codFabricanteProduto`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`pk_codFuncionario`);

--
-- Indexes for table `logservico`
--
ALTER TABLE `logservico`
  ADD PRIMARY KEY (`pk_codLog`),
  ADD KEY `codServico` (`fk_codServico`);

--
-- Indexes for table `perfilfuncionario`
--
ALTER TABLE `perfilfuncionario`
  ADD PRIMARY KEY (`pk_codPerfilFuncionario`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`pk_codPet`);

--
-- Indexes for table `portepet`
--
ALTER TABLE `portepet`
  ADD PRIMARY KEY (`pk_codPortePet`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`pk_codProduto`);

--
-- Indexes for table `promocao`
--
ALTER TABLE `promocao`
  ADD PRIMARY KEY (`pk_codPromocao`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`pk_codServico`);

--
-- Indexes for table `statusproduto`
--
ALTER TABLE `statusproduto`
  ADD PRIMARY KEY (`pk_codStatusProduto`);

--
-- Indexes for table `tipopet`
--
ALTER TABLE `tipopet`
  ADD PRIMARY KEY (`pk_codTipoPet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
