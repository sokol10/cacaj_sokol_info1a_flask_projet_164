-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: sokol_info_1a

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données

DROP DATABASE IF EXISTS sokol_info_1a;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS sokol_info_1a;

-- Utilisation de cette base de donnée

USE sokol_info_1a;
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           10.4.27-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

DROP DATABASE IF EXISTS sokol_info_1a;


-- Export de la structure de la base pour sokol_info_1a
CREATE DATABASE IF NOT EXISTS `sokol_info_1a` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `sokol_info_1a`;

-- Export de la structure de la table sokol_info_1a. t_adresse
CREATE TABLE IF NOT EXISTS `t_adresse` (
  `id_adresse` int(11) NOT NULL,
  `rue` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL,
  `id_personne` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `t_adresse_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Export de données de la table sokol_info_1a.t_adresse : ~0 rows (environ)
/*!40000 ALTER TABLE `t_adresse` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_adresse` ENABLE KEYS */;

-- Export de la structure de la table sokol_info_1a. t_binome
CREATE TABLE IF NOT EXISTS `t_binome` (
  `id_binome` int(11) NOT NULL,
  `id_personne_1` int(11) DEFAULT NULL,
  `id_personne_2` int(11) DEFAULT NULL,
  `id_team` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_binome`),
  KEY `id_personne_1` (`id_personne_1`),
  KEY `id_personne_2` (`id_personne_2`),
  KEY `id_team` (`id_team`),
  CONSTRAINT `t_binome_ibfk_1` FOREIGN KEY (`id_personne_1`) REFERENCES `t_personne` (`id_personne`),
  CONSTRAINT `t_binome_ibfk_2` FOREIGN KEY (`id_personne_2`) REFERENCES `t_personne` (`id_personne`),
  CONSTRAINT `t_binome_ibfk_3` FOREIGN KEY (`id_team`) REFERENCES `t_team` (`id_team`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Export de données de la table sokol_info_1a.t_binome : ~0 rows (environ)
/*!40000 ALTER TABLE `t_binome` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_binome` ENABLE KEYS */;

-- Export de la structure de la table sokol_info_1a. t_chefzone
CREATE TABLE IF NOT EXISTS `t_chefzone` (
  `id_chefzone` int(11) NOT NULL,
  `nom_chefzone` varchar(50) DEFAULT NULL,
  `id_personne` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_chefzone`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `t_chefzone_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Export de données de la table sokol_info_1a.t_chefzone : ~0 rows (environ)
/*!40000 ALTER TABLE `t_chefzone` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_chefzone` ENABLE KEYS */;

-- Export de la structure de la table sokol_info_1a. t_email
CREATE TABLE IF NOT EXISTS `t_email` (
  `id_email` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_personne` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_email`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `t_email_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Export de données de la table sokol_info_1a.t_email : ~2 rows (environ)
/*!40000 ALTER TABLE `t_email` DISABLE KEYS */;
INSERT INTO `t_email` (`id_email`, `email`, `id_personne`) VALUES
	(0, 'test1@carglass.ch', NULL),
	(1, 'ztr@deri.ch', NULL);
/*!40000 ALTER TABLE `t_email` ENABLE KEYS */;

-- Export de la structure de la table sokol_info_1a. t_horaire
CREATE TABLE IF NOT EXISTS `t_horaire` (
  `id_horaire` int(11) NOT NULL,
  `debut` time DEFAULT NULL,
  `fin` time DEFAULT NULL,
  PRIMARY KEY (`id_horaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Export de données de la table sokol_info_1a.t_horaire : ~0 rows (environ)
/*!40000 ALTER TABLE `t_horaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_horaire` ENABLE KEYS */;

-- Export de la structure de la table sokol_info_1a. t_jourtravail
CREATE TABLE IF NOT EXISTS `t_jourtravail` (
  `id_jourtravail` int(11) NOT NULL,
  `jour_semaine` varchar(20) DEFAULT NULL,
  `id_horaire` int(11) NOT NULL,
  `id_zone` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  PRIMARY KEY (`id_jourtravail`),
  KEY `id_horaire` (`id_horaire`),
  KEY `id_zone` (`id_zone`),
  KEY `id_team` (`id_team`),
  CONSTRAINT `t_jourtravail_ibfk_1` FOREIGN KEY (`id_horaire`) REFERENCES `t_horaire` (`id_horaire`),
  CONSTRAINT `t_jourtravail_ibfk_2` FOREIGN KEY (`id_zone`) REFERENCES `t_zone` (`id_zone`),
  CONSTRAINT `t_jourtravail_ibfk_3` FOREIGN KEY (`id_team`) REFERENCES `t_team` (`id_team`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Export de données de la table sokol_info_1a.t_jourtravail : ~0 rows (environ)
/*!40000 ALTER TABLE `t_jourtravail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_jourtravail` ENABLE KEYS */;

-- Export de la structure de la table sokol_info_1a. t_personne
CREATE TABLE IF NOT EXISTS `t_personne` (
  `id_personne` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `sexe` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Export de données de la table sokol_info_1a.t_personne : ~0 rows (environ)
/*!40000 ALTER TABLE `t_personne` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_personne` ENABLE KEYS */;

-- Export de la structure de la table sokol_info_1a. t_team
CREATE TABLE IF NOT EXISTS `t_team` (
  `id_team` int(11) NOT NULL,
  `nom_team` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_team`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Export de données de la table sokol_info_1a.t_team : ~0 rows (environ)
/*!40000 ALTER TABLE `t_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_team` ENABLE KEYS */;

-- Export de la structure de la table sokol_info_1a. t_telephone
CREATE TABLE IF NOT EXISTS `t_telephone` (
  `id_telephone` int(11) NOT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `id_personne` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_telephone`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `t_telephone_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Export de données de la table sokol_info_1a.t_telephone : ~0 rows (environ)
/*!40000 ALTER TABLE `t_telephone` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_telephone` ENABLE KEYS */;

-- Export de la structure de la table sokol_info_1a. t_zone
CREATE TABLE IF NOT EXISTS `t_zone` (
  `id_zone` int(11) NOT NULL,
  `nom_zone` varchar(50) DEFAULT NULL,
  `id_chefzone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_zone`),
  KEY `id_chefzone` (`id_chefzone`),
  CONSTRAINT `t_zone_ibfk_1` FOREIGN KEY (`id_chefzone`) REFERENCES `t_chefzone` (`id_chefzone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Export de données de la table sokol_info_1a.t_zone : ~0 rows (environ)
/*!40000 ALTER TABLE `t_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_zone` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
