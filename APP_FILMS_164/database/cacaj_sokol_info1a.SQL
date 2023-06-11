-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: cacaj_sokol_info1a

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données


--- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS cacaj_sokol_info1a;
-- Listage de la structure de la base pour cacaj_sokol_info1a
CREATE DATABASE IF NOT EXISTS `cacaj_sokol_info1a` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `cacaj_sokol_info1a`;

-- Listage de la structure de table cacaj_sokol_info1a. t_adresse
CREATE TABLE IF NOT EXISTS `t_adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `code_postal` varchar(20) DEFAULT NULL,
  `pays` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cacaj_sokol_info1a.t_adresse : ~0 rows (environ)
INSERT INTO `t_adresse` (`id`, `adresse`, `ville`, `code_postal`, `pays`) VALUES
	(1, '1 Rue du Festival', 'Nyon', '1260', 'Suisse'),
	(2, '2 Avenue des Artistes', 'Genève', '1202', 'Suisse'),
	(3, '3 Place de la Scène', 'Lausanne', '1003', 'Suisse'),
	(4, '4 Rue Principale', 'Zurich', '8001', 'Suisse'),
	(5, '5 Rue du Lac', 'Neuchâtel', '2000', 'Suisse'),
	(6, '6 Rue des Alpes', 'Fribourg', '1700', 'Suisse'),
	(7, '7 Avenue de la Gare', 'La Chaux-de-Fonds', '2300', 'Suisse'),
	(8, '8 Rue de l\'Université', 'Berne', '3000', 'Suisse'),
	(9, '9 Avenue du Rhône', 'Sion', '1950', 'Suisse'),
	(10, '10 Rue des Remparts', 'Sierre', '3960', 'Suisse'),
	(11, '11 Avenue de la Gruyère', 'Bulle', '1630', 'Suisse');

-- Listage de la structure de table cacaj_sokol_info1a. t_contrats
CREATE TABLE IF NOT EXISTS `t_contrats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employe_id` int DEFAULT NULL,
  `departement_id` int DEFAULT NULL,
  `emploi_id` int DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employe_id` (`employe_id`),
  KEY `departement_id` (`departement_id`),
  KEY `emploi_id` (`emploi_id`),
  CONSTRAINT `t_contrats_ibfk_1` FOREIGN KEY (`employe_id`) REFERENCES `t_personnes` (`id`),
  CONSTRAINT `t_contrats_ibfk_2` FOREIGN KEY (`departement_id`) REFERENCES `t_departements` (`id`),
  CONSTRAINT `t_contrats_ibfk_3` FOREIGN KEY (`emploi_id`) REFERENCES `t_emplois` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cacaj_sokol_info1a.t_contrats : ~0 rows (environ)
INSERT INTO `t_contrats` (`id`, `employe_id`, `departement_id`, `emploi_id`, `date_debut`, `date_fin`) VALUES
	(1, 1, 1, 1, '2022-01-01', '2022-12-31'),
	(2, 2, 2, 2, '2022-02-15', '2022-11-30'),
	(3, 3, 3, 3, '2022-03-01', '2022-10-31'),
	(4, 4, 4, 4, '2022-04-01', '2022-09-30'),
	(5, 5, 5, 5, '2022-05-01', '2022-08-31'),
	(6, 6, 1, 2, '2022-06-01', '2022-11-30'),
	(7, 7, 2, 3, '2022-07-01', '2022-10-31'),
	(8, 8, 3, 4, '2022-08-01', '2022-09-30'),
	(9, 9, 4, 5, '2022-09-01', '2022-12-31'),
	(10, 10, 5, 1, '2022-10-01', '2022-11-30'),
	(11, 11, 1, 3, '2022-11-01', '2022-10-31');

-- Listage de la structure de table cacaj_sokol_info1a. t_departements
CREATE TABLE IF NOT EXISTS `t_departements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cacaj_sokol_info1a.t_departements : ~0 rows (environ)
INSERT INTO `t_departements` (`id`, `nom`) VALUES
	(1, 'Production'),
	(2, 'Logistique'),
	(3, 'Communication'),
	(4, 'Finance'),
	(5, 'Ressources humaines');

-- Listage de la structure de table cacaj_sokol_info1a. t_email
CREATE TABLE IF NOT EXISTS `t_email` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cacaj_sokol_info1a.t_email : ~0 rows (environ)
INSERT INTO `t_email` (`id`, `email`) VALUES
	(1, 'dupont.jean@example.com'),
	(2, 'martin.marie@example.com'),
	(3, 'dubois.pierre@example.com'),
	(4, 'john.smith@example.com'),
	(5, 'jane.doe@example.com'),
	(6, 'patrick.bruel@example.com'),
	(7, 'sokol.cacaj@example.com'),
	(8, 'florent.bleta@example.com'),
	(9, 'olti.sylaj@example.com'),
	(10, 'agon.safeti@example.com'),
	(11, 'ibrahim.rugova@example.com');

-- Listage de la structure de table cacaj_sokol_info1a. t_emplois
CREATE TABLE IF NOT EXISTS `t_emplois` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cacaj_sokol_info1a.t_emplois : ~0 rows (environ)
INSERT INTO `t_emplois` (`id`, `nom`) VALUES
	(1, 'Technicien'),
	(2, 'Agent de sécurité'),
	(3, 'Assistant communication'),
	(4, 'Comptable'),
	(5, 'Coordinateur événementiel');

-- Listage de la structure de table cacaj_sokol_info1a. t_personnes
CREATE TABLE IF NOT EXISTS `t_personnes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `adresse_id` int DEFAULT NULL,
  `email_id` int DEFAULT NULL,
  `emploi_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adresse_id` (`adresse_id`),
  KEY `email_id` (`email_id`),
  KEY `emploi_id` (`emploi_id`),
  CONSTRAINT `t_personnes_ibfk_1` FOREIGN KEY (`adresse_id`) REFERENCES `t_adresse` (`id`),
  CONSTRAINT `t_personnes_ibfk_2` FOREIGN KEY (`email_id`) REFERENCES `t_email` (`id`),
  CONSTRAINT `t_personnes_ibfk_3` FOREIGN KEY (`emploi_id`) REFERENCES `t_emplois` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cacaj_sokol_info1a.t_personnes : ~0 rows (environ)
INSERT INTO `t_personnes` (`id`, `nom`, `prenom`, `date_naissance`, `adresse_id`, `email_id`, `emploi_id`) VALUES
	(1, 'Dupont', 'Jean', '1980-05-15', 1, 1, 1),
	(2, 'Martin', 'Marie', '1992-09-21', 2, 2, 2),
	(3, 'Dubois', 'Pierre', '1985-12-10', 3, 3, 3),
	(4, 'Smith', 'John', '1990-07-01', 4, 4, 4),
	(5, 'Doe', 'Jane', '1995-03-18', 5, 5, 5),
	(6, 'Bruel', 'Patrick', '1969-05-14', 6, 6, 1),
	(7, 'Cacaj', 'Sokol', '1987-11-02', 7, 7, 2),
	(8, 'Bleta', 'Florent', '1991-09-08', 8, 8, 3),
	(9, 'Sylaj', 'Olti', '1983-12-26', 9, 9, 4),
	(10, 'Safeti', 'Agon', '1986-07-11', 10, 10, 5),
	(11, 'Rugova', 'Ibrahim', '1954-12-02', 11, 11, 1);

-- Listage de la structure de table cacaj_sokol_info1a. t_telephone
CREATE TABLE IF NOT EXISTS `t_telephone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) DEFAULT NULL,
  `personne_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personne_id` (`personne_id`),
  CONSTRAINT `t_telephone_ibfk_1` FOREIGN KEY (`personne_id`) REFERENCES `t_personnes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cacaj_sokol_info1a.t_telephone : ~11 rows (environ)
INSERT INTO `t_telephone` (`id`, `numero`, `personne_id`) VALUES
	(1, '+41 12 345 67 89', 1),
	(2, '+41 98 765 43 21', 2),
	(3, '+41 45 678 91 23', 3),
	(4, '+41 78 912 34 56', 4),
	(5, '+41 32 165 49 87', 5),
	(6, '+41 65 412 37 89', 6),
	(7, '+41 14 725 83 69', 7),
	(8, '+41 25 836 91 47', 8),
	(9, '+41 36 914 72 58', 9),
	(10, '+41 85 274 19 63', 10),
	(11, '+41 96 385 27 41', 11);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
