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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
