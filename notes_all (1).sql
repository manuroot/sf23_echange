-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Lun 07 Octobre 2013 à 08:24
-- Version du serveur: 5.5.32
-- Version de PHP: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `notes_all`
--

-- --------------------------------------------------------

--
-- Structure de la table `acl_classes`
--

CREATE TABLE IF NOT EXISTS `acl_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `acl_classes`
--

INSERT INTO `acl_classes` (`id`, `class_type`) VALUES
(2, 'Application\\CertificatsBundle\\Entity\\CertificatsCenter');

-- --------------------------------------------------------

--
-- Structure de la table `acl_entries`
--

CREATE TABLE IF NOT EXISTS `acl_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `object_identity_id` int(10) unsigned DEFAULT NULL,
  `security_identity_id` int(10) unsigned NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  KEY `IDX_46C8B806EA000B10` (`class_id`),
  KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  KEY `IDX_46C8B806DF9183C9` (`security_identity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Contenu de la table `acl_entries`
--

INSERT INTO `acl_entries` (`id`, `class_id`, `object_identity_id`, `security_identity_id`, `field_name`, `ace_order`, `mask`, `granting`, `granting_strategy`, `audit_success`, `audit_failure`) VALUES
(7, 2, 7, 3, NULL, 0, 128, 1, 'all', 0, 0),
(8, 2, 8, 3, NULL, 0, 128, 1, 'all', 0, 0),
(9, 2, 9, 3, NULL, 0, 128, 1, 'all', 0, 0),
(10, 2, 10, 3, NULL, 0, 128, 1, 'all', 0, 0),
(11, 2, 11, 3, NULL, 0, 128, 1, 'all', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `acl_object_identities`
--

CREATE TABLE IF NOT EXISTS `acl_object_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_object_identity_id` int(10) unsigned DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Contenu de la table `acl_object_identities`
--

INSERT INTO `acl_object_identities` (`id`, `parent_object_identity_id`, `class_id`, `object_identifier`, `entries_inheriting`) VALUES
(7, NULL, 2, '1157', 1),
(8, NULL, 2, '1158', 1),
(9, NULL, 2, '1159', 1),
(10, NULL, 2, '1160', 1),
(11, NULL, 2, '1161', 1);

-- --------------------------------------------------------

--
-- Structure de la table `acl_object_identity_ancestors`
--

CREATE TABLE IF NOT EXISTS `acl_object_identity_ancestors` (
  `object_identity_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  KEY `IDX_825DE299C671CEA1` (`ancestor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `acl_object_identity_ancestors`
--

INSERT INTO `acl_object_identity_ancestors` (`object_identity_id`, `ancestor_id`) VALUES
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11);

-- --------------------------------------------------------

--
-- Structure de la table `acl_security_identities`
--

CREATE TABLE IF NOT EXISTS `acl_security_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `acl_security_identities`
--

INSERT INTO `acl_security_identities` (`id`, `identifier`, `username`) VALUES
(3, 'Application\\Sonata\\UserBundle\\Entity\\User-manuroot', 1);

-- --------------------------------------------------------

--
-- Structure de la table `certificats_applis`
--

CREATE TABLE IF NOT EXISTS `certificats_applis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomapplis` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Contenu de la table `certificats_applis`
--

INSERT INTO `certificats_applis` (`id`, `nomapplis`, `description`) VALUES
(2, 'Apache', 'Serveur Apache 2.2'),
(3, 'Tomcat1', 'Serveur Tomcat 6'),
(8, 'Oracle Serveur', 'Oracle Serveur'),
(10, 'mysql serveur', 'description application'),
(11, 'test', 'test appli'),
(12, 'uuuu', 'jljlkkl'),
(13, 'momo', 'momo description'),
(15, 'muiouiou', 'ghjghjg'),
(16, 'klmkm', 'klmklmk'),
(19, 'ghjgjh', 'ghjgjhghj'),
(20, 'jlkj', 'jkljklj'),
(21, 'hjkhk', 'hjkhjhk'),
(22, 'cxcxvxc', 'ccc'),
(23, 'jkjl', 'jkljkl');

-- --------------------------------------------------------

--
-- Structure de la table `certificats_center`
--

CREATE TABLE IF NOT EXISTS `certificats_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(50) NOT NULL,
  `project` int(11) DEFAULT NULL,
  `type_cert` int(11) DEFAULT NULL,
  `cn_name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_time` date NOT NULL,
  `added_date` date NOT NULL,
  `server_name` varchar(90) NOT NULL,
  `port` int(5) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `way` varchar(20) NOT NULL,
  `status_file` tinyint(1) DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `updated_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_cert` (`type_cert`),
  KEY `project` (`project`),
  KEY `IDX_5CB1233FEE45BDBF` (`picture_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1162 ;

--
-- Contenu de la table `certificats_center`
--

INSERT INTO `certificats_center` (`id`, `file_name`, `project`, `type_cert`, `cn_name`, `start_date`, `end_time`, `added_date`, `server_name`, `port`, `service_name`, `way`, `status_file`, `picture_id`, `updated_date`) VALUES
(132, 'pmaj1-test.rsv.fr.crt', 19, 7, 'pmaj1-test.rsv.fr', '2010-05-10', '2014-06-10', '2011-07-26', 'pmaj1-test.rsv.fr', 443, 'pmaj1-test.rsv.fr', 'IN', 1, NULL, '0000-00-00'),
(134, 'superv.test.portail.sesam-vitale.fr.crt', 2, 3, 'superv.test.portail.sesam-vitale.fr', '2010-11-26', '2008-11-23', '2011-07-26', 'superv.test.portail.sesam-vitale.fr', 447, 'CDRv1-cli2port448', 'IN', 1, NULL, '0000-00-00'),
(135, 'test.imars.rsv.fr.pem', 2, 3, 'test.imars.rsv.fr', '2008-10-28', '2011-10-28', '2011-07-26', 'test.imars.rsv.fr', 442, 'HR4-rsv2imars', 'IN', 1, NULL, '0000-00-00'),
(141, 'test.imars.sesam-vitale.fr_AC2020.pem', 2, 3, 'test.imars.sesam-vitale.fr', '2008-10-28', '2011-10-28', '1901-12-13', 'test.imars.sesam-vitale.fr', 1442, 'HR5-client2imars445', 'IN', 1, NULL, '0000-00-00'),
(144, 'ca_disig.pem', 2, 1, 'CA Disig', '2006-03-22', '2016-03-22', '0000-00-00', 'tfr.netcards-project.com', 443, 'Netcards-partenaire', 'IN', 1, NULL, '0000-00-00'),
(145, 'GIP-CPS_Exploit_Racine_Classe4_Bundle_cs.pem', 2, 1, '----', '2004-01-02', '2020-12-30', '0000-00-00', 'test.imars2rsv.rsv.fr', 80, 'imars2rsv', 'IN', 1, NULL, '0000-00-00'),
(146, 'GIP-CPS_root_classe-4_bundle.crt', 2, 1, '----', '2001-11-13', '2008-12-31', '0000-00-00', 'test.imars.rsv.fr', 443, '---', 'IN', 1, NULL, '0000-00-00'),
(147, 'ac-integ-classe3.crt', 2, 1, 'TEST CLASSE-3', '2011-05-13', '2012-05-12', '0000-00-00', 'test.imars.sesam-vitale.fr', 443, '---', 'IN', 1, NULL, '0000-00-00'),
(148, 'ac-integ-classe3.pem', 2, 1, 'TEST CLASSE-3', '2011-05-13', '2012-05-12', '0000-00-00', 'test.imars.sesam-vitale.fr', 443, '---', 'IN', 1, NULL, '0000-00-00'),
(150, 'ca_disig.pem', 2, 1, 'CA Disig', '2006-03-22', '2016-03-22', '0000-00-00', 'tfr.netcards-project.com', 443, 'Netcards-partenaire', 'IN', 1, NULL, '0000-00-00'),
(151, 'ac-root-classe4.pem', 2, 1, '----', '2004-01-01', '2020-12-31', '0000-00-00', 'unkown', 0, 'none', 'IN', 1, NULL, '0000-00-00'),
(152, 'client-pmaj1-test.rsv_bundle.pem', 2, 1, 'pmaj1-test.rsv.fr', '2011-06-10', '2014-06-10', '0000-00-00', 'client-pmaj1-test.rsv.fr', 80, 'client-pmaj1', 'IN', 1, NULL, '0000-00-00'),
(186, 'test.sup-sel.sesam-vitale.fr.crt', 2, 1, '----', '2004-01-02', '2020-12-30', '0000-00-00', 'test.sup-sel.sesam-vitale.fr', 443, 'CDR-WebISEL', 'IN', 1, NULL, '0000-00-00'),
(187, 'test.portail.sesam-vitale.fr_crt-file.pem', 2, 3, 'test.portail.sesam-vitale.fr', '2008-10-20', '2011-10-20', '0000-00-00', 'test.portail.sesam-vitale.fr', 443, 'CDRv1-client2portail', 'IN', 1, NULL, '0000-00-00'),
(190, 'test.imars.sesam-vitale.fr_AC2020.pem', 2, 3, 'test.imars.sesam-vitale.fr', '2008-10-28', '2011-10-28', '2011-07-26', 'test.imars.sesam-vitale.fr', 1443, 'HR5-client2imars445 ', 'IN', 1, NULL, '0000-00-00'),
(192, 'test.imars.sesam-vitale.fr_AC2020.pem', 2, 3, 'test.imars.sesam-vitale.fr', '2008-10-28', '2011-10-28', '2011-07-26', 'test.imars.sesam-vitale.fr', 443, 'HR5-client2imars110', 'IN', 1, NULL, '0000-00-00'),
(194, 'test.imars.sesam-vitale.fr_AC2020.pem', 2, 3, 'test.imars.sesam-vitale.fr', '2008-10-28', '2011-10-28', '2011-07-26', 'test.imars.sesam-vitale.fr', 2443, 'HR51-client2imars-p', 'IN', 1, NULL, '0000-00-00'),
(197, 'test.imars.sesam-vitale.fr_AC2020.pem', 2, 3, 'test.imars.sesam-vitale.fr', '2008-10-28', '2011-10-28', '0000-00-00', 'test.imars.sesam-vitale.fr', 443, 'HR5-client2imars110', 'IN', 1, NULL, '0000-00-00'),
(198, 'test.suivipecamo.iec.rsv.fr.pem.crt', 2, 3, 'test.suivipecamo.iec.rsv.fr', '2011-04-29', '2021-04-26', '2011-07-26', 'test.suivipecamo.iec.rsv.fr', 443, 'SuiviPecAMO', 'IN', 1, NULL, '0000-00-00'),
(301, 'ac-20110627-14-22.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '0000-00-00', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(405, 'frontal.gie.cac.rsv.fr.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2011-08-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(406, 'frontal2integ.cac.rsv.fr-20110805-12-01.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2011-08-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(407, 'frontal2integ.cac.rsv.fr.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2011-08-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(408, 'frontal2integ.cac.rsv.fr-20110805-12-02.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2011-08-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(409, 'frontal2integ.cac.rsv.fr-20110805-14-01.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2011-08-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(421, 'test.csr', 2, 7, '----', '1970-01-01', '1970-01-01', '2011-08-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(422, 'test-20110805-16-30.csr', 2, 7, '----', '1970-01-01', '1970-01-01', '2011-08-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(426, 'frontal2-integ.cac.rsv.fr.crt', 2, 3, 'frontal2-integ.cac.rsv.fr', '2011-06-30', '2014-06-30', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(430, 'client-cacf.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(431, 'cac.csr', 2, 7, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(432, 'cac.crt', 2, 1, 'cncac', '2011-07-29', '2012-07-28', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(435, 'cac.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(436, 'Template-cac.crt', 2, 5, 'cncac', '2011-07-29', '2012-07-28', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(437, 'client-integ.csr', 2, 8, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(438, 'client-integ12-20110801-10-04.csr.csr', 2, 8, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(591, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(592, 'frontal.gie.cac.rsv.fr.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(593, 'frontal.gie.cac.rsv.fr-20110719-09-58.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(620, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(631, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(635, 'integac-20110811-10-11.csr', 2, 7, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(637, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-08-11', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(638, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-08-29', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(643, 'mruuoip.crt', 2, 3, 'ghghjg', '2011-07-27', '2012-07-26', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(645, 'pmaj1-test.rsv.fr-20110726-11-27.crt', 2, 3, 'pmaj1-test.rsv.fr', '2011-06-10', '2014-06-10', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(646, 'test.imars.rsv.fr.pem', 2, 3, 'test.imars.rsv.fr', '2008-10-28', '2011-10-28', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(647, 'test.suivipecamo.iec.rsv.fr.pem.crt', 2, 3, 'test.suivipecamo.iec.rsv.fr', '2011-04-29', '2021-04-26', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(648, 'tnetcards.sesam-vitale.fr.pem', 2, 3, 'tnetcards.sesam-vitale.fr', '2009-02-05', '2012-02-05', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(649, 'pmaj1-test.rsv.fr.crt', 2, 3, 'pmaj1-test.rsv.fr', '2011-06-10', '2014-06-10', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(650, 'client-integ-20110804-16-00.pem', 2, 3, 'client-integ', '2011-07-29', '2012-07-28', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(651, 'superv.test.portail.sesam-vitale.fr.crt', 2, 3, 'superv.test.portail.sesam-vitale.fr', '2010-11-26', '2020-11-23', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(652, 'test.imars.sesam-vitale.fr_AC2020.pem', 2, 3, 'test.imars.sesam-vitale.fr', '2008-10-28', '2011-10-28', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(656, 'test.sup-sel.sesam-vitale.fr.crt', 2, 3, 'test.sup-sel.sesam-vitale.fr', '2008-10-20', '2011-10-20', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(657, 'pmaj1-test.rsv.fr-20110726-11-26.crt', 2, 3, 'pmaj1-test.rsv.fr', '2011-06-10', '2014-06-10', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(662, 'tfr.netcards-project.com.crt', 2, 3, 'tfr.netcards-project.com', '2009-02-02', '2010-02-02', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(663, 'client-integ-20110804-16-02.der', 2, 3, 'client-integ', '2011-07-29', '2012-07-28', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(664, 'client-integ12-20110801-10-04.crt.crt', 2, 3, '----', '2011-08-01', '2012-07-31', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(667, 'tnetcards.sesam-vitale.fr-20110725-16-28.pem', 2, 3, 'tnetcards.sesam-vitale.fr', '2009-02-05', '2012-02-05', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(669, 'pmaj1-test.rsv.fr-20110726-11-24.crt', 2, 3, 'pmaj1-test.rsv.fr', '2011-06-10', '2014-06-10', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(707, 'ca_disig.pem', 2, 1, 'CA Disig', '2006-03-22', '2016-03-22', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(715, 'ac-root-classe4.pem', 2, 1, '----', '2004-01-01', '2020-12-31', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(718, 'client-pmaj1-test.rsv_bundle.pem', 2, 1, 'pmaj1-test.rsv.fr', '2011-06-10', '2014-06-10', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(723, 'test.sup-sel.sesam-vitale.fr.crt', 2, 1, '----', '2004-01-02', '2020-12-30', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(731, 'aca_disig.pem', 2, 1, 'CA Disig', '2007-10-09', '2011-10-09', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(732, 'GIP-CPS_root_classe-4_bundle.crt', 2, 1, '----', '2001-11-13', '2008-12-31', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(733, 'AC-CLASSE-4-GIP-CPS.crt', 2, 1, '----', '2004-01-02', '2020-12-30', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(735, 'catest-20110803-15-09.crt', 2, 1, '----', '2011-08-03', '2012-08-02', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(776, 'frontal2integ.cac.rsv.fr.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(780, 'frontal2integ.cac.rsv.fr-20110805-14-01.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(781, 'frontal2integ.cac.rsv.fr-20110805-14-35.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(785, 'frontal.gie.cac.rsv.fr.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(792, 'frontal2integ.cac.rsv.fr-20110805-12-02.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(808, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-09-15', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(809, 'OSI-frontal1-integ.cac.rsv.fr.cer', 2, 3, 'frontal1-integ.cac.rsv.fr', '2011-09-08', '2014-09-08', '2011-10-10', 'frontal.gie.cac.rsv.fr', 446, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(811, 'OSI-frontal1-integ.cac.rsv.fr_bundle.cer', 2, 3, 'frontal1-integ.cac.rsv.fr', '2011-09-08', '2014-09-08', '2011-10-10', 'frontal.gie.cac.rsv.fr', 80, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(812, 'ac-root-classe4.pem', 2, 1, '----', '2004-01-01', '2020-12-31', '2011-10-10', 'frontal.gie.cac.rsv.fr', 80, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(813, 'frontal.gie.cac.rsv.pem', 2, 3, 'frontal.gie.cac.rsv.fr', '2011-06-10', '2014-06-10', '2011-10-10', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(814, 'client-frontal.gie.cac.rsv_bundle.pem', 2, 3, 'frontal.gie.cac.rsv.fr', '2011-06-10', '2014-06-10', '2011-10-10', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(815, 'ASIP-CLASS4-bundle.pem', 2, 1, '----', '2004-01-01', '2020-12-31', '2011-10-10', 'client-pmaj1-test.rsv.fr', 80, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(816, 'client-pmaj1-test.rsv_bundle(2).pem', 2, 3, 'pmaj1-test.rsv.fr', '2011-06-10', '2014-06-10', '2011-10-10', 'client-pmaj1-test.rsv.fr', 80, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(817, 'client-pmaj1-test.rsv_bundle.pem', 2, 3, 'pmaj1-test.rsv.fr', '2011-06-10', '2014-06-10', '2011-10-10', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(818, 'client-pmaj1-test.rsv_bundle.pem', 2, 3, 'pmaj1-test.rsv.fr', '2011-06-10', '2014-06-10', '2011-10-10', 'client-pmaj1-test.rsv.fr', 80, 'client-pmaj1', 'IN', 1, NULL, '0000-00-00'),
(819, 'ASIP-CLASS4-bundle.pem', 2, 1, '----', '2004-01-01', '2020-12-31', '2011-10-10', 'client-pmaj1-test.rsv.fr', 80, 'client-pmaj1', 'IN', 1, NULL, '0000-00-00'),
(820, 'client-pmaj1-test.rsv_bundle.pem', 2, 3, 'pmaj1-test.rsv.fr', '2011-06-10', '2014-06-10', '2011-10-10', 'client-pmaj1-test.rsv.fr', 80, 'client-pmaj1', 'IN', 1, NULL, '0000-00-00'),
(822, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-10-10', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(823, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-10-10', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(825, 'integ-20111010-16-25.crt', 2, 1, 'dfkgjkdf', '2011-10-10', '2012-10-09', '2011-10-10', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(827, 'integ-20111010-16-25.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2011-10-10', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(853, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-10-18', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(854, 'test.imars.rsv.fr.crt', 2, 3, 'test.imars.rsv.fr', '2011-08-01', '2014-08-01', '2011-10-21', 'test.imars.rsv.fr', 443, 'HR4-rsv2imars', 'IN', 1, NULL, '0000-00-00'),
(855, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-10-21', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(858, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-10-25', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(860, 'ACSesamVitaleSystemCert.pem', 2, 3, 'Sesam Vitale System CA', '2010-03-17', '2013-03-21', '2011-11-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(861, 'dqi244l003.gie-sv.fr.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2011-11-03', '', 0, 'RP1hjuk', 'IN', 1, NULL, '0000-00-00'),
(863, 'dqi244l003.gie-sv.fr.crt', 2, 3, 'dqi244l003.gie-sv.fr', '2010-10-19', '2012-10-18', '2011-11-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(865, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2011-11-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(866, 'test.imars.aa.crt', 2, 3, 'test.imars.sesam-vitale.fr', '2011-08-01', '2014-08-01', '2011-12-07', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(868, 'test-preprod.imars.rsv.fr.crt', 2, 3, 'test-preprod.imars.rsv.fr', '2011-06-22', '2014-06-22', '2012-01-24', 'test-preprod.imars.rsv.fr', 443, 'Serv_IMARS', 'IN', 1, NULL, '0000-00-00'),
(870, 'pmaj-preprod.cac.rsv.fr.crt', 2, 3, 'pmaj-preprod.cac.rsv.fr', '2011-05-27', '2014-05-27', '2011-12-13', 'pmaj-preprod.cac.rsv.fr', 443, 'rsv2portail', 'IN', 1, NULL, '0000-00-00'),
(874, 'portail-preprod.sesam-vitale.fr.crt', 2, 3, 'portail-preprod.sesam-vitale.fr', '2011-08-01', '2014-08-01', '2011-12-13', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail ', 'IN', 1, NULL, '0000-00-00'),
(878, 'superv-preprod.portail.sesam-vitale.fr.crt', 2, 3, 'superv-preprod.portail.sesam-vitale.fr', '2012-05-23', '2014-05-23', '2012-06-13', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail ', 'IN', 1, NULL, '0000-00-00'),
(879, 'GIP-CPS-ac-classe4-renew.pem', 2, 1, '----', '2004-01-02', '2020-12-30', '2011-12-13', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(880, 'GIP-CPS-ac-root-renew.pem', 2, 1, '----', '2004-01-01', '2020-12-31', '2011-12-13', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(905, 'truc-20111213-16-57.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2011-12-13', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(908, 'CPS2TER_FR_GIP-CPS_GIP-CPS-CLASSE1.pem', 2, 1, 'GIP-CPS CLASSE-1', '2004-10-11', '2015-01-01', '2011-12-14', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail ', 'IN', 1, NULL, '0000-00-00'),
(909, 'CPS2TER_FR_GIP-CPS_GIP-CPS-CLASSE2.pem', 2, 1, 'GIP-CPS CLASSE-2', '2004-10-11', '2015-01-01', '2011-12-14', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail ', 'IN', 1, NULL, '0000-00-00'),
(910, 'CPS2TER_FR_GIP-CPS_GIP-CPS-CLASSE3.pem', 2, 1, 'GIP-CPS CLASSE-3', '2004-10-11', '2015-01-01', '2011-12-14', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail ', 'IN', 1, NULL, '0000-00-00'),
(911, 'CPS2TER_FR_GIP-CPS_GIP-CPS-STRUCTURE.pem', 2, 1, '----', '2004-10-11', '2015-01-01', '2011-12-14', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail ', 'IN', 1, NULL, '0000-00-00'),
(912, 'GIP-CPS_TEST_PROFESSIONNEL.pem', 2, 1, '----', '2004-10-11', '2015-01-01', '2011-12-14', '', 0, '', 'IN', 1, NULL, '0000-00-00'),
(913, 'GIP-CPS_TEST_STRUCTURE_CLASSE-1.pem', 2, 1, 'TEST CLASSE-1', '2004-10-11', '2015-01-01', '2011-12-14', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail ', 'IN', 1, NULL, '0000-00-00'),
(914, 'GIP-CPS_TEST_STRUCTURE_CLASSE-3.pem', 2, 1, 'TEST CLASSE-3', '2004-10-11', '2015-01-01', '2011-12-14', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail ', 'IN', 1, NULL, '0000-00-00'),
(915, 'GIP-CPS_TEST_STRUCTURE_ROOT.pem', 2, 1, '----', '2004-10-11', '2015-01-01', '2011-12-14', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail ', 'IN', 1, NULL, '0000-00-00'),
(917, 'prod.imars01.rsv.fr.crt', 2, 3, 'prod.imars01.rsv.fr', '2011-08-01', '2014-08-01', '2011-12-19', 'prod.imars01.rsv.fr', 443, 'serv_imars', 'IN', 1, NULL, '0000-00-00'),
(919, 'renew_prod.imars01.rsv.fr.crt', 2, 3, 'prod.imars01.rsv.fr', '2008-09-17', '2011-09-17', '2011-12-19', 'prod.imars01.rsv.fr', 443, 'serv_imars ', 'IN', 1, NULL, '0000-00-00'),
(922, 'GIP-CPS-ac-classe4-renew.pem', 2, 1, '----', '2004-01-02', '2020-12-30', '2011-12-21', 'client-pmaj.cac.rsv.fr', 80, 'portail2rsv', 'IN', 1, NULL, '0000-00-00'),
(924, 'pmaj.cac.rsv.fr.crt', 2, 3, 'pmaj.cac.rsv.fr', '2011-05-27', '2014-05-27', '2011-12-21', 'pmaj.cac.rsv.fr', 443, 'rsv2portail', 'IN', 1, NULL, '0000-00-00'),
(925, 'sup-sel.sesam-vitale.fr.crt', 2, 3, 'sup-sel.sesam-vitale.fr', '2011-12-14', '2014-12-14', '2012-01-03', 'sup-sel.sesam-vitale.fr', 443, 'CDR-WebISEL', 'IN', 1, NULL, '0000-00-00'),
(928, 'portail.sesam-vitale.fr.crt', 2, 3, 'portail.sesam-vitale.fr', '2011-08-01', '2014-08-01', '2011-12-21', 'portail.sesam-vitale.fr', 443, 'CDRv1_client2portail', 'IN', 1, NULL, '0000-00-00'),
(933, 'CPS2TER_FR_GIP-CPS_GIP-CPS-CLASSE1.pem', 2, 1, 'GIP-CPS CLASSE-1', '2004-10-11', '2015-01-01', '2011-12-21', 'portail.sesam-vitale.fr', 443, 'CDRv1_client2portail', 'IN', 1, NULL, '0000-00-00'),
(934, 'CPS2TER_FR_GIP-CPS_GIP-CPS-CLASSE2.pem', 19, 1, 'GIP-CPS CLASSE-2', '2004-10-11', '2015-01-01', '2011-12-21', 'portail.sesam-vitale.fr', 443, 'CDRv1_client2portail', 'IN', 1, NULL, '0000-00-00'),
(935, 'CPS2TER_FR_GIP-CPS_GIP-CPS-CLASSE3.pem', 2, 1, 'GIP-CPS CLASSE-3', '2004-10-11', '2015-01-01', '2011-12-21', 'portail.sesam-vitale.fr', 443, 'CDRv1_client2portail ', 'IN', 1, NULL, '0000-00-00'),
(936, 'CPS2TER_FR_GIP-CPS_GIP-CPS-PROFESSIONNEL.pem', 2, 1, '----', '2004-10-11', '2015-01-01', '2011-12-21', 'portail.sesam-vitale.fr', 443, 'CDRv1_client2portail ', 'IN', 1, NULL, '0000-00-00'),
(937, 'CPS2TER_FR_GIP-CPS_GIP-CPS-STRUCTURE.pem', 2, 1, '----', '2004-10-11', '2015-01-01', '2011-12-21', 'portail.sesam-vitale.fr', 443, 'CDRv1_client2portail ', 'IN', 1, NULL, '0000-00-00'),
(939, 'GIP-CPS_TEST_STRUCTURE_CLASSE-2.pem', 2, 1, 'TEST CLASSE-2', '2004-10-11', '2015-01-01', '2011-12-21', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail', 'IN', 1, NULL, '0000-00-00'),
(941, 'sup-sel-preprod.sesam-vitale.fr.crt', 2, 3, 'sup-sel-preprod.sesam-vitale.fr', '2011-12-14', '2014-12-14', '2012-01-02', 'sup-sel-preprod.sesam-vitale.fr', 443, 'CDR-WebISEL', 'IN', 1, NULL, '0000-00-00'),
(945, 'client-integ-20111213-16-55.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2012-01-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(947, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2012-01-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(950, 'hjhj.crt', 2, 1, 'TRUC3llhj', '2012-01-03', '2013-01-02', '2012-01-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(952, 'hjhj.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2012-01-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(953, 'hjhj.csr', 2, 7, '----', '1970-01-01', '1970-01-01', '2012-01-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(954, 'srv-support.crt', 2, 1, 'srv-support-frontal', '2012-01-03', '2013-01-02', '2012-01-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(956, 'srv-support.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2012-01-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(957, 'srv-support.csr', 2, 7, '----', '1970-01-01', '1970-01-01', '2012-01-03', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(959, '01999@999.01.rss.fr.crt', 2, 3, '01999@999.01.rss.fr', '2011-07-08', '2017-07-08', '2012-01-05', 'lome', 0, '', 'IN', 1, NULL, '0000-00-00'),
(964, 'client-support.crt', 2, 3, 'client-support', '2012-01-05', '2013-01-04', '2012-01-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(967, 'client-support.csr', 2, 8, '----', '1970-01-01', '1970-01-01', '2012-01-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(968, 'client-support-20120105-09-46.crt', 2, 3, 'client-support', '2012-01-05', '2013-01-04', '2012-01-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(970, 'client-support-20120105-09-46.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2012-01-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(971, 'client-support-20120105-09-46.csr', 2, 8, '----', '1970-01-01', '1970-01-01', '2012-01-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(972, 'diagnostic-support.crt', 2, 3, 'diagnostic-support', '2012-01-05', '2013-01-04', '2012-01-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(974, 'diagnostic-support.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2012-01-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(975, 'diagnostic-support.csr', 2, 8, '----', '1970-01-01', '1970-01-01', '2012-01-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(985, 'client-support.p12', 2, 6, '----', '1970-01-01', '1970-01-01', '2012-01-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(989, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2012-01-05', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1006, 'diagnostic-support.p12', 2, 6, 'diagnostic-support', '2012-01-05', '2013-01-04', '2012-01-17', 'uio', 0, 'RP1huio', 'IN', 1, NULL, '0000-00-00'),
(1010, '_CA_CERT.crt', 2, 1, '----', '1970-01-01', '1970-01-01', '2012-01-26', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1013, 'imars.rsv.fr_bundle.pem', 2, 9, 'imars.rsv.fr', '2009-03-20', '2012-03-20', '2012-01-26', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1014, 'Template-cac.crt', 2, 10, 'cncac', '2011-07-29', '2012-07-28', '2012-01-26', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1015, 'integ.csr', 2, 7, '----', '1970-01-01', '1970-01-01', '2012-01-26', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1016, 'integ.crt', 2, 1, 'hjhj', '2012-01-05', '2013-01-04', '2012-01-26', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1019, 'integ.p12', 2, 5, '----', '1970-01-01', '1970-01-01', '2012-01-26', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1020, '01999@999.01.rss.fr.crt', 2, 3, '01999@999.01.rss.fr', '2011-07-08', '2017-07-08', '2012-01-26', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1032, 'ac-classe4-test-bundle.crt', 2, 10, '----', '2004-01-02', '2020-12-30', '2012-01-26', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1047, 'test.portail.sesam-vitale.fr_AC2020_private-key_no', 2, 4, '----', '1970-01-01', '1970-01-01', '2012-01-26', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1058, 'imars-preprod.rsv.fr.crt', 2, 9, 'imars-preprod.rsv.fr', '2012-02-01', '2015-02-01', '2012-02-23', 'imars-preprod.rsv.fr', 80, 'imars2rsv', 'IN', 1, NULL, '0000-00-00'),
(1059, 'imars-preprod.rsv.fr.crt', 2, 3, 'imars-preprod.rsv.fr', '2012-02-01', '2015-02-01', '2012-02-23', 'imars-preprod.rsv.fr', 80, 'imars2rsv', 'IN', 1, NULL, '0000-00-00'),
(1060, 'imars-preprod.sesam-vitale.fr.p12', 2, 6, 'imars-preprod.sesam-vitale.fr', '2012-02-01', '2015-02-01', '2012-02-23', 'imars-preprod.sesam-vitale.fr', 443, 'client2imars', 'IN', 1, NULL, '0000-00-00'),
(1062, 'imars-preprod.sesam-vitale.fr.crt', 2, 3, 'imars-preprod.sesam-vitale.fr', '2012-02-01', '2015-02-01', '2012-02-23', 'imars-preprod.sesam-vitale.fr', 443, 'client2imars', 'IN', 1, NULL, '0000-00-00'),
(1063, 'imars-preprod.rsv.fr.p12', 2, 6, 'imars-preprod.rsv.fr', '2012-02-01', '2015-02-01', '2012-02-23', 'imars-preprod.rsv.fr', 80, 'imars2rsv ', 'IN', 1, NULL, '0000-00-00'),
(1064, 'imars.sesam-vitale.fr.p12', 2, 6, 'imars.sesam-vitale.fr', '2012-02-01', '2015-02-01', '2012-02-23', 'imars.sesam-vitale.fr', 443, 'client2imars', 'IN', 1, NULL, '0000-00-00'),
(1065, 'imars.rsv.fr.p12', 2, 6, 'imars.rsv.fr', '2012-02-01', '2015-02-01', '2012-02-23', 'imars.rsv.fr', 443, 'imars2rsv', 'IN', 1, NULL, '0000-00-00'),
(1066, 'imars.rsv.fr.crt', 2, 9, 'imars.rsv.fr', '2012-02-01', '2015-02-01', '2012-02-23', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1068, 'imars.rsv.fr.crt', 2, 3, 'imars.rsv.fr', '2012-02-01', '2015-02-01', '2012-02-23', 'imars.rsv.fr', 80, 'imars2rsv', 'IN', 1, NULL, '0000-00-00'),
(1069, 'imars.sesam-vitale.fr.crt', 2, 3, 'imars.sesam-vitale.fr', '2012-02-01', '2015-02-01', '2012-02-23', 'imars.sesam-vitale.fr', 443, 'client2imars', 'IN', 1, NULL, '0000-00-00'),
(1087, 'superv.portail.sesam-vitale.fr.crt', 2, 1, 'superv.portail.sesam-vitale.fr', '2012-05-23', '2014-05-23', '2012-06-11', 'portail.sesam-vitale.fr', 443, 'portail.sesam-vitale.fr', 'IN', 1, NULL, '0000-00-00'),
(1094, 'AC-CLASSE4-Asip-Sante.crt', 2, 1, '----', '2004-01-02', '2020-12-30', '2012-06-18', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1095, 'simulateur.preprod.rsv.fr.p12', 2, 6, 'simulateur.preprod.rsv.fr', '2011-06-22', '2014-06-22', '2012-06-18', 'JMETER', 0, 'NONE', 'IN', 1, NULL, '0000-00-00'),
(1096, 'simulateur.preprod.rsv.fr.crt', 2, 9, 'simulateur.preprod.rsv.fr', '2011-06-22', '2014-06-22', '2012-06-18', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1103, 'CPS2TER_FR_GIP-CPS_GIP-CPS-STRUCTURE.crt', 2, 1, '----', '2004-10-11', '2015-01-01', '2012-06-18', 'portail.sesam-vitale.fr', 443, 'CDRv1_client2portail', 'IN', 1, NULL, '0000-00-00'),
(1105, 'simulateur.preprod.rsv.fr.crt', 2, 3, 'simulateur.preprod.rsv.fr', '2011-06-22', '2014-06-22', '2012-06-18', '', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1117, 'superv.portail.sesam-vitale.fr.p12', 2, 6, 'superv.portail.sesam-vitale.fr', '2012-05-23', '2014-05-23', '2012-06-18', 'portail.sesam-vitale.fr', 443, 'CDRv1_client2portail', 'IN', 1, NULL, '0000-00-00'),
(1121, 'superv-preprod.portail.sesam-vitale.fr.p12', 2, 6, 'superv-preprod.portail.sesam-vitale.fr', '2012-05-23', '2014-05-23', '2012-06-18', 'portail-preprod.sesam-vitale.fr', 443, 'CDRv1-client2portail ', 'IN', 1, NULL, '0000-00-00'),
(1133, 'OSI-ServTMAJ.crt', 3, 1, '----', '2009-01-22', '2024-01-19', '2012-07-09', 'pmaj.cac.rsv.fr', 443, 'rsv2portail', 'IN', 1, NULL, '0000-00-00'),
(1134, 'ASIP-GIP-CPS.crt', 3, 1, '----', '2004-01-01', '2020-12-31', '2012-07-09', 'pmaj.cac.rsv.fr', 443, 'rsv2portail', 'IN', 1, NULL, '0000-00-00'),
(1135, 'moncerttoto.crt', 2, 1, 'ac-integ', '2012-07-09', '2013-07-09', '2012-07-09', 'momo', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1145, 'OSI-ServTMAJ_CRL.crl', 3, 11, '----', '2012-08-02', '2013-08-02', '2012-08-03', 'cac prod accueil', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1146, 'OSI-SESAM-VITALE_CRL.crl', 2, 11, '----', '2012-08-02', '2013-08-02', '2012-08-03', 'cac prod accueil', 0, 'RP1', 'IN', 1, NULL, '0000-00-00'),
(1157, 'fghfgh', 2, 1, 'ffgh', '2013-02-03', '2013-02-04', '2013-02-13', 'fgh', 222, 'fgh', 'jkl', 1, NULL, '0000-00-00'),
(1158, 'testamoi', 2, 3, 'jkljljkl', '2013-03-07', '2013-03-18', '2013-03-02', 'hjkhkjhkhj', 2233, '123131', 'in', 1, NULL, '0000-00-00'),
(1159, 'gfhgfghf', 3, 1, 'fghghfhg', '2013-04-14', '2013-04-01', '2013-04-18', 'gfhfghhfg', 0, 'fhghfgfgh', 'fgfghfh', 1, NULL, '0000-00-00'),
(1160, 'sdfsdf', 3, 2, 'sdfsdf', '2013-04-08', '2013-04-04', '2013-04-18', 'sdfdsf', 0, 'sdfsf', 'sss', 1, NULL, '0000-00-00'),
(1161, 'hgjjgh', 3, 3, 'ghhghg', '2013-04-15', '2013-04-01', '2013-04-18', 'ghgjh', 0, 'ghg', 'gg', 1, NULL, '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `certificats_filetype`
--

CREATE TABLE IF NOT EXISTS `certificats_filetype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_type` varchar(20) NOT NULL,
  `infos` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `folder` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `certificats_filetype`
--

INSERT INTO `certificats_filetype` (`id`, `file_type`, `infos`, `details`, `folder`) VALUES
(1, 'AC_CERT', 'Certificats d''AC', 'fichiers certificats pour AC', 'ac_crt'),
(2, 'AC_KEY', 'Clés d''AC', 'fichiers de clés pour AC', 'ac_key'),
(3, 'CERT', 'Certificats Client/Serveur', 'fichiers certificats pour certificats', 'crt'),
(4, 'KEY', 'Clés Client/Serveur', 'fichiers clés pour certificats', 'key'),
(5, 'AC_P12', 'P12 d''AC', 'fichiers p12 pour AC', 'ac_p12'),
(6, 'P12', 'P12 Client/Serveur', 'fichiers p12 pour certificats', 'p12'),
(7, 'AC_CSR', 'CSR d''AC', '', 'ac_csr'),
(8, 'CSR', 'CSR Client/Serveur', '', 'csr'),
(9, 'BUNDLE', 'bundle de certificats', '', 'bundle'),
(10, 'AC_BUNDLE', 'bundle des ac', '', 'ac_bundle'),
(11, 'CRL', 'crl file', 'fichier des crl', 'ac_crl');

-- --------------------------------------------------------

--
-- Structure de la table `certificats_projet`
--

CREATE TABLE IF NOT EXISTS `certificats_projet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomprojet` varchar(40) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Contenu de la table `certificats_projet`
--

INSERT INTO `certificats_projet` (`id`, `nomprojet`, `description`) VALUES
(1, 'UNSET', 'description projet'),
(2, 'IMARS', 'Projet imars 1.12.4'),
(3, 'CAC', 'description projet'),
(4, 'SDCS', 'description projet'),
(5, 'CEAM', 'description projet'),
(6, 'INFOCENTRE', 'description projet'),
(7, 'LOE', 'description projet'),
(8, 'LOI', 'description projet'),
(10, 'BIDYS', 'description projet'),
(11, 'GTC', 'description projet'),
(12, 'FPSV', 'description projet'),
(13, 'S2F', 'description projet'),
(14, 'PCA_PRA', 'description projet'),
(15, 'RESEAU', 'description projet'),
(16, 'RSA', 'description projet'),
(17, 'IEC', 'description projet'),
(18, 'toto', 'description projet'),
(19, 'CDR', 'CDR 1.20'),
(20, 'testaa', 'fhgfhg'),
(21, 'fd', 'fff'),
(22, 'ghgjjg', 'gjhgjhg'),
(23, 'jkll', 'jkl'),
(24, 'hjkhkhj', 'hjkkhj'),
(25, 'PROJET5', 'PROJET5');

-- --------------------------------------------------------

--
-- Structure de la table `certificats_xapplis`
--

CREATE TABLE IF NOT EXISTS `certificats_xapplis` (
  `certificatscenter_id` int(11) NOT NULL,
  `applis_id` int(11) NOT NULL,
  PRIMARY KEY (`certificatscenter_id`,`applis_id`),
  KEY `IDX_E95FD4924B7B2B4E` (`certificatscenter_id`),
  KEY `IDX_A5299796E6B709BF` (`applis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `certificats_xapplis`
--

INSERT INTO `certificats_xapplis` (`certificatscenter_id`, `applis_id`) VALUES
(132, 2),
(134, 2),
(134, 10),
(934, 2),
(934, 3),
(1133, 2),
(1135, 13),
(1135, 15),
(1145, 13),
(1146, 2),
(1146, 3),
(1157, 12),
(1158, 2),
(1159, 11),
(1159, 12),
(1159, 13),
(1159, 15),
(1160, 12),
(1161, 12),
(1161, 13);

-- --------------------------------------------------------

--
-- Structure de la table `changements`
--

CREATE TABLE IF NOT EXISTS `changements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `date_comep` datetime DEFAULT NULL,
  `date_vsr` date DEFAULT NULL,
  `description` text NOT NULL,
  `id_projet` int(11) NOT NULL,
  `demandeur` int(11) DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `ticket_ext` int(11) DEFAULT NULL,
  `ticket_int` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_559C002E76222944` (`id_projet`),
  KEY `IDX_559C002E665DA613` (`demandeur`),
  KEY `IDX_559C002E5D37D0F1` (`id_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `changements`
--

INSERT INTO `changements` (`id`, `nom`, `date_debut`, `date_fin`, `date_comep`, `date_vsr`, `description`, `id_projet`, `demandeur`, `id_status`, `ticket_ext`, `ticket_int`) VALUES
(2, 'momo ui', '2013-03-11 00:00:00', '2013-03-12 00:00:00', '2013-03-11 00:00:00', '2013-03-11', '<p>hjkh jhjkhjh</p>', 19, 9, 1, NULL, NULL),
(3, 'update CAC', '2013-03-03 00:00:00', '2013-03-06 08:00:00', '2013-05-15 00:00:00', '2013-03-13', '<p>hjjhkj hkhjhk</p>', 19, 3, 3, NULL, NULL),
(4, 'mon changement', '2013-03-11 08:00:00', '2013-03-15 17:00:00', '2013-03-18 00:00:00', '2013-03-27', '<p>test a moi</p>', 3, 4, 1, NULL, NULL),
(7, 'hjkhhj', '2013-03-10 00:00:00', '2013-03-12 00:00:00', '2013-03-12 00:00:00', '2013-03-11', '<p>ljkl</p>', 3, 22, 1, NULL, NULL),
(8, 'yuiyuiyuiy', '2013-04-02 08:00:00', '2013-04-09 08:00:00', '2013-03-11 00:00:00', '2013-03-20', '<p>yuiyuiyui</p>', 19, 20, 1, NULL, NULL),
(9, 'fghfghf', '2013-05-17 00:00:00', '2013-06-21 00:00:00', NULL, NULL, '<p>fhgff</p>', 5, 22, 1, NULL, NULL),
(10, 'jkljlkj', '2013-03-11 00:00:00', '2013-03-04 00:00:00', '2013-03-18 00:00:00', '2013-03-11', 'jlkjljlkjlkkj', 19, 17, 2, NULL, NULL),
(11, 'dgdfgfgdf', '2013-03-13 00:00:00', '2013-03-14 00:00:00', NULL, NULL, '<p>dfssdfsd</p>', 5, 20, 2, NULL, NULL),
(12, 'ghjgjgh', '2013-03-04 00:00:00', '2013-03-04 00:00:00', NULL, NULL, 'ggggggg', 19, 22, 3, NULL, NULL),
(13, '4564564', '2013-03-04 00:00:00', '2013-03-04 00:00:00', NULL, NULL, '<p>123132132132</p>', 5, 20, 2, NULL, NULL),
(14, '111111111', '2013-03-06 08:00:00', '2013-03-13 17:00:00', '2013-03-05 00:00:00', '2013-03-04', '<p>1231231</p>', 11, 3, 1, NULL, NULL),
(15, 'jhkhkj', '2013-03-04 00:00:00', '2013-03-04 00:00:00', NULL, NULL, 'hjkhkhj', 24, 21, 1, NULL, NULL),
(16, 'gffgfddfggf', '2013-03-05 00:00:00', '2013-03-05 00:00:00', '2013-03-12 00:00:00', '2013-03-05', '<p>456456456 456456456</p>', 11, 14, 2, NULL, NULL),
(17, 'TEST2', '2013-03-06 08:00:00', '2013-03-12 17:00:00', '2013-03-04 00:00:00', '2013-03-13', '<p>jklj</p>', 24, 15, 2, NULL, NULL),
(18, 'TESTS', '2013-03-12 08:00:00', '2013-03-19 08:00:00', NULL, NULL, '<p>hhhhh</p>', 12, 22, 3, NULL, NULL),
(19, '4564564', '2013-03-06 08:00:00', '2013-03-12 17:00:00', NULL, NULL, '<p>456456</p>', 5, 21, 1, NULL, NULL),
(20, 'sdffdssdfdfs', '2013-04-09 08:00:00', '2013-04-09 00:00:00', '2013-04-09 00:00:00', '2013-04-15', '<p>ddfdf</p>', 19, 14, 3, 13454654, 456456465),
(21, 'hgffg', '2013-05-17 08:00:00', '2013-05-22 17:00:00', '2013-04-10 00:00:00', '2013-04-12', '<p>hjlkjj jklkljk</p>', 7, 16, 2, NULL, NULL),
(22, 'hjkhjk', '2013-04-22 00:00:00', '2013-04-23 00:00:00', '2013-04-16 00:00:00', '2013-04-24', '<p>hjkhjkh</p>', 19, 17, 1, NULL, NULL),
(23, 'hjjhkkj', '2013-05-12 08:00:00', '2013-05-16 17:00:00', '2013-04-08 00:00:00', '2013-04-24', '<p>hjkhkj</p>', 19, 22, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `changements_applis`
--

CREATE TABLE IF NOT EXISTS `changements_applis` (
  `changements_id` int(11) NOT NULL,
  `applis_id` int(11) NOT NULL,
  PRIMARY KEY (`changements_id`,`applis_id`),
  KEY `IDX_52ED6FE0AD2B71E0` (`changements_id`),
  KEY `IDX_52ED6FE0E6B709BF` (`applis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `changements_applis`
--

INSERT INTO `changements_applis` (`changements_id`, `applis_id`) VALUES
(2, 2),
(2, 3),
(2, 8),
(2, 10),
(2, 13),
(2, 16),
(2, 19),
(2, 20),
(2, 21),
(3, 3),
(3, 8),
(3, 10),
(4, 2),
(4, 3),
(7, 15),
(8, 21),
(9, 20),
(10, 2),
(11, 21),
(12, 19),
(12, 21),
(13, 2),
(13, 19),
(13, 21),
(13, 22),
(14, 19),
(14, 22),
(15, 16),
(15, 20),
(15, 23),
(16, 19),
(16, 21),
(16, 22),
(16, 23),
(17, 19),
(17, 21),
(17, 23),
(18, 19),
(18, 21),
(18, 23),
(19, 19),
(19, 21),
(19, 22),
(20, 19),
(20, 21),
(21, 19),
(21, 21),
(21, 23),
(22, 19),
(22, 21),
(23, 20),
(23, 23);

-- --------------------------------------------------------

--
-- Structure de la table `changements_comments`
--

CREATE TABLE IF NOT EXISTS `changements_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `changement_id` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4F460F778D93D649` (`user`),
  KEY `IDX_4F460F7785698464` (`changement_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Contenu de la table `changements_comments`
--

INSERT INTO `changements_comments` (`id`, `user`, `changement_id`, `comment`, `approved`, `created`, `updated`) VALUES
(1, 4, 23, 'hjkhhkjk', 1, '2013-04-23 20:09:50', '2013-04-23 20:09:50'),
(2, 4, 23, 'hjkhhkjk', 1, '2013-04-23 20:11:05', '2013-04-23 20:11:05'),
(3, 4, 23, 'mmmmmmmmmmmmmmmmm', 1, '2013-04-23 20:11:14', '2013-04-23 20:11:14'),
(4, 4, 22, 'test et retest', 1, '2013-04-23 20:35:43', '2013-04-23 20:35:43'),
(5, 4, 21, '<p>dgfgggdgdffgdgffdffg</p>', 1, '2013-05-09 15:48:56', '2013-05-09 15:48:56'),
(6, 4, 21, '<p>fsdf sdfsdfsdfd fsdfdf</p>', 1, '2013-05-09 15:49:09', '2013-05-09 15:49:09'),
(7, 9, 21, '<p>changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave;chang gement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave;</p>', 1, '2013-05-15 22:02:16', '2013-05-15 22:02:16'),
(8, 9, 21, '<p>changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave;chang gement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave;</p>\r\n<p>&nbsp;</p>\r\n<p>changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave;chang gement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave;</p>\r\n<p>&nbsp;</p>\r\n<p>changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave;chang gement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave; changement blablalllml&ugrave;lm&ugrave;</p>', 1, '2013-05-15 22:02:35', '2013-05-15 22:02:35');

-- --------------------------------------------------------

--
-- Structure de la table `changements_documents`
--

CREATE TABLE IF NOT EXISTS `changements_documents` (
  `changements_id` int(11) NOT NULL,
  `docchangements_id` int(11) NOT NULL,
  PRIMARY KEY (`changements_id`,`docchangements_id`),
  KEY `IDX_B77A8758AD2B71E0` (`changements_id`),
  KEY `IDX_B77A8758517A4C7C` (`docchangements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `changements_documents`
--

INSERT INTO `changements_documents` (`changements_id`, `docchangements_id`) VALUES
(3, 35),
(3, 36),
(7, 32),
(16, 39),
(18, 42),
(18, 43),
(20, 40),
(20, 41),
(23, 44),
(23, 45);

-- --------------------------------------------------------

--
-- Structure de la table `changements_environnements`
--

CREATE TABLE IF NOT EXISTS `changements_environnements` (
  `changements_id` int(11) NOT NULL,
  `environnements_id` int(11) NOT NULL,
  PRIMARY KEY (`changements_id`,`environnements_id`),
  KEY `IDX_C4056011AD2B71E0` (`changements_id`),
  KEY `IDX_C4056011461AD5D9` (`environnements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `changements_environnements`
--

INSERT INTO `changements_environnements` (`changements_id`, `environnements_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(3, 3),
(3, 4),
(4, 2),
(4, 5),
(7, 1),
(7, 2),
(8, 1),
(9, 1),
(9, 2),
(10, 3),
(11, 2),
(12, 1),
(12, 2),
(13, 3),
(14, 3),
(15, 2),
(16, 3),
(17, 3),
(17, 4),
(18, 2),
(18, 3),
(19, 3),
(19, 4),
(20, 2),
(21, 2),
(22, 3),
(23, 1),
(23, 2);

-- --------------------------------------------------------

--
-- Structure de la table `changements_fichiers`
--

CREATE TABLE IF NOT EXISTS `changements_fichiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=46 ;

--
-- Contenu de la table `changements_fichiers`
--

INSERT INTO `changements_fichiers` (`id`, `name`, `path`, `updated_at`) VALUES
(32, 'jlkjkljkl', '69d95953d56b974b7c0c273b1c230a69c3fb909a.png', '2013-04-01 00:31:16'),
(33, 'klmkml', '77050a57b451522b052f3da80c7996ab976ad085.png', '2013-03-13 19:51:39'),
(34, 'momomo', 'e82a1a6fc2fe372f9b84f0aceea8dea2f92d20fc.png', '2013-03-17 11:59:59'),
(35, 'important', 'f42e78cee9fd45a9383ea62df743cd490eb4f6f9.png', '2013-04-01 15:26:29'),
(36, 'khjjkh', '21fe1ece927da161009ff71ae6d90aa30fdf2924.png', '2013-04-01 15:26:29'),
(37, 'hjkhjk', 'ae794a150cf2e2299255ee68a72c5ad4fbd02dee.png', '2013-03-17 11:46:59'),
(38, 'jkjkljj', 'b69b9f9fe943db74a5bd95f7fd95d7155d6fc948.png', '2013-03-17 11:54:27'),
(39, 'lklmklm', 'fa485744e00defe450370c39d988ab700367c9a1.png', '2013-05-09 16:03:43'),
(40, 'bvvbvbvb', '2ae2aa50a9084977f3d62d071790ae721f80543c.png', '2013-05-06 17:56:45'),
(41, 'klkmm', '135079ff5ece9666d6af92ccaa4ad1898f180ec7.png', '2013-05-06 17:56:45'),
(42, 'block', 'fab2fffc1fd539a1233528a63b5b40ace2451d9d.png', '2013-05-09 16:06:12'),
(43, 'jklhjkhjkh', '0eba66c8c95af86f8284ead0ebdfe5061fe6f093.png', '2013-05-09 16:06:12'),
(44, 'ioo', '73309432363afd5019e387ba659241febb51ae63.png', '2013-05-15 21:53:12'),
(45, 'opoo', '5b6e532e94a06babbd4fb1c2bcd0445661a22d6d.png', '2013-05-15 21:53:12');

-- --------------------------------------------------------

--
-- Structure de la table `changements_status`
--

CREATE TABLE IF NOT EXISTS `changements_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `changements_status`
--

INSERT INTO `changements_status` (`id`, `nom`, `description`) VALUES
(1, 'en cours', 'open'),
(2, 'fermé', 'closed'),
(3, 'en preparation', 'prepare'),
(4, 'en attente', 'wait');

-- --------------------------------------------------------

--
-- Structure de la table `changements_users`
--

CREATE TABLE IF NOT EXISTS `changements_users` (
  `changements_id` int(11) NOT NULL,
  `chronouser_id` int(11) NOT NULL,
  PRIMARY KEY (`changements_id`,`chronouser_id`),
  KEY `IDX_3EFC9F74AD2B71E0` (`changements_id`),
  KEY `IDX_3EFC9F74B3D9BAE1` (`chronouser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `changements_users`
--

INSERT INTO `changements_users` (`changements_id`, `chronouser_id`) VALUES
(2, 20),
(2, 21),
(3, 4),
(3, 22),
(4, 2),
(4, 6),
(7, 21),
(7, 22),
(8, 20),
(9, 22),
(10, 22),
(11, 20),
(12, 14),
(12, 20),
(12, 22),
(13, 12),
(13, 27),
(14, 3),
(14, 16),
(15, 3),
(15, 21),
(16, 18),
(16, 26),
(17, 20),
(17, 21),
(17, 22),
(18, 12),
(18, 18),
(19, 17),
(20, 20),
(20, 22),
(21, 14),
(21, 22),
(22, 3),
(22, 16),
(23, 14),
(23, 22);

-- --------------------------------------------------------

--
-- Structure de la table `changement_documents`
--

CREATE TABLE IF NOT EXISTS `changement_documents` (
  `changements_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`changements_id`,`document_id`),
  KEY `IDX_C9C94DEBAD2B71E0` (`changements_id`),
  KEY `IDX_C9C94DEBC33F7837` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `changement_status`
--

CREATE TABLE IF NOT EXISTS `changement_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `changement_status`
--

INSERT INTO `changement_status` (`id`, `nom`, `description`) VALUES
(1, 'openhjk', 'open'),
(2, 'closed', 'closed');

-- --------------------------------------------------------

--
-- Structure de la table `chrono_user`
--

CREATE TABLE IF NOT EXISTS `chrono_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_user` varchar(20) NOT NULL,
  `id_group` int(11) NOT NULL,
  `infos` varchar(50) DEFAULT NULL,
  `telephone` varchar(16) DEFAULT NULL,
  `Bureau` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_83A0876D7F431C27` (`nom_user`),
  KEY `IDX_83A0876D834505F5` (`id_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Contenu de la table `chrono_user`
--

INSERT INTO `chrono_user` (`id`, `nom_user`, `id_group`, `infos`, `telephone`, `Bureau`, `email`) VALUES
(2, 'rotterem', 2, 'Manuel Rottereau', '4518', '00', 'manuel.rottereau@sesam-vitale.fr'),
(3, 'cherusd', 2, 'Denis Cherus', '00', '00', 'denis.cherus@sesam-vitale.fr'),
(4, 'allaisf', 2, 'Francis Allais', '00', '00', 'francis.allais@sesam-vitale.fr'),
(6, 'fasciauv', 2, 'Vincent Fasciaux', '4266', '00', 'vincent.fasciaux@sesam-vitale.fr'),
(9, 'gouinp', 2, 'Patrick Gouin', '', '', 'patrick.gouin@sesam-vitale.fr'),
(10, 'salase', 2, 'Eric Salas', '', '', 'eric.salas@sesam-vitale.fr'),
(11, 'girardl', 3, 'Ludovic Girard', '02 43 57 4288', '', 'ludovic.girard@sesam-vitale.fr'),
(12, 'hulote', 3, 'Etienne Hulot', '02 43 57 42 25', NULL, 'etienne.hulot@sesam-vitale.fr'),
(13, 'nouetf', 3, 'Fabrice Nouet', '', '', 'fabrice.nouet@sesam-vitale.fr'),
(14, 'baezam', 3, 'Marie Baeza', '', '', 'marie.baeza@sesam-vitale.fr'),
(15, 'duthey', 3, 'yannick duthe', '', '', 'yannick.duthe@sesam-vitale.fr'),
(16, 'cheneaug', 2, 'Nicolas CHENEAU-GREHALLE ', '', '', 'nicolas.grehalle@sesam-vitale.fr'),
(17, 'forgeouxm', 2, 'Marc Forgeoux', '', '', 'marc.forgeoux@sesam-vitale.fr'),
(18, 'leseultree', 4, 'Eric Leseultre', '4277', '', 'eric.leseultre@sesam-vitale.fr'),
(19, 'guiloteau', 4, 'Denis Guilloteau', '', '', 'denis.guilloteau@sesam-vitale.fr'),
(20, 'berthome', 4, 'Aurelien Berthome', '', '', 'aurelien.berthome@sesam-vitale.fr'),
(21, 'blinyan', 3, 'Yannick Blin', '', '', 'yannick.blin@sesam-vitale.fr'),
(22, 'bernards', 5, 'Syvie Bernard', '4588', '', 'sylvie.bernard@sesam-vitale.fr'),
(24, 'gautung', 3, 'gilles gautun', '4458', '208', 'gilles.gautun@sesam-vitale.fr'),
(25, 'momo', 1, 'nnn', '02', '452', 'momo@toto.fr'),
(26, 'maurice', 5, 'test pour maurice', '03030201', 'home', 'momo@toto.fr'),
(27, 'hkjh', 2, 'hjkhkh', NULL, NULL, 'momo@toto.fr');

-- --------------------------------------------------------

--
-- Structure de la table `chrono_usergroup`
--

CREATE TABLE IF NOT EXISTS `chrono_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_group` varchar(40) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `chrono_usergroup`
--

INSERT INTO `chrono_usergroup` (`id`, `nom_group`, `description`, `email`) VALUES
(1, 'UNSET', NULL, NULL),
(2, 'support', NULL, 'support@home.com'),
(3, 'centre_de_service', NULL, NULL),
(4, 'ip', 'ingienierie de production', NULL),
(5, 'integration', NULL, 'integration@home.com'),
(6, 'montest', NULL, NULL),
(7, 'testaaa', 'hometest', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `demande_usergroup`
--

CREATE TABLE IF NOT EXISTS `demande_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `is_accepted` tinyint(1) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `id_userparrain` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3F4882C26B3CA4B` (`id_user`),
  UNIQUE KEY `UNIQ_3F4882C223DB04FD` (`id_userparrain`),
  KEY `IDX_3F4882C2834505F5` (`id_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Contenu de la table `demande_usergroup`
--

INSERT INTO `demande_usergroup` (`id`, `id_group`, `id_user`, `description`, `is_accepted`, `name`, `created_at`, `id_userparrain`) VALUES
(30, 2, 9, 'hdffcgdfg', 1, 'gffggffggf', '2013-05-14 19:18:38', 4);

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Contenu de la table `documents`
--

INSERT INTO `documents` (`id`, `path`, `name`) VALUES
(2, 'be3b91dc1d663572cfbfe6656d25835599e0a53b.png', 'hjh'),
(3, 'cad1607d56c75bce444bbc24a49485153a66b739.png', 'hjhhg'),
(4, 'ebc32dbe17c7b2daf8c39ab04cab347157eeee7e.png', 'full.png'),
(5, 'febb91da7f84d2afa5cb39aa624a230f7790581c.png', 'test'),
(6, '98375e3fa7506a073c09b474231646cfd0decc07.txt', 'bbbbb'),
(7, '0255cdec40cf0910b64a9653f6b74b5b0656662b.jpeg', 'momo');

-- --------------------------------------------------------

--
-- Structure de la table `documentsa`
--

CREATE TABLE IF NOT EXISTS `documentsa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `documentsbb`
--

CREATE TABLE IF NOT EXISTS `documentsbb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Contenu de la table `documentsbb`
--

INSERT INTO `documentsbb` (`id`, `name`, `path`) VALUES
(22, 'dddjjjn', '1c4b557c4e522014e72a4fa26bf6abf9725479f0.png'),
(23, 'nggg', 'cc3165b9a04aee8cdc3927d3dba4ee3eff4d7315.jpeg'),
(24, 'bbbbb', 'e2127f216c53cc4f1f7adcc1dfd0acd56b324b1b.png'),
(25, 'bbb', 'bdd4dff40b8d3b112af04ecfc338290b53f64ed2.jpeg'),
(26, 'hjkk', '88756b7dcda760b84d973a359d145f7d5deaaba4.png'),
(27, 'hhhhh', '81ddfe4f3c86156125cdaf33ff4f897f69ae8885.png'),
(28, 'fffdf', 'a660877db883b8c3dd3b7ff3230166f05e034312.png'),
(29, 'uiouo', 'a19155d7f95a97c42a8e0e1d1b81d0be273d35a6.png');

-- --------------------------------------------------------

--
-- Structure de la table `environnement`
--

CREATE TABLE IF NOT EXISTS `environnement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table `environnement`
--

INSERT INTO `environnement` (`id`, `nom`, `description`) VALUES
(1, 'Prod', 'production'),
(2, 'Pré-prod', 'preproduction'),
(3, 'Intégration', 'Intégration'),
(4, 'Développement', 'Développement'),
(5, 'Toulouse', 'Preprod de toulouse');

-- --------------------------------------------------------

--
-- Structure de la table `epost`
--

CREATE TABLE IF NOT EXISTS `epost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proprietaire` int(11) DEFAULT NULL,
  `categorie` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resume` longtext COLLATE utf8_unicode_ci NOT NULL,
  `globalnotes_id` int(11) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `comments_closeat` datetime DEFAULT NULL,
  `comments_enabled` tinyint(1) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageMedia` int(11) DEFAULT NULL,
  `comments_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EC3EBCB1E39AD4CA` (`globalnotes_id`),
  KEY `IDX_EC3EBCB169E399D6` (`proprietaire`),
  KEY `IDX_EC3EBCB1497DD634` (`categorie`),
  KEY `IDX_EC3EBCB15D37D0F1` (`id_status`),
  KEY `IDX_EC3EBCB14F2148D` (`imageMedia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Contenu de la table `epost`
--

INSERT INTO `epost` (`id`, `proprietaire`, `categorie`, `id_status`, `name`, `description`, `image_name`, `created_at`, `updated_at`, `resume`, `globalnotes_id`, `is_visible`, `comments_closeat`, `comments_enabled`, `slug`, `imageMedia`, `comments_count`) VALUES
(1, 4, 1, 1, 'Mon premier Post', '<p>fghfghfhgffgghf fghfgh</p>', '517eb04a19ea9.jpeg', '2013-04-29 19:39:21', '2013-05-08 09:27:51', 'ghgfhg', 1, 1, NULL, 1, 'mon-premier-post', 26, NULL),
(2, 4, 2, 1, 'Mon second post', '<p>jljgflk dgg jdkgdf gdfjkgdflgfdklgjdklgfj</p>', '517eb74d7c96b.jpeg', '2013-04-29 20:09:00', '2013-05-15 20:29:06', 'petit résumé', 10, 1, NULL, 1, 'mon-second-post', 25, NULL),
(3, 5, 1, 1, 'test marco', '<p>hjhkjkhkhj</p>', '517ebd2b9380b.png', '2013-04-29 20:34:19', '2013-05-15 20:50:43', 'vbnvnvnbvnvbnvbn', 6, 1, NULL, 0, 'test-marco', 30, 2),
(4, 4, 1, 1, 'Mon 3eme post', '<p>&nbsp;ghjg ghjg hjkl</p>\r\n<p>fgdf</p>\r\n<p>dfg</p>\r\n<p>dfg</p>\r\n<p>dfgd</p>\r\n<p>fg</p>\r\n<p>dfgf</p>\r\n<p>ggfdddddddddddddddddddddddd fdgdfgdfgdf dgdfgdf</p>', '517f639a3ca74.png', '2013-04-30 08:24:25', '2013-05-13 22:05:34', 'ghjghj hgjghjghj', 12, 0, NULL, 1, 'mon-3eme-post', 23, NULL),
(5, 4, 1, 1, 'hjkhjkh', '<p>hjkh</p>', '517f63afbdd76.jpeg', '2013-04-30 08:24:47', '2013-05-13 22:05:13', 'ghjghjg ghghjghj', 11, 1, NULL, 1, 'hjkhjkh', 14, NULL),
(6, 4, 1, 2, 'un petit testdd', '<p>hjk</p>\r\n<p>i''ve been using the <strong><em>bundle</em></strong> for like a month or so, now I <strong><span style="color: #ff0000;">would</span></strong> like to update it to the new version, cause I saw that now there are some other featers (E.I GroupBy) that are instressting. So I have downloaded the new version replaced the old one by the new one, and now I have a problem, I have this message :</p>\r\n<p><br />Et <strong>donne</strong> le nom de la route qui correspond &agrave; l&rsquo;url de la page que l&rsquo;utilisateur a appel&eacute;.&lt;br&gt;<br />On ne se base plus sur les URLs g&eacute;n&eacute;r&eacute;s, comme le fait le KnpMenuBundle <br />par d&eacute;faut, mais sur le nom des routes qui ne change jamais, param&egrave;tres <br />ou non.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '517f63c24224d.png', '2013-04-30 08:25:00', '2013-05-13 22:05:55', 'un petit test', 13, 1, '2013-05-14 18:00:00', 1, 'un-petit-testdd', 13, NULL),
(7, 4, 1, 1, 'hjkh hkjhkh', '<p>hjkhj</p>', '51814e6b4e961.jpeg', '2013-05-01 07:48:48', '2013-05-13 21:41:24', 'hjkhf fghf fghfghf fghgf gfhfghfghf  u\r\n<p>hjgjhgjhgh ghjghjghj ggggggggg gggttttttttttttttt</p>', 9, 1, NULL, 1, 'hjkh-hkjhkh', 24, 3),
(8, 4, 2, 1, 'test avec poubellejkl', '<p>ghjgjhghjghjjklj jkljkl</p>', '51856bb8c5179.png', '2013-05-01 18:25:59', '2013-05-11 23:30:45', 'ghjgjhjklj', 8, 1, '2013-05-06 18:00:00', 1, 'test-avec-poubellejkl', 28, NULL),
(9, 4, 1, 1, 'Thread et Entities', '<p>De ce que je comprends, mon setThread (g&eacute;n&eacute;r&eacute; avec la console) n''est pas compatible avec celui de <strong>CommentInterface</strong>, j''ai donc ouvert cette interface pour voir ce qui s''y trouve et j''ai impl&eacute;menter chacune des m&eacute;thodes d&eacute;clar&eacute;es dans l&rsquo;interface &agrave; mon entit&eacute; Comment, c''est bien le role de l''interface non ? Apr&egrave;s j''ai peut &ecirc;tre besoin d''une relecture du chapitre sur les interface, faut dire &ccedil;a fait des mois et des mois que je ne l''ai pas lu et je n''en est jamais eu l''utilit&eacute; depuis la premi&egrave;re lecture.</p>\r\n<p>Edit: Je viens de supprimer les get/set de mon entit&eacute; Comment et de faire mon OneToOne dans mon entit&eacute; Video et l&agrave; la g&eacute;n&eacute;ration des get/set fonctionne, parcontre d&egrave;s que je g&eacute;n&eacute;re les get/set de Comment apr&egrave;s quand je reg&eacute;n&eacute;re ceux de Video &ccedil;a dit que les get/set de Comment ne correspondent pas &agrave; ceux de l''interface.</p>\r\n<p>Comme tu l''as bien compris, tes m&eacute;thodes ne correspondent pas &agrave; l''interface de CommentInterface alors si tu d&eacute;sires r&eacute;impl&eacute;menter ces m&eacute;thodes tu dois suivre la sp&eacute;cification de ces m&eacute;thodes. (Avec les use correspondant bien entendu cfr mon premier post)</p>\r\n<p>Cependant, je ne comprends pas pourquoi tu veux r&eacute;impl&eacute;menter ces m&eacute;thodes puisque normalement si tu as suivis la doc, ta classe Comment doit &eacute;tendre la classe abstraite de FOSCommentBundle. Et dans ce cas, il n''y a pas &agrave; &nbsp;r&eacute;&eacute;crire ces m&eacute;thodes puisqu''elles existent d&eacute;j&agrave; et elles correspondent tr&egrave;s bien &agrave; l''interface. Ta classe devrait tout simplement ressembler &agrave; &ccedil;a:</p>\r\n<p>&nbsp;</p>\r\n<p><span>N''ayant pas trouve de bundle&nbsp;ad&eacute;quat&nbsp;pour la conception d''un forum, j''ai donc installe FOS Comment Bundle.</span></p>\r\n<p><span>Cela fait plusieurs jours que j''essaye de faire l''override des templates par 2 moyens :</span></p>\r\n<p><span>&nbsp;</span></p>\r\n<p><span><span>La&nbsp;premi&egrave;re&nbsp;m&eacute;thode&nbsp;est de mettre les templates dans app/resources/FOSCommentBundle/view/Thread/*html..twig, j</span></span><span>e rencontre l''erreur suivante :&nbsp;</span>&nbsp;</p>\r\n<p><span style="color: #800000;">An exception has been thrown during the rendering of a template ("No route found for "GET Thread:newThreadComments"") in AcmeForumBundle:Forum:index.html.twig at line 7.</span></p>', NULL, '2013-05-08 11:09:10', '2013-05-13 21:03:29', 'De ce que je comprends, mon setThread (généré avec la console) n''est pas compatible avec celui de CommentInterface,', 3, 1, NULL, 1, 'thread-et-entities', 25, 11),
(10, 4, 1, 1, 'hjkhjkhjk', '<p>jkhjkhjkh</p>', NULL, '2013-05-10 20:44:49', '2013-05-13 21:41:50', 'hjkhjkhhjk hjkhjkhkjh', 4, 1, NULL, 1, 'hjkhjkhjk', 29, 1),
(11, 4, 1, 1, 'qqdjkljkljkl', '<p>jkhjkhjkh</p>\r\n<p>&nbsp;</p>', NULL, '2013-05-10 20:46:24', '2013-05-13 21:08:19', 'hjkhjkhhjk hjkhklmk', 5, 1, NULL, 1, 'qqdjkljkljkl', 14, 13),
(12, 5, 1, 1, 'post marc', '<p>nhjhj hjkjkhjkhjkhjhjkh</p>', NULL, '2013-05-11 22:45:04', '2013-05-13 21:23:00', 'hjhjkh hhhkjkkkkkkkkkkkkkkkkk', 7, 1, NULL, 1, 'post-marc', 31, 3),
(13, 9, 1, 1, 'ghjghjghjgjh', '<p>gjhghj gjhghjgjhghj</p>', NULL, '2013-05-15 19:31:54', '2013-05-15 20:59:46', 'ghjghjghjg ghjghjg', 14, 1, NULL, 1, 'ghjghjghjgjh', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `epost_categories`
--

CREATE TABLE IF NOT EXISTS `epost_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_61FB578A834505F5` (`id_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `epost_categories`
--

INSERT INTO `epost_categories` (`id`, `name`, `description`, `slug`, `id_group`) VALUES
(1, 'CATEGORIE1', 'CATEGORIE1', 'CATEGORIE1', NULL),
(2, 'CATEGORIE2', 'CATEGORIE2', 'CATEGORIE2', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `epost_comments`
--

CREATE TABLE IF NOT EXISTS `epost_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `epost_id` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `isComment` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_36C2C18A8D93D649` (`user`),
  KEY `IDX_36C2C18A2BCCADE4` (`epost_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Contenu de la table `epost_comments`
--

INSERT INTO `epost_comments` (`id`, `user`, `epost_id`, `comment`, `approved`, `isComment`, `created`, `updated`) VALUES
(1, 4, 2, '<p>for test</p>', 1, 0, '2013-04-29 20:10:13', '2013-04-29 20:10:13'),
(2, 4, 2, '<p>for test</p>', 1, 0, '2013-04-29 20:10:53', '2013-04-29 20:10:53'),
(3, 4, 2, '<p>ghgh ghjghjhj</p>', 1, 0, '2013-04-29 20:11:07', '2013-04-29 20:11:07'),
(4, 5, 6, '<p>jkjklj jkjklj</p>', 1, 0, '2013-05-04 10:41:50', '2013-05-04 10:41:50'),
(5, 4, 9, '<p>installed FOSCommentBundle (after installing JMSSerializerBundle and FOSRestBundle) by following the instructions of the <a href="https://github.com/FriendsOfSymfony/FOSCommentBundle/blob/master/Resources/doc/index.md" rel="nofollow">documentation</a>.</p>\r\n<p>But when I try to apply what is written on the <a href="https://github.com/FriendsOfSymfony/FOSCommentBundle/blob/master/Resources/doc/4-enable_comments_on_a_page.md" rel="nofollow">last page of the tutorial</a>, nothing happens on the generated page (nothing is displayed where I included async.html.twig), whereas I didn''t forget to include jQuery. In the database, an entry with "foo" id key is created in the Thread table (as written in the async.html.twig code).</p>\r\n<p>Moreover, I absolutely don''t know how to use this bundle. I didn''t find plenty of tutorials about it (like with FOSUserBundle), and the documentation does not contain a "Starting with" section. I don''t know exactly what are Thread(s)/Comment(s), how they are linked together, what are the meanings of the different fields in these classes, what are the methods/views to use to post/display comments, ...</p>', 1, 0, '2013-05-09 13:47:29', '2013-05-09 13:47:29'),
(6, 4, 9, '<p>&nbsp;</p>\r\n<p>Mais en explorent un peu plus les fichier en effet tout &ccedil;a est d&eacute;j&agrave; pr&eacute;sent dans le bundle.</p>\r\n<p>Parcontre comment cr&eacute;er un sujet lors de la cr&eacute;ation d''une page de vid&eacute;o ?</p>\r\n<p>Quand je tente depuis mon controlleur de cr&eacute;er un thread et de le lier &agrave; une de mes vid&eacute;o, j''ai cette erreur:</p>\r\n<div>\r\n<div id="highlighter_723319" class="syntaxhighlighter  php">\r\n<table border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="gutter">\r\n<div class="line number1 index0 alt2">1</div>\r\n</td>\r\n<td class="code">\r\n<div class="container">\r\n<div class="line number1 index0 alt2"><code class="php plain">An exception occurred </code><code class="php keyword">while</code> <code class="php plain">executing </code><code class="php string">''INSERT INTO Thread (permalink, is_commentable, num_comments, last_comment_at) VALUES (?, ?, ?, ?)''</code> <code class="php plain">with params {</code><code class="php string">"1"</code><code class="php plain">:null,</code><code class="php string">"2"</code><code class="php plain">:1,</code><code class="php string">"3"</code><code class="php plain">:0,</code><code class="php string">"4"</code><code class="php plain">:null}:</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p>Mais je ne sait pas avec quoi remplir ces informations, exemple: num_comments.</p>\r\n<p>Comment je dois faire pour cr&eacute;er un fil de commentaire sur mes pages svp ? Dans la doc il parlent seulement d''un code d''int&eacute;gration.</p>\r\n<p>J''ai mis le code d''int&eacute;gration mais rien n''apparait, j''ai pourtant jquery de charg&eacute; et le script de Fos est bien visible dans le code source de la page.</p>', 1, 0, '2013-05-09 13:52:15', '2013-05-09 13:52:15'),
(7, 4, 9, '<p>&nbsp;</p>\n<p>Mais en explorent un peu plus les fichier en effet tout &ccedil;a est d&eacute;j&agrave; pr&eacute;sent dans le bundle.</p>\n<p>Parcontre comment cr&eacute;er un sujet lors de la cr&eacute;ation d''une page de vid&eacute;o ?</p>\n<p>Quand je tente depuis mon controlleur de cr&eacute;er un thread et de le lier &agrave; une de mes vid&eacute;o, j''ai cette erreur:</p>\n<div>\n<div id="highlighter_723319" class="syntaxhighlighter  php">\n<table border="0" cellspacing="0" cellpadding="0">\n<tbody>\n<tr>\n<td class="gutter">\n<div class="line number1 index0 alt2">1</div>\n</td>\n<td class="code">\n<div class="container">\n<div class="line number1 index0 alt2"><code class="php plain">An exception occurred </code><code class="php keyword">while</code> <code class="php plain">executing </code><code class="php string">''INSERT INTO Thread (permalink, is_commentable, num_comments, last_comment_at) VALUES (?, ?, ?, ?)''</code> <code class="php plain">with params {</code><code class="php string">"1"</code><code class="php plain">:null,</code><code class="php string">"2"</code><code class="php plain">:1,</code><code class="php string">"3"</code><code class="php plain">:0,</code><code class="php string">"4"</code><code class="php plain">:null}:</code></div>\n</div>\n</td>\n</tr>\n</tbody>\n</table>\n</div>\n</div>\n<p>Mais je ne sait pas avec quoi remplir ces informations, exemple: num_comments.</p>\n<p>Comment je dois faire pour cr&eacute;er un fil de commentaire sur mes pages svp ? Dans la doc il parlent seulement d''un code d''int&eacute;gration.</p>\n<p>J''ai mis le code d''int&eacute;gration mais rien n''apparait, j''ai pourtant jquery de charg&eacute; et le script de Fos est bien visible dans le code source de la page.</p>', 1, 0, '2013-05-09 13:53:24', '2013-05-09 13:53:24'),
(8, 4, 9, '<p>&nbsp;</p>\n<p>Mais en explorent un peu plus les fichier en effet tout &ccedil;a est d&eacute;j&agrave; pr&eacute;sent dans le bundle.</p>\n<p>Parcontre comment cr&eacute;er un sujet lors de la cr&eacute;ation d''une page de vid&eacute;o ?</p>\n<p>Quand je tente depuis mon controlleur de cr&eacute;er un thread et de le lier &agrave; une de mes vid&eacute;o, j''ai cette erreur:</p>\n<div>\n<div id="highlighter_723319" class="syntaxhighlighter  php">\n<table border="0" cellspacing="0" cellpadding="0">\n<tbody>\n<tr>\n<td class="gutter">\n<div class="line number1 index0 alt2">1</div>\n</td>\n<td class="code">\n<div class="container">\n<div class="line number1 index0 alt2"><code class="php plain">An exception occurred </code><code class="php keyword">while</code> <code class="php plain">executing </code><code class="php string">''INSERT INTO Thread (permalink, is_commentable, num_comments, last_comment_at) VALUES (?, ?, ?, ?)''</code> <code class="php plain">with params {</code><code class="php string">"1"</code><code class="php plain">:null,</code><code class="php string">"2"</code><code class="php plain">:1,</code><code class="php string">"3"</code><code class="php plain">:0,</code><code class="php string">"4"</code><code class="php plain">:null}:</code></div>\n</div>\n</td>\n</tr>\n</tbody>\n</table>\n</div>\n</div>\n<p>Mais je ne sait pas avec quoi remplir ces informations, exemple: num_comments.</p>\n<p>Comment je dois faire pour cr&eacute;er un fil de commentaire sur mes pages svp ? Dans la doc il parlent seulement d''un code d''int&eacute;gration.</p>\n<p>J''ai mis le code d''int&eacute;gration mais rien n''apparait, j''ai pourtant jquery de charg&eacute; et le script de Fos est bien visible dans le code source de la page.</p>', 1, 0, '2013-05-09 13:53:41', '2013-05-09 13:53:41'),
(9, 4, 9, '<p>&nbsp;</p>\r\n<p>Mais en explorent un peu plus les fichier en effet tout &ccedil;a est d&eacute;j&agrave; pr&eacute;sent dans le bundle.</p>\r\n<p>Parcontre comment cr&eacute;er un sujet lors de la cr&eacute;ation d''une page de vid&eacute;o ?</p>\r\n<p>Quand je tente depuis mon controlleur de cr&eacute;er un thread et de le lier &agrave; une de mes vid&eacute;o, j''ai cette erreur:</p>\r\n<div>\r\n<div id="highlighter_723319" class="syntaxhighlighter  php">\r\n<table border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="gutter">\r\n<div class="line number1 index0 alt2">1</div>\r\n</td>\r\n<td class="code">\r\n<div class="container">\r\n<div class="line number1 index0 alt2"><code class="php plain">An exception occurred </code><code class="php keyword">while</code> <code class="php plain">executing </code><code class="php string">''INSERT INTO Thread (permalink, is_commentable, num_comments, last_comment_at) VALUES (?, ?, ?, ?)''</code> <code class="php plain">with params {</code><code class="php string">"1"</code><code class="php plain">:null,</code><code class="php string">"2"</code><code class="php plain">:1,</code><code class="php string">"3"</code><code class="php plain">:0,</code><code class="php string">"4"</code><code class="php plain">:null}:</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p>Mais je ne sait pas avec quoi remplir ces informations, exemple: num_comments.</p>\r\n<p>Comment je dois faire pour cr&eacute;er un fil de commentaire sur mes pages svp ? Dans la doc il parlent seulement d''un code d''int&eacute;gration.</p>\r\n<p>J''ai mis le code d''int&eacute;gration mais rien n''apparait, j''ai pourtant jquery de charg&eacute; et le script de Fos est bien visible dans le code source de la page.</p>', 1, 0, '2013-05-09 13:54:48', '2013-05-09 13:54:48'),
(10, 4, 6, '<p>Can you give me some informations on how to create a new Symfony2 project please ?</p>\r\n<p>I started to get the symfony/symfony-sandbox from github as a tar-ball. Then I removed its old src/vendor content.</p>\r\n<p>I get latest vendor libs with git submodule. ( fabpot/Symfony, doctrine, migrations, ...).</p>\r\n<p><strong>The problem is the sandbox seems out of date</strong> compared to latest fabpot/Symfony code.</p>\r\n<p>So I started to modify what changed ( FoundationBundle rename, some method signature changes (like registerContainerConfiguration, ... ).</p>\r\n<p>I still get this error:</p>\r\n<pre class="lang-php prettyprint prettyprinted"><code><span class="typ">Symfony</span><span class="pln">\\Components\\HttpKernel\\Exception\\NotFoundHttpException</span><span class="pun">:</span><span class="typ">Unable</span><span class="pln"> to find the controller</span><span class="pun">.</span></code></pre>', 1, 0, '2013-05-09 14:02:55', '2013-05-09 14:02:55'),
(11, 4, 9, '<p>Can you give me some informations on how to create a new Symfony2 project please ?</p>\r\n<p>I started to get the symfony/symfony-sandbox from github as a tar-ball. Then I removed its old src/vendor content.</p>\r\n<p>I get latest vendor libs with git submodule. ( fabpot/Symfony, doctrine, migrations, ...).</p>\r\n<p><strong>The problem is the sandbox seems out of date</strong> compared to latest fabpot/Symfony code.</p>\r\n<p>So I started to modify what changed ( FoundationBundle rename, some method signature changes (like registerContainerConfiguration, ... ).</p>\r\n<p>I still get this error:</p>\r\n<pre class="lang-php prettyprint prettyprinted"><code><span class="typ">Symfony</span><span class="pln">\\Components\\HttpKernel\\Exception\\NotFoundHttpException</span><span class="pun">:</span><span class="typ">Unable</span><span class="pln"> to find the controller</span><span class="pun">.</span></code></pre>', 1, 0, '2013-05-09 14:03:41', '2013-05-09 14:03:41'),
(12, 4, 9, '<p>Can you give me some informations on how to create a new Symfony2 project please ?</p>\r\n<p>I started to get the symfony/symfony-sandbox from github as a tar-ball. Then I removed its old src/vendor content.</p>\r\n<p>I get latest vendor libs with git submodule. ( fabpot/Symfony, doctrine, migrations, ...).</p>\r\n<p><strong>The problem is the sandbox seems out of date</strong> compared to latest fabpot/Symfony code.</p>\r\n<p>So I started to modify what changed ( FoundationBundle rename, some method signature changes (like registerContainerConfiguration, ... ).</p>\r\n<p>I still get this error:</p>\r\n<pre class="lang-php prettyprint prettyprinted"><code><span class="typ">Symfony</span><span class="pln">\\Components\\HttpKernel\\Exception\\NotFoundHttpException</span><span class="pun">:</span><span class="typ">Unable</span><span class="pln"> to find the controller</span><span class="pun">.</span></code></pre>', 1, 0, '2013-05-09 14:03:50', '2013-05-09 14:03:50'),
(13, 4, 9, '<p>Quand je vais dans CommentInterface j''ai tout &ccedil;a :</p>\r\n<div>\r\n<div id="highlighter_840564" class="syntaxhighlighter  php">\r\n<table border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td class="gutter">\r\n<div class="line number1 index0 alt2">1</div>\r\n<div class="line number2 index1 alt1">2</div>\r\n<div class="line number3 index2 alt2">3</div>\r\n<div class="line number4 index3 alt1">4</div>\r\n<div class="line number5 index4 alt2">5</div>\r\n<div class="line number6 index5 alt1">6</div>\r\n<div class="line number7 index6 alt2">7</div>\r\n<div class="line number8 index7 alt1">8</div>\r\n<div class="line number9 index8 alt2">9</div>\r\n<div class="line number10 index9 alt1">10</div>\r\n<div class="line number11 index10 alt2">11</div>\r\n<div class="line number12 index11 alt1">12</div>\r\n<div class="line number13 index12 alt2">13</div>\r\n<div class="line number14 index13 alt1">14</div>\r\n<div class="line number15 index14 alt2">15</div>\r\n<div class="line number16 index15 alt1">16</div>\r\n<div class="line number17 index16 alt2">17</div>\r\n<div class="line number18 index17 alt1">18</div>\r\n<div class="line number19 index18 alt2">19</div>\r\n<div class="line number20 index19 alt1">20</div>\r\n<div class="line number21 index20 alt2">21</div>\r\n<div class="line number22 index21 alt1">22</div>\r\n<div class="line number23 index22 alt2">23</div>\r\n<div class="line number24 index23 alt1">24</div>\r\n<div class="line number25 index24 alt2">25</div>\r\n<div class="line number26 index25 alt1">26</div>\r\n<div class="line number27 index26 alt2">27</div>\r\n<div class="line number28 index27 alt1">28</div>\r\n<div class="line number29 index28 alt2">29</div>\r\n<div class="line number30 index29 alt1">30</div>\r\n<div class="line number31 index30 alt2">31</div>\r\n<div class="line number32 index31 alt1">32</div>\r\n<div class="line number33 index32 alt2">33</div>\r\n<div class="line number34 index33 alt1">34</div>\r\n<div class="line number35 index34 alt2">35</div>\r\n<div class="line number36 index35 alt1">36</div>\r\n<div class="line number37 index36 alt2">37</div>\r\n<div class="line number38 index37 alt1">38</div>\r\n<div class="line number39 index38 alt2">39</div>\r\n<div class="line number40 index39 alt1">40</div>\r\n<div class="line number41 index40 alt2">41</div>\r\n<div class="line number42 index41 alt1">42</div>\r\n<div class="line number43 index42 alt2">43</div>\r\n<div class="line number44 index43 alt1">44</div>\r\n<div class="line number45 index44 alt2">45</div>\r\n<div class="line number46 index45 alt1">46</div>\r\n<div class="line number47 index46 alt2">47</div>\r\n<div class="line number48 index47 alt1">48</div>\r\n<div class="line number49 index48 alt2">49</div>\r\n<div class="line number50 index49 alt1">50</div>\r\n<div class="line number51 index50 alt2">51</div>\r\n<div class="line number52 index51 alt1">52</div>\r\n<div class="line number53 index52 alt2">53</div>\r\n<div class="line number54 index53 alt1">54</div>\r\n<div class="line number55 index54 alt2">55</div>\r\n<div class="line number56 index55 alt1">56</div>\r\n<div class="line number57 index56 alt2">57</div>\r\n<div class="line number58 index57 alt1">58</div>\r\n<div class="line number59 index58 alt2">59</div>\r\n<div class="line number60 index59 alt1">60</div>\r\n<div class="line number61 index60 alt2">61</div>\r\n<div class="line number62 index61 alt1">62</div>\r\n<div class="line number63 index62 alt2">63</div>\r\n<div class="line number64 index63 alt1">64</div>\r\n<div class="line number65 index64 alt2">65</div>\r\n<div class="line number66 index65 alt1">66</div>\r\n<div class="line number67 index66 alt2">67</div>\r\n<div class="line number68 index67 alt1">68</div>\r\n<div class="line number69 index68 alt2">69</div>\r\n<div class="line number70 index69 alt1">70</div>\r\n<div class="line number71 index70 alt2">71</div>\r\n<div class="line number72 index71 alt1">72</div>\r\n<div class="line number73 index72 alt2">73</div>\r\n<div class="line number74 index73 alt1">74</div>\r\n<div class="line number75 index74 alt2">75</div>\r\n<div class="line number76 index75 alt1">76</div>\r\n<div class="line number77 index76 alt2">77</div>\r\n<div class="line number78 index77 alt1">78</div>\r\n<div class="line number79 index78 alt2">79</div>\r\n<div class="line number80 index79 alt1">80</div>\r\n<div class="line number81 index80 alt2">81</div>\r\n<div class="line number82 index81 alt1">82</div>\r\n<div class="line number83 index82 alt2">83</div>\r\n<div class="line number84 index83 alt1">84</div>\r\n<div class="line number85 index84 alt2">85</div>\r\n<div class="line number86 index85 alt1">86</div>\r\n<div class="line number87 index86 alt2">87</div>\r\n<div class="line number88 index87 alt1">88</div>\r\n<div class="line number89 index88 alt2">89</div>\r\n<div class="line number90 index89 alt1">90</div>\r\n<div class="line number91 index90 alt2">91</div>\r\n<div class="line number92 index91 alt1">92</div>\r\n<div class="line number93 index92 alt2">93</div>\r\n<div class="line number94 index93 alt1">94</div>\r\n<div class="line number95 index94 alt2">95</div>\r\n<div class="line number96 index95 alt1">96</div>\r\n</td>\r\n<td class="code">\r\n<div class="container">\r\n<div class="line number1 index0 alt2"><code class="php plain">&lt;?php</code></div>\r\n<div class="line number2 index1 alt1">&nbsp;</div>\r\n<div class="line number3 index2 alt2"><code class="php comments">/**</code></div>\r\n<div class="line number4 index3 alt1"><code class="php spaces">&nbsp;</code><code class="php comments">* This file is part of the FOSCommentBundle package.</code></div>\r\n<div class="line number5 index4 alt2"><code class="php spaces">&nbsp;</code><code class="php comments">*</code></div>\r\n<div class="line number6 index5 alt1"><code class="php spaces">&nbsp;</code><code class="php comments">* (c) FriendsOfSymfony &lt;<a href="http://friendsofsymfony.github.com/">http://friendsofsymfony.github.com/</a>&gt;</code></div>\r\n<div class="line number7 index6 alt2"><code class="php spaces">&nbsp;</code><code class="php comments">*</code></div>\r\n<div class="line number8 index7 alt1"><code class="php spaces">&nbsp;</code><code class="php comments">* This source file is subject to the MIT license that is bundled</code></div>\r\n<div class="line number9 index8 alt2"><code class="php spaces">&nbsp;</code><code class="php comments">* with this source code in the file LICENSE.</code></div>\r\n<div class="line number10 index9 alt1"><code class="php spaces">&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number11 index10 alt2">&nbsp;</div>\r\n<div class="line number12 index11 alt1"><code class="php keyword">namespace</code> <code class="php plain">FOS\\CommentBundle\\Model;</code></div>\r\n<div class="line number13 index12 alt2">&nbsp;</div>\r\n<div class="line number14 index13 alt1"><code class="php comments">/**</code></div>\r\n<div class="line number15 index14 alt2"><code class="php spaces">&nbsp;</code><code class="php comments">* CommentInterface.</code></div>\r\n<div class="line number16 index15 alt1"><code class="php spaces">&nbsp;</code><code class="php comments">*</code></div>\r\n<div class="line number17 index16 alt2"><code class="php spaces">&nbsp;</code><code class="php comments">* Any comment to be used by FOS\\CommentBundle must implement this interface.</code></div>\r\n<div class="line number18 index17 alt1"><code class="php spaces">&nbsp;</code><code class="php comments">*</code></div>\r\n<div class="line number19 index18 alt2"><code class="php spaces">&nbsp;</code><code class="php comments">* @author Thibault Duplessis &lt;thibault.duplessis@gmail.com&lt;script type="text/javascript"&gt;</code></div>\r\n<div class="line number20 index19 alt1"><code class="php comments">/* &lt;![CDATA[ */</code></div>\r\n<div class="line number21 index20 alt2"><code class="php plain">(</code><code class="php keyword">function</code><code class="php plain">(){</code><code class="php keyword">try</code><code class="php plain">{</code><code class="php keyword">var</code> <code class="php plain">s,a,i,j,r,c,l,b=document.getElementsByTagName(</code><code class="php string">"script"</code><code class="php plain">);l=b[b.length-1].previousSibling;a=l.getAttribute(</code><code class="php string">''data-cfemail''</code><code class="php plain">);</code><code class="php keyword">if</code><code class="php plain">(a){s=</code><code class="php string">''''</code><code class="php plain">;r=parseInt(a.</code><code class="php functions">substr</code><code class="php plain">(0,2),16);</code><code class="php keyword">for</code><code class="php plain">(j=2;a.length-j;j+=2){c=parseInt(a.</code><code class="php functions">substr</code><code class="php plain">(j,2),16)^r;s+=String.fromCharCode(c);}s=document.createTextNode(s);l.parentNode.replaceChild(s,l);}}</code><code class="php keyword">catch</code><code class="php plain">(e){}})();</code></div>\r\n<div class="line number22 index21 alt1"><code class="php comments">/* ]]&gt; */</code></div>\r\n<div class="line number23 index22 alt2"><code class="php plain">&lt;/script&gt;&gt;</code></div>\r\n<div class="line number24 index23 alt1"><code class="php spaces">&nbsp;</code><code class="php plain">*/</code></div>\r\n<div class="line number25 index24 alt2"><code class="php keyword">interface</code> <code class="php plain">CommentInterface</code></div>\r\n<div class="line number26 index25 alt1"><code class="php plain">{</code></div>\r\n<div class="line number27 index26 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">const</code> <code class="php plain">STATE_VISIBLE = 0;</code></div>\r\n<div class="line number28 index27 alt1">&nbsp;</div>\r\n<div class="line number29 index28 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">const</code> <code class="php plain">STATE_DELETED = 1;</code></div>\r\n<div class="line number30 index29 alt1">&nbsp;</div>\r\n<div class="line number31 index30 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">const</code> <code class="php plain">STATE_SPAM = 2;</code></div>\r\n<div class="line number32 index31 alt1">&nbsp;</div>\r\n<div class="line number33 index32 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">const</code> <code class="php plain">STATE_PENDING = 3;</code></div>\r\n<div class="line number34 index33 alt1">&nbsp;</div>\r\n<div class="line number35 index34 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number36 index35 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @return mixed unique ID for this comment</code></div>\r\n<div class="line number37 index36 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number38 index37 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">getId();</code></div>\r\n<div class="line number39 index38 alt2">&nbsp;</div>\r\n<div class="line number40 index39 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number41 index40 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @return string name of the comment author</code></div>\r\n<div class="line number42 index41 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number43 index42 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">getAuthorName();</code></div>\r\n<div class="line number44 index43 alt1">&nbsp;</div>\r\n<div class="line number45 index44 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number46 index45 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @return string</code></div>\r\n<div class="line number47 index46 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number48 index47 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">getBody();</code></div>\r\n<div class="line number49 index48 alt2">&nbsp;</div>\r\n<div class="line number50 index49 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number51 index50 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @param string $body</code></div>\r\n<div class="line number52 index51 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number53 index52 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">setBody(</code><code class="php variable">$body</code><code class="php plain">);</code></div>\r\n<div class="line number54 index53 alt1">&nbsp;</div>\r\n<div class="line number55 index54 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number56 index55 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @return DateTime</code></div>\r\n<div class="line number57 index56 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number58 index57 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">getCreatedAt();</code></div>\r\n<div class="line number59 index58 alt2">&nbsp;</div>\r\n<div class="line number60 index59 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number61 index60 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @return ThreadInterface</code></div>\r\n<div class="line number62 index61 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number63 index62 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">getThread();</code></div>\r\n<div class="line number64 index63 alt1">&nbsp;</div>\r\n<div class="line number65 index64 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number66 index65 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @param ThreadInterface $thread</code></div>\r\n<div class="line number67 index66 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number68 index67 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">setThread(ThreadInterface </code><code class="php variable">$thread</code><code class="php plain">);</code></div>\r\n<div class="line number69 index68 alt2">&nbsp;</div>\r\n<div class="line number70 index69 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number71 index70 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @return CommentInterface</code></div>\r\n<div class="line number72 index71 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number73 index72 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">getParent();</code></div>\r\n<div class="line number74 index73 alt1">&nbsp;</div>\r\n<div class="line number75 index74 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number76 index75 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @param CommentInterface $comment</code></div>\r\n<div class="line number77 index76 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number78 index77 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">setParent(CommentInterface </code><code class="php variable">$comment</code><code class="php plain">);</code></div>\r\n<div class="line number79 index78 alt2">&nbsp;</div>\r\n<div class="line number80 index79 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number81 index80 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @return integer The current state of the comment</code></div>\r\n<div class="line number82 index81 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number83 index82 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">getState();</code></div>\r\n<div class="line number84 index83 alt1">&nbsp;</div>\r\n<div class="line number85 index84 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number86 index85 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @param integer state</code></div>\r\n<div class="line number87 index86 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number88 index87 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">setState(</code><code class="php variable">$state</code><code class="php plain">);</code></div>\r\n<div class="line number89 index88 alt2">&nbsp;</div>\r\n<div class="line number90 index89 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">/**</code></div>\r\n<div class="line number91 index90 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* Gets the previous state.</code></div>\r\n<div class="line number92 index91 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*</code></div>\r\n<div class="line number93 index92 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">* @return integer</code></div>\r\n<div class="line number94 index93 alt1"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php comments">*/</code></div>\r\n<div class="line number95 index94 alt2"><code class="php spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="php keyword">public</code> <code class="php keyword">function</code> <code class="php plain">getPreviousState();</code></div>\r\n<div class="line number96 index95 alt1"><code class="php plain">}</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p>&nbsp;</p>\r\n<p>Est ce que je dois cr&eacute;er ces get/set &agrave; la main ou juste les attributs et ensuite utiliser la console pour g&eacute;n&eacute;rer le reste svp ?</p>\r\n<p>Je ne suis pas s&ucirc;r que c''est &agrave; faire &eacute;tant donn&eacute;e que la doc n''en parle pas, si un de vous peut me dire quoi faire pour bien poursuivre l''installation svp <img title=":)" src="http://www.siteduzero.com/bundles/tinymce/vendor/tiny_mce/plugins/emotions/img/smile.png" alt=":)" /></p>', 1, 0, '2013-05-09 14:12:32', '2013-05-09 14:12:32'),
(14, 4, 11, '<p>hjh hjkhjkhjkhkjhjk</p>', 1, 0, '2013-05-13 08:16:58', '2013-05-13 08:16:58'),
(15, 4, 11, '<p>hjgghjghjghjg</p>', 1, 0, '2013-05-13 08:21:45', '2013-05-13 08:21:45'),
(16, 4, 11, '<p>hjkhjkhjk</p>', 1, 0, '2013-05-13 08:27:47', '2013-05-13 08:27:47'),
(17, 4, 11, '<p>fghfghfghfgh</p>', 1, 0, '2013-05-13 20:39:21', '2013-05-13 20:39:21'),
(18, 4, 11, '<p>trtyrt</p>', 1, 0, '2013-05-13 20:39:45', '2013-05-13 20:39:45'),
(19, 4, 11, '<p>dfdgfd</p>', 1, 0, '2013-05-13 20:40:41', '2013-05-13 20:40:41'),
(20, 4, 11, '<p>bnvbnvbnvbnvb</p>', 1, 0, '2013-05-13 20:53:09', '2013-05-13 20:53:09'),
(21, 4, 11, '<p>jkljkljklklj</p>', 1, 0, '2013-05-13 20:58:02', '2013-05-13 20:58:02'),
(22, 4, 11, '<p>klmklmppppppppppppppppppppppppp</p>', 1, 0, '2013-05-13 21:00:15', '2013-05-13 21:00:15'),
(23, 4, 11, '<p>jkljlkj hgyuttuy</p>', 1, 0, '2013-05-13 21:01:29', '2013-05-13 21:01:29'),
(24, 4, 11, '<p>jkljlkj hgyuttuy</p>', 1, 0, '2013-05-13 21:01:57', '2013-05-13 21:01:57'),
(25, 4, 9, '<p>ghfgh drteter</p>', 1, 0, '2013-05-13 21:03:29', '2013-05-13 21:03:29'),
(26, 4, 7, '<p>ffsgxfggfghdfhgchgjgf</p>', 1, 0, '2013-05-13 21:05:06', '2013-05-13 21:05:06'),
(27, 4, 7, '<p>jhjhgjjhj</p>', 1, 0, '2013-05-13 21:05:25', '2013-05-13 21:05:25'),
(28, 4, 11, '<p>vbnvbnvbnvbnv</p>', 1, 0, '2013-05-13 21:08:19', '2013-05-13 21:08:19'),
(29, 4, 11, '<p>jjjjjjjjjjjjjjjjjjjjjjjjjjjjjj</p>', 1, 0, '2013-05-13 21:10:40', '2013-05-13 21:10:40'),
(30, 4, 12, '<p>ghjghj tyyutuytyut</p>', 1, 0, '2013-05-13 21:14:41', '2013-05-13 21:14:41'),
(31, 4, 12, '<p>yuyi yuityrterettrt</p>', 1, 0, '2013-05-13 21:14:49', '2013-05-13 21:14:49'),
(32, 4, 12, '<p>hjkhjkhkjkj</p>', 1, 0, '2013-05-13 21:23:00', '2013-05-13 21:23:00'),
(33, 4, 7, '<p>dgfdf jhgjghjghj</p>', 1, 0, '2013-05-13 21:41:24', '2013-05-13 21:41:24'),
(34, 4, 10, '<p>jklj jkljuyyiuyiuyuiyiuy</p>', 1, 0, '2013-05-13 21:41:50', '2013-05-13 21:41:50'),
(35, 9, 3, '<p>uiouio uoiuouiou</p>', 1, 0, '2013-05-15 20:50:35', '2013-05-15 20:50:35'),
(36, 9, 3, '<p>iuioui uiuoiouio</p>', 1, 0, '2013-05-15 20:50:43', '2013-05-15 20:50:43'),
(37, 9, 13, '<p>a moi essai</p>', 1, 0, '2013-05-15 20:59:46', '2013-05-15 20:59:46');

-- --------------------------------------------------------

--
-- Structure de la table `epost_commentsthread`
--

CREATE TABLE IF NOT EXISTS `epost_commentsthread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epost_id` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ancestors` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `depth` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A6DC05F9E2904019` (`thread_id`),
  KEY `IDX_A6DC05F92BCCADE4` (`epost_id`),
  KEY `IDX_A6DC05F9F675F31B` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- Contenu de la table `epost_commentsthread`
--

INSERT INTO `epost_commentsthread` (`id`, `thread_id`, `epost_id`, `body`, `ancestors`, `depth`, `created_at`, `state`, `author_id`, `score`) VALUES
(24, 'ghgjh', NULL, 'wxfwxvxv', '', 0, '2013-05-10 17:20:24', 0, NULL, 0),
(25, 'ghgjh', NULL, 'wxfwxvxv', '', 0, '2013-05-10 17:20:25', 0, NULL, 0),
(26, 'ghgjh', NULL, 'AAAAAAAAA', '25', 1, '2013-05-10 17:31:27', 0, NULL, 0),
(27, 'ghgjh', NULL, 'AAAAAAAAA', '25', 1, '2013-05-10 17:31:27', 0, NULL, 1),
(28, 'ghgjh', NULL, 'hjhkjhj', '', 0, '2013-05-10 19:10:50', 0, NULL, 1),
(29, 'ghgjh', NULL, 'hjhkjhj', '', 0, '2013-05-10 19:10:51', 0, NULL, 0),
(30, 'ghgjh', NULL, 'hjkhjkh hjkhjk', '29', 1, '2013-05-10 20:15:21', 0, NULL, 2),
(31, 'ghgjh', NULL, 'hjkhjkh hjkhjk', '29', 1, '2013-05-10 20:15:21', 0, NULL, 0),
(32, 'ghgjh', NULL, 'jkljkljkl', '', 0, '2013-05-10 20:23:39', 0, 4, 0),
(33, 'ghgjh', NULL, 'jkljkljkl', '', 0, '2013-05-10 20:23:39', 0, 4, 0),
(34, 'ghgjh', NULL, 'hjkhkj', '29', 1, '2013-05-10 20:35:01', 0, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `epost_comments_threads`
--

CREATE TABLE IF NOT EXISTS `epost_comments_threads` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_commentable` tinyint(1) NOT NULL,
  `num_comments` int(11) NOT NULL,
  `last_comment_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `epost_comments_threads`
--

INSERT INTO `epost_comments_threads` (`id`, `permalink`, `is_commentable`, `num_comments`, `last_comment_at`) VALUES
('ghgjh', 'ghjghjj', 1, 32, '2013-05-10 20:35:01');

-- --------------------------------------------------------

--
-- Structure de la table `epost_globalnotes`
--

CREATE TABLE IF NOT EXISTS `epost_globalnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `globalnote` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Contenu de la table `epost_globalnotes`
--

INSERT INTO `epost_globalnotes` (`id`, `globalnote`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 3),
(6, 3),
(7, 5),
(8, 2),
(9, 1),
(10, 2),
(11, 2),
(12, 1),
(13, 4),
(14, 3);

-- --------------------------------------------------------

--
-- Structure de la table `epost_notes`
--

CREATE TABLE IF NOT EXISTS `epost_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `note` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3F8EC9838D93D649` (`user`),
  KEY `IDX_3F8EC9834B89032C` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Contenu de la table `epost_notes`
--

INSERT INTO `epost_notes` (`id`, `user`, `post_id`, `note`, `created`, `updated`) VALUES
(1, 4, 1, 1, '2013-04-29 20:54:12', '2013-05-15 20:49:06'),
(2, 4, 3, 2, '2013-04-30 21:38:34', '2013-05-11 22:34:22'),
(3, 8, 3, 3, '2013-05-08 00:00:00', '2013-05-10 23:13:47'),
(4, 5, 11, 4, '2013-05-11 23:11:12', '2013-05-13 22:06:27'),
(5, 5, 9, 3, '2013-05-11 23:27:53', '2013-05-11 23:27:59'),
(6, 5, 10, 5, '2013-05-11 23:30:26', '2013-05-11 23:30:30'),
(7, 5, 8, 2, '2013-05-11 23:30:40', '2013-05-11 23:30:45'),
(8, 5, 7, 1, '2013-05-11 23:31:43', '2013-05-11 23:31:49'),
(9, 4, 12, 5, '2013-05-11 23:32:32', '2013-05-12 10:01:16'),
(10, 4, 11, 3, '2013-05-12 10:15:13', '2013-05-13 22:08:18'),
(11, 4, 10, 0, '2013-05-12 10:15:29', '2013-05-12 10:15:29'),
(12, 5, 2, 2, '2013-05-13 22:04:52', '2013-05-13 22:04:56'),
(13, 5, 5, 2, '2013-05-13 22:05:07', '2013-05-13 22:05:13'),
(14, 5, 4, 1, '2013-05-13 22:05:27', '2013-05-13 22:05:33'),
(15, 5, 6, 4, '2013-05-13 22:05:51', '2013-05-13 22:05:55'),
(16, 9, 3, 5, '2013-05-15 21:06:04', '2013-05-15 21:21:54'),
(17, 9, 12, 0, '2013-05-15 22:12:59', '2013-05-15 22:12:59'),
(18, 4, 13, 3, '2013-05-15 22:14:33', '2013-05-15 22:14:37');

-- --------------------------------------------------------

--
-- Structure de la table `epost_posts_tags`
--

CREATE TABLE IF NOT EXISTS `epost_posts_tags` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `IDX_8EE4BC7D4B89032C` (`post_id`),
  KEY `IDX_8EE4BC7DBAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `epost_posts_tags`
--

INSERT INTO `epost_posts_tags` (`post_id`, `tag_id`) VALUES
(1, 2),
(2, 1),
(2, 2),
(3, 2),
(4, 4),
(5, 2),
(6, 3),
(7, 2),
(7, 4),
(8, 2),
(8, 3),
(9, 2),
(10, 3),
(10, 4),
(11, 3),
(11, 4),
(12, 3),
(13, 2),
(13, 3);

-- --------------------------------------------------------

--
-- Structure de la table `epost_status`
--

CREATE TABLE IF NOT EXISTS `epost_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `epost_status`
--

INSERT INTO `epost_status` (`id`, `nom`, `description`) VALUES
(1, 'OPEN', 'OPEN'),
(2, 'CLOSED', 'CLOSED');

-- --------------------------------------------------------

--
-- Structure de la table `epost_tags`
--

CREATE TABLE IF NOT EXISTS `epost_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_94A440C1834505F5` (`id_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `epost_tags`
--

INSERT INTO `epost_tags` (`id`, `text`, `slug`, `id_group`) VALUES
(1, 'tag1', 'tag1', NULL),
(2, 'tag2', 'tag2', NULL),
(3, 'tag3', 'tag3', NULL),
(4, 'tag4', 'tag4', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `epost_vote`
--

CREATE TABLE IF NOT EXISTS `epost_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A1085183F8697D13` (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Contenu de la table `epost_vote`
--

INSERT INTO `epost_vote` (`id`, `comment_id`, `created_at`, `value`) VALUES
(1, 34, '2013-05-10 21:18:51', 1),
(2, 28, '2013-05-10 21:19:07', -1),
(3, 28, '2013-05-10 21:19:17', 1),
(4, 27, '2013-05-10 21:19:22', 1),
(5, 28, '2013-05-10 21:19:26', 1),
(6, 30, '2013-05-10 21:19:32', 1),
(7, 30, '2013-05-10 21:19:36', 1);

-- --------------------------------------------------------

--
-- Structure de la table `eproduits`
--

CREATE TABLE IF NOT EXISTS `eproduits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `proprietaire` int(11) DEFAULT NULL,
  `categorie` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `shortdescription` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2BF2D0A069E399D6` (`proprietaire`),
  KEY `IDX_2BF2D0A0497DD634` (`categorie`),
  KEY `IDX_2BF2D0A05D37D0F1` (`id_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Contenu de la table `eproduits`
--

INSERT INTO `eproduits` (`id`, `name`, `description`, `image_name`, `updated_at`, `proprietaire`, `categorie`, `id_status`, `created_at`, `shortdescription`) VALUES
(1, 'Vaisselle', '<p>Vaisselle ancienne</p>', '51604659a81c1.jpeg', '2013-04-06 17:59:21', 7, 1, NULL, '0000-00-00 00:00:00', ''),
(2, 'tronconneuse', '<p>Ma tronconneuse:</p>\r\n<p>bonne &eacute;tat g&eacute;n&eacute;ral, utilisation standard</p>\r\n<ul>\r\n<li>fgdfgf</li>\r\n<li>gfdgdd</li>\r\n<li>le fdfdfd</li>\r\n</ul>', '516048f265a5e.jpeg', '2013-04-18 18:56:19', 4, 2, 1, '0000-00-00 00:00:00', ''),
(3, 'Chaussures de danse', '<p>kk</p>', '516054352461e.jpeg', '2013-04-06 18:58:47', 4, 1, NULL, '0000-00-00 00:00:00', ''),
(4, 'uioiouuiou', '<p>uio</p>', NULL, '0000-00-00 00:00:00', 12, 1, NULL, '0000-00-00 00:00:00', ''),
(5, 'lmù', '<p>lm&ugrave;</p>', NULL, '0000-00-00 00:00:00', 8, 1, NULL, '0000-00-00 00:00:00', ''),
(6, 'hjkhjhkhjkhj', '<p>hjkh</p>\r\n\r\n<p><img alt="" src="/uploads/media/default/0001/01/3804f5c0d5e4dd64ac9936b2ec5394263c35aaf5.jpeg" style="height:127px; width:203px" /></p>\r\n\r\n<p><img alt="" src="/uploads/media/default/0001/01/8b80cc44e945db01d62f8fb8c02f93e3ef03e39b.jpeg" style="height:137px; width:219px" /></p>', '525118b250c04.jpeg', '2013-10-06 10:00:50', 1, 1, NULL, '0000-00-00 00:00:00', 'hjkhjkhjkhk hjkhkjh'),
(7, 'test png image', '<p>hjkhj gdfgdfgfgdf test modif</p>', '5160446715ed3.png', '2013-04-18 19:02:48', 9, 4, 1, '0000-00-00 00:00:00', ''),
(8, 'bbn,', '<p>b,n,n</p>', '51603dde20000.png', '2013-04-18 19:02:31', 6, 2, 1, '0000-00-00 00:00:00', ''),
(9, 'jkljkljkl', '<p>jkljkljk</p>', '516043b8a40a9.jpeg', '2013-04-06 17:48:08', 5, 1, NULL, '0000-00-00 00:00:00', ''),
(10, 'Rateau', '<p>Rateau de jardinage</p>', '51702c5edf9e8.png', '2013-04-19 08:15:42', 4, 2, 1, '0000-00-00 00:00:00', ''),
(11, 'Perceuse', '<p><img alt="" src="/uploads/media/default/0001/01/thumb_34_default_small.jpeg" style="height:62px; width:99px" />Perceuse sans fil black&amp;Decker</p>', '5170429c6a687.png', '2013-10-06 16:13:44', 4, 4, 1, '0000-00-00 00:00:00', 'yyuiy yuiyuiy iuyyuiyi \r\njiuiuiou\r\n\r\ndsfdffd ffffffffffff fffffffffffffffffff ddddddddddddddddddddddddd'),
(12, 'Service travaux', '<p>jkljlk</p>', '5170e16753b83.jpeg', '2013-04-19 08:17:11', 4, 3, 1, '0000-00-00 00:00:00', ''),
(13, 'gfgdfdgfg', '<p>hjk</p>', '5170e183d22a4.png', '2013-04-21 11:06:34', 4, 3, 1, '0000-00-00 00:00:00', ''),
(14, 'ghjghjg', '<p>gjhghj</p>', '5173f5fc71382.png', '2013-04-21 19:46:38', 4, 2, 1, '2013-04-21 16:21:48', ''),
(15, 'fdfsddf', '<p><img alt="test" src="/uploads/media/default/0001/01/6e078b3c33ea5aadd44c1a3635699f68564ba10e.jpeg" style="border-style:solid; border-width:1px; height:188px; width:300px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This is the most basic form of Bootstrap: compiled files for quick drop-in usage in nearly any web project. We provide compiled CSS and JS (bootstrap.*), as well as compiled and minified CSS and JS (bootstrap.min.*). Fonts from Glyphicons are included, as is the optional Bootstrap theme.</p>\r\n\r\n<p><strong>Modals and mobile devices Overflow and scrolling</strong></p>\r\n\r\n<p>Support for overflow: hidden on the</p>\r\n\r\n<ul>\r\n	<li>element is quite limited in iOS and Android. To that end, when you scroll past the top or bottom of a modal in either of those devices&#39; browsers, the</li>\r\n	<li>ggdgfgdg gdfgggggggggggggggggggggggggggggg</li>\r\n</ul>\r\n\r\n<p><span style="color:#FF0000">content will begin to scroll.</span></p>\r\n\r\n<p>Virtual keyboards Also, note that if you&#39;re using inputs in your modal &ndash; iOS has a rendering bug which doesn&#39;t update the position of fixed elements when the virtual keyboard is triggered. There are a few work arounds for this, including transforming your elements to position: absolute or invoking a timer on focus to try to correct the positioning manually. This is not handled by Bootstrap, so it is up to you to decide which solution is best for your application.</p>\r\n\r\n<p>Browser zooming Page zooming inevitably presents rendering artifacts in some components, both in Bootstrap and the rest of the web. Depending on the issue, we may be able to fix it (search first and then open an issue if need be). However, we tend to ignore these as they often have no direct solution other than hacky workarounds.</p>', '517776353c656.png', '2013-10-06 16:15:33', 4, 3, 4, '2013-04-24 08:05:40', '<p>hhhhhhhhhhhhhhhh</p>\r\n\r\n<p>jjjjjjjjjjjjjj</p>\r\njjjjjjjjjjjjjjjj\r\n\r\njjjjjjjjjjjjjjjjjjjjj'),
(16, 'ma poubelle', '<p>ma jolie poubelle</p>', '51782b0ee59aa.png', '2013-04-24 20:57:18', 5, 3, 1, '2013-04-24 20:57:18', '');

-- --------------------------------------------------------

--
-- Structure de la table `eproduits_categories`
--

CREATE TABLE IF NOT EXISTS `eproduits_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `eproduits_categories`
--

INSERT INTO `eproduits_categories` (`id`, `name`, `description`) VALUES
(1, 'DEFAULT', 'fghfgh'),
(2, 'JARDINAGE', NULL),
(3, 'CUISINE', NULL),
(4, 'MATERIAUX ELECTRIQUES', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `eproduits_comments`
--

CREATE TABLE IF NOT EXISTS `eproduits_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produit_id` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `user` int(11) DEFAULT NULL,
  `iscomment` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D6DF9BFF347EFB` (`produit_id`),
  KEY `IDX_D6DF9BF8D93D649` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Contenu de la table `eproduits_comments`
--

INSERT INTO `eproduits_comments` (`id`, `produit_id`, `comment`, `approved`, `created`, `updated`, `user`, `iscomment`) VALUES
(1, 13, 'test comment lié a produit', 1, '2013-04-10 00:00:00', '2013-04-18 00:00:00', 4, 1),
(2, 4, 'ghjghjghj', 1, '2013-04-16 00:00:00', '2013-04-03 00:00:00', 8, 0),
(3, 13, 'jklj lkjkjkljkljkj', 1, '2013-04-10 00:00:00', '2013-04-11 00:00:00', 6, 0),
(4, 13, 'hkj', 1, '2013-04-21 19:03:42', '2013-04-21 19:03:42', 4, 0),
(5, 13, 'for test', 1, '2013-04-21 19:03:53', '2013-04-21 19:03:53', 4, 0),
(6, 8, 'fggf', 1, '2013-04-21 19:05:03', '2013-04-21 19:05:03', 4, 0),
(7, 8, 'fgh', 1, '2013-04-21 19:05:11', '2013-04-21 19:05:11', 5, 0),
(8, 12, 'jklkljl', 1, '2013-04-21 19:15:14', '2013-04-21 19:15:14', 4, 0),
(9, 12, 'hjk', 1, '2013-04-21 19:15:46', '2013-04-21 19:15:46', NULL, 0),
(10, 12, 'hjhjkhjk', 1, '2013-04-21 19:18:36', '2013-04-21 19:18:36', 4, 0),
(11, 12, 'test fgdfgfdgfdd\r\nfgfdgdfgdf', 1, '2013-04-21 19:22:30', '2013-04-21 19:22:30', 4, 0),
(12, 9, 'xfxxcvc', 1, '2013-04-21 20:48:45', '2013-04-21 20:48:45', 4, 0),
(13, 14, 'test', 1, '2013-04-22 20:41:42', '2013-04-22 20:41:42', 4, 0),
(14, 13, 'hhjhjkh', 1, '2013-04-25 20:46:10', '2013-04-25 20:46:10', 4, 1),
(15, 13, 'b,nbn,', 1, '2013-04-25 20:49:38', '2013-04-25 20:49:38', 4, 1),
(16, 13, 'fffffff', 1, '2013-04-25 20:50:49', '2013-04-25 20:50:49', 4, 0),
(17, 7, 'test demande de pret', 1, '2013-04-25 20:52:04', '2013-04-25 20:52:04', 4, 1),
(18, 13, '<p><strong>ghjghjgjh</strong></p>', 1, '2013-04-26 07:49:59', '2013-04-26 07:49:59', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `eproduits_history`
--

CREATE TABLE IF NOT EXISTS `eproduits_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emprunteur` int(11) DEFAULT NULL,
  `date_in` datetime NOT NULL,
  `date_out` datetime NOT NULL,
  `produit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC37D3F8952067DE` (`emprunteur`),
  KEY `IDX_BC37D3F829A5EC27` (`produit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Contenu de la table `eproduits_history`
--

INSERT INTO `eproduits_history` (`id`, `emprunteur`, `date_in`, `date_out`, `produit`) VALUES
(1, 6, '2013-04-10 00:00:00', '2013-04-10 00:00:00', 11),
(2, 9, '2013-03-22 19:07:00', '2013-04-18 19:07:00', 11),
(3, 6, '2013-04-22 19:08:00', '2013-04-22 19:08:00', 10),
(4, 1, '2013-04-22 19:41:00', '2013-04-22 19:41:00', 4),
(5, 7, '2013-04-22 19:51:00', '2013-04-22 19:51:00', 2),
(6, 9, '2013-04-22 19:52:00', '2013-04-22 19:52:00', 3),
(7, 5, '2013-04-25 19:16:00', '2013-04-25 19:16:00', 13),
(8, 5, '2013-04-25 19:19:00', '2013-04-25 19:19:00', 14);

-- --------------------------------------------------------

--
-- Structure de la table `eproduits_historystatus`
--

CREATE TABLE IF NOT EXISTS `eproduits_historystatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `eproduits_notes`
--

CREATE TABLE IF NOT EXISTS `eproduits_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `note` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3BD538A8D93D649` (`user`),
  KEY `IDX_3BD538AF347EFB` (`produit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Contenu de la table `eproduits_notes`
--

INSERT INTO `eproduits_notes` (`id`, `user`, `produit_id`, `note`, `created`, `updated`) VALUES
(8, 4, 13, 2, '0000-00-00 00:00:00', '2013-04-29 08:12:38'),
(11, 5, 1, 10, '0000-00-00 00:00:00', '2013-04-28 05:40:34'),
(12, 4, 14, 2, '0000-00-00 00:00:00', '2013-04-29 08:16:12'),
(13, 4, 15, 3, '0000-00-00 00:00:00', '2013-05-04 20:46:48'),
(14, 4, 16, 4, '0000-00-00 00:00:00', '2013-10-05 09:22:11'),
(15, 4, 7, 3, '0000-00-00 00:00:00', '2013-10-05 09:21:51'),
(16, 4, 9, 2, '0000-00-00 00:00:00', '2013-04-29 08:15:19'),
(17, 6, 16, 3, '0000-00-00 00:00:00', '2013-03-12 09:28:23'),
(18, 4, 1, 1, '0000-00-00 00:00:00', '2013-04-28 09:28:23'),
(19, 4, 2, 2, '2013-04-28 09:28:23', '2013-03-08 15:36:15'),
(20, 4, 7, 3, '2013-04-28 10:01:47', '2013-04-28 10:01:47');

-- --------------------------------------------------------

--
-- Structure de la table `eproduits_status`
--

CREATE TABLE IF NOT EXISTS `eproduits_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `eproduits_status`
--

INSERT INTO `eproduits_status` (`id`, `nom`, `description`) VALUES
(1, 'open', NULL),
(2, 'EN_PRET', NULL),
(3, 'CLOSED', NULL),
(4, 'ATTENTE', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `eservices`
--

CREATE TABLE IF NOT EXISTS `eservices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `demandeur` int(11) DEFAULT NULL,
  `date_fin` datetime NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `brouzoufs` int(11) NOT NULL,
  `id_status` int(11) DEFAULT NULL,
  `isDemande` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E6EDEE45665DA613` (`demandeur`),
  KEY `IDX_E6EDEE455D37D0F1` (`id_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Contenu de la table `eservices`
--

INSERT INTO `eservices` (`id`, `demandeur`, `date_fin`, `name`, `description`, `brouzoufs`, `id_status`, `isDemande`) VALUES
(1, 4, '2011-06-05 02:03:00', 'Pret Tronconneuse', '<p>dfddfdf</p>', 250, 2, 0),
(2, 4, '2013-04-16 12:00:00', 'p2', '<p>k</p>', 200, 2, 0),
(3, 5, '2013-04-08 12:00:00', 'jlkjkl', '<p>12312332</p>', 200, 1, 0),
(4, 4, '2013-04-10 11:00:00', 'kklkllm', '<p>4564</p>', 150, 1, 0),
(5, 4, '2013-04-09 12:00:00', 'jkllkjjkl', '<p>kmlkm</p>', 200, 1, 0),
(6, 6, '2013-04-08 12:00:00', 'hjkhj', '<p>1231</p>', 150, 1, 0),
(7, 6, '2013-04-22 12:00:00', 'hggdd', '<p>hjjhkh</p>', 150, 1, 0),
(8, 8, '2013-04-18 12:00:00', 'ghjjhgh', '<p>12312312313</p>', 250, 1, 0),
(9, 4, '2013-04-09 12:00:00', 'ouiou', '<p>123</p>', 500, 1, 1),
(10, 4, '2013-04-17 12:00:00', 'kljjlk', '<p>123123</p>', 560, 1, 1),
(11, 4, '2013-04-10 12:00:00', '123123hjgjhg', '<p>1123123</p>', 299, 1, 1),
(12, 4, '2013-04-09 12:00:00', '1hjkh', '<p>123</p>', 100, 1, 1),
(13, 4, '2013-04-17 12:00:00', 'ghj', '<p>klm</p>', 100, 1, 1),
(14, 4, '2013-04-09 12:00:00', 'jkl', '<p>j</p>', 500, 1, 1),
(15, 4, '2013-04-11 12:00:00', 'yiuuiy', '<p>yui</p>', 0, 1, 1),
(16, 4, '2013-04-01 12:00:00', 'jkhjhjk', '<p>gjh</p>', 150, 1, 1),
(17, 4, '2013-04-15 12:00:00', 'hjkhjk', '<p>12313223</p>', 100, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `eservices_group`
--

CREATE TABLE IF NOT EXISTS `eservices_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_group` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Contenu de la table `eservices_group`
--

INSERT INTO `eservices_group` (`id`, `nom_group`, `description`, `email`) VALUES
(1, 'groupe1', 'hjkhkjh', 'mroot72000@yahoo.fr'),
(2, 'groupe2', 'hjkhkjh', 'mroot72000@yahoo.fr'),
(3, 'groupe3', 'hjkhkjh', 'mroot@yahoo.fr'),
(4, 'groupe4', 'hjkhkjh', NULL),
(5, 'ghjghjghj', 'ghjghjg', NULL),
(6, 'jkhjhkjdfdf', 'sdfsdf', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `eservice_produit`
--

CREATE TABLE IF NOT EXISTS `eservice_produit` (
  `service_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  PRIMARY KEY (`service_id`,`produit_id`),
  KEY `IDX_9E51A698ED5CA9E6` (`service_id`),
  KEY `IDX_9E51A698F347EFB` (`produit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `eservice_produit`
--

INSERT INTO `eservice_produit` (`service_id`, `produit_id`) VALUES
(1, 2),
(2, 2),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 1),
(9, 2),
(10, 2),
(10, 3),
(11, 3),
(12, 3),
(13, 1),
(14, 7),
(15, 6),
(16, 6),
(17, 3),
(17, 4);

-- --------------------------------------------------------

--
-- Structure de la table `eservice_status`
--

CREATE TABLE IF NOT EXISTS `eservice_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `eservice_status`
--

INSERT INTO `eservice_status` (`id`, `nom`, `description`) VALUES
(1, 'open', 'ouvert'),
(2, 'closed', 'ferme');

-- --------------------------------------------------------

--
-- Structure de la table `eservice_users`
--

CREATE TABLE IF NOT EXISTS `eservice_users` (
  `eservice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`eservice_id`,`user_id`),
  KEY `IDX_6B40960F44D24A06` (`eservice_id`),
  KEY `IDX_6B40960FA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `eservice_users`
--

INSERT INTO `eservice_users` (`eservice_id`, `user_id`) VALUES
(1, 7),
(2, 4),
(2, 5),
(3, 6),
(4, 6),
(4, 7),
(5, 5),
(5, 6),
(6, 4),
(6, 5),
(6, 6),
(7, 7),
(7, 8),
(8, 7),
(8, 8),
(9, 1),
(9, 4),
(10, 6),
(10, 7),
(11, 1),
(11, 4),
(12, 4),
(12, 5),
(13, 6),
(13, 7),
(14, 7),
(15, 7),
(15, 8),
(16, 5),
(17, 5),
(17, 6);

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `fos_user_group`
--

INSERT INTO `fos_user_group` (`id`, `name`, `roles`) VALUES
(1, 'GROUP_IMPORTANT', 'a:31:{i:0;s:9:"ROLE_USER";i:1;s:10:"ROLE_ADMIN";i:2;s:32:"ROLE_SONATA_USER_ADMIN_USER_LIST";i:3;s:38:"ROLE_SONATA_MEDIA_ADMIN_MEDIA_OPERATOR";i:4;s:40:"ROLE_SONATA_MEDIA_ADMIN_GALLERY_OPERATOR";i:5;s:36:"ROLE_SONATA_NEWS_ADMIN_POST_OPERATOR";i:6;s:39:"ROLE_SONATA_NEWS_ADMIN_COMMENT_OPERATOR";i:7;s:34:"ROLE_SONATA_MEDIA_ADMIN_MEDIA_LIST";i:8;s:34:"ROLE_SONATA_MEDIA_ADMIN_MEDIA_VIEW";i:9;s:36:"ROLE_SONATA_MEDIA_ADMIN_MEDIA_EXPORT";i:10;s:36:"ROLE_SONATA_MEDIA_ADMIN_GALLERY_LIST";i:11;s:38:"ROLE_SONATA_MEDIA_ADMIN_GALLERY_CREATE";i:12;s:36:"ROLE_SONATA_MEDIA_ADMIN_GALLERY_VIEW";i:13;s:46:"ROLE_SONATA_MEDIA_ADMIN_GALLERY_HAS_MEDIA_LIST";i:14;s:48:"ROLE_SONATA_MEDIA_ADMIN_GALLERY_HAS_MEDIA_CREATE";i:15;s:46:"ROLE_SONATA_MEDIA_ADMIN_GALLERY_HAS_MEDIA_VIEW";i:16;s:33:"ROLE_APPLI_EPOST_ADMIN_EPOST_LIST";i:17;s:35:"ROLE_APPLI_EPOST_ADMIN_EPOST_CREATE";i:18;s:33:"ROLE_APPLI_EPOST_ADMIN_EPOST_VIEW";i:19;s:35:"ROLE_APPLI_EPOST_ADMIN_EPOST_EXPORT";i:20;s:36:"ROLE_SONATA_MEDIA_ADMIN_MEDIA_CREATE";i:21;s:32:"ROLE_SONATA_NEWS_ADMIN_POST_EDIT";i:22;s:32:"ROLE_SONATA_NEWS_ADMIN_POST_LIST";i:23;s:34:"ROLE_SONATA_NEWS_ADMIN_POST_CREATE";i:24;s:32:"ROLE_SONATA_NEWS_ADMIN_POST_VIEW";i:25;s:34:"ROLE_SONATA_NEWS_ADMIN_POST_DELETE";i:26;s:34:"ROLE_SONATA_NEWS_ADMIN_POST_EXPORT";i:27;s:34:"ROLE_SONATA_NEWS_ADMIN_POST_MASTER";i:28;s:37:"ROLE_SONATA_NEWS_ADMIN_COMMENT_MASTER";i:29;s:33:"ROLE_APPLI_EPOST_ADMIN_EPOST_EDIT";i:30;s:35:"ROLE_APPLI_EPOST_ADMIN_EPOST_MASTER";}'),
(2, 'SUPER_ADM', 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_user`
--

CREATE TABLE IF NOT EXISTS `fos_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idgroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`),
  KEY `IDX_C560D7615481914A` (`idgroup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Contenu de la table `fos_user_user`
--

INSERT INTO `fos_user_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`, `idgroup_id`) VALUES
(1, 'mroot', 'mroot', 'mroot@example.com', 'mroot@example.com', 1, 'edomqqtxfu0ook0skc4googw808skk4', 'p0y0ANfhF44wUviBZSdUrFk75zxxsbWfI4i+83heH8MloF6RHMQiG4J1jL4vpJvBTRPh+3lQqg/tRMKSm6BCTQ==', '2013-10-06 08:52:37', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '2013-01-29 18:53:55', '2013-10-06 08:52:37', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 2),
(4, 'manuroot', 'manuroot', 'mroot72001@yahoo.fr', 'mroot72001@yahoo.fr', 1, 'gx4rfb88a9kwg408k0o8gg4cskgkg0o', 'aNb2NGlCiKNGZFMhO121QUoacOqc3iD0srQUKYEk/zhv57tc3YsfjskPXgJJAoRhSEiXuK7YzMcPfzdZzGR9uQ==', '2013-10-07 07:33:49', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '2013-01-29 18:54:34', '2013-10-07 07:33:49', NULL, 'momo', 'momo', NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 2),
(5, 'marc', 'marc', 'mar@yahoo.fr', 'mar@yahoo.fr', 1, 'o6z3ed0l9zkc4o44k0w0gsw4kkogok8', '5Y13yRCOW/3DwBwQiLPKag5M2Ta3xaijjiFmOu9+KR4mtb7+bjVsZXTTRr71NNFw7GyJt3klyuuGKT/yTBgYWA==', '2013-05-15 20:25:54', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '2013-01-29 20:54:30', '2013-05-15 20:26:11', NULL, NULL, NULL, NULL, NULL, NULL, 'fr', NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', 'toto', '123456', 2),
(6, 'root', 'root', 'root@yahoo.fr', 'root@yahoo.fr', 1, 'mh9crjcvya8ckcskcgk000wgc444c8w', 'SMlgRPbaysZuQtzCXXmF+TQRg49pAcy25PDyigStsN7um9jiPvOT7AnQUM9QTesXjYxxECwOUigCD0DgpND8VQ==', '2013-01-30 20:49:48', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '2013-01-30 20:49:33', '2013-01-30 20:49:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, NULL),
(7, 'ruru', 'ruru', 'ruru@yahoo.fr', 'ruru@yahoo.fr', 1, 'sbyxqrqp2fk8sok8ggwskcskskowg8w', 'deXTJer9OQUmz/NokYxzakTbTO+Kg/6mRJcZp31fmUbZAbxWvOllPLJAkJi63LuHPw64AUa6C7WJahDTU4rZBg==', '2013-01-31 08:36:13', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '2013-01-31 08:35:41', '2013-04-25 19:16:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 2),
(8, 'mruru', 'mruru', 'mroot72002@yahoo.fr', 'mroot72002@yahoo.fr', 1, '6858akrjm6800swk4kwwooc88c4ggo4', 'Sqq+OBn6UJJGKsLDkoDVHASiBzUfmgFCSEyUPid4rc5sVbOyY9OOR68AiX6BQ+YdSpFFgRhhCyytiTQdJ0qSlA==', '2013-02-13 21:04:46', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '2013-02-13 21:04:46', '2013-03-09 21:51:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, NULL),
(9, 'mroottest', 'mroottest', 'montest@yahoo.fr', 'montest@yahoo.fr', 1, 'mchajs6sxes0ggks48kg4ccsw4kg40c', 'jK5OPcLR3qP8ajZSB7XfnBQ/F7Lm77x95uvuriMtb9DvaOVC7J99rvI3oTXWJBuNrHFGBr51C78KipiDxyNbnw==', '2013-05-15 20:48:45', 0, 0, NULL, '4mppra87lqck84ww400gg0kkw0cogksgk88sc0oog08ss0sc0s', NULL, 'a:0:{}', 0, NULL, '2013-03-09 21:49:39', '2013-05-15 20:48:45', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 2),
(12, 'montestamoi', 'montestamoi', 'mroot72000@yahoo.fr', 'mroot72000@yahoo.fr', 1, 'evzn4v0r1rcosk40cccgs4w8wk8g0sk', 'p9dn5duFcbFi9vdv+y/SSmY5Avgx27PMfjrcBlgb8R0UAqDE2Dii29TfKeltONZPH4o40U18rV3/OzNFUMBjxQ==', '2013-03-09 22:26:35', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '2013-03-09 22:17:36', '2013-03-09 22:26:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_B3C77447A76ED395` (`user_id`),
  KEY `IDX_B3C77447FE54D947` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fos_user_user_group`
--

INSERT INTO `fos_user_user_group` (`user_id`, `group_id`) VALUES
(1, 1),
(4, 2),
(5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `media__gallery`
--

CREATE TABLE IF NOT EXISTS `media__gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `default_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `media__gallery`
--

INSERT INTO `media__gallery` (`id`, `name`, `context`, `default_format`, `enabled`, `updated_at`, `created_at`) VALUES
(1, 'momo', 'default', 'default_small', 0, '2013-01-29 20:50:36', '2013-01-29 20:50:18'),
(2, 'mo', 'default', 'default_small', 0, '2013-01-29 20:51:36', '2013-01-29 20:51:36'),
(3, 'important', 'default', 'default_small', 1, '2013-02-19 21:00:10', '2013-02-19 21:00:02');

-- --------------------------------------------------------

--
-- Structure de la table `media__gallery_media`
--

CREATE TABLE IF NOT EXISTS `media__gallery_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_80D4C5414E7AF8F` (`gallery_id`),
  KEY `IDX_80D4C541EA9FDD75` (`media_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `media__gallery_media`
--

INSERT INTO `media__gallery_media` (`id`, `position`, `enabled`, `updated_at`, `created_at`, `gallery_id`, `media_id`) VALUES
(1, 1, 0, '2013-01-29 20:50:36', '2013-01-29 20:50:18', NULL, NULL),
(2, 1, 1, '2013-01-29 20:51:36', '2013-01-29 20:51:36', NULL, NULL),
(3, 2, 1, '2013-01-29 20:51:36', '2013-01-29 20:51:36', NULL, NULL),
(4, 1, 1, '2013-02-19 21:00:10', '2013-02-19 21:00:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media__media`
--

CREATE TABLE IF NOT EXISTS `media__media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_status` int(11) NOT NULL,
  `provider_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_metadata` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `length` decimal(10,0) DEFAULT NULL,
  `content_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_size` int(11) DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_is_flushable` tinyint(1) DEFAULT NULL,
  `cdn_flush_at` datetime DEFAULT NULL,
  `cdn_status` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Contenu de la table `media__media`
--

INSERT INTO `media__media` (`id`, `name`, `description`, `enabled`, `provider_name`, `provider_status`, `provider_reference`, `provider_metadata`, `width`, `height`, `length`, `content_type`, `content_size`, `copyright`, `author_name`, `context`, `cdn_is_flushable`, `cdn_flush_at`, `cdn_status`, `updated_at`, `created_at`) VALUES
(1, 'empty.png', 'test', 1, 'sonata.media.provider.image', 1, '2778259161a5aa7336823d6ba436a6beca09916f.png', '{"filename":"empty.png"}', 128, 128, NULL, 'image/png', 34786, NULL, NULL, 'default', NULL, NULL, NULL, '2013-05-07 18:56:48', '2013-01-29 20:48:00'),
(2, 'important.png', NULL, 0, 'sonata.media.provider.image', 1, '7f3f0e5d356da7f9393e91bde8bd6a8ebbf25ed1.png', '{"filename":"important.png"}', 384, 270, NULL, 'image/png', 33167, NULL, NULL, 'default', NULL, NULL, NULL, '2013-01-29 20:49:35', '2013-01-29 20:49:35'),
(3, 'full.png', NULL, 1, 'sonata.media.provider.image', 1, '20b0ff0d23e76edbe2b7173b9564097a3ac24782.png', '{"filename":"full.png"}', 128, 128, NULL, 'image/png', 24171, NULL, 'yt', 'default', 1, NULL, NULL, '2013-03-17 17:40:24', '2013-03-17 17:40:12'),
(4, 'mroot.jpg', NULL, 1, 'sonata.media.provider.image', 1, '990ec9acea52555509c7e2d47d8122707b47548b.jpeg', '{"filename":"mroot.jpg"}', 323, 318, NULL, 'image/jpeg', 7728, NULL, 'manu', 'default', 1, NULL, NULL, '2013-05-06 08:24:26', '2013-05-06 08:22:27'),
(5, 'important1.png', NULL, 1, 'sonata.media.provider.image', 1, '8460941a24049735e1e8923b27e2f32b43be19b0.png', '{"filename":"important1.png"}', 283, 222, NULL, 'image/png', 87504, NULL, 'manu', 'default', 1, NULL, NULL, '2013-05-06 08:24:17', '2013-05-06 08:24:07'),
(6, '51603dde20000.png', NULL, 0, 'sonata.media.provider.image', 1, '3620f0b0c7f591445745183d8cb586750b7fd22b.png', '{"filename":"51603dde20000.png"}', 384, 270, NULL, 'image/png', 33167, NULL, NULL, 'default', NULL, NULL, NULL, '2013-05-06 20:23:17', '2013-05-06 20:23:17'),
(7, '516048f265a5e.jpeg', NULL, 0, 'sonata.media.provider.image', 1, '317ef0d6de4062c8baeca9709576aca1dc1823d0.jpeg', '{"filename":"516048f265a5e.jpeg"}', 270, 270, NULL, 'image/jpeg', 11009, NULL, NULL, 'default', NULL, NULL, NULL, '2013-05-07 18:32:31', '2013-05-07 18:32:31'),
(8, 'aaaaa.png', NULL, 0, 'sonata.media.provider.image', 1, '0023fbefc1fb834d9891067232af0e2bf4fca360.png', '{"filename":"aaaaa.png"}', 250, 250, NULL, 'image/png', 42292, NULL, NULL, 'manuroot', NULL, NULL, NULL, '2013-05-07 19:37:42', '2013-05-07 19:37:42'),
(9, 'empty.png', NULL, 0, 'sonata.media.provider.image', 1, '297dc88abe74e7d57ba274bd9c75154049861e29.png', '{"filename":"empty.png"}', 128, 128, NULL, 'image/png', 34786, NULL, NULL, 'manuroot', NULL, NULL, NULL, '2013-05-07 19:38:00', '2013-05-07 19:38:00'),
(10, '51603dde20000.png', NULL, 0, 'sonata.media.provider.image', 1, '80727cd1eaf998c6524f44ceefe48cf007c61764.png', '{"filename":"51603dde20000.png"}', 384, 270, NULL, 'image/png', 33167, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:38:46', '2013-05-07 19:38:46'),
(11, '517eb04a19ea9.jpeg', NULL, 0, 'sonata.media.provider.image', 1, '7e2bdb45feca9c25495f65db3fca60b6720e2ca9.jpeg', '{"filename":"517eb04a19ea9.jpeg"}', 149, 99, NULL, 'image/jpeg', 8132, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:45:32', '2013-05-07 19:45:32'),
(12, '517eb04a19ea9.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'e9660c7a76f3f52888acb9f7b61cb6ab1d6d4736.jpeg', '{"filename":"517eb04a19ea9.jpeg"}', 149, 99, NULL, 'image/jpeg', 8132, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:46:40', '2013-05-07 19:46:40'),
(13, '517eb04a19ea9.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'e144c09e91239a55a9a3ec4236e1858b0ae49019.jpeg', '{"filename":"517eb04a19ea9.jpeg"}', 149, 99, NULL, 'image/jpeg', 8132, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:47:11', '2013-05-07 19:47:11'),
(14, '516054352461e.jpeg', NULL, 0, 'sonata.media.provider.image', 1, '48b92b8552d57afd3705e701994fbce95a37a870.jpeg', '{"filename":"516054352461e.jpeg"}', 500, 500, NULL, 'image/jpeg', 44793, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:49:07', '2013-05-07 19:49:07'),
(15, '5160468814aae.png', NULL, 0, 'sonata.media.provider.image', 1, '1f0c8ee5da9e82a30380c88e4f0bd77623c13532.png', '{"filename":"5160468814aae.png"}', 128, 128, NULL, 'image/png', 34786, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:50:03', '2013-05-07 19:50:03'),
(16, '5160468814aae.png', NULL, 0, 'sonata.media.provider.image', 1, '373fa1708baf585c5eb78a64d33754f3bc16c814.png', '{"filename":"5160468814aae.png"}', 128, 128, NULL, 'image/png', 34786, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:50:21', '2013-05-07 19:50:21'),
(17, '5160468814aae.png', NULL, 0, 'sonata.media.provider.image', 1, '17e2b787f4d76c4530ac01a654bcf426818c9cff.png', '{"filename":"5160468814aae.png"}', 128, 128, NULL, 'image/png', 34786, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:50:35', '2013-05-07 19:50:35'),
(18, '5160468814aae.png', NULL, 0, 'sonata.media.provider.image', 1, '766d43f31f6b263cb18665f24c7e3c81e5017510.png', '{"filename":"5160468814aae.png"}', 128, 128, NULL, 'image/png', 34786, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:50:50', '2013-05-07 19:50:50'),
(19, '5160468814aae.png', NULL, 0, 'sonata.media.provider.image', 1, '01d1cb49de11203a885a709b5c79fd94fa83e462.png', '{"filename":"5160468814aae.png"}', 128, 128, NULL, 'image/png', 34786, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:51:02', '2013-05-07 19:51:02'),
(20, '5160468814aae.png', NULL, 0, 'sonata.media.provider.image', 1, '6e288baff5185f3e9eee50a0819ebb1aab88f40e.png', '{"filename":"5160468814aae.png"}', 128, 128, NULL, 'image/png', 34786, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:51:19', '2013-05-07 19:51:19'),
(21, '5160468814aae.png', NULL, 0, 'sonata.media.provider.image', 1, '5d0e41066cf7f60c9e6003e37b7281c953129e35.png', '{"filename":"5160468814aae.png"}', 128, 128, NULL, 'image/png', 34786, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:53:04', '2013-05-07 19:53:04'),
(22, '5160468814aae.png', NULL, 0, 'sonata.media.provider.image', 1, '142e5059d2ce784b3c593774aa084787a0428ffb.png', '{"filename":"5160468814aae.png"}', 128, 128, NULL, 'image/png', 34786, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:53:51', '2013-05-07 19:53:51'),
(23, '5160468814aae.png', NULL, 0, 'sonata.media.provider.image', 1, '9195b6e37c4ad4d844b99d30ba47eb36b793f0e0.png', '{"filename":"5160468814aae.png"}', 128, 128, NULL, 'image/png', 34786, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 19:54:03', '2013-05-07 19:54:03'),
(24, '516048f265a5e.jpeg', NULL, 0, 'sonata.media.provider.image', 1, '4120767663dd224b0cadcb560b40f84f4b194dba.jpeg', '{"filename":"516048f265a5e.jpeg"}', 270, 270, NULL, 'image/jpeg', 11009, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-07 20:18:05', '2013-05-07 20:18:05'),
(25, '516043a8e07e2.png', NULL, 0, 'sonata.media.provider.image', 1, 'cf850d56b028d926318091203bc49b2ec1d2f083.png', '{"filename":"516043a8e07e2.png"}', 128, 128, NULL, 'image/png', 26114, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-08 09:27:24', '2013-05-08 09:27:24'),
(26, '5170e183d22a4.png', NULL, 0, 'sonata.media.provider.image', 1, '3b43261d727e3afe2bd3b7cda1fd498dfb795200.png', '{"filename":"5170e183d22a4.png"}', 120, 120, NULL, 'image/png', 30447, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-08 09:27:51', '2013-05-08 09:27:51'),
(27, '5160434a4dc42.png', NULL, 0, 'sonata.media.provider.image', 1, '5c954af49528e6709bb8c9ad132ce5d2e8b6617b.png', '{"filename":"5160434a4dc42.png"}', 128, 128, NULL, 'image/png', 26114, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-10 08:52:25', '2013-05-10 08:52:25'),
(28, 'empty.png', NULL, 0, 'sonata.media.provider.image', 1, '1e4365f2453a0b72e7505cf6dcc946aef495957e.png', '{"filename":"empty.png"}', 128, 128, NULL, 'image/png', 34786, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-10 08:53:16', '2013-05-10 08:53:16'),
(29, 'mroot.jpg', NULL, 1, 'sonata.media.provider.image', 1, 'ee5f6f0a22dd7b08b9cbb2c41ce06e3b4faf9bdf.jpeg', '{"filename":"mroot.jpg"}', 323, 318, NULL, 'image/jpeg', 7728, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-10-06 16:12:32', '2013-05-11 10:15:19'),
(30, 'mroot.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'b6ee5ffb0d6f99d2d3cecf768b02a1de30d88bab.jpeg', '{"filename":"mroot.jpg"}', 323, 318, NULL, 'image/jpeg', 7728, NULL, 'marc', 'default', NULL, NULL, NULL, '2013-05-11 22:48:27', '2013-05-11 22:48:27'),
(31, 'logo.png', NULL, 0, 'sonata.media.provider.image', 1, 'd5fe831fbb17c070a1cab3e513076af5d5e73348.png', '{"filename":"logo.png"}', 128, 128, NULL, 'image/png', 26114, NULL, 'marc', 'default', NULL, NULL, NULL, '2013-05-11 22:48:53', '2013-05-11 22:48:53'),
(32, '516048f265a5e.jpeg', NULL, 0, 'sonata.media.provider.image', 1, '18c131d30d2a6a2989a263203ffd6d134c7873b1.jpeg', '{"filename":"516048f265a5e.jpeg"}', 270, 270, NULL, 'image/jpeg', 11009, NULL, 'manuroot', 'default', NULL, NULL, NULL, '2013-05-11 23:33:54', '2013-05-11 23:33:54'),
(33, 'cac.jpg', NULL, 1, 'sonata.media.provider.image', 1, '117184d760654a184d6583aecf151d1d2bec900e.jpeg', '{"filename":"cac.jpg"}', 1680, 1050, NULL, 'image/jpeg', 337881, NULL, NULL, 'default', 0, NULL, NULL, '2013-10-06 08:35:59', '2013-10-06 08:35:09'),
(34, 'cac.jpg', NULL, 0, 'sonata.media.provider.image', 1, '3804f5c0d5e4dd64ac9936b2ec5394263c35aaf5.jpeg', '{"filename":"cac.jpg"}', 1680, 1050, NULL, 'image/jpeg', 337881, NULL, NULL, 'default', NULL, NULL, NULL, '2013-10-06 08:39:13', '2013-10-06 08:39:13'),
(35, 'cac.jpg', NULL, 0, 'sonata.media.provider.image', 1, '6e078b3c33ea5aadd44c1a3635699f68564ba10e.jpeg', '{"filename":"cac.jpg"}', 1680, 1050, NULL, 'image/jpeg', 337881, NULL, NULL, 'default', NULL, NULL, NULL, '2013-10-06 08:40:02', '2013-10-06 08:40:02'),
(36, 'cac.jpg', NULL, 0, 'sonata.media.provider.image', 1, '8b80cc44e945db01d62f8fb8c02f93e3ef03e39b.jpeg', '{"filename":"cac.jpg"}', 1680, 1050, NULL, 'image/jpeg', 337881, NULL, NULL, 'default', NULL, NULL, NULL, '2013-10-06 08:53:08', '2013-10-06 08:53:08');

-- --------------------------------------------------------

--
-- Structure de la table `news__category`
--

CREATE TABLE IF NOT EXISTS `news__category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `news__category`
--

INSERT INTO `news__category` (`id`, `name`, `enabled`, `slug`, `description`, `count`, `created_at`, `updated_at`) VALUES
(1, 'test', 1, 'test', 'ppp ghjhghgj', 0, '2013-02-11 20:32:39', '2013-03-15 19:31:24'),
(2, 'ffff', 1, 'ffff', NULL, 0, '2013-02-22 23:14:41', '2013-02-22 23:14:41'),
(3, 'macategorie', 1, 'macategorie', 'amoi categorie', 0, '2013-02-23 16:14:46', '2013-02-23 16:30:25');

-- --------------------------------------------------------

--
-- Structure de la table `news__comment`
--

CREATE TABLE IF NOT EXISTS `news__comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A90210404B89032C` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Contenu de la table `news__comment`
--

INSERT INTO `news__comment` (`id`, `post_id`, `name`, `url`, `email`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'momo', 'http://trkltj.fr', 'mroo@yahoo.fr', 'jklj kljkllk', 1, '2013-02-11 20:35:22', '2013-02-11 20:35:22'),
(2, 2, 'momo', NULL, 'mroot72000@yahoo.fr', 'pas d''accord', 1, '2013-02-19 20:23:55', '2013-02-19 20:23:55'),
(3, 2, 'ruuuu', NULL, 'mroot72000@yahoo.fr', 'hkjhh hjkhkjhjk \r\n<h1>fdssdfsd</h1>', 1, '2013-02-19 20:30:26', '2013-02-19 20:30:26'),
(4, 2, 'opopop', NULL, 'mroot72000@yahoo.fr', '<p><strong>jlkjlk</strong></p>\r\n<p><strong><em>jlkj uiuio</em><br /></strong></p>', 1, '2013-02-19 21:49:12', '2013-02-19 21:50:42'),
(5, 3, 'popo', NULL, 'mroot72000@yahoo.fr', '<p>ghjgh<strong>ghjjghgjhgh</strong> hjghg</p>', 1, '2013-02-20 07:46:20', '2013-02-20 07:48:11'),
(6, 4, 'toto', NULL, 'mroot72000@yahoo.fr', '<p><strong>hkjhk</strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span style="text-decoration: underline;">Remarques</span><br /></strong></p>\r\n<p><strong><span style="text-decoration: underline;">&nbsp;</span></strong></p>\r\n<p>petit test<strong><span style="text-decoration: underline;"><br /></span></strong></p>', 1, '2013-02-22 08:45:16', '2013-02-22 08:45:16'),
(7, 3, 'momo', NULL, NULL, '<p>klmklm lmklmk<strong> klmkmklm klmml</strong></p>', 1, '2013-03-15 08:29:58', '2013-03-15 08:29:58'),
(8, 2, 'momo', NULL, NULL, 'ghghfgfhgfh', 1, '2013-03-17 18:25:26', '2013-03-17 18:25:26');

-- --------------------------------------------------------

--
-- Structure de la table `news__post`
--

CREATE TABLE IF NOT EXISTS `news__post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `abstract` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `raw_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_formatter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publication_date_start` datetime DEFAULT NULL,
  `comments_enabled` tinyint(1) NOT NULL,
  `comments_close_at` datetime DEFAULT NULL,
  `comments_default_status` int(11) NOT NULL,
  `comments_count` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7D109BC83DA5256D` (`image_id`),
  KEY `IDX_7D109BC8F675F31B` (`author_id`),
  KEY `IDX_7D109BC812469DE2` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `news__post`
--

INSERT INTO `news__post` (`id`, `image_id`, `author_id`, `category_id`, `title`, `abstract`, `content`, `raw_content`, `content_formatter`, `enabled`, `slug`, `publication_date_start`, `comments_enabled`, `comments_close_at`, `comments_default_status`, `comments_count`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, 'MONTEST', 'jkxkjlkd fdksfjlsd jkfljsdkfjdkfjlkl', '<p>jkh hjkhk hhjhkjhjkh</p>\n<h3>TEST</h3>\n<p><img src="../../../../../uploads/media/default/0001/01/2778259161a5aa7336823d6ba436a6beca09916f.png" alt="monimage" width="128" height="128" /></p>\n<p>Differences Between HTML 4.01 and HTML5 In HTML5, the tag defines a thematic break. In HTML 4.01, the tag represents a horizontal rule. However, the <code>$a=12</code> tag may still be displayed as a horizontal rule in visual browsers, but is now defined in semantic terms, rather than presentational terms. All layout attributes are deprecated in HTML 4.01, and are not supported in HTML5. Use CSS to style the element instead. Differences Between HTML and XHTML In HTML, the tag has no end tag. In XHTML, the tag must be properly closed, like this: .</p>\n<hr />\n<p>&nbsp;</p>\n<p>petit essai: <span style="color: #ff0000;"><strong>fdgdfg</strong></span></p>', '<p>jkh hjkhk hhjhkjhjkh</p>\r\n<h3>TEST</h3>\r\n<p><img src="../../../../../uploads/media/default/0001/01/2778259161a5aa7336823d6ba436a6beca09916f.png" alt="monimage" width="128" height="128" /></p>\r\n<p>Differences Between HTML 4.01 and HTML5 In HTML5, the tag defines a thematic break. In HTML 4.01, the tag represents a horizontal rule. However, the <code>$a=12</code> tag may still be displayed as a horizontal rule in visual browsers, but is now defined in semantic terms, rather than presentational terms. All layout attributes are deprecated in HTML 4.01, and are not supported in HTML5. Use CSS to style the element instead. Differences Between HTML and XHTML In HTML, the tag has no end tag. In XHTML, the tag must be properly closed, like this: .</p>\r\n<hr />\r\n<p>&nbsp;</p>\r\n<p>petit essai: <span style="color: #ff0000;"><strong>fdgdfg</strong></span></p>', 'richhtml', 1, 'montest', '2013-02-11 20:32:00', 1, NULL, 1, 1, '2013-02-11 20:33:11', '2013-05-06 20:24:17'),
(2, NULL, 1, 1, 'Mon blog sujet1', 'dfgjdflkg dgdgkdfjgdflkg jkjgkldfjgkldf\r\nTest manu', '<p>hfgh hfhfh\nghfhfh\nhf\ngh\nfgh\nh\nfgh</p>\n', 'hfgh hfhfh\r\nghfhfh\r\nhf\r\ngh\r\nfgh\r\nh\r\nfgh', 'markdown', 1, 'mon-blog-sujet1', '2013-02-19 19:58:00', 1, NULL, 1, 4, '2013-02-19 19:59:38', '2013-03-20 19:49:14'),
(3, NULL, 1, 1, 'test a moi', 'dfsd dsfsdfsdf dsfsd fsd s d f df dfsd f', '<p>dgdfgdf &lt;h3&gt; fdsd&lt;/h3&gt;</p>\n<p>fdsf dfsdf dfdfdfdsd sdfdsfsdf</p>\n<p>fdfdsfsdfsd dsfsdfsdf dsfsd fsd s d f df dfsd f</p>\n<p>Ah oui pas mal.</p>\n\n<p>Je vais essayer de bidouiller de mon côté pour raccrocher les wagons ;).</p>\n\n<p>\nSinon j''ai sais plus sur le site que souhaiterais faire mon pote,  j''ai essayer de border le truc , du coup maintenant je pense que ça peut être jouable.\n</p><p>\nFaut que je précise ça sur papier ça sera plus simple pour que tu me donnes ton avis.\n</p>', '<p>dgdfgdf &lt;h3&gt; fdsd&lt;/h3&gt;</p>\r\n<p>fdsf dfsdf dfdfdfdsd sdfdsfsdf</p>\r\n<p>fdfdsfsdfsd dsfsdfsdf dsfsd fsd s d f df dfsd f</p>\r\n<p>Ah oui pas mal.</p>\r\n\r\n<p>Je vais essayer de bidouiller de mon côté pour raccrocher les wagons ;).</p>\r\n\r\n<p>\r\nSinon j''ai sais plus sur le site que souhaiterais faire mon pote,  j''ai essayer de border le truc , du coup maintenant je pense que ça peut être jouable.\r\n</p><p>\r\nFaut que je précise ça sur papier ça sera plus simple pour que tu me donnes ton avis.\r\n</p>', 'richhtml', 1, 'test-a-moi', '2013-02-20 07:39:00', 1, NULL, 1, 2, '2013-02-20 07:40:59', '2013-02-23 09:30:20'),
(4, NULL, 1, 3, 'Premiers pas avec Symfony 2', 'Les Bundles', '* Les Bundles\n\n* Les injections', '* Les Bundles\r\n\r\n* Les injections', 'richhtml', 1, 'premiers-pas-avec-symfony-2', '2013-02-21 08:34:00', 1, NULL, 1, 1, '2013-02-21 08:35:21', '2013-02-23 16:15:57');

-- --------------------------------------------------------

--
-- Structure de la table `news__post_tag`
--

CREATE TABLE IF NOT EXISTS `news__post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `IDX_682B20514B89032C` (`post_id`),
  KEY `IDX_682B2051BAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `news__post_tag`
--

INSERT INTO `news__post_tag` (`post_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `news__tag`
--

CREATE TABLE IF NOT EXISTS `news__tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `news__tag`
--

INSERT INTO `news__tag` (`id`, `name`, `enabled`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'tototag', 1, 'tototag', '2013-02-11 20:33:04', '2013-02-22 23:29:41'),
(2, 'Symfony2', 1, 'symfony2', '2013-02-19 19:59:25', '2013-02-22 23:56:09'),
(3, 'ffssfdfd', 1, 'ffssfdfd', '2013-02-22 23:29:01', '2013-02-22 23:29:01');

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `color` int(11) DEFAULT NULL,
  `xyz` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dt` datetime NOT NULL,
  `wh` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `categories` int(11) DEFAULT NULL,
  `classement` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `proprietaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories` (`categories`),
  KEY `color` (`color`),
  KEY `IDX_11BA68C69E399D6` (`proprietaire`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Contenu de la table `notes`
--

INSERT INTO `notes` (`id`, `text`, `name`, `color`, `xyz`, `dt`, `wh`, `categories`, `classement`, `proprietaire`) VALUES
(1, 'hhhhh', 'khhjkh', 2, '9x88x5', '2013-01-21 22:28:00', '324.76666x211.76666', 2, 'main', 4),
(2, 'jlkj', 'jkljl', 1, '578x89x21', '2011-03-01 02:00:00', '268x200', 1, '20', 6),
(3, 'ghjjghhg', 'montest', 1, '582x311x23', '2013-01-25 18:58:19', '350x248', 1, 'main', NULL),
(4, 'jhh', 'hh', 1, '937x313x27', '2013-01-25 18:58:19', '249x200', 1, 'main', NULL),
(5, 'ghjjhjkgkkkhhg', 'gjhjghhjg', 2, '344x87x13', '2013-01-25 18:58:00', '226x214', 1, 'main', 8),
(6, 'jhhhh', 'kkkkh', 1, '853x89x25', '2013-01-25 18:58:39', '200x200', 1, 'main', NULL),
(7, 'ghjjddkhhg', 'gddjg', 1, '221x310x19', '2013-01-25 18:58:51', '350x228', 1, 'main', NULL),
(8, 'jhddhhh', 'dd', 1, '9x309x17', '2013-01-25 18:58:51', '206x200', 1, 'main', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `notes_categories`
--

CREATE TABLE IF NOT EXISTS `notes_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `notes_categories`
--

INSERT INTO `notes_categories` (`id`, `nom`) VALUES
(1, 'hkjhjk'),
(2, 'momo');

-- --------------------------------------------------------

--
-- Structure de la table `notes_color`
--

CREATE TABLE IF NOT EXISTS `notes_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `notes_color`
--

INSERT INTO `notes_color` (`id`, `nom`) VALUES
(1, 'yellow'),
(2, 'green');

-- --------------------------------------------------------

--
-- Structure de la table `Product`
--

CREATE TABLE IF NOT EXISTS `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `Product`
--

INSERT INTO `Product` (`id`, `title`, `content`) VALUES
(1, 'produita', 'dfgdf gffgdf'),
(2, 'produitb', 'hjkjhglk');

-- --------------------------------------------------------

--
-- Structure de la table `projet_applis`
--

CREATE TABLE IF NOT EXISTS `projet_applis` (
  `certificatsprojet_id` int(11) NOT NULL,
  `certificatsapplis_id` int(11) NOT NULL,
  PRIMARY KEY (`certificatsprojet_id`,`certificatsapplis_id`),
  KEY `IDX_FED04F7512885A4B` (`certificatsprojet_id`),
  KEY `IDX_FED04F75F4FED186` (`certificatsapplis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `projet_applis`
--

INSERT INTO `projet_applis` (`certificatsprojet_id`, `certificatsapplis_id`) VALUES
(2, 12),
(2, 13),
(2, 15),
(3, 11),
(3, 12),
(3, 13),
(3, 15),
(25, 3),
(25, 8);

-- --------------------------------------------------------

--
-- Structure de la table `projet_documents`
--

CREATE TABLE IF NOT EXISTS `projet_documents` (
  `projet_id` int(11) NOT NULL,
  `documentbb_id` int(11) NOT NULL,
  PRIMARY KEY (`projet_id`,`documentbb_id`),
  KEY `IDX_814E955CD76E0C12` (`documentbb_id`),
  KEY `IDX_814E955CC18272` (`projet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `projet_documents`
--

INSERT INTO `projet_documents` (`projet_id`, `documentbb_id`) VALUES
(2, 22),
(2, 23),
(3, 29);

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=74 ;

--
-- Contenu de la table `tag`
--

INSERT INTO `tag` (`id`, `nom`, `description`) VALUES
(62, 'tag1', NULL),
(64, 'ghjhjhg', NULL),
(65, 'popop', NULL),
(66, 'momop', NULL),
(67, 'tag2', NULL),
(68, 'jkl', NULL),
(69, 'tag3', NULL),
(71, 'tagtest', NULL),
(73, 'gggg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `tasks`
--

INSERT INTO `tasks` (`id`, `nom`) VALUES
(1, 'ghj'),
(2, 'uiouoiuio'),
(3, 'matache1');

-- --------------------------------------------------------

--
-- Structure de la table `task_tag`
--

CREATE TABLE IF NOT EXISTS `task_tag` (
  `task_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`,`tag_id`),
  KEY `IDX_6C0B4F048DB60186` (`task_id`),
  KEY `IDX_6C0B4F04BAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `task_tag`
--

INSERT INTO `task_tag` (`task_id`, `tag_id`) VALUES
(1, 62),
(2, 64),
(2, 73),
(3, 65),
(3, 66);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`);

--
-- Contraintes pour la table `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `certificats_center`
--
ALTER TABLE `certificats_center`
  ADD CONSTRAINT `FK_5CB1233F2FB3D0EE` FOREIGN KEY (`project`) REFERENCES `certificats_projet` (`id`),
  ADD CONSTRAINT `FK_5CB1233FDBA5E563` FOREIGN KEY (`type_cert`) REFERENCES `certificats_filetype` (`id`),
  ADD CONSTRAINT `FK_5CB1233FEE45BDBF` FOREIGN KEY (`picture_id`) REFERENCES `media__media` (`id`);

--
-- Contraintes pour la table `certificats_xapplis`
--
ALTER TABLE `certificats_xapplis`
  ADD CONSTRAINT `FK_A5299796E6B709BF` FOREIGN KEY (`applis_id`) REFERENCES `certificats_applis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E95FD4924B7B2B4E` FOREIGN KEY (`certificatscenter_id`) REFERENCES `certificats_center` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `changements`
--
ALTER TABLE `changements`
  ADD CONSTRAINT `FK_559C002E5D37D0F1` FOREIGN KEY (`id_status`) REFERENCES `changements_status` (`id`),
  ADD CONSTRAINT `FK_559C002E665DA613` FOREIGN KEY (`demandeur`) REFERENCES `chrono_user` (`id`),
  ADD CONSTRAINT `FK_559C002E76222944` FOREIGN KEY (`id_projet`) REFERENCES `certificats_projet` (`id`);

--
-- Contraintes pour la table `changements_applis`
--
ALTER TABLE `changements_applis`
  ADD CONSTRAINT `FK_52ED6FE0AD2B71E0` FOREIGN KEY (`changements_id`) REFERENCES `changements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_52ED6FE0E6B709BF` FOREIGN KEY (`applis_id`) REFERENCES `certificats_applis` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `changements_comments`
--
ALTER TABLE `changements_comments`
  ADD CONSTRAINT `FK_4F460F7785698464` FOREIGN KEY (`changement_id`) REFERENCES `changements` (`id`),
  ADD CONSTRAINT `FK_4F460F778D93D649` FOREIGN KEY (`user`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `changements_documents`
--
ALTER TABLE `changements_documents`
  ADD CONSTRAINT `FK_B77A8758517A4C7C` FOREIGN KEY (`docchangements_id`) REFERENCES `changements_fichiers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B77A8758AD2B71E0` FOREIGN KEY (`changements_id`) REFERENCES `changements` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `changements_environnements`
--
ALTER TABLE `changements_environnements`
  ADD CONSTRAINT `FK_C4056011461AD5D9` FOREIGN KEY (`environnements_id`) REFERENCES `environnement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C4056011AD2B71E0` FOREIGN KEY (`changements_id`) REFERENCES `changements` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `changements_users`
--
ALTER TABLE `changements_users`
  ADD CONSTRAINT `FK_3EFC9F74AD2B71E0` FOREIGN KEY (`changements_id`) REFERENCES `changements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3EFC9F74B3D9BAE1` FOREIGN KEY (`chronouser_id`) REFERENCES `chrono_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `changement_documents`
--
ALTER TABLE `changement_documents`
  ADD CONSTRAINT `FK_C9C94DEBAD2B71E0` FOREIGN KEY (`changements_id`) REFERENCES `changements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C9C94DEBC33F7837` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `chrono_user`
--
ALTER TABLE `chrono_user`
  ADD CONSTRAINT `FK_83A0876D834505F5` FOREIGN KEY (`id_group`) REFERENCES `chrono_usergroup` (`id`);

--
-- Contraintes pour la table `demande_usergroup`
--
ALTER TABLE `demande_usergroup`
  ADD CONSTRAINT `FK_3F4882C223DB04FD` FOREIGN KEY (`id_userparrain`) REFERENCES `fos_user_user` (`id`),
  ADD CONSTRAINT `FK_3F4882C26B3CA4B` FOREIGN KEY (`id_user`) REFERENCES `fos_user_user` (`id`),
  ADD CONSTRAINT `FK_3F4882C2834505F5` FOREIGN KEY (`id_group`) REFERENCES `eservices_group` (`id`);

--
-- Contraintes pour la table `epost`
--
ALTER TABLE `epost`
  ADD CONSTRAINT `FK_EC3EBCB1497DD634` FOREIGN KEY (`categorie`) REFERENCES `epost_categories` (`id`),
  ADD CONSTRAINT `FK_EC3EBCB14F2148D` FOREIGN KEY (`imageMedia`) REFERENCES `media__media` (`id`),
  ADD CONSTRAINT `FK_EC3EBCB15D37D0F1` FOREIGN KEY (`id_status`) REFERENCES `epost_status` (`id`),
  ADD CONSTRAINT `FK_EC3EBCB169E399D6` FOREIGN KEY (`proprietaire`) REFERENCES `fos_user_user` (`id`),
  ADD CONSTRAINT `FK_EC3EBCB1E39AD4CA` FOREIGN KEY (`globalnotes_id`) REFERENCES `epost_globalnotes` (`id`);

--
-- Contraintes pour la table `epost_categories`
--
ALTER TABLE `epost_categories`
  ADD CONSTRAINT `FK_61FB578A834505F5` FOREIGN KEY (`id_group`) REFERENCES `eservices_group` (`id`);

--
-- Contraintes pour la table `epost_comments`
--
ALTER TABLE `epost_comments`
  ADD CONSTRAINT `FK_36C2C18A2BCCADE4` FOREIGN KEY (`epost_id`) REFERENCES `epost` (`id`),
  ADD CONSTRAINT `FK_36C2C18A8D93D649` FOREIGN KEY (`user`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `epost_commentsthread`
--
ALTER TABLE `epost_commentsthread`
  ADD CONSTRAINT `FK_A6DC05F92BCCADE4` FOREIGN KEY (`epost_id`) REFERENCES `epost` (`id`),
  ADD CONSTRAINT `FK_A6DC05F9E2904019` FOREIGN KEY (`thread_id`) REFERENCES `epost_comments_threads` (`id`),
  ADD CONSTRAINT `FK_A6DC05F9F675F31B` FOREIGN KEY (`author_id`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `epost_notes`
--
ALTER TABLE `epost_notes`
  ADD CONSTRAINT `FK_3F8EC9834B89032C` FOREIGN KEY (`post_id`) REFERENCES `epost` (`id`),
  ADD CONSTRAINT `FK_3F8EC9838D93D649` FOREIGN KEY (`user`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `epost_posts_tags`
--
ALTER TABLE `epost_posts_tags`
  ADD CONSTRAINT `FK_8EE4BC7D4B89032C` FOREIGN KEY (`post_id`) REFERENCES `epost` (`id`),
  ADD CONSTRAINT `FK_8EE4BC7DBAD26311` FOREIGN KEY (`tag_id`) REFERENCES `epost_tags` (`id`);

--
-- Contraintes pour la table `epost_tags`
--
ALTER TABLE `epost_tags`
  ADD CONSTRAINT `FK_94A440C1834505F5` FOREIGN KEY (`id_group`) REFERENCES `eservices_group` (`id`);

--
-- Contraintes pour la table `epost_vote`
--
ALTER TABLE `epost_vote`
  ADD CONSTRAINT `FK_A1085183F8697D13` FOREIGN KEY (`comment_id`) REFERENCES `epost_commentsthread` (`id`);

--
-- Contraintes pour la table `eproduits`
--
ALTER TABLE `eproduits`
  ADD CONSTRAINT `FK_2BF2D0A0497DD634` FOREIGN KEY (`categorie`) REFERENCES `eproduits_categories` (`id`),
  ADD CONSTRAINT `FK_2BF2D0A05D37D0F1` FOREIGN KEY (`id_status`) REFERENCES `eproduits_status` (`id`),
  ADD CONSTRAINT `FK_2BF2D0A069E399D6` FOREIGN KEY (`proprietaire`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `eproduits_comments`
--
ALTER TABLE `eproduits_comments`
  ADD CONSTRAINT `FK_D6DF9BF8D93D649` FOREIGN KEY (`user`) REFERENCES `fos_user_user` (`id`),
  ADD CONSTRAINT `FK_D6DF9BFF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `eproduits` (`id`);

--
-- Contraintes pour la table `eproduits_history`
--
ALTER TABLE `eproduits_history`
  ADD CONSTRAINT `FK_BC37D3F829A5EC27` FOREIGN KEY (`produit`) REFERENCES `eproduits` (`id`),
  ADD CONSTRAINT `FK_BC37D3F8952067DE` FOREIGN KEY (`emprunteur`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `eproduits_notes`
--
ALTER TABLE `eproduits_notes`
  ADD CONSTRAINT `FK_3BD538A8D93D649` FOREIGN KEY (`user`) REFERENCES `fos_user_user` (`id`),
  ADD CONSTRAINT `FK_3BD538AF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `eproduits` (`id`);

--
-- Contraintes pour la table `eservices`
--
ALTER TABLE `eservices`
  ADD CONSTRAINT `FK_E6EDEE455D37D0F1` FOREIGN KEY (`id_status`) REFERENCES `eservice_status` (`id`),
  ADD CONSTRAINT `FK_E6EDEE45665DA613` FOREIGN KEY (`demandeur`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `eservice_produit`
--
ALTER TABLE `eservice_produit`
  ADD CONSTRAINT `FK_9E51A698ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `eservices` (`id`),
  ADD CONSTRAINT `FK_9E51A698F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `eproduits` (`id`);

--
-- Contraintes pour la table `eservice_users`
--
ALTER TABLE `eservice_users`
  ADD CONSTRAINT `FK_6B40960F44D24A06` FOREIGN KEY (`eservice_id`) REFERENCES `eservices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6B40960FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fos_user_user`
--
ALTER TABLE `fos_user_user`
  ADD CONSTRAINT `FK_C560D7615481914A` FOREIGN KEY (`idgroup_id`) REFERENCES `eservices_group` (`id`);

--
-- Contraintes pour la table `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  ADD CONSTRAINT `FK_80D4C5414E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `media__gallery` (`id`),
  ADD CONSTRAINT `FK_80D4C541EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`);

--
-- Contraintes pour la table `news__comment`
--
ALTER TABLE `news__comment`
  ADD CONSTRAINT `FK_A90210404B89032C` FOREIGN KEY (`post_id`) REFERENCES `news__post` (`id`);

--
-- Contraintes pour la table `news__post`
--
ALTER TABLE `news__post`
  ADD CONSTRAINT `FK_7D109BC812469DE2` FOREIGN KEY (`category_id`) REFERENCES `news__category` (`id`),
  ADD CONSTRAINT `FK_7D109BC83DA5256D` FOREIGN KEY (`image_id`) REFERENCES `media__media` (`id`),
  ADD CONSTRAINT `FK_7D109BC8F675F31B` FOREIGN KEY (`author_id`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `news__post_tag`
--
ALTER TABLE `news__post_tag`
  ADD CONSTRAINT `FK_682B20514B89032C` FOREIGN KEY (`post_id`) REFERENCES `news__post` (`id`),
  ADD CONSTRAINT `FK_682B2051BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `news__tag` (`id`);

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `FK_11BA68C3AF34668` FOREIGN KEY (`categories`) REFERENCES `notes_categories` (`id`),
  ADD CONSTRAINT `FK_11BA68C665648E9` FOREIGN KEY (`color`) REFERENCES `notes_color` (`id`),
  ADD CONSTRAINT `FK_11BA68C69E399D6` FOREIGN KEY (`proprietaire`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `projet_applis`
--
ALTER TABLE `projet_applis`
  ADD CONSTRAINT `FK_FED04F7512885A4B` FOREIGN KEY (`certificatsprojet_id`) REFERENCES `certificats_projet` (`id`),
  ADD CONSTRAINT `FK_FED04F75F4FED186` FOREIGN KEY (`certificatsapplis_id`) REFERENCES `certificats_applis` (`id`);

--
-- Contraintes pour la table `projet_documents`
--
ALTER TABLE `projet_documents`
  ADD CONSTRAINT `FK_814E955CC18272` FOREIGN KEY (`projet_id`) REFERENCES `certificats_projet` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_814E955CD76E0C12` FOREIGN KEY (`documentbb_id`) REFERENCES `documentsbb` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `task_tag`
--
ALTER TABLE `task_tag`
  ADD CONSTRAINT `FK_6C0B4F048DB60186` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6C0B4F04BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
