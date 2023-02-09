-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 09 fév. 2023 à 10:38
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_absence`
--

-- --------------------------------------------------------

--
-- Structure de la table `absent`
--

DROP TABLE IF EXISTS `absent`;
CREATE TABLE IF NOT EXISTS `absent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `student_id` int(11) NOT NULL,
  `prof_id` int(11) NOT NULL,
  `is_justified` tinyint(1) NOT NULL,
  `comment` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `prof_id` (`prof_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `absent`
--

INSERT INTO `absent` (`id`, `start_date`, `end_date`, `student_id`, `prof_id`, `is_justified`, `comment`) VALUES
(1, '2022-12-13', '2022-12-14', 3, 3, 1, 'Arrêt médical'),
(2, '2022-12-15', '2022-12-15', 5, 4, 0, ''),
(3, '2023-02-09', '2023-02-11', 3, 3, 1, 'Messe'),
(4, '2023-02-09', '2023-02-11', 3, 3, 1, 'Messe'),
(5, '2023-02-09', '2023-02-11', 3, 3, 1, 'Messe'),
(6, '2023-02-09', '2023-02-11', 3, 3, 1, 'Messe'),
(7, '2023-02-09', '2023-02-11', 3, 3, 0, 'Messe'),
(8, '2023-02-09', '2023-02-11', 3, 3, 0, 'Messe'),
(9, '2023-02-09', '2023-02-11', 3, 3, 0, 'Messe'),
(10, '2023-02-09', '2023-02-11', 3, 3, 0, 'Koala'),
(11, '2023-02-09', '2023-02-11', 3, 3, 0, 'Koala');

-- --------------------------------------------------------

--
-- Structure de la table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `class`
--

INSERT INTO `class` (`id`, `name`) VALUES
(1, 'BTS SIO 1'),
(2, 'BTS SIO 2'),
(3, 'BTS SIO 1 A'),
(4, 'BTS SIO 2 A'),
(5, 'BTS SN 1'),
(6, 'BTS SN 2');

-- --------------------------------------------------------

--
-- Structure de la table `delays`
--

DROP TABLE IF EXISTS `delays`;
CREATE TABLE IF NOT EXISTS `delays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `student_id` int(11) NOT NULL,
  `prof_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prof_id` (`prof_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `prof_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idMatiere_UNIQUE` (`id`),
  KEY `fk_Matiere_prof1_idx` (`prof_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `Name`, `prof_id`) VALUES
(1, 'Français', 3),
(2, 'Bloc 2 SISR', 4),
(3, 'Bloc 2 SLAM', 2),
(4, 'Bloc 3 SLAM', 2),
(5, 'Bloc 3 SISR', 4),
(6, 'Anglais', 6),
(7, 'CEJM', 5);

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

DROP TABLE IF EXISTS `prof`;
CREATE TABLE IF NOT EXISTS `prof` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `prof`
--

INSERT INTO `prof` (`id`, `name`, `user_id`) VALUES
(2, 'Subramani', 1),
(3, 'Donné', 4),
(4, 'Dardenne', 3),
(5, 'Martin', 8),
(6, 'Viret', 14);

-- --------------------------------------------------------

--
-- Structure de la table `prof_has_class`
--

DROP TABLE IF EXISTS `prof_has_class`;
CREATE TABLE IF NOT EXISTS `prof_has_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prof_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prof_id` (`prof_id`),
  KEY `class_id` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `prof_has_class`
--

INSERT INTO `prof_has_class` (`id`, `prof_id`, `class_id`) VALUES
(1, 3, 4),
(2, 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `parents_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `class_id` (`class_id`),
  KEY `tutor_id` (`parents_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `student`
--

INSERT INTO `student` (`id`, `class_id`, `parents_id`, `user_id`) VALUES
(1, 4, 16, 5),
(3, 4, 16, 12),
(4, 4, NULL, 11),
(5, 4, NULL, 10),
(7, 4, 7, 12),
(8, 4, 7, 12);

-- --------------------------------------------------------

--
-- Structure de la table `student_has_absent`
--

DROP TABLE IF EXISTS `student_has_absent`;
CREATE TABLE IF NOT EXISTS `student_has_absent` (
  `student_id` int(11) NOT NULL,
  `absent_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`,`absent_id`),
  KEY `fk_student_has_absent_absent1_idx` (`absent_id`),
  KEY `fk_student_has_absent_student1_idx` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `student_has_absent`
--

INSERT INTO `student_has_absent` (`student_id`, `absent_id`) VALUES
(3, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Last_Name` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Birthdate` date DEFAULT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(250) NOT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `is-valid` tinyint(1) NOT NULL,
  `profile` enum('student','prof','admin','parent') NOT NULL,
  `Photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `Last_Name`, `Name`, `Birthdate`, `login`, `password`, `Mail`, `Phone`, `is-valid`, `profile`, `Photo`) VALUES
(1, 'Subramani', 'Venki', NULL, 'Subramani_V', '1234', NULL, NULL, 1, 'prof', NULL),
(2, 'Seghir', 'Gabriel', NULL, 'Seghir_G', '2735', NULL, NULL, 1, 'student', NULL),
(3, 'Dardenne', 'Florence', '1987-01-15', 'Dardenne_F', 'AbC123!', 'f.dardenne@gmail.com', 674356273, 1, 'prof', NULL),
(4, 'Donné', 'Isabelle', '1967-06-28', 'Donne_I', 'BlA52g?', 'i.donne@gmail.com', 637256347, 1, 'prof', NULL),
(5, 'Jope', 'Norton', '2002-02-27', 'jope_n', 'JpNe097!', 'n.jope@gmail.com', 734526347, 1, 'student', NULL),
(6, 'Nemer', 'Sarah', '1990-12-14', 'nemer_s', 'SFQgsuz0as!?D', 's.nemer@gmail.com', 734528391, 1, 'admin', NULL),
(7, 'Jope', 'Magalie', NULL, 'Jope_m', 'NoR2734!', 'm.jope@gmail.com', 735263748, 1, 'parent', NULL),
(8, 'Martin', 'Marie-Agnès', '1970-12-14', 'Martin_ma', 'acgs!2453?', 'ma.martin@gmail.com', 735462736, 1, 'prof', NULL),
(10, 'Morel', 'Pierre', NULL, 'Morel_p', 'Meoahjs78!', 'p.morel@gmail.com', NULL, 1, 'student', NULL),
(11, 'Caucheteux', 'Dylan', NULL, 'Caucheteux_d', 'zSgHbwN5362', 'p.morel@gmail.com', NULL, 1, 'student', NULL),
(12, 'Niculae', 'Louis', NULL, 'Niculae_l', 'zedsq345432$sd', 'l.niculae@gmail.com', NULL, 1, 'student', NULL),
(13, 'Blandin', 'Emma', '2003-05-30', 'blandin_e', 'ageubd7384$HE43', 'e.blandin@gmail.com', 645227064, 1, 'student', NULL),
(14, 'Viret', 'Véronique', NULL, 'Viret_v', 'zhegss', 'v.viret@gmail.com', NULL, 1, 'prof', NULL),
(15, 'Pasquier', 'Jean-Luc', NULL, 'Pasquier_jl', 'gdhqjso8373!$gsj63', 'jl.pasquier@gmail.com', NULL, 1, 'admin', NULL),
(16, 'admin', 'admin', '2023-02-02', 'admin', 'admin', 'admin', NULL, 1, 'admin', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absent`
--
ALTER TABLE `absent`
  ADD CONSTRAINT `absent_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `absent_ibfk_2` FOREIGN KEY (`prof_id`) REFERENCES `prof` (`id`);

--
-- Contraintes pour la table `delays`
--
ALTER TABLE `delays`
  ADD CONSTRAINT `delays_ibfk_1` FOREIGN KEY (`prof_id`) REFERENCES `prof` (`id`),
  ADD CONSTRAINT `delays_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `fk_Matiere_prof1` FOREIGN KEY (`prof_id`) REFERENCES `prof` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `prof`
--
ALTER TABLE `prof`
  ADD CONSTRAINT `prof_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `prof_has_class`
--
ALTER TABLE `prof_has_class`
  ADD CONSTRAINT `prof_has_class_ibfk_1` FOREIGN KEY (`prof_id`) REFERENCES `prof` (`id`),
  ADD CONSTRAINT `prof_has_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`);

--
-- Contraintes pour la table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`parents_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `student_has_absent`
--
ALTER TABLE `student_has_absent`
  ADD CONSTRAINT `fk_student_has_absent_absent1` FOREIGN KEY (`absent_id`) REFERENCES `absent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_has_absent_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
