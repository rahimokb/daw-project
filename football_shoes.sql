-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 15 mai 2025 à 12:21
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `football shoes`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `wilaya` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `fname`, `lname`, `age`, `wilaya`, `tel`, `email`, `addr`, `pass`) VALUES
(1, 'kebbab', 'abderrahim', 19, 'setif', '799993801', ']ghrahimo34@gmail.com', 'aadl 200', 'rahimokb'),
(2, 'kebbab', 'abderrahim', 19, 'setif', '799993801', 'asrahimo34@gmail.com', 'aadl 200', 'rahimokb'),
(3, 'kebbab', 'abderrahim', 19, 'setif', '799993801', 'rahimokb34@gmail.com', 'aadl 2000', 'rahimokb'),
(4, 'kebbab', 'abderrahim', 19, 'setif', '799993801', 'rahimokb3@gmail.com', 'aadl 2000', 'rahimokb'),
(5, 'kebbab', 'abderrahim', 19, 'setif', '799993801', 'medscaleuae@gmail.com', 'aadl 2000', ''),
(6, 'kebbab', 'abderrahim', 19, 'setif', '799993801', 'abderrahimkb@gmail.com', 'aadl 2000', 'rahimokb');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `couleur` varchar(50) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `pointure` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`order_id`, `client_id`, `couleur`, `quantite`, `pointure`) VALUES
(1, 1, 'red', 2, 40),
(2, 1, 'red', 4, 40);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `proid` int(11) NOT NULL,
  `proname` varchar(50) DEFAULT NULL,
  `baseprice` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`proid`, `proname`, `baseprice`) VALUES
(1, 'foot17', '16000'),
(2, 'foot18', '20000'),
(3, 'foot19', '18000'),
(4, 'foot20', '15000'),
(5, 'foot21', '17000'),
(6, 'foot21', '17000'),
(7, 'foot18', '20000'),
(8, 'foot19', '18000'),
(9, 'foot20', '15000'),
(10, 'foot21', '17000'),
(11, 'foot21', '17000'),
(12, 'foot18', '20000'),
(13, 'foot19', '18000'),
(14, 'foot20', '15000'),
(15, 'foot21', '17000'),
(16, 'foot21', '17000'),
(17, 'foot18', '20000'),
(18, 'foot19', '18000'),
(19, 'foot4', '13000'),
(20, 'foot20', '19000'),
(21, 'foot21', '16000'),
(22, 'foot22', '20000'),
(23, 'foot23', '18000'),
(24, 'foot24', '13000'),
(25, 'foot25', '19000'),
(26, 'foot26', '16000'),
(27, 'foot27', '20000'),
(28, 'foot28', '18000'),
(29, 'foot29', '13000'),
(30, 'foot30', '19000'),
(31, 'foot31', '16000'),
(32, 'foot32', '20000'),
(33, 'foot33', '18000'),
(34, 'foot34', '13000'),
(35, 'foot35', '19000');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`proid`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `proid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
