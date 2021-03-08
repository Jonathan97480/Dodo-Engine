-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 08 mars 2021 à 16:26
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `dodo_engine`
--

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `online` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `content` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `img_description` varchar(255) NOT NULL,
  `date_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `tags_has_medias`
--

DROP TABLE IF EXISTS `tags_has_medias`;
CREATE TABLE IF NOT EXISTS `tags_has_medias` (
  `fk_media_id` int(11) NOT NULL,
  `fk_tag_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tags_has_medias`
--

INSERT INTO `tags_has_medias` (`fk_media_id`, `fk_tag_id`) VALUES
(121, 5),
(121, 5),
(122, 5),
(32, 5),
(37, 5);

-- --------------------------------------------------------

--
-- Structure de la table `t_cathegories`
--

DROP TABLE IF EXISTS `t_cathegories`;
CREATE TABLE IF NOT EXISTS `t_cathegories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `categorie_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_cathegories`
--

INSERT INTO `t_cathegories` (`id`, `name`, `img`, `description`, `categorie_parent`) VALUES
(1, 'Gamme Jam', 'icon\\img_603a0064c230a.jpg', 'test 2', 2),
(2, 'pixel Art', 'icon\\img_603a00ba4c29d.jpg', 'Le pixel art  aussi appelé art du pixel ou art des pixels  au Québec, désigne une composition numérique qui utilise une définition d\'écran basse et un nombre de couleurs limité.', NULL),
(4, 'Youtube', 'icon\\img_603a00d607022.jpg', 'vidéo en ligne', NULL),
(5, 'Twitch', 'icon\\img_603a01b0d2cb0.png', 'zaezezae', NULL),
(6, 'Technique pixel art ', 'icon\\img_603a20ca51d83.gif', 'Tous se qui conserne les technique de dessin d\'un pixel art ', 2);

-- --------------------------------------------------------

--
-- Structure de la table `t_cathegories_has_post`
--

DROP TABLE IF EXISTS `t_cathegories_has_post`;
CREATE TABLE IF NOT EXISTS `t_cathegories_has_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `cathegories_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_cathegories_has_post`
--

INSERT INTO `t_cathegories_has_post` (`id`, `post_id`, `cathegories_id`) VALUES
(2, 26, 2),
(11, 33, 4),
(10, 33, 2),
(14, 0, 2),
(15, 0, 6);

-- --------------------------------------------------------

--
-- Structure de la table `t_commentaires`
--

DROP TABLE IF EXISTS `t_commentaires`;
CREATE TABLE IF NOT EXISTS `t_commentaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `date_com` datetime NOT NULL DEFAULT current_timestamp(),
  `id_article` int(11) NOT NULL,
  `id_reponce` int(11) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_commentaires`
--

INSERT INTO `t_commentaires` (`id`, `content`, `id_user`, `date_com`, `id_article`, `id_reponce`, `login`) VALUES
(73, 'yolo', 1, '2021-03-08 11:26:48', 35, NULL, NULL),
(72, 'mon message', 1, '2021-03-08 11:26:32', 35, NULL, NULL),
(71, 'babou', 1, '2021-03-08 09:41:28', 24, 64, NULL),
(70, 'erzezrez', 1, '2021-03-08 09:39:02', 24, 69, NULL),
(69, 'yola', 1, '2021-03-08 09:35:41', 24, 68, NULL),
(68, 'yo', 1, '2021-03-08 09:35:19', 24, 65, NULL),
(67, 'zaezaeza', 1, '2021-03-08 09:35:07', 24, 63, NULL),
(66, 'zezezaezaea', 1, '2021-03-08 09:32:28', 24, 62, NULL),
(65, 'aezeazeaze', 1, '2021-03-08 09:32:20', 24, NULL, NULL),
(64, 'salut', 1, '2021-03-08 09:21:01', 24, 62, NULL),
(63, 'yo', 1, '2021-03-08 09:15:52', 24, 61, NULL),
(62, 'bonjour', 1, '2021-03-08 09:14:52', 24, NULL, NULL),
(61, 'salut', 1, '2021-03-08 09:14:28', 24, NULL, NULL),
(74, 'mon message', 1, '2021-03-08 11:27:28', 35, 72, NULL),
(75, 'yolo', 1, '2021-03-08 11:27:42', 35, NULL, NULL),
(76, 'salut', 1, '2021-03-08 11:30:15', 35, NULL, NULL),
(77, 'salut', 1, '2021-03-08 11:32:13', 35, NULL, NULL),
(78, 'bonjour', 1, '2021-03-08 11:32:20', 35, NULL, NULL),
(79, 'salut les lou lou', 1, '2021-03-08 11:33:30', 35, NULL, NULL),
(80, 'frt', 1, '2021-03-08 11:34:30', 35, NULL, NULL),
(81, 'derty', 1, '2021-03-08 11:35:03', 35, NULL, NULL),
(82, 'salut', 1, '2021-03-08 11:35:44', 35, NULL, NULL),
(83, 'test', 1, '2021-03-08 11:37:53', 35, NULL, NULL),
(84, 'erezrzeerze', 1, '2021-03-08 11:38:35', 35, NULL, NULL),
(85, 'ezzaezae', 1, '2021-03-08 11:39:24', 35, NULL, NULL),
(86, 'erzerzer', 1, '2021-03-08 11:40:18', 35, NULL, NULL),
(87, 'test', 1, '2021-03-08 11:41:39', 35, NULL, NULL),
(88, 'fddfsdfs', 1, '2021-03-08 11:42:21', 35, NULL, NULL),
(89, 'je suis fou', 1, '2021-03-08 11:42:35', 35, NULL, NULL),
(90, 'Mercie pour le test', 1, '2021-03-08 11:42:48', 35, 87, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_home`
--

DROP TABLE IF EXISTS `t_home`;
CREATE TABLE IF NOT EXISTS `t_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titel` text NOT NULL,
  `quote` varchar(255) NOT NULL,
  `presentation` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_home`
--

INSERT INTO `t_home` (`id`, `titel`, `quote`, `presentation`, `is_active`) VALUES
(1, 'Bienvenue à Dragonnser Art!', 'L’art, c’est le plus court chemin de l’homme à l’homme. <br><small>Citations d\'André Malraux</small>', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis molestiae fugiat ipsa voluptate, magni eligendi dolore ullam non et minima vel labore modi unde saepe ea reiciendis, officiis laboriosam dolorem?\r\n                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis molestiae fugiat ipsa voluptate, magni eligendi dolore ullam non et minima vel labore modi unde saepe ea reiciendis, officiis laboriosam dolorem?\r\n                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis molestiae fugiat ipsa voluptate, magni eligendi dolore ullam non et minima vel labore modi unde saepe ea reiciendis, officiis laboriosam dolorem?\r\n                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis molestiae fugiat ipsa voluptate, magni eligendi dolore ullam non et minima vel labore modi unde saepe ea reiciendis, officiis laboriosam dolorem?', 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_medias`
--

DROP TABLE IF EXISTS `t_medias`;
CREATE TABLE IF NOT EXISTS `t_medias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `urlsmall` varchar(255) NOT NULL,
  `isgalerie` int(1) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL,
  `info` text NOT NULL DEFAULT '',
  `urlbig` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_medias`
--

INSERT INTO `t_medias` (`id`, `name`, `urlsmall`, `isgalerie`, `type`, `info`, `urlbig`) VALUES
(111, 'img_5facad4a284b5_img_5f8834b4deaaa.jpg', '2021\\03\\small\\img_603f1e4a423e4.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a423e4.jpg'),
(110, 'img_5facad4a9dd40_img_5f8834b5cecfc.jpg', '2021\\03\\small\\img_603f1e4a3692b.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a3692b.jpg'),
(29, 'img_5facad4a5c7d1_img_5f8834b5a0bf5.jpg', '2021\\03\\small\\img_603f026a84a60.jpg', 1, 'img', '', '2021\\03\\big\\img_603f026a84a60.jpg'),
(32, 'img_5facad4a442c5_img_5f8834b4f3afc.jpg', '2021\\03\\small\\img_603f026aa7eb2.jpg', 1, 'img', '', '2021\\03\\big\\img_603f026aa7eb2.jpg'),
(134, 'img_5facad70ed96f_img_5f8834d66c528.jpg', '2021\\03\\small\\img_6042222b9f3ff.jpg', 0, 'img', '', '2021\\03\\big\\img_6042222b9f3ff.jpg'),
(135, 'img_5facad71a94dd_img_5f8834d92fc71.jpg', '2021\\03\\small\\img_6042222ba7bb3.jpg', 0, 'img', '', '2021\\03\\big\\img_6042222ba7bb3.jpg'),
(35, 'img_5facad4ab6be9_img_5f8834b5e1133.jpg', '2021\\03\\small\\img_603f026ac4b83.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026ac4b83.jpg'),
(36, 'img_5facad4acdef8_img_5f8834b5f197c.jpg', '2021\\03\\small\\img_603f026accf9f.jpg', 1, 'img', '', '2021\\03\\big\\img_603f026accf9f.jpg'),
(37, 'img_5facad4ae4b2c_img_5f8834b6a9563.jpg', '2021\\03\\small\\img_603f026ad534c.jpg', 1, 'img', '', '2021\\03\\big\\img_603f026ad534c.jpg'),
(38, 'img_5facad4af019a_img_5f8834b6b1b90.jpg', '2021\\03\\small\\img_603f026ad9634.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026ad9634.jpg'),
(133, 'img_5facad70e17c1_img_5f8834d60f3e8.jpg', '2021\\03\\small\\img_6042222b99a52.jpg', 0, 'img', '', '2021\\03\\big\\img_6042222b99a52.jpg'),
(40, 'img_5facad4b4c384_img_5f8834b7b9a9f.jpg', '2021\\03\\small\\img_603f026ae9fa4.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026ae9fa4.jpg'),
(42, 'img_5facad4b080c2_img_5f8834b6ba4ef.jpg', '2021\\03\\small\\img_603f026b0cbf9.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026b0cbf9.jpg'),
(43, 'img_5facad4b84a5e_img_5f8834b7e010b.jpg', '2021\\03\\small\\img_603f026b10fdc.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026b10fdc.jpg'),
(136, 'img_5facad71befba_img_5f8834d93e833.jpg', '2021\\03\\small\\img_6042222bb1dc0.jpg', 0, 'img', '', '2021\\03\\big\\img_6042222bb1dc0.jpg'),
(45, 'img_5facad4b7390f_img_5f8834b7d4900.jpg', '2021\\03\\small\\img_603f026b242c6.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026b242c6.jpg'),
(52, 'img_5facad4c6ffd0_img_5f8834b53d85a.jpg', '2021\\03\\small\\img_603f026b7e2b7.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026b7e2b7.jpg'),
(53, 'img_5facad4c12d5c_img_5f8834b9b2c29.jpg', '2021\\03\\small\\img_603f026b91ecb.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026b91ecb.jpg'),
(54, 'img_5facad4c9240c_img_5f8834b62c826.jpg', '2021\\03\\small\\img_603f026b9ea6c.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026b9ea6c.jpg'),
(55, 'img_5facad4ca95c6_img_5f8834b63d3ee.jpg', '2021\\03\\small\\img_603f026ba7223.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026ba7223.jpg'),
(56, 'img_5facad4cbae47_img_5f8834b66b3c7.jpg', '2021\\03\\small\\img_603f026badba7.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026badba7.jpg'),
(57, 'img_5facad4cd3670_img_5f8834b67d443.jpg', '2021\\03\\small\\img_603f026bb9afa.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026bb9afa.jpg'),
(58, 'img_5facad4cea320_img_5f8834b68d317.jpg', '2021\\03\\small\\img_603f026bc2610.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026bc2610.jpg'),
(59, 'img_5facad4d0dc9d_img_5f8834b69d962.jpg', '2021\\03\\small\\img_603f026bcc28f.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026bcc28f.jpg'),
(60, 'img_5facad4d4ee09_img_5f8834b73b5c3.jpg', '2021\\03\\small\\img_603f026bd2c06.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026bd2c06.jpg'),
(112, 'img_5facad4a442c5_img_5f8834b4f3afc.jpg', '2021\\03\\small\\img_603f1e4a50a30.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a50a30.jpg'),
(62, 'img_5facad4d38bc0_img_5f8834b72bd3a.jpg', '2021\\03\\small\\img_603f026be2ff7.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026be2ff7.jpg'),
(63, 'img_5facad4d64ebb_img_5f8834b74b2b2.jpg', '2021\\03\\small\\img_603f026beb0e3.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026beb0e3.jpg'),
(64, 'img_5facad4d90c70_img_5f8834b81cc3e.jpg', '2021\\03\\small\\img_603f026c0532e.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c0532e.jpg'),
(65, 'img_5facad4d817ed_img_5f8834b78ec0e.jpg', '2021\\03\\small\\img_603f026c0d758.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c0d758.jpg'),
(67, 'img_5facad4dbe35d_img_5f8834b83be50.jpg', '2021\\03\\small\\img_603f026c1af1f.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c1af1f.jpg'),
(69, 'img_5facad4dea065_img_5f8834b89e3f4.jpg', '2021\\03\\small\\img_603f026c2b599.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c2b599.jpg'),
(70, 'img_5facad4e2d49b_img_5f8834b93ed38.jpg', '2021\\03\\small\\img_603f026c39aab.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c39aab.jpg'),
(71, 'img_5facad4e7e3da_img_5f8834b461ec5.jpg', '2021\\03\\small\\img_603f026c45b1e.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c45b1e.jpg'),
(72, 'img_5facad4e9a780_img_5f8834b616a51.jpg', '2021\\03\\small\\img_603f026c4c442.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c4c442.jpg'),
(73, 'img_5facad4e47f67_img_5f8834b98b30f.jpg', '2021\\03\\small\\img_603f026c51257.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c51257.jpg'),
(74, 'img_5facad4e1234f_img_5f8834b92be51.jpg', '2021\\03\\small\\img_603f026c5dfa3.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c5dfa3.jpg'),
(75, 'img_5facad4e64067_img_5f8834b99fe65.jpg', '2021\\03\\small\\img_603f026c6afda.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c6afda.jpg'),
(76, 'img_5facad4e90761_img_5f8834b598cfc.jpg', '2021\\03\\small\\img_603f026c7784d.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c7784d.jpg'),
(77, 'img_5facad4eaadeb_img_5f8834b773f87.jpg', '2021\\03\\small\\img_603f026c78b64.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c78b64.jpg'),
(78, 'img_5facad4ece175_img_5f8834b868d08.jpg', '2021\\03\\small\\img_603f026c8cdce.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c8cdce.jpg'),
(109, 'img_5facad4a5c7d1_img_5f8834b5a0bf5.jpg', '2021\\03\\small\\img_603f1e4a2e0a0.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a2e0a0.jpg'),
(80, 'img_5facad4f5a771_img_5f8834b6493b0.jpg', '2021\\03\\small\\img_603f026c9d896.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026c9d896.jpg'),
(81, 'img_5facad4f8a18a_img_5f8834b8010fc.jpg', '2021\\03\\small\\img_603f026ca5f8d.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026ca5f8d.jpg'),
(82, 'img_5facad4f34dfd_img_5f8834b4822ff.jpg', '2021\\03\\small\\img_603f026cbacc9.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026cbacc9.jpg'),
(83, 'img_5facad4f083e4_img_5f8834b889eda.jpg', '2021\\03\\small\\img_603f026cc37c2.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026cc37c2.jpg'),
(84, 'img_5facad4f716c3_img_5f8834b6598a6.jpg', '2021\\03\\small\\img_603f026ccfb86.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026ccfb86.jpg'),
(85, 'img_5facad4f2369f_img_5f8834b4560ed.jpg', '2021\\03\\small\\img_603f026cd8133.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026cd8133.jpg'),
(86, 'img_5facad4f4963f_img_5f8834b6215d7.jpg', '2021\\03\\small\\img_603f026cde2f7.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026cde2f7.jpg'),
(87, 'img_5facad4fae769_img_5f8834b9522f7.jpg', '2021\\03\\small\\img_603f026ce4201.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026ce4201.jpg'),
(88, 'img_5facad4fc86f1_img_5f8834b9761c7.jpg', '2021\\03\\small\\img_603f026cf019d.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026cf019d.jpg'),
(89, 'img_5facad4fe3fc2_img_5f8834b49064c.jpg', '2021\\03\\small\\img_603f026d0874a.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d0874a.jpg'),
(90, 'img_5facad4fef2f4_img_5f8834b70692f.jpg', '2021\\03\\small\\img_603f026d0c76e.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d0c76e.jpg'),
(91, 'img_5facad5a0d4a8_img_5f8834c4f1cbc.JPG', '2021\\03\\small\\img_603f026d1a998.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d1a998.jpg'),
(92, 'img_5facad5a6e920_img_5f8834c5e5003.jpg', '2021\\03\\small\\img_603f026d22754.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d22754.jpg'),
(93, 'img_5facad5a9bba9_img_5f8834c6b4ecf.jpg', '2021\\03\\small\\img_603f026d2b1a8.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d2b1a8.jpg'),
(94, 'img_5facad5a255ad_img_5f8834c5b1915.jpg', '2021\\03\\small\\img_603f026d3f149.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d3f149.jpg'),
(95, 'img_5facad5a00643_img_5f8834c4cd3d0.jpg', '2021\\03\\small\\img_603f026d4d618.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d4d618.jpg'),
(96, 'img_5facad5a853b9_img_5f8834c6a50ce.jpg', '2021\\03\\small\\img_603f026d517a3.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d517a3.jpg'),
(108, 'img_5facad4a0a8e2_img_5f8834b4c8b0c.jpg', '2021\\03\\small\\img_603f1e4a1ea84.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a1ea84.jpg'),
(98, 'img_5facad5a58476_img_5f8834c5d5dfd.jpg', '2021\\03\\small\\img_603f026d630a9.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d630a9.jpg'),
(99, 'img_5facad5abfcd4_img_5f8834c6d02d4.jpg', '2021\\03\\small\\img_603f026d6af71.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d6af71.jpg'),
(100, 'img_5facad5ad7b93_img_5f8834c6e08fc.jpg', '2021\\03\\small\\img_603f026d73109.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d73109.jpg'),
(101, 'img_5facad5aedcfe_img_5f8834c6efe6a.jpg', '2021\\03\\small\\img_603f026d7ad8d.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d7ad8d.jpg'),
(102, 'img_5facad5b0feee_img_5f8834c7a3116.jpg', '2021\\03\\small\\img_603f026d834de.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d834de.jpg'),
(103, 'img_5facad5b5c67b_img_5f8834c8ad15e.jpg', '2021\\03\\small\\img_603f026d8bd07.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d8bd07.jpg'),
(105, 'img_5facad5b25ac5_img_5f8834c7b221a.jpg', '2021\\03\\small\\img_603f026d9a567.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026d9a567.jpg'),
(106, 'img_5facad5b724e1_img_5f8834c8bc666.jpg', '2021\\03\\small\\img_603f026da67f4.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026da67f4.jpg'),
(107, 'img_5facad5b41369_img_5f8834c08d82d.jpg', '2021\\03\\small\\img_603f026dbb651.jpg', 0, 'img', '', '2021\\03\\big\\img_603f026dbb651.jpg'),
(114, 'img_5facad4a886ff_img_5f8834b5bfd9a.jpg', '2021\\03\\small\\img_603f1e4a64c43.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a64c43.jpg'),
(115, 'img_5facad4ab6be9_img_5f8834b5e1133.jpg', '2021\\03\\small\\img_603f1e4a6d9de.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a6d9de.jpg'),
(116, 'img_5facad4acdef8_img_5f8834b5f197c.jpg', '2021\\03\\small\\img_603f1e4a760de.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a760de.jpg'),
(117, 'img_5facad4ae4b2c_img_5f8834b6a9563.jpg', '2021\\03\\small\\img_603f1e4a7e713.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a7e713.jpg'),
(118, 'img_5facad4af019a_img_5f8834b6b1b90.jpg', '2021\\03\\small\\img_603f1e4a829ea.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a829ea.jpg'),
(119, 'img_5facad4b2ff7f_img_5f8834b7a4acc.jpg', '2021\\03\\small\\img_603f1e4a86e24.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a86e24.jpg'),
(120, 'img_5facad4b4c384_img_5f8834b7b9a9f.jpg', '2021\\03\\small\\img_603f1e4a935f7.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a935f7.jpg'),
(121, 'img_5facad4b13dea_img_5f8834b6c2ef3.jpg', '2021\\03\\small\\img_603f1e4a9dcac.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4a9dcac.jpg'),
(122, 'img_5facad4b080c2_img_5f8834b6ba4ef.jpg', '2021\\03\\small\\img_603f1e4aaa4c5.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4aaa4c5.jpg'),
(123, 'img_5facad4b84a5e_img_5f8834b7e010b.jpg', '2021\\03\\small\\img_603f1e4aaea6c.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4aaea6c.jpg'),
(125, 'img_5facad4b7390f_img_5f8834b7d4900.jpg', '2021\\03\\small\\img_603f1e4ac1ab7.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4ac1ab7.jpg'),
(126, 'img_5facad4ba0870_img_5f8834b8b372c.jpg', '2021\\03\\small\\img_603f1e4ac7cea.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4ac7cea.jpg'),
(130, 'img_5facad4c2c52d_img_5f8834b9c48eb.jpg', '2021\\03\\small\\img_603f1e4af3bf7.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4af3bf7.jpg'),
(132, 'img_5facad4c6ffd0_img_5f8834b53d85a.jpg', '2021\\03\\small\\img_603f1e4b270bb.jpg', 0, 'img', '', '2021\\03\\big\\img_603f1e4b270bb.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `t_messages`
--

DROP TABLE IF EXISTS `t_messages`;
CREATE TABLE IF NOT EXISTS `t_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objet_message` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `content_message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `t_rgpd`
--

DROP TABLE IF EXISTS `t_rgpd`;
CREATE TABLE IF NOT EXISTS `t_rgpd` (
  `name` varchar(45) NOT NULL,
  `description` text DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_rgpd`
--

INSERT INTO `t_rgpd` (`name`, `description`, `img_url`) VALUES
('rgpd', '<p>Le(s) service(s) [citer le nom du ou des services concern&eacute;s] dispose(nt) de moyens informatiques destin&eacute;s &agrave; g&eacute;rer plus facilement &hellip; [indiquer la finalit&eacute; du traitement].Les informations enregistr&eacute;es sont r&eacute;serv&eacute;es &agrave; l&rsquo;usage du (ou des) service(s) concern&eacute;(s) et ne peuvent &ecirc;tre communiqu&eacute;es qu&rsquo;aux destinataires suivants : [pr&eacute;ciser les destinataires]. Depuis la loi n&deg; 78-17 du 6 janvier 1978 modifi&eacute;e, relative &agrave; l&rsquo;informatique, aux fichiers et aux libert&eacute;s, toute personne peut obtenir communication et, le cas &eacute;ch&eacute;ant, rectification ou suppression des informations la concernant, en s&rsquo;adressant au service [citer le nom du service ou des services concern&eacute;s] avec copie au DPO de l&rsquo;&eacute;tablissement (quand il a &eacute;t&eacute; nomm&eacute;). Toute personne peut &eacute;galement, pour des motifs l&eacute;gitimes, s&rsquo;opposer au traitement des donn&eacute;es la concernant &ldquo;[&agrave; ne pas faire figurer si le traitement pr&eacute;sente un caract&egrave;re obligatoire.]</p>', NULL),
('legal_notive', '<p>Merci de lire avec attention les diff&eacute;rentes modalit&eacute;s d&rsquo;utilisation du pr&eacute;sent site avant d&rsquo;y parcourir ses pages. En vous connectant sur ce site, vous acceptez, sans r&eacute;serves, les pr&eacute;sentes modalit&eacute;s.</p>\r\n<p>Aussi, conform&eacute;ment &agrave; l&rsquo;article n&deg;6 de la Loi n&deg;2004-575 du 21 Juin 2004 pour la confiance dans l&rsquo;&eacute;conomie num&eacute;rique, les responsables du pr&eacute;sent site internet&nbsp;<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a>&nbsp;sont :</p>\r\n<p><strong>&Eacute;diteur du Site :</strong></p>\r\n<p>SARL ANTHEDESIGN Num&eacute;ro de SIRET : 75221735600027</p>\r\n<p>Responsable &eacute;ditorial :&nbsp;<a href=\"https://www.anthedesign.fr/author/hugo-essique/\">Hugo ESSIQUE</a></p>\r\n<p>12 Rue du Huit Mai 1945, 60350 ATTICHY</p>\r\n<p>T&eacute;l&eacute;phone : 09 72 21 25 07</p>\r\n<p>Email : contact@anthedesign.fr</p>\r\n<p>Site Web :&nbsp;<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a></p>\r\n<p><strong>H&eacute;bergement :</strong></p>\r\n<p>H&eacute;bergeur : SARL ANTHEDESIGN<br />12 Rue du Huit Mai 1945, 60350 ATTICHY<br />Site Web :&nbsp;<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a></p>\r\n<p><strong>D&eacute;veloppement</strong><strong>&nbsp;:</strong></p>\r\n<p>SARL ANTHEDESIGN</p>\r\n<p>Adresse : 12 Rue du Huit Mai 1945, 60350 ATTICHY</p>\r\n<p>Site Web :&nbsp;<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a></p>\r\n<p><strong>Conditions d&rsquo;utilisation :</strong></p>\r\n<p>Ce site (<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a>) est propos&eacute; en diff&eacute;rents langages web (HTML, HTML5, Javascript, CSS, etc&hellip;) pour un meilleur confort d&rsquo;utilisation et un graphisme plus agr&eacute;able.</p>\r\n<p>Nous vous recommandons de recourir &agrave; des navigateurs modernes comme Internet explorer, Safari, Firefox, Google Chrome, etc&hellip;</p>\r\n<p>L&rsquo;<a href=\"https://www.anthedesign.fr/\">agence web AntheDesign</a><strong>&nbsp;</strong>met en &oelig;uvre tous les moyens dont elle dispose, pour assurer une information fiable et une mise &agrave; jour fiable de ses sites internet.</p>\r\n<p>Toutefois, des erreurs ou omissions peuvent survenir. L&rsquo;internaute devra donc s&rsquo;assurer de l&rsquo;exactitude des informations aupr&egrave;s de AntheDesign , et signaler toutes modifications du site qu&rsquo;il jugerait utile. AntheDesign n&rsquo;est en aucun cas responsable de l&rsquo;utilisation faite de ces informations, et de tout pr&eacute;judice direct ou indirect pouvant en d&eacute;couler.</p>\r\n<p><strong>Cookies</strong>&nbsp;: Le site&nbsp;<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a>&nbsp;peut-&ecirc;tre amen&eacute; &agrave; vous demander l&rsquo;acceptation des cookies pour des besoins de statistiques et d&rsquo;affichage. Un&nbsp;<a href=\"https://www.anthedesign.fr/autour-du-web/cookie/\">cookie</a>&nbsp;est une information d&eacute;pos&eacute;e sur votre disque dur par le serveur du site que vous visitez.</p>\r\n<p>Il contient plusieurs donn&eacute;es qui sont stock&eacute;es sur votre ordinateur dans un simple fichier texte auquel un serveur acc&egrave;de pour lire et enregistrer des informations . Certaines parties de ce site ne peuvent &ecirc;tre fonctionnelles sans l&rsquo;acceptation de cookies.</p>\r\n<p><strong>Liens hypertextes :</strong>&nbsp;Les sites internet de peuvent offrir des liens vers d&rsquo;autres sites internet ou d&rsquo;autres ressources disponibles sur Internet. SARL ANTHEDESIGN ne dispose d&rsquo;aucun moyen pour contr&ocirc;ler les sites en connexion avec ses sites internet.</p>\r\n<p>AntheDesign ne r&eacute;pond pas de la disponibilit&eacute; de tels sites et sources externes, ni ne la garantit. Elle ne peut &ecirc;tre tenue pour responsable de tout dommage, de quelque nature que ce soit, r&eacute;sultant du contenu de ces sites ou sources externes, et notamment des informations, produits ou services qu&rsquo;ils proposent, ou de tout usage qui peut &ecirc;tre fait de ces &eacute;l&eacute;ments. Les risques li&eacute;s &agrave; cette utilisation incombent pleinement &agrave; l&rsquo;internaute, qui doit se conformer &agrave; leurs conditions d&rsquo;utilisation.</p>\r\n<p>Les utilisateurs, les abonn&eacute;s et les visiteurs des sites internet &nbsp;ne peuvent pas mettre en place un hyperlien en direction de ce site sans l&rsquo;autorisation expresse et pr&eacute;alable de SARL ANTHEDESIGN.</p>\r\n<p>Dans l&rsquo;hypoth&egrave;se o&ugrave; un utilisateur ou visiteur souhaiterait mettre en place un hyperlien en direction d&rsquo;un des sites internet de SARL ANTHEDESIGN, il lui appartiendra d&rsquo;adresser un email accessible sur le site afin de formuler sa demande de mise en place d&rsquo;un hyperlien.</p>\r\n<p>La SARL ANTHEDESIGN se r&eacute;serve le droit d&rsquo;accepter ou de refuser un hyperlien sans avoir &agrave; en justifier sa d&eacute;cision.</p>\r\n<p><strong>Services fournis :</strong></p>\r\n<p>L&rsquo;ensemble des activit&eacute;s de la soci&eacute;t&eacute; ainsi que ses informations sont pr&eacute;sent&eacute;s sur notre site&nbsp;<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a>.</p>\r\n<p>SARL ANTHEDESIGN s&rsquo;efforce de fournir sur le site www.anthedesign.fr des informations aussi pr&eacute;cises que possible. Les renseignements figurant sur le site&nbsp;<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a>&nbsp;ne sont pas exhaustifs et les photos non contractuelles.</p>\r\n<p>Ils sont donn&eacute;s sous r&eacute;serve de modifications ayant &eacute;t&eacute; apport&eacute;es depuis leur mise en ligne. Par ailleurs, tous les informations indiqu&eacute;es sur le site www.anthedesign.fr<strong>&nbsp;</strong>sont donn&eacute;es &agrave; titre indicatif, et sont susceptibles de changer ou d&rsquo;&eacute;voluer sans pr&eacute;avis.</p>\r\n<p><strong>Limitation contractuelles sur les donn&eacute;es :</strong></p>\r\n<p>Les informations contenues sur ce site sont aussi pr&eacute;cises que possible et le site remis &agrave; jour &agrave; diff&eacute;rentes p&eacute;riodes de l&rsquo;ann&eacute;e, mais peut toutefois contenir des inexactitudes ou des omissions.</p>\r\n<p>Si vous constatez une lacune, erreur ou ce qui parait &ecirc;tre un dysfonctionnement, merci de bien vouloir le signaler par courriel, &agrave; l&rsquo;adresse contact@anthedesign.fr, en d&eacute;crivant le probl&egrave;me de la mani&egrave;re la plus pr&eacute;cise possible (page posant probl&egrave;me, type d&rsquo;ordinateur et de navigateur utilis&eacute;, &hellip;).</p>\r\n<p>Tout contenu t&eacute;l&eacute;charg&eacute; se fait aux risques et p&eacute;rils de l&rsquo;utilisateur et sous sa seule responsabilit&eacute;. En cons&eacute;quence, ne saurait &ecirc;tre tenu responsable d&rsquo;un quelconque dommage subi par l&rsquo;ordinateur de l&rsquo;utilisateur ou d&rsquo;une quelconque perte de donn&eacute;es cons&eacute;cutives au t&eacute;l&eacute;chargement.</p>\r\n<p>De plus, l&rsquo;utilisateur du site s&rsquo;engage &agrave; acc&eacute;der au site en utilisant un mat&eacute;riel r&eacute;cent, ne contenant pas de virus et avec un navigateur de derni&egrave;re g&eacute;n&eacute;ration mis-&agrave;-jour.</p>\r\n<p>Les liens hypertextes mis en place dans le cadre du pr&eacute;sent site internet en direction d&rsquo;autres ressources pr&eacute;sentes sur le r&eacute;seau Internet ne sauraient engager la responsabilit&eacute; de SARL ANTHEDESIGN.</p>\r\n<p><strong>Propri&eacute;t&eacute; intellectuelle :</strong></p>\r\n<p>Tout le contenu du pr&eacute;sent site&nbsp;<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a>, incluant, de fa&ccedil;on non limitative, les graphismes, images, textes, vid&eacute;os, animations, sons, logos, gifs et ic&ocirc;nes ainsi que leur mise en forme sont la propri&eacute;t&eacute; exclusive de la soci&eacute;t&eacute; &agrave; l&rsquo;exception des marques, logos ou contenus appartenant &agrave; d&rsquo;autres soci&eacute;t&eacute;s partenaires ou auteurs.</p>\r\n<p>Toute reproduction, distribution, modification, adaptation, retransmission ou publication, m&ecirc;me partielle, de ces diff&eacute;rents &eacute;l&eacute;ments est strictement interdite sans l&rsquo;accord expr&egrave;s par &eacute;crit de SARL ANTHEDESIGN. Cette repr&eacute;sentation ou reproduction, par quelque proc&eacute;d&eacute; que ce soit, constitue une contrefa&ccedil;on sanctionn&eacute;e par les articles L.335-2 et suivants du Code de la propri&eacute;t&eacute; intellectuelle. Le non-respect de cette interdiction constitue une contrefa&ccedil;on pouvant engager la responsabilit&eacute; civile et p&eacute;nale du contrefacteur. En outre, les propri&eacute;taires des Contenus copi&eacute;s pourraient intenter une action en justice &agrave; votre encontre.</p>\r\n<p><strong>D&eacute;claration &agrave; la CNIL :</strong></p>\r\n<p>Conform&eacute;ment &agrave; la loi 78-17 du 6 janvier 1978 (modifi&eacute;e par la loi 2004-801 du 6 ao&ucirc;t 2004 relative &agrave; la protection des personnes physiques &agrave; l&rsquo;&eacute;gard des traitements de donn&eacute;es &agrave; caract&egrave;re personnel) relative &agrave; l&rsquo;informatique, aux fichiers et aux libert&eacute;s, ce site a fait l&rsquo;objet d&rsquo;une d&eacute;claration 1656629 aupr&egrave;s de la Commission nationale de l&rsquo;informatique et des libert&eacute;s (<a href=\"http://www.cnil.fr/\">www.cnil.fr</a>).</p>\r\n<p><strong>Litiges :</strong></p>\r\n<p>Les pr&eacute;sentes conditions du site&nbsp;<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a>&nbsp;sont r&eacute;gies par les lois fran&ccedil;aises et toute contestation ou litiges qui pourraient na&icirc;tre de l&rsquo;interpr&eacute;tation ou de l&rsquo;ex&eacute;cution de celles-ci seront de la comp&eacute;tence exclusive des tribunaux dont d&eacute;pend le si&egrave;ge social de la soci&eacute;t&eacute;. La langue de r&eacute;f&eacute;rence, pour le r&egrave;glement de contentieux &eacute;ventuels, est le fran&ccedil;ais.</p>\r\n<p><strong>Donn&eacute;es personnelles :</strong></p>\r\n<p>De mani&egrave;re g&eacute;n&eacute;rale, vous n&rsquo;&ecirc;tes pas tenu de nous communiquer vos donn&eacute;es personnelles lorsque vous visitez notre site Internet&nbsp;<a href=\"https://www.anthedesign.fr/\">www.anthedesign.fr</a>.</p>\r\n<p>Cependant, ce principe comporte certaines exceptions. En effet, pour certains services propos&eacute;s par notre site, vous pouvez &ecirc;tre amen&eacute;s &agrave; nous communiquer certaines donn&eacute;es telles que : votre nom, votre fonction, le nom de votre soci&eacute;t&eacute;, votre adresse &eacute;lectronique, et votre num&eacute;ro de t&eacute;l&eacute;phone. Tel est le cas lorsque vous remplissez le formulaire qui vous est propos&eacute; en ligne, dans la rubrique &laquo;&nbsp;<a href=\"https://www.anthedesign.fr/contact/\">contact</a>&nbsp;&raquo;.</p>\r\n<p>Dans tous les cas, vous pouvez refuser de fournir vos donn&eacute;es personnelles. Dans ce cas, vous ne pourrez pas utiliser les services du site, notamment celui de solliciter des renseignements sur notre soci&eacute;t&eacute;, ou de recevoir les lettres d&rsquo;information.</p>\r\n<p>Enfin, nous pouvons collecter de mani&egrave;re automatique certaines informations vous concernant lors d&rsquo;une simple navigation sur notre site internet, notamment : des informations concernant l&rsquo;utilisation de notre site, comme les zones que vous visitez et les services auxquels vous acc&eacute;dez, votre&nbsp;<a href=\"https://www.anthedesign.fr/hebergement-web/adresse-ip/\">adresse IP</a>, le type de votre navigateur, vos temps d&rsquo;acc&egrave;s.</p>\r\n<p>De telles informations sont utilis&eacute;es exclusivement &agrave; des fins de statistiques internes, de mani&egrave;re &agrave; am&eacute;liorer la qualit&eacute; des services qui vous sont propos&eacute;s. Les bases de donn&eacute;es sont prot&eacute;g&eacute;es par les dispositions de la loi du 1er juillet 1998 transposant la directive 96/9 du 11 mars 1996 relative &agrave; la protection juridique des bases de donn&eacute;es.</p>', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_roles`
--

DROP TABLE IF EXISTS `t_roles`;
CREATE TABLE IF NOT EXISTS `t_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `description_role` varchar(255) DEFAULT NULL,
  `img_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_roles`
--

INSERT INTO `t_roles` (`id`, `role_name`, `description_role`, `img_role`) VALUES
(1, 'admin', 'gère l\'ensemble du site et possède tout les droit d\'administration ', 'avatar\\img_6039ffa8ce94d.png'),
(6, 'modérateur', 'gère le blog et le portfolio peut supprimer des commentaires ', 'avatar\\img_6039ffbbcd804.png'),
(22, 'user', 'utilisateur standard du site ', 'avatar\\img_6039ffe76e9f2.png');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_info`
--

DROP TABLE IF EXISTS `t_site_info`;
CREATE TABLE IF NOT EXISTS `t_site_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_site` varchar(255) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `fix_phone` int(11) DEFAULT NULL,
  `mobile_number` int(11) DEFAULT NULL,
  `url_facebook` varchar(255) DEFAULT NULL,
  `url_tweeter` varchar(255) DEFAULT NULL,
  `url_insta` varchar(255) DEFAULT NULL,
  `url_youtube` varchar(255) DEFAULT NULL,
  `url_Linkedin` varchar(255) DEFAULT NULL,
  `url_pinterest` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_site_info`
--

INSERT INTO `t_site_info` (`id`, `name_site`, `site_email`, `fix_phone`, `mobile_number`, `url_facebook`, `url_tweeter`, `url_insta`, `url_youtube`, `url_Linkedin`, `url_pinterest`) VALUES
(1, 'Dragonnser-Art', 'beroute97480@hotmail.fr', 262000000, 692417574, 'https://www.facebook.com/', 'https://www.tweeter.com/', 'https://www.instagram.com/', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `t_tags`
--

DROP TABLE IF EXISTS `t_tags`;
CREATE TABLE IF NOT EXISTS `t_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_tag` varchar(45) NOT NULL,
  `description_tag` varchar(255) NOT NULL,
  `url_tag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_tags`
--

INSERT INTO `t_tags` (`id`, `name_tag`, `description_tag`, `url_tag`) VALUES
(5, 'tag de test', 'ezaeazezaeza', 'icon\\img_603b4a6a61cee.png');

-- --------------------------------------------------------

--
-- Structure de la table `t_tracker`
--

DROP TABLE IF EXISTS `t_tracker`;
CREATE TABLE IF NOT EXISTS `t_tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_connection` date NOT NULL DEFAULT current_timestamp(),
  `ip_user` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_tracker`
--

INSERT INTO `t_tracker` (`id`, `date_connection`, `ip_user`) VALUES
(1, '2021-03-04', '::1'),
(2, '2021-03-05', '::1'),
(3, '2021-03-05', '::1'),
(4, '2021-03-05', '::1'),
(5, '2021-03-05', '::1'),
(6, '2021-03-05', '::1'),
(7, '2021-03-05', '::1'),
(8, '2021-03-05', '::1'),
(9, '2021-03-05', '::1'),
(10, '2021-03-05', '::1'),
(11, '2021-03-05', '::1'),
(12, '2021-03-05', '::1'),
(13, '2021-03-05', '::1'),
(14, '2021-03-05', '::1'),
(15, '2021-03-05', '::1'),
(16, '2021-03-05', '::1'),
(17, '2021-03-05', '::1'),
(18, '2021-03-05', '::1'),
(19, '2021-03-05', '::1'),
(20, '2021-03-05', '::1'),
(21, '2021-03-05', '::1'),
(22, '2021-03-05', '::1'),
(23, '2021-03-05', '::1'),
(24, '2021-03-05', '::1'),
(25, '2021-03-05', '::1'),
(26, '2021-03-05', '::1'),
(27, '2021-03-05', '::1'),
(28, '2021-03-05', '::1'),
(29, '2021-03-05', '::1'),
(30, '2021-03-05', '::1'),
(31, '2021-03-06', '::1'),
(32, '2021-03-06', '::1'),
(33, '2021-03-07', '::1'),
(34, '2021-03-08', '::1'),
(35, '2021-03-08', '::1'),
(36, '2021-03-08', '::1'),
(37, '2021-03-08', '::1'),
(38, '2021-03-08', '::1'),
(39, '2021-03-08', '::1'),
(40, '2021-03-08', '::1'),
(41, '2021-03-08', '::1'),
(42, '2021-03-08', '::1'),
(43, '2021-03-08', '::1'),
(44, '2021-03-08', '::1'),
(45, '2021-03-08', '::1'),
(46, '2021-03-08', '::1'),
(47, '2021-03-08', '::1'),
(48, '2021-03-08', '::1'),
(49, '2021-03-08', '::1'),
(50, '2021-03-08', '::1'),
(51, '2021-03-08', '::1'),
(52, '2021-03-08', '::1'),
(53, '2021-03-08', '::1'),
(54, '2021-03-08', '::1'),
(55, '2021-03-08', '::1'),
(56, '2021-03-08', '::1'),
(57, '2021-03-08', '::1'),
(58, '2021-03-08', '::1'),
(59, '2021-03-08', '::1'),
(60, '2021-03-08', '::1'),
(61, '2021-03-08', '::1'),
(62, '2021-03-08', '::1'),
(63, '2021-03-08', '::1'),
(64, '2021-03-08', '::1'),
(65, '2021-03-08', '::1'),
(66, '2021-03-08', '::1'),
(67, '2021-03-08', '::1'),
(68, '2021-03-08', '::1'),
(69, '2021-03-08', '::1'),
(70, '2021-03-08', '::1'),
(71, '2021-03-08', '::1'),
(72, '2021-03-08', '::1'),
(73, '2021-03-08', '::1'),
(74, '2021-03-08', '::1'),
(75, '2021-03-08', '::1'),
(76, '2021-03-08', '::1'),
(77, '2021-03-08', '::1'),
(78, '2021-03-08', '::1'),
(79, '2021-03-08', '::1'),
(80, '2021-03-08', '::1'),
(81, '2021-03-08', '::1'),
(82, '2021-03-08', '::1'),
(83, '2021-03-08', '::1'),
(84, '2021-03-08', '::1'),
(85, '2021-03-08', '::1'),
(86, '2021-03-08', '::1'),
(87, '2021-03-08', '::1'),
(88, '2021-03-08', '::1'),
(89, '2021-03-08', '::1'),
(90, '2021-03-08', '::1'),
(91, '2021-03-08', '::1'),
(92, '2021-03-08', '::1'),
(93, '2021-03-08', '::1'),
(94, '2021-03-08', '::1'),
(95, '2021-03-08', '::1'),
(96, '2021-03-08', '::1'),
(97, '2021-03-08', '::1'),
(98, '2021-03-08', '::1'),
(99, '2021-03-08', '::1'),
(100, '2021-03-08', '::1');

-- --------------------------------------------------------

--
-- Structure de la table `t_users`
--

DROP TABLE IF EXISTS `t_users`;
CREATE TABLE IF NOT EXISTS `t_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `validatekey` varchar(255) NOT NULL DEFAULT '0',
  `validate` int(1) NOT NULL DEFAULT 0,
  `avatar` varchar(255) NOT NULL,
  `fk_role_id` int(11) NOT NULL DEFAULT 2,
  `count_active` tinyint(1) NOT NULL DEFAULT 0,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp(),
  `fk_lang` int(11) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `enable_user` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_users`
--

INSERT INTO `t_users` (`id`, `login`, `name`, `password`, `email`, `validatekey`, `validate`, `avatar`, `fk_role_id`, `count_active`, `registration_date`, `fk_lang`, `first_name`, `enable_user`) VALUES
(1, 'admin', 'fredy fred', 'd033e22ae348aeb5660fc2140aec35850c4da997', '97480@hotmail.fr', '', 1, 'avatar\\img_603a000394189.jpg', 1, 1, '2021-02-17 20:42:10', 1, 'Gina Fontaine5', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_users_has_t_users_info`
--

DROP TABLE IF EXISTS `t_users_has_t_users_info`;
CREATE TABLE IF NOT EXISTS `t_users_has_t_users_info` (
  `t_users_id` int(11) NOT NULL,
  `t_users_info_id` int(11) NOT NULL,
  PRIMARY KEY (`t_users_id`,`t_users_info_id`),
  KEY `fk_t_users_has_t_users_info_t_users_info1_idx` (`t_users_info_id`),
  KEY `fk_t_users_has_t_users_info_t_users_idx` (`t_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_users_has_t_users_info`
--

INSERT INTO `t_users_has_t_users_info` (`t_users_id`, `t_users_info_id`) VALUES
(1, 39);

-- --------------------------------------------------------

--
-- Structure de la table `t_users_info`
--

DROP TABLE IF EXISTS `t_users_info`;
CREATE TABLE IF NOT EXISTS `t_users_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_users_info`
--

INSERT INTO `t_users_info` (`id`, `zip_code`, `country`, `city`, `address`, `address_2`, `phone`, `mobile`) VALUES
(39, '97480', 'Réunion', 'Saint Joseph', '6 rue renée', '6 rue rené hoareau bat b porte 18, batiment b porte 18', '0692417574', NULL),
(40, '97480', 'Réunion', 'Saint Joseph', '6 rue renée hoareau', '6 rue renée hoareau, batiment b porte 11', '0262413776', NULL),
(41, '97480', 'Réunion', 'saint joseph', '5a rue joseph bedier les jaques', '5a rue joseph bedier les jaques', '0692417574', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
