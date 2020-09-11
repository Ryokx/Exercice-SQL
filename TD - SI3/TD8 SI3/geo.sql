-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 17 Janvier 2019 à 11:10
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `geo`
--

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `NomPays` varchar(15) NOT NULL,
  `PopuPays` int(10) DEFAULT NULL,
  `Continent` varchar(20) DEFAULT NULL,
  `NomCapital` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`NomPays`, `PopuPays`, `Continent`, `NomCapital`) VALUES
('Espagne', 60000000, 'Europe', 'Madrid'),
('EtatUnis', 130000000, 'Amerique', 'Washington'),
('France', 67000000, 'Europe', 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `NomVille` varchar(15) NOT NULL,
  `PopuVille` int(10) DEFAULT NULL,
  `NomPays` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ville`
--

INSERT INTO `ville` (`NomVille`, `PopuVille`, `NomPays`) VALUES
('Madrid', 10000000, 'Espagne'),
('Paris', 15000000, 'France'),
('Washington', 25000000, 'EtatUnis');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `ville_hab`
--
CREATE TABLE `ville_hab` (
`NomVille` varchar(15)
,`PopuVille` int(10)
,`PopuPays` int(10)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vuepc`
--
CREATE TABLE `vuepc` (
`NomPays` varchar(15)
,`Continent` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure de la vue `ville_hab`
--
DROP TABLE IF EXISTS `ville_hab`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ville_hab`  AS  select `ville`.`NomVille` AS `NomVille`,`ville`.`PopuVille` AS `PopuVille`,`pays`.`PopuPays` AS `PopuPays` from (`pays` join `ville`) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vuepc`
--
DROP TABLE IF EXISTS `vuepc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vuepc`  AS  select `pays`.`NomPays` AS `NomPays`,`pays`.`Continent` AS `Continent` from `pays` ;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`NomPays`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`NomVille`),
  ADD KEY `pk_Ville` (`NomPays`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `pk_Ville` FOREIGN KEY (`NomPays`) REFERENCES `pays` (`NomPays`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
