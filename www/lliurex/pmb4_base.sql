-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: pmb
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abo_liste_lecture`
--

DROP TABLE IF EXISTS `abo_liste_lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abo_liste_lecture` (
  `num_empr` int(8) unsigned NOT NULL DEFAULT '0',
  `num_liste` int(8) unsigned NOT NULL DEFAULT '0',
  `etat` int(1) unsigned NOT NULL DEFAULT '0',
  `commentaire` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`num_empr`,`num_liste`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abo_liste_lecture`
--

LOCK TABLES `abo_liste_lecture` WRITE;
/*!40000 ALTER TABLE `abo_liste_lecture` DISABLE KEYS */;
/*!40000 ALTER TABLE `abo_liste_lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abts_abts`
--

DROP TABLE IF EXISTS `abts_abts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abts_abts` (
  `abt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `abt_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `base_modele_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `base_modele_id` int(11) NOT NULL DEFAULT '0',
  `num_notice` int(11) NOT NULL DEFAULT '0',
  `date_debut` date NOT NULL DEFAULT '0000-00-00',
  `date_fin` date NOT NULL DEFAULT '0000-00-00',
  `fournisseur` int(11) NOT NULL DEFAULT '0',
  `destinataire` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cote` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typdoc_id` int(11) NOT NULL DEFAULT '0',
  `exemp_auto` int(11) NOT NULL DEFAULT '0',
  `location_id` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `lender_id` int(11) NOT NULL DEFAULT '0',
  `statut_id` int(11) NOT NULL DEFAULT '0',
  `codestat_id` int(11) NOT NULL DEFAULT '0',
  `type_antivol` int(11) NOT NULL DEFAULT '0',
  `duree_abonnement` int(11) NOT NULL DEFAULT '0',
  `abt_numeric` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`abt_id`),
  KEY `index_num_notice` (`num_notice`),
  KEY `i_date_fin` (`date_fin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abts_abts`
--

LOCK TABLES `abts_abts` WRITE;
/*!40000 ALTER TABLE `abts_abts` DISABLE KEYS */;
/*!40000 ALTER TABLE `abts_abts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abts_abts_modeles`
--

DROP TABLE IF EXISTS `abts_abts_modeles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abts_abts_modeles` (
  `modele_id` int(11) NOT NULL DEFAULT '0',
  `abt_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `vol` int(11) NOT NULL DEFAULT '0',
  `tome` int(11) NOT NULL DEFAULT '0',
  `delais` int(11) NOT NULL DEFAULT '0',
  `critique` int(11) NOT NULL DEFAULT '0',
  `num_statut_general` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`modele_id`,`abt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abts_abts_modeles`
--

LOCK TABLES `abts_abts_modeles` WRITE;
/*!40000 ALTER TABLE `abts_abts_modeles` DISABLE KEYS */;
/*!40000 ALTER TABLE `abts_abts_modeles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abts_grille_abt`
--

DROP TABLE IF EXISTS `abts_grille_abt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abts_grille_abt` (
  `id_bull` int(11) NOT NULL AUTO_INCREMENT,
  `num_abt` int(10) unsigned NOT NULL DEFAULT '0',
  `date_parution` date NOT NULL DEFAULT '0000-00-00',
  `modele_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `nombre` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_bull`),
  KEY `num_abt` (`num_abt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abts_grille_abt`
--

LOCK TABLES `abts_grille_abt` WRITE;
/*!40000 ALTER TABLE `abts_grille_abt` DISABLE KEYS */;
/*!40000 ALTER TABLE `abts_grille_abt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abts_grille_modele`
--

DROP TABLE IF EXISTS `abts_grille_modele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abts_grille_modele` (
  `num_modele` int(10) unsigned NOT NULL DEFAULT '0',
  `date_parution` date NOT NULL DEFAULT '0000-00-00',
  `type_serie` int(11) NOT NULL DEFAULT '0',
  `numero` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nombre_recu` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`num_modele`,`date_parution`,`type_serie`),
  KEY `num_modele` (`num_modele`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abts_grille_modele`
--

LOCK TABLES `abts_grille_modele` WRITE;
/*!40000 ALTER TABLE `abts_grille_modele` DISABLE KEYS */;
/*!40000 ALTER TABLE `abts_grille_modele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abts_modeles`
--

DROP TABLE IF EXISTS `abts_modeles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abts_modeles` (
  `modele_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modele_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_notice` int(10) unsigned NOT NULL DEFAULT '0',
  `num_periodicite` int(10) unsigned NOT NULL DEFAULT '0',
  `duree_abonnement` int(11) NOT NULL DEFAULT '0',
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `days` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1111111',
  `day_month` varchar(31) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1111111111111111111111111111111',
  `week_month` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '111111',
  `week_year` varchar(54) COLLATE utf8_unicode_ci NOT NULL DEFAULT '111111111111111111111111111111111111111111111111111111',
  `month_year` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '111111111111',
  `num_cycle` int(11) NOT NULL DEFAULT '0',
  `num_combien` int(11) NOT NULL DEFAULT '0',
  `num_increment` int(11) NOT NULL DEFAULT '0',
  `num_date_unite` int(11) NOT NULL DEFAULT '0',
  `num_increment_date` int(11) NOT NULL DEFAULT '0',
  `num_depart` int(11) NOT NULL DEFAULT '0',
  `vol_actif` int(11) NOT NULL DEFAULT '0',
  `vol_increment` int(11) NOT NULL DEFAULT '0',
  `vol_date_unite` int(11) NOT NULL DEFAULT '0',
  `vol_increment_numero` int(11) NOT NULL DEFAULT '0',
  `vol_increment_date` int(11) NOT NULL DEFAULT '0',
  `vol_cycle` int(11) NOT NULL DEFAULT '0',
  `vol_combien` int(11) NOT NULL DEFAULT '0',
  `vol_depart` int(11) NOT NULL DEFAULT '0',
  `tom_actif` int(11) NOT NULL DEFAULT '0',
  `tom_increment` int(11) NOT NULL DEFAULT '0',
  `tom_date_unite` int(11) NOT NULL DEFAULT '0',
  `tom_increment_numero` int(11) NOT NULL DEFAULT '0',
  `tom_increment_date` int(11) NOT NULL DEFAULT '0',
  `tom_cycle` int(11) NOT NULL DEFAULT '0',
  `tom_combien` int(11) NOT NULL DEFAULT '0',
  `tom_depart` int(11) NOT NULL DEFAULT '0',
  `format_aff` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `format_periode` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`modele_id`),
  KEY `num_notice` (`num_notice`),
  KEY `num_periodicite` (`num_periodicite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abts_modeles`
--

LOCK TABLES `abts_modeles` WRITE;
/*!40000 ALTER TABLE `abts_modeles` DISABLE KEYS */;
/*!40000 ALTER TABLE `abts_modeles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abts_periodicites`
--

DROP TABLE IF EXISTS `abts_periodicites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abts_periodicites` (
  `periodicite_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `duree` int(11) NOT NULL DEFAULT '0',
  `unite` int(11) NOT NULL DEFAULT '0',
  `retard_periodicite` int(4) DEFAULT '0',
  `seuil_periodicite` int(4) DEFAULT '0',
  `consultation_duration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`periodicite_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abts_periodicites`
--

LOCK TABLES `abts_periodicites` WRITE;
/*!40000 ALTER TABLE `abts_periodicites` DISABLE KEYS */;
INSERT INTO `abts_periodicites` VALUES (5,'Bimestriel',2,1,30,10,0),(4,'Mensuel',1,1,15,5,0),(3,'Bimensuel',14,0,10,5,0),(2,'Hebdomadaire',7,0,4,2,0),(1,'Quotidien',1,0,2,1,0),(6,'Trimestriel',3,1,30,10,0),(7,'Quadrimestriel',4,1,30,10,0),(8,'Semestriel',6,1,30,10,0),(9,'Annuel',1,2,30,10,0);
/*!40000 ALTER TABLE `abts_periodicites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acces_profiles`
--

DROP TABLE IF EXISTS `acces_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acces_profiles` (
  `prf_id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `prf_type` int(1) unsigned NOT NULL DEFAULT '1',
  `prf_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prf_rule` blob NOT NULL,
  `prf_hrule` text COLLATE utf8_unicode_ci NOT NULL,
  `prf_used` int(2) unsigned NOT NULL DEFAULT '0',
  `dom_num` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`prf_id`),
  KEY `prf_type` (`prf_type`),
  KEY `prf_name` (`prf_name`),
  KEY `dom_num` (`dom_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acces_profiles`
--

LOCK TABLES `acces_profiles` WRITE;
/*!40000 ALTER TABLE `acces_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `acces_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acces_rights`
--

DROP TABLE IF EXISTS `acces_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acces_rights` (
  `dom_num` int(2) unsigned NOT NULL DEFAULT '0',
  `usr_prf_num` int(2) unsigned NOT NULL DEFAULT '0',
  `res_prf_num` int(2) unsigned NOT NULL DEFAULT '0',
  `dom_rights` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dom_num`,`usr_prf_num`,`res_prf_num`),
  KEY `dom_num` (`dom_num`),
  KEY `usr_prf_num` (`usr_prf_num`),
  KEY `res_prf_num` (`res_prf_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acces_rights`
--

LOCK TABLES `acces_rights` WRITE;
/*!40000 ALTER TABLE `acces_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `acces_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actes`
--

DROP TABLE IF EXISTS `actes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actes` (
  `id_acte` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `date_acte` date NOT NULL DEFAULT '0000-00-00',
  `numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_acte` int(3) unsigned NOT NULL DEFAULT '0',
  `statut` int(3) unsigned NOT NULL DEFAULT '0',
  `date_paiement` date NOT NULL DEFAULT '0000-00-00',
  `num_paiement` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_entite` int(5) unsigned NOT NULL DEFAULT '0',
  `num_fournisseur` int(5) unsigned NOT NULL DEFAULT '0',
  `num_contact_livr` int(8) unsigned NOT NULL DEFAULT '0',
  `num_contact_fact` int(8) unsigned NOT NULL DEFAULT '0',
  `num_exercice` int(8) unsigned NOT NULL DEFAULT '0',
  `commentaires` text COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `index_acte` text COLLATE utf8_unicode_ci NOT NULL,
  `devise` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `commentaires_i` text COLLATE utf8_unicode_ci NOT NULL,
  `date_valid` date NOT NULL DEFAULT '0000-00-00',
  `date_ech` date NOT NULL DEFAULT '0000-00-00',
  `nom_acte` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_acte`),
  KEY `num_fournisseur` (`num_fournisseur`),
  KEY `date` (`date_acte`),
  KEY `num_entite` (`num_entite`),
  KEY `numero` (`numero`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actes`
--

LOCK TABLES `actes` WRITE;
/*!40000 ALTER TABLE `actes` DISABLE KEYS */;
/*!40000 ALTER TABLE `actes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_session`
--

DROP TABLE IF EXISTS `admin_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_session` (
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `session` blob,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_session`
--

LOCK TABLES `admin_session` WRITE;
/*!40000 ALTER TABLE `admin_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analysis`
--

DROP TABLE IF EXISTS `analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis` (
  `analysis_bulletin` int(8) unsigned NOT NULL DEFAULT '0',
  `analysis_notice` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`analysis_bulletin`,`analysis_notice`),
  KEY `analysis_notice` (`analysis_notice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysis`
--

LOCK TABLES `analysis` WRITE;
/*!40000 ALTER TABLE `analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arch_emplacement`
--

DROP TABLE IF EXISTS `arch_emplacement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arch_emplacement` (
  `archempla_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `archempla_libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`archempla_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arch_emplacement`
--

LOCK TABLES `arch_emplacement` WRITE;
/*!40000 ALTER TABLE `arch_emplacement` DISABLE KEYS */;
INSERT INTO `arch_emplacement` VALUES (1,'Présentoir');
/*!40000 ALTER TABLE `arch_emplacement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arch_statut`
--

DROP TABLE IF EXISTS `arch_statut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arch_statut` (
  `archstatut_id` int(8) NOT NULL AUTO_INCREMENT,
  `archstatut_gestion_libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `archstatut_opac_libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `archstatut_visible_opac` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archstatut_visible_opac_abon` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archstatut_visible_gestion` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archstatut_class_html` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`archstatut_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arch_statut`
--

LOCK TABLES `arch_statut` WRITE;
/*!40000 ALTER TABLE `arch_statut` DISABLE KEYS */;
INSERT INTO `arch_statut` VALUES (1,'Consultable sur place','Consultable sur place',1,0,1,'statutnot2');
/*!40000 ALTER TABLE `arch_statut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arch_type`
--

DROP TABLE IF EXISTS `arch_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arch_type` (
  `archtype_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `archtype_libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`archtype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arch_type`
--

LOCK TABLES `arch_type` WRITE;
/*!40000 ALTER TABLE `arch_type` DISABLE KEYS */;
INSERT INTO `arch_type` VALUES (1,'Revue');
/*!40000 ALTER TABLE `arch_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `type_obj` int(1) NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_modif` int(1) NOT NULL DEFAULT '1',
  `quand` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type_user` int(1) unsigned NOT NULL DEFAULT '0',
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  KEY `type_obj` (`type_obj`),
  KEY `object_id` (`object_id`),
  KEY `user_id` (`user_id`),
  KEY `type_modif` (`type_modif`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aut_link`
--

DROP TABLE IF EXISTS `aut_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aut_link` (
  `aut_link_from` int(2) NOT NULL DEFAULT '0',
  `aut_link_from_num` int(11) NOT NULL DEFAULT '0',
  `aut_link_to` int(2) NOT NULL DEFAULT '0',
  `aut_link_to_num` int(11) NOT NULL DEFAULT '0',
  `aut_link_type` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aut_link_reciproc` int(1) NOT NULL DEFAULT '0',
  `aut_link_comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`aut_link_from`,`aut_link_from_num`,`aut_link_to`,`aut_link_to_num`,`aut_link_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aut_link`
--

LOCK TABLES `aut_link` WRITE;
/*!40000 ALTER TABLE `aut_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `aut_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_custom`
--

DROP TABLE IF EXISTS `author_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_custom`
--

LOCK TABLES `author_custom` WRITE;
/*!40000 ALTER TABLE `author_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_custom_lists`
--

DROP TABLE IF EXISTS `author_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_custom_lists` (
  `author_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `author_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `editorial_custom_champ` (`author_custom_champ`),
  KEY `editorial_champ_list_value` (`author_custom_champ`,`author_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_custom_lists`
--

LOCK TABLES `author_custom_lists` WRITE;
/*!40000 ALTER TABLE `author_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_custom_values`
--

DROP TABLE IF EXISTS `author_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_custom_values` (
  `author_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `author_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `author_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_custom_text` text COLLATE utf8_unicode_ci,
  `author_custom_integer` int(11) DEFAULT NULL,
  `author_custom_date` date DEFAULT NULL,
  `author_custom_float` float DEFAULT NULL,
  KEY `editorial_custom_champ` (`author_custom_champ`),
  KEY `editorial_custom_origine` (`author_custom_origine`),
  KEY `i_acv_st` (`author_custom_small_text`),
  KEY `i_acv_t` (`author_custom_text`(255)),
  KEY `i_acv_i` (`author_custom_integer`),
  KEY `i_acv_d` (`author_custom_date`),
  KEY `i_acv_f` (`author_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_custom_values`
--

LOCK TABLES `author_custom_values` WRITE;
/*!40000 ALTER TABLE `author_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities_sources`
--

DROP TABLE IF EXISTS `authorities_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities_sources` (
  `id_authority_source` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_authority` int(10) unsigned NOT NULL DEFAULT '0',
  `authority_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authority_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_origin_authority` int(10) unsigned NOT NULL DEFAULT '0',
  `authority_favorite` int(10) unsigned NOT NULL DEFAULT '0',
  `import_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_authority_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities_sources`
--

LOCK TABLES `authorities_sources` WRITE;
/*!40000 ALTER TABLE `authorities_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorities_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `author_type` enum('70','71','72') COLLATE utf8_unicode_ci NOT NULL DEFAULT '70',
  `author_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_rejete` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_see` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_web` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `index_author` text COLLATE utf8_unicode_ci,
  `author_comment` text COLLATE utf8_unicode_ci,
  `author_lieu` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_subdivision` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_numero` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_import_denied` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`author_id`),
  KEY `author_see` (`author_see`),
  KEY `author_name` (`author_name`),
  KEY `author_rejete` (`author_rejete`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authperso`
--

DROP TABLE IF EXISTS `authperso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authperso` (
  `id_authperso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authperso_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authperso_notice_onglet_num` int(10) unsigned NOT NULL DEFAULT '0',
  `authperso_isbd_script` text COLLATE utf8_unicode_ci NOT NULL,
  `authperso_view_script` text COLLATE utf8_unicode_ci NOT NULL,
  `authperso_opac_search` int(10) unsigned NOT NULL DEFAULT '0',
  `authperso_opac_multi_search` int(10) unsigned NOT NULL DEFAULT '0',
  `authperso_gestion_search` int(10) unsigned NOT NULL DEFAULT '0',
  `authperso_gestion_multi_search` int(10) unsigned NOT NULL DEFAULT '0',
  `authperso_comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_authperso`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authperso`
--

LOCK TABLES `authperso` WRITE;
/*!40000 ALTER TABLE `authperso` DISABLE KEYS */;
/*!40000 ALTER TABLE `authperso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authperso_authorities`
--

DROP TABLE IF EXISTS `authperso_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authperso_authorities` (
  `id_authperso_authority` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authperso_authority_authperso_num` int(10) unsigned NOT NULL DEFAULT '0',
  `authperso_infos_global` text COLLATE utf8_unicode_ci NOT NULL,
  `authperso_index_infos_global` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_authperso_authority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authperso_authorities`
--

LOCK TABLES `authperso_authorities` WRITE;
/*!40000 ALTER TABLE `authperso_authorities` DISABLE KEYS */;
/*!40000 ALTER TABLE `authperso_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authperso_custom`
--

DROP TABLE IF EXISTS `authperso_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authperso_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_prefixe` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authperso_custom`
--

LOCK TABLES `authperso_custom` WRITE;
/*!40000 ALTER TABLE `authperso_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `authperso_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authperso_custom_lists`
--

DROP TABLE IF EXISTS `authperso_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authperso_custom_lists` (
  `authperso_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `authperso_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authperso_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `editorial_custom_champ` (`authperso_custom_champ`),
  KEY `editorial_champ_list_value` (`authperso_custom_champ`,`authperso_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authperso_custom_lists`
--

LOCK TABLES `authperso_custom_lists` WRITE;
/*!40000 ALTER TABLE `authperso_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `authperso_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authperso_custom_values`
--

DROP TABLE IF EXISTS `authperso_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authperso_custom_values` (
  `authperso_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `authperso_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `authperso_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authperso_custom_text` text COLLATE utf8_unicode_ci,
  `authperso_custom_integer` int(11) DEFAULT NULL,
  `authperso_custom_date` date DEFAULT NULL,
  `authperso_custom_float` float DEFAULT NULL,
  KEY `editorial_custom_champ` (`authperso_custom_champ`),
  KEY `editorial_custom_origine` (`authperso_custom_origine`),
  KEY `i_acv_st` (`authperso_custom_small_text`),
  KEY `i_acv_t` (`authperso_custom_text`(255)),
  KEY `i_acv_i` (`authperso_custom_integer`),
  KEY `i_acv_d` (`authperso_custom_date`),
  KEY `i_acv_f` (`authperso_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authperso_custom_values`
--

LOCK TABLES `authperso_custom_values` WRITE;
/*!40000 ALTER TABLE `authperso_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `authperso_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avis`
--

DROP TABLE IF EXISTS `avis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avis` (
  `id_avis` mediumint(8) NOT NULL AUTO_INCREMENT,
  `num_empr` mediumint(8) NOT NULL DEFAULT '0',
  `num_notice` mediumint(8) NOT NULL DEFAULT '0',
  `note` int(3) DEFAULT NULL,
  `sujet` text COLLATE utf8_unicode_ci,
  `commentaire` text COLLATE utf8_unicode_ci,
  `dateajout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valide` int(1) unsigned NOT NULL DEFAULT '0',
  `avis_rank` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_avis`),
  KEY `avis_num_notice` (`num_notice`),
  KEY `avis_num_empr` (`num_empr`),
  KEY `avis_note` (`note`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avis`
--

LOCK TABLES `avis` WRITE;
/*!40000 ALTER TABLE `avis` DISABLE KEYS */;
/*!40000 ALTER TABLE `avis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannette_abon`
--

DROP TABLE IF EXISTS `bannette_abon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannette_abon` (
  `num_bannette` int(9) unsigned NOT NULL DEFAULT '0',
  `num_empr` int(9) unsigned NOT NULL DEFAULT '0',
  `actif` int(1) unsigned NOT NULL DEFAULT '0',
  `bannette_mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`num_bannette`,`num_empr`),
  KEY `i_num_empr` (`num_empr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannette_abon`
--

LOCK TABLES `bannette_abon` WRITE;
/*!40000 ALTER TABLE `bannette_abon` DISABLE KEYS */;
/*!40000 ALTER TABLE `bannette_abon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannette_contenu`
--

DROP TABLE IF EXISTS `bannette_contenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannette_contenu` (
  `num_bannette` int(9) unsigned NOT NULL DEFAULT '0',
  `num_notice` int(9) unsigned NOT NULL DEFAULT '0',
  `date_ajout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`num_bannette`,`num_notice`),
  KEY `date_ajout` (`date_ajout`),
  KEY `i_num_notice` (`num_notice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannette_contenu`
--

LOCK TABLES `bannette_contenu` WRITE;
/*!40000 ALTER TABLE `bannette_contenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `bannette_contenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannette_equation`
--

DROP TABLE IF EXISTS `bannette_equation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannette_equation` (
  `num_bannette` int(9) unsigned NOT NULL DEFAULT '0',
  `num_equation` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_bannette`,`num_equation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannette_equation`
--

LOCK TABLES `bannette_equation` WRITE;
/*!40000 ALTER TABLE `bannette_equation` DISABLE KEYS */;
/*!40000 ALTER TABLE `bannette_equation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannette_exports`
--

DROP TABLE IF EXISTS `bannette_exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannette_exports` (
  `num_bannette` int(11) unsigned NOT NULL DEFAULT '0',
  `export_format` int(3) NOT NULL DEFAULT '0',
  `export_data` longblob NOT NULL,
  `export_nomfichier` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`num_bannette`,`export_format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannette_exports`
--

LOCK TABLES `bannette_exports` WRITE;
/*!40000 ALTER TABLE `bannette_exports` DISABLE KEYS */;
/*!40000 ALTER TABLE `bannette_exports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannette_facettes`
--

DROP TABLE IF EXISTS `bannette_facettes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannette_facettes` (
  `num_ban_facette` int(10) unsigned NOT NULL DEFAULT '0',
  `ban_facette_critere` int(5) NOT NULL DEFAULT '0',
  `ban_facette_ss_critere` int(5) NOT NULL DEFAULT '0',
  `ban_facette_order` int(1) NOT NULL DEFAULT '0',
  KEY `bannette_facettes_key` (`num_ban_facette`,`ban_facette_critere`,`ban_facette_ss_critere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannette_facettes`
--

LOCK TABLES `bannette_facettes` WRITE;
/*!40000 ALTER TABLE `bannette_facettes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bannette_facettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannette_tpl`
--

DROP TABLE IF EXISTS `bannette_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannette_tpl` (
  `bannettetpl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bannettetpl_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bannettetpl_comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bannettetpl_tpl` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bannettetpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannette_tpl`
--

LOCK TABLES `bannette_tpl` WRITE;
/*!40000 ALTER TABLE `bannette_tpl` DISABLE KEYS */;
INSERT INTO `bannette_tpl` VALUES (1,'Template PMB','','{{info.header}}\r\n<br /><br />\r\n<div class=\"summary\">\r\n{% for sommaire in sommaires %}\r\n<a href=\"#[{{sommaire.level}}]\">\r\n{{sommaire.level}} - {{sommaire.title}}\r\n</a>\r\n<br />\r\n{% endfor %}\r\n</div>\r\n<hr>\r\n{% for sommaire in sommaires %}\r\n<a name=\"[{{sommaire.level}}]\" />\r\n<h1>{{sommaire.level}} - {{sommaire.title}}</h1>\r\n{% for record in sommaire.records %}\r\n{{record.render}}\r\n<hr>\r\n{% endfor %}\r\n<br />\r\n{% endfor %}\r\n{{info.footer}}');
/*!40000 ALTER TABLE `bannette_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannettes`
--

DROP TABLE IF EXISTS `bannettes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannettes` (
  `id_bannette` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `num_classement` int(8) unsigned NOT NULL DEFAULT '1',
  `nom_bannette` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_gestion` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_public` text COLLATE utf8_unicode_ci NOT NULL,
  `entete_mail` text COLLATE utf8_unicode_ci NOT NULL,
  `date_last_remplissage` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_last_envoi` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `proprio_bannette` int(9) unsigned NOT NULL DEFAULT '0',
  `bannette_auto` int(1) unsigned NOT NULL DEFAULT '0',
  `periodicite` int(3) unsigned NOT NULL DEFAULT '7',
  `diffusion_email` int(1) unsigned NOT NULL DEFAULT '0',
  `categorie_lecteurs` int(8) unsigned NOT NULL DEFAULT '0',
  `nb_notices_diff` int(4) unsigned NOT NULL DEFAULT '0',
  `num_panier` int(8) unsigned NOT NULL DEFAULT '0',
  `limite_type` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `limite_nombre` int(6) NOT NULL DEFAULT '0',
  `update_type` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'C',
  `typeexport` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prefixe_fichier` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `param_export` blob NOT NULL,
  `piedpage_mail` text COLLATE utf8_unicode_ci NOT NULL,
  `notice_tpl` int(10) unsigned NOT NULL DEFAULT '0',
  `group_type` int(10) unsigned NOT NULL DEFAULT '0',
  `group_pperso` int(10) unsigned NOT NULL DEFAULT '0',
  `display_notice_in_every_group` int(10) unsigned NOT NULL DEFAULT '0',
  `statut_not_account` int(1) unsigned NOT NULL DEFAULT '0',
  `archive_number` int(10) unsigned NOT NULL DEFAULT '0',
  `document_generate` int(10) unsigned NOT NULL DEFAULT '0',
  `document_notice_tpl` int(10) unsigned NOT NULL DEFAULT '0',
  `document_insert_docnum` int(10) unsigned NOT NULL DEFAULT '0',
  `document_group` int(10) unsigned NOT NULL DEFAULT '0',
  `document_add_summary` int(10) unsigned NOT NULL DEFAULT '0',
  `groupe_lecteurs` int(8) unsigned NOT NULL DEFAULT '0',
  `bannette_opac_accueil` int(10) unsigned NOT NULL DEFAULT '0',
  `bannette_tpl_num` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_bannette`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannettes`
--

LOCK TABLES `bannettes` WRITE;
/*!40000 ALTER TABLE `bannettes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bannettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannettes_descriptors`
--

DROP TABLE IF EXISTS `bannettes_descriptors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannettes_descriptors` (
  `num_bannette` int(11) NOT NULL DEFAULT '0',
  `num_noeud` int(11) NOT NULL DEFAULT '0',
  `bannette_descriptor_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_bannette`,`num_noeud`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannettes_descriptors`
--

LOCK TABLES `bannettes_descriptors` WRITE;
/*!40000 ALTER TABLE `bannettes_descriptors` DISABLE KEYS */;
/*!40000 ALTER TABLE `bannettes_descriptors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budgets` (
  `id_budget` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `num_entite` int(5) unsigned NOT NULL DEFAULT '0',
  `num_exercice` int(8) unsigned NOT NULL DEFAULT '0',
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `commentaires` text COLLATE utf8_unicode_ci,
  `montant_global` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  `seuil_alerte` int(3) unsigned NOT NULL DEFAULT '100',
  `statut` int(3) unsigned NOT NULL DEFAULT '0',
  `type_budget` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_budget`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletins`
--

DROP TABLE IF EXISTS `bulletins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletins` (
  `bulletin_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `bulletin_numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bulletin_notice` int(8) NOT NULL DEFAULT '0',
  `mention_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_date` date NOT NULL DEFAULT '0000-00-00',
  `bulletin_titre` text COLLATE utf8_unicode_ci,
  `index_titre` text COLLATE utf8_unicode_ci,
  `bulletin_cb` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_notice` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bulletin_id`),
  KEY `bulletin_numero` (`bulletin_numero`),
  KEY `bulletin_notice` (`bulletin_notice`),
  KEY `date_date` (`date_date`),
  KEY `i_num_notice` (`num_notice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletins`
--

LOCK TABLES `bulletins` WRITE;
/*!40000 ALTER TABLE `bulletins` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulletins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_amendes`
--

DROP TABLE IF EXISTS `cache_amendes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_amendes` (
  `id_empr` int(10) unsigned NOT NULL DEFAULT '0',
  `cache_date` date NOT NULL DEFAULT '0000-00-00',
  `data_amendes` blob NOT NULL,
  KEY `id_empr` (`id_empr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_amendes`
--

LOCK TABLES `cache_amendes` WRITE;
/*!40000 ALTER TABLE `cache_amendes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_amendes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caddie`
--

DROP TABLE IF EXISTS `caddie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caddie` (
  `idcaddie` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NOTI',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autorisations` mediumtext COLLATE utf8_unicode_ci,
  `caddie_classement` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `acces_rapide` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcaddie`),
  KEY `caddie_type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caddie`
--

LOCK TABLES `caddie` WRITE;
/*!40000 ALTER TABLE `caddie` DISABLE KEYS */;
INSERT INTO `caddie` VALUES (1,'Registros para exposición','NOTI','Incluir en esta cesta los registros de la exposición virtual','1 2','',0),(2,'Registros a devolver a BDP','NOTI','Llenar esta cesta como control de los registros que se han de devolver','1 2','',0),(3,'Ejemplares a devolver a BDP','EXPL','Llenar esta cesta con los ejemplares de los documentos a devolver a la BDP','1 2','',0),(4,'Registros con el título duplicado','NOTI','Duplicados del primer título','1 2','',0),(8,'Ejemplo de cesta de ejemplares','EXPL','','1 4 3 2','',0),(5,'Loire - Registros para el tema del mes','NOTI','','1 4','',0),(6,'Loire - Números que contienen los artículos para la exposición del mes','BULL','','1 4','',0),(7,'Cochon - registros para la exposición del mes próximo','NOTI','','1','',0);
/*!40000 ALTER TABLE `caddie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caddie_content`
--

DROP TABLE IF EXISTS `caddie_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caddie_content` (
  `caddie_id` int(8) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `content` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `blob_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `flag` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`caddie_id`,`object_id`,`content`),
  KEY `object_id` (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caddie_content`
--

LOCK TABLES `caddie_content` WRITE;
/*!40000 ALTER TABLE `caddie_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `caddie_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caddie_procs`
--

DROP TABLE IF EXISTS `caddie_procs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caddie_procs` (
  `idproc` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SELECT',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `requete` blob NOT NULL,
  `comment` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `autorisations` mediumtext COLLATE utf8_unicode_ci,
  `parameters` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`idproc`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caddie_procs`
--

LOCK TABLES `caddie_procs` WRITE;
/*!40000 ALTER TABLE `caddie_procs` DISABLE KEYS */;
INSERT INTO `caddie_procs` VALUES (1,'SELECT','Registros por autor','SELECT notice_id as object_id, \'NOTI\' as object_type FROM notices, authors, responsability WHERE author_name like \'%!!critere!!%\' AND author_id=responsability_author AND notice_id=responsability_notice\r\n','Selección de registros dónde el nombre del autor contiene ciertas letras','1 2 3','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"critere\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Caracteres incluidos en el apellido]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>25</SIZE>\r\n <MAXSIZE>25</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(2,'SELECT','Registros duplicados','create TEMPORARY TABLE tmp SELECT tit1 FROM notices GROUP BY tit1 HAVING count(*)>1\r\nSELECT notice_id as object_id, \'NOTI\' as object_type FROM notices, tmp wHERE notices.tit1=tmp.tit1','Selección de los registros duplicados por el título principal','1 2 3',NULL),(3,'SELECT','EXPL por sección / propietario','select expl_id as object_id, \'EXPL\' as object_type from exemplaires where expl_section in (!!section!!) and expl_owner=!!proprio!!','Selección de ejemplares por sección y por propietario','1 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"section\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Sección]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by section_libelle]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"proprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Proprietario]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by lender_libelle</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(4,'SELECT','EXPL que la signatura comienza por','select expl_id as object_id, \'EXPL\' as object_type from exemplaires where expl_cote like \'!!comme_cote!!%\'','Selección de ejemplares a partir del inicio de su signatura','1 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"comme_cote\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Inicio de la signatura]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>20</SIZE>\r\n <MAXSIZE>20</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>'),(6,'SELECT','Nunca prestados','SELECT expl_id as object_id, \'EXPL\' as object_type, concat(\"LIVRE \",tit1) as Titre FROM notices join exemplaires on expl_notice=notice_id LEFT JOIN pret_archive ON arc_expl_notice = notice_id where arc_expl_id IS NULL AND expl_id IS NOT NULL UNION SELECT expl_id as object_id, \'EXPL\' as object_type, concat(\"PERIO \",tit1, \" Num\�ro : \",bulletin_numero) as Titre FROM (bulletins INNER JOIN notices ON bulletins.bulletin_notice = notices.notice_id) INNER JOIN exemplaires on expl_bulletin=bulletin_id LEFT JOIN pret_archive ON expl_id = arc_expl_id WHERE pret_archive.arc_id Is Null','Añade a una cesta los ejemplares que nunca se han prestado','1 2',NULL),(7,'SELECT','Selección de ejemplares por estado','select expl_id as object_id, \'EXPL\' as object_type from exemplaires where expl_statut in (!!statut!!)','','1 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"statut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[estado]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idstatut, statut_libelle from docs_statut]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(8,'SELECT','Selección de ejemplares por localización, sección, estado, propietario','select expl_id as object_id, \'EXPL\' as object_type from exemplaires where expl_section in (!!section!!) and expl_location in (!!location!!) and expl_statut in (!!statut!!) and expl_owner=!!proprio!!  ','','1 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"section\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Sección]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"location\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localización]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"statut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Estado]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idstatut, statut_libelle from docs_statut order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"proprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Proprietario]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(10,'ACTION','Déplacement des bulletins d\'un panier vers un autre périodique','update bulletins set bulletin_notice=!!new_perio!! where bulletin_id in (CADDIE(BULL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_perio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouveau périodique]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select notice_id, tit1 from notices where niveau_biblio=\'s\' and niveau_hierar=\'1\' order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(11,'SELECT','Sélection / pointage des bulletins sans articles','select distinct bulletin_id as object_id,\'BULL\' as object_type from bulletins left join analysis on analysis_bulletin=bulletin_id where analysis_bulletin is null','',' 1 ',''),(13,'SELECT','Sélection / pointage de bulletins par date','select bulletin_id as object_id, \'BULL\' as object_type from bulletins where date_date>\'!!dated!!\' AND date_date<\'!!datef!!\'','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"dated\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date de début :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"datef\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date de fin :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n</FIELDS>'),(14,'ACTION','Changement de code statistique des exemplaires d\'un panier','update exemplaires set expl_codestat=\'!!new_codestat!!\' where expl_id in (CADDIE(EXPL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_codestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouveau code statistique]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(16,'ACTION','Changement de date de dépôt des exemplaires d\'un panier','update exemplaires set expl_date_depot=\'!!new_date_depot!!\' where expl_id in (CADDIE(EXPL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_date_depot\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouvelle date de dépôt]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>'),(18,'ACTION','Changement de date de retour des exemplaires d\'un panier','update exemplaires set expl_date_retour=\'!!new_date_retour!!\' where expl_id in (CADDIE(EXPL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_date_retour\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouvelle date de retour]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>'),(19,'ACTION','Changement de localisation des exemplaires d\'un panier','update exemplaires set expl_location=\'!!new_location!!\' where expl_id in (CADDIE(EXPL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_location\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouvelle localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(20,'ACTION','Changement de message des exemplaires d\'un panier','update exemplaires set expl_note=\'!!new_note!!\' where expl_id in (CADDIE(EXPL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_note\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Nouveau message]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>25</SIZE>\r\n <MAXSIZE>255</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(21,'ACTION','Changement d\'une partie de la cote des exemplaires d\'un panier','update exemplaires set expl_cote=replace(expl_cote, \'!!motif_1!!\', \'!!motif_2!!\') where expl_id in (CADDIE(EXPL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"motif_1\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Remplacer]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>10</SIZE>\r\n <MAXSIZE>10</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"motif_2\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Par]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>10</SIZE>\r\n <MAXSIZE>10</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>'),(22,'ACTION','Changement de prix des exemplaires d\'un panier','update exemplaires set expl_prix=\'!!new_prix!!\' where expl_id in (CADDIE(EXPL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_prix\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Nouveau prix]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>10</SIZE>\r\n <MAXSIZE>255</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(23,'ACTION','Changement de section des exemplaires d\'un panier','update exemplaires set expl_section=\'!!new_section!!\' where expl_id in (CADDIE(EXPL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_section\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouvelle section]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(24,'ACTION','Changement de statut des exemplaires d\'un panier','update exemplaires set expl_statut=\'!!new_statut!!\' where expl_id in (CADDIE(EXPL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_statut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouveau statut]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idstatut, statut_libelle from docs_statut order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(25,'ACTION','Changement de support des exemplaires d\'un panier','update exemplaires set expl_typdoc=\'!!new_typdoc!!\' where expl_id in (CADDIE(EXPL))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_typdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouveau support]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(26,'SELECT','Sélection / Pointage des exemplaires en cours de prêt','SELECT pret_idexpl as object_id, \'EXPL\' as object_type from pret','',' 1 ',''),(27,'SELECT','Sélection d\'exemplaires à partir d\'un fichier de code-barres','select expl_id as object_id, \'EXPL\' as object_type from exemplaires where expl_cb in (!!fichier!!)','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"fichier\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[fichier]]></ALIAS>\n  <TYPE>file_box</TYPE>\n<OPTIONS FOR=\"file_box\">\r\n <METHOD>1</METHOD>\r\n <TEMP_TABLE_NAME></TEMP_TABLE_NAME>\r\n <DATA_TYPE>1</DATA_TYPE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>'),(30,'ACTION','Changement de l\'indexation décimale des notices d\'un panier','update notices set notices.indexint=\'!!nouvelle_indexation!!\'  where notice_id in (CADDIE(NOTI))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"nouvelle_indexation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouvelle indexation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select indexint_id, concat(indexint_name,\' \', indexint_comment) from indexint order by indexint_name]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(31,'ACTION','Changement de statut des notices d\'un panier','update notices set statut=\'!!new_statut!!\' where notice_id in (CADDIE(NOTI))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_statut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouveau statut]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select id_notice_statut, gestion_libelle from notice_statut order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(32,'ACTION','Changement de type de document des notices d\'un panier','update notices set typdoc=!!new_typdoc!! where notice_id in (CADDIE(NOTI))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_typdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouveau type de document]]></ALIAS>\n  <TYPE>list</TYPE>\n<OPTIONS FOR=\"list\">\r\n <MULTIPLE>no</MULTIPLE>\r\n <ITEMS>\r\n  <ITEM VALUE=\"b\"><![CDATA[texte manuscrit]]></ITEM>\r\n  <ITEM VALUE=\"c\"><![CDATA[partition musicale imprimée]]></ITEM>\r\n  <ITEM VALUE=\"d\"><![CDATA[partition musicale manuscrite]]></ITEM>\r\n  <ITEM VALUE=\"e\"><![CDATA[document cartographique imprimé]]></ITEM>\r\n  <ITEM VALUE=\"f\"><![CDATA[document cartographique manuscrit]]></ITEM>\r\n  <ITEM VALUE=\"g\"><![CDATA[document projeté ou vidéo]]></ITEM>\r\n  <ITEM VALUE=\"i\"><![CDATA[enregistrement sonore non musical]]></ITEM>\r\n  <ITEM VALUE=\"j\"><![CDATA[enregistrement sonore musical]]></ITEM>\r\n  <ITEM VALUE=\"k\"><![CDATA[document graphique à deux dimensions]]></ITEM>\r\n  <ITEM VALUE=\"l\"><![CDATA[document électronique]]></ITEM>\r\n  <ITEM VALUE=\"m\"><![CDATA[document multimédia]]></ITEM>\r\n  <ITEM VALUE=\"r\"><![CDATA[objet à 3 dimensions, artefacts, ...]]></ITEM>\r\n </ITEMS>\r\n <UNSELECT_ITEM VALUE=\"a\"><![CDATA[texte imprimé]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(33,'ACTION','Copie des auteurs des notices mères d\'un panier vers leurs notices filles','INSERT ignore INTO responsability (responsability_author, responsability_notice, responsability_type, responsability_fonction) \r\nSELECT \r\nr2.responsability_author, num_notice, r2.responsability_type, r2.responsability_fonction \r\nFROM notices_relations JOIN responsability r2 ON linked_notice = r2.responsability_notice where linked_notice IN (CADDIE(NOTI))','Ne rajoute des auteurs qu\'aux notices filles qui n\'ont pas déjà d\'auteurs définis.',' 1 ',''),(34,'SELECT','Sélection / pointage des notices ayant des notices filles','select distinct linked_notice as object_id, \'NOTI\' as object_type from notices_relations','',' 1 ',''),(35,'SELECT','Sélection / pointage des notices ayant une notice mère','select distinct num_notice as object_id, \'NOTI\' as object_type from notices_relations','',' 1 ',''),(36,'SELECT','Sélection / pointage de notices par type de document et statut','SELECT DISTINCT notice_id as object_id, \"NOTI\" as object_type FROM notices where typdoc =!!type_doc!! and statut =\'!!statut!!\'','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"type_doc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Type de document]]></ALIAS>\n  <TYPE>list</TYPE>\n<OPTIONS FOR=\"list\">\r\n <MULTIPLE>no</MULTIPLE>\r\n <ITEMS>\r\n  <ITEM VALUE=\"a\"><![CDATA[texte imprimé]]></ITEM>\r\n  <ITEM VALUE=\"b\"><![CDATA[texte manuscrit]]></ITEM>\r\n  <ITEM VALUE=\"c\"><![CDATA[partition musicale imprimée]]></ITEM>\r\n  <ITEM VALUE=\"d\"><![CDATA[partition musicale manuscrite]]></ITEM>\r\n  <ITEM VALUE=\"e\"><![CDATA[document cartographique imprimé]]></ITEM>\r\n  <ITEM VALUE=\"f\"><![CDATA[document cartographique manuscrit]]></ITEM>\r\n  <ITEM VALUE=\"g\"><![CDATA[document projeté ou vidéo]]></ITEM>\r\n  <ITEM VALUE=\"i\"><![CDATA[enregistrement sonore non musical]]></ITEM>\r\n  <ITEM VALUE=\"j\"><![CDATA[enregistrement sonore musical]]></ITEM>\r\n  <ITEM VALUE=\"k\"><![CDATA[document graphique à deux dimensions]]></ITEM>\r\n  <ITEM VALUE=\"l\"><![CDATA[document électronique]]></ITEM>\r\n  <ITEM VALUE=\"m\"><![CDATA[document multimédia]]></ITEM>\r\n  <ITEM VALUE=\"r\"><![CDATA[objet à 3 dimensions, artefacts, ...]]></ITEM>\r\n </ITEMS>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"statut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Statut notice]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_notice_statut, gestion_libelle from notice_statut order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(37,'SELECT','Sélection / pointage des notices sans notice-fille ni notice-mère','SELECT DISTINCT notice_id as object_id, \"NOTI\" as object_type FROM `notices` left join notices_relations nr1 on nr1.num_notice=notice_id left join notices_relations nr2 on nr2.linked_notice=notice_id where nr1.num_notice is null and nr2.linked_notice is null','',' 1 ',''),(39,'SELECT','Sélection des exemplaires non empruntés depuis une certaine date','select expl_id as object_id,\'EXPL\'as object_type FROM exemplaires where date_format(last_loan_date,\'%Y%m%d\') < date_format(\'!!dat!!\',\'%Y%m%d\')','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"dat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date dernier prêt <]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n</FIELDS>'),(5,'ACTION','Cambio de estado de los ejemplares','update exemplaires set expl_statut=!!nouveau_statut!! where expl_id in (CADDIE(EXPL))','Permite cambiar el estado de los ejemplares de una cesta','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"nouveau_statut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[nouveau_statut]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idstatut, statut_libelle FROM docs_statut</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(9,'ACTION','Cambiar la sección de los ejemplares','update exemplaires set expl_section=!!nouvelle_section!! where expl_id in (CADDIE(EXPL))','','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"nouvelle_section\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[nueva sección]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select * from docs_section order by section_libelle]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[Escoge una sección]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>');
/*!40000 ALTER TABLE `caddie_procs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashdesk`
--

DROP TABLE IF EXISTS `cashdesk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashdesk` (
  `cashdesk_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cashdesk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cashdesk_autorisations` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cashdesk_transactypes` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cashdesk_cashbox` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cashdesk_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashdesk`
--

LOCK TABLES `cashdesk` WRITE;
/*!40000 ALTER TABLE `cashdesk` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashdesk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashdesk_locations`
--

DROP TABLE IF EXISTS `cashdesk_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashdesk_locations` (
  `cashdesk_loc_cashdesk_num` int(10) unsigned NOT NULL DEFAULT '0',
  `cashdesk_loc_num` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cashdesk_loc_cashdesk_num`,`cashdesk_loc_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashdesk_locations`
--

LOCK TABLES `cashdesk_locations` WRITE;
/*!40000 ALTER TABLE `cashdesk_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashdesk_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashdesk_sections`
--

DROP TABLE IF EXISTS `cashdesk_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashdesk_sections` (
  `cashdesk_section_cashdesk_num` int(10) unsigned NOT NULL DEFAULT '0',
  `cashdesk_section_num` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cashdesk_section_cashdesk_num`,`cashdesk_section_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashdesk_sections`
--

LOCK TABLES `cashdesk_sections` WRITE;
/*!40000 ALTER TABLE `cashdesk_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashdesk_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categ_custom`
--

DROP TABLE IF EXISTS `categ_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categ_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categ_custom`
--

LOCK TABLES `categ_custom` WRITE;
/*!40000 ALTER TABLE `categ_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `categ_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categ_custom_lists`
--

DROP TABLE IF EXISTS `categ_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categ_custom_lists` (
  `categ_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `categ_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categ_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `editorial_custom_champ` (`categ_custom_champ`),
  KEY `editorial_champ_list_value` (`categ_custom_champ`,`categ_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categ_custom_lists`
--

LOCK TABLES `categ_custom_lists` WRITE;
/*!40000 ALTER TABLE `categ_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `categ_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categ_custom_values`
--

DROP TABLE IF EXISTS `categ_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categ_custom_values` (
  `categ_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `categ_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `categ_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categ_custom_text` text COLLATE utf8_unicode_ci,
  `categ_custom_integer` int(11) DEFAULT NULL,
  `categ_custom_date` date DEFAULT NULL,
  `categ_custom_float` float DEFAULT NULL,
  KEY `editorial_custom_champ` (`categ_custom_champ`),
  KEY `editorial_custom_origine` (`categ_custom_origine`),
  KEY `i_ccv_st` (`categ_custom_small_text`),
  KEY `i_ccv_t` (`categ_custom_text`(255)),
  KEY `i_ccv_i` (`categ_custom_integer`),
  KEY `i_ccv_d` (`categ_custom_date`),
  KEY `i_ccv_f` (`categ_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categ_custom_values`
--

LOCK TABLES `categ_custom_values` WRITE;
/*!40000 ALTER TABLE `categ_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `categ_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `num_thesaurus` int(3) unsigned NOT NULL DEFAULT '1',
  `num_noeud` int(9) unsigned NOT NULL DEFAULT '0',
  `langue` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fr_FR',
  `libelle_categorie` text COLLATE utf8_unicode_ci NOT NULL,
  `note_application` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_public` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_voir` text COLLATE utf8_unicode_ci NOT NULL,
  `index_categorie` text COLLATE utf8_unicode_ci NOT NULL,
  `path_word_categ` text COLLATE utf8_unicode_ci NOT NULL,
  `index_path_word_categ` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`num_noeud`,`langue`),
  KEY `categ_langue` (`langue`),
  KEY `libelle_categorie` (`libelle_categorie`(5))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`num_thesaurus`, `num_noeud`, `langue`, `libelle_categorie`, `note_application`, `comment_public`, `comment_voir`, `index_categorie`, `path_word_categ`, `index_path_word_categ`) VALUES 
(1, 3, 'fr_FR', '~termes non classés', '', '', '', ' termes non classes ', '', ''),
(1, 2, 'fr_FR', '~termes orphelins', '', '', '', ' termes orphelins ', '', ''),
(1, 2, 'es_ES', '~descripotres no clasificados', '', '', '', ' descriptores no clasificados ', '', ''),
(1, 3, 'es_ES', '~descriptores huérfanos', '', '', '', ' descriptores huérfanos ', '', '');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classements`
--

DROP TABLE IF EXISTS `classements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classements` (
  `id_classement` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `type_classement` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BAN',
  `nom_classement` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_classement`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classements`
--

LOCK TABLES `classements` WRITE;
/*!40000 ALTER TABLE `classements` DISABLE KEYS */;
INSERT INTO `classements` VALUES (1,'','_NON CLASSE_'),(2,'BAN','Nouveautés'),(3,'EQU','Nouveautés');
/*!40000 ALTER TABLE `classements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms`
--

DROP TABLE IF EXISTS `cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms` (
  `id_cms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cms_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cms_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `cms_opac_default` int(10) unsigned NOT NULL DEFAULT '0',
  `cms_opac_view_num` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cms`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms`
--

LOCK TABLES `cms` WRITE;
/*!40000 ALTER TABLE `cms` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_articles`
--

DROP TABLE IF EXISTS `cms_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_articles` (
  `id_article` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `article_resume` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `article_contenu` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `article_logo` mediumblob NOT NULL,
  `article_publication_state` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `article_start_date` datetime DEFAULT NULL,
  `article_end_date` datetime DEFAULT NULL,
  `num_section` int(11) NOT NULL DEFAULT '0',
  `article_num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `article_creation_date` date DEFAULT NULL,
  `article_order` int(10) unsigned DEFAULT '0',
  `article_update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_article`),
  KEY `i_cms_article_title` (`article_title`),
  KEY `i_cms_article_publication_state` (`article_publication_state`),
  KEY `i_cms_article_num_parent` (`num_section`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_articles`
--

LOCK TABLES `cms_articles` WRITE;
/*!40000 ALTER TABLE `cms_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_articles_descriptors`
--

DROP TABLE IF EXISTS `cms_articles_descriptors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_articles_descriptors` (
  `num_article` int(11) NOT NULL DEFAULT '0',
  `num_noeud` int(11) NOT NULL DEFAULT '0',
  `article_descriptor_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_article`,`num_noeud`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_articles_descriptors`
--

LOCK TABLES `cms_articles_descriptors` WRITE;
/*!40000 ALTER TABLE `cms_articles_descriptors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_articles_descriptors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_build`
--

DROP TABLE IF EXISTS `cms_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_build` (
  `id_build` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `build_version_num` int(11) NOT NULL DEFAULT '0',
  `build_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cadre',
  `build_fixed` int(11) NOT NULL DEFAULT '0',
  `build_obj` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `build_page` int(11) NOT NULL DEFAULT '0',
  `build_parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `build_child_before` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `build_child_after` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `build_css` text COLLATE utf8_unicode_ci NOT NULL,
  `build_div` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_build`),
  KEY `cms_build_index` (`build_version_num`,`build_obj`),
  KEY `i_build_parent_build_version_num` (`build_parent`,`build_version_num`),
  KEY `i_build_obj_build_version_num` (`build_obj`,`build_version_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_build`
--

LOCK TABLES `cms_build` WRITE;
/*!40000 ALTER TABLE `cms_build` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_build` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cache_cadres`
--

DROP TABLE IF EXISTS `cms_cache_cadres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cache_cadres` (
  `cache_cadre_hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `cache_cadre_type_content` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cache_cadre_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cache_cadre_content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cache_cadre_hash`,`cache_cadre_type_content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cache_cadres`
--

LOCK TABLES `cms_cache_cadres` WRITE;
/*!40000 ALTER TABLE `cms_cache_cadres` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_cache_cadres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cadre_content`
--

DROP TABLE IF EXISTS `cms_cadre_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cadre_content` (
  `id_cadre_content` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cadre_content_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cadre_content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cadre_content_object` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cadre_content_num_cadre` int(10) unsigned NOT NULL DEFAULT '0',
  `cadre_content_data` text COLLATE utf8_unicode_ci NOT NULL,
  `cadre_content_num_cadre_content` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cadre_content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cadre_content`
--

LOCK TABLES `cms_cadre_content` WRITE;
/*!40000 ALTER TABLE `cms_cadre_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_cadre_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cadres`
--

DROP TABLE IF EXISTS `cms_cadres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cadres` (
  `id_cadre` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cadre_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cadre_object` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cadre_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cadre_fixed` int(11) NOT NULL DEFAULT '0',
  `cadre_styles` text COLLATE utf8_unicode_ci NOT NULL,
  `cadre_dom_parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cadre_dom_after` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cadre_url` text COLLATE utf8_unicode_ci NOT NULL,
  `cadre_memo_url` int(11) NOT NULL DEFAULT '0',
  `cadre_classement` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cadre_modcache` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'get_post_view',
  PRIMARY KEY (`id_cadre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cadres`
--

LOCK TABLES `cms_cadres` WRITE;
/*!40000 ALTER TABLE `cms_cadres` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_cadres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_collections`
--

DROP TABLE IF EXISTS `cms_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_collections` (
  `id_collection` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `collection_description` text COLLATE utf8_unicode_ci NOT NULL,
  `collection_num_parent` int(11) NOT NULL DEFAULT '0',
  `collection_num_storage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_collection`),
  KEY `i_cms_collection_title` (`collection_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_collections`
--

LOCK TABLES `cms_collections` WRITE;
/*!40000 ALTER TABLE `cms_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_documents`
--

DROP TABLE IF EXISTS `cms_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_documents` (
  `id_document` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `document_description` text COLLATE utf8_unicode_ci NOT NULL,
  `document_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `document_mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `document_filesize` int(11) NOT NULL DEFAULT '0',
  `document_vignette` mediumblob NOT NULL,
  `document_url` text COLLATE utf8_unicode_ci NOT NULL,
  `document_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `document_create_date` date NOT NULL DEFAULT '0000-00-00',
  `document_num_storage` int(11) NOT NULL DEFAULT '0',
  `document_type_object` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `document_num_object` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_document`),
  KEY `i_cms_document_title` (`document_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_documents`
--

LOCK TABLES `cms_documents` WRITE;
/*!40000 ALTER TABLE `cms_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_documents_links`
--

DROP TABLE IF EXISTS `cms_documents_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_documents_links` (
  `document_link_type_object` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `document_link_num_object` int(11) NOT NULL DEFAULT '0',
  `document_link_num_document` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document_link_type_object`,`document_link_num_object`,`document_link_num_document`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_documents_links`
--

LOCK TABLES `cms_documents_links` WRITE;
/*!40000 ALTER TABLE `cms_documents_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_documents_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_editorial_custom`
--

DROP TABLE IF EXISTS `cms_editorial_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_editorial_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`),
  KEY `i_num_type` (`num_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_editorial_custom`
--

LOCK TABLES `cms_editorial_custom` WRITE;
/*!40000 ALTER TABLE `cms_editorial_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_editorial_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_editorial_custom_lists`
--

DROP TABLE IF EXISTS `cms_editorial_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_editorial_custom_lists` (
  `cms_editorial_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `cms_editorial_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cms_editorial_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `editorial_custom_champ` (`cms_editorial_custom_champ`),
  KEY `editorial_champ_list_value` (`cms_editorial_custom_champ`,`cms_editorial_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_editorial_custom_lists`
--

LOCK TABLES `cms_editorial_custom_lists` WRITE;
/*!40000 ALTER TABLE `cms_editorial_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_editorial_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_editorial_custom_values`
--

DROP TABLE IF EXISTS `cms_editorial_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_editorial_custom_values` (
  `cms_editorial_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `cms_editorial_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `cms_editorial_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cms_editorial_custom_text` text COLLATE utf8_unicode_ci,
  `cms_editorial_custom_integer` int(11) DEFAULT NULL,
  `cms_editorial_custom_date` date DEFAULT NULL,
  `cms_editorial_custom_float` float DEFAULT NULL,
  KEY `editorial_custom_champ` (`cms_editorial_custom_champ`),
  KEY `editorial_custom_origine` (`cms_editorial_custom_origine`),
  KEY `i_ccv_st` (`cms_editorial_custom_small_text`),
  KEY `i_ccv_t` (`cms_editorial_custom_text`(255)),
  KEY `i_ccv_i` (`cms_editorial_custom_integer`),
  KEY `i_ccv_d` (`cms_editorial_custom_date`),
  KEY `i_ccv_f` (`cms_editorial_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_editorial_custom_values`
--

LOCK TABLES `cms_editorial_custom_values` WRITE;
/*!40000 ALTER TABLE `cms_editorial_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_editorial_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_editorial_fields_global_index`
--

DROP TABLE IF EXISTS `cms_editorial_fields_global_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_editorial_fields_global_index` (
  `num_obj` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code_champ` int(3) NOT NULL DEFAULT '0',
  `code_ss_champ` int(3) NOT NULL DEFAULT '0',
  `ordre` int(4) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `pond` int(4) NOT NULL DEFAULT '100',
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`num_obj`,`type`,`code_champ`,`code_ss_champ`,`ordre`),
  KEY `i_value` (`value`(300))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_editorial_fields_global_index`
--

LOCK TABLES `cms_editorial_fields_global_index` WRITE;
/*!40000 ALTER TABLE `cms_editorial_fields_global_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_editorial_fields_global_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_editorial_publications_states`
--

DROP TABLE IF EXISTS `cms_editorial_publications_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_editorial_publications_states` (
  `id_publication_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `editorial_publication_state_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `editorial_publication_state_opac_show` int(1) NOT NULL DEFAULT '0',
  `editorial_publication_state_auth_opac_show` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_publication_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_editorial_publications_states`
--

LOCK TABLES `cms_editorial_publications_states` WRITE;
/*!40000 ALTER TABLE `cms_editorial_publications_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_editorial_publications_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_editorial_types`
--

DROP TABLE IF EXISTS `cms_editorial_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_editorial_types` (
  `id_editorial_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `editorial_type_element` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `editorial_type_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `editorial_type_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `editorial_type_extension` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_editorial_type`),
  KEY `i_editorial_type_element` (`editorial_type_element`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_editorial_types`
--

LOCK TABLES `cms_editorial_types` WRITE;
/*!40000 ALTER TABLE `cms_editorial_types` DISABLE KEYS */;
INSERT INTO `cms_editorial_types` VALUES (1,'article_generic','CP pour Article','',''),(2,'section_generic','CP pour Rubrique','','');
/*!40000 ALTER TABLE `cms_editorial_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_editorial_words_global_index`
--

DROP TABLE IF EXISTS `cms_editorial_words_global_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_editorial_words_global_index` (
  `num_obj` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code_champ` int(11) NOT NULL DEFAULT '0',
  `code_ss_champ` int(11) NOT NULL DEFAULT '0',
  `num_word` int(11) NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `position` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`num_obj`,`type`,`code_champ`,`code_ss_champ`,`num_word`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_editorial_words_global_index`
--

LOCK TABLES `cms_editorial_words_global_index` WRITE;
/*!40000 ALTER TABLE `cms_editorial_words_global_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_editorial_words_global_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_hash`
--

DROP TABLE IF EXISTS `cms_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_hash` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_hash`
--

LOCK TABLES `cms_hash` WRITE;
/*!40000 ALTER TABLE `cms_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_managed_modules`
--

DROP TABLE IF EXISTS `cms_managed_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_managed_modules` (
  `managed_module_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `managed_module_box` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`managed_module_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_managed_modules`
--

LOCK TABLES `cms_managed_modules` WRITE;
/*!40000 ALTER TABLE `cms_managed_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_managed_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_modules_extensions_datas`
--

DROP TABLE IF EXISTS `cms_modules_extensions_datas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_modules_extensions_datas` (
  `id_extension_datas` int(10) NOT NULL AUTO_INCREMENT,
  `extension_datas_module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension_datas_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension_datas_type_element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension_datas_num_element` int(10) NOT NULL DEFAULT '0',
  `extension_datas_datas` blob,
  PRIMARY KEY (`id_extension_datas`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_modules_extensions_datas`
--

LOCK TABLES `cms_modules_extensions_datas` WRITE;
/*!40000 ALTER TABLE `cms_modules_extensions_datas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_modules_extensions_datas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pages` (
  `id_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_description` text COLLATE utf8_unicode_ci NOT NULL,
  `page_classement` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages_env`
--

DROP TABLE IF EXISTS `cms_pages_env`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pages_env` (
  `page_env_num_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_env_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_env_id_selector` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`page_env_num_page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages_env`
--

LOCK TABLES `cms_pages_env` WRITE;
/*!40000 ALTER TABLE `cms_pages_env` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pages_env` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_sections`
--

DROP TABLE IF EXISTS `cms_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_sections` (
  `id_section` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `section_resume` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `section_logo` mediumblob NOT NULL,
  `section_publication_state` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section_start_date` datetime DEFAULT NULL,
  `section_end_date` datetime DEFAULT NULL,
  `section_num_parent` int(11) NOT NULL DEFAULT '0',
  `section_num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `section_creation_date` date DEFAULT NULL,
  `section_order` int(10) unsigned DEFAULT '0',
  `section_update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_section`),
  KEY `i_cms_section_title` (`section_title`),
  KEY `i_cms_section_publication_state` (`section_publication_state`),
  KEY `i_cms_section_num_parent` (`section_num_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_sections`
--

LOCK TABLES `cms_sections` WRITE;
/*!40000 ALTER TABLE `cms_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_sections_descriptors`
--

DROP TABLE IF EXISTS `cms_sections_descriptors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_sections_descriptors` (
  `num_section` int(11) NOT NULL DEFAULT '0',
  `num_noeud` int(11) NOT NULL DEFAULT '0',
  `section_descriptor_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_section`,`num_noeud`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_sections_descriptors`
--

LOCK TABLES `cms_sections_descriptors` WRITE;
/*!40000 ALTER TABLE `cms_sections_descriptors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_sections_descriptors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_vars`
--

DROP TABLE IF EXISTS `cms_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_vars` (
  `id_var` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `var_num_page` int(10) unsigned NOT NULL DEFAULT '0',
  `var_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `var_comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_var`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_vars`
--

LOCK TABLES `cms_vars` WRITE;
/*!40000 ALTER TABLE `cms_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_version`
--

DROP TABLE IF EXISTS `cms_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_version` (
  `id_version` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version_cms_num` int(10) unsigned NOT NULL DEFAULT '0',
  `version_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `version_public` int(10) unsigned NOT NULL DEFAULT '0',
  `version_user` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_version`
--

LOCK TABLES `cms_version` WRITE;
/*!40000 ALTER TABLE `cms_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_custom`
--

DROP TABLE IF EXISTS `collection_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_custom`
--

LOCK TABLES `collection_custom` WRITE;
/*!40000 ALTER TABLE `collection_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_custom_lists`
--

DROP TABLE IF EXISTS `collection_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_custom_lists` (
  `collection_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `collection_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collection_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `editorial_custom_champ` (`collection_custom_champ`),
  KEY `editorial_champ_list_value` (`collection_custom_champ`,`collection_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_custom_lists`
--

LOCK TABLES `collection_custom_lists` WRITE;
/*!40000 ALTER TABLE `collection_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_custom_values`
--

DROP TABLE IF EXISTS `collection_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_custom_values` (
  `collection_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `collection_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `collection_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collection_custom_text` text COLLATE utf8_unicode_ci,
  `collection_custom_integer` int(11) DEFAULT NULL,
  `collection_custom_date` date DEFAULT NULL,
  `collection_custom_float` float DEFAULT NULL,
  KEY `editorial_custom_champ` (`collection_custom_champ`),
  KEY `editorial_custom_origine` (`collection_custom_origine`),
  KEY `i_ccv_st` (`collection_custom_small_text`),
  KEY `i_ccv_t` (`collection_custom_text`(255)),
  KEY `i_ccv_i` (`collection_custom_integer`),
  KEY `i_ccv_d` (`collection_custom_date`),
  KEY `i_ccv_f` (`collection_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_custom_values`
--

LOCK TABLES `collection_custom_values` WRITE;
/*!40000 ALTER TABLE `collection_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `collection_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `collection_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `collection_parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `collection_issn` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `index_coll` text COLLATE utf8_unicode_ci,
  `collection_web` text COLLATE utf8_unicode_ci NOT NULL,
  `collection_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `authority_import_denied` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`collection_id`),
  KEY `collection_name` (`collection_name`),
  KEY `collection_parent` (`collection_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_state`
--

DROP TABLE IF EXISTS `collections_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_state` (
  `collstate_id` int(8) NOT NULL AUTO_INCREMENT,
  `id_serial` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `location_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `state_collections` text COLLATE utf8_unicode_ci NOT NULL,
  `collstate_emplacement` int(8) unsigned NOT NULL DEFAULT '0',
  `collstate_type` int(8) unsigned NOT NULL DEFAULT '0',
  `collstate_origine` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `collstate_cote` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `collstate_archive` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `collstate_statut` int(8) unsigned NOT NULL DEFAULT '0',
  `collstate_lacune` text COLLATE utf8_unicode_ci NOT NULL,
  `collstate_note` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`collstate_id`),
  KEY `i_colls_arc` (`collstate_archive`),
  KEY `i_colls_empl` (`collstate_emplacement`),
  KEY `i_colls_type` (`collstate_type`),
  KEY `i_colls_orig` (`collstate_origine`),
  KEY `i_colls_cote` (`collstate_cote`),
  KEY `i_colls_stat` (`collstate_statut`),
  KEY `i_colls_serial` (`id_serial`),
  KEY `i_colls_loc` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_state`
--

LOCK TABLES `collections_state` WRITE;
/*!40000 ALTER TABLE `collections_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collstate_custom`
--

DROP TABLE IF EXISTS `collstate_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collstate_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) NOT NULL DEFAULT '0',
  `search` int(11) NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collstate_custom`
--

LOCK TABLES `collstate_custom` WRITE;
/*!40000 ALTER TABLE `collstate_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `collstate_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collstate_custom_lists`
--

DROP TABLE IF EXISTS `collstate_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collstate_custom_lists` (
  `collstate_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `collstate_custom_list_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `collstate_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ordre` int(11) NOT NULL DEFAULT '0',
  KEY `collstate_custom_champ` (`collstate_custom_champ`),
  KEY `i_ccl_lv` (`collstate_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collstate_custom_lists`
--

LOCK TABLES `collstate_custom_lists` WRITE;
/*!40000 ALTER TABLE `collstate_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `collstate_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collstate_custom_values`
--

DROP TABLE IF EXISTS `collstate_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collstate_custom_values` (
  `collstate_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `collstate_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `collstate_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collstate_custom_text` text COLLATE utf8_unicode_ci,
  `collstate_custom_integer` int(11) DEFAULT NULL,
  `collstate_custom_date` date DEFAULT NULL,
  `collstate_custom_float` float DEFAULT NULL,
  KEY `collstate_custom_champ` (`collstate_custom_champ`),
  KEY `collstate_custom_origine` (`collstate_custom_origine`),
  KEY `i_ccv_st` (`collstate_custom_small_text`),
  KEY `i_ccv_t` (`collstate_custom_text`(255)),
  KEY `i_ccv_i` (`collstate_custom_integer`),
  KEY `i_ccv_d` (`collstate_custom_date`),
  KEY `i_ccv_f` (`collstate_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collstate_custom_values`
--

LOCK TABLES `collstate_custom_values` WRITE;
/*!40000 ALTER TABLE `collstate_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `collstate_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comptes`
--

DROP TABLE IF EXISTS `comptes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comptes` (
  `id_compte` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_compte_id` int(10) unsigned NOT NULL DEFAULT '0',
  `solde` decimal(16,2) DEFAULT '0.00',
  `prepay_mnt` decimal(16,2) NOT NULL DEFAULT '0.00',
  `proprio_id` int(10) unsigned NOT NULL DEFAULT '0',
  `droits` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_compte`),
  KEY `i_cpt_proprio_id` (`proprio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comptes`
--

LOCK TABLES `comptes` WRITE;
/*!40000 ALTER TABLE `comptes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comptes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors`
--

DROP TABLE IF EXISTS `connectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors` (
  `connector_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parameters` text COLLATE utf8_unicode_ci NOT NULL,
  `repository` int(11) NOT NULL DEFAULT '0',
  `timeout` int(11) NOT NULL DEFAULT '5',
  `retry` int(11) NOT NULL DEFAULT '3',
  `ttl` int(11) NOT NULL DEFAULT '1440',
  PRIMARY KEY (`connector_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors`
--

LOCK TABLES `connectors` WRITE;
/*!40000 ALTER TABLE `connectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_categ`
--

DROP TABLE IF EXISTS `connectors_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_categ` (
  `connectors_categ_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `connectors_categ_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `opac_expanded` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`connectors_categ_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_categ`
--

LOCK TABLES `connectors_categ` WRITE;
/*!40000 ALTER TABLE `connectors_categ` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_categ_sources`
--

DROP TABLE IF EXISTS `connectors_categ_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_categ_sources` (
  `num_categ` smallint(6) NOT NULL DEFAULT '0',
  `num_source` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_categ`,`num_source`),
  KEY `i_num_source` (`num_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_categ_sources`
--

LOCK TABLES `connectors_categ_sources` WRITE;
/*!40000 ALTER TABLE `connectors_categ_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_categ_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_out`
--

DROP TABLE IF EXISTS `connectors_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_out` (
  `connectors_out_id` int(11) NOT NULL AUTO_INCREMENT,
  `connectors_out_config` longblob NOT NULL,
  PRIMARY KEY (`connectors_out_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_out`
--

LOCK TABLES `connectors_out` WRITE;
/*!40000 ALTER TABLE `connectors_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_out_oai_deleted_records`
--

DROP TABLE IF EXISTS `connectors_out_oai_deleted_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_out_oai_deleted_records` (
  `num_set` int(11) unsigned NOT NULL DEFAULT '0',
  `num_notice` int(11) unsigned NOT NULL DEFAULT '0',
  `deletion_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`num_set`,`num_notice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_out_oai_deleted_records`
--

LOCK TABLES `connectors_out_oai_deleted_records` WRITE;
/*!40000 ALTER TABLE `connectors_out_oai_deleted_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_out_oai_deleted_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_out_oai_tokens`
--

DROP TABLE IF EXISTS `connectors_out_oai_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_out_oai_tokens` (
  `connectors_out_oai_token_token` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `connectors_out_oai_token_environnement` text COLLATE utf8_unicode_ci NOT NULL,
  `connectors_out_oai_token_expirationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`connectors_out_oai_token_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_out_oai_tokens`
--

LOCK TABLES `connectors_out_oai_tokens` WRITE;
/*!40000 ALTER TABLE `connectors_out_oai_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_out_oai_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_out_setcache_values`
--

DROP TABLE IF EXISTS `connectors_out_setcache_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_out_setcache_values` (
  `connectors_out_setcache_values_cachenum` int(11) NOT NULL DEFAULT '0',
  `connectors_out_setcache_values_value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`connectors_out_setcache_values_cachenum`,`connectors_out_setcache_values_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_out_setcache_values`
--

LOCK TABLES `connectors_out_setcache_values` WRITE;
/*!40000 ALTER TABLE `connectors_out_setcache_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_out_setcache_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_out_setcaches`
--

DROP TABLE IF EXISTS `connectors_out_setcaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_out_setcaches` (
  `connectors_out_setcache_id` int(11) NOT NULL AUTO_INCREMENT,
  `connectors_out_setcache_setnum` int(11) NOT NULL DEFAULT '0',
  `connectors_out_setcache_lifeduration` int(4) NOT NULL DEFAULT '0',
  `connectors_out_setcache_lifeduration_unit` enum('seconds','minutes','hours','days','weeks','months') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'seconds',
  `connectors_out_setcache_lastupdatedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`connectors_out_setcache_id`),
  UNIQUE KEY `connectors_out_setcache_setnum` (`connectors_out_setcache_setnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_out_setcaches`
--

LOCK TABLES `connectors_out_setcaches` WRITE;
/*!40000 ALTER TABLE `connectors_out_setcaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_out_setcaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_out_setcateg_sets`
--

DROP TABLE IF EXISTS `connectors_out_setcateg_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_out_setcateg_sets` (
  `connectors_out_setcategset_setnum` int(11) NOT NULL,
  `connectors_out_setcategset_categnum` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`connectors_out_setcategset_setnum`,`connectors_out_setcategset_categnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_out_setcateg_sets`
--

LOCK TABLES `connectors_out_setcateg_sets` WRITE;
/*!40000 ALTER TABLE `connectors_out_setcateg_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_out_setcateg_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_out_setcategs`
--

DROP TABLE IF EXISTS `connectors_out_setcategs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_out_setcategs` (
  `connectors_out_setcateg_id` int(11) NOT NULL AUTO_INCREMENT,
  `connectors_out_setcateg_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`connectors_out_setcateg_id`),
  UNIQUE KEY `connectors_out_setcateg_name` (`connectors_out_setcateg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_out_setcategs`
--

LOCK TABLES `connectors_out_setcategs` WRITE;
/*!40000 ALTER TABLE `connectors_out_setcategs` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_out_setcategs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_out_sets`
--

DROP TABLE IF EXISTS `connectors_out_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_out_sets` (
  `connector_out_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `connector_out_set_caption` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `connector_out_set_type` int(4) NOT NULL DEFAULT '0',
  `connector_out_set_config` longblob NOT NULL,
  `being_refreshed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`connector_out_set_id`),
  UNIQUE KEY `connector_out_set_caption` (`connector_out_set_caption`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_out_sets`
--

LOCK TABLES `connectors_out_sets` WRITE;
/*!40000 ALTER TABLE `connectors_out_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_out_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_out_sources`
--

DROP TABLE IF EXISTS `connectors_out_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_out_sources` (
  `connectors_out_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `connectors_out_sources_connectornum` int(11) NOT NULL DEFAULT '0',
  `connectors_out_source_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `connectors_out_source_comment` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `connectors_out_source_config` longblob NOT NULL,
  PRIMARY KEY (`connectors_out_source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_out_sources`
--

LOCK TABLES `connectors_out_sources` WRITE;
/*!40000 ALTER TABLE `connectors_out_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_out_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_out_sources_esgroups`
--

DROP TABLE IF EXISTS `connectors_out_sources_esgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_out_sources_esgroups` (
  `connectors_out_source_esgroup_sourcenum` int(11) NOT NULL DEFAULT '0',
  `connectors_out_source_esgroup_esgroupnum` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`connectors_out_source_esgroup_sourcenum`,`connectors_out_source_esgroup_esgroupnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_out_sources_esgroups`
--

LOCK TABLES `connectors_out_sources_esgroups` WRITE;
/*!40000 ALTER TABLE `connectors_out_sources_esgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_out_sources_esgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectors_sources`
--

DROP TABLE IF EXISTS `connectors_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectors_sources` (
  `source_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_connector` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parameters` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repository` int(11) NOT NULL DEFAULT '0',
  `timeout` int(11) NOT NULL DEFAULT '5',
  `retry` int(11) NOT NULL DEFAULT '3',
  `ttl` int(11) NOT NULL DEFAULT '1440',
  `opac_allowed` int(3) unsigned NOT NULL DEFAULT '0',
  `rep_upload` int(11) NOT NULL DEFAULT '0',
  `upload_doc_num` int(11) NOT NULL DEFAULT '1',
  `enrichment` int(11) NOT NULL DEFAULT '0',
  `opac_affiliate_search` int(11) NOT NULL DEFAULT '0',
  `opac_selected` int(3) unsigned NOT NULL DEFAULT '0',
  `type_enrichment_allowed` text COLLATE utf8_unicode_ci NOT NULL,
  `ico_notice` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_sync_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectors_sources`
--

LOCK TABLES `connectors_sources` WRITE;
/*!40000 ALTER TABLE `connectors_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectors_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordonnees`
--

DROP TABLE IF EXISTS `coordonnees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordonnees` (
  `id_contact` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `type_coord` int(1) unsigned NOT NULL DEFAULT '0',
  `num_entite` int(5) unsigned NOT NULL DEFAULT '0',
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `adr1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `adr2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cp` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ville` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `etat` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pays` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tel1` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tel2` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `commentaires` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_contact`),
  KEY `i_num_entite` (`num_entite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordonnees`
--

LOCK TABLES `coordonnees` WRITE;
/*!40000 ALTER TABLE `coordonnees` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordonnees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes`
--

DROP TABLE IF EXISTS `demandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes` (
  `id_demande` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_demandeur` int(10) unsigned NOT NULL DEFAULT '0',
  `theme_demande` int(3) NOT NULL DEFAULT '0',
  `type_demande` int(3) NOT NULL DEFAULT '0',
  `etat_demande` int(3) NOT NULL DEFAULT '0',
  `date_demande` date NOT NULL DEFAULT '0000-00-00',
  `date_prevue` date NOT NULL DEFAULT '0000-00-00',
  `deadline_demande` date NOT NULL DEFAULT '0000-00-00',
  `titre_demande` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sujet_demande` text COLLATE utf8_unicode_ci NOT NULL,
  `progression` mediumint(3) NOT NULL DEFAULT '0',
  `num_user_cloture` mediumint(3) NOT NULL DEFAULT '0',
  `num_notice` int(10) NOT NULL DEFAULT '0',
  `dmde_read_gestion` int(1) unsigned NOT NULL DEFAULT '0',
  `reponse_finale` text COLLATE utf8_unicode_ci,
  `dmde_read_opac` int(1) unsigned NOT NULL DEFAULT '0',
  `demande_note_num` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_demande`),
  KEY `i_num_demandeur` (`num_demandeur`),
  KEY `i_date_demande` (`date_demande`),
  KEY `i_deadline_demande` (`deadline_demande`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes`
--

LOCK TABLES `demandes` WRITE;
/*!40000 ALTER TABLE `demandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_actions`
--

DROP TABLE IF EXISTS `demandes_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_actions` (
  `id_action` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_action` int(3) NOT NULL DEFAULT '0',
  `statut_action` int(3) NOT NULL DEFAULT '0',
  `sujet_action` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `detail_action` text COLLATE utf8_unicode_ci NOT NULL,
  `date_action` date NOT NULL DEFAULT '0000-00-00',
  `deadline_action` date NOT NULL DEFAULT '0000-00-00',
  `temps_passe` float DEFAULT NULL,
  `cout` mediumint(3) NOT NULL DEFAULT '0',
  `progression_action` mediumint(3) NOT NULL DEFAULT '0',
  `prive_action` int(1) NOT NULL DEFAULT '0',
  `num_demande` int(10) NOT NULL DEFAULT '0',
  `actions_num_user` int(10) unsigned NOT NULL DEFAULT '0',
  `actions_type_user` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `actions_read_opac` int(11) NOT NULL DEFAULT '0',
  `actions_read_gestion` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`),
  KEY `i_date_action` (`date_action`),
  KEY `i_deadline_action` (`deadline_action`),
  KEY `i_num_demande` (`num_demande`),
  KEY `i_actions_user` (`actions_num_user`,`actions_type_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_actions`
--

LOCK TABLES `demandes_actions` WRITE;
/*!40000 ALTER TABLE `demandes_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandes_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_custom`
--

DROP TABLE IF EXISTS `demandes_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `titre` varchar(255) DEFAULT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'text',
  `datatype` varchar(10) NOT NULL DEFAULT '',
  `options` text,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_custom`
--

LOCK TABLES `demandes_custom` WRITE;
/*!40000 ALTER TABLE `demandes_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandes_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_custom_lists`
--

DROP TABLE IF EXISTS `demandes_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_custom_lists` (
  `demandes_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `demandes_custom_list_value` varchar(255) DEFAULT NULL,
  `demandes_custom_list_lib` varchar(255) DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `i_demandes_custom_champ` (`demandes_custom_champ`),
  KEY `i_demandes_champ_list_value` (`demandes_custom_champ`,`demandes_custom_list_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_custom_lists`
--

LOCK TABLES `demandes_custom_lists` WRITE;
/*!40000 ALTER TABLE `demandes_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandes_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_custom_values`
--

DROP TABLE IF EXISTS `demandes_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_custom_values` (
  `demandes_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `demandes_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `demandes_custom_small_text` varchar(255) DEFAULT NULL,
  `demandes_custom_text` text,
  `demandes_custom_integer` int(11) DEFAULT NULL,
  `demandes_custom_date` date DEFAULT NULL,
  `demandes_custom_float` float DEFAULT NULL,
  KEY `i_demandes_custom_champ` (`demandes_custom_champ`),
  KEY `i_demandes_custom_origine` (`demandes_custom_origine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_custom_values`
--

LOCK TABLES `demandes_custom_values` WRITE;
/*!40000 ALTER TABLE `demandes_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandes_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_notes`
--

DROP TABLE IF EXISTS `demandes_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_notes` (
  `id_note` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prive` int(1) NOT NULL DEFAULT '0',
  `rapport` int(1) NOT NULL DEFAULT '0',
  `contenu` text COLLATE utf8_unicode_ci NOT NULL,
  `date_note` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_action` int(10) NOT NULL DEFAULT '0',
  `num_note_parent` int(10) NOT NULL DEFAULT '0',
  `notes_num_user` int(10) unsigned NOT NULL DEFAULT '0',
  `notes_type_user` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `notes_read_gestion` int(1) unsigned NOT NULL DEFAULT '0',
  `notes_read_opac` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_note`),
  KEY `i_date_note` (`date_note`),
  KEY `i_num_action` (`num_action`),
  KEY `i_num_note_parent` (`num_note_parent`),
  KEY `i_notes_user` (`notes_num_user`,`notes_type_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_notes`
--

LOCK TABLES `demandes_notes` WRITE;
/*!40000 ALTER TABLE `demandes_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandes_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_theme`
--

DROP TABLE IF EXISTS `demandes_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_theme` (
  `id_theme` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_theme` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_theme`
--

LOCK TABLES `demandes_theme` WRITE;
/*!40000 ALTER TABLE `demandes_theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandes_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_type`
--

DROP TABLE IF EXISTS `demandes_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_type` (
  `id_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `allowed_actions` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_type`
--

LOCK TABLES `demandes_type` WRITE;
/*!40000 ALTER TABLE `demandes_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandes_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_users`
--

DROP TABLE IF EXISTS `demandes_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_users` (
  `num_user` int(10) NOT NULL DEFAULT '0',
  `num_demande` int(10) NOT NULL DEFAULT '0',
  `date_creation` date NOT NULL DEFAULT '0000-00-00',
  `users_statut` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_user`,`num_demande`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_users`
--

LOCK TABLES `demandes_users` WRITE;
/*!40000 ALTER TABLE `demandes_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandes_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docs_codestat`
--

DROP TABLE IF EXISTS `docs_codestat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs_codestat` (
  `idcode` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `codestat_libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statisdoc_codage_import` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `statisdoc_owner` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcode`),
  KEY `statisdoc_owner` (`statisdoc_owner`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs_codestat`
--

LOCK TABLES `docs_codestat` WRITE;
/*!40000 ALTER TABLE `docs_codestat` DISABLE KEYS */;
INSERT INTO `docs_codestat` VALUES (10,'Indeterminado','u',0),(11,'Jóvenes','j',0),(12,'Adultos','a',0);
/*!40000 ALTER TABLE `docs_codestat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docs_location`
--

DROP TABLE IF EXISTS `docs_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs_location` (
  `idlocation` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `location_libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locdoc_codage_import` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `locdoc_owner` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `location_pic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location_visible_opac` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `adr1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `adr2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cp` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `town` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `commentaire` text COLLATE utf8_unicode_ci NOT NULL,
  `transfert_ordre` smallint(2) unsigned NOT NULL DEFAULT '9999',
  `transfert_statut_defaut` smallint(5) unsigned NOT NULL DEFAULT '0',
  `num_infopage` int(6) unsigned NOT NULL DEFAULT '0',
  `css_style` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_num` int(11) NOT NULL DEFAULT '0',
  `surloc_used` tinyint(1) NOT NULL DEFAULT '0',
  `show_a2z` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idlocation`),
  KEY `locdoc_owner` (`locdoc_owner`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs_location`
--

LOCK TABLES `docs_location` WRITE;
/*!40000 ALTER TABLE `docs_location` DISABLE KEYS */;
INSERT INTO `docs_location` VALUES (1,'Biblioteca principal','',2,'images/site/bib_princ.jpg',1,'Biblioteca test de PMB','PMB Services','24 & 26, place des Halles','72500','CHATEAU DU LOIR','','Francia','02 43 440 660','pmb@sigb.net','http://www.sigb.net/','logo_default.jpg','',9999,0,0,'',0,0,0),(2,'Reserva','',2,'',0,'Biblioteca test de PMB','','','','','','','','pmb@sigb.net','http://www.sigb.net','logo_default.jpg','',9999,0,0,'',0,0,0),(7,'Bibliobús','',2,'images/site/bibliobus.jpg',1,'Biblioteca test de PMB','rue de la culture','','72500','Château du loir','','Francia','02 43 440 660','pmb@sigb.net','http://www.sigb.net','logo_default.jpg','',9999,0,0,'',0,0,0);
/*!40000 ALTER TABLE `docs_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docs_section`
--

DROP TABLE IF EXISTS `docs_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs_section` (
  `idsection` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `section_libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdoc_codage_import` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sdoc_owner` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `section_pic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `section_visible_opac` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idsection`),
  KEY `sdoc_owner` (`sdoc_owner`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs_section`
--

LOCK TABLES `docs_section` WRITE;
/*!40000 ALTER TABLE `docs_section` DISABLE KEYS */;
INSERT INTO `docs_section` VALUES (10,'Documentales','',2,'images/site/documentaire.jpg',1),(11,'Documentales Infantiles','',2,'images/site/documentaire.jpg',1),(12,'Novelas Infantiles','',2,'images/site/enfants.jpg',1),(13,'Novelas Juveniles','',2,'images/site/sec3.jpg',1),(16,'Cómics Adultos','',2,'images/site/sec1.jpg',1),(17,'Cómics Infantiles','',2,'images/site/enfants.jpg',1),(18,'H (Historia local)','',2,'images/site/histoire.jpg',1),(19,'FR (Fondo Regional)','',2,'images/site/sec4.jpg',1),(20,'Cómics Juveniles','',2,'images/site/sec3.jpg',1),(21,'Novelas policíacas','',2,'images/site/sec1.jpg',1),(23,'Novelas letra grande','',2,'images/site/large_vue.jpg',1),(24,'Novelas & Novelas extranjeras','',2,'images/site/sec1.jpg',1),(25,'Documentales Juveniles','',2,'images/site/documentaire.jpg',1),(26,'Cuentos Infantiles','',2,'images/site/enfants.jpg',1);
/*!40000 ALTER TABLE `docs_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docs_statut`
--

DROP TABLE IF EXISTS `docs_statut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs_statut` (
  `idstatut` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `statut_libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statut_libelle_opac` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `pret_flag` tinyint(4) NOT NULL DEFAULT '1',
  `statusdoc_codage_import` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `statusdoc_owner` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `transfert_flag` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `statut_visible_opac` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `statut_allow_resa` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idstatut`),
  KEY `statusdoc_owner` (`statusdoc_owner`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs_statut`
--

LOCK TABLES `docs_statut` WRITE;
/*!40000 ALTER TABLE `docs_statut` DISABLE KEYS */;
INSERT INTO `docs_statut` VALUES (1,'Documento en buen estado','',1,'',0,0,1,1),(2,'En curso de importación/adquisición','',0,'',0,1,1,0),(11,'Deteriorado','',0,'',0,1,1,0),(12,'Perdido','',0,'',0,1,1,0),(13,'Consulta en sala','',0,'',0,1,1,0),(14,'En depósito','',0,'',0,1,1,0);
/*!40000 ALTER TABLE `docs_statut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docs_type`
--

DROP TABLE IF EXISTS `docs_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs_type` (
  `idtyp_doc` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `tdoc_libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duree_pret` smallint(6) NOT NULL DEFAULT '31',
  `duree_resa` int(6) unsigned NOT NULL DEFAULT '15',
  `tdoc_owner` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tdoc_codage_import` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tarif_pret` decimal(16,2) NOT NULL DEFAULT '0.00',
  `short_loan_duration` int(6) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtyp_doc`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs_type`
--

LOCK TABLES `docs_type` WRITE;
/*!40000 ALTER TABLE `docs_type` DISABLE KEYS */;
INSERT INTO `docs_type` VALUES (1,'Libro',14,15,2,'',0.00,1),(12,'Cinta de vídeo',14,15,2,'',0.00,1),(13,'CD audio',14,15,2,'',0.00,1),(14,'DVD',5,15,2,'',0.00,1),(15,'Obra de arte',5,15,2,'',0.00,1),(16,'Tarjetas y planos',31,15,2,'',0.00,1),(17,'Cederrones',10,5,2,'',0.00,1),(18,'Publicaciones peródicas',8,5,0,'',0.00,1);
/*!40000 ALTER TABLE `docs_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docsloc_section`
--

DROP TABLE IF EXISTS `docsloc_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docsloc_section` (
  `num_section` int(5) unsigned NOT NULL DEFAULT '0',
  `num_location` int(5) unsigned NOT NULL DEFAULT '0',
  `num_pclass` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_section`,`num_location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docsloc_section`
--

LOCK TABLES `docsloc_section` WRITE;
/*!40000 ALTER TABLE `docsloc_section` DISABLE KEYS */;
INSERT INTO `docsloc_section` VALUES (10,1,0),(10,7,0),(11,1,0),(11,7,0),(12,1,0),(12,7,0),(13,1,0),(13,7,0),(16,1,0),(16,7,0),(17,1,0),(17,7,0),(18,1,0),(18,7,0),(19,1,0),(19,7,0),(20,1,0),(20,7,0),(21,1,0),(21,7,0),(23,1,0),(23,7,0),(24,1,0),(24,7,0),(25,1,0),(25,7,0),(26,1,0),(26,7,0);
/*!40000 ALTER TABLE `docsloc_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docwatch_categories`
--

DROP TABLE IF EXISTS `docwatch_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docwatch_categories` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_num_parent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docwatch_categories`
--

LOCK TABLES `docwatch_categories` WRITE;
/*!40000 ALTER TABLE `docwatch_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `docwatch_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docwatch_datasources`
--

DROP TABLE IF EXISTS `docwatch_datasources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docwatch_datasources` (
  `id_datasource` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datasource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `datasource_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `datasource_ttl` int(10) unsigned NOT NULL DEFAULT '0',
  `datasource_last_date` datetime DEFAULT NULL,
  `datasource_parameters` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `datasource_num_category` int(10) unsigned NOT NULL DEFAULT '0',
  `datasource_default_interesting` int(10) unsigned NOT NULL DEFAULT '0',
  `datasource_clean_html` int(10) unsigned NOT NULL DEFAULT '1',
  `datasource_num_watch` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_datasource`),
  KEY `i_docwatch_datasource_title` (`datasource_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docwatch_datasources`
--

LOCK TABLES `docwatch_datasources` WRITE;
/*!40000 ALTER TABLE `docwatch_datasources` DISABLE KEYS */;
/*!40000 ALTER TABLE `docwatch_datasources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docwatch_items`
--

DROP TABLE IF EXISTS `docwatch_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docwatch_items` (
  `id_item` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_summary` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `item_content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `item_added_date` datetime DEFAULT NULL,
  `item_publication_date` datetime DEFAULT NULL,
  `item_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_logo_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_status` int(10) unsigned NOT NULL DEFAULT '0',
  `item_interesting` int(10) unsigned NOT NULL DEFAULT '0',
  `item_num_article` int(10) unsigned NOT NULL DEFAULT '0',
  `item_num_section` int(10) unsigned NOT NULL DEFAULT '0',
  `item_num_notice` int(10) unsigned NOT NULL DEFAULT '0',
  `item_num_datasource` int(10) unsigned NOT NULL DEFAULT '0',
  `item_num_watch` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_item`),
  KEY `i_docwatch_item_type` (`item_type`),
  KEY `i_docwatch_item_title` (`item_title`),
  KEY `i_docwatch_item_num_article` (`item_num_article`),
  KEY `i_docwatch_item_num_section` (`item_num_section`),
  KEY `i_docwatch_item_num_notice` (`item_num_notice`),
  KEY `i_docwatch_item_num_watch` (`item_num_watch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docwatch_items`
--

LOCK TABLES `docwatch_items` WRITE;
/*!40000 ALTER TABLE `docwatch_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `docwatch_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docwatch_items_descriptors`
--

DROP TABLE IF EXISTS `docwatch_items_descriptors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docwatch_items_descriptors` (
  `num_item` int(10) unsigned NOT NULL DEFAULT '0',
  `num_noeud` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_item`,`num_noeud`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docwatch_items_descriptors`
--

LOCK TABLES `docwatch_items_descriptors` WRITE;
/*!40000 ALTER TABLE `docwatch_items_descriptors` DISABLE KEYS */;
/*!40000 ALTER TABLE `docwatch_items_descriptors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docwatch_items_tags`
--

DROP TABLE IF EXISTS `docwatch_items_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docwatch_items_tags` (
  `num_item` int(10) unsigned NOT NULL DEFAULT '0',
  `num_tag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_item`,`num_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docwatch_items_tags`
--

LOCK TABLES `docwatch_items_tags` WRITE;
/*!40000 ALTER TABLE `docwatch_items_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `docwatch_items_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docwatch_selectors`
--

DROP TABLE IF EXISTS `docwatch_selectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docwatch_selectors` (
  `id_selector` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `selector_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `selector_num_datasource` int(10) unsigned NOT NULL DEFAULT '0',
  `selector_parameters` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_selector`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docwatch_selectors`
--

LOCK TABLES `docwatch_selectors` WRITE;
/*!40000 ALTER TABLE `docwatch_selectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `docwatch_selectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docwatch_tags`
--

DROP TABLE IF EXISTS `docwatch_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docwatch_tags` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docwatch_tags`
--

LOCK TABLES `docwatch_tags` WRITE;
/*!40000 ALTER TABLE `docwatch_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `docwatch_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docwatch_watches`
--

DROP TABLE IF EXISTS `docwatch_watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docwatch_watches` (
  `id_watch` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `watch_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `watch_owner` int(10) unsigned NOT NULL DEFAULT '0',
  `watch_allowed_users` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `watch_num_category` int(10) unsigned NOT NULL DEFAULT '0',
  `watch_last_date` datetime DEFAULT NULL,
  `watch_ttl` int(10) unsigned NOT NULL DEFAULT '0',
  `watch_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `watch_logo_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `watch_record_default_type` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `watch_record_default_status` int(10) unsigned NOT NULL DEFAULT '0',
  `watch_article_default_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `watch_article_default_content_type` int(10) unsigned NOT NULL DEFAULT '0',
  `watch_article_default_publication_status` int(10) unsigned NOT NULL DEFAULT '0',
  `watch_section_default_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `watch_section_default_content_type` int(10) unsigned NOT NULL DEFAULT '0',
  `watch_section_default_publication_status` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_watch`),
  KEY `i_docwatch_watch_title` (`watch_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docwatch_watches`
--

LOCK TABLES `docwatch_watches` WRITE;
/*!40000 ALTER TABLE `docwatch_watches` DISABLE KEYS */;
/*!40000 ALTER TABLE `docwatch_watches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsi_archive`
--

DROP TABLE IF EXISTS `dsi_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsi_archive` (
  `num_banette_arc` int(10) unsigned NOT NULL DEFAULT '0',
  `num_notice_arc` int(10) unsigned NOT NULL DEFAULT '0',
  `date_diff_arc` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`num_banette_arc`,`num_notice_arc`,`date_diff_arc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsi_archive`
--

LOCK TABLES `dsi_archive` WRITE;
/*!40000 ALTER TABLE `dsi_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsi_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editions_states`
--

DROP TABLE IF EXISTS `editions_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editions_states` (
  `id_editions_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `editions_state_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `editions_state_num_classement` int(11) NOT NULL DEFAULT '0',
  `editions_state_used_datasource` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `editions_state_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `editions_state_fieldslist` text COLLATE utf8_unicode_ci NOT NULL,
  `editions_state_fieldsparams` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_editions_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editions_states`
--

LOCK TABLES `editions_states` WRITE;
/*!40000 ALTER TABLE `editions_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `editions_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr`
--

DROP TABLE IF EXISTS `empr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr` (
  `id_empr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empr_cb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empr_nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_adr1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_adr2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_cp` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_tel1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_tel2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_prof` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_year` int(4) unsigned NOT NULL DEFAULT '0',
  `empr_categ` smallint(5) unsigned NOT NULL DEFAULT '0',
  `empr_codestat` smallint(5) unsigned NOT NULL DEFAULT '0',
  `empr_creation` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `empr_modif` date NOT NULL DEFAULT '0000-00-00',
  `empr_sexe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `empr_login` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_password_is_encrypted` int(1) NOT NULL DEFAULT '0',
  `empr_digest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_date_adhesion` date DEFAULT NULL,
  `empr_date_expiration` date DEFAULT NULL,
  `empr_msg` text COLLATE utf8_unicode_ci,
  `empr_lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fr_FR',
  `empr_ldap` tinyint(1) unsigned DEFAULT '0',
  `type_abt` int(1) NOT NULL DEFAULT '0',
  `last_loan_date` date DEFAULT NULL,
  `empr_location` int(6) unsigned NOT NULL DEFAULT '1',
  `date_fin_blocage` date NOT NULL DEFAULT '0000-00-00',
  `total_loans` bigint(20) unsigned NOT NULL DEFAULT '0',
  `empr_statut` bigint(20) unsigned NOT NULL DEFAULT '1',
  `cle_validation` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `empr_sms` int(1) unsigned NOT NULL DEFAULT '0',
  `empr_subscription_action` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_empr`),
  UNIQUE KEY `empr_cb` (`empr_cb`),
  KEY `empr_nom` (`empr_nom`),
  KEY `empr_date_adhesion` (`empr_date_adhesion`),
  KEY `empr_date_expiration` (`empr_date_expiration`),
  KEY `i_empr_categ` (`empr_categ`),
  KEY `i_empr_codestat` (`empr_codestat`),
  KEY `i_empr_location` (`empr_location`),
  KEY `i_empr_statut` (`empr_statut`),
  KEY `i_empr_typabt` (`type_abt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr`
--

LOCK TABLES `empr` WRITE;
/*!40000 ALTER TABLE `empr` DISABLE KEYS */;
/*!40000 ALTER TABLE `empr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_caddie`
--

DROP TABLE IF EXISTS `empr_caddie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_caddie` (
  `idemprcaddie` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autorisations` mediumtext COLLATE utf8_unicode_ci,
  `empr_caddie_classement` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idemprcaddie`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_caddie`
--

LOCK TABLES `empr_caddie` WRITE;
/*!40000 ALTER TABLE `empr_caddie` DISABLE KEYS */;
INSERT INTO `empr_caddie` VALUES (1,'Panier de lecteurs','','1','');
/*!40000 ALTER TABLE `empr_caddie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_caddie_content`
--

DROP TABLE IF EXISTS `empr_caddie_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_caddie_content` (
  `empr_caddie_id` int(8) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flag` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`empr_caddie_id`,`object_id`),
  KEY `object_id` (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_caddie_content`
--

LOCK TABLES `empr_caddie_content` WRITE;
/*!40000 ALTER TABLE `empr_caddie_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `empr_caddie_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_caddie_procs`
--

DROP TABLE IF EXISTS `empr_caddie_procs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_caddie_procs` (
  `idproc` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SELECT',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `requete` blob NOT NULL,
  `comment` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `autorisations` mediumtext COLLATE utf8_unicode_ci,
  `parameters` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`idproc`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_caddie_procs`
--

LOCK TABLES `empr_caddie_procs` WRITE;
/*!40000 ALTER TABLE `empr_caddie_procs` DISABLE KEYS */;
INSERT INTO `empr_caddie_procs` VALUES (1,'ACTION','Changement de localisation des lecteurs d\'un panier','update empr set empr_location=\'!!new_location!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_location\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouvelle localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(2,'ACTION','Changement de catégorie des lecteurs d\'un panier','update empr set empr_categ=\'!!new_categ!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_categ\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouvelle catégorie]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select id_categ_empr, libelle from empr_categ order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(3,'ACTION','Changement de ville des lecteurs d\'un panier','update empr set empr_ville=\'!!new_ville!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_ville\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Nouvelle Ville]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>25</SIZE>\r\n <MAXSIZE>255</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(4,'ACTION','Changement de code postal des lecteurs d\'un panier','update empr set empr_cp=\'!!new_cp!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_cp\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Nouveau code postal]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>10</SIZE>\r\n <MAXSIZE>10</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(5,'ACTION','Changement de pays des lecteurs d\'un panier','update empr set empr_pays=\'!!new_pays!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_pays\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Nouveau pays]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>25</SIZE>\r\n <MAXSIZE>255</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(6,'ACTION','Changement de statut des lecteurs d\'un panier','update empr set empr_statut=\'!!nouveau_statut!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"nouveau_statut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouveau statut]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idstatut, statut_libelle from empr_statut order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(7,'ACTION','Changement de code statistique des lecteurs d\'un panier','update empr set empr_codestat=\'!!new_codestat!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_codestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouveau code statistique]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, libelle from empr_codestat order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(8,'ACTION','Changement de mot de passe des lecteurs d\'un panier','update empr set empr_password=\'!!new_password!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_password\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Nouveau mot de passe]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>10</SIZE>\r\n <MAXSIZE>10</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(9,'ACTION','Changement de date de début d\'adhésion des lecteurs d\'un panier','update empr set empr_date_adhesion=\'!!new_date_adhesion!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_date_adhesion\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouvelle date de début d\'adhésion]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>'),(10,'ACTION','Changement de date de fin d\'adhésion des lecteurs d\'un panier','update empr set empr_date_expiration=\'!!new_date_expiration!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_date_expiration\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouvelle date de fin d\'adhésion]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>'),(11,'ACTION','Changement de sexe des lecteurs d\'un panier','update empr set empr_sexe=!!new_sexe!! where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_sexe\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Nouveau sexe]]></ALIAS>\n  <TYPE>list</TYPE>\n<OPTIONS FOR=\"list\">\r\n <MULTIPLE>no</MULTIPLE>\r\n <ITEMS>\r\n  <ITEM VALUE=\"1\"><![CDATA[Masculin]]></ITEM>\r\n  <ITEM VALUE=\"2\"><![CDATA[Féminin]]></ITEM>\r\n  <ITEM VALUE=\"0\"><![CDATA[Indéterminé]]></ITEM>\r\n </ITEMS>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(14,'ACTION','Changement de message des lecteurs d\'un panier','update empr set empr_msg=\'!!new_msg!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_msg\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Nouveau message]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>25</SIZE>\r\n <MAXSIZE>255</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(16,'SELECT','Sélection / pointage des lecteurs sans email','select id_empr as object_id from empr where trim(empr_mail)=\'\'','',' 1 ',NULL),(18,'ACTION','Abonnement des lecteurs d\'un panier à une bannette publique (DSI)','insert into bannette_abon (num_bannette, num_empr, actif) select !!bannette!!, id_empr, 1 from empr where id_empr in (CADDIE(EMPR)) ','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"bannette\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[bannette]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select id_bannette, nom_bannette from bannettes where proprio_bannette=0 order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(19,'ACTION','Désabonnement des lecteurs d\'un panier d\'une bannette publique (DSI)','delete from bannette_abon where num_bannette=!!bannette!! and num_empr=id_empr and actif=1 where id_empr in (CADDIE(EMPR)) ','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"bannette\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[bannette]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select id_bannette, nom_bannette from bannettes where proprio_bannette=0 order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(21,'ACTION','Changement de profession des lecteurs d\'un panier','update empr set empr_prof=\'!!new_prof!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_prof\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Nouvelle profession]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>25</SIZE>\r\n <MAXSIZE>255</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>'),(22,'ACTION','Changement de type d\'abonnement des lecteurs d\'un panier','update empr set type_abt=\'!!new_type_abt!!\' where id_empr in (CADDIE(EMPR))','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"new_type_abt\" MANDATORY=\"no\">\n  <ALIAS><![CDATA[Nouveau type d\'abonnement]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select id_type_abt, type_abt_libelle from type_abts order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"0\"><![CDATA[Non défini]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>');
/*!40000 ALTER TABLE `empr_caddie_procs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_categ`
--

DROP TABLE IF EXISTS `empr_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_categ` (
  `id_categ_empr` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `duree_adhesion` int(10) unsigned DEFAULT '365',
  `tarif_abt` decimal(16,2) NOT NULL DEFAULT '0.00',
  `age_min` int(3) unsigned NOT NULL DEFAULT '0',
  `age_max` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_categ_empr`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_categ`
--

LOCK TABLES `empr_categ` WRITE;
/*!40000 ALTER TABLE `empr_categ` DISABLE KEYS */;
INSERT INTO `empr_categ` VALUES (1,'Niños',3650,0.00,0,0),(2,'Jubilados',3650,0.00,0,0),(3,'Empleados',3650,0.00,0,0),(4,'Sin empleo',3650,0.00,0,0),(5,'Alumnos de secundaria/Estudiantes',3650,0.00,0,0),(6,'Colegiales',3650,0.00,0,0),(7,'Adultos',3650,0.00,0,0);
/*!40000 ALTER TABLE `empr_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_codestat`
--

DROP TABLE IF EXISTS `empr_codestat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_codestat` (
  `idcode` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DEFAULT',
  PRIMARY KEY (`idcode`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_codestat`
--

LOCK TABLES `empr_codestat` WRITE;
/*!40000 ALTER TABLE `empr_codestat` DISABLE KEYS */;
INSERT INTO `empr_codestat` VALUES (2,'Comunidad de Municipios'),(3,'Municipio'),(4,'Departamento'),(5,'Europa'),(6,'Fuera de Europa'),(7,'Francia');
/*!40000 ALTER TABLE `empr_codestat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_custom`
--

DROP TABLE IF EXISTS `empr_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_custom`
--

LOCK TABLES `empr_custom` WRITE;
/*!40000 ALTER TABLE `empr_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `empr_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_custom_lists`
--

DROP TABLE IF EXISTS `empr_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_custom_lists` (
  `empr_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `empr_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empr_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `empr_custom_champ` (`empr_custom_champ`),
  KEY `i_ecl_lv` (`empr_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_custom_lists`
--

LOCK TABLES `empr_custom_lists` WRITE;
/*!40000 ALTER TABLE `empr_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `empr_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_custom_values`
--

DROP TABLE IF EXISTS `empr_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_custom_values` (
  `empr_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `empr_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `empr_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empr_custom_text` text COLLATE utf8_unicode_ci,
  `empr_custom_integer` int(11) DEFAULT NULL,
  `empr_custom_date` date DEFAULT NULL,
  `empr_custom_float` float DEFAULT NULL,
  KEY `empr_custom_champ` (`empr_custom_champ`),
  KEY `empr_custom_origine` (`empr_custom_origine`),
  KEY `i_ecv_st` (`empr_custom_small_text`),
  KEY `i_ecv_t` (`empr_custom_text`(255)),
  KEY `i_ecv_i` (`empr_custom_integer`),
  KEY `i_ecv_d` (`empr_custom_date`),
  KEY `i_ecv_f` (`empr_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_custom_values`
--

LOCK TABLES `empr_custom_values` WRITE;
/*!40000 ALTER TABLE `empr_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `empr_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_grilles`
--

DROP TABLE IF EXISTS `empr_grilles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_grilles` (
  `empr_grille_categ` int(5) NOT NULL DEFAULT '0',
  `empr_grille_location` int(5) NOT NULL DEFAULT '0',
  `empr_grille_format` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`empr_grille_categ`,`empr_grille_location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_grilles`
--

LOCK TABLES `empr_grilles` WRITE;
/*!40000 ALTER TABLE `empr_grilles` DISABLE KEYS */;
/*!40000 ALTER TABLE `empr_grilles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_groupe`
--

DROP TABLE IF EXISTS `empr_groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_groupe` (
  `empr_id` int(6) unsigned NOT NULL DEFAULT '0',
  `groupe_id` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`empr_id`,`groupe_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_groupe`
--

LOCK TABLES `empr_groupe` WRITE;
/*!40000 ALTER TABLE `empr_groupe` DISABLE KEYS */;
/*!40000 ALTER TABLE `empr_groupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empr_statut`
--

DROP TABLE IF EXISTS `empr_statut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empr_statut` (
  `idstatut` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `statut_libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `allow_loan` tinyint(4) NOT NULL DEFAULT '1',
  `allow_loan_hist` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `allow_book` tinyint(4) NOT NULL DEFAULT '1',
  `allow_opac` tinyint(4) NOT NULL DEFAULT '1',
  `allow_dsi` tinyint(4) NOT NULL DEFAULT '1',
  `allow_dsi_priv` tinyint(4) NOT NULL DEFAULT '1',
  `allow_sugg` tinyint(4) NOT NULL DEFAULT '1',
  `allow_dema` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `allow_prol` tinyint(4) NOT NULL DEFAULT '1',
  `allow_avis` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `allow_tag` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `allow_pwd` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `allow_liste_lecture` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `allow_self_checkout` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `allow_self_checkin` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `allow_serialcirc` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idstatut`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empr_statut`
--

LOCK TABLES `empr_statut` WRITE;
/*!40000 ALTER TABLE `empr_statut` DISABLE KEYS */;
INSERT INTO `empr_statut` VALUES (1,'Actif',1,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0),(2,'Interdit',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `empr_statut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empty_words_calculs`
--

DROP TABLE IF EXISTS `empty_words_calculs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empty_words_calculs` (
  `id_calcul` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `date_calcul` date NOT NULL DEFAULT '0000-00-00',
  `php_empty_words` text COLLATE utf8_unicode_ci NOT NULL,
  `nb_notices_calcul` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `archive_calcul` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_calcul`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empty_words_calculs`
--

LOCK TABLES `empty_words_calculs` WRITE;
/*!40000 ALTER TABLE `empty_words_calculs` DISABLE KEYS */;
/*!40000 ALTER TABLE `empty_words_calculs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entites`
--

DROP TABLE IF EXISTS `entites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entites` (
  `id_entite` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_entite` int(3) unsigned NOT NULL DEFAULT '0',
  `num_bibli` int(5) unsigned NOT NULL DEFAULT '0',
  `raison_sociale` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `commentaires` text COLLATE utf8_unicode_ci,
  `siret` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `naf` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rcs` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tva` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_cp_client` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_cp_compta` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `site_web` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `autorisations` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `num_frais` int(8) unsigned NOT NULL DEFAULT '0',
  `num_paiement` int(8) unsigned NOT NULL DEFAULT '0',
  `index_entite` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_entite`),
  KEY `raison_sociale` (`raison_sociale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entites`
--

LOCK TABLES `entites` WRITE;
/*!40000 ALTER TABLE `entites` DISABLE KEYS */;
/*!40000 ALTER TABLE `entites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrepots_localisations`
--

DROP TABLE IF EXISTS `entrepots_localisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrepots_localisations` (
  `loc_id` int(11) NOT NULL AUTO_INCREMENT,
  `loc_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loc_libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loc_visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`loc_id`),
  UNIQUE KEY `loc_code` (`loc_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrepots_localisations`
--

LOCK TABLES `entrepots_localisations` WRITE;
/*!40000 ALTER TABLE `entrepots_localisations` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrepots_localisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equations`
--

DROP TABLE IF EXISTS `equations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equations` (
  `id_equation` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `num_classement` int(8) unsigned NOT NULL DEFAULT '1',
  `nom_equation` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_equation` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `requete` blob NOT NULL,
  `proprio_equation` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_equation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equations`
--

LOCK TABLES `equations` WRITE;
/*!40000 ALTER TABLE `equations` DISABLE KEYS */;
/*!40000 ALTER TABLE `equations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_log`
--

DROP TABLE IF EXISTS `error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_log` (
  `error_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `error_origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_text` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log`
--

LOCK TABLES `error_log` WRITE;
/*!40000 ALTER TABLE `error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_cache`
--

DROP TABLE IF EXISTS `es_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_cache` (
  `escache_groupname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `escache_unique_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `escache_value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`escache_groupname`,`escache_unique_id`,`escache_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_cache`
--

LOCK TABLES `es_cache` WRITE;
/*!40000 ALTER TABLE `es_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_cache_blob`
--

DROP TABLE IF EXISTS `es_cache_blob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_cache_blob` (
  `es_cache_objectref` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_cache_objecttype` int(11) NOT NULL DEFAULT '0',
  `es_cache_objectformat` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_cache_owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_cache_creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `es_cache_expirationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `es_cache_content` mediumblob NOT NULL,
  PRIMARY KEY (`es_cache_objectref`,`es_cache_objecttype`,`es_cache_objectformat`,`es_cache_owner`),
  KEY `cache_index` (`es_cache_owner`,`es_cache_objectformat`,`es_cache_objecttype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_cache_blob`
--

LOCK TABLES `es_cache_blob` WRITE;
/*!40000 ALTER TABLE `es_cache_blob` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_cache_blob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_cache_int`
--

DROP TABLE IF EXISTS `es_cache_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_cache_int` (
  `es_cache_objectref` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_cache_objecttype` int(11) NOT NULL DEFAULT '0',
  `es_cache_objectformat` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_cache_owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_cache_creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `es_cache_expirationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `es_cache_content` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`es_cache_objectref`,`es_cache_objecttype`,`es_cache_objectformat`,`es_cache_owner`),
  KEY `cache_index` (`es_cache_owner`,`es_cache_objectformat`,`es_cache_objecttype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_cache_int`
--

LOCK TABLES `es_cache_int` WRITE;
/*!40000 ALTER TABLE `es_cache_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_cache_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_converted_cache`
--

DROP TABLE IF EXISTS `es_converted_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_converted_cache` (
  `es_converted_cache_objecttype` int(11) NOT NULL DEFAULT '0',
  `es_converted_cache_objectref` int(11) NOT NULL DEFAULT '0',
  `es_converted_cache_format` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_converted_cache_value` text COLLATE utf8_unicode_ci NOT NULL,
  `es_converted_cache_bestbefore` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`es_converted_cache_objecttype`,`es_converted_cache_objectref`,`es_converted_cache_format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_converted_cache`
--

LOCK TABLES `es_converted_cache` WRITE;
/*!40000 ALTER TABLE `es_converted_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_converted_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_esgroup_esusers`
--

DROP TABLE IF EXISTS `es_esgroup_esusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_esgroup_esusers` (
  `esgroupuser_groupnum` int(11) NOT NULL DEFAULT '0',
  `esgroupuser_usertype` int(4) NOT NULL DEFAULT '0',
  `esgroupuser_usernum` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`esgroupuser_usernum`,`esgroupuser_groupnum`,`esgroupuser_usertype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_esgroup_esusers`
--

LOCK TABLES `es_esgroup_esusers` WRITE;
/*!40000 ALTER TABLE `es_esgroup_esusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_esgroup_esusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_esgroups`
--

DROP TABLE IF EXISTS `es_esgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_esgroups` (
  `esgroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `esgroup_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `esgroup_fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `esgroup_pmbusernum` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`esgroup_id`),
  UNIQUE KEY `esgroup_name` (`esgroup_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_esgroups`
--

LOCK TABLES `es_esgroups` WRITE;
/*!40000 ALTER TABLE `es_esgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_esgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_esusers`
--

DROP TABLE IF EXISTS `es_esusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_esusers` (
  `esuser_id` int(11) NOT NULL AUTO_INCREMENT,
  `esuser_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `esuser_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `esuser_fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `esuser_groupnum` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`esuser_id`),
  UNIQUE KEY `esuser_username` (`esuser_username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_esusers`
--

LOCK TABLES `es_esusers` WRITE;
/*!40000 ALTER TABLE `es_esusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_esusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_methods`
--

DROP TABLE IF EXISTS `es_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_methods` (
  `id_method` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupe` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `available` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_methods`
--

LOCK TABLES `es_methods` WRITE;
/*!40000 ALTER TABLE `es_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_methods_users`
--

DROP TABLE IF EXISTS `es_methods_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_methods_users` (
  `num_method` int(10) unsigned NOT NULL DEFAULT '0',
  `num_user` int(10) unsigned NOT NULL DEFAULT '0',
  `anonymous` smallint(6) DEFAULT '0',
  PRIMARY KEY (`num_method`,`num_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_methods_users`
--

LOCK TABLES `es_methods_users` WRITE;
/*!40000 ALTER TABLE `es_methods_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_methods_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_searchcache`
--

DROP TABLE IF EXISTS `es_searchcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_searchcache` (
  `es_searchcache_searchid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_searchcache_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `es_searchcache_serializedsearch` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`es_searchcache_searchid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_searchcache`
--

LOCK TABLES `es_searchcache` WRITE;
/*!40000 ALTER TABLE `es_searchcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_searchcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_searchsessions`
--

DROP TABLE IF EXISTS `es_searchsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_searchsessions` (
  `es_searchsession_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_searchsession_searchnum` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_searchsession_searchrealm` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `es_searchsession_pmbuserid` int(11) NOT NULL DEFAULT '-1',
  `es_searchsession_opacemprid` int(11) NOT NULL DEFAULT '-1',
  `es_searchsession_lastseendate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`es_searchsession_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_searchsessions`
--

LOCK TABLES `es_searchsessions` WRITE;
/*!40000 ALTER TABLE `es_searchsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_searchsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etagere`
--

DROP TABLE IF EXISTS `etagere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etagere` (
  `idetagere` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` blob NOT NULL,
  `validite` int(1) unsigned NOT NULL DEFAULT '0',
  `validite_date_deb` date NOT NULL DEFAULT '0000-00-00',
  `validite_date_fin` date NOT NULL DEFAULT '0000-00-00',
  `visible_accueil` int(1) unsigned NOT NULL DEFAULT '1',
  `autorisations` mediumtext COLLATE utf8_unicode_ci,
  `id_tri` int(11) NOT NULL,
  `thumbnail_url` mediumblob NOT NULL,
  `etagere_classement` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idetagere`),
  KEY `i_id_tri` (`id_tri`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etagere`
--

LOCK TABLES `etagere` WRITE;
/*!40000 ALTER TABLE `etagere` DISABLE KEYS */;
INSERT INTO `etagere` VALUES (3,'Loire','Exposition virtuelle sur la Loire',1,'0000-00-00','0000-00-00',1,'1 4 3 2',0,'','');
/*!40000 ALTER TABLE `etagere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etagere_caddie`
--

DROP TABLE IF EXISTS `etagere_caddie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etagere_caddie` (
  `etagere_id` int(8) unsigned NOT NULL DEFAULT '0',
  `caddie_id` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`etagere_id`,`caddie_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etagere_caddie`
--

LOCK TABLES `etagere_caddie` WRITE;
/*!40000 ALTER TABLE `etagere_caddie` DISABLE KEYS */;
INSERT INTO `etagere_caddie` VALUES (3,5);
/*!40000 ALTER TABLE `etagere_caddie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemplaires`
--

DROP TABLE IF EXISTS `exemplaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exemplaires` (
  `expl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `expl_cb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expl_notice` int(10) unsigned NOT NULL DEFAULT '0',
  `expl_bulletin` int(10) unsigned NOT NULL DEFAULT '0',
  `expl_typdoc` int(5) unsigned NOT NULL DEFAULT '0',
  `expl_cote` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expl_section` smallint(5) unsigned NOT NULL DEFAULT '0',
  `expl_statut` smallint(5) unsigned NOT NULL DEFAULT '0',
  `expl_location` smallint(5) unsigned NOT NULL DEFAULT '0',
  `expl_codestat` smallint(5) unsigned NOT NULL DEFAULT '0',
  `expl_date_depot` date NOT NULL DEFAULT '0000-00-00',
  `expl_date_retour` date NOT NULL DEFAULT '0000-00-00',
  `expl_note` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `expl_prix` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expl_owner` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `expl_lastempr` int(10) unsigned NOT NULL DEFAULT '0',
  `last_loan_date` date DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT '2005-01-01 00:00:00',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type_antivol` int(1) unsigned NOT NULL DEFAULT '0',
  `transfert_location_origine` smallint(5) unsigned NOT NULL DEFAULT '0',
  `transfert_statut_origine` smallint(5) unsigned NOT NULL DEFAULT '0',
  `expl_comment` text COLLATE utf8_unicode_ci,
  `expl_nbparts` int(8) unsigned NOT NULL DEFAULT '1',
  `expl_retloc` smallint(5) unsigned NOT NULL DEFAULT '0',
  `expl_abt_num` int(10) unsigned NOT NULL DEFAULT '0',
  `transfert_section_origine` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expl_id`),
  UNIQUE KEY `expl_cb` (`expl_cb`),
  KEY `expl_typdoc` (`expl_typdoc`),
  KEY `expl_cote` (`expl_cote`),
  KEY `expl_notice` (`expl_notice`),
  KEY `expl_codestat` (`expl_codestat`),
  KEY `expl_owner` (`expl_owner`),
  KEY `expl_bulletin` (`expl_bulletin`),
  KEY `i_expl_location` (`expl_location`),
  KEY `i_expl_section` (`expl_section`),
  KEY `i_expl_statut` (`expl_statut`),
  KEY `i_expl_lastempr` (`expl_lastempr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplaires`
--

LOCK TABLES `exemplaires` WRITE;
/*!40000 ALTER TABLE `exemplaires` DISABLE KEYS */;
/*!40000 ALTER TABLE `exemplaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemplaires_temp`
--

DROP TABLE IF EXISTS `exemplaires_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exemplaires_temp` (
  `cb` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sess` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `cb` (`cb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplaires_temp`
--

LOCK TABLES `exemplaires_temp` WRITE;
/*!40000 ALTER TABLE `exemplaires_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `exemplaires_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercices`
--

DROP TABLE IF EXISTS `exercices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercices` (
  `id_exercice` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `num_entite` int(5) unsigned NOT NULL DEFAULT '0',
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_debut` date NOT NULL DEFAULT '2006-01-01',
  `date_fin` date NOT NULL DEFAULT '2006-01-01',
  `statut` int(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_exercice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercices`
--

LOCK TABLES `exercices` WRITE;
/*!40000 ALTER TABLE `exercices` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expl_custom`
--

DROP TABLE IF EXISTS `expl_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expl_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expl_custom`
--

LOCK TABLES `expl_custom` WRITE;
/*!40000 ALTER TABLE `expl_custom` DISABLE KEYS */;
INSERT INTO `expl_custom` VALUES (2,'origine','Origen','list','small_text','<OPTIONS FOR=\"list\">\r\n <MULTIPLE>no</MULTIPLE>\r\n <AUTORITE>no</AUTORITE>\r\n <CHECKBOX>no</CHECKBOX>\r\n <NUM_AUTO>no</NUM_AUTO>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[Seleccione un valor]]></UNSELECT_ITEM>\r\n <DEFAULT_VALUE></DEFAULT_VALUE>\r\n <CHECKBOX_NB_ON_LINE></CHECKBOX_NB_ON_LINE>\r\n</OPTIONS>',0,0,2,0,1,0,100,0),(3,'date_acquisition','Fecha de compra/Data de compra','date_box','date','<OPTIONS FOR=\"date_box\">\r\n <DEFAULT_TODAY>yes</DEFAULT_TODAY>\r\n</OPTIONS> ',0,0,3,0,1,0,100,0),(4,'date_pilon','Fecha de expiración/Data d\'expiració','date_box','date','<OPTIONS FOR=\"date_box\">\r\n <DEFAULT_TODAY>yes</DEFAULT_TODAY>\r\n</OPTIONS> ',0,0,4,0,1,0,100,0);
/*!40000 ALTER TABLE `expl_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expl_custom_lists`
--

DROP TABLE IF EXISTS `expl_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expl_custom_lists` (
  `expl_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `expl_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expl_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `expl_custom_champ` (`expl_custom_champ`),
  KEY `i_excl_lv` (`expl_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expl_custom_lists`
--

LOCK TABLES `expl_custom_lists` WRITE;
/*!40000 ALTER TABLE `expl_custom_lists` DISABLE KEYS */;
INSERT INTO `expl_custom_lists` VALUES (2,'DEP','Depósito/Depòsit',3),(2,'DON','Donación/Donació',2),(2,'ACH','Compra',1);
/*!40000 ALTER TABLE `expl_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expl_custom_values`
--

DROP TABLE IF EXISTS `expl_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expl_custom_values` (
  `expl_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `expl_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `expl_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expl_custom_text` text COLLATE utf8_unicode_ci,
  `expl_custom_integer` int(11) DEFAULT NULL,
  `expl_custom_date` date DEFAULT NULL,
  `expl_custom_float` float DEFAULT NULL,
  KEY `expl_custom_champ` (`expl_custom_champ`),
  KEY `expl_custom_origine` (`expl_custom_origine`),
  KEY `i_excv_st` (`expl_custom_small_text`),
  KEY `i_excv_t` (`expl_custom_text`(255)),
  KEY `i_excv_i` (`expl_custom_integer`),
  KEY `i_excv_d` (`expl_custom_date`),
  KEY `i_excv_f` (`expl_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expl_custom_values`
--

LOCK TABLES `expl_custom_values` WRITE;
/*!40000 ALTER TABLE `expl_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `expl_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explnum`
--

DROP TABLE IF EXISTS `explnum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explnum` (
  `explnum_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `explnum_notice` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `explnum_bulletin` int(8) unsigned NOT NULL DEFAULT '0',
  `explnum_nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `explnum_mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `explnum_url` text COLLATE utf8_unicode_ci NOT NULL,
  `explnum_data` mediumblob,
  `explnum_vignette` mediumblob,
  `explnum_extfichier` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `explnum_nomfichier` text COLLATE utf8_unicode_ci,
  `explnum_statut` int(5) unsigned NOT NULL DEFAULT '0',
  `explnum_index_sew` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `explnum_index_wew` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `explnum_repertoire` int(8) NOT NULL DEFAULT '0',
  `explnum_path` text COLLATE utf8_unicode_ci NOT NULL,
  `explnum_docnum_statut` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`explnum_id`),
  KEY `explnum_notice` (`explnum_notice`),
  KEY `explnum_bulletin` (`explnum_bulletin`),
  KEY `explnum_repertoire` (`explnum_repertoire`),
  KEY `i_explnum_nomfichier` (`explnum_nomfichier`(30)),
  FULLTEXT KEY `i_f_explnumwew` (`explnum_index_wew`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explnum`
--

LOCK TABLES `explnum` WRITE;
/*!40000 ALTER TABLE `explnum` DISABLE KEYS */;
/*!40000 ALTER TABLE `explnum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explnum_doc`
--

DROP TABLE IF EXISTS `explnum_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explnum_doc` (
  `id_explnum_doc` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `explnum_doc_nomfichier` text COLLATE utf8_unicode_ci NOT NULL,
  `explnum_doc_mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `explnum_doc_data` mediumblob NOT NULL,
  `explnum_doc_extfichier` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `explnum_doc_url` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_explnum_doc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explnum_doc`
--

LOCK TABLES `explnum_doc` WRITE;
/*!40000 ALTER TABLE `explnum_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `explnum_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explnum_doc_actions`
--

DROP TABLE IF EXISTS `explnum_doc_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explnum_doc_actions` (
  `num_explnum_doc` int(10) NOT NULL DEFAULT '0',
  `num_action` int(10) NOT NULL DEFAULT '0',
  `prive` int(1) NOT NULL DEFAULT '0',
  `rapport` int(1) NOT NULL DEFAULT '0',
  `num_explnum` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_explnum_doc`,`num_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explnum_doc_actions`
--

LOCK TABLES `explnum_doc_actions` WRITE;
/*!40000 ALTER TABLE `explnum_doc_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `explnum_doc_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explnum_doc_sugg`
--

DROP TABLE IF EXISTS `explnum_doc_sugg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explnum_doc_sugg` (
  `num_explnum_doc` int(10) NOT NULL DEFAULT '0',
  `num_suggestion` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_explnum_doc`,`num_suggestion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explnum_doc_sugg`
--

LOCK TABLES `explnum_doc_sugg` WRITE;
/*!40000 ALTER TABLE `explnum_doc_sugg` DISABLE KEYS */;
/*!40000 ALTER TABLE `explnum_doc_sugg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explnum_location`
--

DROP TABLE IF EXISTS `explnum_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explnum_location` (
  `num_explnum` int(10) NOT NULL DEFAULT '0',
  `num_location` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_explnum`,`num_location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explnum_location`
--

LOCK TABLES `explnum_location` WRITE;
/*!40000 ALTER TABLE `explnum_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `explnum_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explnum_segments`
--

DROP TABLE IF EXISTS `explnum_segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explnum_segments` (
  `explnum_segment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `explnum_segment_explnum_num` int(10) unsigned NOT NULL DEFAULT '0',
  `explnum_segment_speaker_num` int(10) unsigned NOT NULL DEFAULT '0',
  `explnum_segment_start` double NOT NULL DEFAULT '0',
  `explnum_segment_duration` double NOT NULL DEFAULT '0',
  `explnum_segment_end` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`explnum_segment_id`),
  KEY `i_ensg_explnum_num` (`explnum_segment_explnum_num`),
  KEY `i_ensg_speaker` (`explnum_segment_speaker_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explnum_segments`
--

LOCK TABLES `explnum_segments` WRITE;
/*!40000 ALTER TABLE `explnum_segments` DISABLE KEYS */;
/*!40000 ALTER TABLE `explnum_segments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explnum_speakers`
--

DROP TABLE IF EXISTS `explnum_speakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explnum_speakers` (
  `explnum_speaker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `explnum_speaker_explnum_num` int(10) unsigned NOT NULL DEFAULT '0',
  `explnum_speaker_speaker_num` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `explnum_speaker_gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `explnum_speaker_author` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`explnum_speaker_id`),
  KEY `i_ensk_explnum_num` (`explnum_speaker_explnum_num`),
  KEY `i_ensk_author` (`explnum_speaker_author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explnum_speakers`
--

LOCK TABLES `explnum_speakers` WRITE;
/*!40000 ALTER TABLE `explnum_speakers` DISABLE KEYS */;
/*!40000 ALTER TABLE `explnum_speakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explnum_statut`
--

DROP TABLE IF EXISTS `explnum_statut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explnum_statut` (
  `id_explnum_statut` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gestion_libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `opac_libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class_html` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `explnum_visible_opac` tinyint(1) NOT NULL DEFAULT '1',
  `explnum_visible_opac_abon` tinyint(1) NOT NULL DEFAULT '0',
  `explnum_consult_opac` tinyint(1) NOT NULL DEFAULT '1',
  `explnum_consult_opac_abon` tinyint(1) NOT NULL DEFAULT '0',
  `explnum_download_opac` tinyint(1) NOT NULL DEFAULT '1',
  `explnum_download_opac_abon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_explnum_statut`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explnum_statut`
--

LOCK TABLES `explnum_statut` WRITE;
/*!40000 ALTER TABLE `explnum_statut` DISABLE KEYS */;
INSERT INTO `explnum_statut` VALUES (1,'Sans statut particulier','','',1,0,1,0,1,0);
/*!40000 ALTER TABLE `explnum_statut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_count`
--

DROP TABLE IF EXISTS `external_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_count` (
  `rid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `recid` (`recid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_count`
--

LOCK TABLES `external_count` WRITE;
/*!40000 ALTER TABLE `external_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facettes`
--

DROP TABLE IF EXISTS `facettes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facettes` (
  `id_facette` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facette_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `facette_critere` int(5) NOT NULL DEFAULT '0',
  `facette_ss_critere` int(5) NOT NULL DEFAULT '0',
  `facette_nb_result` int(2) NOT NULL DEFAULT '0',
  `facette_visible` tinyint(1) NOT NULL DEFAULT '0',
  `facette_type_sort` int(1) NOT NULL DEFAULT '0',
  `facette_order_sort` int(1) NOT NULL DEFAULT '0',
  `facette_order` int(11) NOT NULL DEFAULT '1',
  `facette_limit_plus` int(11) NOT NULL DEFAULT '0',
  `facette_opac_views_num` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_facette`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facettes`
--

LOCK TABLES `facettes` WRITE;
/*!40000 ALTER TABLE `facettes` DISABLE KEYS */;
INSERT INTO `facettes` VALUES (1,'Catégories',25,1,50,1,0,1,1,0,''),(2,'Localisation',90,4,0,1,1,0,1,0,''),(3,'Mot-clé',17,1,50,1,0,1,1,0,''),(4,'Section',90,3,0,1,1,0,1,0,''),(5,'Type de document',31,1,0,0,1,0,1,0,''),(6,'Type de notice',32,1,0,1,1,0,1,0,'');
/*!40000 ALTER TABLE `facettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_questions`
--

DROP TABLE IF EXISTS `faq_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_questions` (
  `id_faq_question` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `faq_question_num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `faq_question_num_theme` int(10) unsigned NOT NULL DEFAULT '0',
  `faq_question_num_demande` int(10) unsigned NOT NULL DEFAULT '0',
  `faq_question_question` text COLLATE utf8_unicode_ci NOT NULL,
  `faq_question_question_userdate` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `faq_question_question_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `faq_question_answer` text COLLATE utf8_unicode_ci NOT NULL,
  `faq_question_answer_userdate` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `faq_question_answer_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `faq_question_statut` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_faq_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_questions`
--

LOCK TABLES `faq_questions` WRITE;
/*!40000 ALTER TABLE `faq_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_questions_categories`
--

DROP TABLE IF EXISTS `faq_questions_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_questions_categories` (
  `num_faq_question` int(10) unsigned NOT NULL DEFAULT '0',
  `num_categ` int(10) unsigned NOT NULL DEFAULT '0',
  `categ_order` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `i_faq_categ` (`num_faq_question`,`num_categ`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_questions_categories`
--

LOCK TABLES `faq_questions_categories` WRITE;
/*!40000 ALTER TABLE `faq_questions_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_questions_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_questions_fields_global_index`
--

DROP TABLE IF EXISTS `faq_questions_fields_global_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_questions_fields_global_index` (
  `id_faq_question` int(10) unsigned NOT NULL DEFAULT '0',
  `code_champ` int(3) unsigned NOT NULL DEFAULT '0',
  `code_ss_champ` int(3) unsigned NOT NULL DEFAULT '0',
  `ordre` int(4) unsigned NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `pond` int(4) unsigned NOT NULL DEFAULT '100',
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authority_num` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_faq_question`,`code_champ`,`code_ss_champ`,`lang`,`ordre`),
  KEY `i_value` (`value`(300)),
  KEY `i_code_champ_code_ss_champ` (`code_champ`,`code_ss_champ`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_questions_fields_global_index`
--

LOCK TABLES `faq_questions_fields_global_index` WRITE;
/*!40000 ALTER TABLE `faq_questions_fields_global_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_questions_fields_global_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_questions_words_global_index`
--

DROP TABLE IF EXISTS `faq_questions_words_global_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_questions_words_global_index` (
  `id_faq_question` int(10) unsigned NOT NULL DEFAULT '0',
  `code_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `code_ss_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `num_word` int(10) unsigned NOT NULL DEFAULT '0',
  `pond` int(10) unsigned NOT NULL DEFAULT '100',
  `position` int(10) unsigned NOT NULL DEFAULT '1',
  `field_position` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_faq_question`,`code_champ`,`num_word`,`position`,`code_ss_champ`),
  KEY `code_champ` (`code_champ`),
  KEY `i_id_mot` (`num_word`,`id_faq_question`),
  KEY `i_code_champ_code_ss_champ_num_word` (`code_champ`,`code_ss_champ`,`num_word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_questions_words_global_index`
--

LOCK TABLES `faq_questions_words_global_index` WRITE;
/*!40000 ALTER TABLE `faq_questions_words_global_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_questions_words_global_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_themes`
--

DROP TABLE IF EXISTS `faq_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_themes` (
  `id_theme` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_theme` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_themes`
--

LOCK TABLES `faq_themes` WRITE;
/*!40000 ALTER TABLE `faq_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_types`
--

DROP TABLE IF EXISTS `faq_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_types` (
  `id_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_types`
--

LOCK TABLES `faq_types` WRITE;
/*!40000 ALTER TABLE `faq_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiche`
--

DROP TABLE IF EXISTS `fiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fiche` (
  `id_fiche` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `infos_global` text COLLATE utf8_unicode_ci NOT NULL,
  `index_infos_global` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_fiche`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiche`
--

LOCK TABLES `fiche` WRITE;
/*!40000 ALTER TABLE `fiche` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frais`
--

DROP TABLE IF EXISTS `frais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frais` (
  `id_frais` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `condition_frais` text COLLATE utf8_unicode_ci NOT NULL,
  `montant` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  `num_cp_compta` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_tva_achat` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `index_libelle` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_frais`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frais`
--

LOCK TABLES `frais` WRITE;
/*!40000 ALTER TABLE `frais` DISABLE KEYS */;
/*!40000 ALTER TABLE `frais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestfic0_custom`
--

DROP TABLE IF EXISTS `gestfic0_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestfic0_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestfic0_custom`
--

LOCK TABLES `gestfic0_custom` WRITE;
/*!40000 ALTER TABLE `gestfic0_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestfic0_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestfic0_custom_lists`
--

DROP TABLE IF EXISTS `gestfic0_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestfic0_custom_lists` (
  `gestfic0_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `gestfic0_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gestfic0_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `gestfic0_custom_champ` (`gestfic0_custom_champ`),
  KEY `gestfic0_champ_list_value` (`gestfic0_custom_champ`,`gestfic0_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestfic0_custom_lists`
--

LOCK TABLES `gestfic0_custom_lists` WRITE;
/*!40000 ALTER TABLE `gestfic0_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestfic0_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestfic0_custom_values`
--

DROP TABLE IF EXISTS `gestfic0_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestfic0_custom_values` (
  `gestfic0_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `gestfic0_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `gestfic0_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gestfic0_custom_text` text COLLATE utf8_unicode_ci,
  `gestfic0_custom_integer` int(11) DEFAULT NULL,
  `gestfic0_custom_date` date DEFAULT NULL,
  `gestfic0_custom_float` float DEFAULT NULL,
  KEY `gestfic0_custom_champ` (`gestfic0_custom_champ`),
  KEY `gestfic0_custom_origine` (`gestfic0_custom_origine`),
  KEY `i_gcv_st` (`gestfic0_custom_small_text`),
  KEY `i_gcv_t` (`gestfic0_custom_text`(255)),
  KEY `i_gcv_i` (`gestfic0_custom_integer`),
  KEY `i_gcv_d` (`gestfic0_custom_date`),
  KEY `i_gcv_f` (`gestfic0_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestfic0_custom_values`
--

LOCK TABLES `gestfic0_custom_values` WRITE;
/*!40000 ALTER TABLE `gestfic0_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestfic0_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grilles`
--

DROP TABLE IF EXISTS `grilles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grilles` (
  `grille_typdoc` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `grille_niveau_biblio` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `grille_localisation` mediumint(8) NOT NULL DEFAULT '0',
  `descr_format` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`grille_typdoc`,`grille_niveau_biblio`,`grille_localisation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grilles`
--

LOCK TABLES `grilles` WRITE;
/*!40000 ALTER TABLE `grilles` DISABLE KEYS */;
/*!40000 ALTER TABLE `grilles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupe` (
  `id_groupe` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_groupe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resp_groupe` int(6) unsigned DEFAULT '0',
  `lettre_rappel` int(1) unsigned NOT NULL DEFAULT '0',
  `mail_rappel` int(1) unsigned NOT NULL DEFAULT '0',
  `lettre_rappel_show_nomgroup` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_groupe`),
  UNIQUE KEY `libelle_groupe` (`libelle_groupe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupe`
--

LOCK TABLES `groupe` WRITE;
/*!40000 ALTER TABLE `groupe` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupexpl`
--

DROP TABLE IF EXISTS `groupexpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupexpl` (
  `id_groupexpl` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupexpl_resp_expl_num` int(10) unsigned NOT NULL DEFAULT '0',
  `groupexpl_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `groupexpl_comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `groupexpl_location` int(10) unsigned NOT NULL DEFAULT '0',
  `groupexpl_statut_resp` int(10) unsigned NOT NULL DEFAULT '0',
  `groupexpl_statut_others` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_groupexpl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupexpl`
--

LOCK TABLES `groupexpl` WRITE;
/*!40000 ALTER TABLE `groupexpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupexpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupexpl_expl`
--

DROP TABLE IF EXISTS `groupexpl_expl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupexpl_expl` (
  `groupexpl_num` int(10) unsigned NOT NULL DEFAULT '0',
  `groupexpl_expl_num` int(10) unsigned NOT NULL DEFAULT '0',
  `groupexpl_checked` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupexpl_num`,`groupexpl_expl_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupexpl_expl`
--

LOCK TABLES `groupexpl_expl` WRITE;
/*!40000 ALTER TABLE `groupexpl_expl` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupexpl_expl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_field`
--

DROP TABLE IF EXISTS `harvest_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_field` (
  `id_harvest_field` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_harvest_profil` int(10) unsigned NOT NULL DEFAULT '0',
  `harvest_field_xml_id` int(10) unsigned NOT NULL DEFAULT '0',
  `harvest_field_first_flag` int(10) unsigned NOT NULL DEFAULT '0',
  `harvest_field_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_harvest_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_field`
--

LOCK TABLES `harvest_field` WRITE;
/*!40000 ALTER TABLE `harvest_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `harvest_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_profil`
--

DROP TABLE IF EXISTS `harvest_profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_profil` (
  `id_harvest_profil` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `harvest_profil_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_harvest_profil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_profil`
--

LOCK TABLES `harvest_profil` WRITE;
/*!40000 ALTER TABLE `harvest_profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `harvest_profil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_profil_import`
--

DROP TABLE IF EXISTS `harvest_profil_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_profil_import` (
  `id_harvest_profil_import` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `harvest_profil_import_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_harvest_profil_import`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_profil_import`
--

LOCK TABLES `harvest_profil_import` WRITE;
/*!40000 ALTER TABLE `harvest_profil_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `harvest_profil_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_profil_import_field`
--

DROP TABLE IF EXISTS `harvest_profil_import_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_profil_import_field` (
  `num_harvest_profil_import` int(10) unsigned NOT NULL DEFAULT '0',
  `harvest_profil_import_field_xml_id` int(10) unsigned NOT NULL DEFAULT '0',
  `harvest_profil_import_field_flag` int(10) unsigned NOT NULL DEFAULT '0',
  `harvest_profil_import_field_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_harvest_profil_import`,`harvest_profil_import_field_xml_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_profil_import_field`
--

LOCK TABLES `harvest_profil_import_field` WRITE;
/*!40000 ALTER TABLE `harvest_profil_import_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `harvest_profil_import_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_search_field`
--

DROP TABLE IF EXISTS `harvest_search_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_search_field` (
  `num_harvest_profil` int(10) unsigned NOT NULL DEFAULT '0',
  `num_source` int(10) unsigned NOT NULL DEFAULT '0',
  `num_field` int(10) unsigned NOT NULL DEFAULT '0',
  `num_ss_field` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_harvest_profil`,`num_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_search_field`
--

LOCK TABLES `harvest_search_field` WRITE;
/*!40000 ALTER TABLE `harvest_search_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `harvest_search_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_src`
--

DROP TABLE IF EXISTS `harvest_src`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_src` (
  `id_harvest_src` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_harvest_field` int(10) unsigned NOT NULL DEFAULT '0',
  `num_source` int(10) unsigned NOT NULL DEFAULT '0',
  `harvest_src_unimacfield` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `harvest_src_unimacsubfield` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `harvest_src_pmb_unimacfield` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `harvest_src_pmb_unimacsubfield` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `harvest_src_prec_flag` int(10) unsigned NOT NULL DEFAULT '0',
  `harvest_src_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_harvest_src`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_src`
--

LOCK TABLES `harvest_src` WRITE;
/*!40000 ALTER TABLE `harvest_src` DISABLE KEYS */;
/*!40000 ALTER TABLE `harvest_src` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_marc`
--

DROP TABLE IF EXISTS `import_marc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_marc` (
  `id_import` bigint(5) unsigned NOT NULL AUTO_INCREMENT,
  `notice` longblob NOT NULL,
  `origine` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `no_notice` int(10) unsigned DEFAULT '0',
  `encoding` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_import`),
  KEY `i_nonot_orig` (`no_notice`,`origine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_marc`
--

LOCK TABLES `import_marc` WRITE;
/*!40000 ALTER TABLE `import_marc` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_marc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_concept`
--

DROP TABLE IF EXISTS `index_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_concept` (
  `num_object` int(10) unsigned NOT NULL,
  `type_object` int(10) unsigned NOT NULL,
  `num_concept` int(10) unsigned NOT NULL,
  `order_concept` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_object`,`type_object`,`num_concept`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_concept`
--

LOCK TABLES `index_concept` WRITE;
/*!40000 ALTER TABLE `index_concept` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexint`
--

DROP TABLE IF EXISTS `indexint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexint` (
  `indexint_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `indexint_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `indexint_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `index_indexint` text COLLATE utf8_unicode_ci,
  `num_pclass` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`indexint_id`),
  UNIQUE KEY `indexint_name` (`indexint_name`,`num_pclass`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexint`
--

LOCK TABLES `indexint` WRITE;
/*!40000 ALTER TABLE `indexint` DISABLE KEYS */;
/*!40000 ALTER TABLE `indexint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexint_custom`
--

DROP TABLE IF EXISTS `indexint_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexint_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexint_custom`
--

LOCK TABLES `indexint_custom` WRITE;
/*!40000 ALTER TABLE `indexint_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `indexint_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexint_custom_lists`
--

DROP TABLE IF EXISTS `indexint_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexint_custom_lists` (
  `indexint_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `indexint_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indexint_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `editorial_custom_champ` (`indexint_custom_champ`),
  KEY `editorial_champ_list_value` (`indexint_custom_champ`,`indexint_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexint_custom_lists`
--

LOCK TABLES `indexint_custom_lists` WRITE;
/*!40000 ALTER TABLE `indexint_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `indexint_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexint_custom_values`
--

DROP TABLE IF EXISTS `indexint_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexint_custom_values` (
  `indexint_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `indexint_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `indexint_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indexint_custom_text` text COLLATE utf8_unicode_ci,
  `indexint_custom_integer` int(11) DEFAULT NULL,
  `indexint_custom_date` date DEFAULT NULL,
  `indexint_custom_float` float DEFAULT NULL,
  KEY `editorial_custom_champ` (`indexint_custom_champ`),
  KEY `editorial_custom_origine` (`indexint_custom_origine`),
  KEY `i_icv_st` (`indexint_custom_small_text`),
  KEY `i_icv_t` (`indexint_custom_text`(255)),
  KEY `i_icv_i` (`indexint_custom_integer`),
  KEY `i_icv_d` (`indexint_custom_date`),
  KEY `i_icv_f` (`indexint_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexint_custom_values`
--

LOCK TABLES `indexint_custom_values` WRITE;
/*!40000 ALTER TABLE `indexint_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `indexint_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infopages`
--

DROP TABLE IF EXISTS `infopages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infopages` (
  `id_infopage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_infopage` longblob NOT NULL,
  `title_infopage` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `valid_infopage` tinyint(1) NOT NULL DEFAULT '1',
  `restrict_infopage` int(11) NOT NULL DEFAULT '0',
  `infopage_classement` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_infopage`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infopages`
--

LOCK TABLES `infopages` WRITE;
/*!40000 ALTER TABLE `infopages` DISABLE KEYS */;
INSERT INTO `infopages` VALUES (1,'Actualit&eacute;s de la BnF\r\n</h1>\r\n<ul>\r\n<!--load asset-->\r\n<!--Get referenced by list-->\r\n<li>\r\n<p class=\"echeance\">\r\n8 mars 2010\r\n</p>\r\n<p class=\"titre\">\r\n<a href=\"http://www.bnf.fr/fr/la_bnf/anx_actu_bib/a.cabinet_monnaies_100308.html\">L&acute;avenir du &laquo; Cabinet des M&eacute;dailles &raquo;</a>	\r\n</p>\r\n<p class=\"maj\">[mis en ligne le 8 mars 2010 ]</p>\r\n\r\n</li>\r\n<!--load asset-->\r\n<!--Get referenced by list-->\r\n<li>\r\n<p class=\"echeance\">\r\njusqu&acute;&agrave; nouvel avis\r\n</p>\r\n<p class=\"titre\">\r\n<a href=\"http://www.bnf.fr/fr/la_bnf/renovation_richelieu/a.communication_differee_collections_richelieu.html\">Communication diff&eacute;r&eacute;e de certaines collections sur le site Richelieu</a>	\r\n</p>\r\n<p class=\"lieu\">Site\r\nRichelieu\r\n</p>\r\n<p class=\"maj\">[mis en ligne le 7 janvier 2010 ]</p>\r\n</li>\r\n<!--load asset-->\r\n\r\n<li>\r\n<span class=\"cartouche_breve\">\r\nNouveau\r\n</span> \r\n<p class=\"titre\">\r\n<a href=\"http://enfants.bnf.fr/\">La Biblioth&egrave;que num&eacute;rique des enfants</a>	\r\n</p>\r\nEspace enti&egrave;rement d&eacute;di&eacute; aux jeunes de 8 &agrave; 12 ans, la Biblioth&egrave;que num&eacute;riques des enfants est une v&eacute;ritable introduction &agrave; l&acute;univers de l&acute;&eacute;crit et de l&acute;image.\r\n<p class=\"maj\">[mis en ligne le 26 juillet 2010 ]</p>\r\n</li>\r\n<!--load asset-->\r\n<!--Get referenced by list-->\r\n<li>\r\n<p class=\"echeance\">\r\njusqu&acute;au 5 septembre 2010\r\n\r\n</p>\r\n<p class=\"titre\">\r\n<a href=\"http://www.bnf.fr/fr/collections_et_services/actus_coll_dpts/s.actualites_sciences_techniques.html?first_Art=non\">&eacute;pid&eacute;mies, pand&eacute;mies - S&eacute;lection de documents et bibliographie</a>	\r\n</p>\r\n<p class=\"lieu\">Site\r\nFran&ccedil;ois-Mitterrand\r\n<span> -\r\nBiblioth&egrave;que d&acute;&eacute;tude (niveau Haut-de-jardin)\r\n</span> \r\n</p>\r\n<p class=\"maj\">[mis en ligne le 16 juillet 2010 ]</p>\r\n</li>\r\n<!--load asset-->\r\n<!--Get referenced by list-->\r\n<li>\r\n<p class=\"echeance\">\r\n\r\njusqu&acute;au 5 septembre 2010\r\n</p>\r\n<p class=\"titre\">\r\n<a href=\"http://www.bnf.fr/fr/collections_et_services/actus_coll_dpts/s.actualites_audiovisuel.html?first_Art=non\">Image par image - S&eacute;lection de films</a>	\r\n</p>\r\n<p class=\"lieu\">Site\r\nFran&ccedil;ois-Mitterrand\r\n<span> -\r\nBiblioth&egrave;que d&acute;&eacute;tude (niveau Haut-de-jardin)\r\n</span> \r\n</p>\r\n<p class=\"maj\">[mis en ligne le 12 juillet 2010 ]</p>\r\n</li>\r\n</ul>','Actu rencontres',1,0,''),(2,'<font size=\"6\">Les nouveaut\�s de PMB 4.0 !</font>\r\n<br/><br/>\r\n\r\n<h3>Portail</h3>\r\nMise en �uvre de fonctionnalit\�s CMS�:\r\n<ul style=\"list-style:square inside;\">\r\n	<li>Articles</li>\r\n	<li>Rubriques</li>\r\n</ul>\r\n<br/>\r\nCr\�ation de modules :\r\n<ul style=\"list-style:square inside;\">\r\n	<li>Bloc RSS</li>\r\n	<li>Bibliographies</li>\r\n	<li>Carrousel de notices</li>\r\n	<li>Notices similaires</li>\r\n	<li>Recherche dans les articles</li>\r\n	<li>Liens entre articles et notices par les cat\�gories</li>\r\n	<li>Menus \� partir d�une rubrique</li>\r\n	<li>Fil d�Ariane sur les rubriques</li>\r\n	<li>Possibilit\� de pr\�sentation de la notice enti\�rement personnalisable</li>\r\n	<li>Refonte de l�ergonomie de recherche : mise en avant des facettes d\�s la premi\�re page tout en conservant la navigation par zone de recherche</li>\r\n</ul>\r\n\r\n<br/><br/>\r\n\r\n<h3>Catalogage</h3>\r\n<ul style=\"list-style:square inside;\">\r\n	<li>R\�colteur (import ou mise \� jour de notices \� partir de sources externes avec choix des champs en fonction des sources)</li>\r\n	<li>Import de notices d�autorit\�s avec conservation de l�origine et des autorit\�s li\�es</li>\r\n	<li>Recherche dans les articles</li>\r\n	<li>Int\�gration possible th\�saurus MeSH</li>\r\n	<li>Archivage de notices en entrep�t lors de la suppression</li>\r\n	<li>Connecteur AscoDocPsy</li>\r\n</ul>\r\n\r\n<br/><br/>\r\n\r\n<h3>GED</h3>\r\n<p>\r\nPMB devient serveur WebDAV�: permet la gestion des documents num\�riques par l�explorateur de fichiers (ajout, suppression, mise \� jour), cr\�ation automatique de la notice \� partir des m\�tadonn\�es du document.\r\nIndexation plein texte et visionneuse pour les documents Microsoft Office, eBook au format ePub.\r\n</p>\r\n\r\n<br/><br/>\r\n\r\n<h3>Circulation</h3>\r\nModule de circulation des p\�riodiques :\r\n<ul style=\"list-style:square inside;\">\r\n	<li>Circulation en \�toile</li>\r\n	<li>Circulation lin\�aire</li>\r\n	<li>Circulation en marguerite</li>\r\n	<li>Circulation virtuelle et module d�inscription</li>\r\n	<li>Gestion de la demande de copie d�articles</li>\r\n	<li>Gestion des cat\�gories d�age d�usagers</li>\r\n	<li>Grilles d�usagers personnalisables</li>\r\n	<li>Recherche multicrit\�res d�usagers</li>\r\n	<li>RFID, interfa\�age avec le mat\�riel 3M</li>\r\n	<li>Gestion de pr\�t courte dur\�e, alerte par mail avant date limite de retour</li>\r\n</ul>\r\n\r\n<br/><br/>\r\n\r\n<h3>Communication</h3>\r\n<ul style=\"list-style:square inside;\">\r\n	<li>Alertes usagers sous forme de flux RSS</li>\r\n	<li>Mod\�le de newsletter, template de mails et envoi automatique via planificateur (3.5)</li>\r\n	<li>G\�n\�ration automatique en PDF d�un produit documentaire associ\� \� une DSI</li>\r\n</ul>','PMB Version 4.0',1,0,''),(6,'<table>\r\n<tr>\r\n<td  width=\"520\">\r\n<iframe width=\"500\" height=\"450\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.fr/maps?q=pmb+services&amp;oe=utf-8&amp;aq=t&amp;client=firefox-a&amp;ie=UTF8&amp;hl=fr&amp;hq=pmb+services&amp;hnear=Ch%C3%A2teau-du-Loir,+Sarthe,+Pays+de+la+Loire&amp;ll=47.684033,0.428048&amp;spn=0.018997,0.021956&amp;t=m&amp;output=embed\"></iframe><br /><small><a href=\"https://maps.google.fr/maps?q=pmb+services&amp;oe=utf-8&amp;aq=t&amp;client=firefox-a&amp;ie=UTF8&amp;hl=fr&amp;hq=pmb+services&amp;hnear=Ch%C3%A2teau-du-Loir,+Sarthe,+Pays+de+la+Loire&amp;ll=47.684033,0.428048&amp;spn=0.018997,0.021956&amp;t=m&amp;source=embed\" style=\"color:#0000FF;text-align:left\">Agrandir le plan</a></small>\r\n</td>\r\n<td style=\"font-size: 15px;\">\r\nPMB Services<br />\r\nZA de Mont sur Loir<br />\r\nBP 10 023<br />\r\n72 500 Ch\�teau du Loir<br />\r\n<br />\r\n<b>T\�l : +33 (0)2 43 440 660</b><br />\r\n<br />\r\n<b>Mail : pmb@sigb.net</b><br />\r\n<br />\r\nwww.sigb.net\r\n</td>\r\n</tr>\r\n</table>','Nous trouver',1,0,''),(7,'<h1>Mentions L\�gales</h1>\r\n\r\n<br /><br />\r\n\r\n<h2>1. Pr\�sentation de notre site web</h2>\r\n\r\n<p>Conform\�ment \� la loi n� 2004-2005 du 21 juin 2004 pour la confiance dans l\'\�conomie num\�rique, notre site web cr\�\� par <a href=\"<-- Url du site internet du cr\�ateur -->\" title=\"<--Cr\�ateur du site internet -->\"><--Cr\�ateur du site internet --></a>, propri\�taire du site <a href=\"<-- Url du site internet du cr\�ateur -->\" title=\"<--Cr\�ateur du site internet -->\"><-- Url du site internet du cr\�ateur --></a>, met \� disposition du public les informations concernant notre entreprise.<br />\r\nEventuellement modifiables, nous vous invitons donc \� consulter nos mentions l\�gales le plus souvent possible, de mani\�re \� en prendre connaissance fr\�quemment</p>\r\n\r\n<p>Le site <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a> appartient \� <--Propri\�taire du site --> - , dont le si\�ge social est situ\� \� l\'adresse suivante : <--Adresse postale du propri\�taire-->.<br />\r\nPersonne physique ou morale, <-- Nom du responsable de publication--> est responsable de la publication, dont l\'adresse e-mail est la suivante : <a href=\"mailto:<--Contact du responsable de publication -->\"><--Contact du responsable de publication --></a><br />\r\nLe webmaster, <--Nom du webmaster -->, est responsable de l\'administration du site, dont l\'adresse e-mail est la suivante : <a href=\"mailto:<--Contact du webmaster -->\"><--Contact du webmaster --></a>.<br />\r\nLes mentions l\�gales pr\�sentes sur ce site Internet ont \�t\� g\�n\�r\�es et offertes par <a href=\"http://www.g7design.fr\" title=\"G7design | Web & Print Agency\">l\'agence de communication web G7design</a>, situ\� au 11 rue Parmentier \� Nice, et r\�dig\�es par <a href=\"http://www.redacteur-contenu-web.com\" title=\"Agence redacteur-contenu-web.com\">Alexandre Montenon</a>, de l\'agence <a href=\"http://www.redacteur-contenu-web.com\">redacteur-contenu-web.com</a>.<br />\r\nLe site <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a> est h\�berg\� par <--Nom de l\\\'h\�bergeur -->, dont le si\�ge social est localis\� \� l\'adresse suivante : <--Adresse postale de l\\\'hebergeur -->.</p>\r\n\r\n<br /><br />\r\n\r\n<h2>2. Conditions g\�n\�rales d�utilisation du site et des services propos\�s.</h2>\r\n\r\n<p>En utilisant notre site web <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a>, vous acceptez pleinement et enti\�rement les conditions g\�n\�rales d\'utilisation pr\�cis\�es dans nos mentions l\�gales. Accessible \� tout type de visiteurs, il est important de pr\�ciser toutefois qu\'une interruption pour maintenance du site web peut-\�tre d\�cid\�e par <--Propri\�taire du site -->. Les dates et heures d\'interruptions seront n\�anmoins pr\�cis\�es \� l\'avance aux utilisateurs.</p>\r\n\r\n<br /><br />\r\n\r\n<h2>3. Les produits ou services propos\�s par <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a></h2>\r\n\r\n<p>En accord avec sa politique de communication, le site <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a> a pour vocation d\'informer les utilisateurs sur les services propos\�s par <--Propri\�taire du site -->, qui s\'efforce alors de fournir des informations pr\�cises sur son activit\�. Cependant, des inexactitudes ou des omissions peuvent exister : la soci\�t\� ne pourra en aucun cas \�tre tenue pour responsable pour toute erreur pr\�sente sur le site <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a>.</p>\r\n\r\n<br /><br />\r\n\r\n<h2>4.  Limitations contractuelles</h2>\r\n\r\n<p>Les informations retranscrites sur notre site web <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a> font l�objet de d\�marches qualitatives, en vue de nous assurer de leur fiabilit\�. Cependant, nous ne pourrons encourir de responsabilit\�s en cas d�inexactitudes techniques lors de nos explications.<br />\r\nSi vous constatez une erreur concernant des informations que nous auront pu omettre, n�h\�sitez pas \� nous le signaler par mail \� <a href=\"mailto:<--Contact du responsable de publication -->\"><--Contact du responsable de publication --></a>.</p>\r\n\r\n<p>Les liens reli\�s directement ou indirectement \� notre site web <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a> ne sont pas sous le contr�le de notre soci\�t\�. Par cons\�quent, nous ne pouvons nous assurer de l�exactitude des informations pr\�sentes sur ces autres sites Internet.</p>\r\n\r\n<p>Utilisant la technologie JavaScript, le site <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a> ne pourra \�tre tenu pour responsable en cas de dommages mat\�riels li\�s \� son utilisation. Par ailleurs, toute autre type de cons\�quence li\�e \� l\'exploitation du site <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a>, qu\'elle soit direct ou indirect (bug, incompatibilit\�, virus, perte de march\�, etc.).</p>\r\n\r\n<br /><br />\r\n\r\n<h2>5. Propri\�t\� intellectuelle et contenu du site Internet</h2>\r\n\r\n<p>Le contenu r\�dactionnel du site web <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a> appartient exclusivement \� <--Propri\�taire du site -->. Toute violation des droits d�auteur est sanctionn\�e par l�article L.335-2 du Code de la Propri\�t\� Intellectuelle, avec une peine encourue de 2 ans d�emprisonnement et de 150 000� d�amende</p>\r\n\r\n<p>Le site <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a> ne pourra \�tre mis en cause en cas de propos injurieux, \� caract\�re raciste, diffamant ou pornographique, \�chang\�s sur les espaces interactifs. La soci\�t\� se r\�serve \�galement le droit de supprimer tout contenu contraire aux valeurs de l\'entreprise ou \� la l\�gislation applicable en France.</p>\r\n\r\n<p>En naviguant sur le site <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a>, l\'utilisateur accepte \�galement l\'installation de cookies \�ventuelle sur son ordinateur.</p>\r\n\r\n<br /><br />\r\n\r\n<h2>6. Donn\�es personnelles, respect de votre vie priv\�e et de vos libert\�s</h2>\r\n\r\n<p>Toute informations recueillie sur le site web <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a> se font dans le cadre des besoins li\�s \� l\'utilisation de notre plateforme, tels que le formulaire de commande ou la demande d\'inscription \� la Newsletter. Par ailleurs, le d\�sabonnement de la Newsletter se fait gr\�ce au lien situ\� en pied de page.<br />\r\n<--Propri\�taire du site --> s\'engage \� ne c\�der en aucun cas les informations concernant les utilisateurs du site Internet, de quelque fa\�on qu\'il soit (vente, \�change, pr\�t, location, don).</p>\r\n\r\n<p>Conform\�ment \� la loi � informatique et libert\�s � du 6 janvier 1978 modifi\�e en 2004, l�utilisateur b\�n\�ficie d�un droit d�acc\�s et de rectification aux informations le concernant, droit qu�il peut exercer \� tout moment en adressant un mail \� l�adresse <a href=\"mailto:<--Contact du webmaster -->\"><--Contact du webmaster --></a>, ou en effectuant sa demande par courrier, \� l�adresse suivante : <--Adresse postale du propri\�taire-->.</p>\r\n\r\n<p>Le site web concern\� est d\�clar\� \� la CNIL sous le num\�ro : <-- Num\�ro CNIL --><br /><br />\r\nLes bases de donn\�es sont prot\�g\�es par les dispositions de la loi du 1er juillet 1998 transposant la directive 96/9 du 11 mars 1996 relative \� la protection juridique des bases de donn\�es.</p>\r\n\r\n<br /><br />\r\n\r\n<h2>7. Droit applicable et lois concern\�es</h2>\r\n\r\n<p>Soumis au droit fran\�ais, le site web <a href=\"<--Url du site-->\" title=\"<--Propri\�taire du site -->\"><--Url du site--></a> est encadr\� par la loi n� 2004-2005 du 21 juin 2004 pour la confiance dans l\'\�conomie num\�rique, l�article L.335-2 du Code de la Propri\�t\� Intellectuelle et la loi � informatique et libert\�s � du 6 janvier 1978 modifi\�e en 2004.</p>\r\n','Mentions légales',1,0,''),(3,'<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\" style=\"font-size: 10pt\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"2\" height=\"40\" valign=\"top\"><br />\r\n			<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"9\" valign=\"top\">\r\n			<p>\r\n			&nbsp;\r\n			</p>\r\n			</td>\r\n			<td class=\"typo\" width=\"600\" valign=\"top\" style=\"text-align: justify\"><strong>&nbsp;Comment se connecter &agrave; son compte lecteur ?</strong><br />\r\n			<br />\r\n			&nbsp;&nbsp;&nbsp;\r\n			<div>\r\n			<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0\" width=\"550\" height=\"333\">\r\n				<param name=\"height\" value=\"333\" />\r\n				<param name=\"width\" value=\"550\" />\r\n				<param name=\"allowscriptaccess\" value=\"always\" />\r\n				<param name=\"allowfullscreen\" value=\"true\" />\r\n				<param name=\"src\" value=\"http://vimeo.com/moogaloop.swf?clip_id=8873059&amp;server=vimeo.com&amp;fullscreen=1\" />\r\n				<embed type=\"application/x-shockwave-flash\" height=\"333\" width=\"550\" allowscriptaccess=\"always\" allowfullscreen=\"true\" src=\"http://vimeo.com/moogaloop.swf?clip_id=8873059&amp;server=vimeo.com&amp;fullscreen=1\"></embed>\r\n			</object>\r\n			</div>\r\n			<br />\r\n			<br />\r\n			<br />\r\n			<strong>&nbsp;Comment faire une r&eacute;servation ?</strong><br />\r\n			<br />\r\n			&nbsp;&nbsp;&nbsp;\r\n			<div>\r\n			<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0\" width=\"550\" height=\"333\">\r\n				<param name=\"height\" value=\"333\" />\r\n				<param name=\"width\" value=\"550\" />\r\n				<param name=\"allowscriptaccess\" value=\"always\" />\r\n				<param name=\"allowfullscreen\" value=\"true\" />\r\n				<param name=\"src\" value=\"http://vimeo.com/moogaloop.swf?clip_id=8888039&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=00adef&amp;fullscreen=1\" />\r\n				<embed type=\"application/x-shockwave-flash\" height=\"333\" width=\"550\" allowscriptaccess=\"always\" allowfullscreen=\"true\" src=\"http://vimeo.com/moogaloop.swf?clip_id=8888039&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=00adef&amp;fullscreen=1\"></embed>\r\n			</object>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<a href=\"http://paysa3v.reseaubibli.org/opac/index.php?lvl=infopages&pagesid=28\" target=\"_blank\">Infopage r&eacute;alis&eacute;e par l\'&eacute;quipe des M&eacute;diath&egrave;ques du pays A3V</a>','Aide en ligne',1,0,''),(4,'<h3>Calendoc, l\'agenda collaboratif des pros de l\'info-doc</h3>\r\n\r\n<iframe src=\"http://www.google.com/calendar/embed?ctz=Europe/Paris\" style=\"border: 0\" width=\"800\" height=\"600\" frameborder=\"0\" scrolling=\"no\"></iframe>\r\n<br />\r\n<a href=\"http://labibapprivoisee.wordpress.com/2009/01/27/calendoc-lagenda-collaboratif-des-pros-de-linfo-doc/\" target=\"_blank\">plus d\'infos sur Calendoc</a>','Consulter Calendoc',1,0,''),(5,'','aide sous la recherche simple',1,0,'');
/*!40000 ALTER TABLE `infopages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lenders`
--

DROP TABLE IF EXISTS `lenders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lenders` (
  `idlender` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `lender_libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idlender`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lenders`
--

LOCK TABLES `lenders` WRITE;
/*!40000 ALTER TABLE `lenders` DISABLE KEYS */;
INSERT INTO `lenders` VALUES (1,'BDP'),(2,'Fondo propio');
/*!40000 ALTER TABLE `lenders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liens_actes`
--

DROP TABLE IF EXISTS `liens_actes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liens_actes` (
  `num_acte` int(8) unsigned NOT NULL DEFAULT '0',
  `num_acte_lie` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_acte`,`num_acte_lie`),
  KEY `i_num_acte` (`num_acte`),
  KEY `i_num_acte_lie` (`num_acte_lie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liens_actes`
--

LOCK TABLES `liens_actes` WRITE;
/*!40000 ALTER TABLE `liens_actes` DISABLE KEYS */;
/*!40000 ALTER TABLE `liens_actes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lignes_actes`
--

DROP TABLE IF EXISTS `lignes_actes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lignes_actes` (
  `id_ligne` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `type_ligne` int(3) unsigned NOT NULL DEFAULT '0',
  `num_acte` int(8) unsigned NOT NULL DEFAULT '0',
  `lig_ref` int(15) unsigned NOT NULL DEFAULT '0',
  `num_acquisition` int(12) unsigned NOT NULL DEFAULT '0',
  `num_rubrique` int(8) unsigned NOT NULL DEFAULT '0',
  `num_produit` int(8) unsigned NOT NULL DEFAULT '0',
  `num_type` int(8) unsigned NOT NULL DEFAULT '0',
  `libelle` text COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prix` float(8,2) NOT NULL DEFAULT '0.00',
  `tva` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  `nb` int(5) unsigned NOT NULL DEFAULT '1',
  `date_ech` date NOT NULL DEFAULT '0000-00-00',
  `date_cre` date NOT NULL DEFAULT '0000-00-00',
  `statut` int(3) unsigned NOT NULL DEFAULT '0',
  `remise` float(8,2) NOT NULL DEFAULT '0.00',
  `index_ligne` text COLLATE utf8_unicode_ci NOT NULL,
  `ligne_ordre` smallint(2) unsigned NOT NULL DEFAULT '0',
  `debit_tva` smallint(2) unsigned NOT NULL DEFAULT '0',
  `commentaires_gestion` text COLLATE utf8_unicode_ci NOT NULL,
  `commentaires_opac` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_ligne`),
  KEY `num_acte` (`num_acte`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lignes_actes`
--

LOCK TABLES `lignes_actes` WRITE;
/*!40000 ALTER TABLE `lignes_actes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lignes_actes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lignes_actes_relances`
--

DROP TABLE IF EXISTS `lignes_actes_relances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lignes_actes_relances` (
  `num_ligne` int(10) unsigned NOT NULL,
  `date_relance` date NOT NULL DEFAULT '0000-00-00',
  `type_ligne` int(3) unsigned NOT NULL DEFAULT '0',
  `num_acte` int(8) unsigned NOT NULL DEFAULT '0',
  `lig_ref` int(15) unsigned NOT NULL DEFAULT '0',
  `num_acquisition` int(12) unsigned NOT NULL DEFAULT '0',
  `num_rubrique` int(8) unsigned NOT NULL DEFAULT '0',
  `num_produit` int(8) unsigned NOT NULL DEFAULT '0',
  `num_type` int(8) unsigned NOT NULL DEFAULT '0',
  `libelle` text COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prix` float(8,2) NOT NULL DEFAULT '0.00',
  `tva` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  `nb` int(5) unsigned NOT NULL DEFAULT '1',
  `date_ech` date NOT NULL DEFAULT '0000-00-00',
  `date_cre` date NOT NULL DEFAULT '0000-00-00',
  `statut` int(3) unsigned NOT NULL DEFAULT '1',
  `remise` float(8,2) NOT NULL DEFAULT '0.00',
  `index_ligne` text COLLATE utf8_unicode_ci NOT NULL,
  `ligne_ordre` smallint(2) unsigned NOT NULL DEFAULT '0',
  `debit_tva` smallint(2) unsigned NOT NULL DEFAULT '0',
  `commentaires_gestion` text COLLATE utf8_unicode_ci NOT NULL,
  `commentaires_opac` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`num_ligne`,`date_relance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lignes_actes_relances`
--

LOCK TABLES `lignes_actes_relances` WRITE;
/*!40000 ALTER TABLE `lignes_actes_relances` DISABLE KEYS */;
/*!40000 ALTER TABLE `lignes_actes_relances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lignes_actes_statuts`
--

DROP TABLE IF EXISTS `lignes_actes_statuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lignes_actes_statuts` (
  `id_statut` int(3) NOT NULL AUTO_INCREMENT,
  `libelle` text COLLATE utf8_unicode_ci NOT NULL,
  `relance` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_statut`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lignes_actes_statuts`
--

LOCK TABLES `lignes_actes_statuts` WRITE;
/*!40000 ALTER TABLE `lignes_actes_statuts` DISABLE KEYS */;
INSERT INTO `lignes_actes_statuts` VALUES (1,'Traitement normal',1);
/*!40000 ALTER TABLE `lignes_actes_statuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_mots`
--

DROP TABLE IF EXISTS `linked_mots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linked_mots` (
  `num_mot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_linked_mot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type_lien` tinyint(1) NOT NULL DEFAULT '1',
  `ponderation` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`num_mot`,`num_linked_mot`,`type_lien`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_mots`
--

LOCK TABLES `linked_mots` WRITE;
/*!40000 ALTER TABLE `linked_mots` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_mots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_expl_retard`
--

DROP TABLE IF EXISTS `log_expl_retard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_expl_retard` (
  `id_log` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expl_id` int(11) NOT NULL DEFAULT '0',
  `expl_cb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_pret` date NOT NULL DEFAULT '0000-00-00',
  `date_retour` date NOT NULL DEFAULT '0000-00-00',
  `amende` decimal(16,2) NOT NULL DEFAULT '0.00',
  `num_log_retard` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_log`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_expl_retard`
--

LOCK TABLES `log_expl_retard` WRITE;
/*!40000 ALTER TABLE `log_expl_retard` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_expl_retard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_retard`
--

DROP TABLE IF EXISTS `log_retard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_retard` (
  `id_log` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `niveau_reel` int(1) NOT NULL DEFAULT '0',
  `niveau_suppose` int(1) NOT NULL DEFAULT '0',
  `amende_totale` decimal(16,2) NOT NULL DEFAULT '0.00',
  `frais` decimal(16,2) NOT NULL DEFAULT '0.00',
  `idempr` int(11) NOT NULL DEFAULT '0',
  `log_printed` int(1) unsigned NOT NULL DEFAULT '0',
  `log_mail` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_log`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_retard`
--

LOCK TABLES `log_retard` WRITE;
/*!40000 ALTER TABLE `log_retard` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_retard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logopac`
--

DROP TABLE IF EXISTS `logopac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logopac` (
  `id_log` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `date_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url_demandee` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url_referente` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `get_log` blob NOT NULL,
  `post_log` blob NOT NULL,
  `num_session` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server_log` blob NOT NULL,
  `empr_carac` blob NOT NULL,
  `empr_doc` blob NOT NULL,
  `empr_expl` blob NOT NULL,
  `nb_result` blob NOT NULL,
  `gen_stat` blob NOT NULL,
  PRIMARY KEY (`id_log`),
  KEY `lopac_date_log` (`date_log`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logopac`
--

LOCK TABLES `logopac` WRITE;
/*!40000 ALTER TABLE `logopac` DISABLE KEYS */;
/*!40000 ALTER TABLE `logopac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailtpl`
--

DROP TABLE IF EXISTS `mailtpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailtpl` (
  `id_mailtpl` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mailtpl_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mailtpl_objet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mailtpl_tpl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `mailtpl_users` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_mailtpl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailtpl`
--

LOCK TABLES `mailtpl` WRITE;
/*!40000 ALTER TABLE `mailtpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailtpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_echelles`
--

DROP TABLE IF EXISTS `map_echelles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_echelles` (
  `map_echelle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_echelle_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`map_echelle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_echelles`
--

LOCK TABLES `map_echelles` WRITE;
/*!40000 ALTER TABLE `map_echelles` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_echelles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_emprises`
--

DROP TABLE IF EXISTS `map_emprises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_emprises` (
  `map_emprise_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_emprise_type` int(10) unsigned NOT NULL DEFAULT '0',
  `map_emprise_obj_num` int(10) unsigned NOT NULL DEFAULT '0',
  `map_emprise_data` geometry NOT NULL,
  `map_emprise_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map_emprise_id`),
  KEY `i_map_emprise_obj_num` (`map_emprise_obj_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_emprises`
--

LOCK TABLES `map_emprises` WRITE;
/*!40000 ALTER TABLE `map_emprises` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_emprises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_hold_areas`
--

DROP TABLE IF EXISTS `map_hold_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_hold_areas` (
  `id_obj` int(10) unsigned NOT NULL DEFAULT '0',
  `type_obj` int(10) unsigned NOT NULL DEFAULT '0',
  `area` double DEFAULT NULL,
  `bbox_area` double DEFAULT NULL,
  `center` longtext CHARACTER SET latin1,
  PRIMARY KEY (`id_obj`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_hold_areas`
--

LOCK TABLES `map_hold_areas` WRITE;
/*!40000 ALTER TABLE `map_hold_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_hold_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_projections`
--

DROP TABLE IF EXISTS `map_projections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_projections` (
  `map_projection_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_projection_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`map_projection_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_projections`
--

LOCK TABLES `map_projections` WRITE;
/*!40000 ALTER TABLE `map_projections` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_projections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_refs`
--

DROP TABLE IF EXISTS `map_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_refs` (
  `map_ref_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_ref_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`map_ref_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_refs`
--

LOCK TABLES `map_refs` WRITE;
/*!40000 ALTER TABLE `map_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mots`
--

DROP TABLE IF EXISTS `mots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mots` (
  `id_mot` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mot` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_mot`),
  UNIQUE KEY `mot` (`mot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mots`
--

LOCK TABLES `mots` WRITE;
/*!40000 ALTER TABLE `mots` DISABLE KEYS */;
/*!40000 ALTER TABLE `mots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noeuds`
--

DROP TABLE IF EXISTS `noeuds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noeuds` (
  `id_noeud` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `autorite` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_parent` int(9) unsigned NOT NULL DEFAULT '0',
  `num_renvoi_voir` int(9) unsigned NOT NULL DEFAULT '0',
  `visible` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `num_thesaurus` int(3) unsigned NOT NULL DEFAULT '0',
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `authority_import_denied` int(10) unsigned NOT NULL DEFAULT '0',
  `not_use_in_indexation` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_noeud`),
  KEY `num_parent` (`num_parent`),
  KEY `num_thesaurus` (`num_thesaurus`),
  KEY `autorite` (`autorite`),
  KEY `key_path` (`path`(333)),
  KEY `i_num_renvoi_voir` (`num_renvoi_voir`)
) ENGINE=MyISAM AUTO_INCREMENT=2513 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noeuds`
--

LOCK TABLES `noeuds` WRITE;
/*!40000 ALTER TABLE `noeuds` DISABLE KEYS */;
INSERT INTO `noeuds` VALUES (1,'TOP',0,0,'0',1,'',0,0),(2,'NONCLASSES',1,0,'0',1,'',0,0),(3,'ORPHELINS',1,0,'0',1,'',0,0);
/*!40000 ALTER TABLE `noeuds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_children_records`
--

DROP TABLE IF EXISTS `nomenclature_children_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_children_records` (
  `child_record_num_record` int(10) unsigned NOT NULL DEFAULT '0',
  `child_record_num_formation` int(10) unsigned NOT NULL DEFAULT '0',
  `child_record_num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `child_record_num_musicstand` int(10) unsigned NOT NULL DEFAULT '0',
  `child_record_num_instrument` int(10) unsigned NOT NULL DEFAULT '0',
  `child_record_effective` int(10) unsigned NOT NULL DEFAULT '0',
  `child_record_order` int(10) unsigned NOT NULL DEFAULT '0',
  `child_record_other` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `child_record_num_voice` int(10) unsigned NOT NULL DEFAULT '0',
  `child_record_num_workshop` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`child_record_num_record`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_children_records`
--

LOCK TABLES `nomenclature_children_records` WRITE;
/*!40000 ALTER TABLE `nomenclature_children_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_children_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_exotic_instruments`
--

DROP TABLE IF EXISTS `nomenclature_exotic_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_exotic_instruments` (
  `id_exotic_instrument` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exotic_instrument_num_nomenclature` int(10) unsigned NOT NULL DEFAULT '0',
  `exotic_instrument_num_instrument` int(10) unsigned NOT NULL DEFAULT '0',
  `exotic_instrument_number` int(10) unsigned NOT NULL DEFAULT '0',
  `exotic_instrument_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_exotic_instrument`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_exotic_instruments`
--

LOCK TABLES `nomenclature_exotic_instruments` WRITE;
/*!40000 ALTER TABLE `nomenclature_exotic_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_exotic_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_exotic_other_instruments`
--

DROP TABLE IF EXISTS `nomenclature_exotic_other_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_exotic_other_instruments` (
  `id_exotic_other_instrument` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exotic_other_instrument_num_exotic_instrument` int(10) unsigned NOT NULL DEFAULT '0',
  `exotic_other_instrument_num_instrument` int(10) unsigned NOT NULL DEFAULT '0',
  `exotic_other_instrument_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_exotic_other_instrument`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_exotic_other_instruments`
--

LOCK TABLES `nomenclature_exotic_other_instruments` WRITE;
/*!40000 ALTER TABLE `nomenclature_exotic_other_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_exotic_other_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_families`
--

DROP TABLE IF EXISTS `nomenclature_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_families` (
  `id_family` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `family_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `family_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_family`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_families`
--

LOCK TABLES `nomenclature_families` WRITE;
/*!40000 ALTER TABLE `nomenclature_families` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_formations`
--

DROP TABLE IF EXISTS `nomenclature_formations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_formations` (
  `id_formation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `formation_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `formation_nature` int(10) unsigned NOT NULL DEFAULT '0',
  `formation_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_formation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_formations`
--

LOCK TABLES `nomenclature_formations` WRITE;
/*!40000 ALTER TABLE `nomenclature_formations` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_formations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_instruments`
--

DROP TABLE IF EXISTS `nomenclature_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_instruments` (
  `id_instrument` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instrument_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instrument_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instrument_musicstand_num` int(10) unsigned NOT NULL DEFAULT '0',
  `instrument_standard` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_instrument`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_instruments`
--

LOCK TABLES `nomenclature_instruments` WRITE;
/*!40000 ALTER TABLE `nomenclature_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_musicstands`
--

DROP TABLE IF EXISTS `nomenclature_musicstands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_musicstands` (
  `id_musicstand` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `musicstand_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `musicstand_famille_num` int(10) unsigned NOT NULL DEFAULT '0',
  `musicstand_division` int(10) unsigned NOT NULL DEFAULT '0',
  `musicstand_order` int(10) unsigned NOT NULL DEFAULT '0',
  `musicstand_workshop` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_musicstand`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_musicstands`
--

LOCK TABLES `nomenclature_musicstands` WRITE;
/*!40000 ALTER TABLE `nomenclature_musicstands` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_musicstands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_notices_nomenclatures`
--

DROP TABLE IF EXISTS `nomenclature_notices_nomenclatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_notices_nomenclatures` (
  `id_notice_nomenclature` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_nomenclature_num_notice` int(10) unsigned NOT NULL DEFAULT '0',
  `notice_nomenclature_num_formation` int(10) unsigned NOT NULL DEFAULT '0',
  `notice_nomenclature_num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `notice_nomenclature_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notice_nomenclature_abbreviation` text COLLATE utf8_unicode_ci NOT NULL,
  `notice_nomenclature_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `notice_nomenclature_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_notice_nomenclature`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_notices_nomenclatures`
--

LOCK TABLES `nomenclature_notices_nomenclatures` WRITE;
/*!40000 ALTER TABLE `nomenclature_notices_nomenclatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_notices_nomenclatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_types`
--

DROP TABLE IF EXISTS `nomenclature_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_types` (
  `id_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_formation_num` int(10) unsigned NOT NULL DEFAULT '0',
  `type_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_types`
--

LOCK TABLES `nomenclature_types` WRITE;
/*!40000 ALTER TABLE `nomenclature_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_voices`
--

DROP TABLE IF EXISTS `nomenclature_voices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_voices` (
  `id_voice` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `voice_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `voice_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `voice_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_voice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_voices`
--

LOCK TABLES `nomenclature_voices` WRITE;
/*!40000 ALTER TABLE `nomenclature_voices` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_voices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_workshops`
--

DROP TABLE IF EXISTS `nomenclature_workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_workshops` (
  `id_workshop` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshop_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workshop_num_nomenclature` int(10) unsigned NOT NULL DEFAULT '0',
  `workshop_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_workshop`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_workshops`
--

LOCK TABLES `nomenclature_workshops` WRITE;
/*!40000 ALTER TABLE `nomenclature_workshops` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_workshops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomenclature_workshops_instruments`
--

DROP TABLE IF EXISTS `nomenclature_workshops_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_workshops_instruments` (
  `id_workshop_instrument` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshop_instrument_num_workshop` int(10) unsigned NOT NULL DEFAULT '0',
  `workshop_instrument_num_instrument` int(10) unsigned NOT NULL DEFAULT '0',
  `workshop_instrument_number` int(10) unsigned NOT NULL DEFAULT '0',
  `workshop_instrument_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_workshop_instrument`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomenclature_workshops_instruments`
--

LOCK TABLES `nomenclature_workshops_instruments` WRITE;
/*!40000 ALTER TABLE `nomenclature_workshops_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenclature_workshops_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_onglet`
--

DROP TABLE IF EXISTS `notice_onglet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_onglet` (
  `id_onglet` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `onglet_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_onglet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_onglet`
--

LOCK TABLES `notice_onglet` WRITE;
/*!40000 ALTER TABLE `notice_onglet` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_onglet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_statut`
--

DROP TABLE IF EXISTS `notice_statut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_statut` (
  `id_notice_statut` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gestion_libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opac_libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notice_visible_opac` tinyint(1) NOT NULL DEFAULT '1',
  `notice_visible_gestion` tinyint(1) NOT NULL DEFAULT '1',
  `expl_visible_opac` tinyint(1) NOT NULL DEFAULT '1',
  `class_html` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notice_visible_opac_abon` tinyint(1) NOT NULL DEFAULT '0',
  `expl_visible_opac_abon` int(10) unsigned NOT NULL DEFAULT '0',
  `explnum_visible_opac` int(1) unsigned NOT NULL DEFAULT '1',
  `explnum_visible_opac_abon` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_notice_statut`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_statut`
--

LOCK TABLES `notice_statut` WRITE;
/*!40000 ALTER TABLE `notice_statut` DISABLE KEYS */;
INSERT INTO `notice_statut` VALUES (1,'Sin estado','',1,1,1,'statutnot1',0,0,1,0),(2,'Préstamo rápido','',0,1,1,'statutnot2',1,0,1,0),(3,'Pedido','commandé',1,1,1,'statutnot4',0,0,1,0),(4,'En cours d\'import / saisie','',0,1,0,'statutnot10',0,0,0,0);
/*!40000 ALTER TABLE `notice_statut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_tpl`
--

DROP TABLE IF EXISTS `notice_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_tpl` (
  `notpl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notpl_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notpl_code` text COLLATE utf8_unicode_ci NOT NULL,
  `notpl_comment` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notpl_id_test` int(10) unsigned NOT NULL DEFAULT '0',
  `notpl_show_opac` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`notpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_tpl`
--

LOCK TABLES `notice_tpl` WRITE;
/*!40000 ALTER TABLE `notice_tpl` DISABLE KEYS */;
INSERT INTO `notice_tpl` VALUES (5,'Template d\'affichage personnalisé sans vignette','','Template d\'affichage personnalisé sans vignette',58,1),(4,'Template d\'affichage personnalisé','','',58,0),(6,'Bibliographie','','PMB Services',58,0);
/*!40000 ALTER TABLE `notice_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_tplcode`
--

DROP TABLE IF EXISTS `notice_tplcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_tplcode` (
  `num_notpl` int(10) unsigned NOT NULL DEFAULT '0',
  `notplcode_localisation` mediumint(8) NOT NULL DEFAULT '0',
  `notplcode_typdoc` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `notplcode_niveau_biblio` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `notplcode_niveau_hierar` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `nottplcode_code` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`num_notpl`,`notplcode_localisation`,`notplcode_typdoc`,`notplcode_niveau_biblio`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_tplcode`
--

LOCK TABLES `notice_tplcode` WRITE;
/*!40000 ALTER TABLE `notice_tplcode` DISABLE KEYS */;
INSERT INTO `notice_tplcode` VALUES (5,0,'0','0','0','<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n<tr>\r\n<td>\r\n<h2>\r\n#title();\r\n</h2>\r\n\r\n\r\n<p class=\"resume\">\r\n#resume();\r\n</p>\r\n<p class=\"source\">\r\n\r\n#b_empty(#author();#b_empty(#author_1();, - );, - );\r\n#if(#is_article();,\r\n#nom_revue();#a_empty(#numero_bulletin();, - ); - #date_bulletin();,\r\n#b_empty(#publisher();, - ); #year_publication(););\r\n#a_empty(#note();,<br />);\r\n</p>\r\n<br />\r\n<p class=\"resume\">\r\n#contenu();\r\n</p>\r\n#expl_num();\r\n</td>\r\n</tr>\r\n</table>'),(4,0,'0','0','0','<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n<tr>\r\n<td>\r\n<h2>\r\n#title();\r\n</h2>\r\n\r\n\r\n<p class=\"resume\">\r\n#resume();\r\n</p>\r\n<p class=\"source\">\r\n\r\n#b_empty(#author();#b_empty(#author_1();, - );, - );\r\n#if(#is_article();,\r\n#nom_revue();#a_empty(#numero_bulletin();, - ); - #date_bulletin();,\r\n#b_empty(#publisher();, - ); #year_publication(););\r\n#a_empty(#note();,<br />);\r\n</p>\r\n<br />\r\n<p class=\"resume\">\r\n#contenu();\r\n</p>\r\n#expl_num();\r\n</td>\r\n<td>\r\n#str_replace(&,&amp;,#img(););\r\n</td>\r\n</tr>\r\n</table>'),(6,0,'0','a','0','#str_replace(\\, .,.,#b_empty(#authors_by_type_with_tpl(1,3,\\, ,\\, ,0,1,70\\,71\\,72,{name}\\, {rejete});,#ifequal(#lastchr(#authors_by_type_with_tpl(1,3,\\, ,\\, ,0,1,70\\,71\\,72,{name}\\, {rejete}););,., ,. );););\r\n\r\n&laquo; #title();#a_empty(#complement_title();, : );#a_empty(#parallel_title();, = ); &raquo;#ifequal(#lastchr(#title();#a_empty(#complement_title();, : );#a_empty(#parallel_title();, = ););,.,,#ifequal(#lastchr(#title();#a_empty(#complement_title();, : );#a_empty(#parallel_title();, = ););,!,,#ifequal(#lastchr(#title();#a_empty(#complement_title();, : );#a_empty(#parallel_title();, = ););,?,,.););); \r\n\r\n<i>#nom_revue();</i>#a_empty(#numero_bulletin();,\\, );#not_empty(#date_bulletin();, (#if(#extract_path((.*) [(],#date_bulletin(););,#extract_path((.*) [(],#date_bulletin(););,#date_bulletin(););));#not_empty(#page();,\\, #if(#extract_path(^[0-9](.*),#page(););,p. #page();,#page(););#ifequal(#lastchr(#page(););,.,,.););'),(6,0,'0','0','0','#str_replace(\\, .,.,#b_empty(#authors_by_type_with_tpl(1,3,\\, ,\\, ,0,1,70\\,71\\,72,{name}\\, {rejete});,#ifequal(#lastchr(#authors_by_type_with_tpl(1,3,\\, ,\\, ,0,1,70\\,71\\,72,{name}\\, {rejete}););,., ,. );););\r\n\r\n<i>#title();#a_empty(#complement_title();, : );#a_empty(#parallel_title();, = );#ifequal(#lastchr(#title();#a_empty(#complement_title();, : );#a_empty(#parallel_title();, = ););,.,,#ifequal(#lastchr(#title();#a_empty(#complement_title();, : );#a_empty(#parallel_title();, = ););,!,,#ifequal(#lastchr(#title();#a_empty(#complement_title();, : );#a_empty(#parallel_title();, = ););,?,,.););); </i>\r\n\r\n#mention_edition();#ifequal(#lastchr(#mention_edition(););,., ,#not_empty(#mention_edition();,. ););#publisher();#a_empty(#year_publication();,\\, );#ifequal(#lastchr(#publisher();#a_empty(#year_publication();,\\, ););,.,,#not_empty(#publisher();#a_empty(#year_publication();,\\, );,.););\r\n\r\n #page();\r\n\r\n#not_empty(#collection();, (#if(#extract_path((.*)\\, ISSN,#collection(););,#extract_path((.*)\\, ISSN,#collection(););,#collection(););#a_empty(#notice_field(nocoll);, ; );) );');
/*!40000 ALTER TABLE `notice_tplcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `typdoc` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `tit1` text COLLATE utf8_unicode_ci,
  `tit2` text COLLATE utf8_unicode_ci,
  `tit3` text COLLATE utf8_unicode_ci,
  `tit4` text COLLATE utf8_unicode_ci,
  `tparent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tnvol` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ed1_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ed2_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `coll_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subcoll_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `year` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nocoll` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mention_edition` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `npages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ill` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accomp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_gen` text COLLATE utf8_unicode_ci NOT NULL,
  `n_contenu` text COLLATE utf8_unicode_ci NOT NULL,
  `n_resume` text COLLATE utf8_unicode_ci NOT NULL,
  `lien` text COLLATE utf8_unicode_ci NOT NULL,
  `eformat` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `index_l` text COLLATE utf8_unicode_ci NOT NULL,
  `indexint` int(8) unsigned NOT NULL DEFAULT '0',
  `index_serie` tinytext COLLATE utf8_unicode_ci,
  `index_matieres` text COLLATE utf8_unicode_ci NOT NULL,
  `niveau_biblio` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `niveau_hierar` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `origine_catalogage` int(8) unsigned NOT NULL DEFAULT '1',
  `prix` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `index_n_gen` text COLLATE utf8_unicode_ci,
  `index_n_contenu` text COLLATE utf8_unicode_ci,
  `index_n_resume` text COLLATE utf8_unicode_ci,
  `index_sew` text COLLATE utf8_unicode_ci,
  `index_wew` text COLLATE utf8_unicode_ci,
  `statut` int(5) NOT NULL DEFAULT '1',
  `commentaire_gestion` text COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT '2005-01-01 00:00:00',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `signature` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thumbnail_url` mediumblob NOT NULL,
  `date_parution` date NOT NULL DEFAULT '0000-00-00',
  `opac_visible_bulletinage` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `indexation_lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `map_echelle_num` int(10) unsigned NOT NULL DEFAULT '0',
  `map_projection_num` int(10) unsigned NOT NULL DEFAULT '0',
  `map_ref_num` int(10) unsigned NOT NULL DEFAULT '0',
  `map_equinoxe` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notice_is_new` int(10) unsigned NOT NULL DEFAULT '0',
  `notice_date_is_new` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `opac_serialcirc_demande` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`notice_id`),
  KEY `typdoc` (`typdoc`),
  KEY `tparent_id` (`tparent_id`),
  KEY `ed1_id` (`ed1_id`),
  KEY `ed2_id` (`ed2_id`),
  KEY `coll_id` (`coll_id`),
  KEY `subcoll_id` (`subcoll_id`),
  KEY `cb` (`code`),
  KEY `indexint` (`indexint`),
  KEY `sig_index` (`signature`),
  KEY `i_notice_n_biblio` (`niveau_biblio`),
  KEY `i_notice_n_hierar` (`niveau_hierar`),
  KEY `notice_eformat` (`eformat`),
  KEY `i_date_parution` (`date_parution`),
  KEY `i_not_statut` (`statut`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_authorities_sources`
--

DROP TABLE IF EXISTS `notices_authorities_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_authorities_sources` (
  `num_authority_source` int(10) unsigned NOT NULL DEFAULT '0',
  `num_notice` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_authority_source`,`num_notice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_authorities_sources`
--

LOCK TABLES `notices_authorities_sources` WRITE;
/*!40000 ALTER TABLE `notices_authorities_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_authorities_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_authperso`
--

DROP TABLE IF EXISTS `notices_authperso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_authperso` (
  `notice_authperso_notice_num` int(10) unsigned NOT NULL DEFAULT '0',
  `notice_authperso_authority_num` int(10) unsigned NOT NULL DEFAULT '0',
  `notice_authperso_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`notice_authperso_notice_num`,`notice_authperso_authority_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_authperso`
--

LOCK TABLES `notices_authperso` WRITE;
/*!40000 ALTER TABLE `notices_authperso` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_authperso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_categories`
--

DROP TABLE IF EXISTS `notices_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_categories` (
  `notcateg_notice` int(9) unsigned NOT NULL DEFAULT '0',
  `num_noeud` int(9) unsigned NOT NULL DEFAULT '0',
  `num_vedette` int(3) unsigned NOT NULL DEFAULT '0',
  `ordre_vedette` int(3) unsigned NOT NULL DEFAULT '1',
  `ordre_categorie` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`notcateg_notice`,`num_noeud`,`num_vedette`),
  KEY `num_noeud` (`num_noeud`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_categories`
--

LOCK TABLES `notices_categories` WRITE;
/*!40000 ALTER TABLE `notices_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_custom`
--

DROP TABLE IF EXISTS `notices_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_custom`
--

LOCK TABLES `notices_custom` WRITE;
/*!40000 ALTER TABLE `notices_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_custom_lists`
--

DROP TABLE IF EXISTS `notices_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_custom_lists` (
  `notices_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `notices_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notices_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `notices_custom_champ` (`notices_custom_champ`),
  KEY `i_ncl_lv` (`notices_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_custom_lists`
--

LOCK TABLES `notices_custom_lists` WRITE;
/*!40000 ALTER TABLE `notices_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_custom_values`
--

DROP TABLE IF EXISTS `notices_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_custom_values` (
  `notices_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `notices_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `notices_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notices_custom_text` text COLLATE utf8_unicode_ci,
  `notices_custom_integer` int(11) DEFAULT NULL,
  `notices_custom_date` date DEFAULT NULL,
  `notices_custom_float` float DEFAULT NULL,
  KEY `notices_custom_champ` (`notices_custom_champ`),
  KEY `notices_custom_origine` (`notices_custom_origine`),
  KEY `i_ncv_st` (`notices_custom_small_text`),
  KEY `i_ncv_t` (`notices_custom_text`(255)),
  KEY `i_ncv_i` (`notices_custom_integer`),
  KEY `i_ncv_d` (`notices_custom_date`),
  KEY `i_ncv_f` (`notices_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_custom_values`
--

LOCK TABLES `notices_custom_values` WRITE;
/*!40000 ALTER TABLE `notices_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_externes`
--

DROP TABLE IF EXISTS `notices_externes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_externes` (
  `num_notice` int(11) NOT NULL DEFAULT '0',
  `recid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`num_notice`),
  KEY `i_recid` (`recid`),
  KEY `i_notice_recid` (`num_notice`,`recid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_externes`
--

LOCK TABLES `notices_externes` WRITE;
/*!40000 ALTER TABLE `notices_externes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_externes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_fields_global_index`
--

DROP TABLE IF EXISTS `notices_fields_global_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_fields_global_index` (
  `id_notice` mediumint(8) NOT NULL DEFAULT '0',
  `code_champ` int(3) NOT NULL DEFAULT '0',
  `code_ss_champ` int(3) NOT NULL DEFAULT '0',
  `ordre` int(4) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `pond` int(4) NOT NULL DEFAULT '100',
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authority_num` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_notice`,`code_champ`,`code_ss_champ`,`lang`,`ordre`),
  KEY `i_value` (`value`(300)),
  KEY `i_code_champ_code_ss_champ` (`code_champ`,`code_ss_champ`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
/*!50100 PARTITION BY KEY (code_champ,code_ss_champ)
PARTITIONS 50 */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_fields_global_index`
--

LOCK TABLES `notices_fields_global_index` WRITE;
/*!40000 ALTER TABLE `notices_fields_global_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_fields_global_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_global_index`
--

DROP TABLE IF EXISTS `notices_global_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_global_index` (
  `num_notice` mediumint(8) NOT NULL DEFAULT '0',
  `no_index` mediumint(8) NOT NULL DEFAULT '0',
  `infos_global` text COLLATE utf8_unicode_ci NOT NULL,
  `index_infos_global` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`num_notice`,`no_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_global_index`
--

LOCK TABLES `notices_global_index` WRITE;
/*!40000 ALTER TABLE `notices_global_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_global_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_langues`
--

DROP TABLE IF EXISTS `notices_langues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_langues` (
  `num_notice` int(8) unsigned NOT NULL DEFAULT '0',
  `type_langue` int(1) unsigned NOT NULL DEFAULT '0',
  `code_langue` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ordre_langue` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_notice`,`type_langue`,`code_langue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_langues`
--

LOCK TABLES `notices_langues` WRITE;
/*!40000 ALTER TABLE `notices_langues` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_langues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_mots_global_index`
--

DROP TABLE IF EXISTS `notices_mots_global_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_mots_global_index` (
  `id_notice` mediumint(8) NOT NULL DEFAULT '0',
  `code_champ` int(3) NOT NULL DEFAULT '0',
  `code_ss_champ` int(3) NOT NULL DEFAULT '0',
  `num_word` int(10) unsigned NOT NULL DEFAULT '0',
  `pond` int(4) NOT NULL DEFAULT '100',
  `position` int(11) NOT NULL DEFAULT '1',
  `field_position` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_notice`,`code_champ`,`code_ss_champ`,`num_word`,`position`,`field_position`),
  KEY `code_champ` (`code_champ`),
  KEY `i_id_mot` (`num_word`,`id_notice`),
  KEY `i_code_champ_code_ss_champ_num_word` (`code_champ`,`code_ss_champ`,`num_word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
/*!50100 PARTITION BY KEY (code_champ,code_ss_champ)
PARTITIONS 50 */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_mots_global_index`
--

LOCK TABLES `notices_mots_global_index` WRITE;
/*!40000 ALTER TABLE `notices_mots_global_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_mots_global_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_relations`
--

DROP TABLE IF EXISTS `notices_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_relations` (
  `num_notice` bigint(20) unsigned NOT NULL DEFAULT '0',
  `linked_notice` bigint(20) unsigned NOT NULL DEFAULT '0',
  `relation_type` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_notice`,`linked_notice`),
  KEY `linked_notice` (`linked_notice`),
  KEY `relation_type` (`relation_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_relations`
--

LOCK TABLES `notices_relations` WRITE;
/*!40000 ALTER TABLE `notices_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_titres_uniformes`
--

DROP TABLE IF EXISTS `notices_titres_uniformes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_titres_uniformes` (
  `ntu_num_notice` int(9) unsigned NOT NULL DEFAULT '0',
  `ntu_num_tu` int(9) unsigned NOT NULL DEFAULT '0',
  `ntu_titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ntu_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ntu_sous_vedette` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ntu_langue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ntu_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ntu_mention` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ntu_ordre` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ntu_num_notice`,`ntu_num_tu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_titres_uniformes`
--

LOCK TABLES `notices_titres_uniformes` WRITE;
/*!40000 ALTER TABLE `notices_titres_uniformes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices_titres_uniformes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offres_remises`
--

DROP TABLE IF EXISTS `offres_remises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offres_remises` (
  `num_fournisseur` int(5) unsigned NOT NULL DEFAULT '0',
  `num_produit` int(8) unsigned NOT NULL DEFAULT '0',
  `remise` float(4,2) unsigned NOT NULL DEFAULT '0.00',
  `condition_remise` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`num_fournisseur`,`num_produit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offres_remises`
--

LOCK TABLES `offres_remises` WRITE;
/*!40000 ALTER TABLE `offres_remises` DISABLE KEYS */;
/*!40000 ALTER TABLE `offres_remises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onto_uri`
--

DROP TABLE IF EXISTS `onto_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onto_uri` (
  `uri_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uri_id`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onto_uri`
--

LOCK TABLES `onto_uri` WRITE;
/*!40000 ALTER TABLE `onto_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `onto_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opac_filters`
--

DROP TABLE IF EXISTS `opac_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opac_filters` (
  `opac_filter_view_num` int(10) unsigned NOT NULL DEFAULT '0',
  `opac_filter_path` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `opac_filter_param` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`opac_filter_view_num`,`opac_filter_path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opac_filters`
--

LOCK TABLES `opac_filters` WRITE;
/*!40000 ALTER TABLE `opac_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `opac_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opac_liste_lecture`
--

DROP TABLE IF EXISTS `opac_liste_lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opac_liste_lecture` (
  `id_liste` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `nom_liste` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `notices_associees` blob NOT NULL,
  `public` int(1) NOT NULL DEFAULT '0',
  `num_empr` int(8) unsigned NOT NULL DEFAULT '0',
  `read_only` int(1) NOT NULL DEFAULT '0',
  `confidential` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_liste`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opac_liste_lecture`
--

LOCK TABLES `opac_liste_lecture` WRITE;
/*!40000 ALTER TABLE `opac_liste_lecture` DISABLE KEYS */;
/*!40000 ALTER TABLE `opac_liste_lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opac_sessions`
--

DROP TABLE IF EXISTS `opac_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opac_sessions` (
  `empr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session` mediumblob,
  `date_rec` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`empr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opac_sessions`
--

LOCK TABLES `opac_sessions` WRITE;
/*!40000 ALTER TABLE `opac_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `opac_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opac_views`
--

DROP TABLE IF EXISTS `opac_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opac_views` (
  `opac_view_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opac_view_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `opac_view_query` text COLLATE utf8_unicode_ci NOT NULL,
  `opac_view_human_query` text COLLATE utf8_unicode_ci NOT NULL,
  `opac_view_param` text COLLATE utf8_unicode_ci NOT NULL,
  `opac_view_visible` int(1) unsigned NOT NULL DEFAULT '0',
  `opac_view_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `opac_view_last_gen` datetime DEFAULT NULL,
  `opac_view_ttl` int(11) NOT NULL DEFAULT '86400',
  PRIMARY KEY (`opac_view_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opac_views`
--

LOCK TABLES `opac_views` WRITE;
/*!40000 ALTER TABLE `opac_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `opac_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opac_views_empr`
--

DROP TABLE IF EXISTS `opac_views_empr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opac_views_empr` (
  `emprview_view_num` int(10) unsigned NOT NULL DEFAULT '0',
  `emprview_empr_num` int(10) unsigned NOT NULL DEFAULT '0',
  `emprview_default` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`emprview_view_num`,`emprview_empr_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opac_views_empr`
--

LOCK TABLES `opac_views_empr` WRITE;
/*!40000 ALTER TABLE `opac_views_empr` DISABLE KEYS */;
/*!40000 ALTER TABLE `opac_views_empr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origin_authorities`
--

DROP TABLE IF EXISTS `origin_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origin_authorities` (
  `id_origin_authorities` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `origin_authorities_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `origin_authorities_country` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `origin_authorities_diffusible` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_origin_authorities`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origin_authorities`
--

LOCK TABLES `origin_authorities` WRITE;
/*!40000 ALTER TABLE `origin_authorities` DISABLE KEYS */;
INSERT INTO `origin_authorities` VALUES (1,'Catalogue Interne','FR',1),(2,'BnF','FR',1);
/*!40000 ALTER TABLE `origin_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origine_notice`
--

DROP TABLE IF EXISTS `origine_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origine_notice` (
  `orinot_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `orinot_nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `orinot_pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FR',
  `orinot_diffusion` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`orinot_id`),
  KEY `orinot_nom` (`orinot_nom`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origine_notice`
--

LOCK TABLES `origine_notice` WRITE;
/*!40000 ALTER TABLE `origine_notice` DISABLE KEYS */;
INSERT INTO `origine_notice` VALUES (3,'Catalogage interne','FR',1),(2,'BnF','ES',1),(1,'Catalogación interna','ES',1),(4,'FR-751131015','FR',1);
/*!40000 ALTER TABLE `origine_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ouvertures`
--

DROP TABLE IF EXISTS `ouvertures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ouvertures` (
  `date_ouverture` date NOT NULL DEFAULT '0000-00-00',
  `ouvert` int(1) NOT NULL DEFAULT '1',
  `commentaire` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_location` int(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`date_ouverture`,`num_location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ouvertures`
--

LOCK TABLES `ouvertures` WRITE;
/*!40000 ALTER TABLE `ouvertures` DISABLE KEYS */;
/*!40000 ALTER TABLE `ouvertures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiements`
--

DROP TABLE IF EXISTS `paiements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paiements` (
  `id_paiement` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `commentaire` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_paiement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiements`
--

LOCK TABLES `paiements` WRITE;
/*!40000 ALTER TABLE `paiements` DISABLE KEYS */;
/*!40000 ALTER TABLE `paiements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param_subst`
--

DROP TABLE IF EXISTS `param_subst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_subst` (
  `subst_module_param` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subst_module_num` int(2) unsigned NOT NULL DEFAULT '0',
  `subst_type_param` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subst_sstype_param` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subst_valeur_param` text COLLATE utf8_unicode_ci NOT NULL,
  `subst_comment_param` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`subst_module_param`,`subst_module_num`,`subst_type_param`,`subst_sstype_param`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_subst`
--

LOCK TABLES `param_subst` WRITE;
/*!40000 ALTER TABLE `param_subst` DISABLE KEYS */;
/*!40000 ALTER TABLE `param_subst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametres`
--

DROP TABLE IF EXISTS `parametres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametres` (
  `id_param` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `type_param` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sstype_param` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valeur_param` text COLLATE utf8_unicode_ci,
  `comment_param` longtext COLLATE utf8_unicode_ci,
  `section_param` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gestion` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_param`),
  UNIQUE KEY `typ_sstyp` (`type_param`,`sstype_param`)
) ENGINE=MyISAM AUTO_INCREMENT=1303 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametres`
--

LOCK TABLES `parametres` WRITE;
/*!40000 ALTER TABLE `parametres` DISABLE KEYS */;
INSERT INTO `parametres` VALUES (782,'pmb','bdd_version','v5.19','Versión de última de la base de datos, no cambiar excepto por una vesrión si un parámetro no se ha actualizado bien y volver a realizar la actualización. En general, contacta antes con la lista de correo pmb.user@sigb.net','',0),(783,'z3950','accessible','1','¿ Z3950 accesible ?\r\n 0 : no, menu inaccesible\r\n 1 : Sí, la librería PHP_YAZ está activada, la búsqueda z3950 es posible','',0),(784,'pmb','nb_lastautorities','10','Número de las últimas autoridades a mostrar en la gestión de autoridades','',0),(785,'pdflettreretard','1before_list','Salvo error de nuestra parte, aún estás en posesión del o los documento(s) siguiente(s) cuyo préstamo ya ha finalizado :','Texto que aparecerá antes de la lista de documentos retrasados en la carta de reclamación','',0),(786,'pdflettreretard','1after_list','Te agradeceríamos que te pusieras en contacto con nosotros por teléfono al $biblio_phone o por correo electrónico al $biblio_email para mirar la posibilidad de renovar estos préstamos o de devolver los documentos.','Texto que aparece después de la lista de documentos retrasados en la carta','',0),(787,'pdflettreretard','1fdp','El responsable.','Signatario de la carta.','',0),(788,'pdflettreretard','1madame_monsieur','Estimado usuario/usuaria,','Encabezamiento de la carta','',0),(789,'pdflettreretard','1nb_par_page','7','Número de documentos con retraso impresos en las páginas siguientes.','',0),(790,'pdflettreretard','1nb_1ere_page','4','Número de obras en retraso impresos en la primera página','',0),(791,'pdflettreretard','1taille_bloc_expl','16','Tamaño de un bloque (2 líneas) entre las obras obras con retraso. El inicio de cada obra en retraso se espaciará con este valor en la página','',0),(792,'pdflettreretard','1debut_expl_1er_page','160','Inicio de la lista de los ejemplares en la primera página, en mm después del borde superior de la página. Debe estar regulado en función del texto que precede a la lista de las obras, la cual puede ser más o menos larga.','',0),(793,'pdflettreretard','1debut_expl_page','15','Inicio de la lista de los ejemplares en las páginas siguientes, en mm después del borde superior de la página.','',0),(794,'pdflettreretard','1limite_after_list','270','Posición máxima en la parte inferior de la página. Si un elemento impreso tiende a sobrepasar este límite, será impreso en la página siguiente.','',0),(795,'pdflettreretard','1marge_page_gauche','10','Márgen de la izquierda en mm','',0),(796,'pdflettreretard','1marge_page_droite','10','Márgen de la derecha en mm','',0),(797,'pdflettreretard','1largeur_page','210','Largo de la página en mm','',0),(798,'pdflettreretard','1hauteur_page','297','Alto de la página en mm','',0),(799,'pdflettreretard','1format_page','P','Formato de la página : \r\n P : Portrait = Horizontal\r\n L : Landscape = apaisado','',0),(800,'pdfcartelecteur','pos_h','20','Posición horizontal en mm a partir del borde izquierdo de la la página','',0),(801,'pdfcartelecteur','pos_v','20','Posición vertical en mm a partir del borde superior de la página','',0),(802,'pdfcartelecteur','biblio_name','$biblio_name','Nombre de la biblioteca o centro de recursos imprimido en el carné de usuario. Poner $biblio_name para retomar el nombre específicadi en la localización del ejemplar o bien poner otra cosa.','',0),(803,'pdfcartelecteur','largeur_nom','80','Largo acorde con la impresión del nombre del usuario en mm','',0),(804,'pdfcartelecteur','valabledu','Válido del','\'Válido del\' en \"VÁLIDO DEL  ##/##/#### al ##/##/####\"','',0),(805,'pdfcartelecteur','valableau','al','\'al\' en \"válido del ##/##/#### AL ##/##/####\"','',0),(806,'pdfcartelecteur','carteno','Núm. carné :','Texto que precede al número de carné','',0),(807,'sauvegarde','cle_crypt1','9b4a840d790eadc71b9064c9a843719b','','',0),(808,'sauvegarde','cle_crypt2','51580d4fd5f1ad2d981c91ddb04095ec','','',0),(809,'pmb','resa_dispo','1','¿ La reserva de documentos está disponible ?\r\n 0 : No\r\n 1 : Sí','',0),(810,'mailretard','1objet','$biblio_name : documentos no devueltos','Asunto del correo electrónico de reclamación por retraso','',0),(811,'mailretard','1before_list','Salvo error por nuestra parte, estás aún en posesión del o los siguiente(s) documento(s) el préstamos de los cuales ya ha pasado :','Texto que aparece en la lista de documentos en retraso del correo electrónico de retraso','',0),(812,'mailretard','1after_list','Te agradeceríamos que te pusieras en contacto con nosotros lo más pronto posible por teléfono al $biblio_phone o por correo electrónico al $biblio_email para estudiar la posibilidad de renovar los préstamos o de devolver los documentos.','Texto que aparecerá antes de la lista de documentos en retraso en el correo electrónico','',0),(813,'mailretard','1madame_monsieur','Estimado usuario, usuaria','Encabezamiento del correo','',0),(814,'mailretard','1fdp','El responsable.','Signatario del correo electrónico de retraso','',0),(815,'pmb','serial_link_article','0','¿ Incluir en los artículos el enlace a la revista de la cual proceden al catalogar las publicaiones periódicas ?\r\n 0 : No\r\n 1 : Sí','',0),(816,'pmb','num_carte_auto','1','Numéro de carte de lecteur automatique ?\n 0: Non (si utilisation de cartes pré-imprimées)\n 1: Oui, entièrement numérique\n 2,a,b,c: Oui, avec préfixe: a=longueur du préfixe, b=nombre de chiffres de la partie numérique, c=préfixe fixé (facultatif)\n 3,fonction: fonction de génération spécifique dans fichier nommé de la même façon, à placer dans pmb/circ/empr','',0),(817,'opac','modules_search_title','1','Búsqueda simple por título:\r\n 0 : No\r\n 1 : Sí\r\n 2 : autorizada y seleccionada por defecto','c_recherche',0),(818,'opac','modules_search_author','1','Búsqueda simple por autor:\r\n 0 : No\r\n 1 : Sí\r\n 2 : autorizada y seleccionada por defecto','c_recherche',0),(819,'opac','modules_search_publisher','1','Búsqueda simple por editorial:\r\n 0 : No\r\n 1 : Sí\r\n 2 : autorizada y validada por defecto','c_recherche',0),(820,'opac','modules_search_collection','0','Búsqueda simple por colección:\r\n 0 : No\r\n 1 : Sí\r\n 2 : autorizada y validada por defecto','c_recherche',0),(835,'opac','authors_aut_sort_records','index_serie, tnvol, index_sew','Modo de visualización de los autores : selección de registros','d_aff_recherche',0),(821,'opac','modules_search_subcollection','0','Búsqueda simple por subcolección:\r\n 0 : No\r\n 1 : Sí\r\n 2 : autorizada y validada por defecto','c_recherche',0),(822,'opac','modules_search_category','1','Búsqueda simple por categoría:\r\n 0 : No\r\n 1 : Sí\r\n 2 : autorizada y validada por defecto','c_recherche',0),(823,'opac','modules_search_keywords','1','Búsqueda simple por indexación libre (palabras clave):\r\n 0 : No\r\n 1 : Sí\r\n 2 : autorizada y validada por defecto','c_recherche',0),(824,'opac','modules_search_abstract','1','Búsqueda simple por el campo resumen:\r\n 0 : No\r\n 1 : Sí\r\n 2 : autorizada y validada por defecto','c_recherche',0),(825,'opac','modules_search_content','0','Búsqueda simple por las notas de contenido:\r\n 0 : No\r\n 1 : Sí\r\n 2 : autorizada y validada por defecto\r\nNO USADO DE MOMENTO','c_recherche',0),(826,'opac','categories_categ_path_sep','>','Separador para las categorías','i_categories',0),(827,'opac','categories_columns','3','Número de columnas del sumario general de las categorías','i_categories',0),(828,'opac','categories_categ_rec_per_page','6','Número de registros mostrados por página en la exploración de las categorías','i_categories',0),(829,'opac','categories_categ_sort_records','index_serie, tnvol, index_sew','Explorador de categorías : modo de selección de los registros :\r\n index_serie, tnvol, index_sew > por título de serie, número en la serie y índice de títulos\r\n rand() : aleatorio','i_categories',0),(830,'opac','search_results_first_level','4','Número de resultados mostrados en la primera página','z_unused',0),(831,'opac','search_results_per_page','10','Número de resultados mostrados en las páginas siguientes','d_aff_recherche',0),(1213,'demandes','init_workflow','1','Initialisation du workflow de la demande.\n 0 : Validation avant tout\n 1 : Validation avant tout et attribution au validateur\n 2 : Attribution avant tout','',0),(833,'opac','categories_sub_display','3','Número de subcategorías en la primera página','i_categories',0),(834,'opac','categories_sub_mode','libelle_categorie','Modo de visualización de las subcategorías : \r\n rand() > aleatorio\r\n libelle_categorie > orden alfabético','i_categories',0),(836,'opac','default_lang','es_ES','Lengua del opac : es_ES, fr_FR o en_US o ar','a_general',0),(837,'opac','show_categ_browser','0','Affichage des catégories en page d\'accueil OPAC:\n0: Non\n1: Oui\n1 3,1: Oui, avec thésaurus id 3 puis 1 (préciser les thésaurus à afficher et l\'ordre)','f_modules',0),(838,'opac','show_book_pics','1','Mostrar las imágines de los libros en la ficha del documento :\r\n 0 : No\r\n 1 : Sí','e_aff_notice',0),(839,'opac','resa','1','¿ Se puede reservar des del OPAC ? 1: Sí  ou 0: no','a_general',0),(840,'opac','resa_dispo','1','Se puede reservar un documento disponible por el OPAC \r\n 1: sí \r\n 0: no','a_general',0),(841,'opac','show_meteo','0','Mostrar el tiempo en el OPAC 1: sí o 0: no','f_modules',0),(842,'opac','duration_session_auth','1200','Duración de la sesción del usuario en el OPAC en segundos','a_general',0),(843,'pmb','relance_adhesion','31','Número de días antes de la expiración del carné para iniciar la renovación','',0),(844,'pmb','pret_adhesion_depassee','1','¿ Se puede prestar si el carné está caducado ? : 0 NO, 1 POSIBLE','',0),(845,'pdflettreadhesion','fdp','El responsable.','Fórmula de cortesía en la parte inferior de la página','',0),(846,'pdflettreadhesion','madame_monsieur','Estimado usuario/a,','Cortersía del destinatario','',0),(847,'pdflettreadhesion','texte','Tu abono finalizará el !!date_fin_adhesion!!. Te agradeceremos que pienses en renovarlo en tu próxima visita.\r\n\r\nAtentamente.\r\n\r\n\r\n','Frase de introducción de la finalización del abono','',0),(848,'pdflettreadhesion','marge_page_gauche','10','Márgen izquierdo de la página en mm','',0),(849,'pdflettreadhesion','marge_page_droite','10','Márgen derecho de la page en mm','',0),(850,'pdflettreadhesion','largeur_page','210','Largo de la página en mm','',0),(851,'pdflettreadhesion','hauteur_page','297','Alto de la página mm','',0),(852,'pdflettreadhesion','format_page','P','P para Vertical, L para apaisado (Horizontal)','',0),(853,'mailrelanceadhesion','objet','$biblio_name : tu abono','Asunto de la carta de renovación del carné. Utiliza biblio_name para retomar el nombre incluído en la localización de los ejemplares.','',0),(854,'mailrelanceadhesion','texte','Tu abono finalizará el próximo !!date_fin_adhesion!!. Te agradaceremos pienses en renovarlo en tu próxima visita.\r\n\r\nAtentamente,\r\n\r\n','Texto de la renovación, !!date_fin_adhesion!! será reemplazado por la fecha de final del abono del usuario','',0),(855,'mailrelanceadhesion','madame_monsieur','Estimado usuario/a,','Encabezamiento de la carta de renovación del abono','',0),(856,'mailrelanceadhesion','fdp','El responsable.','Fórmula de cortesía en la parte inferior de la página','',0),(857,'opac','show_marguerite_browser','1','0 o 1 : margarita de las categorías','f_modules',0),(858,'opac','show_100cases_browser','0','0 o 1 : visualización de las 100 categorías','f_modules',0),(859,'pmb','indexint_decimal','1','0 o 1 : la clasificación interna es decimal tipo Dewey','',0),(860,'opac','modules_search_indexint','1','Búsqueda simple por la clasificación:\r\n 0 : no\r\n 1 : sí\r\n 2 : autorizada y seleccionada por defecto','c_recherche',0),(862,'categories','show_empty_categ','1','¿ Mostrar las categorías que no contienen ningún registro? \r\n0=no, 1=sí','',0),(861,'empr','birthdate_optional','1','Año de nacimiento opcional : \r\n 0 > no: es obligatorio\r\n 1 sí','',0),(81,'thesaurus','categories_show_empty_categ','1','Affichage des catégories ne contenant aucune notice :\r\n0=non, 1=oui','categories',0),(82,'thesaurus','categories_term_search_n_per_page','50','Nombre de termes affichés par page lors d\'une recherche par terme dans les catégories','categories',0),(864,'opac','show_loginform','1','Mostrar la opción a los usuarios de conectarse en el OPAC \r\n 0 > no\r\n 1 sí','f_modules',0),(865,'opac','default_style','genbib','Estilo gráfico del OPAC, 1 estilo por defecto, nomargin : sin ver la columna de la izquierda','a_general',0),(866,'opac','show_exemplaires','1','¿ Mostrar los ejemplares en el OPAC ?\n 1 Sí,\n 0 : No','e_aff_notice',0),(867,'pmb','import_modele','func_bdp.inc.php','¿ Qué script de funciones de importación se usa para personalizar la importación ?','',0),(868,'pmb','quotas_avances','1','Opciones de préstamo avanzado ? \r\n 0 : No\r\n 1 : Sí','',0),(869,'opac','logo','logo_default.jpg','Nombre del archivo de la imagen del logo','z_unused',0),(870,'opac','logosmall','images/site/livre.png','Nombre del archivo con la imagen pequeña del logo','b_aff_general',0),(871,'opac','show_bandeaugauche','1','¿ Mostrar el menú lateral de la izquierda ? \n 0 : No\n 1 : Sí','f_modules',0),(872,'opac','show_liensbas','1','¿ Mostrar los enlaces(pmb, google, bibli) en la parte inferior de la página ? \n 0 : No\n 1 : Sí','f_modules',0),(873,'opac','show_homeontop','0','¿ Mostrar el enlace INICIO (volver al inicio) bajo el nombre de la biblioteca o del centro de recursos (necesario en caso de no haber el menú lateral izquierdo) ? \r\n 0 : No\r\n 1 : Sí','f_modules',0),(874,'pmb','resa_quota_pret_depasse','1','¿ Es posible la reserva si hay algún préstamo en retraso ? \n 0 : No\n 1 : Sí','',0),(875,'pmb','import_limit_read_file','100','Límite del tamaño de lectura de un archivo a importar, en general con 100 o 200 debe funcionar, si hay problemas de time out : bajar el tamaño, 50 por ejemplo.','',0),(876,'pmb','import_limit_record_load','100','Límite del tamaño de procesar registros al importar, en general 100 o 200 debe funcionar, si hay problemas de time out : bajar el tamñao, 50 por ejemplo.','',0),(877,'opac','biblio_preamble_p1','<img src=\"./styles/genbib/images/image1.jpg\" />\r\n<img src=\"./styles/genbib/images/image2.jpg\" />\r\n<img src=\"./styles/genbib/images/image3.jpg\" />','Párrafo 1 con información (por ejemplo, descripción del fondo)','b_aff_general',0),(878,'opac','biblio_preamble_p2','','Párrafo 2 de información: inicio usuarios. Ej:\r\n<ul id=\"menuDeroulant\">\r\n\r\n<li><a href=\"./index.php\">Accueil</a></li>\r\n<li><a href=\"./index.php?lvl=infopages&amp;pagesid=4\">Calendrier</a></li>\r\n<li><a href=\"./index.php?lvl=infopages&amp;pagesid=1\">Actualités BnF</a>\r\n<ul class=\"sousMenu\">\r\n<li><a href=\"./index.php?lvl=infopages&amp;pagesid=3\">Aide en ligne</a></li>\r\n<li><a href=\"./index.php?lvl=infopages&amp;pagesid=2\">Version 4.0 !</a></li>\r\n</ul>\r\n</li>\r\n\r\n<li><a href=\"./index.php?lvl=infopages&amp;pagesid=6\">Nous trouver</a></li>\r\n\r\n</ul>','b_aff_general',0),(879,'opac','biblio_quicksummary_p1','','Párrafo 1 de resumen, se muestra a través de la hoja de estilo, ver id quickSummary.p1','z_unused',0),(880,'opac','biblio_quicksummary_p2','','Párrafo 2 de resumen, se muestra a través de la hoja de estilo, ver id quickSummary.p2','z_unused',0),(881,'opac','show_dernieresnotices','0','¿ Mostrar las últimas noticias creadas en la parte inferior de la página ? \n 0 : No\n 1 : Sí','f_modules',0),(882,'opac','show_etageresaccueil','1','¿ Mostrar las estanterías virtuales en la parte inferior de la página de inicio ? \n 0 : No\n 1 : Sí','f_modules',0),(883,'opac','biblio_important_p1','<a href=\"index.php?lvl=index\"><img src=\"./images/bar_spacer.gif\" id=\"map_lien_retour\" alt=\"\" /></a> \r\n<a href=\"http://mestreacasa.gva.es/web/lliurex/inici\" id=\"puce\">Lliurex Net</a>\r\n<a href=\"http://wiki.lliurex.net/tiki-index.php?page=Inici\" id=\"puce\">Wiki LliureX</a>\r\n<a href=\"http://wiki.lliurex.net/tiki-index.php?page=OPAC_va\" id=\"puce\">Wiki OPAC</a>\r\n','Infos importantes 1, en la hoja de estilo, ver id important.p1. Ej:\r\n<a href=\"http://www.sigb.net\" id=\"puce\">Sigb.Net</a>\r\n<a href=\"http://www.sigb.net/wiki/\" id=\"puce\">WiKi PMB</a>\r\n<a href=\"http://fr.wikipedia.org\" id=\"puce\">WiKipedia</a>\r\n','b_aff_general',0),(884,'opac','biblio_important_p2','','Infos importantes, en la hoja de estilo, ver id important.p2','b_aff_general',0),(885,'opac','biblio_name','PMB OPAC','Nombre de la biblioteca o centro de recursos a mostrar en el opac','b_aff_general',0),(886,'opac','biblio_website','','Página web de la biblioteca o centro de recursos a mostrar en el opac. Ej: http://www.sigb.net','b_aff_general',0),(887,'opac','biblio_adr1','Conselleria d\'Educació, Investigació, Cultura i Esports','Dirección 1 de la biblioteca o centro de recursos a mostrar en el opac','b_aff_general',0),(888,'opac','biblio_town','VALÈNCIA','Población a mostrar en el opac','b_aff_general',0),(889,'opac','biblio_cp','46015','Código postal a mostrar en el opac','b_aff_general',0),(890,'opac','biblio_country','España','País a mostrar en el opac','b_aff_general',0),(891,'opac','biblio_phone','','Teléfono a mostrar en el opac','b_aff_general',0),(892,'opac','biblio_dep','72','Departamento en el opac para mostrar el tiempo','b_aff_general',0),(893,'opac','biblio_email','','Correo electrónico de contacto a mostrar en el opac. Ej: pmb@sigb.net','b_aff_general',0),(894,'opac','etagere_notices_order','index_serie, tnvol, index_sew','Órden de visualización de los registros en las estanterías en el opac \n  index_serie, tit1 : por título de serie y título \n rand()  : aleatorio','j_etagere',0),(895,'opac','etagere_notices_format','4','Formato de visualización de los registros en las estanterías en la pantalla de iniciol \r\n 1 : ISBD solamente \r\n 2 : Público solamente \r\n 4 : ISBD y Público \r\n 8 : Reducido (título+autores) solamente','j_etagere',0),(896,'opac','etagere_notices_depliables','1','Mostrar los registros ampliables en las estanterías de la página de inicio \r\n 0 : No \r\n 1 : Sí','j_etagere',0),(897,'opac','etagere_nbnotices_accueil','5','Número de registros mostrados en las categorías de la pantalla de inicio \r\n 0 : Todos \r\n -1 : Ninguno \r\n x : x registros mostrados como máximo','j_etagere',0),(898,'opac','nb_aut_rec_per_page','15','Número de regitros mostrados para una autoridad','d_aff_recherche',0),(899,'opac','notices_format','4','Format d\'affichage des notices en résultat de recherche\n 0 : Utiliser le paramètre notices_format_onglets\n 1 : ISBD seul\n 2 : Public seul \n4 : ISBD et Public\n 5 : ISBD et Public avec ISBD en premier \n8 : Réduit (titre+auteurs) seul\n 9 : Templates django (Spécifier le nom du répertoire dans le paramètre notices_format_django_directory)','e_aff_notice',0),(900,'opac','notices_depliable','1','Affichage dépliable des notices en résultat de recherche:\n0: Non dépliable\n1: Dépliable en cliquant que sur l\'icone\n2: Déplibable en cliquant sur toute la ligne du titre','e_aff_notice',0),(901,'opac','term_search_n_per_page','50','Número de términos mostrados por página en la búsqueda por término','c_recherche',0),(902,'opac','show_empty_categ','1','Al buscar por término, ¿ mostrar las categorías que no contienen ningún registro ?:\r\n 0 : No \r\n 1 : Sí','i_categories',0),(903,'opac','allow_extended_search','1','Se autoriza o no la búsqueda avanzanda en el opac \n 0 : No \n 1 : Sí','c_recherche',0),(904,'opac','allow_term_search','1','Se autoriza o no la búsqueda por términos en el opac\n 0 : No \n 1 : Sí','c_recherche',0),(905,'opac','term_search_height','350','Altura en píxels del marco de búsqueda por términos (si no se indica o está vacío : por defecto 200 píxels)','c_recherche',0),(906,'opac','categories_nb_col_subcat','3','Número de columnas de subcategorías al navegar en las categarorías \n 3 por defecto','i_categories',0),(907,'opac','max_resa','5','Número máximo de reservas sobre un documento \r\n 5 por defecto \r\n 0 para ilimitadas','a_general',0),(908,'pmb','show_help','1','Mostrar la ayuda contextual de PMB en la parte de gestión \r\n 1 Sí \r\n 0 No','',0),(909,'opac','show_help','1','Mostrar la ayuda en línea en el OPAC de PMB  \n 1 Sí \n 0 No','f_modules',0),(910,'opac','cart_allow','1','Cestas disponibles en el OPAC de PMB  \n 1 Sí \n 0 No','f_modules',0),(911,'opac','max_cart_items','200','Número máximo de registros en una cesta de administradores.','h_cart',0),(912,'opac','show_section_browser','1','¿ Mostrar los enlaces de localizaciones y secciones ?\n 0 : No\n 1 : Sí','f_modules',0),(913,'opac','nb_localisations_per_line','6','Número de localizaciones mostradas por línea en la página de inicio (si show_section_browser=1)','k_section',0),(914,'opac','nb_sections_per_line','6','Número de secciones mostradas por línea al visualizar la localización (si show_section_browser=1)','k_section',0),(915,'opac','cart_only_for_subscriber','1','Cestas de registros reservadas a los usuario o miembros de la biblioteca o el centro de recursos ?\r\n 1: Sí\r\n 0: No, autorizadas para todos los internauras','h_cart',0),(916,'opac','notice_reduit_format','0','Formato de visualización reducido de los registros :\r\n 0 normal = título+autores principales\r\n P 1,2,3: Perso. : tit+aut+campos persos id 1 2 3\r\n E 1,2,3: Perso. : tit+aut+edit+campos persos id 1 2 3 \r\n T : tit1+tit4','e_aff_notice',0),(917,'pdflettreresa','before_list','Debido a tu petición de reserva, te informamos que la o las obras aquí mencionadas están ya a tu disposición en la biblioteca.','Texto que aparece antes de la lista de obras reservadas en la carta de confirmación de reservas','',0),(918,'pdflettreresa','after_list','Pasado el período de reserva, las obras serán puestas otra vez en circulación, así que te recomendamos que vengas a buscarlas lo antes posible.','Texto que aparece después de las lista de obras','',0),(919,'pdflettreresa','fdp','El responsable.','Firma de la carta, usar $biblio_name para incluir el parámetro \"biblio name\" o bien introduce otra cosa.','',0),(920,'pdflettreresa','madame_monsieur','Estimado usuario/a,','Encabezamiento de la carta','',0),(921,'pdflettreresa','nb_par_page','7','Número de documento en retraso impresos en las páginas siguientes.','',0),(922,'pdflettreresa','nb_1ere_page','4','Número de documentos en retraso impresos en la primera página','',0),(923,'pdflettreresa','taille_bloc_expl','20','Tamaño de un bloque (2 líneas) de obras en reserva. El incio de cada obra reservada será espaciada con este valor en la página','',0),(924,'pdflettreresa','debut_expl_1er_page','160','Inicio de la lista de obras en la primera página, en mm a contar des del borde superior de la página. Debe estar regulado en función del texto que precede a la lista de obras, que puede ser más o menos largo.','',0),(925,'pdflettreresa','debut_expl_page','15','Inicio de la lista de obras en las páginas siguientes, en mm a contar des del borde superior de la página.','',0),(926,'pdflettreresa','limite_after_list','270','Posición límite en la parte inferior de la página. Si un elemento impreso sobrepasa este límite, se imprimirá en la página siguiente.','',0),(927,'pdflettreresa','marge_page_gauche','10','Márgen izquierdo en mm','',0),(928,'pdflettreresa','marge_page_droite','10','Márgen derecho en mm','',0),(929,'pdflettreresa','largeur_page','210','Ancho de la página en mm','',0),(930,'pdflettreresa','hauteur_page','297','Alto de la página en mm','',0),(931,'pdflettreresa','format_page','P','Formato de la página : \r\n P : Vertical\r\n L : Landscape = apaisado','',0),(932,'opac','categories_max_display','200','Para la página de incio, número máximo de categorías principales mostradas','i_categories',0),(933,'opac','search_other_function','','Función complementaria para las búsquedas en la página de inicio','c_recherche',0),(934,'opac','lien_bas_supplementaire','','Enlace suplementario en la parte inferior de la página de incio, a introducir completa : a href= lien /a .Ej:\r\n<a href=\"./index.php?lvl=infopages&amp;pagesid=7\">Mentions légales</a>','b_aff_general',0),(935,'z3950','import_modele','func_other.inc.php','¿Qué script de funciones de importación hay que usar para personalizar la importación en la integración z3950 ?','',0),(936,'ldap','server','chinon','Servidor LDAP, IP o host','',0),(937,'ldap','basedn','','Raíz del nombre de dominio LDAP','',0),(938,'ldap','port','389','Puerto del servidor LDAP','',0),(939,'ldap','filter','(&(objectclass=person)(gidnumber=GID))','Servidor LDAP, IP o host','',0),(940,'ldap','fields','uid,gecos,departmentnumber','Campos del servidor LDAP','',0),(941,'ldap','lang','es_ES','Llengua del servidor LDAP','',0),(942,'ldap','groups','','Grupos del servidor LDAP','',0),(943,'ldap','accessible','0','¿ LDAP acesible ?','',0),(944,'opac','categories_show_only_last','0','En la ficha de un registro : \n 0 mostrar todo \n 1 : mostrar únicamente la última hoja del árbol de categorías','i_categories',0),(164,'thesaurus','categories_show_only_last','0','Dans la fiche d\'une notice : \n 0 tout afficher \n 1 : afficher uniquement la dernière feuille de l\'arbre de la catégorie','categories',0),(946,'pmb','prefill_cote','custom_cote_02.inc.php','Script personalizado de construcción de la signatura del ejemplar','',0),(947,'ldap','proto','3','Versión del protocolo LDAP : 3 ó 2','',0),(948,'ldap','binddn','uid=UID,ou=People','Descripción de la conexión : construcción de la cadena binddn para enlazar la autentificación al servidor LDAP en el OPAC','',0),(949,'empr','corresp_import','','Tabla de correspondencias columnas/campos en la importación de usuarios a partir de un archivo ASCII','',0),(950,'pmb','type_audit','0','Gestión/visualización de las fechas de creación/modificación \n 0: Ninguna\n 1: Creación y última modificación\n 2: Creación y todas las fechas de modificación','',0),(951,'pmb','gestion_abonnement','0','¿ Usar la gestión de los abonos de los usuarios ? \n 0 : No\n 1 : Sí, gestión simple, \n 2 : Sí, gestión avanzada','',0),(952,'pmb','utiliser_calendrier','0','Utiliser le calendrier des jours d\'ouverture ?\n 0 : non\n 1 : oui, pour le calcul des dates de retour et des retards\n 2 : oui, pour le calcul des dates de retour uniquement','',0),(953,'pmb','gestion_financiere','0','¿ Usar el módulo de gestión financiera ? \n 0 : No\n 1 : Sí','',0),(954,'pmb','gestion_tarif_prets','0','¿ Usar la gestión de tarifas de préstamos ? \n 0 : No\n 1 : Sí, gestión simple, \n 2 : Sí, gestión avanzada','',0),(955,'pmb','gestion_amende','0','¿ Usar la gestión de las multas :\n 0 = No\n 1 = Gestión simple\n 2 = Gestión avanzada','',0),(956,'finance','amende_jour','0.15','Multa por día de retraso para todo tipo de documentos. Atención, el separador decimal es el punto, no la coma','',1),(957,'finance','delai_avant_amende','15','Plazo antes de cobrar la multa, en días','',1),(958,'finance','delai_recouvrement','7','Plazo entre la 3ª reclamación y la actualización de cobro oficial de la multa, en días','',1),(959,'finance','amende_maximum','0','Multa máxima, cualquiera que sea el retraso, la multa se limita a este importe. 0 para desactivar esta opción.','',1),(960,'pdflettreresa','priorite_email','1','Prioridad de las cartas de confirmación de reserva por mail después de la validación de una reserva :\n 0 : Carta sola\n 1 : Correo electrónico, en su defecto carta\n 2 : Mail Y carta\n 3 : Ninguna alerta','',0),(961,'pdflettreresa','priorite_email_manuel','1','Prioridades de las cartas de confirmación de reserva por mail luego de su impresión después de imprimir a partir del botón:\n 0 : Carta sola\n 1 : Correo electrónico, en su defecto carta\n 2 : Mail Y carta\n 3 : Ninguna alerta','',0),(962,'finance','blocage_abt','1','Bloqueo del préstamo si la cuent del abono tienes deudas\n 0 : sin bloqueo\n 1 : bloqueo con opción a forzar . : bloqueo inevitable.','',1),(963,'finance','blocage_pret','1','Bloqueo del préstamo si la cuenta de préstamos tienes deudas\n 0 : sin bloqueo \n 1 : bloqueo con opción a forzar . : bloqueo inevitable.','',1),(964,'finance','blocage_amende','1','Bloqueo del préstamo si la cuenta de multas tienes deudas\n 0 : sin bloqueo \n 1 : bloqueo con opción a forzar . : bloqueo inevitable.','',1),(965,'pmb','gestion_devise','&euro;','Divisa de la gestión financiera, la que se visualizará en código HTML','',0),(966,'opac','book_pics_url','http://images-eu.amazon.com/images/P/!!isbn!!.08.MZZZZZZZ.jpg','URL de las imágenes de los registros, en la dirección proporcionada, !!isbn!! se reemplazará por el código ISBN o EAN del registro sin ningún guión o punto. \r\n ejemplo : http://www.monsite/opac/images/vignettes/!!isbn!!.jpg','e_aff_notice',0),(967,'opac','lien_moteur_recherche','<a href=http://www.google.es target=_blank>Buscar en Google</a>','Enlace suplementario en la página de inicio, a introducir completo : a href= enlace','b_aff_general',0),(968,'pmb','pret_express_statut','2','Estado del registro al crear un ejemplar en préstamo rápido','',0),(969,'opac','notice_affichage_class','','Nombre de la clase para la personalización de la visualización de registros','e_aff_notice',0),(970,'pmb','confirm_retour','0','Al devolver documentos, ¿ el retorno debe confirmarse ? \n 0 : No, se pueden pasar los códigos de barras unos detrás de otros \n 1 : Sí, es necesario validar la devolución después de cada código de barras','',0),(971,'opac','show_meteo_url','<img src=\"http://perso0.free.fr/cgi-bin/meteo.pl?dep=72\" alt=\"\" border=\"0\" hspace=0>','URL del tiempo a mostrar','f_modules',0),(972,'pmb','limitation_dewey','5','Número máximo de caracteres en la Dewey (676) al importar : \r\n 0 ninguna limitación \r\n 3 : limitación de 000 a 999 \r\n 5 (ejemplo) limitación 000.0 \r\n -1 : no importar','',0),(973,'finance','delai_1_2','15','Plazo entre la 1ª y la 2ª reclamación','',1),(974,'finance','delai_2_3','15','Plazo entre la 2ª y la 3ª reclamación','',1),(975,'pmb','lecteurs_localises','0','¿ Usuarios localizados ? \n 0: No \n 1: Sí','',0),(976,'dsi','active','1','¿ D.S.I activada ? \n 0: No \n 1: Sí','',0),(977,'dsi','auto','1','¿ D.S.I automática activada ? \r\n 0: No \r\n 1: Sí','',0),(978,'dsi','insc_categ','0','¿ Subscripción automática a las cestas de la categoría del usuario al crearlo ? \n 0: No \n 1: Sí','',0),(979,'opac','allow_bannette_priv','1','Posibilidad para los usuarios de crear o modificar sus cestas privadas \r\n 0: No \r\n 1: Sí','l_dsi',0),(980,'opac','allow_resiliation','1','Posibilidad para los usuarios de cancelar su subscripción a las ccestas pro \r\n 0: No \r\n 1: Sí','l_dsi',0),(981,'opac','show_categ_bannette','1','Mostrar las cestas de la categorías del usuario y su disponibilidad para subscribirse \r\n 0: No \r\n 1: Sí','l_dsi',0),(982,'opac','url_base','./','URL del opac : normalmente poner la url públca del web http://mipagina/opac/ no olvidarse el / final','a_general',0),(983,'finance','relance_1','0.53','Coste por la primera carta de reclamación','',1),(984,'finance','relance_2','0.53','Coste por la segunda carta de reclamación','',1),(985,'finance','relance_3','2.50','Coste por la tercera carta de reclamación','',1),(986,'finance','statut_perdu','','Estado (de ejemplar) perdido para las obras no devueltas','',1),(987,'pdflettreretard','2after_list','Le agradeceríasmos se pusiera en contacto con nosotros por tele´fono al $biblio_phone o por correo electrónico a $biblio_email para estudiar la posibilidad de renovar estos préstamos o de devolver los documentos.','Texto que aparece después de la lista de documentos en retraso en la carta de reclamación','',0),(988,'pdflettreretard','2before_list','Salvo error por nuestra parte, usted aún tiene el o los siguientes libros, la duración de los préstamos ya ha finalizado :','Texto que aparece antes de la lista de documentos en retraso en la carta de reclamación','',0),(989,'pdflettreretard','2debut_expl_1er_page','160','Inicio de la lista de ejemplares en la primera página, en mm a partir del márgen superior de la página. Debe estar regulado en función del texto que precede a la lista de obras, que puede ser más o menos largo.','',0),(990,'pdflettreretard','2debut_expl_page','15','Inicio de la lista de los ejemplares en las página siguiente, en mm a partir del márgen superior de la página.','',0),(991,'pdflettreretard','2fdp','El responsable.','Firma de la carta.','',0),(992,'pdflettreretard','2format_page','P','Formato de la página : \r\n P : Vertical\r\n L : Horizontal','',0),(993,'pdflettreretard','2hauteur_page','297','Alto de la página en mm','',0),(994,'pdflettreretard','2largeur_page','210','Largo de la página en mm','',0),(995,'pdflettreretard','2limite_after_list','270','Posición límite en la parte inferior de la página. Si un elemento impreso tiende a pasar este límite, se imprimirá en la página siguiente.','',0),(996,'pdflettreretard','2madame_monsieur','Estimado/a usuario/a,','Encabezamiento de la carta','',0),(997,'pdflettreretard','2marge_page_droite','10','Márgen derecho en mm','',0),(998,'pdflettreretard','2marge_page_gauche','10','Márgen izquierdo en mm','',0),(999,'pdflettreretard','2nb_1ere_page','4','Número de obras en retraso impresas en la primera página','',0),(1000,'pdflettreretard','2nb_par_page','7','Número de obras en retraso impresas en las página siguiente.','',0),(1001,'pdflettreretard','2taille_bloc_expl','16','Tamaño de bloque (2 líneas) de obra en retraso. El inicio de cada obra en retraso será espaciado este valor','',0),(1002,'pdflettreretard','3after_list','Le agradeceríamos que se pusiera rápidamente en contacto con nosotros por teléfono al $biblio_phone o por correo electrónico al $biblio_email para estudiar la posibilidad de renovar estos préstamos o de devolver los documentos.','Texto que aparece después de la lista de obras en retraso en la carta de reclamación','',0),(1003,'pdflettreretard','3before_list','\'Salvo error por nuestra parte, usted aún tiene el o los siguientes libros, la duración de los préstamos ya ha finalizado :','Texto que aparece antes de la lista de documentos en retraso en la carta de reclamación','',0),(1004,'pdflettreretard','3debut_expl_1er_page','160','Inicio de la lista de ejemplares en la primera página, en mm a partir del márgen superior de la página. Debe estar regulado en función del texto que precede a la lista de obras, que puede ser más o menos largo.','',0),(1005,'pdflettreretard','3debut_expl_page','15','nicio de la lista de los ejemplares en las página siguiente, en mm a partir del márgen superior de la página.','',0),(1006,'pdflettreretard','3fdp','El responsable.','Firma de la carta.','',0),(1007,'pdflettreretard','3format_page','P','Formato de la página : \r\n P : Vertical\r\n L : Horizontal','',0),(1008,'pdflettreretard','3hauteur_page','297','Alto de la página en mm','',0),(1009,'pdflettreretard','3largeur_page','210','Largo de la página en mm','',0),(1010,'pdflettreretard','3limite_after_list','270','Posición límite en la parte inferior de la página. Si un elemento impreso tiende a pasar este límite, se imprimirá en la página siguiente.','',0),(1011,'pdflettreretard','3madame_monsieur','Estimado/a usuario/a,','Encabezamiento de la carta','',0),(1012,'pdflettreretard','3marge_page_droite','10','Márgen derecho en mm','',0),(1013,'pdflettreretard','3marge_page_gauche','10','Márgen izquierdo en mm','',0),(1014,'pdflettreretard','3nb_1ere_page','4','Número de obras en retraso impresas en la primera página','',0),(1015,'pdflettreretard','3nb_par_page','7','Número de obras en retraso impresas en las página siguiente.','',0),(1016,'pdflettreretard','3taille_bloc_expl','16','Tamaño de bloque (2 líneas) de obra en retraso. El inicio de cada obra en retraso será espaciado este valor','',0),(1017,'pdflettreretard','3before_recouvrement','De no obtener noticias suyas en los próximos 7 días, nos veremos en la obligación de delegar a las autoridades el cobro de las obras siguiente :','Texto anterior a la lista de obras reclamadas','',0),(1018,'opac','bannette_notices_order',' index_serie, tnvol, index_sew ','Órden de los registros en las cestas en el opac \n  index_serie, tnvol, index_sew : órdenadas por título de serie y por título\n rand()  : aletorio','l_dsi',0),(1019,'opac','bannette_notices_format','8','Formato de visualización de los registros en las cestas \n 1 : solo ISBD \n 2 : Público solo \n 4 : ISBD y Público \n 8 : Reducido (título+autores) solo','l_dsi',0),(1020,'opac','bannette_notices_depliables','1','Mostrar ampliación de los registros en las cestas \n 0 : No \n 1 : Sí','l_dsi',0),(1021,'opac','bannette_nb_liste','7','Número de registros por cesta en la lista de cestas \r\n 0 Todos \r\n N : maxi N\r\n -1 : ninguno','l_dsi',0),(1022,'opac','dsi_active','1','DSI, cestas accesibles des del OPAC ? \r\n 0 : No \r\n 1 : Sí','l_dsi',0),(1023,'mailretard','2after_list','Le agradeceríamos que se pusiera rápidamente en contacto con nosotros por teléfono al $biblio_phone o por correo electrónico al $biblio_email para estudiar la posibilidad de renovar estos préstamos o de devolver los documentos.','Texto que aparece después de la lista de obras en retraso en el mail de reclamación.','',0),(1024,'mailretard','2before_list','Salvo error por nuestra parte, usted aún tiene el o los siguientes libros, la duración de los préstamos ya ha finalizado :','Texto que aparece antes de la lista de documentos en retraso en el mail de reclamación','',0),(1025,'mailretard','2fdp','El responsable.','Firma del mail de reclamación','',0),(1026,'mailretard','2madame_monsieur','Estimado/a usuario/a,','Encabezamiento del mail','',0),(1027,'mailretard','2objet','$biblio_name : documentos en retraso','Asunto del mail de reclamación','',0),(1028,'mailretard','3after_list','Le agradeceríamos que se pusiera rápidamente en contacto con nosotros por teléfono al $biblio_phone o por correo electrónico al $biblio_email para estudiar la posibilidad de renovar estos préstamos o de devolver los documentos.','Texto que aparece después de la lista de obras en retraso en el mail de reclamación.','',0),(1029,'mailretard','3before_list','Salvo error por nuestra parte, usted aún tiene el o los siguientes libros, la duración de los préstamos ya ha finalizado :','Texto que aparece antes de la lista de documentos en retraso en el mail de reclamación','',0),(1030,'mailretard','3fdp','El responsable.','Firma del mail de reclamación','',0),(1031,'mailretard','3madame_monsieur','Estimado/a usuario/a,','Encabezamiento del mail','',0),(1032,'mailretard','3objet','$biblio_name : documentos en retraso','Asunto del mail de reclamación','',0),(1033,'mailretard','3before_recouvrement','De no obtener noticias suyas en los próximos 7 días, nos veremos en la obligación de delegar a las autoridades el cobro de las obras siguiente :','Texto anterior a la lista de obras reclamadas','',0),(1034,'mailretard','priorite_email','1','Prioridad de las cartas de reclamación :\n 0 : Carta solamente \n 1 : Mail, en su defecto carta \n 2 : Mail Y carta','',0),(1035,'pmb','import_modele_lecteur','','Modelo de importación de los usuarios','',0),(1036,'pmb','blocage_retard','0','Bloquear el préstamo con una duración igual al retraso ? 0=no, 1=sí','',0),(1037,'pmb','blocage_delai','7','Délai à partir duquel le retard est pris en compte pour le blocage','',0),(1038,'pmb','blocage_max','60','Número máximo de días a bloquear (0 = sin límite)','',0),(1039,'pmb','blocage_coef','1','Coeficiente de proporción de los días de retraso para bloquear','',0),(1040,'pmb','blocage_retard_force','1','1 = El préstamo puede forzarse cuando un usuario esté bloqueado, 2 = No se puede forzar','',0),(1041,'opac','etagere_order',' name ','Orden de las estanterías en la pantalla de inicio, \n name = por nombre\n name DESC = por nombre descendente','j_etagere',0),(1042,'pmb','book_pics_show','1','Ver las cubiertas de los libros en gestión\r\n 1: sí  \r\n 0: no','',0),(1043,'pmb','book_pics_url','http://images-eu.amazon.com/images/P/!!isbn!!.08.MZZZZZZZ.jpg','URL de las imágenes de los registros, en el camino introducido , !!isbn!! se reemplazará por el código ISBN o EAN del registro eliminando todos los guiones o puntos. \r\n ejemplo : http://www.mipagina/opac/imagenes/cubiertas/!!isbn!!.jpg','',0),(1044,'pmb','opac_url','./opac_css/','URL del OPAC visto des de la parte de gestión, por defecto ./opac_css/','',0),(1045,'opac','resa_popup','1','¿ Formulario de conexión en forma de popup ? :\n 0 : No\n 1 : Sí','a_general',0),(1046,'pmb','vignette_x','100','Largo de la imagen creada para un documento electrónico','',0),(1047,'pmb','vignette_y','100','Alto de la imagen creada para un documento electrónico','',0),(1048,'pmb','vignette_imagemagick','','Camino del ejecutable ImageMagick (/usr/bin/imagemagick por ejemplo)','',0),(1049,'opac','show_rss_browser','0','Ver las fuentes RSS del catálogo en la página de inicio 1: sí o 0: no','f_modules',0),(1050,'pmb','mail_methode','php','Método de envío de los mails : \n php : función mail() de php\n smtp,hote:port,auth,user,pass : en smtp, poner O o 1 para la autentificación...','',0),(1051,'opac','mail_methode','php','Método de envío de los mails en el opac : \n php : función mail() de php\n smtp,hote:port,auth,user,pass : en smtp, poner O o 1 para la autentificación...','a_general',0),(1052,'opac','search_show_typdoc','1','Mostrar opción por tipo de documento para las búsquedas en la página de inicio','c_recherche',0),(1053,'pmb','verif_on_line','0','En el menú Administración > Herramientas > Act Base : verificación de versiones más recientes de PMB en línea ? \r\n0 : no : si no estás conectado a internet\r\n 1 : Sí : si estás conectado a internet','',0),(1054,'opac','show_languages','1 va_ES,es_ES,fr_FR,it_IT,ca_ES,en_UK,nl_NL,oc_FR','Mostrar un menú desplegable de selección de lengua ? \r\n 0 : No \r\n 1 : Sí \r\nNo uses un espacio entre los códigos de lenguas, solamente una coma : fr_FR,it_IT,en_UK,nl_NL,oc_FR','a_general',0),(1055,'pmb','pdf_font','Helvetica','Fuente tipográfica para los campos variables en los pdf - Fuente Arial','',0),(1056,'pmb','pdf_fontfixed','Courier','Fuente tipográfica para los campos fijos en los pdf - Fuente Courier','',0),(1057,'z3950','debug','0','Vaciar (exportar archivo) de los registros encontrados en Z3950 \r\n 0: No \r\n 1: Sí','',0),(1058,'pmb','nb_lastnotices','10','Número de últimos registros a mostrar en Catálogo - Últimos registros','',0),(1059,'opac','show_dernieresnotices_nb','10','Número de últimos registros a mostrar en Catálogo - Últimos registros','f_modules',0),(1060,'pmb','recouvrement_auto','0','Por defecto passage en recouvrement proposé en gestion des relances si niveau=3 et devrait être en 4: \r\n 1: Oui, recouvrement proposé par défaut \r\n 0: Ne rien faire par défaut','',0),(1061,'pmb','keyword_sep',';','Separador de palabras clave en la zona de indexación libre, espacio o ; o , o ...','',0),(1062,'thesaurus','mode_pmb','0','Nivel de uso del tesauro.\n 0 : Un solo tesauro por defecto.\n 1 : Selección de tesauro posible.','',0),(1063,'thesaurus','defaut','1','Identificador del tesauro por defecto.','',0),(1064,'thesaurus','liste_trad','es_ES','Lista de idiomas mostrados en los tesauros.\n(ex : es_ES,en_UK,...,ar)','',0),(1065,'opac','thesaurus','0','Nivel de uso de los tesauro.\n 0 : Un solo tesauro por defecto.\n 1 : Selección de tesuaro posible.','a_general',0),(1066,'acquisition','active','0','Módulo de adquisiciones activado.\n 0 : No.\n 1 : Sí.','',0),(1067,'acquisition','gestion_tva','0','Gestión del IVA.\n 0 : No.\n 1 : Sí.','',0),(1068,'acquisition','poids_sugg','U=1.00,E=0.70,V=0.00','Valoración de las sugerencias por defecto en porcentaje.\r\n B=Personal centro, U=Usuarios, V=Visitantes.\r\n ex : U=1.00,E=0.70,V=0.00 \r\n','',0),(1069,'acquisition','format','8,CA,DD,BL,FA','Tamaño del Número y Prefijos de las actas de compras.\nex : 8,CA,DD,BL,FA \n8 = Prefijo + 8 cifras\nCA=Pedido Compra, DD=Petición de presupuesto,BL=Albarán de entrega, FA=Factura de compra \n','',0),(1070,'acquisition','budget','0','Uso de un presupuesto para los pedidos.\n 0:opcional\n 1:obligatorio','',0),(1071,'acquisition','pdfcde_format_page','210x297','Anchura x Altura de la página en mm','pdfcde',0),(1072,'acquisition','pdfcde_orient_page','P','Orientación de la página: P=Retrato, L=Apaisado','pdfcde',0),(1073,'acquisition','pdfcde_marges_page','10,20,10,10','Márgenes de la página en mm : Superior,Inferior,Derecha,Izquierda','pdfcde',0),(1074,'acquisition','pdfcde_pos_logo','10,10,20,20','Posición del logo: Distancia con relación al borde izquierdo de la página,Distancia con relación a la largada de la página,Ancho, Alto','pdfcde',0),(1075,'acquisition','pdfcde_pos_raison','35,10,100,10,16','Posición Razón social: Distancia con relación al borde izquierdo de la página,Distancia con relación a la largada de la página,Largo,Alto,Tamaño fuente','pdfcde',0),(1076,'acquisition','pdfcde_pos_date','150,10,0,6,8','Posición Fecha: Distancia con relación al márgen superior izquierdo de la página,Distancia con relación al borde superior de la página,Ancho, Alto,Tamaño de la fuente','pdfcde',0),(1077,'acquisition','pdfcde_pos_adr_fac','10,35,60,5,10','Posición Dirección de facturación: Distancia con relación al márgen superior izquierdo de la página,Distancia con relación al márgen superior de la página,Ancho, Alto,Tamaño de la fuente','pdfcde',0),(1078,'acquisition','pdfcde_pos_adr_liv','10,75,60,5,10','Posición Dirección de entrega: Distancia con relación al márgen superior izquierdo de la página,Distancia con relación al márger superior de la página,Ancho, Alto,Tamaño de la fuente','pdfcde',0),(1079,'acquisition','pdfcde_pos_adr_fou','100,55,100,6,14','Posición Dirección proveedor: Distancia con relación al márgen superior izquierdo de la página,Distancia con relación al márger superior de la página,Ancho, Alto,Tamaño de la fuente','pdfcde',0),(1080,'acquisition','pdfcde_pos_num','10,110,0,10,16','Posición número de pedido: Distancia con relación al márgen superior izquierdo de la página,Distancia con relación al márger superior de la página,Ancho, Alto,Tamaño de la fuente','pdfcde',0),(1081,'acquisition','pdfcde_text_size','10','Tamaño de la fuente del texto','pdfcde',0),(1082,'acquisition','pdfcde_text_before','','Texto anterior del pedido','pdfcde',0),(1083,'acquisition','pdfcde_text_after','','Texto posterior al pedido ','pdfcde',0),(1084,'acquisition','pdfcde_tab_cde','5,10','Lista de pedidos: Ancho línea,Tamaño fuente','pdfcde',0),(1085,'acquisition','pdfcde_pos_tot','10,40,5,10','Posición total del pedido: Distancia con relación al márgen izquierdo de la página, Anchura, Altura línea,Tamaño fuente','pdfcde',0),(1086,'acquisition','pdfcde_pos_footer','15,8','Posición bajo de la página: Distancia con relación al borde inferior de la página, Tamaño de la fuente','pdfcde',0),(1087,'acquisition','pdfcde_pos_sign','10,60,5,10','Posición firma: Distancia con relación al borde izquierdo de la página, Anchura, Altura línea, Tamaño fuente','pdfcde',0),(1088,'acquisition','pdfcde_text_sign','El responsable de la biblioteca.','Texto firma','pdfcde',0),(1089,'acquisition','pdfdev_format_page','210x297','Ancho x Alto de la página en mm','pdfdev',0),(1090,'acquisition','pdfdev_orient_page','P','Orientación de la página: P=Vertical, L=Apaisado','pdfdev',0),(1091,'acquisition','pdfdev_marges_page','10,20,10,10','Márgenes de la página en mm : Arriba,Abajo,Derecha,Izquierda','pdfdev',0),(1092,'acquisition','pdfdev_pos_logo','10,10,20,20','Posición del logo: Distancia con relación al borde izquierdo de la página,Distancia con relación al borde de arriba de la página,Ancho,Alto','pdfdev',0),(1093,'acquisition','pdfdev_pos_raison','35,10,100,10,16','Posición Razón social: Distancia con relación al borde izquierdo de la página,Distancia con relación al borde de arriba de la página,Ancho,Alto,Tamaño de la fuente','pdfdev',0),(1094,'acquisition','pdfdev_pos_date','150,10,0,6,8','Posición Fecha: Distancia con relación al borde izquierdo de la página,Distancia con relación al borde de arriba de la página,Ancho,Alto,Tamaño de la fuente','pdfdev',0),(1095,'acquisition','pdfdev_pos_adr_fac','10,35,60,5,10','Posición Dirección de facturación: Distancia con relación al borde izquierdo de la página,Distancia con relación al borde de arriba de la página,Ancho,Alto,Tamaño de la fuente','pdfdev',0),(1096,'acquisition','pdfdev_pos_adr_liv','10,75,60,5,10','Posición Dirección de entrega: Distancia con relación al borde izquierdo de la página,Distancia con relación al borde de arriba de la página,Ancho,Alto,Tamaño de la fuente','pdfdev',0),(1097,'acquisition','pdfdev_pos_adr_fou','100,55,100,6,14','Posición Dirección distribuidor: Distancia con relación al borde izquierdo de la página,Distancia con relación al borde de arriba de la página,Ancho,Alto,Tamaño de la fuente','pdfdev',0),(1098,'acquisition','pdfdev_pos_num','10,110,0,10,16','Posición número de pedido: Distancia con relación al borde izquierdo de la página,Distancia con relación al borde de arriba de la página,Ancho,Alto,Tamaño de la fuente','pdfdev',0),(1099,'acquisition','pdfdev_text_size','10','Tamaño de la fuente del texto','pdfdev',0),(1100,'acquisition','pdfdev_text_before','','Texto anterior a la lista de pedidos','pdfdev',0),(569,'pmb','latest_order','notice_id desc','Tri des dernières notices ? \n notice_id desc : par id de notice décroissant: idéal mais peut être problématique après une migration ou un import \n create_date desc: par la colonne date de création.','',0),(1102,'acquisition','pdfdev_text_after','','Texto después de la lista de pedidos','pdfdev',0),(1103,'acquisition','pdfdev_tab_dev','5,10','Lista de pedidos: Alto línea,Tamaño de la fuente','pdfdev',0),(1104,'acquisition','pdfdev_pos_footer','15,8','Posición inferior de la página: Distancia con relación al borde inferior de la página, Tamaño de la fuente','pdfdev',0),(1105,'acquisition','pdfdev_pos_sign','10,60,5,10','Posición firma: Distancia con relación al borde izquierdo de la página, Ancho,Alto,Tamaño de la fuente','pdfdev',0),(1106,'acquisition','pdfdev_text_sign','El responsable de la biblioteca.','Texto firma','pdfdev',0),(1107,'opac','export_allow','1','Exportación de registros a partir del opac : \n 0 : prohibido \n 1 : para todos \n 2 : para los usuarios registrados únicamente','a_general',0),(1108,'opac','resa_planning','0','Usar un planning de reserva ? \n 0: No \n 1: Sí','a_general',0),(1109,'opac','resa_contact','','Código HTML de información sobre la persona a contactar por ejemplo en caso de problemas de reserva. ej: <a href=\'mailto:pmb@sigb.net\'>pmb@sigb.net</a>','a_general',0),(1110,'opac','default_operator','0','Operador por defecto. 0 : OR, 1 : AND.','c_recherche',0),(1111,'opac','modules_search_all','2','Búsqueda simple en el conjunto de campos :0 : no,  1 : autorizada,  2 : autorizada y validada por defecto','c_recherche',0),(1112,'acquisition','pdfliv_format_page','210x297','Alto x Ancho de la página en mm','pdfliv',0),(1113,'acquisition','pdfliv_orient_page','P','Orientación de la página: P=Retrato, L=Apaisado','pdfliv',0),(1114,'acquisition','pdfliv_marges_page','10,20,10,10','Márgenes de la página en mm : Alto, Bajo, Derecho, Izquierdo','pdfliv',0),(1115,'acquisition','pdfliv_pos_raison','10,10,100,10,16','Posición Razón social: Distancia con relación al borde izquierdo de la página,Distancia con relación a la parte de arriba de la página,Ancho, Alto,Tamaño de la fuente','pdfliv',0),(1116,'acquisition','pdfliv_pos_adr_liv','10,20,60,5,10','Position Adresse de livraison: Distancia con relación al borde izquierdo de la página,Distancia con relación a la parte de arriba de la página,Ancho, Alto,Tamaño de la fuente','pdfliv',0),(1117,'acquisition','pdfliv_pos_adr_fou','110,20,100,5,10','Position éléments fournisseur: Distancia con relación al borde izquierdo de la página,Distancia con relación a la parte de arriba de la página,Ancho, Alto,Tamaño de la fuente','pdfliv',0),(1118,'acquisition','pdfliv_pos_num','10,60,0,6,14','Position numéro Commande/Livraison: Distancia con relación al borde izquierdo de la página,Distancia con relación a la parte de arriba de la página,Ancho, Alto,Tamaño de la fuente','pdfliv',0),(1119,'acquisition','pdfliv_tab_liv','5,10','Lista de entregas: Alto línea,Tamaño fuente','pdfliv',0),(1120,'acquisition','pdfliv_pos_footer','15,8','Posición inferior de la página: Distancia con relación a la parte inferior de la página, Tamaño fuente','pdfliv',0),(1121,'pmb','default_operator','0','Operador por defecto. \n 0 : OR, \n 1 : AND.','',0),(1122,'mailretard','priorite_email_3','0','Hacer el tercer nivel de reclamación por correo electrónico :\n 0 : No, carta \n 1 : Sí, por mail','',0),(1123,'opac','show_suggest','0','Proponer hacer sugerencias en el OPAC.\n 0 : No.\n 1 : Sí, con autenticación.\n 2 : Sí, sin autenticación.','f_modules',0),(1124,'acquisition','email_sugg','0','Información por mail de la evolución de las sugerencias.\n 0 : No\n 1 : Sí','',0),(1125,'acquisition','pdfliv_text_size','10','Tamaño de la fuente del texto','pdfliv',0),(1126,'acquisition','pdfliv_pos_date','170,10,0,6,8','Posición Fecha: Distancia con relación al borde izquierdo de la página,Distancia con relación a la altura de la página,Ancho, Alto, Tamaño de la fuente','pdfliv',0),(1127,'acquisition','pdffac_text_size','10','Tamaño de la fuente','pdffac',0),(1128,'acquisition','pdffac_format_page','210x297','Ancho x Alto de la página en mm','pdffac',0),(1129,'acquisition','pdffac_orient_page','P','Orientación de la página: P=Retrato, L=Apaisado','pdffac',0),(1130,'acquisition','pdffac_marges_page','10,20,10,10','Márgenes de la página en mm : Alto, Bajo, Derecha, Izquierda','pdffac',0),(1131,'acquisition','pdffac_pos_raison','10,10,100,10,16','Posición Razón social: Distancia con relación al márgen izquierdo de la página,Distancia con relación a la altura de la página,Ancho,Alto,Tamaño de la fuente','pdffac',0),(1132,'acquisition','pdffac_pos_date','170,10,0,6,8','Posición Fecha: Distancia con relación al márgen izquierdo de la página,Distancia con relación a la altura de la página,Ancho,Alto,Tamaño de la fuente','pdffac',0),(1133,'acquisition','pdffac_pos_adr_fac','10,20,60,5,10','Posición Dirección de facturación: Distancia con relación al márgen izquierdo de la página,Distancia con relación a la altura de la página,Ancho,Alto,Tamaño de la fuente','pdffac',0),(1134,'acquisition','pdffac_pos_adr_fou','110,20,100,5,10','Posición elementos distribuidor: Distancia con relación al márgen izquierdo de la página,Distancia con relación a la altura de la página,Ancho,Alto,Tamaño de la fuente','pdffac',0),(1135,'acquisition','pdffac_pos_num','10,60,0,6,14','Posición número Pedido/Factura: Distancia con relación al márgen izquierdo de la página,Distancia con relación a la altura de la página,Ancho,Alto,Tamaño de la fuente','pdffac',0),(1136,'acquisition','pdffac_tab_fac','5,10','Lista de facturación: Alto línea,Tamaño fuente','pdffac',0),(1137,'acquisition','pdffac_pos_tot','10,40,5,10','Posición total de pedido: Distancia con relación al márgen izquierdo de la página, Ancho,Alto,Tamaño de la fuente','pdffac',0),(1138,'acquisition','pdffac_pos_footer','15,8','Posición abajo de la página: Distancia con relación a la parte inferior de la página, Tamaño de la fuente','pdffac',0),(1139,'acquisition','pdfsug_text_size','8','Tamaño de la fuente texto','pdfsug',0),(1140,'acquisition','pdfsug_format_page','210x297','Ancho x Alto de la página en mm','pdfsug',0),(1141,'acquisition','pdfsug_orient_page','P','Orientación de la página: P=Retrato, L=Apaisado','pdfsug',0),(1142,'acquisition','pdfsug_marges_page','10,20,10,10','Márgenes de la página en mm : Alto,Bajo,Derecha,Izquierda','pdfsug',0),(1143,'acquisition','pdfsug_pos_titre','10,10,100,10,16','Posición título: Distancia con relación al márgen izquierdo de la página,Distancia con relación a la altura de la página,Ancho,Alto,Tamaño de la fuente','pdfsug',0),(1144,'acquisition','pdfsug_pos_date','170,10,0,6,8','Posición fecha: Distancia con relación al márgen izquierdo de la página,Distancia con relación a la altura de la página,Ancho,Alto,Tamaño de la fuente','pdfsug',0),(1145,'acquisition','pdfsug_tab_sug','5,10','Lista de sugerencias: Alto línea,Tamaño fuente','pdfsug',0),(1146,'acquisition','pdfsug_pos_footer','15,8','Posición inferior de la página ion bas de page: Distancia con relación a la parte inferior de la página, Tamaño de la fuente','pdfsug',0),(1147,'acquisition','mel_rej_obj','Sugerencia de compra no aceptada','Asunto del correo de sugerencia no aceptada','mel',0),(1148,'acquisition','mel_rej_cor','Tu sugerencia de !!date!! no ha sido aceptada.\n\n','Corps du mail de rejet de suggestion','mel',0),(1149,'acquisition','mel_con_obj','Sugerencia aceptada','Asunto del correo electrónico de confirmación sugerencia aceptada','mel',0),(1150,'acquisition','mel_con_cor','Tu sugerencia de !!date!! ha sido guardada para comprarla próximamente.\n\n','Cuerpo del mensaje de confirmación de sugerencia aceptada','mel',0),(1151,'acquisition','mel_aba_obj','Sugerencia no posible','Asunto del correo electrónico de sugerencia no posible','mel',0),(1152,'acquisition','mel_aba_cor','Tu sugerencia de !!date!! no ha podido encontrarse o no está disponible a la venta.\n\n','Cuerpo del mensaje de sugerencia no psoible','mel',0),(1153,'acquisition','mel_cde_obj','Sugerencia pedida','Asunto del correo electrónico de sugerencia pedida','mel',0),(1154,'acquisition','mel_cde_cor','Tu sugerencia de !!date!! ha sido pedida.\n\n','Cuerpo del mensaje de sugerencia pedida','mel',0),(1155,'acquisition','mel_rec_obj','Sugerencia en la biblioteca','Cuerpo del mensaje de correo electrónico de sugerencia en la biblioteca','mel',0),(1156,'acquisition','mel_rec_cor','Tu sugerencia de !!date!! ha llegado a la biblioteca y pronto estará disponible.\n\n','Cuerpo del mensaje de correo de llegada de sugerencia','mel',0),(1157,'opac','allow_tags_search','0','Búsqueda por etiquetas (palabras clave usuarios) \n 1 = sí \n 0 = no','c_recherche',0),(1158,'opac','allow_add_tag','0','Permitir a los usuarios añadir una etiqueta a un registro.\n 0 : no\n 1 : sí\n 2 : identificación obligatoria para añadir','a_general',0),(1159,'opac','avis_allow','0','Permitir consultar/añadir un comentario en los registros \n 0 : no \n 1 : sin estar identificado : consulta posible, sin añadir \n 2 : identificación obligatoria para consultar y añdir','a_general',0),(1161,'categories','categ_in_line','0','Mostrar categorías en línea.\n 0 : No.\n 1 : Sí.','',0),(1160,'opac','avis_nb_max','30','Número máximo de comentarios conservados por registro. Los más viejos són eliminados en favor de más recientes cuando se llegue a ese número.','a_general',0),(380,'pmb','show_rtl','0','Affichage possible de droite a gauche \r\n 0 non \r\n 1 oui','',0),(381,'opac','avis_show_writer','0','Afficher le rédacteur de l\'avis \n 0 : non \n 1 : Prénom NOM \n 2 : login OPAC uniquement','a_general',0),(382,'pmb','form_editables','1','Grilles de notices éditables \r\n 0 non \r\n 1 oui','',0),(383,'acquisition','sugg_to_cde','0','Transfert des suggestions en commande.\n 0 : Non.\n 1 : Oui.','',0),(384,'thesaurus','categories_categ_in_line','0','Affichage des catégories en ligne.\n 0 : Non.\n 1 : Oui.','categories',0),(1162,'opac','categories_categ_in_line','0','Mostrar categorías en línea.\r\n 0 : No.\r\n 1 : Sí.','i_categories',0),(386,'pmb','label_construct_script','','Script de construction d\'étiquette de cote','',0),(387,'dsi','func_after_diff','','Script à exécuter après diffusion d\'une bannette','',0),(388,'opac','notice_groupe_fonction','','Quel fichier/fonction inclure pour la présentation des resultats si toutes les notices d\'une recherche sont parmi les types mentionnés \n exemple : a,b text;c,d music;k photo fera include(text.inc.php) et appel à la fonction text()','d_aff_recherche',0),(389,'opac','photo_mean_size_x','','Taille X de la photo format \'moyen\', si vide, pas de redimensionnement','m_photo',0),(390,'opac','photo_mean_size_y','','Taille Y de la photo format \'moyen\', si vide, pas de redimensionnement','m_photo',0),(391,'opac','photo_watermark','','Watermark à ajouter sur les photos, si vide, pas de watermark','m_photo',0),(392,'opac','photo_show_form','','Afficher le formulaire de commande de photo ? \n 0: Non \n 1:Oui','m_photo',0),(393,'opac','photo_email_form','','Emails des destinataires des commandes de photo à séparer par des espaces si multiples.','m_photo',0),(394,'opac','photo_watermark_transparency','50','Transparence du watermark de 0 à 100 en %','m_photo',0),(395,'opac','show_onglet_empr','0','Afficher l\'onglet de compte emprunteur avec les onglets de recherche ? \n 0: Non \n 1: Oui \n 2: n\'afficher l\'onglet empr que lorsque l\'utilisateur est authentifié (et dans ce cas le clic sur l\'onglet mène vers empr.php)','f_modules',0),(396,'pmb','url_base','http://SERVER/DIRECTORY/','URL de base de la gestion : typiquement mettre l\'url http://monserveur/pmb/ ne pas oublier le / final','',0),(397,'opac','show_empr','0','Afficher l\'emprunteur actuel dans la liste des exemplaires ?\n 0 : non\n 1 : pour les abonnés\n 2 : pour tout le monde','a_general',0),(398,'opac','show_login_form_next','','Après connexion de l\'emprunteur se diriger vers quel module ? \n Vide = Compte emprunteur \n index.php = Retour en accueil','f_modules',0),(399,'opac','allow_term_troncat_search','0','Troncature automatique à droite \n 1 = oui \n 0 = non','c_recherche',0),(400,'opac','show_results_first_page','1','Affichage de résultats sur la première page lors d\'une recherche pour tous les champs \r\n 0=non \r\n 1=oui.','d_aff_recherche',0),(401,'opac','nb_results_first_page','10','Nombres de notices à afficher lors d\'une recherche pour le critère Tous les champs.','d_aff_recherche',0),(402,'opac','show_infobulles_categ','0','Affichage des infobulles sur les libellés des catégories. \n 0=non \n 1=oui','i_categories',0),(403,'acquisition','sugg_display','','Nom de la fonction personnalisée d\'affichage des suggestions','',0),(404,'acquisition','sugg_categ','0','Affectation des suggestions à une catégorie de suggestions.\n 0 : Non\n 1 : Oui','',0),(405,'acquisition','sugg_categ_default','1','Identifiant de la catégorie de suggestions par défaut.','',0),(406,'opac','sugg_categ','0','Affectation des suggestions à une catégorie de suggestions.\n 0 : Non.\n 1 : Oui.','a_general',0),(407,'opac','sugg_categ_default','1','Identifiant de la catégorie de suggestions par défaut.','a_general',0),(408,'acquisition','pdfsug_print','','Quel script utiliser pour personnaliser l\'impression des listes de suggestions ?','pdfsug',0),(409,'acquisition','pdfdev_print','','Quel script utiliser pour personnaliser l\'impression des devis ?','pdfdev',0),(410,'acquisition','pdfcde_print','','Quel script utiliser pour personnaliser l\'impression des commandes ?','pdfcde',0),(411,'acquisition','pdfliv_print','','Quel script utiliser pour personnaliser l\'impression des bons de livraison ?','pdfliv',0),(412,'acquisition','pdffac_print','','Quel script utiliser pour personnaliser l\'impression des factures ?','pdffac',0),(413,'pmb','notice_reduit_format','0','Format d\'affichage des réduits de notices :\n 0 = titre+auteur principal\n 1 = titre+auteur principal+date édition\n 2 = titre+auteur principal+date édition + ISBN\n 3 = titre seul\n P 1,2,3 = tit+aut+champs persos id 1 2 3\n E 1,2,3 = tit+aut+édit+champs persos id 1 2 3\n T = tit1+tit4\n 4 = titre+titre parallèle+auteur principal\n H 1 = id d\'un template de notice','',0),(414,'pmb','resa_planning','0','Utiliser un planning de réservation ? \n 0: Non \n 1: Oui','',0),(415,'pmb','antivol','0','Système magnétique antivol à télécommander ? \n 1 Oui \n 0 Non','',0),(416,'acquisition','custom_calc_numero','','Fonction personnalisée de numérotation des actes d\'achats.','',0),(417,'pmb','numero_exemplaire_auto','0','Autorise la numérotation automatique d\'exemplaire ? \n 0 : non\n 1 : Oui, pour monographies et bulletins\n 2 : Oui, pour monographies seules\n 3 : Oui, pour bulletins seuls','',0),(418,'pmb','numero_exemplaire_auto_script','gen_code/gen_code_exemplaire.php','Nom du fichier de Script php pour la génération des codes d\'exemplaires en automatique','',0),(419,'empr','lecteur_controle_doublons','0','Contrôle sur les doublons de lecteurs:\r\n0 : pas de controle sur les doublons, en saisie de fiche de lecteur. \r\n1,empr_nom,empr_prenom,... : recherche doublons sur les champs \'empr\', \r\n2,empr_nom,empr_prenom,... : recherche doublons sur les champs \'empr\', et champ personnalisables.\r\n3,empr_nom, empr_prenom ,... : idem, en rajoutant le test sur le groupe.','',0),(420,'pmb','pret_nombre_prolongation','3','Nombre de prolongations autorisées','',0),(421,'pmb','pret_restriction_prolongation','0','0 : pas de restriction\r\n1 : prolongation limitée au paramètre pret_nombre_prolongation \r\n2 : prolongation gérée par les quotas ','',0),(422,'opac','pret_prolongation','0','0 : pas de prolongation\r\n1 : prolongation autorisée','a_general',0),(423,'mailretard','1after_list_group','Nous vous remercions de prendre rapidement contact par téléphone au 02 43 440 660 ou par mail à pmb@sigb.net pour étudier la possibilité de prolonger les emprunts de votre groupe ou de rapporter les ouvrages concernés.','Texte apparaissant après la liste des ouvrages en retard dans le mail','',0),(424,'mailretard','1before_list_group','Sauf erreur de notre part, les emprunteurs de votre groupe ont toujours en leur possession le ou les ouvrage(s) suivant(s) dont la durée de prêt est aujourd\'hui dépassée :','Texte apparaissant avant la liste des ouvrages en retard dans le mail de relance de retard','',0),(425,'mailretard','1fdp_group','Le responsable.','Signataire du mail de relance de retard','',0),(426,'mailretard','1madame_monsieur_group','Madame, Monsieur','Entête du mail','',0),(427,'mailretard','1objet_group','Bibliothèque test de PMB : documents en retard','Objet du mail de relance de retard','',0),(428,'pmb','first_week_day_format','0','Format de la semaine: \n 0, la semaine commence le lundi \n 1 la semaine commence le dimanche','',0),(429,'opac','export_allow_expl','0','Exporter les exemplaires avec les notices : \n 0 : Non \n 1 : Oui','a_general',0),(430,'opac','nb_max_tri','50','Nombre maximum de notices pour lesquelles le tri est autorisé.','c_recherche',0),(431,'pmb','nb_max_tri','50','Nombre maximum de notices pour lesquelles le tri est autorisé.','',0),(432,'opac','pret_duree_prolongation','15','Nombre de jours de prolongation autorisé','a_general',0),(433,'opac','surlignage','2','Surligner les mots recherchés :\r\n0 : pas de surlignage\r\n1 : surlignage obligatoire\r\n2 : surlignage activable\r\n3 : surlignage désactivable','d_aff_recherche',0),(434,'opac','nb_max_criteres_tri','3','Nombre maximum de critères de tri à afficher.','c_recherche',0),(435,'empr','show_caddie','1','Afficher le module de paniers de lecteurs: \r\n 0: Non \r\n 1: Oui','',0),(436,'empr','pics_url','','URL des photos des emprunteurs, dans le chemin fourni, !!num_carte!! sera remplacé par le numéro de carte du lecteur. \n exemple : http://www.monsite/photos/lecteurs/!!num_carte!!.jpg','',0),(437,'empr','pics_max_size','100','Taille maximale des photos des emprunteurs, en largeur ou en hauteur','',0),(438,'thesaurus','classement_mode_pmb','0','Niveau d\'utilisation des plans de classement des indexations. \n 0 : Un seul plan de classement. \n 1 : Choix du plan de classement possible.','classement',0),(439,'thesaurus','classement_defaut','1','Identifiant du plan de classement par défaut.','classement',0),(440,'empr','electronic_loan_ticket','0','Envoyer un ticket de prêt électronique ? \n 0: Non, \n 1: Oui','',0),(441,'empr','electronic_loan_ticket_obj','!!biblio_name!! : emprunt(s) du !!date!!','Objet du mail de ticket électronique de prêt','',0),(442,'empr','electronic_loan_ticket_msg','Bonjour, <br />Voici la liste de vos emprunts et/ou réservations en date du !!date!! :<br /><br />!!all_loans!! !!all_reservations!!<br />Retrouvez toutes ces informations sur votre compte à l\'adresse <a href=!!biblio_website!!>!!biblio_website!!</a>.','Corps du mail de ticket électronique de prêt','',0),(443,'pmb','droits_explr_localises','0','Les droits de gestion des exemplaires sont-ils localisés ? \n 0: Non \n 1: Oui','',0),(444,'empr','fiche_depliee','1','La fiche emprunteur sera automatiquement : \n 0 : pliée \n 1 : dépliée','',0),(445,'empr','statut_adhes_depassee','2','id du statut pour lequel les emprunteurs dont la date d\'adhesion est dépassée n\'apparaissent pas en zone d\'alerte','',0),(446,'opac','authorized_styles','pmb34,bueil,genbib','Styles de l\'OPAC autorisés, séparés par une virgule','a_general',0),(447,'empr','relance_adhesion','0','Les relances d\'adhésion sont envoyées : \n 0 : exclusivement par lettre \n 1 : mail, à défaut par lettre','',0),(448,'empr','show_rows','b,n,a,v,y,s,1','Colonnes affichées en liste de lecteurs, saisir les colonnes séparées par des virgules. Les colonnes disponibles pour l\'affichage de la liste des emprunteurs sont : \n n: nom+prénom \n a: adresse \n b: code-barre \n c: catégories \n g: groupes \n l: localisation \n s: statut \n cp: code postal \n v: ville \n y: année de naissance \n ab: type d\'abonnement \n #e[n] : [n] = id des champs personnalisés lecteurs \n 1: icône panier','',0),(449,'empr','sort_rows','n,c,l,s','Colonnes qui seront disponibles pour le tri des emprunteurs. Les colonnes possibles sont : \n n: nom+prénom \n b: code-barres \n c: catégories \n g: groupes \n l: localisation \n s: statut \n cp: code postal \n v: ville \n y: année de naissance \n ab: type d\'abonnement \n #e[n] : [n] = id des champs personnalisés lecteurs \n #p[n] : [n] = id des champs personnalisés prêts','',0),(450,'empr','filter_rows','cp,v,y,s','Colonnes disponibles pour filtrer la liste des emprunteurs : \n v: ville\n l: localisation\n c: catégorie\n s: statut\n g: groupe\n y: année de naissance\n cp: code postal\n cs : code statistique\n ab : type d\'abonnement \n #e[n] : [n] = id des champs personnalisés lecteurs \n #p[n] : [n] = id des champs personnalisés prêts','',0),(451,'empr','header_format','','Champs personnalisés qui seront affichés dans l\'entête de la fiche emprunteur. Saisir les ids séparés par des virgules','',0),(452,'empr','archivage_prets','0','Archiver les prêts des emprunteurs ? \n 0: Non \n 1: Oui\nATTENTION pour la France: nous attirons votre attention sur l\'obligation de déclarer votre traitement à la CNIL (www.cnil.fr) si vous activez cette fonctionnalité.','',0),(453,'empr','archivage_prets_purge','0','Nombre de jours maximum où doivent être conservées les archives nominatives de prêts : \n0: illimité \nN: N jours','',0),(454,'opac','autres_lectures','0','Afficher les emprunts des autres lecteurs du document courant ? \n 0: Non \n 1: Oui','f_modules',0),(455,'opac','autres_lectures_tri','rand()','Tri des autres lectures proposées : \n rand(): aléatoire \n tit: par Titre','f_modules',0),(456,'opac','autres_lectures_nb_mini_emprunts','100','Nombre minimum d\'emprunts pour être comptabilisés \n 1: un seul emprunt suffit pour proposer la notice comme lecture associée \n N: N emprunts minimum nécessaires ','f_modules',0),(457,'opac','autres_lectures_nb_maxi','0','Nombre maximum de lectures associées proposées','f_modules',0),(458,'opac','autres_lectures_nb_jours_maxi','1','Délai en jours au delà duquel les emprunts ne sont pas comptabilisés, 0 pour illimité','f_modules',0),(459,'opac','empr_hist_nb_max','0','Nombre maximum de prêts précédents à afficher, 0 pour illimité','a_general',0),(460,'opac','empr_hist_nb_jour_max','1','Délai en jours au delà duquel les prêts précédents ne sont pas affichés, 0 pour illimité','a_general',0),(461,'opac','allow_tags_search_min_occ','1','Nombre mini d\'occurence d\'un tag pour être affiché, 1 pour tous','c_recherche',0),(462,'pmb','etat_collections_localise','0','L\'état des collections est-il localisé ? \n 0 : non \n 1 : oui','',0),(463,'pmb','clean_nb_elements','100','Nombre d\'éléments traités par passe en nettoyage de base','',0),(464,'pmb','rfid_activate','0','Enregistrements des prêts par platine RFID ? \n 0: Non \n 1: Oui','',0),(465,'opac','bull_results_per_page','12','Nombre de bulletins affichés par page dans l\'affichage d\'un périodique','e_aff_notice',0),(466,'pmb','rfid_serveur_url','','URL du serveur de webservices RFID','',0),(467,'opac','authorized_information_pages','1','Pages \"includable\" dans la page de l\'opac ./index.php?lvl=information&askedpage= : \n Mettre les noms des fichiers séparés par une virgule','a_general',0),(468,'pmb','notice_controle_doublons','0','Contrôle sur les doublons en saisie de la notice \n 0: Pas de contrôle sur les doublons, \n 1,tit1,tit2, ... : Recherche par méthode _exacte_ de doublons sur des champs, défini dans le fichier notice.xml  \n 2,tit1,tit2, ... : Recherche par _similitude_ ','',0),(469,'opac','title_ponderation','0.5','Majoration de la pondération des mots du titre \n   mettre 0 (zero) pour interdire la majoration \n ATTENTION utiliser le point décimal ','c_recherche',0),(470,'pmb','title_ponderation','0.5','Majoration de la pondération des mots du titre \n   mettre 0 (zero) pour interdire la majoration \n ATTENTION utiliser le point décimal ','',0),(471,'pmb','param_etiq_codes_barres','','Paramètres de sauvegarde des paramètres d\'édition d\'étiquettes codes-barres','',1),(472,'pmb','javascript_office_editor','','Code HTML à insérer pour remplacer les textarea par un éditeur Office javascript','',0),(473,'opac','biblio_post_adress','','Bloc d\'information après le bloc adresse, dans la feuille de style, voir id post_adress','b_aff_general',0),(474,'opac','allow_external_search','1','Autorisation ou non de la recherche par connecteurs externes dans l\'OPAC \r\n 0 : Non \r\n 1 : Oui','c_recherche',0),(475,'pmb','nb_noti_calc_empty_words','50','Un mot sera considéré comme vide s\'il apparaît dans un nombre de notices minimum. Saisir le pourcentage par rapport au nombre de notices total.','',1),(476,'opac','fonction_affichage_liste_bull','affichage_liste_bulletins_tableau','Fonction d\'affichage de la liste des bulletins d\'un périodique\nValeurs possibles:\naffichage_liste_bulletins_normale (Si paramètre vide)\naffichage_liste_bulletins_tableau\naffichage_liste_bulletins_depliable','e_aff_notice',0),(517,'transferts','statut_validation','0','id du statut dans lequel seront placés les documents dont le transfert est validé','',1),(516,'pmb','transferts_actif','0','Active le systeme de transferts d\'exemplaires entre sites\n 0: Non \n 1: Oui','',0),(479,'dsi','bannette_notices_order','index_serie, tnvol, index_sew','Ordre des notices au sein de la bannette: \n index_serie, tnvol, index_sew : par titre \n create_date desc : par date de saisie décroissante \n rand() : aléatoire','',0),(480,'opac','websubscribe_show','0','Afficher la possibilité de s\'inscrire en ligne ?\n0: Non\n1: Oui\n2: Oui + proposition s\'incription sur les réservations/abonnements','f_modules',0),(481,'opac','websubscribe_empr_status','2,1','Id des statuts des inscrits séparés par une virgule: en attente de validation, validés','f_modules',0),(482,'opac','websubscribe_empr_categ','0','Id de la catégorie des inscrits par le web non adhérents complets','f_modules',0),(483,'opac','websubscribe_empr_stat','0','Id du code statistique des inscrits par le web non adhérents complets','f_modules',0),(484,'opac','websubscribe_valid_limit','24','Durée maximum des inscriptions en attente de validation','f_modules',0),(485,'pmb','mail_html_format','1','Format d\'envoi des mails à partir de l\'opac: \n 0: Texte brut\n 1: HTML \n 2: HTML, images incluses\nAttention, ne fonctionne qu\'en mode d\'envoi smtp !','',0),(486,'opac','mail_html_format','1','Format d\'envoi des mails à partir de l\'opac: \n 0: Texte brut\n 1: HTML \n 2: HTML, images incluses\nAttention, ne fonctionne qu\'en mode d\'envoi smtp !','a_general',0),(487,'opac','websubscribe_empr_location','0','Id de la localisation des inscrits par le web non adhérents complets','f_modules',0),(488,'opac','allow_bannette_export','0','Possibilité pour les lecteurs de recevoir les notices de leurs bannettes privées en pièce jointe au mail ?\n 0: Non \n 1: Oui','l_dsi',0),(489,'opac','expl_data','expl_cb,expl_cote,tdoc_libelle,location_libelle,section_libelle','Colonne des exemplaires, dans l\'ordre donné, séparé par des virgules : expl_cb,expl_cote,tdoc_libelle,location_libelle,section_libelle','e_aff_notice',0),(490,'opac','expl_order','location_libelle,section_libelle,expl_cote,tdoc_libelle','Ordre d\'affichage des exemplaires, dans l\'ordre donné, séparé par des virgules : location_libelle,section_libelle,expl_cote,tdoc_libelle','e_aff_notice',0),(491,'opac','curl_available','1','La librairie cURL est-elle disponible pour les interrogations RSS notamment ? \n 0: Non \n 1: Oui','a_general',0),(492,'pmb','curl_available','1','La librairie cURL est-elle disponible pour les interrogations RSS notamment ? \n 0: Non \n 1: Oui','',0),(493,'opac','thesaurus_defaut','1','Identifiant du thésaurus par défaut.','i_categories',0),(494,'opac','recherches_pliables','1','Les cases à cocher de la recherche simple sont-elles pliées ? \r\n 0: Non \r\n 1: Oui et pliée par défaut \r\n 2: Oui et dépliée par défaut \r\n 3: invisibles','c_recherche',0),(495,'pmb','rfid_ip_port','192.168.0.10,SerialPort=10;','Association ip du poste de prêt et Numéro du port utilisé par le serveur RFID. Ex: 192.168.0.10,SerialPort=10; IpPosteClient,SerialPort=NumPortPlatine; séparé par des points-virgules pour désigner tous les postes','',0),(496,'pmb','pret_timeout_temp','15','Temps en minutes, après lequel un prêt temporaire est effacé','',0),(497,'opac','permalink','0','Afficher l\'Id de la notice avec un lien permanent ? \n 0: Non \n 1: Oui','e_aff_notice',0),(498,'pdflettreretard','3after_recouvrement','Sans nouvelles de votre part dans les sept jours, nous nous verrons contraints de déléguer au Trésor Public le recouvrement des ouvrages ci-dessus.','Texte apparaissant après la liste des ouvrages en recouvrement s\'il n\'y a pas d\'autres ouvrages en niveau 1 et 2','',0),(499,'pdflettreretard','impression_tri','empr_cp,empr_ville,empr_nom,empr_prenom','Tri pour l\'impression des lettres de relances ? Les champs sont ceux de la table empr séparés par des virgules. Exemple: empr_nom, empr_prenom','',0),(500,'pmb','pret_date_retour_adhesion_depassee','0','La date de retour peut-elle dépasser la date de fin d\'adhésion ? \n 0: Non: la date de retour sera calculée pour ne pas dépasser la date de fin d\'adhésion. \n 1: Oui, la date de retour du prêt sera indépendante de date de fin d\'adhésion.','',0),(501,'opac','extended_search_auto','1','En recherche multicritères, la sélection d\'un champ ajoute celui-ci automatiquement sans avoir besoin de cliquer sur le bouton Ajouter ? \n 0: Non \n 1: Oui','c_recherche',0),(502,'pmb','extended_search_auto','1','En recherche multicritères, la sélection d\'un champ ajoute celui-ci automatiquement sans avoir besoin de cliquer sur le bouton Ajouter ? \n 0: Non \n 1: Oui','',0),(503,'thesaurus','categories_affichage_ordre','0','Paramétrage de l\'ordre d\'affichage des catégories d\'une notice.\nPar ordre alphabétique: 0(par défaut)\nPar ordre de saisie: 1','categories',0),(504,'opac','categories_affichage_ordre','0','Paramétrage de l\'ordre d\'affichage des catégories d\'une notice.\nPar ordre alphabétique: 0(par défaut)\nPar ordre de saisie: 1','i_categories',0),(505,'pmb','rfid_driver','','Driver du pilote RFID : le nom du répertoire contenant les javascripts propre au matériel en place.','',0),(506,'pmb','allow_external_search','1','Autorisation ou non de la recherche par connecteurs externes (masque également le menu Administration-Connecteurs) \r\n 0 : Non \r\n 1 : Oui','',0),(507,'pmb','scan_pmbws_client_url','','URL de l\'interface de numérisation (client du webservice)','',0),(508,'pmb','scan_pmbws_url','','URL du webservice de pilotage du scanner','',0),(509,'opac','biblio_main_header','<h3>PMB OPAC</h3>','Texte pouvant apparaitre dans le bloc principal, au dessus de tous les autres, nécessaire pour certaines mises en page particulières.Ej: <h3>Des services pour PMB</h3>','b_aff_general',0),(510,'opac','sugg_localises','0','Activer la localisation des suggestions des lecteurs ? \n 0: Pas de localisation possible.\n 1: Localisation au choix du lecteur.\n 2: Localisation restreinte à la localisation du lecteur.','a_general',0),(511,'acquisition','sugg_localises','0','Activer la localisation des suggestions ? \n 0: Pas de localisation possible. \n 1: Localisation activée.','',0),(512,'opac','categories_nav_max_display','200','Limiter l\'affichage des catégories en navigation dans les sous-catégories. 0: Pas de limitation. >0: Nombre max de catégories à afficher','i_categories',0),(513,'pmb','pret_aff_limitation','0','Activer la limitation de l\'affichage de la liste des prêts dans la fiche lecteur ? \n 0: Inactif. \n 1: Limitation activée','',0),(514,'pmb','pret_aff_nombre','10','Nombre de prêts à afficher si le paramètre pret_aff_limitation est actif. \n 0: tout voir, illimité. \n ## Nombre de prêts à afficher sur la première page','',0),(515,'pmb','printer_ticket_url','','Permet d\'utiliser une imprimante de ticket, connectée en local sur le poste de prêt client. Vide : pas d\'imprimante. Url (http://localhost/printer/bixolon_srp350.php ) : imprimante active.','',0),(518,'transferts','statut_transferts','0','id du statut dans lequel seront placés les documents en cours de transit','',1),(519,'transferts','validation_actif','1','Active la validation des transferts\n 0: Non \n 1: Oui','',1),(520,'transferts','nb_jours_pret_defaut','30','Nombre de jours de pret par defaut','',1),(521,'transferts','nb_jours_alerte','7','Nombre de jours avant la fin du pret ou l\'alerte s\'affiche','',1),(522,'transferts','transfert_transfere_actif','0','Autorise le transfert d\'exemplaire deja transferer','',1),(523,'transferts','tableau_nb_lignes','10','Nombre de transferts affichés dans les tableaux','',1),(524,'transferts','envoi_lot','0','traitement par lot possible en envoi','',1),(525,'transferts','reception_lot','0','traitement par lot possible en reception','',1),(526,'transferts','retour_lot','0','traitement par lot possible en retour','',1),(527,'transferts','retour_origine','0','Force le retour de l\'exemplaire dans son lieu d\'origine\n 0: Non \n 1: Oui','',1),(528,'transferts','retour_origine_force','1','Permet de forcer le retour de l\'exemplaire\n 0: Non \n 1: Oui','',1),(529,'transferts','retour_action_defaut','1','Action par defaut lors du retour d\'un emprunt\n 0: change localisation \n 1: genere transfert','',1),(530,'transferts','retour_action_autorise_autre','1','Autorise une autre action lors du retour de l\'exemplaire\n 0: Non\n 1: Oui','',1),(531,'transferts','retour_change_localisation','1','Sauvegarde de la localisation lors du changement\n 0: Non \n 1: Oui','',1),(532,'transferts','retour_etat_transfert','1','Etat du transfert lors de sa generation auto\n 0: creer \n 1: envoyer','',1),(533,'transferts','retour_motif_transfert','Transfert suite au retour de l\'exemplaire sur notre site','Motif du transfert lors de sa generation auto','',1),(534,'transferts','choix_lieu_opac','0','0 pour pas de choix et obligatoirement dans la localisation ou est enregistré l\'utilisateur, 1 pour n\'importe quelle localisation au choix, 2 pour un lieu fixe précisé, 3 pour le lieu de l\'exemplaire','',1),(535,'transferts','site_fixe','1','id du site pour le retrait des livres si choix_lieu_opac=2','',1),(536,'transferts','resa_motif_transfert','Transfert suite à une réservation','Motif du transfert lors de sa generation auto pour une réservation','',1),(537,'transferts','resa_etat_transfert','1','Etat du transfert lors de sa generation auto\n 0: creer \n 1: envoyer','',1),(538,'pmb','recherche_ajax_mode','1','Affichage accéléré des résultats de recherche: \"réduit\" uniquement, la suite est chargée lors du click sur le \"+\". \n 0: Inactif \n 1: Actif','',0),(539,'pmb','expl_title_display_format','expl_location,expl_section,expl_cote,expl_cb','Format d\'affichage du titre de l\'exemplaire en recherche multi-critères d\'exemplaires. Les libellés des champs correspondent aux champs de la table exemplaires, ou aux id de champs personnalisés. Séparés par une virgule. Les champs disposant d\'un libellé seront remplacés par le libellé correspondant. Exemple: expl_location,expl_section,expl_cote,expl_cb','',0),(540,'opac','empr_code_info','','Code HTML affiché au dessus des boutons dans la fiche emprunteur.','a_general',0),(541,'opac','term_search_height_bottom','120','Hauteur de la partie supérieure de la frame de recherche par termes (en px)','c_recherche',0),(542,'pmb','rfid_library_code','','Code numérique d\'identification de la bibliothèque propriétaire des exemplaires (10 caractères)','',0),(543,'opac','show_infopages_id','5','Id des infopages à afficher sous la recherche simple, séparées par des virgules.','f_modules',0),(544,'thesaurus','auto_postage_montant','0','Activer la recherche des notices des catégories mères ? \n  0 non, \n 1 oui','i_categories',0),(545,'thesaurus','auto_postage_descendant','0','Activer la recherche des notices des catégories filles. \n 0 non, \n 1 oui','i_categories',0),(546,'thesaurus','auto_postage_nb_descendant','0','Nombre de niveaux de recherche de notices dans les catégories filles. \n *: illimité, \n n: nombre de niveaux','i_categories',0),(547,'thesaurus','auto_postage_nb_montant','0','Nombre de niveaux de recherche de notices dans les catégories mères. \n *: illimité, \n n: nombre de niveaux','i_categories',0),(548,'thesaurus','auto_postage_etendre_recherche','0','Proposer la possibilité d\'étendre la recherche dans les catégories mères ou filles. \n 0: non, \n 1: Exclusivement dans les catégories filles, \n 2: Etendre dans les catégories mères et filles, \n 3: Exclusivement dans les catégories mères. ','i_categories',0),(549,'opac','auto_postage_montant','0','Activer la recherche des notices des catégories mères. \n 0 non, \n 1 oui','i_categories',0),(550,'opac','auto_postage_descendant','0','Activer la recherche des notices des catégories filles. \n 0 non, \n 1 oui','i_categories',0),(551,'opac','auto_postage_nb_descendant','0','Nombre de niveaux de recherche de notices dans les catégories filles. \n *: illimité, \n n: nombre de niveaux','i_categories',0),(552,'opac','auto_postage_nb_montant','0','Nombre de niveaux de recherche de notices dans les catégories mères. \n *: illimité, \n n: nombre de niveaux','i_categories',0),(553,'opac','auto_postage_etendre_recherche','0','Proposer la possibilité d\'étendre la recherche dans les catégories mères ou filles. \n 0: non, \n 1: Exclusivement dans les catégories filles, \n 2: Etendre dans les catégories mères et filles, \n 3: Exclusivement dans les catégories mères. ','i_categories',0),(554,'gestion_acces','active','0','Module gestion des droits d\'accès activé ?\n 0 : Non.\n 1 : Oui.','',0),(555,'gestion_acces','user_notice','0','Gestion des droits d\'accès des utilisateurs aux notices \n 0 : Non.\n 1 : Oui.','',0),(556,'pmb','abt_end_delay','30','Délais d\'alerte d\'avertissement des abonnements arrivant à échéance (en jours)','',0),(557,'pmb','set_time_limit','1200','max_execution_time de certaines opérations (export d\'actions personnalisées, envoi DSI, export, etc.) \nAttention, peut être sans effet si l\'hébergement ne l\'autorise pas (free.fr par exemple)\n 0 : illimité (déconseillé) \n ###: ### secondes','',0),(558,'pmb','expl_list_display_comments','3','Afficher les commentaires des exemplaires en liste d\'exemplaires : \r\n 0 : non \r\n 1 : commentaire bloquant \r\n 2 : commentaire non bloquant \r\n 3 : les deux commentaires','',0),(559,'pmb','confirm_delete_from_caddie','2','Action à réaliser lors de la suppression d\'une notice située dans un panier. \r\n0 : Interdire \r\n1 : Supprimer sans confirmation \r\n2 : Demander une confirmation de suppression ','',0),(560,'opac','flux_rss_notices_order',' index_serie, tnvol, index_sew ','Ordre d\'affichage des notices dans les flux sortants dans l\'opac \n  index_serie, tnvol, index_sew : tri par titre de série et titre \n rand()  : aléatoire \n notice_id desc par ordre décroissant de création de notice','l_dsi',0),(561,'opac','modules_search_titre_uniforme','1','Recherche simple dans les titres uniformes :\n 0 : interdite\n 1 : autorisée\n 2 : autorisée et validée par défaut\n -1 : également interdite en recherche multi-critères','c_recherche',0),(562,'opac','congres_affichage_mode','0','Mode d\'affichage des congrès: \n 0 : Comme pour les auteurs, \n 1 : ajout d\'un navigateur de congrès','d_aff_recherche',0),(563,'opac','show_suggest_notice','0','Afficher le lien de proposition de suggestion sur une notice existante.\n 0 : Non.\n 1 : Oui, avec authentification.\n 2 : Oui, sans authentification.','f_modules',0),(564,'pmb','explnum_statut','0','Utiliser un statut sur les documents numériques \n 0: non \n 1: oui','',0),(565,'opac','show_empty_items_block','1','Afficher le bloc exemplaires même si aucun exemplaire sur la notice ? : \n 0 : Non, \n 1 : Oui','d_aff_recherche',0),(566,'pmb','printer_ticket_script','','Script permettant de personaliser l\'impression du ticket de prêt. Le répertoire du script est à paramétrer à partir de la racine de PMB.\nSi vide PMB utilise ./circ/ticket-pret.inc.php','',0),(567,'opac','curl_proxy','','Paramétrage de proxy de cURL, vide si aucun proxy, sinon\nhost,port,user,password;2nd_host et ainsi de suite','a_general',0),(568,'pmb','curl_proxy','','Paramétrage de proxy de cURL, vide si aucun proxy, sinon\nhost,port,user,password;2nd_host et ainsi de suite','',0),(570,'opac','password_forgotten_show','1','Afficher le lien  \"Mot de passe oublié ?\" \n 0: Non \n 1: Oui','f_modules',0),(571,'opac','aff_expl_localises','0','Activer l\'affichage des exemplaires localisés par onglet.\n 0 : désactivé \n 1: premier onglet affiche les exemplaires de la localisation du lecteur, le deuxieme affiche tous les exemplaires','e_aff_notice',0),(572,'gestion_acces','empr_notice','0','Gestion des droits d\'accès des emprunteurs aux notices \n 0 : Non.\n 1 : Oui.','',0),(573,'opac','show_infopages_id_top','','Id des infopages à afficher SUR la recherche simple, séparées par des virgules.','f_modules',0),(574,'opac','show_search_title','0','Afficher le titre du bloc de recherche : \n 0 : Non, \n 1 : Oui','f_modules',0),(575,'opac','allow_personal_search','0','Activer l\'affichage de l\'onglet des recherches personalisées \n 0 : Non.\n 1 : Oui.','c_recherche',0),(576,'ldap','opac_only','0','Ne pas utiliser l\'authentification LDAP en gestion: \n 0: Non \n 1 : Oui, en OPAC uniquement','',0),(577,'pmb','multi_search_operator','or','Type d\'opérateur de recherche pour les listes avec plusieurs valeurs: \n or : pour le OU \n and : pour le ET','',0),(578,'opac','multi_search_operator','or','Type d\'opérateur de recherche pour les listes avec plusieurs valeurs: \n or : pour le OU \n and : pour le ET','c_recherche',0),(579,'transferts','pret_statut_transfert','0','Autoriser le prêt lorsque l\'exemplaire est en transfert','',1),(580,'exportparam','generer_liens','0','Générer les liens entre les notices pour l\'export','',1),(581,'exportparam','export_mere','0','Exporter les notices liées mères','',1),(582,'exportparam','export_fille','0','Exporter les notices liées filles','',1),(583,'exportparam','export_bull_link','1','Exporter les liens vers les bulletins pour les notices d\'article','',1),(584,'exportparam','export_perio_link','1','Exporter les liens vers les périodiques pour les notices d\'article','',1),(585,'exportparam','export_art_link','1','Exporter les liens vers les articles pour les notices de périodique','',1),(586,'exportparam','export_bulletinage','0','Générer le bulletinage pour les notices de périodiques','',1),(587,'exportparam','export_notice_perio_link','0','Exporter les notices liées de périodique','',1),(588,'exportparam','export_notice_art_link','0','Exporter les notices liées d\'article','',1),(589,'exportparam','export_notice_mere_link','0','Exporter les notices mères liées','',1),(590,'exportparam','export_notice_fille_link','0','Exporter les notices filles liées','',1),(591,'opac','exp_generer_liens','0','Générer les liens entre les notices pour l\'export','',1),(592,'opac','exp_export_mere','0','Exporter les notices liées mères','',1),(593,'opac','exp_export_fille','0','Exporter les notices liées filles','',1),(594,'opac','exp_export_bull_link','1','Exporter les liens vers les bulletins pour les notices d\'article','',1),(595,'opac','exp_export_perio_link','1','Exporter les liens vers les périodiques pour les notices d\'article','',1),(596,'opac','exp_export_art_link','1','Exporter les liens vers les articles pour les notices de périodique','',1),(597,'opac','exp_export_bulletinage','0','Générer le bulletinage pour les notices de périodiques','',1),(598,'opac','exp_export_notice_perio_link','0','Exporter les notices liées de périodique','',1),(599,'opac','exp_export_notice_art_link','0','Exporter les notices liées d\'article','',1),(600,'opac','exp_export_notice_mere_link','0','Exporter les notices mères liées','',1),(601,'opac','exp_export_notice_fille_link','0','Exporter les notices filles liées','',1),(602,'pmb','perio_vidage_log','1','Périodicité de transfert des données depuis la table temporaire des logs vers la table de stockage  (en jours).','',0),(603,'pmb','perio_vidage_stat','2,15','Périodicité de vidage de la table de stockage (mode,jour) : \r\n0 : ne rien faire\r\n1,x : vider tous les x jours\r\n2,x : vider tous ce qui à plus de x jours','',0),(604,'pmb','logs_activate','0','Activer les statistiques pour l\'OPAC: \n 0 : non activé \n 1 : activé','',0),(605,'opac','shared_lists','0','Activer les listes de lecture partagées \n 0 : non activées \n 1 : activées','a_general',0),(606,'pmb','indexation_docnum','0','Activer l\'indexation des documents numériques \n 0 : non activée \n 1 : activée','',0),(607,'pmb','indexation_docnum_allfields','0','Activer par défaut la recherche dans les documents numériques pour la recherche \"Tous les champs\" \n 0 : non activée \n 1 : activée','',0),(608,'opac','indexation_docnum_allfields','0','Activer par défaut la recherche dans les documents numériques pour la recherche \"Tous les champs\" \n 0 : non activée \n 1 : activée','c_recherche',0),(609,'opac','modules_search_docnum','0','Recherche simple dans les documents numériques \n 0 : interdite \n 1 : autorisée \n 2 : autorisée et validée par défault','c_recherche',0),(610,'pmb','location_reservation','0','Utiliser la gestion de la réservation localisée?\n 0: Non\n 1: Oui','',0),(611,'pmb','extension_tab','0','Afficher l\'onglet Extension ? \n 0 : Non \n 1 : Oui','',0),(612,'pmb','indexation_docnum_default','0','Indexer le document numérique par défaut ? \n 0 : Non \n 1 : Oui','',0),(613,'opac','shared_lists_readonly','0','Listes de lecture partagées en lecture seule \n 0 : non activées \n 1 : activées','a_general',0),(614,'opac','connexion_phrase','','Phrase permettant l\'encodage de la connexion automatique à partir d\'un mail','a_general',0),(615,'pmb','afficher_numero_lecteur_lettres','1','Afficher le numéro et le mail du lecteur sous l\'adresse dans les différentes lettres','',0),(616,'pmb','lettres_bloc_adresse_position_absolue','0 100 40','Place le bloc d\'adresse selon des coordonnées absolues.\nactivé x y\nactivé : activer cette fonction (valeurs: 0/1)\nx : Position horizontale\ny : Position verticale','',0),(617,'pmb','external_service_search_cache','3600','Durée de vie des recherches dans le cache, pour les services externes, en secondes.','',0),(618,'pmb','external_service_session_duration','600','Durée de vie des sessions pour les services externes, en secondes.','',0),(619,'opac','allow_multiple_sugg','0','Autoriser les suggestions multiples.\r\n0: non\r\n1: oui','a_general',0),(620,'dsi','bannette_notices_template','0','Id du template de notice utilisé par défaut en diffusion de bannettes. Si vide ou à 0, le template classique est utilisé.','',0),(621,'demandes','active','0','Module demandes activé.\n 0 : Non.\n 1 : Oui.','',0),(622,'demandes','statut_notice','0','Id du statut de notice pour la notice de demandes.','',0),(623,'opac','demandes_active','0','Activer les demandes pour l\'OPAC.\n 0 : Non.\n 1 : Oui.','a_general',0),(624,'pmb','use_uniform_title','1','Utiliser les titres uniformes ? \r\n 0 : Non.\r\n 1 : Oui.','',0),(625,'opac','print_expl_default','0','En impression de panier, imprimer les exemplaires est coché par défaut \n 0 : Non \n 1 : Oui','a_general',0),(626,'demandes','include_note','0','Inclure automatiquement les notes dans le rapport documentaire.','',0),(627,'opac','ie_reload_on_resize','0','Recharger la page si l\'utilisateur redimensionne son navigateur (pb de CSS avec IE) ? \n 0: Non \n 1: Oui','a_general',0),(628,'pmb','expl_show_dates','0','Afficher les dates des exemplaires ? \n 0 : Aucune date.\n 1 : Date de création et modification.\n 2 : Date de dépôt et retour (BDP).\n 3 : Date de création, modification, dépôt et retour.','',0),(629,'gestion_acces','user_notice_def','0','Valeur par défaut en modification de notice pour les droits d\'accès utilisateurs - notices \n 0 : Recalculer.\n 1 : Choisir.','',0),(630,'gestion_acces','empr_notice_def','0','Valeur par défaut en modification de notice pour les droits d\'accès emprunteurs - notices \n 0 : Recalculer.\n 1 : Choisir.','',0),(631,'opac','show_exemplaires_analysis','0','Afficher les exemplaires du bulletin sous l\'article affiché ? \n 0: Non \n 1: Oui','e_aff_notice',0),(632,'pmb','show_notice_id','0','Afficher l\'identifiant de la notice dans le descriptif ? \n 0 : Non.\n 1 : Oui. \n 1,X : Oui avec préfixe X','',0),(633,'opac','section_notices_order',' index_serie, tnvol, index_sew ','Ordre d\'affichage des notices dans les sections dans l\'opac \n  index_serie, tnvol, index_sew : tri par titre de série et titre ','k_section',0),(634,'opac','show_onglet_help','0','Afficher l\'onglet HELP avec les onglets de recherche affichant l\'infopage et un lien vers l\'infopage dans la barre de navigation \n 0 : Non.\n ## : id de l\'infopage. \n','f_modules',0),(635,'opac','navig_empr','0','Afficher l\'onglet \"Votre compte\" dans la barre de navigation de l\'Opac ? \n 0 : Non \n 1 : Oui','a_general',0),(637,'pmb','prefill_cote_ajax','','Script personnalisé de construction de la cote de l\'exemplaire en ajax','',0),(638,'pmb','hide_biblioinfo_letter','0','Masquer les informations de localisation dans l\'entête des lettres (pour les bibliothèques possédant du papier à entête)','',0),(639,'pmb','lettres_code_mail_position_absolue','0 100 6','Placer le code lecteur et le mail selon des coordonnées absolues.\n activé x y \n activé : activer cette fonction (valeurs: 0/1) \n x : Position horizontale \n y : Position verticale','',0),(640,'opac','adhesion_expired_status','0','Id du statut permettant de restreindre les droits des emprunteurs dont l\'abonnement est dépassé. \n\rPMB fera un AND logique avec les droits d\'origine.','a_general',0),(641,'pmb','resa_retour_action_defaut','1','Définit l\'action par défaut à effectuer lors d\'un retour si le document est réservé.\r\n0, A traiter plus tard.\r\n1, Valider la réservation.','',0),(642,'pmb','notice_fille_format','0','Affichage des notices filles \n 0: avec leurs détails (notice dépliable avec un plus) \n 1: Juste l\'entête','',0),(643,'pmb','hide_retdoc_loc_error','0','Gestion du retour de prêt d\'un document issu d\'une autre localisation:\n 0 : Rendu, sans message d\'erreur\n 1 : Non rendu, avec message d\'erreur\n 2 : Rendu, avec message d\'erreur','',0),(644,'pmb','selfservice_allow','0','Activer de la gestion de la borne de prêt?\n0 : Non. \n1 : Oui.','',0),(645,'selfservice','loc_autre_todo','0','Action à effectuer si le document est issu d\'une autre localisation','',1),(646,'selfservice','loc_autre_todo_msg','','Message si le document est réservé sur une autre localisation','',1),(647,'selfservice','resa_ici_todo','0','Action à effectuer si le document est réservé sur cette localisation','',1),(648,'selfservice','resa_ici_todo_msg','','Message si le document est réservé sur cette localisation','',1),(649,'selfservice','resa_loc_todo','0','Action à effectuer si le document est réservé sur une autre localisation','',1),(650,'selfservice','resa_loc_todo_msg','','Message si le document est réservé sur une autre localisation','',1),(651,'selfservice','retour_retard_msg','','Message si le document est rendu en retard','',1),(652,'selfservice','retour_blocage_msg','','Message si le document est rendu en retard avec blocage','',1),(653,'selfservice','retour_amende_msg','','Message si le document est rendu en retard avec amende','',1),(654,'selfservice','pret_carte_invalide_msg','Votre carte n\'est pas valide !','Message borne de prêt: Votre carte n\'est pas valide !','',1),(655,'selfservice','pret_pret_interdit_msg','Vous n\'êtes pas autorisé à emprunter !','Message borne de prêt: Vous n\'êtes pas autorisé à emprunter !','',1),(656,'selfservice','pret_deja_prete_msg','Document déjà prêté ! allez le signaler !','Message borne de prêt: Document déjà prêté ! allez le signaler !','',1),(657,'selfservice','pret_deja_reserve_msg','Vous ne pouvez pas emprunter ce document','Message borne de prêt: Vous ne pouvez pas emprunter ce document','',1),(658,'selfservice','pret_quota_bloc_msg','Vous ne pouvez pas emprunter ce document','Message borne de prêt: Vous ne pouvez pas emprunter ce document','',1),(659,'selfservice','pret_non_pretable_msg','Ce document n\'est pas prêtable','Message borne de prêt: Ce document n\'est pas prêtable','',1),(660,'selfservice','pret_expl_inconnu_msg','Ce document est inconnu','Message borne de prêt: Ce document est inconnu','',1),(661,'selfservice','pret_prolonge_non_msg','Le prêt ne peut être prolongé','Message borne de prêt: Le prêt ne peut être prolongé','',1),(675,'opac','visionneuse_params','','tableau de correspondance mimetype=>class','m_photo',1),(676,'opac','allow_self_checkout','0','Proposer de faire du prêt autonome dans l\'OPAC.\n 0 : Non.\n 1 : Autorise le prêt de document.\n 2 : Autorise le retour de document.\n 3 : Autorise le prêt et le retour de document.\n','a_general',0),(663,'opac','photo_filtre_mimetype','','Liste des mimetypes utilisés pour l\'affichage des résultats en mode photothèque séparés par une virgule et entre cotes (ex:\'application/pdf\',\'image/png\')','m_photo',0),(664,'empr','sms_activation','0,0,0,0','Activation de l\'envoi de sms. : relance 1,relance 2,relance 3,resa\n\n 0: Inactif\n 1: Actif','',0),(665,'empr','sms_config','','Paramétrage de l\'envoi de sms. \nUsage:\n class_name=nom_de_la_classe;param_connection;\nExemple:\n class_name=smstrend;login=xxxx@sigb.net;password=xxxx;tpoa=xxxx;','',0),(666,'empr','sms_msg_resa_dispo','Bonjour,\nUn document réservé est disponible.\nConsultez votre compte!','Texte du sms envoyé lors de la validation d\'une réservation','',0),(667,'empr','sms_msg_resa_suppr','Bonjour,\nUne réservation est supprimée.\nConsultez votre compte!','Texte du sms envoyé lors de la suppression d\'une réservation','',0),(668,'empr','sms_msg_retard','Bonjour,\nVous avez un ou plusieurs document(s) en retard.\nConsultez votre compte!','Texte du sms envoyé lors d\'un retard','',0),(669,'pmb','procedure_server_address','','Adresse du serveur de procédures distantes.','',0),(670,'pmb','procedure_server_credentials','','Authentification sur le serveur de procédures distantes.\n1ère ligne: email\n2ème ligne: mot de passe.','',0),(671,'pmb','rfid_pret_mode','0','Mode de fonctionnement du prêt:\n 0: Un document retiré de la platine est retiré du prêt.\n 1: Un document retiré de la platine est conservé pour faciliter le prêt de nombreux documents. ','',0),(672,'internal','emptylogstatopac','0','Paramètre interne, ne pas modifier\r\n =1 si vidage des logs en cours','',0),(673,'fiches','active','0','Module \'fiches\' activé.\n 0 : Non.\n 1 : Oui.','',0),(674,'opac','visionneuse_allow','0','Visionneuse activée.\n 0 : Non.\n 1 : Oui.','m_photo',0),(677,'opac','self_checkout_url_connector','','URL du connecteur en gestion permettant d\'effectuer le prêt autonome.','a_general',0),(678,'finance','recouvrement_lecteur_statut','0','Mémorise le statut que prennent les lecteurs lors du passage en recouvrememnt','',1),(679,'thesaurus','auto_postage_search','0','Activer l\'indexation des catégories mères et filles pour la recherche de notices. \n 0 non, \n 1 oui','i_categories',0),(680,'thesaurus','auto_postage_search_nb_descendant','0','Nombre de niveaux de recherche de notices dans les catégories filles. \n *: illimité, \n n: nombre de niveaux','i_categories',0),(681,'thesaurus','auto_postage_search_nb_montant','0','Nombre de niveaux de recherche de notices dans les catégories mères. \n *: illimité, \n n: nombre de niveaux','i_categories',0),(682,'opac','show_bulletin_nav','1','Affichage d\'un navigateur dans les bulletins d\'un périodique. \r\n 0 non \r\n 1 oui','f_modules',0),(683,'pmb','play_pret_sound','1','Jouer l\'alerte sonore si le prêt et le retour se passe sans erreur ? \n 0 : Non.\n 1 : Oui.','',0),(684,'pmb','catalog_verif_js','','Script de vérification de saisie de notice','',0),(685,'opac','default_style_addon','','Ajout de styles CSS aux feuilles déjà incluses ?\r\n Ne mettre que le code CSS, exemple:  body {background-color: #FF0000;}','a_general',0),(686,'pmb','rfid_gates_server_url','','URL du serveur des portiques RFID','',0),(687,'pmb','perso_sep','/','Séparateur des valeurs de champ perso, espace ou ; ou , ou ...','',0),(688,'pmb','search_full_text','0','Utiliser un index MySQL FULLTEXT pour la recherche sur les documents numériques \n 0: Non \n 1: Oui','',0),(689,'opac','parse_html','0','Activer le parse HTML des pages OPAC \n 0: Non \n 1: Oui','a_general',0),(690,'opac','notice_enrichment','0','Activer l\'enrichissement des notices\r\n 0: Non \r\n 1: Oui','e_aff_notice',0),(691,'opac','show_social_network','0','Activer les partages sur les réseaux sociaux \r\n 0: Non \r\n 1: Oui','e_aff_notice',0),(692,'pmb','opac_view_activate','0','Activer les vues OPAC :\n 0 : non activé\n 1 : activé avec gestion classique\n 2 : activé avec gestion avancée','',0),(693,'opac','opac_view_activate','0','Activer les vues OPAC:\n 0 : non activé \n 1 : activé','a_general',0),(694,'pmb','sur_location_activate','0','Activer les sur-localisations:\n 0 : non activé \n 1 : activé','',0),(695,'opac','sur_location_activate','0','Activer les sur-localisations:\n 0 : non activé \n 1 : activé','a_general',0),(696,'pmb','opac_view_class','','Nom de la classe substituant la class opac_view pour la personnalisation de la gestion des vues Opac','',0),(697,'opac','faviconurl','','URL du favicon, si vide favicon=celui de PMB','a_general',0),(698,'opac','allow_affiliate_search','0','Activer les recherches affiliées en OPAC:\n 0 : non \n 1 : oui','c_recherche',0),(699,'acquisition','pdfrel_format_page','210x297','Largeur x Hauteur de la page en mm','pdfrel',0),(700,'acquisition','pdfrel_orient_page','P','Orientation de la page: P=Portrait, L=Paysage','pdfrel',0),(701,'acquisition','pdfrel_marges_page','10,20,10,10','Marges de page en mm : Haut,Bas,Droite,Gauche','pdfrel',0),(702,'acquisition','pdfrel_pos_logo','10,10,20,20','Position du logo: Distance par rapport au bord gauche de la page,Distance par rapport au haut de la page,Largeur,Hauteur','pdfrel',0),(703,'acquisition','pdfrel_pos_raison','35,10,100,10,16','Position Raison sociale: Distance par rapport au bord gauche de la page,Distance par rapport au haut de la page,Largeur,Hauteur,Taille police','pdfrel',0),(704,'acquisition','pdfrel_pos_date','170,10,0,6,8','Position Date: Distance par rapport au bord gauche de la page,Distance par rapport au haut de la page,Largeur,Hauteur,Taille police','pdfrel',0),(705,'acquisition','pdfrel_pos_adr_rel','10,35,60,5,10','Position Adresse de relance: Distance par rapport au bord gauche de la page,Distance par rapport au haut de la page,Largeur,Hauteur,Taille police','pdfrel',0),(706,'acquisition','pdfrel_pos_adr_fou','100,55,100,6,14','Position Adresse fournisseur: Distance par rapport au bord gauche de la page,Distance par rapport au haut de la page,Largeur,Hauteur,Taille police','pdfrel',0),(707,'acquisition','pdfrel_pos_num_cli','10,80,0,10,16','Position numéro de client: Distance par rapport au bord gauche de la page,Distance par rapport au haut de la page,Largeur,Hauteur,Taille police','pdfrel',0),(708,'acquisition','pdfrel_pos_num','10,0,10,16','Position numéro de commande/devis: Distance par rapport au bord gauche de la page,Largeur,Hauteur,Taille police','pdfrel',0),(709,'acquisition','pdfrel_text_size','10','Taille de la police texte','pdfrel',0),(710,'acquisition','pdfrel_pos_titre','10,90,100,10,16','Position titre: Distance par rapport au bord gauche de la page,Distance par rapport au haut de la page,Largeur,Hauteur,Taille police','pdfrel',0),(711,'acquisition','pdfrel_text_before','','Texte avant le tableau de relances','pdfrel',0),(712,'acquisition','pdfrel_text_after','','Texte après le tableau de relances','pdfrel',0),(713,'acquisition','pdfrel_tab_rel','5,10','Tableau de relances: Hauteur ligne,Taille police','pdfrel',0),(714,'acquisition','pdfrel_pos_footer','15,8','Position bas de page: Distance par rapport au bas de page, Taille police','pdfrel',0),(715,'acquisition','pdfrel_pos_sign','10,60,5,10','Position signature: Distance par rapport au bord gauche de la page, Largeur, Hauteur ligne,Taille police','pdfrel',0),(716,'acquisition','pdfrel_text_sign','Le responsable de la bibliothèque.','Texte signature','pdfrel',0),(717,'acquisition','pdfrel_by_mail','1','Effectuer les relances par mail :\n 0 : non \n 1 : oui','pdfrel',0),(718,'acquisition','pdfrel_text_mail','Bonjour, \r\n\r\nVous trouverez ci-joint un état des commandes en cours.\r\n\r\nMerci de nous préciser par retour vos délais d\'envoi.\r\n\r\nCordialement,\r\n\r\nLe responsable de la bibliothèque.','Texte du mail','pdfrel',0),(719,'opac','show_perio_browser','0','Affichage du navigateur de périodiques en page d\'accueil OPAC.\n 0 : Non.\n 1 : Oui.','f_modules',0),(720,'acquisition','pdfrel_pdfrtf','0','Envoi des relances en :\n 0 : pdf\n 1 : rtf','pdfrel',0),(721,'opac','show_onglet_perio_a2z','0','Activer l\'onglet du navigateur de périodiques en OPAC.\n 0 : Non.\n 1 : Oui.','c_recherche',0),(722,'opac','avis_note_display_mode','1','Mode d\'affichage de la note pour les avis de notices.\n 0 : Note non visible.\n 1 : Affichage de la note sous la forme d\'étoiles.\n 2 : Affichage de la note sous la forme textuelle.\n 3 : Affichage de la note sous la forme textuelle et d\'étoiles.\n 4 : Affichage de la note sous la forme d\'étoiles, choix de la note sous la forme d\'étoiles.\n 5 : Affichage de la note sous la forme textuelle et d\'étoiles, choix de la note sous la forme d\'étoiles.\n 4 : Affichage de la note sous la forme d\'étoiles, choix de la note sous la forme d\'étoiles.\n 5 : Affichage de la note sous la forme textuelle et d\'étoiles, choix de la note sous la forme d\'étoiles.','a_general',0),(723,'opac','avis_display_mode','0','Mode d\'affichage des avis de notices.\n 0 : Visible en lien à coté de l\'onglet Public/ISBD de la notice.\n 1 : Visible dans la notice.','a_general',0),(724,'pmb','planificateur_allow','0','Planificateur activé.\n 0 : Non.\n 1 : Oui.','',0),(725,'acquisition','pdfrel_obj_mail','Etat des en-cours','Objet du mail','pdfrel',0),(726,'acquisition','pdfcde_by_mail','1','Effectuer les envois de commandes par mail :\n 0 : non \n 1 : oui','pdfcde',0),(727,'acquisition','pdfcde_obj_mail','Commande','Objet du mail','pdfcde',0),(728,'acquisition','pdfcde_text_mail','Bonjour, \r\n\r\nVous trouverez ci-joint une commande à traiter.\r\n\r\nMerci de nous confirmer par retour vos délais d\'envoi.\r\n\r\nCordialement,\r\n\r\nLe responsable de la bibliothèque.','Texte du mail','pdfcde',0),(729,'acquisition','pdfdev_by_mail','1','Effectuer les envois de demandes de devis par mail :\n 0 : non \n 1 : oui','pdfdev',0),(730,'acquisition','pdfdev_obj_mail','Demande de devis','Objet du mail','pdfdev',0),(731,'acquisition','pdfdev_text_mail','Bonjour, \r\n\r\nVous trouverez ci-joint une demande de devis.\r\n\r\nCordialement,\r\n\r\nLe responsable de la bibliothèque.','Texte du mail','pdfdev',0),(732,'pmb','docnum_in_database_allow','1','Autoriser le stockage de document numérique en base ? \n 0 : Non.\n 1 : Oui.','',0),(733,'opac','recherche_ajax_mode','1','Affichage accéléré des résultats de recherche: header uniquement, la suite est chargée lors du click sur le \"+\".\n 0: Inactif\n 1: Actif (par lot)\n 2: Actif (par notice)','c_recherche',0),(734,'pmb','avis_note_display_mode','1','Mode d\'affichage de la note pour les avis de notices.\n 0 : Note non visible.\n 1 : Affichage de la note sous la forme d\'étoiles.\n 2 : Affichage de la note sous la forme textuelle.\n 3 : Affichage de la note sous la forme textuelle et d\'étoiles.\n 4 : Affichage de la note sous la forme d\'étoiles, choix de la note sous la forme d\'étoiles.\n 5 : Affichage de la note sous la forme textuelle et d\'étoiles, choix de la note sous la forme d\'étoiles.\n 4 : Affichage de la note sous la forme d\'étoiles, choix de la note sous la forme d\'étoiles.\n 5 : Affichage de la note sous la forme textuelle et d\'étoiles, choix de la note sous la forme d\'étoiles.','',0),(735,'cms','active','0','Module \'Portail\' activé.\n 0 : Non.\n 1 : Oui.','',0),(736,'pmb','indexation_lang','','Choix de la langue d\'indexation par défaut. (ex : fr_FR,en_UK,...,ar), si vide c\'est la langue de l\'interface du catalogueur qui est utilisée.','',0),(737,'opac','websubscribe_show_location','0','Afficher la possibilité pour le lecteur de choisir sa localisation lors de son inscription en ligne.\n 0: Non\n 1: Oui','f_modules',0),(738,'opac','collstate_order','archempla_libelle,collstate_cote','Ordre d\'affichage des états des collections, dans l\'ordre donné, séparé par des virgules : archempla_libelle,collstate_cote','e_aff_notice',0),(739,'opac','default_sort','d_num_6,c_text_1','Tri par défaut des recherches OPAC.\nDe la forme, c_num_6 (c pour croissant, d pour décroissant, puis num ou text pour numérique ou texte et enfin l\'identifiant du champ (voir fichier xml sort.xml))','d_aff_recherche',0),(740,'pmb','fine_precision','2','Nombre de décimales pour l\'affichage des amendes','',1),(741,'opac','search_cache_duration','600','Durée de validité (en secondes) du cache des recherches OPAC','c_recherche',0),(742,'pmb','path_php','','Chemin absolu de l\'interpréteur PHP, local ou distant','',0),(743,'opac','explnum_order','explnum_mimetype, explnum_nom, explnum_id','Ordre d\'affichage des documents numériques, dans l\'ordre donné, séparé par des virgules : explnum_mimetype, explnum_nom, explnum_id','e_aff_notice',0),(744,'pmb','amende_comptabilisation','0','Date à laquelle le début de l\'amende sera comptabilisée \r\n 0 : à partir de la date de retour \r\n 1 : à partir du délai de grâce','',0),(745,'pmb','pret_calcul_retard_date_debut_incluse','0','Compter le jour de retour ou de relance comme un jour de retard pour le calcul de l\'amende ? \r\n 0 : Non \r\n  1 : Oui','',0),(746,'opac','exclude_fields','','Identifiants des champs à exclure de la recherche tous les champs (liste dispo dans le fichier includes/indexation/champ_base.xml)','c_recherche',0),(747,'opac','serialcirc_active','0','Activer la circulation des pédioques dans l\'OPAC \r\n 0: Non \r\n 1: Oui','f_modules',0),(748,'pmb','bdd_subversion','16','Sous-version de la base de données','',0),(749,'pmb','import_modele_authorities','authority_import','Quelle classe d\'import utiliser pour les notices d\'autorités ?','',0),(750,'pmb','location_resa_planning','0','Utiliser la gestion de la prévision localisée?\n 0: Non\n 1: Oui','',0),(751,'demandes','email_demandes','1','Information par email de l\'évolution des demandes.\n 0 : Non\n 1 : Oui','',0),(752,'pmb','short_loan_management','0','Gestion des prêts courts\n 0: Non\n 1: Oui','',0),(753,'pmb','loan_trust_management','0','Gestion de monopole de prêt\n 0: Non\n x: nombre de jours entre 2 prêts d\'un exemplaire d\'une même notice (ou bulletin)','',0),(754,'opac','perio_a2z_abc_search','0','Recherche abécédaire dans le navigateur de périodiques en OPAC.\n0 : Non.\n1 : Oui.','c_recherche',0),(755,'opac','perio_a2z_max_per_onglet','10','Recherche dans le navigateur de périodiques en OPAC : nombre maximum de notices par onglet.','c_recherche',0),(756,'pmb','indexation_docnum_ext','','Paramètres de gestion d\'accès aux programmes externes pour l\'indexation des documents numériques :\n\n Chaque paramètre est défini par un  couple : \"nom=valeur\"\n Les paramètres sont séparés par un \"point-virgule\".\n\n\n Exemples d\'utilisation de \"pyodconverter\", \"jodconverter\" et \"pdftotext\" :\n\npyodconverter_cmd=/opt/openoffice.org3/program/python /opt/ooo_converter/DocumentConverter.py %1s %2s;\njodconverter_cmd=/usr/bin/java -jar /opt/ooo_converter/jodconverter-2.2.2/lib/jodconverter-cli-2.2.2.jar %1s %2s;\njodconverter_url=http://localhost:8080/converter/converted/%1s;\npdftotext_cmd=/usr/bin/pdftotext -enc UTF-8 %1s -;','',0),(757,'opac','notices_format_onglets','','Liste des id de template de notice pour ajouter des onglets personnalisés en affichage de notice\nExemple: 1,3,ISBD,PUBLIC\nLe paramètre notices_format doit être à 0 pour placer ISBD et PUBLIC','e_aff_notice',0),(758,'opac','visionneuse_alert','','Message d\'alerte à l\'ouverture des documents numériques.','m_photo',0),(759,'opac','cms','0','id du CMS utilisé en OPAC','a_general',0),(760,'pmb','expl_data','expl_cb,expl_cote,location_libelle,section_libelle,statut_libelle,tdoc_libelle','Colonne des exemplaires, dans l\'ordre donné, séparé par des virgules : expl_cb,expl_cote,location_libelle,section_libelle,statut_libelle,tdoc_libelle #n : id des champs personnalisés \r\n expl_cb est obligatoire et sera ajouté si absent','',0),(761,'pmb','expl_display_location_without_expl','0','Affichage de la liste des localisations sans exemplaire\n 0: Non\n 1: oui','',0),(762,'opac','show_group_checkout','0','Le responsable du groupe de lecteur voit les prêts de son groupe\n 0: Non\n 1: oui','a_general',0),(763,'opac','facette_in_bandeau_2','0','La navigation par facettes apparait dans le bandeau ou dans le bandeau 2\n0 : dans le bandeau\n1 : Dans le bandeau 2','c_recherche',0),(764,'opac','autolevel2','1','0 : mode normal de recherche.\n1 : Affiche le résultat de la recherche tous les champs après calcul du niveau 1 de recherche.\n2 : Affiche directement le résultat de la recherche tous les champs sans passer par le calcul du niveau 1 de recherche.','c_recherche',0),(765,'opac','first_page_params','','Structure Json récapitulant les paramètres à initialiser pour la page d\'accueil :\nExemple : \n{\n\"lvl\":\"cmspage\",\n\"pageid\":2\n}','b_aff_general',0),(766,'opac','show_links_invisible_docnums','0','Afficher les liens vers les documents numériques non visible en mode non connecté. (Ne fonctionne pas avec les droits d\'accès).\n 0 : Non.\n1 : Oui.','e_aff_notice',0),(767,'pmb','img_folder','','Répertoire de stockage des images','',0),(768,'pmb','img_url','','URL d\'accès du répertoire des images (pmb_img_folder)','',0),(769,'pmb','book_pics_msg','','Message sur le survol des vignettes des notices correspondant au chemin fourni par le paramètre book_pics_url','',0),(770,'opac','book_pics_msg','','Message sur le survol des vignettes des notices correspondant au chemin fourni par le paramètre book_pics_url','e_aff_notice',0),(771,'opac','visionneuse_alert_doctype','','Liste des types de documents pour lesquels une alerte est générée (séparés par une virgule).','m_photo',0),(772,'pmb','archive_warehouse','0','Identifiant de l\'entrepôt d\'archivage à la suppression des notices.','',0),(773,'pmb','printer_name','','Nom de l\'imprimante de ticket de prêt, utilisant l\'applet jzebra. Le nom de l\'imprimante doit correspondre à la class développée spécifiquement pour la piloter.\nExemple: Nommer l\'imprimante \'metapace\' pour utiliser le driver classes/printer/metapace.class.php','',0),(774,'empr','groupes_localises','0','Groupes de lecteurs localisés par rapport au responsable \n0: Non \n1: oui','',0),(775,'opac','allow_simili_search','0','Activer les recherches similaires sur une notice :\n0 : Non\n1 : Activer la recherche \"Dans le même rayon\" et \"Peut-être aimerez-vous\"\n2 : Activer seulement la recherche \"Dans le même rayon\"\n3 : Activer seulement la recherche \"Peut-être aimerez-vous\"','e_aff_notice',0),(776,'opac','notices_depliable_plus','plus.gif','Image à utiliser devant un titre de notice pliée','e_aff_notice',0),(777,'opac','notices_depliable_moins','minus.gif','Image à utiliser devant un titre de notice dépliée','e_aff_notice',0),(778,'pmb','pret_groupement','0','Activer le prêt d\'exemplaires regroupés en un seul lot. La gestion des groupes se gére en Circulation / Groupe d\'exemplaires :\n 0 : non \n 1 : oui','',0),(779,'transferts','regroupement_depart','0','Active le regroupement des départs\n 0: Non \n 1: Oui','',1),(780,'pmb','rfid_afi_security_codes','','Gestion de l\'antivol par le registre AFI.\nLa première valeur est celle de l\'antivol actif, la deuxième est celle de lantivol inactif.\nExemple: 07,C2  ','',0),(1166,'cms','url_base_cms_build','','url de construction du CMS de l\'OPAC','',0),(863,'categories','term_search_n_per_page','50','Número de descriptores mostrados por página en una búsqueda por descriptores en las categorías','',0),(945,'categories','show_only_last','0','En la fiche de un registro : \n 0 mostrar todo \n 1 : mostrar únicamente la última hoja del árbol de la categoría','',0),(1101,'acquisition','pdfdev_comment','0','Mostrar los comentarios: 0=no, 1=sí','pdfdev',0),(1163,'opac','simple_search_suggestions','0','Activer la suggestion de mots en recherche simple via la complétion\n0 : Désactiver\n1 : Activer\n\nNB : Cette fonction nécessite l\'installation de l\'extension levenshtein dans MySQL','c_recherche',0),(1164,'opac','stemming_active','0','Activer le stemming dans la recherche\n0 : Désactiver\n1 : Activer\n','c_recherche',0),(1167,'pdflettreretard','1before_list_group','Salvo error de nuestra parte, aún estás en posesión del o los documento(s) siguiente(s) cuyo préstamo ya ha finalizado :','Texto que aparecerá antes de la lista de documentos retrasados en la carta de reclamación','',0),(1168,'pdflettreretard','1after_list_group','Te agradeceríamos que te pusieras en contacto con nosotros por teléfono al $biblio_phone o por correo electrónico al $biblio_email para mirar la posibilidad de renovar estos préstamos o de devolver los documentos.','Texto que aparece después de la lista de documentos retrasados en la carta','',0),(1169,'pdflettreretard','1fdp_group','El responsable.','Signatario de la carta.','',0),(1170,'pdflettreretard','1madame_monsieur_group','Estimado usuario/usuaria,','Encabezamiento de la carta','',0),(1171,'opac','show_bandeau_2','1','Affichage du bandeau_2 ? \n 0 : Non\n 1 : Oui','f_modules',0),(1172,'opac','param_social_network','{\n			\"token\":\"ra-4d9b1e202c30dea1\",\n			\"version\":\"300\",\n			\"buttons\":[\n			{\n			\"attributes\":{\n			\"class\":\"addthis_button_facebook_like\",\n			\"fb:like:layout\":\"button_count\"\n			}\n			},\n			{\n			\"attributes\":{\n			\"class\":\"addthis_button_tweet\"\n			}\n			},\n			{\n			\"attributes\":{\n			\"class\":\"addthis_counter addthis_button_compact\"\n			}\n			}\n			],\n			\"toolBoxParams\":{\n			\"class\":\"addthis_toolbox addthis_default_style\"\n			},\n			\"addthis_share\":{\n			\n			},\n			\"addthis_config\":{\n			\"data_track_clickback\":\"true\",\n			\"ui_click\":\"true\"\n			}\n			}\n			','Tableau de paramètrage de l\'API de gestion des interconnexions aux réseaux sociaux.\n			Au format JSON.\n			Exemple :\n			{\n			\"token\":\"ra-4d9b1e202c30dea1\",\n			\"version\":\"300\",\n			\"buttons\":[\n			{\n			\"attributes\":{\n			\"class\":\"addthis_button_preferred_1\"\n			}\n			},\n			{\n			\"attributes\":{\n			\"class\":\"addthis_button_preferred_2\"\n			}\n			},\n			{\n			\"attributes\":{\n			\"class\":\"addthis_button_preferred_3\"\n			}\n			},\n			{\n			\"attributes\":{\n			\"class\":\"addthis_button_preferred_4\"\n			}\n			},\n			{\n			\"attributes\":{\n			\"class\":\"addthis_button_compact\"\n			}\n			},\n			{\n			\"attributes\":{\n			\"class\":\"addthis_counter addthis_bubble_style\"\n			}\n			}\n			],\n			\"toolBoxParams\":{\n			\"class\":\"addthis_toolbox addthis_default_style addthis_32x32_style\"\n			},\n			\"addthis_share\":{\n			\n			},\n			\"addthis_config\":{\n			\"data_track_addressbar\":true\n			}\n			}','e_aff_notice',0),(1197,'opac','default_sort_list','0 d_num_6,c_text_28;d_text_7','Afficher la liste déroulante de sélection d\'un tri ? \n 0 : Non \n 1 : Oui \nFaire suivre d\'un espace pour l\'ajout de plusieurs tris sous la forme : c_num_6|Libelle;d_text_7|Libelle 2;c_num_5|Libelle 3\n\nc pour croissant, d pour décroissant\nnum ou text pour numérique ou texte\nidentifiant du champ (voir fichier xml sort.xml)\nlibellé du tri (optionnel)','d_aff_recherche',0),(1173,'transferts','pret_demande_statut','0','Appliquer ce statut avant la validation','',1),(1174,'opac','perio_a2z_show_bulletin_notice','0','Affichage de la notice de bulletin dans le navigateur de périodiques','c_recherche',0),(1175,'pmb','procs_force_execution','0','Permettre le forçage de l\'exécution des procédures','',0),(1176,'opac','draggable','1','Permet d\'activer le glisser déposer dans le panier pour l\'affichage des notices à l\'OPAC','e_aff_notice',0),(1183,'cms','cache_ttl','1800','durée de vie du cache des cadres du portail (en secondes)','',0),(1177,'opac','meta_description','','Contenu du meta tag description pour les moteurs de recherche','b_aff_general',0),(1178,'opac','meta_keywords','','Contenu du meta tag keywords pour les moteurs de recherche','b_aff_general',0),(1179,'opac','meta_author','','Contenu du meta tag author pour les moteurs de recherche','b_aff_general',0),(1180,'pmb','html_allow_expl_cote','0','Autoriser le code HTML dans les cotes exemplaires ? \n 0 : non \n 1','',0),(1181,'pmb','default_style_addon','','Ajout de styles CSS aux feuilles déjà incluses ?\n Ne mettre que le code CSS, exemple:  body {background-color: #FF0000;}','',0),(1182,'pmb','serialcirc_subst','','Nom du fichier permettant de personnaliser l\'impression de la liste de circulation des périodiques','',0),(1184,'pmb','serial_thumbnail_url_article','0','Préremplissage de l\'url de la vignette des dépouillements avec l\'url de la vignette de la notice mère en catalogage des périodiques ? \n 0 : Non \n 1 : Oui','',0),(1185,'pmb','mail_delay','0','Temps d\'attente en millisecondes entre chaque mail envoyé lors d\'un envoi groupé. \n 0 : Pas d\'attente','',0),(1186,'pmb','curl_timeout','5','Timeout cURL (en secondes) pour la vérification des liens','',1),(1187,'empr','allow_prolong_members_group','0','Autoriser la prolongation groupée des adhésions des membres d\'un groupe ? \n 0 : Non \n 1 : Oui','',0),(1188,'thesaurus','auto_index_notice_fields','','Liste des champs de notice à utiliser pour l\'indexation automatique.\n\nSyntaxe: nom_champ=poids_indexation;\n\nLes noms des champs sont ceux précisés dans le fichier XML \"pmb/includes/notice/notice.xml\"\nLe poids de l\'indexation est une valeur de 0.00 à 1. (Si rien n\'est précisé, le poids est de 1)\n\nExemple :\n\ntit1=1.00;n_resume=0.5;','categories',0),(1189,'thesaurus','auto_index_search_param','','Surchage des paramètres de recherche de l\'indexation automatique.\nSyntaxe: param=valeur;\n\nListes des parametres:\n\nmax_relevant_words = 20 (nombre maximum de mots et de lemmes de la notice à prendre en compte pour le calcul)\n\nautoindex_deep_ratio = 0.05 (ratio sur la profondeur du terme dans le thésaurus)\nautoindex_stem_ratio = 0.80 (ratio de pondération des lemmes / aux mots)\n\nautoindex_max_up_distance = 2 (distance maximum de recherche dans les termes génériques du thésaurus)\nautoindex_max_up_ratio = 0.01 (pondération sur les termes génériques)\n\nautoindex_max_down_distance = 2 (distance maximum de recherche dans les termes spécifiques du thésaurus)\nautoindex_max_down_ratio = 0.01 (pondération sur les termes spécifiques)\n\nautoindex_see_also_ratio = 0.01 (surpondération sur les termes voir aussi du thésaurus)\n\nautoindex_distance_type = 1 (calcul de distance de 1 à 4)\nautoindex_distance_ratio = 0.50 (ratio de pondération sur la distance entre les mots trouvés et les termes d\'une expression du thésaurus)\n\nmax_relevant_terms = 10 (nombre maximum de termes retournés)','categories',0),(1190,'empr','abonnement_default_debit','0','Choix par défaut pour la prolongation des lecteurs. \n 0 : Ne pas débiter l\'abonnement \n 1 : Débiter l\'abonnement sans la caution \n 2 : Débiter l\'abonnement et la caution','',0),(1214,'demandes','notice_auto','0','Création automatique de la notice de demande :\n0 : Non\n1 : Oui','',0),(1215,'demandes','default_action','1','Création par défaut d\'une action lors de la validation de la demande :\n0 : Non\n1 : Oui','',0),(1216,'pmb','synchro_rdf','0','Activer la synchronisation rdf\n 0 : non \n 1 : oui (l\'activation de ce paramètre nécessite une ré-indexation)','',0),(1192,'opac','print_template_default','0','En impression de panier, identifiant du template de notice utilisé par défaut. Si vide ou à 0, le template classique est utilisé','a_general',0),(1193,'pmb','show_permalink','0','Afficher le lien permanent de l\'OPAC en gestion ? \n 0 : Non.\n 1 : Oui.','',0),(1194,'pmb','expl_show_lastempr','1','Afficher l\'emprunteur précédent sur la fiche exemplaire ? \n 0 : Non.\n 1 : Oui.','',0),(1195,'pmb','gestion_financiere_caisses','0','Activer la gestion de caisses en gestion financière? \n 0 : Non.\n 1 : Oui.','',0),(1196,'pmb','diarization_docnum','0','Activer la segmentation des documents numériques vidéo ou audio 0 : non activée 1 : activée','',0),(1198,'opac','default_sort_display','0','Afficher le libellé du tri appliqué par défaut en résultat de recherche ? \n 0 : Non \n 1 : Oui','d_aff_recherche',0),(1199,'opac','show_bannettes','0','Affichage des bannettes en page d\'accueil OPAC.\n 0 : Non.\n 1 : Oui.','f_modules',0),(1200,'opac','facettes_ajax','1','Charger les facettes en ajax\n0 : non\n1 : oui','c_recherche',0),(1201,'opac','search_all_keep_empty_words','1','Conserver les mots vides pour les autorités dans la recherche tous les champs\n0 : non\n1 : oui','c_recherche',0),(1202,'pmb','pret_already_loaned','0','Activer le piège en prêt si le document a déjà été emprunté par le lecteur. Nécessite l\'activation de l\'archivage des prêts\n0 : non\n1 : oui','',0),(1204,'opac','nb_notices_similaires','6','Nombre de notices similaires affichées lors du dépliage d\'une notice.\nValeur max = 6.','e_aff_notice',0),(1205,'opac','notice_reduit_format_similaire','1','Format d\'affichage des réduits de notices similaires :\n 0 = titre+auteur principal\n 1 = titre+auteur principal+date édition\n 2 = titre+auteur principal+date édition + ISBN\n 3 = titre seul\n P 1,2,3 = tit+aut+champs persos id 1 2 3\n E 1,2,3 = tit+aut+édit+champs persos id 1 2 3\n T = tit1+tit4\n 4 = titre+titre parallèle+auteur principal\n H 1 = id d\'un template de notice','e_aff_notice',0),(1206,'opac','search_noise_limit_type','0','Ecrêter les résulats de recherche en fonction de la pertinence. \n0 : Non \n1 : Retirer du résultat tout ce qui est en dessous de la moyenne - l\'écart-type\n2,ratio : Retirer du résultat tout ce qui est en dessous de la moyenne - un ratio de l\'écart-type (ex: 2,1.96)\n3,ratio : Retirer du résultat tout ce qui est dessous d\'un ratio de la pertinence max (ex: 3,0.25 élimine tout ce qui est inférieur à 25% de la plus forte pertinence)','c_recherche',0),(1207,'opac','search_relevant_with_frequency','0','Utiliser la fréquence d\'apparition des mots dans les notices pour le calcul de la pertinence.\n0 : Non \n1 : Oui','c_recherche',0),(1208,'empr','prolong_calc_date_adhes_depassee','0','Si la date d\'adhésion est dépassée, le calcul de la prolongation se fait à partir de :\n 0 : la date de fin d\'adhésion\n 1 : la date du jour','',0),(1209,'opac','bannette_priv_periodicite','15','Périodicité d\'envoi par défaut en création de bannette privée (en jours)','l_dsi',0),(1210,'opac','show_subscribed_bannettes','0','Affichage des bannettes auxquelles le lecteur est abonné en page d\'accueil OPAC :\n0 : Non.\n1 : Oui.','f_modules',0),(1211,'opac','show_public_bannettes','0','Affichage des bannettes sélectionnées en page d\'accueil OPAC :\n0 : Non.\n1 : Oui.','f_modules',0),(1217,'faq','active','0','Module \'FAQ\' activé.\n 0 : Non.\n 1 : Oui.','',0),(1218,'opac','websubscribe_num_carte_auto','','Numéro de carte de lecteur automatique ?\n 2,a,b,c: Oui avec préfixe: a=longueur du préfixe, b=nombre de chiffres de la partie numérique, c=préfixe fixé (facultatif)\n 3,fonction: fonction de génération spécifique dans fichier nommé de la même façon, à placer dans pmb/opac_css/circ/empr','f_modules',0),(1219,'pdfcartelecteur','printer_card_handler','','Gestionnaire d\'impression :\n\n 1 = script \"print_cb.php\"\n 2 = applet jzebra\n 3 = requête ajax','',0),(1220,'pdfcartelecteur','printer_card_name','','Nom de l\'imprimante.','',0),(1221,'pdfcartelecteur','printer_card_url','','Adresse de l\'imprimante.','',0),(1222,'pmb','notice_img_folder_id','0','Identifiant du répertoire d\'upload des vignettes de notices','',0),(1223,'pmb','compare_notice_template','0','Choix du template d\'affichage des notices en mode comparaison.','',1),(1224,'pmb','compare_notice_nb','5','Nombre de notices à afficher et à raffraichir en mode comparaison.','',1),(1225,'opac','compare_notice_active','1','Activer le comparateur de notices','c_recherche',0),(1226,'pmb','autorites_verif_js','','Script de vérification de saisie des autorités','',0),(1227,'opac','resa_cart','1','Paramètre pour masquer/afficher la reservation par panier\n0 : Non \n1 : Oui','a_general',0),(1228,'pmb','search_stemming_active','0','Activer le stemming dans la recherche\n0 : Désactiver\n1 : Activer','search',0),(1229,'pmb','search_exclude_fields','','Identifiants des champs à exclure de la recherche tous les champs (liste dispo dans le fichier includes/indexation/champ_base.xml)','search',0),(1230,'pmb','search_noise_limit_type','0','Ecrêter les résulats de recherche en fonction de la pertinence. \n0 : Non \n1 : Retirer du résultat tout ce qui est en dessous de la moyenne - l\'écart-type\n2,ratio : Retirer du résultat tout ce qui est en dessous de la moyenne - un ratio de l\'écart-type (ex: 2,1.96)\n3,ratio : Retirer du résultat tout ce qui est dessous d\'un ratio de la pertinence max (ex: 3,0.25 élimine tout ce qui est inférieur à 25% de la plus forte pertinence)','search',0),(1231,'pmb','search_relevant_with_frequency','0','Utiliser la fréquence d\'apparition des mots dans les notices pour le calcul de la pertinence.\n0 : Non \n1 : Oui','search',0),(1232,'pmb','allow_term_troncat_search','0','Troncature à droite automatique :\n0 : Non \n1 : Oui','search',0),(1233,'pmb','search_cache_duration','0','Durée de validité (en secondes) du cache des recherches','search',0),(1234,'pmb','print_expl_default','0','En impression de panier, imprimer les exemplaires est coché par défaut \n 0 : Non \n 1 : Oui','',0),(1235,'thesaurus','concepts_active','0','Active ou non l\'utilisation des concepts:\n0 : Non\n1 : Oui','concepts',0),(1236,'thesaurus','concepts_affichage_ordre','0','Paramétrage de l\'ordre d\'affichage des concepts d\'une notice.\nPar ordre alphabétique: 0(par défaut)\nPar ordre de saisie: 1','concepts',0),(1237,'thesaurus','concepts_concept_in_line','0','Affichage des concepts en ligne.\n 0 : Non.\n 1 : Oui.','concepts',0),(1238,'opac','collstate_data','','Colonne des états des collections, dans l\'ordre donné, séparé par des virgules : location_libelle,emplacement_libelle,cote,type_libelle,statut_opac_libelle,origine,state_collections,archive,lacune,surloc_libelle,note\nLes valeurs possibles sont les propriétés de la classe PHP \"pmb/opac_css/classes/collstate.class.php\".','e_aff_notice',0),(1239,'thesaurus','ontology_filemtime','0','Paramètre caché pour conservation de la date de dernière modification de l\'ontologie','ontologie',1),(1240,'gestion_acces','empr_docnum','0','Gestion des droits d\'accès des emprunteurs aux documents numériques\n0 : Non.\n1 : Oui.','',0),(1241,'gestion_acces','empr_docnum_def','0','Valeur par défaut en modification de document numérique pour les droits d\'accès emprunteurs - documents numériques\n0 : Recalculer.\n1 : Choisir.','',0),(1242,'transferts','retour_action_resa','1','Génére un transfert pour répondre à une réservation lors du retour de l\'exemplaire\n 0: Non\n 1: Oui','',1),(1243,'pmb','logs_exclude_robots','1','Exclure les robots dans les logs OPAC ?\n 0: Non\n 1: Oui. \nFaire suivre d\'une virgule pour éventuellement exclure les logs OPAC provenant de certaines adresses IP, elles-mêmes séparées par des virgules (ex : 1,127.0.0.1,192.168.0.1).','',0),(1244,'pmb','map_activate','0','Activation du géoréférencement','map',0),(1245,'pmb','map_max_holds','250,0','Dans l\'ordre donné séparé par une virgule: Nombre limite d\'emprises affichées, mode de clustering \nValeurs possibles pour le mode :\n\n0 => Clustering standard avec augmentation dynamique des seuils jusqu\'a atteindre le nombre maximum d\'emprises affichées\n\n1 => Clusterisation de toutes les emprises','map',0),(1259,'opac','map_holds_record_color','#D6A40F','Couleur des emprises associées à des notices','map',0),(1246,'pmb','map_holds_record_color','#D6A40F','Couleur des emprises associées à des notices','map',0),(1247,'pmb','map_holds_authority_color','#D60F0F','Couleur des emprises associées à des autorités','map',0),(1248,'pmb','map_base_layer_type','OSM','Fonds de carte à utiliser.\nValeurs possibles :\nOSM           => Open Street Map\nWMS           => The Web Map Server base layer type selector.\nGOOGLE        => Google\nARCGIS        =>The ESRI ARCGis base layer selector.\n','map',0),(1249,'pmb','map_base_layer_params','','Structure JSON à passer au fond de carte\nexemple :\n{\n \"name\": \"Nom du fond de carte\",\n \"url\": \"url du fond de carte\",\n \"options\":{\n  \"layers\": \"MONDE_MOD1\"\n }\n}','map',0),(1250,'pmb','map_size_search_edition','800*480','Taille de la carte en saisie de recherche','map',0),(1251,'pmb','map_size_search_result','800*480','Taille de la carte en résultat de recherche','map',0),(1252,'pmb','map_size_notice_view','800*480','Taille de la carte en visualisation de notice','map',0),(1253,'pmb','map_size_notice_edition','800*480','Taille de la carte en édition de notice','map',0),(1254,'pmb','notice_img_pics_max_size','150','Taille maximale des vignettes uploadées dans les notices, en largeur ou en hauteur','',0),(1255,'opac','map_activate','0','Activation du géoréférencement','map',0),(1256,'pmb','psexec_cmd','psexec -d','Paramètres de lancement de psexec (planificateur sous windows)\r\n\nAjouter l\'option -accepteula sur les versions les plus récentes. ','',0),(1257,'pmb','editorial_dojo_editor','1','Activation de l\'éditeur DoJo dans le contenu éditorial:\n 0 : non \n 1 : oui','',0),(1258,'opac','map_max_holds','250,0','Dans l\'ordre donné séparé par une virgule: Nombre limite d\'emprises affichées, mode de clustering \nValeurs possibles pour le mode :\n\n0 => Clustering standard avec augmentation dynamique des seuils jusqu\'a atteindre le nombre maximum d\'emprises affichées\n\n1 => Clusterisation de toutes les emprises','map',0),(1260,'opac','map_holds_authority_color','#D60F0F','Couleur des emprises associées à des autorités','map',0),(1261,'opac','map_size_search_edition','800*480','Taille de la carte en saisie de recherche','map',0),(1262,'opac','map_size_search_result','800*480','Taille de la carte en résultat de recherche','map',0),(1263,'opac','map_size_notice_view','800*480','Taille de la carte en visualisation de notice','map',0),(1264,'opac','map_base_layer_type','OSM','Fonds de carte à utiliser.\nValeurs possibles :\nOSM           => Open Street Map\nWMS           => The Web Map Server base layer type selector.\nGOOGLE        => Google\nARCGIS        =>The ESRI ARCGis base layer selector.\n','map',0),(1265,'opac','map_base_layer_params','','Structure JSON à passer au fond de carte\nexemple :\n{\n \"name\": \"Nom du fond de carte\",\n \"url\": \"url du fond de carte\",\n \"options\":{\n  \"layers\": \"MONDE_MOD1\"\n }\n}','map',0),(1266,'acquisition','budget_show_all','0','Sélection d\'une rubrique budgétaire en commande : toutes les afficher ?\n 0: Non (par pagination)\n 1: Oui.','',0),(1267,'pmb','abt_label_perio','0','Création d\'un abonnement : reprendre le nom du périodique ?\n 0: Non \n 1: Oui.','',0),(1268,'acquisition','show_abt_in_cmde','0','Afficher l\'abonnement dans les lignes de la commande ?\n 0: Non \n 1: Oui.','',0),(1269,'pmb','nomenclature_record_children_link','','Type de relation entre une notice de nomenclature et ses notices filles.','',0),(1270,'pmb','nomenclature_activate','0','Activation des nomenclatures:\n 0 : non \n 1 : oui','',0),(1271,'demandes','email_generic','','Information par un email générique de l\'évolution des demandes.\n 1,adrmail@mail.fr : Envoi une copie uniquement pour toutes les nouvelles demandes\n 2,adrmail@mail.fr : Envoi une copie uniquement des mails envoyés aux personnes affectées\n 3,adrmail@mail.fr : Envoi une copie dans les 2 cas précédents\n ','',0),(1272,'opac','demandes_affichage_simplifie','0','Active le format simplifié des demandes en Opac:\n 0 : non \n 1 : oui','a_general',0),(1273,'opac','demandes_no_action','0','Interdire l\'ajout d\'une action en Opac:\n 0 : non \n 1 : oui','a_general',0),(1274,'pmb','map_hold_ratio_min','4','Ratio minimum d\'occupation en pourcentage d\'une emprise pour s\'afficher','map',0),(1275,'pmb','map_hold_ratio_max','75','Ratio maximum d\'occupation en pourcentage d\'une emprise pour s\'afficher','map',0),(1276,'pmb','map_hold_distance','10','Rapport de distance entre deux points pour les agréger','map',0),(1277,'opac','modules_search_concept','0','Recherche dans les concepts : \n 0 : interdite, \n 1 : autorisée, \n 2 : autorisée et validée par défaut','c_recherche',0),(1278,'opac','map_hold_ratio_min','4','Ratio minimum d\'occupation en pourcentage d\'une emprise pour s\'afficher','map',0),(1279,'opac','map_hold_ratio_max','75','Ratio maximum d\'occupation en pourcentage d\'une emprise pour s\'afficher','map',0),(1280,'opac','map_hold_distance','10','Rapport de distance entre deux points pour les agréger','map',0),(1281,'ldap','encoding_utf8','0','Les informations du LDAP sont en utf-8 ?\n 0: Non \n 1: Oui.','',0),(1282,'opac','script_analytics','','Code Javascript d\'analyse d\'audience (Par exemple pour Google Analytics, XiTi,..).','a_general',0),(1283,'opac','accessibility','1','Accessibilité activée.\n 0 : Non.\n 1 : Oui.','a_general',0),(1284,'pmb','newrecord_timeshift','0','Nombre de jours de conservation des notices en tant que nouveauté.','',0),(1285,'opac','notices_format_django_directory','','Nom du répertoire de templates django à utiliser en affichage de notice.\nLaisser vide pour utiliser le common.','e_aff_notice',0),(1286,'opac','allow_download_docnums','1','Autoriser le téléchargement des documents numériques.\n 0 : Non.\n 1 : Individuellement (un par un).\n 2 : Archive ZIP.','a_general',0),(1287,'opac','notices_display_modes','','Nom du fichier xml de paramétrage du choix du mode d\'affichage des notices à l\'OPAC.\nPar défaut : display_modes_exemple.xml dans /opac_css/includes/records/','d_aff_recherche',0),(1288,'opac','url_more_about_cookies','','Lien pour en savoir plus sur l\'utilisation des cookies et des traceurs','a_general',0),(1289,'opac','authorities_templates_folder','./includes/templates/authorities/common','Repertoire des templates utilisés pour l\'affichage des autorités en OPAC','',1),(1290,'dsi','private_bannette_notices_template','0','Id du template de notice utilisé par défaut en diffusion de bannettes privées. Si vide ou à 0, le template classique est utilisé.','',0),(1291,'cms','active_image_cache','0','Activer la mise en cache des vignettes du contenu éditorial.\n 0: non \n 1:Oui \nAttention, si l\'OPAC ne se trouve pas sur le même serveur que la gestion, la purge du cache ne peut pas se faire automatiquement','',0),(1292,'opac','empr_password_salt','','Phrase pour le hashage des mots de passe emprunteurs','a_general',1),(1293,'pmb','notices_show_dates','0','Afficher les dates des notices ? \n 0 : Aucune date.\n 1 : Date de création et modification.','',0),(1294,'opac','compress_css','0','Activer la compilation et la compression des feuilles de styles.\n0: Non\n1: Oui','a_general',0),(1295,'pmb','resa_planning_toresa','10','Délai d\'alerte pour le transfert des prévisions en réservations (en jours). ','',0),(1296,'pmb','serialcirc_simple_print_script','','Script de construction d\'étiquette de circulation simplifiée de périodique','',0),(1297,'opac','max_results_on_a_page','500','Nombre maximum de notices à afficher sur une page, utile notamment quand la navigation est désactivée','d_aff_recherche',0),(1298,'pmb','mail_adresse_from','','Adresse d\'expédition des emails. Ce paramètre permet de forcer le From des mails envoyés par PMB. Le reply-to reste inchangé (mail de l\'utilisateur en DSI ou relance, mail de la localisation ou paramètre opac_biblio_mail à défaut).\nFormat : adresse_email;libellé\nExemple : pmb@sigb.net;PMB Services','',0),(1299,'opac','mail_adresse_from','','Adresse d\'expédition des emails. Ce paramètre permet de forcer le From des mails envoyés par PMB. Le reply-to reste inchangé (mail de l\'utilisateur en DSI ou relance, mail de la localisation ou paramètre opac_biblio_mail à défaut).\nFormat : adresse_email;libellé\nExemple : pmb@sigb.net;PMB Services','a_general',0),(1300,'opac','pret_prolongation_blocage','0','Bloquer la prolongation s\'il y a un niveau de relance validé sur le prêt ?\n0 : Non 1 : Oui','a_general',0),(1301,'opac','empr_export_loans','0','Afficher sur le compte emprunteur un bouton permettant d\'exporter les prêts dans un tableur ?\n0 : Non 1 : Oui','a_general',0),(1302,'opac','cookies_consent','1','Afficher le bandeau d\'acceptation des cookies et des traceurs ? \n0 : Non 1 : Oui','a_general',0);
/*!40000 ALTER TABLE `parametres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pclassement`
--

DROP TABLE IF EXISTS `pclassement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pclassement` (
  `id_pclass` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_pclass` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typedoc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_pclass`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pclassement`
--

LOCK TABLES `pclassement` WRITE;
/*!40000 ALTER TABLE `pclassement` DISABLE KEYS */;
INSERT INTO `pclassement` VALUES (1,'Dewey 100','abcdefgijklmr');
/*!40000 ALTER TABLE `pclassement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perio_relance`
--

DROP TABLE IF EXISTS `perio_relance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perio_relance` (
  `rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_abt_num` int(10) unsigned NOT NULL DEFAULT '0',
  `rel_date_parution` date NOT NULL DEFAULT '0000-00-00',
  `rel_libelle_numero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rel_comment_gestion` text COLLATE utf8_unicode_ci NOT NULL,
  `rel_comment_opac` text COLLATE utf8_unicode_ci NOT NULL,
  `rel_nb` int(10) unsigned NOT NULL DEFAULT '0',
  `rel_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`rel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perio_relance`
--

LOCK TABLES `perio_relance` WRITE;
/*!40000 ALTER TABLE `perio_relance` DISABLE KEYS */;
/*!40000 ALTER TABLE `perio_relance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planificateur`
--

DROP TABLE IF EXISTS `planificateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planificateur` (
  `id_planificateur` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num_type_tache` int(11) NOT NULL,
  `libelle_tache` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc_tache` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_user` int(11) NOT NULL,
  `param` text COLLATE utf8_unicode_ci,
  `statut` tinyint(1) unsigned DEFAULT '0',
  `rep_upload` int(8) DEFAULT NULL,
  `path_upload` text COLLATE utf8_unicode_ci,
  `perio_heure` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `perio_minute` varchar(28) COLLATE utf8_unicode_ci DEFAULT '01',
  `perio_jour_mois` varchar(128) COLLATE utf8_unicode_ci DEFAULT '*',
  `perio_jour` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `perio_mois` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calc_next_heure_deb` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calc_next_date_deb` date DEFAULT NULL,
  PRIMARY KEY (`id_planificateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planificateur`
--

LOCK TABLES `planificateur` WRITE;
/*!40000 ALTER TABLE `planificateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `planificateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pret`
--

DROP TABLE IF EXISTS `pret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pret` (
  `pret_idempr` int(10) unsigned NOT NULL DEFAULT '0',
  `pret_idexpl` int(10) unsigned NOT NULL DEFAULT '0',
  `pret_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pret_retour` date DEFAULT NULL,
  `pret_arc_id` int(10) unsigned NOT NULL DEFAULT '0',
  `niveau_relance` int(1) NOT NULL DEFAULT '0',
  `date_relance` date DEFAULT '0000-00-00',
  `printed` int(1) NOT NULL DEFAULT '0',
  `retour_initial` date DEFAULT '0000-00-00',
  `cpt_prolongation` int(1) NOT NULL DEFAULT '0',
  `pret_temp` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `short_loan_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pret_idexpl`),
  KEY `i_pret_idempr` (`pret_idempr`),
  KEY `i_pret_arc_id` (`pret_arc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pret`
--

LOCK TABLES `pret` WRITE;
/*!40000 ALTER TABLE `pret` DISABLE KEYS */;
/*!40000 ALTER TABLE `pret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pret_archive`
--

DROP TABLE IF EXISTS `pret_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pret_archive` (
  `arc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arc_debut` datetime DEFAULT '0000-00-00 00:00:00',
  `arc_fin` datetime DEFAULT NULL,
  `arc_id_empr` int(10) unsigned NOT NULL DEFAULT '0',
  `arc_empr_cp` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `arc_empr_ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `arc_empr_prof` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `arc_empr_year` int(4) unsigned DEFAULT '0',
  `arc_empr_categ` smallint(5) unsigned DEFAULT '0',
  `arc_empr_codestat` smallint(5) unsigned DEFAULT '0',
  `arc_empr_sexe` tinyint(3) unsigned DEFAULT '0',
  `arc_empr_statut` int(10) unsigned NOT NULL DEFAULT '1',
  `arc_empr_location` int(6) unsigned NOT NULL DEFAULT '0',
  `arc_type_abt` int(6) unsigned NOT NULL DEFAULT '0',
  `arc_expl_typdoc` int(5) unsigned DEFAULT '0',
  `arc_expl_cote` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `arc_expl_statut` smallint(5) unsigned DEFAULT '0',
  `arc_expl_location` smallint(5) unsigned DEFAULT '0',
  `arc_expl_location_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `arc_expl_location_retour` int(10) unsigned NOT NULL DEFAULT '0',
  `arc_expl_codestat` smallint(5) unsigned DEFAULT '0',
  `arc_expl_owner` mediumint(8) unsigned DEFAULT '0',
  `arc_expl_section` int(5) unsigned NOT NULL DEFAULT '0',
  `arc_expl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `arc_expl_notice` int(10) unsigned NOT NULL DEFAULT '0',
  `arc_expl_bulletin` int(10) unsigned NOT NULL DEFAULT '0',
  `arc_groupe` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `arc_niveau_relance` int(1) unsigned DEFAULT '0',
  `arc_date_relance` date NOT NULL DEFAULT '0000-00-00',
  `arc_printed` int(1) unsigned DEFAULT '0',
  `arc_cpt_prolongation` int(1) unsigned DEFAULT '0',
  `arc_short_loan_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`arc_id`),
  KEY `i_pa_expl_id` (`arc_expl_id`),
  KEY `i_pa_idempr` (`arc_id_empr`),
  KEY `i_pa_expl_notice` (`arc_expl_notice`),
  KEY `i_pa_expl_bulletin` (`arc_expl_bulletin`),
  KEY `i_pa_arc_fin` (`arc_fin`),
  KEY `i_pa_arc_empr_categ` (`arc_empr_categ`),
  KEY `i_pa_arc_expl_location` (`arc_expl_location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pret_archive`
--

LOCK TABLES `pret_archive` WRITE;
/*!40000 ALTER TABLE `pret_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `pret_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pret_custom`
--

DROP TABLE IF EXISTS `pret_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pret_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `titre` varchar(255) DEFAULT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'text',
  `datatype` varchar(10) NOT NULL DEFAULT '',
  `options` text,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `filters` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pret_custom`
--

LOCK TABLES `pret_custom` WRITE;
/*!40000 ALTER TABLE `pret_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `pret_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pret_custom_lists`
--

DROP TABLE IF EXISTS `pret_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pret_custom_lists` (
  `pret_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `pret_custom_list_value` varchar(255) DEFAULT NULL,
  `pret_custom_list_lib` varchar(255) DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `i_pret_custom_champ` (`pret_custom_champ`),
  KEY `i_pret_champ_list_value` (`pret_custom_champ`,`pret_custom_list_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pret_custom_lists`
--

LOCK TABLES `pret_custom_lists` WRITE;
/*!40000 ALTER TABLE `pret_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `pret_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pret_custom_values`
--

DROP TABLE IF EXISTS `pret_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pret_custom_values` (
  `pret_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `pret_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `pret_custom_small_text` varchar(255) DEFAULT NULL,
  `pret_custom_text` text,
  `pret_custom_integer` int(11) DEFAULT NULL,
  `pret_custom_date` date DEFAULT NULL,
  `pret_custom_float` float DEFAULT NULL,
  KEY `i_pret_custom_champ` (`pret_custom_champ`),
  KEY `i_pret_custom_origine` (`pret_custom_origine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pret_custom_values`
--

LOCK TABLES `pret_custom_values` WRITE;
/*!40000 ALTER TABLE `pret_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `pret_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs`
--

DROP TABLE IF EXISTS `procs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs` (
  `idproc` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `requete` blob NOT NULL,
  `comment` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `autorisations` mediumtext COLLATE utf8_unicode_ci,
  `parameters` text COLLATE utf8_unicode_ci,
  `num_classement` int(5) unsigned NOT NULL DEFAULT '0',
  `proc_notice_tpl` int(2) unsigned NOT NULL DEFAULT '0',
  `proc_notice_tpl_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idproc`),
  KEY `idproc` (`idproc`)
) ENGINE=MyISAM AUTO_INCREMENT=363 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs`
--

LOCK TABLES `procs` WRITE;
/*!40000 ALTER TABLE `procs` DISABLE KEYS */;
INSERT INTO `procs` VALUES (169,'Autorisation d\'utiliser toutes les procédures pour tous les utilisateurs','update procs set autorisations=concat(\' \',(select group_concat(userid separator \' \') from users order by userid),\' \')','Permet à tous les utilisateurs d\'utiliser toutes les procédures',' 1 ','',2,0,''),(170,'Autorisation d\'utiliser toutes les procédures paniers catalogue pour tous les utilisateurs','update caddie_procs set autorisations=concat(\' \',(select group_concat(userid separator \' \') from users order by userid),\' \')','Permet à tous les utilisateurs d\'utiliser toutes les procédures des paniers catalogue',' 1 ','',2,0,''),(171,'Autorisation d\'utiliser toutes les procédures paniers lecteurs pour tous les utilisateurs','update empr_caddie_procs set autorisations=concat(\' \',(select group_concat(userid separator \' \') from users order by userid),\' \')','Permet à tous les utilisateurs d\'utiliser toutes les procédures des paniers lecteurs',' 1 ','',2,0,''),(184,'Nombre de lecteurs par catégorie','select libelle as \"Cat\�gorie Lecteur\", count(*) as \"Nb lecteurs\" from empr left join empr_categ on empr_categ=id_categ_empr where empr_categ in (!!categ_lecteur!!) group by libelle order by libelle','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"categ_lecteur\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie lecteurs]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by libelle</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(185,'Nombre de lecteurs par code statistique','select libelle as \"Code statistique\", count(*) as \"Nb lecteurs\" from empr left join empr_codestat on empr_codestat=idcode where empr_codestat in (!!codestat_lecteur!!) group by libelle order by libelle','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"codestat_lecteur\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code statistique]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode,libelle from empr_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(186,'Nombre de lecteurs par statut','select statut_libelle as \"Statut\", count(*) as \"Nb lecteurs\" from empr left join empr_statut on empr_statut=idstatut where empr_statut in (!!statut_lecteur!!) group by idstatut order by statut_libelle','',' 1 ','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"statut_lecteur\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Statut lecteur]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idstatut, statut_libelle from empr_statut order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(192,'Catalogue : nombre de notices monographies (total, créées dans l\'année et importées dans l\'année)','select count(distinct n1.notice_id) as \'Nombre total de notices\' from notices as n1 left join exemplaires on n1.notice_id=expl_notice left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and n1.niveau_biblio=\'m\';\r\nselect count(distinct n2.notice_id) as \"Dont cr\�\�es dans l\'ann\�e\" from notices as n2 left join exemplaires on n2.notice_id=expl_notice where n2.niveau_biblio=\'m\' and year(n2.create_date)=!!annee!! and expl_location in (!!choixlocation!!);\r\nselect count(distinct n3.notice_id) as \"Dont import\�es dans l\'ann\�e\" from notices as n3 left join exemplaires on n3.notice_id=expl_notice left join docs_location on expl_location=idlocation where n3.niveau_biblio=\'m\' and year(n3.create_date)=!!annee!! and n3.origine_catalogage not in (1,3) and expl_location in (!!choixlocation!!);','A exécuter en partie Administration>Actions personnalisables','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(193,'Prêts : Compte des prêts / catégorie de lecteurs / type de document','SELECT if(arc_expl_notice!=0,case when typdoc=\'a\' then \'Livres\' when typdoc=\'j\' then \'Documents sonores : musique\' when typdoc=\'i\' then \'Documents sonores : livres\' when typdoc=\'g\' then \'Documents audiovisuels\' when typdoc=\'l\' then \'Livres \�lectroniques\' else \'Autres documents\' END,\'Publication en s\�rie\') as \'Type de document\', CASE WHEN libelle IS NULL THEN \" Cat\�gorie de lecteurs inconnue\" ELSE libelle END as Cat\�gorie, count(distinct arc_id) as \"Nombre de pr\�ts\" FROM pret_archive left join notices on arc_expl_notice=notice_id LEFT JOIN empr_categ ON id_categ_empr = arc_empr_categ left join docs_location on arc_expl_location=idlocation where year(arc_debut) = \'!!anneee!!\' and arc_expl_location in (!!choixlocation!!) group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"anneee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(194,'Dépenses d\'acquisitions documentaires','select sum(expl_prix) as \'D\�penses acquisitions : Livres imprim\�s\' from exemplaires left join notices on expl_notice=notice_id left join expl_custom_values on (expl_id=expl_custom_origine and expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' and year(expl_custom_date)=!!choixannee!!;\r\nselect sum(expl_prix) as \'D\�penses acquisitions : Publications en s\�rie imprim\�es\' from exemplaires left join bulletins on expl_bulletin=bulletin_id left join notices on bulletin_notice=notice_id left join expl_custom_values on (expl_id=expl_custom_origine and expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_bulletin!=0 and niveau_biblio=\'s\' and year(expl_custom_date)=!!choixannee!!;\r\nselect sum(expl_prix) as \'D\�penses acquisitions : Documents sonores\' from exemplaires left join notices on expl_notice=notice_id left join expl_custom_values on (expl_id=expl_custom_origine and expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc in (\'i\',\'j\') and niveau_biblio=\'m\' and year(expl_custom_date)=!!choixannee!!;\r\nselect sum(expl_prix) as \'D\�penses acquisitions : Documents audiovisuels\' from exemplaires left join notices on expl_notice=notice_id left join expl_custom_values on (expl_id=expl_custom_origine and expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'g\' and niveau_biblio=\'m\' and year(expl_custom_date)=!!choixannee!!;\r\nselect sum(expl_prix) as \'D\�penses acquisitions : Livres \�lectroniques\' from exemplaires left join notices on expl_notice=notice_id left join expl_custom_values on (expl_id=expl_custom_origine and expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'l\' and niveau_biblio=\'m\' and year(expl_custom_date)=!!choixannee!!;\r\nselect sum(expl_prix) as \'D\�penses acquisitions : Autres documents non \�lectroniques\' from exemplaires left join notices on expl_notice=notice_id left join expl_custom_values on (expl_id=expl_custom_origine and expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc not in (\'a\',\'g\',\'i\',\'j\',\'l\') and niveau_biblio=\'m\' and year(expl_custom_date)=!!choixannee!!;','Somme du champ prix exemplaire.','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(195,'Collections : Documents audiovisuels et Autres documents : Acquisitions','select origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \"Manuscrits : nombre d\'acquisitions\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'b\' and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! group by 1 order by 1;\r\nselect origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \"Documents cartographiques : nombre d\'acquisitions\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc in (\'e\',\'f\') and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! group by 1 order by 1;\r\nselect origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \"Musique imprim\�e : nombre d\'acquisitions\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc in (\'c\',\'d\') and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! group by 1 order by 1;\r\nselect origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \"Documents graphiques : nombre d\'acquisitions\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'k\' and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! group by 1 order by 1;\r\nselect origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \"Autres documents : nombre d\'acquisitions\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc in (\'r\',\'m\',\'l\') and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! group by 1 order by 1;\r\nselect origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \"Documents sonores : musique : nombre d\'acquisitions\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'j\' and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! group by 1 order by 1;\r\nselect origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \"Documents sonores : livres enregistr\�s : nombre d\'acquisitions\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'i\' and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! group by 1 order by 1;\r\nselect origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \"Documents audiovisuels : nombre d\'acquisitions\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'g\' and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! group by 1 order by 1;','A exécuter en partie Administration>actions personnalisables','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(196,'Collections : Acquisitions Imprimés : nombre de titres et d\'unités matérielles par propriétaire par code statistique','select codestat_libelle as \'Code statistique\', origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \'Livres Imprim\�s : Total Unit\�s Mat\�rielles\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! group by 1,2 order by 1,2;\r\nselect codestat_libelle as \'Code statistique\', origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \'Dont Unit\�s Mat\�rielles en Libre Acc\�s (Livres Imprim\�s)\' from exemplaires left join docs_statut on expl_statut=idstatut left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! and pret_flag=1 group by 1,2 order by 1,2;\r\nselect codestat_libelle as \'Code statistique\', origine.expl_custom_small_text as \'Origine\', count(distinct notice_id) as \'Livres Imprim\�s : Total Titres\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where  name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! group by 1,2 order by 1,2;\r\nselect codestat_libelle as \'Code statistique\', origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \'Dont Unit\�s Mat\�rielles publi\�es avant 1811 (Livres Imprim\�s)\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and name=\"date_acquisition\")) where expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! and year REGEXP \'^[0-9]\' and year NOT REGEXP \'[[:alpha:]]\' and year < 1811 group by 1,2 order by 1,2;\r\nselect codestat_libelle as \'Code statistique\', origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \'Dont Unit\�s Mat\�rielles publi\�es entre 1811 et 1914 (Livres Imprim\�s)\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' and year(date.expl_custom_date)=!!annee!! and year REGEXP \'^[0-9]\' and year NOT REGEXP \'[[:alpha:]]\' and year>=1810 and year <= 1914 group by 1,2 order by 1,2;\r\nselect codestat_libelle as \'Code statistique\', origine.expl_custom_small_text as \'Origine\', count(distinct expl_id) as \'Publications en s\�rie imprim\�es : Total Unit\�s Mat\�rielles\' from exemplaires left join bulletins on expl_bulletin=bulletin_id left join notices on bulletin_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_bulletin!=0 and niveau_biblio=\'s\' and year(date.expl_custom_date)=!!annee!! group by 1,2 order by 1,2;\r\nselect codestat_libelle as \'Code statistique\', origine.expl_custom_small_text as \'Origine\', count(distinct notice_id) as \'Publications en s\�rie imprim\�es : Total Titres\' from exemplaires left join bulletins on expl_bulletin=bulletin_id left join notices on bulletin_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join expl_custom_values as origine on (expl_id=origine.expl_custom_origine and origine.expl_custom_champ in (select idchamp from expl_custom where name=\"origine\")) left join expl_custom_values as date on (expl_id=date.expl_custom_origine and date.expl_custom_champ in (select idchamp from expl_custom where name=\"date_acquisition\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_bulletin!=0 and niveau_biblio=\'s\' and year(date.expl_custom_date)=!!annee!! group by 1,2 order by 1,2;','A exécuter en partie Administration>actions personnalisables','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(197,'Collections : Documents audiovisuels et Autres documents, Eliminations','select count(distinct expl_id) as \'Autres documents : Total Unit\�s Mat\�rielles Elimin\�es\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join expl_custom_values as datepilonnage on (expl_id=datepilonnage.expl_custom_origine and datepilonnage.expl_custom_champ in (select idchamp from expl_custom where name=\"date_pilon\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_statut=!!choixstatutpilon!! and expl_notice!=0 and typdoc in (\'b\',\'e\',\'f\',\'c\',\'d\',\'k\',\'r\',\'m\',\'l\') and niveau_biblio=\'m\' and year(datepilonnage.expl_custom_date)=!!annee!!;\r\nselect count(distinct expl_id) as \'Documents audiovisuels : Total Unit\�s Mat\�rielles Elimin\�es\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join expl_custom_values as datepilonnage on (expl_id=datepilonnage.expl_custom_origine and datepilonnage.expl_custom_champ in (select idchamp from expl_custom where name=\"date_pilon\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_statut=!!choixstatutpilon!! and expl_notice!=0 and typdoc in (\'i\',\'j\',\'g\') and niveau_biblio=\'m\' and year(datepilonnage.expl_custom_date)=!!annee!!;','A exécuter en partie Administration>actions personnalisables','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixstatutpilon\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Quel est le statut de vos exemplaires pilonnés ? :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idstatut,statut_libelle from docs_statut order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(198,'Collections : Documents audiovisuels et Autres documents : Unités matérielles du fonds propre','select count(distinct expl_id) as \"Manuscrits : Nombre d\'unit\�s mat\�rielles, fonds propre\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and typdoc=\'b\';\r\nselect count(distinct expl_id) as \"Documents cartographiques : Nombre d\'unit\�s mat\�rielles, fonds propre\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where  expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and typdoc in (\'e\',\'f\');\r\nselect count(distinct expl_id) as \"Musique imprim\�e : Nombre d\'unit\�s mat\�rielles, fonds propre\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and typdoc in (\'c\',\'d\');\r\nselect count(distinct expl_id) as \"Musique imprim\�e : Nombre d\'unit\�s en libre acc\�s, fonds propre\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join docs_statut on expl_statut=idstatut left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and typdoc in (\'c\',\'d\') and pret_flag=1;\r\nselect count(distinct notice_id) as \"Musique imprim\�e : Nombre de titres, fonds propre\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where  expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and typdoc in (\'c\',\'d\');\r\nselect count(distinct expl_id) as \"Documents graphiques : Nombre d\'unit\�s mat\�rielles, fonds propre\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where  expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and typdoc=\'k\';\r\nselect count(distinct expl_id) as \"Autres documents : Nombre d\'unit\�s mat\�rielles, fonds propre\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where  expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and typdoc in (\'r\',\'m\',\'l\');\r\nselect count(distinct expl_id) as \"Documents sonores : musique : Nombre d\'unit\�s mat\�rielles, fonds propre\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and typdoc=\'j\';\r\nselect count(distinct expl_id) as \"Documents sonores : livres enregistr\�s : Nombre d\'unit\�s mat\�rielles, fonds propre\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and typdoc=\'i\';\r\nselect count(distinct expl_id) as \"Documents audiovisuels : Nombre d\'unit\�s mat\�rielles, fonds propre\" from exemplaires left join notices on expl_notice=notice_id left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and typdoc=\'g\';','Manuscrits, Documents cartographiques, Musique imprimée, Documents graphiques, Documents audiovisuels, Autres documents. A exécuter en partie Administration>Actions personnalisables.','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[choixloca]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS></OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(199,'Collections : Eliminations Imprimés : nombre de titres et d\'unités matérielles par propriétaire par code statistique','select codestat_libelle as \'Code statistique\', count(distinct expl_id) as \'Livres Imprim\�s : Total Unit\�s Mat\�rielles Elimin\�es\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join expl_custom_values as datepilonnage on (expl_id=datepilonnage.expl_custom_origine and datepilonnage.expl_custom_champ in (select idchamp from expl_custom where name=\"date_pilon\")) left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_statut=!!choixstatutpilon!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' and year(datepilonnage.expl_custom_date)=!!annee!! group by 1 order by 1;\r\nselect codestat_libelle as \'Code statistique\', count(distinct expl_id) as \'Publications en s\�rie imprim\�es : Total Unit\�s Mat\�rielles Elimin\�es\' from exemplaires left join bulletins on expl_bulletin=bulletin_id left join notices on bulletin_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join docs_statut on expl_statut=idstatut left join expl_custom_values as datepilonnage on (expl_id=datepilonnage.expl_custom_origine and datepilonnage.expl_custom_champ in (select idchamp from expl_custom where name=\"date_pilon\")) left join docs_location on expl_location=idlocation where  expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_statut=!!choixstatutpilon!! and expl_bulletin!=0 and niveau_biblio=\'s\' and year(datepilonnage.expl_custom_date)=!!annee!! group by 1 order by 1;','A exécuter en partie Administration>actions personnalisables','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixstatutpilon\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Quel est le statut de vos exemplaires pilonnés ? :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idstatut, statut_libelle from docs_statut order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(200,'Collections : Imprimés : nombre de titres et d\'unités matérielles par propriétaire par code statistique','select codestat_libelle as \'Code statistique\', count(distinct expl_id) as \'Livres Imprim\�s : Total Unit\�s Mat\�rielles\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' group by 1 order by 1;\r\nselect codestat_libelle as \'Code statistique\', count(distinct expl_id) as \'Dont Unit\�s Mat\�rielles en Libre Acc\�s (Livres Imprim\�s)\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join docs_statut on expl_statut=idstatut left join docs_location on expl_location=idlocation where  expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' and pret_flag=1 group by 1 order by 1;\r\nselect codestat_libelle as \'Code statistique\', count(distinct notice_id) as \'Livres Imprim\�s : Total Titres\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join docs_statut on expl_statut=idstatut left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and  expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' group by 1 order by 1;\r\nselect codestat_libelle as \'Code statistique\', count(distinct expl_id) as \'Dont Unit\�s Mat\�rielles publi\�es avant 1811\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' and year REGEXP \'^[0-9]\' and year NOT REGEXP \'[[:alpha:]]\' and year < 1811 group by 1 order by 1;\r\nselect codestat_libelle as \'Code statistique\', count(distinct expl_id) as \'Dont Unit\�s mat\�rielles publi\�es entre 1811 et 1914\' from exemplaires left join notices on expl_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and  expl_owner=!!choixproprio!! and expl_notice!=0 and typdoc=\'a\' and niveau_biblio=\'m\' and year REGEXP \'^[0-9]\' and year NOT REGEXP \'[[:alpha:]]\' and year>=1810 and year<=1914 group by 1 order by 1;\r\nselect codestat_libelle as \'Code statistique\', count(distinct expl_id) as \'Publications en s\�rie imprim\�es : Total Unit\�s Mat\�rielles\' from exemplaires left join bulletins on expl_bulletin=bulletin_id left join notices on bulletin_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_bulletin!=0 and niveau_biblio=\'s\' group by 1 order by 1;\r\nselect codestat_libelle as \'Code statistique\', count(distinct expl_id) as \'Dont Unit\�s Mat\�rielles en Libre Acc\�s (Publications en s\�rie imprim\�es)\' from exemplaires left join bulletins on expl_bulletin=bulletin_id left join notices on bulletin_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join docs_statut on expl_statut=idstatut left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_bulletin!=0 and niveau_biblio=\'s\' and pret_flag=1 group by 1 order by 1;\r\nselect codestat_libelle as \'Code statistique\', count(distinct notice_id) as \'Publications en s\�rie imprim\�es : Total Titres de P\�riodiques\' from exemplaires left join bulletins on expl_bulletin=bulletin_id left join notices on bulletin_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_bulletin!=0 and niveau_biblio=\'s\' group by 1 order by 1;','A exécuter en partie Administration>actions personnalisables','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(201,'Collections : Publications en série en cours par code statistique','select codestat_libelle as \'Code statistique\', case when typdoc=\'a\' then \'Imprim\�es\' when typdoc=\'l\' then \'Electroniques\' else \'Autres\' end as \'Format Publications en s\�rie en cours\', count(distinct notice_id) as \'Publications en s\�rie en cours : Total Titres de P\�riodiques\' from exemplaires left join bulletins on expl_bulletin=bulletin_id left join notices on bulletin_notice=notice_id left join docs_codestat on expl_codestat=idcode left join lenders on expl_owner=idlender left join docs_location on expl_location=idlocation where expl_location in (!!choixlocation!!) and expl_owner=!!choixproprio!! and expl_bulletin!=0 and niveau_biblio=\'s\' and year(exemplaires.create_date)=!!annee!! group by 1,2 order by 1,2;','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire : ]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(202,'Lecteurs : Comptes des emprunteurs actifs par catégorie et code statistique (à exécuter impérativement en fin d\'année)','select empr_codestat.libelle as \'Code statistique\', count(distinct id_empr) as \'Total emprunteurs actifs\' from empr left join empr_categ on empr_categ=id_categ_empr left join empr_codestat on empr_codestat=idcode left join docs_location on empr_location=idlocation where empr_location in (!!choixlocation!!) and (year(empr_date_adhesion)=!!annee!! or year(empr_date_expiration)=!!annee!!) and year(last_loan_date)=!!annee!! and empr_categ in (!!choixcateg!!) group by 1 order by 1','Un emprunteur est actif s\'il a une adhésion valide et a emprunté un ouvrage dans l\'année renseignée','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcateg\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(203,'Lecteurs : Comptes des emprunteurs actifs par catégorie, tranche d\'âge et par sexe (à exécuter impérativement en fin d\'année)','select case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'Sexe non renseign\�\' end as Sexe, CASE WHEN  (!!annee!! - empr_year) <= 14 THEN \'De 0 \� 14 ans\' WHEN (!!annee!! - empr_year) >14 and (!!annee!! - empr_year) <= 64 THEN \'De 15 \� 64 ans\' WHEN ((!!annee!! - empr_year) >64 and empr_year!=0) THEN \'De 65 ans et plus\' ELSE \'Ann\�e de naissance non renseign\�e\' END as \"Tranche d\'\�ge\",count(distinct id_empr) as \'Total emprunteurs actifs\' from empr left join empr_categ on empr_categ=id_categ_empr left join docs_location on empr_location=idlocation where empr_location in (!!choixlocation!!) and (year(empr_date_adhesion)=!!annee!! or year(empr_date_expiration)=!!annee!!) and year(last_loan_date)=!!annee!! and empr_categ in (!!choixcateg!!) group by 1,2 order by 1,2','Un emprunteur est actif s\'il a une adhésion valide et a emprunté un ouvrage dans l\'année renseignée','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcateg\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(204,'Lecteurs : Compte des lecteurs actifs (adhésion valide dans l\'année renseignée)','select case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'Sexe non renseign\�\' end as Sexe, CASE WHEN  (!!annee!! - empr_year) <= 14 THEN \'De 0 \� 14 ans\' WHEN (!!annee!! - empr_year) >14 and (!!annee!! - empr_year) <= 64 THEN \'De 15 \� 64 ans\' WHEN ((!!annee!! - empr_year) >64 and empr_year!=0) THEN \'De 65 ans et plus\' ELSE \'Ann\�e de naissance non renseign\�e\' END as \"Tranche d\'\�ge\",count(distinct id_empr) as \'Total lecteurs actifs\' from empr left join empr_categ on empr_categ=id_categ_empr left join docs_location on empr_location=idlocation where empr_location in (!!choixlocation!!) and (year(empr_date_adhesion)=!!annee!! or year(empr_date_expiration)=!!annee!!) and empr_categ in (!!choixcateg!!) group by 1,2 order by 1,2','Par catégorie, par tranche d\'âge et par sexe','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcateg\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(205,'Lecteurs : Compte des lecteurs actifs par code statistique (adhésion valide dans l\'année renseignée)','select empr_codestat.libelle as \'Code statistique\', count(distinct id_empr) as \'Total lecteurs actifs\' from empr left join empr_categ on empr_categ=id_categ_empr left join empr_codestat on empr_codestat=idcode left join docs_location on empr_location=idlocation where (year(empr_date_adhesion)=!!annee!! or year(empr_date_expiration)=!!annee!!) and empr_location in (!!choixlocation!!) and empr_categ in (!!choixcateg!!) group by 1 order by 1','Par catégorie et code statistique','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcateg\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(206,'Lecteurs : Compte des nouveaux inscrits','select case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'Sexe non renseign\�\' end as Sexe, CASE WHEN  (!!annee!! - empr_year) <= 14 THEN \'De 0 \� 14 ans\' WHEN (!!annee!! - empr_year) >14 and (!!annee!! - empr_year) <= 64 THEN \'De 15 \� 64 ans\' WHEN ((!!annee!! - empr_year) >64 and empr_year!=0) THEN \'De 65 ans et plus\' ELSE \'Ann\�e de naissance non renseign\�e\' END as \"Tranche d\'\�ge\", count(distinct id_empr) as \'Total nouveaux inscrits\' from empr left join empr_categ on empr_categ=id_categ_empr left join docs_location on empr_location=idlocation where year(empr_date_adhesion)=!!annee!! and empr_location in (!!choixlocation!!) and empr_categ in (!!choixcateg!!) group by 1,2 order by 1,2','Lecteurs inscrits dans l\'année renseignée, par catégorie, tranche d\'âge et par sexe','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcateg\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(207,'Lecteurs : Compte des nouveaux inscrits par code statistique','select empr_codestat.libelle as \'Code statistique\', count(distinct id_empr) as \'Total nouveaux inscrits\' from empr left join empr_categ on empr_categ=id_categ_empr left join empr_codestat on empr_codestat=idcode left join docs_location on empr_location=idlocation where year(empr_date_adhesion)=!!annee!! and empr_location in (!!choixlocation!!) and empr_categ in (!!choixcateg!!) group by 1 order by 1','Lecteurs inscrits dans l\'année renseignée, par catégorie et par code statistique','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcateg\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',5,0,''),(208,'Nombre d\'exemplaires achetés/donnés dans une année / support / Localisation / Codestat / Section','select location_libelle as Localisation,codestat_libelle as Codestat, section_libelle as Section, tdoc_libelle as Support, a0.expl_custom_small_text as Type,count(distinct a1.expl_custom_origine) as Total from expl_custom_values as a0, expl_custom_values as a1, exemplaires left join docs_type on expl_typdoc=idtyp_doc LEFT JOIN docs_location ON idlocation= expl_location LEFT JOIN docs_codestat ON idcode=expl_codestat LEFT JOIN docs_section ON idsection=expl_section where a0.expl_custom_champ=2 and a1.expl_custom_champ=3  and date_format(a1.expl_custom_date,\'%Y\')=\'!!annee!!\' and a1.expl_custom_origine=a0.expl_custom_origine and expl_id=a1.expl_custom_origine and expl_location in (!!locationn!!) group by a0.expl_custom_small_text, Support, Localisation, Codestat, Section ORDER BY Localisation, Codestat, Section','Utiliser cette stat si le champ \"date d\'achat\" est renseigné','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idlocation, location_libelle FROM docs_location ORDER BY 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(209,'Nombre d\'exemplaires achetés/donnés dans une année / support /  Section','select section_libelle as Section, tdoc_libelle as Support, a0.expl_custom_small_text as Type,count(distinct a1.expl_custom_origine) as Total from expl_custom_values as a0, expl_custom_values as a1, exemplaires left join docs_type on expl_typdoc=idtyp_doc LEFT JOIN docs_section ON idsection=expl_section where a0.expl_custom_champ=2 and a1.expl_custom_champ=3 and date_format(a1.expl_custom_date,\'%Y\')=\'!!annee!!\' and a1.expl_custom_origine=a0.expl_custom_origine and expl_id=a1.expl_custom_origine and expl_section in (!!section!!) and expl_typdoc IN (!!suppoort!!) group by a0.expl_custom_small_text, Support, Section ORDER BY Section, Support','Utiliser cette stat si le champ \"date d\'achat\" est renseigné','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"section\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idsection, section_libelle FROM docs_section ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"suppoort\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idtyp_doc, tdoc_libelle FROM docs_type ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(210,'Nombre d\'exemplaires acquis par section et par localisation pour l\'année en fonction de la date d\'achat','select location_libelle as Localisation, section_libelle as Section, count(*) as Nombre from exemplaires LEFT JOIN docs_section ON idsection=expl_section LEFT JOIN docs_location ON idlocation=expl_location LEFT JOIN expl_custom_values ON expl_custom_origine = expl_id AND expl_custom_champ = 2 where idlocation in (!!locationn!!) and expl_custom_date LIKE \"!!anneeencours!!%\" group by location_libelle, section_libelle order by location_libelle, section_libelle ','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>Select idlocation, location_libelle FROM docs_location ORDER BY location_libelle</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"anneeencours\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année en cours]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS></OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(211,'Nombre d\'exemplaires créés par section et par localisation pour l\'année en cours','select location_libelle as Localisation, section_libelle as Section, count(*) as Nombre from exemplaires LEFT JOIN docs_section ON idsection=expl_section LEFT JOIN docs_location ON idlocation=expl_location where idlocation in (!!locationn!!) and create_date LIKE \"!!anneeencours!!%\" group by location_libelle, section_libelle order by location_libelle, section_libelle ','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>Select idlocation, location_libelle FROM docs_location ORDER BY location_libelle</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"anneeencours\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année en cours]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS></OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(212,'Nombre de documents achetés et donnés','select location_libelle as Localisation,codestat_libelle as Codestat, tdoc_libelle as Support, a0.expl_custom_small_text as Type,count(distinct a1.expl_custom_origine) as Total from expl_custom_values as a0, expl_custom_values as a1, exemplaires left join docs_type on expl_typdoc=idtyp_doc LEFT JOIN docs_location ON idlocation= expl_location LEFT JOIN docs_codestat ON idcode=expl_codestat where a0.expl_custom_champ=2 and a1.expl_custom_champ=3 and date_format(a1.expl_custom_date,\'%Y\')=\'!!annee!!\' and a1.expl_custom_origine=a0.expl_custom_origine and expl_id=a1.expl_custom_origine and expl_location in (!!locationn!!) group by a0.expl_custom_small_text, Support, Localisation, Codestat ORDER BY Localisation, Codestat','pour une année et par support / Localisation / Code statistique','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlocation, location_libelle FROM docs_location ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(213,'Nombre de documents achetés/donnés ou repris par Statut par Support par Section','select tdoc_libelle as Support, section_libelle as Section, statut_libelle as Statut, a0.expl_custom_small_text as Type,count(distinct a1.expl_custom_origine) as Total from expl_custom_values as a0, expl_custom_values as a1, exemplaires LEFT JOIN docs_statut ON idstatut=expl_statut LEFT JOIN docs_type ON idtyp_doc=expl_typdoc LEFT JOIN docs_section ON expl_section=idsection where a0.expl_custom_champ=2 and a1.expl_custom_origine=a0.expl_custom_origine and year(a1.expl_custom_date)=\'!!anneeacq!!\' and expl_typdoc IN (!!supoort!!) and expl_section IN (!!sectionn!!) and expl_id=a1.expl_custom_origine group by Section, Statut, Support, a0.expl_custom_small_text','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"anneeacq\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"supoort\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idtyp_doc, tdoc_libelle FROM docs_type ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"sectionn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idsection, section_libelle FROM docs_section ORDER BY 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(214,'Nombre d\'exemplaires par section','select section_libelle as Section, count(*) as Nombre from exemplaires, docs_section where idsection=expl_section group by idsection, section_libelle order by 1','','1','',14,0,''),(215,'Nombre d\'exemplaires par code statistique','select codestat_libelle as \"Code statistique\", count(*) as Nombre from exemplaires, docs_codestat where idcode=expl_codestat group by codestat_libelle order by codestat_libelle','','1','',14,0,''),(216,'Nombre d\'exemplaires par cote','select left(expl_cote,5) as \'D\�but de cote\', count(expl_id) from exemplaires group by 1 order by 1','Prise en compte de la cote dans sa totalité','1','',14,0,''),(217,'Nombre d\'exemplaires par début de cote 1','select left(expl_cote,3), count(expl_id) from exemplaires group by 1 order by 1','3 premiers caractères de la cote / classement sur cote','1','',14,0,''),(218,'Nombre d\'exemplaires par début de cote 2','select left(expl_cote,3), count(expl_id) from exemplaires group by 1 order by 2 DESC','3 premiers caractères de la cote / classement sur fréquence d\'utilisation','1','',14,0,''),(219,'Nombre d\'exemplaires par début de cote et par localisation','SELECT location_libelle as Localisation, left(expl_cote,3) as Cote, count(expl_id) FROM exemplaires LEFT JOIN docs_location ON idlocation=expl_location WHERE expl_location in (!!locationn!!) GROUP BY Localisation, Cote ORDER BY Localisation, Cote','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idlocation, location_libelle FROM docs_location ORDER BY 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(220,'Nombre d\'exemplaires par début de cote et par localisation et par section','SELECT location_libelle as Localisation, section_libelle as Section, left(expl_cote,3) as Cote, count(expl_id) as Frequence FROM exemplaires LEFT JOIN docs_location ON idlocation=expl_location LEFT JOIN docs_section ON idsection=expl_section WHERE expl_section in (!!sectionn!!) AND expl_location in (!!locationn!!) GROUP BY Localisation, Section, Cote ORDER BY Localisation, Section, Frequence DESC','3 premiers caractères de la cote / classement sur fréquence d\'utilisation','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"sectionn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idsection, section_libelle FROM docs_section ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlocation, location_libelle FROM docs_location ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(221,'Nombre d\'exemplaires par localisation','select location_libelle as Localisation, count(*) as Nombre from exemplaires, docs_location where idlocation=expl_location group by idlocation, location_libelle order by idlocation','','1','',14,0,''),(222,'Nombre d\'exemplaires par localisation / code statistique','select location_libelle as Localisation, codestat_libelle as \"Code statistique\", count(*) as Nombre from exemplaires, docs_location, docs_codestat where idlocation=expl_location and expl_codestat=idcode group by location_libelle,codestat_libelle order by 1,2','','1','',14,0,''),(223,'Nombre d\'exemplaires par localisation / section','select location_libelle as Localisation, section_libelle as Section, count(*) as Nombre from exemplaires, docs_location, docs_section where idlocation=expl_location and idsection=expl_section group by location_libelle,section_libelle order by 1,2','','1','',14,0,''),(224,'Nombre d\'exemplaires par localisation / statut','select location_libelle as Localisation, statut_libelle as Statut, count(*) as Nombre from exemplaires, docs_location, docs_statut where idlocation=expl_location and idstatut=expl_statut group by location_libelle,statut_libelle order by 1,2','','1','',14,0,''),(225,'Nombre d\'exemplaires par localisation / support','select location_libelle as Localisation, tdoc_libelle as Support, count(*) as Nombre from exemplaires left join docs_location on idlocation=expl_location left join docs_type on expl_typdoc=idtyp_doc where expl_typdoc in (!!choixsupport!!) group by location_libelle,tdoc_libelle order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixsupport\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(226,'Nombre d\'exemplaires par origine de l\'exemplaire','select a0.expl_custom_small_text as Type,count(distinct a1.expl_custom_origine) as Total from expl_custom_values as a0, expl_custom_values as a1, exemplaires where a0.expl_custom_champ=2 and a1.expl_custom_origine=a0.expl_custom_origine and expl_id=a1.expl_custom_origine group by a0.expl_custom_small_text','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',14,0,''),(227,'Nombre d\'exemplaires par propriétaire','select lender_libelle as Propri\�taire, count(*) as Nombre from exemplaires, lenders where idlender=expl_owner group by expl_owner, lender_libelle','','1','',14,0,''),(228,'Nombre d\'exemplaires pilonnés','SELECT statut_libelle as Statut,location_libelle as Localisation, codestat_libelle as Codestat, tdoc_libelle as Support, count(expl_id) as \"Nombre de documents retir\�s de l\'inventaire\" FROM exemplaires LEFT JOIN docs_type on expl_typdoc=idtyp_doc LEFT JOIN docs_location ON idlocation= expl_location LEFT JOIN docs_codestat ON idcode=expl_codestat LEFT JOIN docs_statut ON idstatut=expl_statut  WHERE expl_statut=15 and idlocation IN (!!locationn!!) group by Localisation, Support, Codestat order by Localisation, Support, Codestat','Par localisation, support et Code statistique','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlocation, location_libelle FROM docs_location ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(229,'Nombre d\'exemplaires par propriétaire / code statistique','select lender_libelle as Propri\�taire, codestat_libelle as \"Code statistique\", count(*) as Nombre from exemplaires, lenders, docs_codestat where expl_owner=idlender and expl_codestat=idcode group by lender_libelle,codestat_libelle order by lender_libelle,codestat_libelle ','','1','',14,0,''),(231,'Nombre d\'exemplaires par propriétaire / localisation','select lender_libelle as Propri\�taire, location_libelle as Localisation, count(*) as Nombre from exemplaires, lenders, docs_location where expl_owner=idlender and idlocation=expl_location group by lender_libelle, location_libelle order by 1,2','','1','',14,0,''),(232,'Nombre d\'exemplaires par propriétaire / localisation / code statistique','select lender_libelle as Propri\�taire, location_libelle as Localisation, codestat_libelle as \"Code statistique\", count(*) as Nombre from exemplaires, lenders, docs_location, docs_codestat where expl_owner=idlender and idlocation=expl_location and expl_codestat=idcode group by lender_libelle,location_libelle,codestat_libelle order by 1,2,3','','1','',14,0,''),(233,'Nombre d\'exemplaires par propriétaire / localisation / section','select lender_libelle as Propri\�taire, location_libelle as Localisation, section_libelle as Section, count(*) as Nombre from exemplaires, lenders, docs_location, docs_section where expl_owner=idlender and idlocation=expl_location and idsection=expl_section group by lender_libelle,location_libelle,section_libelle order by 1,2,3','','1','',14,0,''),(234,'Nombre d\'exemplaires par propriétaire/localisation/section/support/code statistique','SELECT count(expl_id) as \"Nombre d\'exemplaires\", lender_libelle as Propri\�taire, location_libelle as Localisation,codestat_libelle as Codestat, tdoc_libelle as Support, section_libelle as Section FROM exemplaires JOIN lenders ON idlender=expl_owner left join docs_type on expl_typdoc=idtyp_doc LEFT JOIN docs_location ON idlocation= expl_location LEFT JOIN docs_codestat ON idcode=expl_codestat LEFT JOIN docs_section ON idsection=expl_section WHERE expl_location IN (!!locationn!!) AND expl_section IN (!!sectionn!!) AND expl_codestat IN (!!codestatt!!) AND expl_typdoc IN (!!typdocc!!) AND expl_owner IN (!!proprioo!!) GROUP BY Propri\�taire, Localisation, Codestat, Support, Section ORDER BY Propri\�taire, Localisation, Codestat, Support, Section','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Location]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlocation, location_libelle FROM docs_location ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"sectionn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idsection, section_libelle FROM docs_section ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"codestatt\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[CodeStatistique]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idcode, codestat_libelle FROM docs_codestat ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"typdocc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idtyp_doc, tdoc_libelle FROM docs_type ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"proprioo\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idlender, lender_libelle FROM lenders ORDER BY 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(235,'Nombre d\'exemplaires par propriétaire / localisation / statut','select lender_libelle as Propri\�taire, location_libelle as Localisation, statut_libelle as Statut, count(*) as Nombre from exemplaires, lenders, docs_location, docs_statut where expl_owner=idlender and idlocation=expl_location and idstatut=expl_statut group by lender_libelle,location_libelle,statut_libelle order by 1,2,3','','1','',14,0,''),(236,'Nombre d\'exemplaires par propriétaire / localisation / support','select lender_libelle as Propri\�taire, location_libelle as Localisation, tdoc_libelle as Support, count(*) as Nombre from exemplaires left join lenders on expl_owner=idlender left join docs_location on idlocation=expl_location left join docs_type on expl_typdoc=idtyp_doc where expl_typdoc in (!!choixsupport!!) group by lender_libelle,location_libelle,tdoc_libelle order by 1,2,3 ','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixsupport\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(238,'Nombre d\'exemplaires par propriétaire / section','select lender_libelle as Propri\�taire, section_libelle as Section, count(*) as Nombre from exemplaires, lenders, docs_section where expl_owner=idlender and idsection=expl_section group by lender_libelle,section_libelle order by 1,2','','1','',14,0,''),(240,'Nombre d\'exemplaires par propriétaire/statut/localisation/section/support/code statistique','SELECT count(expl_id) as \"Nombre d\'exemplaires\", lender_libelle as Propri\�taire, statut_libelle AS Statut, location_libelle as Localisation,codestat_libelle as Codestat, tdoc_libelle as Support, section_libelle as Section FROM exemplaires JOIN lenders ON idlender=expl_owner left join docs_type on expl_typdoc=idtyp_doc LEFT JOIN docs_location ON idlocation= expl_location LEFT JOIN docs_codestat ON idcode=expl_codestat LEFT JOIN docs_section ON idsection=expl_section JOIN docs_statut ON idstatut=expl_statut WHERE expl_location IN (!!locationn!!) AND expl_section IN (!!sectionn!!) AND expl_codestat IN (!!codestatt!!) AND expl_typdoc IN (!!typdocc!!) AND expl_owner IN (!!proprioo!!) AND expl_statut IN (!!statutt!!) GROUP BY Propri\�taire, Localisation, Codestat, Support, Section, Statut ORDER BY Propri\�taire, Localisation, Codestat, Support, Section, Statut','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Location]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlocation, location_libelle FROM docs_location ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"sectionn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idsection, section_libelle FROM docs_section ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"codestatt\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[CodeStatistique]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idcode, codestat_libelle FROM docs_codestat ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"typdocc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idtyp_doc, tdoc_libelle FROM docs_type ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"proprioo\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlender, lender_libelle FROM lenders ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"statutt\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Statut]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idstatut, statut_libelle FROM docs_statut ORDER BY 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(241,'Nombre d\'exemplaires par propriétaire / support','select lender_libelle as Propri\�taire, tdoc_libelle as Support, count(*) as Nombre from exemplaires left join lenders on expl_owner=idlender left join docs_type on expl_typdoc=idtyp_doc where expl_typdoc in (!!choixsupport!!) group by lender_libelle,tdoc_libelle order by lender_libelle,tdoc_libelle ','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixsupport\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(242,'Nombre d\'exemplaires par propriétaire/support/code statistique','SELECT count(expl_id) as \"Nombre d\'exemplaires\", lender_libelle as Propri\�taire, tdoc_libelle as Support, codestat_libelle as Codestat FROM exemplaires JOIN lenders ON idlender=expl_owner left join docs_type on expl_typdoc=idtyp_doc JOIN docs_codestat ON idcode=expl_codestat WHERE expl_codestat IN (!!codestatt!!) AND expl_typdoc IN (!!typdocc!!) AND expl_owner IN (!!proprioo!!) GROUP BY Propri\�taire, Codestat, Support ORDER BY Propri\�taire, Codestat, Support','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Location]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlocation, location_libelle FROM docs_location ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"sectionn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idsection, section_libelle FROM docs_section ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"codestatt\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[CodeStatistique]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idcode, codestat_libelle FROM docs_codestat ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"typdocc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idtyp_doc, tdoc_libelle FROM docs_type ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"proprioo\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idlender, lender_libelle FROM lenders ORDER BY 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(243,'Nombre d\'exemplaires par statut','select statut_libelle as Statut, count(*) as Nombre from exemplaires, docs_statut where idstatut=expl_statut group by statut_libelle order by statut_libelle','','1','',14,0,''),(244,'Nombre d\'exemplaires par support','select tdoc_libelle as Support, count(expl_id) as \"Nombre d\'exemplaires\" from exemplaires left join docs_type on expl_typdoc=idtyp_doc where expl_typdoc in (!!choixsupport!!) group by 1 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixsupport\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(245,'Nombre d\'exemplaires par support / localisation / section','select tdoc_libelle as Support, location_libelle as Localisation, section_libelle as Section, count(expl_id) as \"Nombre d\'exemplaires\" from exemplaires left join docs_location on idlocation=expl_location left join docs_section on idsection=expl_section left join docs_type on expl_typdoc=idtyp_doc where expl_typdoc in (!!choixsupport!!) group by 1,2,3 order by 1,2,3','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixsupport\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',14,0,''),(246,'Nombre d\'exemplaires par type de document','select case when typdoc=\'a\' then \'Texte imprim\�\' when typdoc=\'b\' then \'Texte manuscrit\' when typdoc=\'c\' then \'Partition musicale imprim\�e\' when typdoc=\'d\' then \'Partition musicale manuscrite\' when typdoc=\'e\' then \'Document cartographique imprim\�\' when typdoc=\'f\' then \'Document cartographique manuscrit\' when typdoc=\'g\' then \'Document projet\� ou vid\�o\' when typdoc=\'i\' then \'Enregistrement sonore non musical\' when typdoc=\'j\' then \'Enregistrement sonore musical\' when typdoc=\'k\' then \'Document graphique \� deux dimensions\' when typdoc=\'l\' then \'Document \�lectronique\' when typdoc=\'m\' then \'Document multim\�dia\' when typdoc=\'r\' then \'Objet \� 3 dimensions, artefacts,...\' when typdoc=\'u\' then \'Article\' when typdoc=\'v\' then \'P\�riodique\' ELSE \'n/a\' END as \'Type de document\', count(expl_id) as Total from notices left join exemplaires on notice_id=expl_notice group by 1 order by 1','','1','',14,0,''),(248,'Nombre de lecteurs','Select count(id_empr) as \'Nombre de lecteurs\' from empr','','1','',9,0,''),(249,'Nombre de lecteurs par type d\'abonnements','select count(*) as \"Nombre de lecteurs\", type_abt_libelle as \'Type abonnement\' from empr join type_abts on type_abt=id_type_abt group by 2 order by 2','','1','',9,0,''),(250,'Nombre de lecteurs par type d\'abonnements où date d\'adhésion est comprise dans la période saisie','select count(*) as \"Nombre de lecteurs\", type_abt_libelle as \'Type abonnement\' from empr join type_abts on type_abt=id_type_abt WHERE empr_date_adhesion BETWEEN \"!!date1!!\" and \"!!date2!!\" group by 2 order by 2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 1]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 2]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(251,'Nombre de lecteurs par type d\'abonnements où date d\'expiration est comprise dans la période saisie','select count(*) as \"Nombre de lecteurs\", type_abt_libelle as \'Type abonnement\' from empr join type_abts on type_abt=id_type_abt WHERE empr_date_expiration BETWEEN \"!!date1!!\" and \"!!date2!!\" group by 2 order by 2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 1]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 2]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(252,'Nombre de lecteurs actifs par type d\'abonnements','select count(*) as \"Nombre de lecteurs\", type_abt_libelle as \'Type abonnement\' from empr join type_abts on type_abt=id_type_abt where(year(empr_date_adhesion)=!!annee!! or year(empr_date_expiration)=!!annee!! or (year(empr_date_expiration)>=!!annee!! and year(empr_date_adhesion)<=!!annee!!)) group by 2 order by 2','','1','',9,0,''),(253,'Nombre de lecteurs actifs par catégorie pour une année','SELECT CASE WHEN  (!!annee!! - empr_year) <= 11 THEN \"0 \� 11 ans\" WHEN (!!annee!! - empr_year) >11 and (!!annee!! - empr_year)<=15 THEN \"12 \� 15 ans\" WHEN (!!annee!! - empr_year)>14 and (!!annee!! - empr_year)<=24 THEN \"15 \� 24 ans\" WHEN (!!annee!! - empr_year)>24 THEN \"25 ans et plus\"  ELSE \"Age non d\�fini\" END as \"Tranche d\'\�ge\", libelle as Cat\�gorie, count(id_empr) as \'Nombre lecteurs\' from empr LEFT JOIN empr_categ ON id_categ_empr=empr_categ where empr_categ in (!!categorie!!) and(year(empr_date_adhesion)=!!annee!! or year(empr_date_expiration)=!!annee!! or (year(empr_date_expiration)>=!!annee!! and year(empr_date_adhesion)<=!!annee!!)) group by 2,1 ORDER BY 2,1','Nombre de lecteurs par catégorie','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"categorie\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[categorie]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT id_categ_empr, libelle FROM empr_categ ORDER BY 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(254,'Nombre de lecteurs actifs par code statistique /sexe/ tranche d\'âge pour une année','select case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'ind\�termin\�\' end as Sexe, libelle as \'Code statistique\', CASE WHEN  (!!param1!! - empr_year) <= 13 THEN \'Jusque 13 ans\' WHEN (!!param1!! - empr_year) >13 and (!!param1!! - empr_year)<=24 THEN \'14 \� 24 ans\' WHEN (!!param1!! - empr_year)>24 and (!!param1!! - empr_year)<=59 THEN \'25 \� 29 ans\' WHEN (!!param1!! - empr_year)>59 THEN \'60 ans et plus\'  ELSE \'erreur sur age\' END as categ_age, count(id_empr) from empr left join empr_codestat on empr_codestat=idcode where (year(empr_date_adhesion)=!!param1!! or year(empr_date_expiration)=!!param1!! or (year(empr_date_expiration)>=!!param1!! and year(empr_date_adhesion)<=!!param1!!)) group by libelle,1, categ_age order by libelle,1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année de calcul :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(255,'Nombre de lecteurs actifs par code statistique / tranche d\'âge pour une année','select libelle as \'Code statistique\', CASE WHEN  (!!param1!! - empr_year) <= 13 THEN \'Jusque 13 ans\' WHEN (!!param1!! - empr_year) >13 and (!!param1!! - empr_year)<=24 THEN \'14 \� 24 ans\' WHEN (!!param1!! - empr_year)>24 and (!!param1!! - empr_year)<=59 THEN \'25 \� 29 ans\' WHEN (!!param1!! - empr_year)>59 THEN \'60 ans et plus\'  ELSE \'erreur sur age\' END as categ_age, count(id_empr) from empr left join empr_codestat on empr_codestat=idcode where (year(empr_date_adhesion)=!!param1!! or year(empr_date_expiration)=!!param1!! or (year(empr_date_expiration)>=!!param1!! and year(empr_date_adhesion)<=!!param1!!)) group by libelle,categ_age order by libelle','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année de calcul :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(256,'Nombre de lecteurs actifs par sexe et tranche d\'age pour une année','SELECT count(*), case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'erreur sur sexe\' end as Sexe, CASE WHEN  (!!param1!! - empr_year) <= 13 THEN \'Jusque 13 ans\' WHEN (!!param1!! - empr_year) >13 and (!!param1!! - empr_year) <= 24 THEN \'14 \� 24 ans\' WHEN (!!param1!! - empr_year) >24 and (!!param1!! - empr_year) <= 59 THEN \'25 \� 59 ans\' WHEN (!!param1!! - empr_year) >59 THEN \'60 ans et plus\'  ELSE \'erreur sur age\' END as categ_age from empr where (year(empr_date_adhesion)=!!param1!! or year(empr_date_expiration)=!!param1!! or (year(empr_date_expiration)>=!!param1!! and year(empr_date_adhesion)<=!!param1!!)) group by sexe, categ_age','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année de calcul]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"categorie\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by libelle</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(257,'Nombre de lecteurs actifs par sexe, tranche d\'âge et commune pour une année','SELECT count(*) as \"Nbre\", case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'Non pr\�cis\�\' end as \"Sexe\", CASE WHEN  (!!param1!! - empr_year) <= 14 THEN \'Jusque 14 ans\' WHEN (!!param1!! - empr_year) >14 and (!!param1!! - empr_year) <= 24 THEN \'15 \� 24 ans\' WHEN (!!param1!! - empr_year) >24 and (!!param1!! - empr_year) <= 59 THEN \'25 \� 59 ans\' WHEN (!!param1!! - empr_year) >59 THEN \'60 ans et plus\'  ELSE \'erreur sur age\' END as \"Tranche \�ge\", empr_ville as \"Ville\" from empr where (year(empr_date_adhesion)=!!param1!! or year(empr_date_expiration)=!!param1!! or (year(empr_date_expiration)>=!!param1!! and year(empr_date_adhesion)<=!!param1!!)) and empr_categ not in (9,10,11) group by sexe, \"Tranche \�ge\", empr_ville order by Sexe, empr_ville, \"Tranche \�ge\"','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année de calcul :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(258,'Nombre de lecteurs actifs par tranche d\'âge pour une année','SELECT count(*), CASE WHEN  (!!param1!! - empr_year) <= 13 THEN \'Jusque 13 ans\' WHEN (!!param1!! - empr_year) >13 and (!!param1!! - empr_year)<=24 THEN \'14 \� 24 ans\' WHEN (!!param1!! - empr_year)>24 and (!!param1!! - empr_year)<=59 THEN \'25 \� 29 ans\' WHEN (!!param1!! - empr_year)>59 THEN \'60 ans et plus\'  ELSE \'erreur sur age\' END as categ_age from empr where (year(empr_date_adhesion)=!!param1!! or year(empr_date_expiration)=!!param1!! or (year(empr_date_expiration)>=!!param1!! and year(empr_date_adhesion)<=!!param1!!))  group by categ_age','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année de calcul :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(259,'Nombre de lecteurs actifs par ville de résidence pour une ou plusieurs catégorie','select empr_ville as Ville, count(*) as Nbre from empr where empr_categ in (!!categorie!!) and (year(empr_date_adhesion)=!!annee!! or year(empr_date_expiration)=!!annee!! or (year(empr_date_expiration)>=!!annee!! and year(empr_date_adhesion)<=!!annee!!)) group by empr_ville with rollup','Attention ne compte que les lecteurs dont le début ou la fin d\'adhésion est dans l\'année renseignée.','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"categorie\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by libelle</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année de calcul :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(261,'Nombre de lecteurs par catégorie où date d\'adhésion est comprise dans la période saisie','SELECT libelle as Cat\�gorie, count(id_empr) as \'Nombre lecteurs\' from empr LEFT JOIN empr_categ ON id_categ_empr=empr_categ where empr_categ in (!!categorie!!) AND empr_date_adhesion BETWEEN \"!!date1!!\" and \"!!date2!!\" group by 1 ORDER BY 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"categorie\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[categorie]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT id_categ_empr, libelle FROM empr_categ ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 1]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 2]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(262,'Nombre de lecteurs par catégorie où date d\'expiration est comprise dans la période saisie','SELECT libelle as Cat\�gorie, count(id_empr) as \'Nombre lecteurs\' from empr LEFT JOIN empr_categ ON id_categ_empr=empr_categ where empr_categ in (!!categorie!!) AND empr_date_adhesion BETWEEN \"!!date1!!\" and \"!!date2!!\" group by 1 ORDER BY 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"categorie\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[categorie]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT id_categ_empr, libelle FROM empr_categ ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 1]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 2]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(263,'Nombre de lecteurs par catégorie et localisation','select libelle as Cat\�gorie, location_libelle as Localisation, count(*) as \'Nombre de lecteurs\' from empr, empr_categ, docs_location where id_categ_empr=empr_categ and empr_location=idlocation group by libelle, location_libelle order by libelle','','1','',9,0,''),(265,'Nombre de lecteurs par code statistique / sexe','select libelle as \'Code statistique\', case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'ind\�termin\�\' end as Sexe, count(id_empr) from empr left join empr_codestat on empr_codestat=idcode group by libelle,sexe order by libelle','','1','',9,0,''),(267,'Nombre de lecteurs par code statistique /sexe/ tranche d\'âge où date d\'expiration est comprise dans la période saisie','select case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'ind\�termin\�\' end as Sexe, libelle as \'Code statistique\', CASE WHEN  (!!param1!! - empr_year) <= 14 THEN \'Jusque 14 ans\' WHEN (!!param1!! - empr_year) >14 and (!!param1!! - empr_year)<=64 THEN \'15 \� 64 ans\' WHEN (!!param1!! - empr_year)>64 and (!!param1!! - empr_year)<=99 THEN \'65 \� 99 ans\' WHEN (!!param1!! - empr_year)>99 THEN \'100 ans et plus\'  ELSE \'erreur sur age\' END as categ_age, count(id_empr) as Nombre from empr left join empr_codestat on empr_codestat=idcode where empr_date_expiration BETWEEN \"!!date1!!\" and \"!!date2!!\" group by libelle,1, categ_age order by libelle,1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année de calcul :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 1]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 2]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(268,'Nombre de lecteurs par code statistique /sexe/ tranche d\'âge où date d\'adhésion est comprise dans la période saisie','select case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'ind\�termin\�\' end as Sexe, libelle as \'Code statistique\', CASE WHEN  (!!param1!! - empr_year) <= 14 THEN \'Jusque 14 ans\' WHEN (!!param1!! - empr_year) >14 and (!!param1!! - empr_year)<=64 THEN \'15 \� 64 ans\' WHEN (!!param1!! - empr_year)>64 and (!!param1!! - empr_year)<=99 THEN \'65 \� 99 ans\' WHEN (!!param1!! - empr_year)>99 THEN \'100 ans et plus\'  ELSE \'erreur sur age\' END as categ_age, count(id_empr) as Nombre from empr left join empr_codestat on empr_codestat=idcode where empr_date_adhesion BETWEEN \"!!date1!!\" and \"!!date2!!\" group by libelle,1, categ_age order by libelle,1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année de calcul :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 1]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 2]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(270,'Nombre de lecteurs par date de fin d\'adhésion','SELECT location_libelle as Localisation, count(id_empr) as \"Nombre de lecteurs\" FROM empr LEFT JOIN docs_location ON idlocation=empr_location WHERE YEAR(empr_date_expiration)=!!anneee!! GROUP BY Localisation ORDER BY Localisation','Nombre de lecteurs où année d\'expiration de l\'abonnement = année saisie','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"anneee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année d\'échéance d\'abonnement]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(271,'Nombre de lecteurs en débit','Select count(id_empr) as \'Nombre de lecteurs\' from empr LEFT JOIN comptes ON proprio_id=id_empr LEFT JOIN transactions ON compte_id=id_compte WHERE montant>0 AND sens=\'-1\' AND realisee=\'0\'','','1','',9,0,''),(272,'Nombre de lecteurs en débit / montant','Select montant AS Montant, count(*) as \'Nombre de lecteurs\' from empr LEFT JOIN comptes ON proprio_id=id_empr LEFT JOIN transactions ON compte_id=id_compte WHERE montant>0 AND sens=\'-1\' AND realisee=\'0\' GROUP BY montant','','1','',9,0,''),(273,'Nombre de lecteurs ayant emprunté par type d\'abonnement pour une journée','select type_abt_libelle as \"Type d\'abonnement\", count(distinct arc_id_empr) as \'Nombre de lecteurs\' from pret_archive left join empr on arc_id_empr=id_empr left join type_abts on type_abt=id_type_abt where arc_id_empr!=0 and date_format(arc_debut,\'%Y-%m-%d\')=\'!!date1!!\' group by 1 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(274,'Nombre de lecteurs ayant emprunté par type d\'abonnement pour une période et par localisation','select type_abt_libelle as \"Type d\'abonnement\", count(distinct arc_id_empr) as \'Nombre de lecteurs\' from pret_archive left join empr on arc_id_empr=id_empr left join type_abts on type_abt=id_type_abt where arc_id_empr!=0 and arc_debut between \'!!date1!!\' and \'!!date2!!\' and empr_location in (!!localisation!!) group by 1 order by 1','se base sur l\'historique des prêts (durée 120 jours)','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"localisation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[localisation :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idlocation, location_libelle FROM docs_location ORDER BY 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(275,'Nombre de lecteurs ayant emprunté par section par localisation pour une période','select location_libelle as Localisation, section_libelle as Section, count(distinct arc_id_empr) as \'Nombre de lecteurs\' from pret_archive left join empr on arc_id_empr=id_empr left join docs_section on arc_expl_section=idsection left join docs_location on arc_expl_location=idlocation where arc_id_empr!=0 and arc_expl_section in (!!choixsection!!) and arc_expl_location in (!!choixloca!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1, 2 order by 1, 2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(276,'Nombre de lecteurs par localisation','select location_libelle as Localisation, count(id_empr) from empr left join docs_location on empr_location=idlocation where empr_location in (!!choixloca!!) group by 1 order by 1','Sous réserve que les lecteurs soient localisés','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',9,0,''),(277,'Nombre de lecteurs par sexe','SELECT count(*), case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'ind\�termin\�\' end as Sexe from empr group by sexe','','1','',9,0,''),(281,'Nombre de lecteurs par villes de résidence où date d\'adhésion est comprise dans la période saisie','select empr_ville as Ville, count(*) as Nbre from empr where empr_date_adhesion BETWEEN \"!!date1!!\" and \"!!date2!!\" group by empr_ville with rollup','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 1]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 2]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(282,'Nombre de lecteurs par villes de résidence où date d\'expiration est comprise dans la période saisie','select empr_ville as Ville, count(*) as Nbre from empr where empr_date_expiration BETWEEN \"!!date1!!\" and \"!!date2!!\" group by empr_ville with rollup','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 1]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date 2]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',9,0,''),(283,'Nombre de prêts en cours par localisation','select expl_cb as \"Code-barres\", if(expl_notice>0,if(n1.tit4=\"\",n1.tit1,concat(n1.tit1,\" : \",n1.tit4)),concat(nperio.tit1,\" / \",bulletin_numero)) as Titre, concat(author_name,\", \",author_rejete) as Auteur, concat(empr_cb,\" : \",empr_nom,\", \",empr_prenom) as Emprunteur, DATE_FORMAT(pret_date, \"%d/%m/%Y\") as \"Date de pr\�t\", DATE_FORMAT(pret_retour, \"%d/%m/%Y\") as \"Date de retour pr\�vu\" from pret left join exemplaires on pret_idexpl=expl_id left join notices n1 on expl_notice=n1.notice_id left join responsability on responsability_notice=n1.notice_id and responsability_type=0  left join authors on author_id=responsability_author left join bulletins on expl_bulletin=bulletin_id left join notices nperio on bulletin_notice=nperio.notice_id left join empr on id_empr=pret_idempr where empr_location in (!!localisation!!) order by pret_retour ASC, empr_nom ASC, empr_prenom ASC','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"localisation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[choisir une localisation :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(284,'Nombre de prêts / début de cote / semaine / mois / année / section / localisation / support  entre deux dates','SELECT left(arc_expl_cote,3) as \'D\�but de cote\', location_libelle as Localisation, section_libelle as Section, tdoc_libelle as Support, year(arc_debut) as annee, CASE WHEN month(arc_debut)=1 THEN \"Janvier\" WHEN month(arc_debut)=2 THEN \"F\�vrier\" WHEN month(arc_debut)=3 THEN \"Mars\" WHEN month(arc_debut)=4 THEN \"Avril\" WHEN month(arc_debut)=5 THEN \"Mai\" WHEN month(arc_debut)=6 THEN \"Juin\" WHEN month(arc_debut)=7 THEN \"Juillet\" WHEN month(arc_debut)=8 THEN \"Ao�t\" WHEN month(arc_debut)=9 THEN \"Septembre\" WHEN month(arc_debut)=10 THEN \"Octobre\" WHEN month(arc_debut)=11 THEN \"Novembre\" WHEN month(arc_debut)=12 THEN \"D\�cembre\" else \"Erreur sur mois\" END AS mois, week(arc_debut) as semaine, DATE_FORMAT(DATE_ADD(arc_debut, INTERVAL -weekday(arc_debut) DAY),\"%d/%m/%Y\") as \"semaine du lundi...\", count(*) as \"Total semaine\" FROM `pret_archive` LEFT JOIN docs_location ON idlocation=arc_expl_location LEFT JOIN docs_section ON arc_expl_section=idsection LEFT JOIN docs_type on arc_expl_typdoc=idtyp_doc  WHERE arc_debut >= \"!!date_debut!!\" AND arc_debut <= DATE_ADD(\"!!date_fin!!\", INTERVAL 1 DAY) AND arc_expl_cote like \"!!cote!!%\" AND arc_expl_location IN (!!localisationn!!) AND arc_expl_section IN(!!sectionn!!) AND arc_expl_typdoc in (!!choixsupport!!) GROUP BY 1, Localisation,Section, Support, annee, mois, semaine ORDER BY annee ASC, month(arc_debut) ASC, semaine ASC, 1 ASC, Localisation ASC, Section ASC, Support ASC','Statistiques hebdomadaires par début de cote','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date_debut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date de début]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"date_fin\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date de fin]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"cote\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Saisissez un début de cote  (par ex. \"R \" pour Romans)...]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS></OPTIONS>\n </FIELD>\n <FIELD NAME=\"localisationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlocation, location_libelle FROM docs_location ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"sectionn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idsection, section_libelle FROM docs_section ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsupport\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(285,'Nombre de prêts par support et par sexe','select tdoc_libelle as Support, case when arc_empr_sexe=\'1\' then \'Hommes\' when arc_empr_sexe=\'2\' then \'Femmes\' else \'Non renseign\�\' end as Sexe, count(arc_id) as Nombre from pret_archive left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_typdoc in (!!choixtypdoc!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idtyp_doc, tdoc_libelle from docs_type order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code(s) Statistique(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, libelle from empr_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(286,'Nombre de prêts d\'un exemplaire entre 2 dates','select expl_cote as Cote, tit1 as Titre, count(*) as Nombre from exemplaires, notices, pret_archive where expl_id=arc_expl_id and notice_id=arc_expl_notice and arc_debut between \"!!date1!!\" and \"!!date2!!\" and expl_cb=!!cb!! group by tit1 order by tit1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date début]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[date fin]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"cb\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[code barre]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>15</SIZE>\r\n <MAXSIZE>15</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(287,'Nombre de prêts par cote par propriétaire par localisation par section par support par code statistique par dates d\'acquisition entre deux dates','select location_libelle as Localisation, section_libelle as Section, tdoc_libelle as Support,codestat_libelle as \"Code statistique\", arc_expl_cote as Cote, count(arc_id) as \"Nombre de pr\�ts\" from pret_archive left join docs_type on arc_expl_typdoc=idtyp_doc left join docs_location on arc_expl_location=idlocation left join docs_section on arc_expl_section=idsection left join docs_codestat on arc_expl_codestat=idcode left join lenders on arc_expl_owner=idlender left join expl_custom_values on (arc_expl_id=expl_custom_origine and expl_custom_champ=3)  where arc_debut between \'!!date1!!\' and adddate(\'!!date2!!\', INTERVAL 1 DAY) and expl_custom_date between \'!!dateacq1!!\' and adddate(\'!!dateacq2!!\', INTERVAL 1 DAY) and arc_expl_owner in (!!choixproprio!!) and arc_expl_location in (!!choixlocation!!) and arc_expl_section in (!!choixsection!!) and arc_expl_typdoc in (!!choixtypdoc!!) and arc_expl_codestat in (!!choixcodestat!!) group by 1,2,3,4,5 order by 1,2,3,4','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Prêts effectués entre le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Et le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"dateacq1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date d\'acquisition entre le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"dateacq2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Et le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs propriétaires :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs localisations :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs sections :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs supports :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs codes statistiques :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(288,'Nombre de prêts par type d\'abonnement pour une période donnée','select if(id_type_abt is null,\'Type abonnement supprim\�\',type_abt_libelle) as \"Type d\'abonnement\", count(distinct arc_id) as \"Nombre de pr\�ts\" from pret_archive left join empr on arc_id_empr=id_empr left join type_abts on type_abt=id_type_abt where arc_id_empr!=0 and arc_debut between \"!!date1!!\" and \"!!date2!!\" group by 1 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(289,'Nombre de prêts par catégorie (autorité) pour une année','select libelle_categorie as Cat\�gorie, count(arc_id) as Total from pret_archive join notices_categories on arc_expl_notice=notcateg_notice join categories on notices_categories.num_noeud=categories.num_noeud where year(arc_debut)=!!choixannee!! and categories.num_noeud=!!choixcateg!! group by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"choixcateg\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie :]]></ALIAS>\n  <TYPE>selector</TYPE>\n<OPTIONS FOR=\"selector\">\r\n <METHOD>1</METHOD>\r\n <DATA_TYPE>2</DATA_TYPE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(290,'Nombre de prêts par catégorie de lecteurs pour une année','SELECT CASE WHEN libelle IS NULL THEN \" Cat\�gorie de lecteurs inconnue\" ELSE libelle END as Cat\�gorie, count(*) as \"Nombre de pr\�ts\" FROM pret_archive LEFT JOIN empr_categ ON id_categ_empr = arc_empr_categ where year(arc_debut) = \'!!param1!!\' group by arc_empr_categ order by Cat\�gorie','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS></OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(291,'Nombre de prêts par code statistique exemplaires et par localisation','select codestat_libelle as \"Code Statistique exemplaire\",location_libelle as Localisation, count(arc_id) as Nombre from pret_archive left join docs_location on arc_expl_location=idlocation left join docs_codestat on arc_expl_codestat=idcode where arc_expl_location in (!!choixloca!!) and arc_expl_codestat in (!!choixcodestat!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code(s) Statistique(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(292,'Nombre de prêts par code statistique lecteurs','select libelle as \"Code Statistique lecteur\", count(arc_id) as Nombre from pret_archive left join empr_codestat on arc_empr_codestat=idcode where  arc_empr_codestat in (!!choixcodestat!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idtyp_doc, tdoc_libelle from docs_type order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code(s) Statistique(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, libelle from empr_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(293,'Nombre de prêts par cote par propriétaire par localisation par section par support par code statistique entre deux dates','select location_libelle as Localisation, section_libelle as Section, tdoc_libelle as Support,codestat_libelle as \"Code statistique\", arc_expl_cote as Cote, count(arc_id) as \"Nombre de pr\�ts\" from pret_archive left join docs_type on arc_expl_typdoc=idtyp_doc left join docs_location on arc_expl_location=idlocation left join docs_section on arc_expl_section=idsection left join docs_codestat on arc_expl_codestat=idcode left join lenders on arc_expl_owner=idlender where arc_debut between \'!!date1!!\' and adddate(\'!!date2!!\', INTERVAL 1 DAY) and arc_expl_owner in (!!choixproprio!!) and arc_expl_location in (!!choixlocation!!) and arc_expl_section in (!!choixsection!!) and arc_expl_typdoc in (!!choixtypdoc!!) and arc_expl_codestat in (!!choixcodestat!!) group by 1,2,3,4,5 order by 1,2,3,4','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Entre le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Et le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs propriétaires :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs localisations :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs sections :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs supports :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs codes statistiques :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(294,'Nombre de prêts par indexation décimale pour une année','select indexint_name as \'Indexation d\�cimale\', indexint_comment as \'Commentaire\', count(arc_id) as \'Nombre de pr\�ts\' from pret_archive left join notices on arc_expl_notice=notice_id left join indexint on indexint=indexint_id where year(arc_debut)=!!choixannee!! group by 1 order by 3 DESC','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(295,'Nombre de prêts par jour et par tranche horaire','select concat(hour(arc_debut),\"h-\",hour(arc_debut)+1,\"h\") as \"Tranche horaire\", sum(if(weekday(arc_debut)=0,1,0)) as \"Lundi\", sum(if(weekday(arc_debut)=1,1,0)) as \"Mardi\", sum(if(weekday(arc_debut)=2,1,0)) as \"Mercredi\", sum(if(weekday(arc_debut)=3,1,0)) as \"Jeudi\", sum(if(weekday(arc_debut)=4,1,0)) as \"Vendredi\", sum(if(weekday(arc_debut)=5,1,0)) as \"Samedi\", sum(if(weekday(arc_debut)=6,1,0)) as \"Dimanche\", sum(1) as \"Total\" FROM pret_archive WHERE arc_debut between \"!!debut_periode!!\" and \"!!fin_periode!!\" GROUP BY hour(arc_debut) ORDER BY hour(arc_debut)','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"debut_periode\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[début de période :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"fin_periode\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[fin de période :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(296,'Nombre de prêts par jour, par tranche horaire et par localisation','select concat(hour(arc_debut),\"h-\",hour(arc_debut)+1,\"h\") as \"Tranche horaire !!debut_periode!! \� !!fin_periode!!\", sum(if(weekday(arc_debut)=0,1,0)) as \"Lundi\", sum(if(weekday(arc_debut)=1,1,0)) as \"Mardi\", sum(if(weekday(arc_debut)=2,1,0)) as \"Mercredi\", sum(if(weekday(arc_debut)=3,1,0)) as \"Jeudi\", sum(if(weekday(arc_debut)=4,1,0)) as \"Vendredi\", sum(if(weekday(arc_debut)=5,1,0)) as \"Samedi\", sum(if(weekday(arc_debut)=6,1,0)) as \"Dimanche\", sum(1) as \"Total\" FROM pret_archive WHERE  arc_debut between \"!!debut_periode!!\" and \"!!fin_periode!!\" and arc_expl_location in (!!localisation!!) GROUP BY hour(arc_debut) ORDER BY hour(arc_debut)','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"debut_periode\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[début de période :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"fin_periode\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[fin de période :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"localisation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[localisation :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlocation, location_libelle from docs_location order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(297,'Nombre de prêts par localisation pour une année','select location_libelle as Localisation, count(arc_id) as Nombre from pret_archive left join docs_location on arc_expl_location=idlocation where arc_expl_location in (!!choixloca!!) and year(arc_debut)=!!choixannee!! group by 1 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(298,'Nombre de prêts par localisation et par code statistique pour une année','select location_libelle as Localisation, codestat_libelle as \'Code statistique exemplaire\', count(arc_id) as Nombre from pret_archive left join docs_codestat on arc_expl_codestat=idcode left join docs_location on arc_expl_location=idlocation where arc_expl_location in (!!choixloca!!) and arc_expl_codestat in (!!choixCS!!)  and year(arc_debut)=!!choixannee!! group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixCS\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code(s) statistique(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(299,'Nombre de prêts par localisation et section','select location_libelle as Localisation, section_libelle as Section, count(arc_id) as Nombre from pret_archive left join docs_section on arc_expl_section=idsection left join docs_location on arc_expl_location=idlocation where arc_expl_location in (!!choixloca!!) and arc_debut between \"!!date1!!\" and \"!!date2!!\" group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Début :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Fin :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(300,'Nombre de prêts par localisation, section et support','select location_libelle as Localisation, section_libelle as Section, tdoc_libelle as Support, count(arc_id) as Nombre from pret_archive left join docs_section on arc_expl_section=idsection left join docs_location on arc_expl_location=idlocation left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_location in (!!choixloca!!) and arc_expl_section in (!!choixsection!!) and arc_expl_typdoc in (!!choixtypdoc!!) and arc_debut between \"!!date1!!\" and \"!!date2!!\" group by 1,2,3 order by 1,2,3','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Supports(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(301,'Nombre de prêts par localisation, section et support','select location_libelle as Localisation, section_libelle as Section, tdoc_libelle as Support, count(arc_id) as Nombre from pret_archive left join docs_section on arc_expl_section=idsection left join docs_location on arc_expl_location=idlocation left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_location in (!!choixloca!!) and arc_expl_section in (!!choixsection!!) and arc_expl_typdoc in (!!choixtypdoc!!) and arc_debut between \"!!date1!!\" and \"!!date2!!\" group by 1,2,3 order by 1,2,3','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Supports(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(302,'Nombre de prêts par propriétaire par localisation par section par support et par code statistique','select lender_libelle as Propri\�taire, location_libelle as Localisation, section_libelle as Section, tdoc_libelle as Support, codestat_libelle as \"Code Statistique exemplaire\", count(arc_id) as Nombre from pret_archive left join docs_codestat on arc_expl_codestat=idcode left join docs_type on arc_expl_typdoc=idtyp_doc left join lenders on arc_expl_owner=idlender left join docs_location on arc_expl_location=idlocation left join docs_section on arc_expl_section=idsection where arc_expl_owner in (!!choixproprio!!) and arc_expl_location in (!!choixloca!!) and arc_expl_section in (!!choixsection!!) and arc_expl_typdoc in (!!choixtypdoc!!) and arc_expl_codestat in (!!choixcodestat!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2,3,4,5 order by 1,2,3,4,5','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs propriétaires :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs localisations :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs sections :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs supports :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs codes statistiques :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Entre le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Et le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(303,'Nombre de prêts par localisation et par support pour une année','select location_libelle as Localisation, tdoc_libelle as Support, count(arc_id) as Nombre from pret_archive left join docs_type on arc_expl_typdoc=idtyp_doc left join docs_location on arc_expl_location=idlocation where arc_expl_location in (!!choixloca!!) and year(arc_debut)=!!choixannee!! group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation,location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(304,'Nombre de prêts par localisation par support et par code statistique','select location_libelle as Localisation, tdoc_libelle as Support, codestat_libelle as \"Code Statistique exemplaire\", count(arc_id) as Nombre from pret_archive left join docs_codestat on arc_expl_codestat=idcode left join docs_type on arc_expl_typdoc=idtyp_doc left join docs_location on arc_expl_location=idlocation where arc_expl_location in (!!choixloca!!) and arc_expl_typdoc in (!!choixtypdoc!!) and arc_expl_codestat in (!!choixcodestat!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2,3 order by 1,2,3','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code(s) statistique(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Début :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Fin :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(305,'Nombre de prêts par mois et pour une année','SELECT year(arc_debut) as Ann\�e, month(arc_debut) as Mois, count(*) as \"Nombre de pr\�ts\" FROM pret_archive where year(arc_debut) = \'!!param1!!\' group by 1, 2 order by 1, 2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année de calcul :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(306,'Nombre prêts d\'un périodique selon son ISSN entre 2 dates','select count(arc_id) as Nombre from pret_archive left join bulletins on arc_expl_bulletin=bulletin_id left join notices on bulletin_notice=notice_id where arc_debut between \"!!date1!!\" and \"!!date2!!\" and code=\"!!cb!!\"','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Début :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Fin :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"cb\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[ISSN :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>50</SIZE>\r\n <MAXSIZE>50</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(307,'Nombre de prêts par propriétaire','SELECT lender_libelle as Propri\�taire, count(arc_id) AS \"Nombre de pr\�ts\" FROM pret_archive left join lenders on arc_expl_owner=idlender where date(arc_debut) BETWEEN \"!!Du!!\" AND \"!!Au!!\" and arc_expl_owner in (!!choixproprio!!) GROUP BY lender_libelle ORDER BY lender_libelle','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"Du\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"Au\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(308,'Nombre de prêts par propriétaire et par code statistique','select lender_libelle as Propri\�taire, codestat_libelle as \"Code Statistique exemplaire\", count(arc_id) as Nombre from pret_archive left join docs_codestat on arc_expl_codestat=idcode left join lenders on arc_expl_owner=idlender where arc_expl_owner in (!!choixproprio!!) and arc_expl_codestat in (!!choixcodestat!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code(s) statistiques(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Début :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Fin :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(309,'Nombre de prêts par propriétaire par localisation par section','select lender_libelle as Propri\�taire, section_libelle as Section, location_libelle as Localisation, count(arc_id) as Nombre from pret_archive left join lenders on arc_expl_owner=idlender left join docs_location on arc_expl_location=idlocation left join docs_section on arc_expl_section=idsection where arc_expl_section in (!!choixsection!!) and arc_expl_location in (!!choixloca!!) and arc_expl_owner in (!!choixlender!!) and year(arc_debut)=!!choixannee!! group by 1,2,3 order by 1,2,3','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlender\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender,lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(310,'Nombre de prêts par propriétaire par localisation et par support','select lender_libelle as Propri\�taire, location_libelle as Localisation, tdoc_libelle as Support, count(arc_id) as Nombre from pret_archive left join lenders on arc_expl_owner=idlender left join docs_location on arc_expl_location=idlocation left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_typdoc in (!!choixsupport!!) and arc_expl_location in (!!choixloca!!) and arc_expl_owner in (!!choixlender!!) and year(arc_debut)=!!choixannee!! group by 1,2,3 order by 1,2,3','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixsupport\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Supports(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlender\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(311,'Nombre de prêts par propriétaire et par support','select lender_libelle as Propri\�taire, tdoc_libelle as Support, count(arc_id) as Nombre from pret_archive left join lenders on arc_expl_owner=idlender left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_typdoc in (!!choixtypdoc!!) and arc_expl_owner in (!!choixproprio!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Début :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Fin :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(312,'Nombre de prêts par propriétaire par support et par code statistique','select lender_libelle as Propri\�taire, tdoc_libelle as Support, codestat_libelle as \"Code Statistique exemplaire\", count(arc_id) as Nombre from pret_archive left join docs_codestat on arc_expl_codestat=idcode left join docs_type on arc_expl_typdoc=idtyp_doc left join lenders on arc_expl_owner=idlender where arc_expl_owner in (!!choixproprio!!) and arc_expl_typdoc in (!!choixtypdoc!!) and arc_expl_codestat in (!!choixcodestat!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2,3 order by 1,2,3','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender,lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code(s) statistique(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Début :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Fin :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(313,'Nombre de prêts par section pour une année','SELECT CASE WHEN section_libelle IS NULL THEN \" Section supprim\�e\" ELSE section_libelle END as Section, count(*) as \"Nombre de pr\�ts\" FROM pret_archive LEFT JOIN docs_section ON idsection = arc_expl_section where year(arc_debut) = \'!!param1!!\' group by arc_expl_section order by Section','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>20</SIZE>\r\n <MAXSIZE>255</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(314,'Nombre de prêts par section et par localisation pour une année','select section_libelle as Section, location_libelle as Localisation, count(arc_id) as Nombre from pret_archive left join docs_location on arc_expl_location=idlocation left join docs_section on arc_expl_section=idsection where arc_expl_section in (!!choixsection!!) and arc_expl_location in (!!choixloca!!) and year(arc_debut)=!!choixannee!! group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlocation, location_libelle from docs_location order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(315,'Nombre de prêts par sexe pour une année','select case when arc_empr_sexe=\'1\' then \'Hommes\' when arc_empr_sexe=\'2\' then \'Femmes\' else \'Non renseign\�\' end as Sexe, count(arc_id) as Nombre from pret_archive where year(arc_debut)=!!choixannee!! group by 1 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(316,'Nombre de prêts par sexe et par tranche d\'âge pour une année','select case when arc_empr_sexe=\'1\' then \'Hommes\' when arc_empr_sexe=\'2\' then \'Femmes\' else \'Non renseign\�\' end as Sexe, CASE WHEN (!!param1!! - arc_empr_year)<=3 THEN \'Petite enfance (0 \� 3 ans)\' WHEN (!!param1!! - arc_empr_year)>3 and (!!param1!! - arc_empr_year)<=5 THEN \'Maternelle (4 \� 5 ans)\' WHEN (!!param1!! - arc_empr_year)>5 and (!!param1!! - arc_empr_year)<=10 THEN \'Primaire (6 \� 10 ans)\' WHEN (!!param1!! - arc_empr_year)>10 and (!!param1!! - arc_empr_year)<=15 THEN \'Jeune (11 \� 15 ans)\' WHEN (!!param1!! - arc_empr_year)>15 and (!!param1!! - arc_empr_year)<=25 THEN \'Jeune adulte (16 \� 25 ans)\' WHEN (!!param1!! - arc_empr_year)>25  THEN \'Adulte (+25 ans)\' else \'Erreur sur \�ge\' END as \"Tranche d\'\�ge\", count(arc_id) as Nombre from pret_archive where year(arc_debut)=!!param1!! group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(318,'Nombre de prêts par support','select tdoc_libelle as Support, count(arc_id) as Nombre from pret_archive left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_typdoc in (!!choixtypdoc!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idtyp_doc, tdoc_libelle from docs_type order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code(s) Statistique(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, libelle from empr_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(319,'Nombre de prêts par support et par catégorie de lecteurs','select tdoc_libelle as Support, libelle as \'Cat\�gorie lecteurs\', count(arc_id) as Nombre from pret_archive left join empr_categ on arc_empr_categ=id_categ_empr left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_typdoc in (!!choixtypdoc!!) and arc_empr_categ in (!!choixcateg!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcateg\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Catégorie(s) de lecteurs :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select id_categ_empr, libelle from empr_categ order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Début :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Fin :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(320,'Nombre de prêts par support et par code statistique exemplaires','select tdoc_libelle as Support, codestat_libelle as \"Code Statistique exemplaire\", count(arc_id) as Nombre from pret_archive left join docs_codestat on arc_expl_codestat=idcode left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_typdoc in (!!choixtypdoc!!) and arc_expl_codestat in (!!choixcodestat!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code(s) Statistique(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idcode, codestat_libelle from docs_codestat order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(321,'Nombre de prêts par support et par code statistique lecteurs','select tdoc_libelle as Support, libelle as \"Code Statistique lecteur\", count(arc_id) as Nombre from pret_archive left join empr_codestat on arc_empr_codestat=idcode left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_typdoc in (!!choixtypdoc!!) and arc_empr_codestat in (!!choixcodestat!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idtyp_doc, tdoc_libelle from docs_type order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Code(s) Statistique(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, libelle from empr_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(322,'Nombre de prêts par support et par cote','select tdoc_libelle as Support, arc_expl_cote as Cote, count(arc_id) as Nombre from pret_archive left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_typdoc in (!!choixtypdoc!!) and arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Début :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Fin :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(323,'Nombre de prêts par support et par tranche d\'âge pour une année','select tdoc_libelle as Support, CASE WHEN (!!param1!! - arc_empr_year)<=3 THEN \'Petite enfance (0 \� 3 ans)\' WHEN (!!param1!! - arc_empr_year)>3 and (!!param1!! - arc_empr_year)<=5 THEN \'Maternelle (4 \� 5 ans)\' WHEN (!!param1!! - arc_empr_year)>5 and (!!param1!! - arc_empr_year)<=10 THEN \'Primaire (6 \� 10 ans)\' WHEN (!!param1!! - arc_empr_year)>10 and (!!param1!! - arc_empr_year)<=15 THEN \'Jeune (11 \� 15 ans)\' WHEN (!!param1!! - arc_empr_year)>15 and (!!param1!! - arc_empr_year)<=25 THEN \'Jeune adulte (16 \� 25 ans)\' WHEN (!!param1!! - arc_empr_year)>25  THEN \'Adulte (+25 ans)\' else \'Erreur sur \�ge\' END as \"Tranche d\'\�ge\", count(arc_id) as Nombre from pret_archive left join docs_type on arc_expl_typdoc=idtyp_doc where arc_expl_typdoc in (!!choixtypdoc!!) and year(arc_debut)=!!param1!! group by 1,2 order by 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"choixtypdoc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idtyp_doc, tdoc_libelle from docs_type order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',15,0,''),(324,'Nombre de prêts par tranche d\'âge pour une année','select CASE when arc_empr_year=0 then \'Ann\�e de naissance non renseign\�e\' WHEN (!!param1!! - arc_empr_year)<=3 THEN \'Petite enfance (0 \� 3 ans)\' WHEN (!!param1!! - arc_empr_year)>3 and (!!param1!! - arc_empr_year)<=5 THEN \'Maternelle (4 \� 5 ans)\' WHEN (!!param1!! - arc_empr_year)>5 and (!!param1!! - arc_empr_year)<=10 THEN \'Primaire (6 \� 10 ans)\' WHEN (!!param1!! - arc_empr_year)>10 and (!!param1!! - arc_empr_year)<=15 THEN \'Jeune (11 \� 15 ans)\' WHEN (!!param1!! - arc_empr_year)>15 and (!!param1!! - arc_empr_year)<=25 THEN \'Jeune adulte (16 \� 25 ans)\' WHEN (!!param1!! - arc_empr_year)>25  THEN \'Adulte (+25 ans)\' else \'Erreur sur \�ge\' END as \"Tranche d\'\�ge\", count(arc_id) as Nombre from pret_archive where year(arc_debut)=!!param1!! group by 1 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(325,'Nombre de prêts par tranche d\'âge pour une période','select case when arc_empr_year=0 then \'Ann\�e de naissance non renseign\�e\' when (year(arc_debut)-arc_empr_year) <=3 then \'0 \� 3 ans - Petite enfance\' when (year(arc_debut)-arc_empr_year) >=4 and (year(arc_debut)-arc_empr_year)<=5 then \'4 \� 5 ans - Maternelle\' when (year(arc_debut)-arc_empr_year) >=6 and (year(arc_debut)-arc_empr_year)<=10 then \'6 \� 10 ans - Primaire\' when (year(arc_debut)-arc_empr_year) >=11 and (year(arc_debut)-arc_empr_year)<=15 then \'11 \� 15 ans - Jeune\' when (year(arc_debut)-arc_empr_year) >=16 and (year(arc_debut)-arc_empr_year)<=25 then \'16 \� 25 ans - Jeune adulte\' when (year(arc_debut)-arc_empr_year) >25 then \'+25 ans - Adultes\' else \'N/A\' END as \"Tranche d\'\�ge\", count(arc_id) as \'Nombre de pr\�ts\' from pret_archive where arc_debut between \'!!date1!!\' and \'!!date2!!\' group by 1 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Du :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Au :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(326,'Nombre de prêts par trimestre d\'un exemplaire sur les trois dernières années','select exemplaires.expl_cb as \"code-barres\", year(arc_debut) as ann\�e, case when month(arc_debut) in (1, 2, 3) then \"trimestre 1\" when month(arc_debut) in (4,5,6) then \"trimestre 2\" when month(arc_debut) in (7, 8, 9) then \"trimestre 3\" when month(arc_debut) in (10, 11, 12) then \"trimestre 4\" end as trimestre, count(arc_id) as \"Nombre de pr\�ts\" from exemplaires  left join pret_archive on arc_expl_id=expl_id where expl_cb like \"!!codebarreexpl!!\" and year(NOW())-year(arc_debut) < 3 group by ann\�e, trimestre, expl_cb order by 1, 2, 3 ','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"codebarreexpl\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[saisissez ou douchetez le code-barres de l\'exemplaire...]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\n <SIZE>20</SIZE>\n <MAXSIZE>255</MAXSIZE>\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(327,'Nombre de prêts par ville de lecteur pour une année (sans choix de la ville)','select arc_empr_ville as Ville, count(arc_id) as \'Nombre de pr\�ts\' from pret_archive where year(arc_debut)=!!choixannee!! group by 1 order by 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixville\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Ville(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select distinct(arc_empr_ville), arc_empr_ville from pret_archive order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',15,0,''),(328,'Liste d\'ouvrages achetés/donnés dans une année / support / Localisation / Codestat / Section / Propriétaire','select location_libelle as Localisation,lender_libelle as Propri\�taire,codestat_libelle as Codestat, section_libelle as Section, tdoc_libelle as Support, e0.expl_custom_small_text as Type,expl_cote as Cote, CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre,if(categories.num_noeud is null,\'\',GROUP_CONCAT(distinct concat(\'[\',libelle_thesaurus,\']\',libelle_categorie) SEPARATOR \', \')) as \'Cat\�gorie\',if(a0.author_id is not null,CONCAT(a0.author_name, \' \', a0.author_rejete),\'\') as \'Auteur principal\', ed_name As Editeur, n1.year as \"Ann\�e d\'\�dition\", expl_prix as Prix from expl_custom_values as e0, expl_custom_values as a1, exemplaires left join lenders on expl_owner=idlender left join docs_statut on expl_statut=idstatut left join docs_location on expl_location=idlocation left join docs_section on expl_section=idsection LEFT JOIN docs_type ON idtyp_doc=expl_typdoc LEFT JOIN docs_codestat ON idcode=expl_codestat left join notices n1 on expl_notice=n1.notice_id left join notices_categories on n1.notice_id=notcateg_notice left join categories on (notices_categories.num_noeud=categories.num_noeud and categories.langue=\'fr_FR\') left join thesaurus on categories.num_thesaurus=id_thesaurus left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id left join publishers on n1.ed1_id=ed_id left join responsability as r0 on (n1.notice_id=r0.responsability_notice and r0.responsability_type=0) left join authors as a0 on a0.author_id=r0.responsability_author where e0.expl_custom_champ=2 and a1.expl_custom_champ=3 and date_format(a1.expl_custom_date,\'%Y\')=\'!!annee!!\' and a1.expl_custom_origine=e0.expl_custom_origine and expl_id=a1.expl_custom_origine and expl_location in (!!locationn!!) and expl_owner in (!!choixproprio!!) group by n1.notice_id ORDER BY 1,2,3,4,6','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs localisations :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlocation, location_libelle from docs_location order by 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs propriétaires :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(329,'Liste des cotes par localisation','SELECT location_libelle as Localisation, expl_cote as Cote FROM exemplaires LEFT JOIN docs_location ON idlocation=expl_location WHERE expl_location in (!!locationn!!) GROUP BY Localisation, Cote ORDER BY Localisation, Cote','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idlocation, location_libelle FROM docs_location ORDER BY 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(330,'Liste des cotes par localisation 2','SELECT location_libelle as Localisation, left(expl_cote,!!nomb!!) as Cote FROM exemplaires LEFT JOIN docs_location ON idlocation=expl_location WHERE expl_location in (!!locationn!!) GROUP BY Localisation, Cote ORDER BY Localisation, Cote','préciser le nombre de caractères pour le début de cote','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"nomb\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[nombre de caractères :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>3</SIZE>\r\n <MAXSIZE>2</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlocation, location_libelle FROM docs_location ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(331,'Liste des cotes par localisation et par section','SELECT location_libelle as Localisation, section_libelle as Section, expl_cote as Cote FROM exemplaires LEFT JOIN docs_location ON idlocation=expl_location LEFT JOIN docs_section ON idsection=expl_section WHERE expl_section in (!!sectionn!!) AND expl_location in (!!locationn!!) GROUP BY Localisation, Section, Cote ORDER BY Localisation, Section, Cote','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"sectionn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idsection, section_libelle FROM docs_section ORDER BY 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idlocation, location_libelle FROM docs_location ORDER BY 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(332,'Liste des exemplaires jamais prêtés sur une période donnée','select lender_libelle as Propri\�taire, location_libelle as Localisation, section_libelle as Section, statut_libelle as Statut, expl_cote as Cote, CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre, if(a0.author_id is not null,CONCAT(a0.author_name, \' \', a0.author_rejete),\'\') as \'Auteur principal\', ed_name as Editeur, n1.year as \"Ann\�e d\'\�dition\", expl_cb as \"Code-barres\", expl_prix as Prix, date_format(last_loan_date, \'%d-%m-%Y\') as \"Date du dernier pr\�t\",date_format(expl_custom_date,\'%d-%m-%Y\') as \"Date d\'acquisition\" from exemplaires left join expl_custom_values on (expl_id=expl_custom_origine and expl_custom_champ=2) left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id left join docs_location on expl_location=idlocation left join docs_section on expl_section=idsection left join publishers on n1.ed1_id=ed_id left join responsability as r0 on (n1.notice_id=r0.responsability_notice and r0.responsability_type=0) left join authors as a0 on a0.author_id=r0.responsability_author left join lenders on expl_owner=idlender left join docs_statut on expl_statut=idstatut where expl_location=idlocation and expl_location=!!choixloca!! and (last_loan_date not between \'!!datedebut!!\' and \'!!datefin!!\' or last_loan_date is NULL) order by 13 DESC','classement par date d\'acquisition','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"datedebut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date début :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"datefin\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date fin :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n</FIELDS>',16,0,''),(333,'Liste des exemplaires pilonnés dans une année','select lender_libelle as Propri\�taire, location_libelle as Localisation, section_libelle as Section, statut_libelle as Statut, expl_cote as Cote, CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre, if(a0.author_id is not null,CONCAT(a0.author_name, \' \', a0.author_rejete),\'\') as \'Auteur principal\', ed_name as Editeur, n1.year as \"Ann\�e d\'\�dition\", expl_cb as \"Code-barres\", expl_prix as Prix, date_format(expl_custom_date,\'%d-%m-%Y\') as \"Date de pilonnage\" from exemplaires left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id left join docs_location on expl_location=idlocation left join docs_section on expl_section=idsection left join publishers on n1.ed1_id=ed_id left join responsability as r0 on (n1.notice_id=r0.responsability_notice and r0.responsability_type=0) left join authors as a0 on a0.author_id=r0.responsability_author left join docs_statut on expl_statut=idstatut left join lenders on expl_owner=idlender left join expl_custom_values on (expl_custom_origine=expl_id and expl_custom_champ=2) where expl_statut=15 and year(expl_custom_date)=!!choixannee!!','se base sur le champ \'Date de pilonnage\'','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixannee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Année :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',16,0,''),(334,'Liste exemplaires prêtés entre deux dates par propriétaire par localisation par section par support par code statistique par choix de date d\'acquisition','select location_libelle as Localisation, section_libelle as Section, tdoc_libelle as Support, codestat_libelle as \"Code statistique\",arc_expl_cote as Cote, if(arc_expl_bulletin!=0,concat(if(bulletin_id is null,\'Bulletin supprim\�\',perio.tit1),\' \',bulletin_numero,\' \',mention_date,\' \',bulletin_titre),if(mono.notice_id is null,\'Titre supprim\�\',mono.tit1)) as Titre,if(a0.author_id is not null,CONCAT(a0.author_name, \' \', a0.author_rejete),\'\') as \'Auteur principal\', ed_name As Editeur,date_format(expl_custom_date,\'%d-%m-%Y\') as \"Date acquisition\",if(categories.num_noeud is null,\'\',GROUP_CONCAT(distinct concat(\'[\',libelle_thesaurus,\']\',libelle_categorie) SEPARATOR \', \')) as \'Cat\�gorie\', count(distinct arc_id) as \'Nombre de pr\�ts dans la p\�riode\' from pret_archive left join notices as mono on arc_expl_notice=mono.notice_id left join bulletins on arc_expl_bulletin=bulletin_id left join notices as perio on bulletin_notice=perio.notice_id left join notices_categories on mono.notice_id=notcateg_notice left join categories on (notices_categories.num_noeud=categories.num_noeud and categories.langue=\'fr_FR\') left join thesaurus on categories.num_thesaurus=id_thesaurus left join publishers on mono.ed1_id=ed_id left join responsability as r0 on (mono.notice_id=r0.responsability_notice and r0.responsability_type=0) left join authors as a0 on a0.author_id=r0.responsability_author left join docs_location on arc_expl_location=idlocation left join docs_section on arc_expl_section=idsection left join docs_type on arc_expl_typdoc=idtyp_doc left join docs_codestat on arc_expl_codestat=idcode left join lenders on arc_expl_owner=idlender left join expl_custom_values on (arc_expl_id=expl_custom_origine and expl_custom_champ=3) where arc_debut between \'!!date1!!\' and adddate(\'!!date2!!\', INTERVAL 1 DAY) and expl_custom_date between \'!!dateacq1!!\' and adddate(\'!!date2acq!!\', INTERVAL 1 DAY) and arc_expl_owner in (!!choixproprio!!) and arc_expl_location in (!!choixlocation!!) and arc_expl_section in (!!choixsection!!) and arc_expl_typdoc in (!!choixsupport!!) and arc_expl_codestat in (!!choixcodestat!!) group by mono.notice_id order by 1,2,3,4','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Prêtés entre le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Et le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"dateacq1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date d\'acquisition entre le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2acq\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Et le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs propriétaires :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixlocation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs localisations :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs sections :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsupport\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs supports :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs codes statistiques :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(335,'Liste des exemplaires pour un propriétaire','select lender_libelle as Propri\�taire, location_libelle as Localisation, section_libelle as Section, statut_libelle as Statut, expl_cote as Cote, CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre, if(a0.author_id is not null,CONCAT(a0.author_name, \' \', a0.author_rejete),\'\') as \'Auteur principal\', ed_name as Editeur, n1.year as \"Ann\�e d\'\�dition\", expl_cb as \"Code-barres\", expl_prix as Prix from exemplaires left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id left join docs_location on expl_location=idlocation left join docs_section on expl_section=idsection left join publishers on n1.ed1_id=ed_id left join responsability as r0 on (n1.notice_id=r0.responsability_notice and r0.responsability_type=0) left join authors as a0 on a0.author_id=r0.responsability_author left join docs_statut on expl_statut=idstatut left join lenders on expl_owner=idlender where expl_owner=!!proprietaire!! and expl_statut=idstatut and expl_owner=idlender order by  expl_cote, expl_cb','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"proprietaire\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by idlender</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\">Choisissez un prÃªteur</UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(336,'Liste exemplaires par propriétaire par localisation par section par support par code statistique entre 2 dates d\'acquisition','select location_libelle as Localisation, section_libelle as Section, tdoc_libelle as Support,codestat_libelle as Codestat, e0.expl_custom_small_text as Type,expl_cote as Cote, CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre,if(a0.author_id is not null,CONCAT(a0.author_name, \' \', a0.author_rejete),\'\') as \'Auteur principal\', ed_name As Editeur, n1.year as \"Ann\�e d\'\�dition\",date_format(a1.expl_custom_date ,\'%d-%m-%Y\') as \"Date acquisition\",if(categories.num_noeud is null,\'\',GROUP_CONCAT(distinct concat(\'[\',libelle_thesaurus,\']\',libelle_categorie) SEPARATOR \', \')) as \'Cat\�gorie\', expl_prix as Prix from expl_custom_values as e0, expl_custom_values as a1, exemplaires left join lenders on expl_owner=idlender left join docs_statut on expl_statut=idstatut left join docs_location on expl_location=idlocation left join docs_section on expl_section=idsection LEFT JOIN docs_type ON idtyp_doc=expl_typdoc LEFT JOIN docs_codestat ON idcode=expl_codestat left join notices n1 on expl_notice=n1.notice_id left join notices_categories on n1.notice_id=notcateg_notice left join categories on (notices_categories.num_noeud=categories.num_noeud and categories.langue=\'fr_FR\') left join thesaurus on categories.num_thesaurus=id_thesaurus left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id left join publishers on n1.ed1_id=ed_id left join responsability as r0 on (n1.notice_id=r0.responsability_notice and r0.responsability_type=0) left join authors as a0 on a0.author_id=r0.responsability_author where e0.expl_custom_champ=2 and a1.expl_custom_champ=3 and a1.expl_custom_date between \'!!date1!!\' and adddate(\'!!date2!!\', INTERVAL 1 DAY) and a1.expl_custom_origine=e0.expl_custom_origine and expl_id=a1.expl_custom_origine and expl_location in (!!locationn!!) and expl_owner in (!!choixproprio!!) and expl_section in (!!choixsection!!) and expl_typdoc in (!!choixsupport!!) and expl_codestat in (!!choixcodestat!!) group by n1.notice_id ORDER BY 1,2,3,4,5','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date d\'acquisition entre le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"date2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Et le :]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS> \n </FIELD>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs localisations :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs propriétaires :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez une ou plusieurs sections :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsupport\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs supports :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idtyp_doc, tdoc_libelle from docs_type order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixcodestat\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Choisissez un ou plusieurs codes statistiques :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idcode, codestat_libelle from docs_codestat order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(337,'Liste des exemplaires d\'un propriétaire par statut','select lender_libelle as Propri\�taire, location_libelle as Localisation, section_libelle as Section, statut_libelle as Statut, expl_cote as Cote, CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre, if(a0.author_id is not null,CONCAT(a0.author_name, \' \', a0.author_rejete),\'\') as \'Auteur principal\', ed_name as Editeur, n1.year as \"Ann\�e d\'\�dition\", expl_cb as \"Code-barres\", expl_prix as Prix from docs_statut, lenders, exemplaires left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id left join docs_location on expl_location=idlocation left join docs_section on expl_section=idsection left join publishers on n1.ed1_id=ed_id left join responsability as r0 on (n1.notice_id=r0.responsability_notice and r0.responsability_type=0) left join authors as a0 on a0.author_id=r0.responsability_author where expl_statut=!!statut!! and expl_owner=!!Proprietaire!! and expl_statut=idstatut and expl_owner=idlender order by lender_libelle, statut_libelle, expl_cote, expl_cb','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"statut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Statut :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idstatut, statut_libelle from docs_statut</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"Proprietaire\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(338,'Liste d\'exemplaires par propriétaire/statut/localisation/section/support/code statistique/cote/titre/prix/auteur principal/éditeur/année d\'édition','SELECT expl_cb as \"Code-Barre\", notices.year as \"Ann\�e d\'\�dition\", tit1 as Titre, expl_cote as Cote, GROUP_CONCAT(author_name, \' \', author_rejete ORDER BY responsability_type SEPARATOR \', \') as \"Auteur(s)\",ed_name as Editeur, expl_prix as Prix, lender_libelle as Propri\�taire, statut_libelle AS Statut, location_libelle as Localisation,codestat_libelle as Codestat, tdoc_libelle as Support, section_libelle as Section FROM exemplaires JOIN lenders ON idlender=expl_owner join docs_type on expl_typdoc=idtyp_doc JOIN docs_location ON idlocation= expl_location JOIN docs_codestat ON idcode=expl_codestat JOIN docs_section ON idsection=expl_section JOIN docs_statut ON idstatut=expl_statut JOIN notices ON expl_notice=notice_id JOIN responsability ON (responsability_notice=notice_id AND responsability_type=0) JOIN authors ON author_id=responsability_author JOIN publishers ON ed1_id=ed_id WHERE expl_location IN (!!locationn!!) AND expl_section IN (!!sectionn!!) AND expl_codestat IN (!!codestatt!!) AND expl_typdoc IN (!!typdocc!!) AND expl_owner IN (!!proprioo!!) AND expl_statut IN (!!statutt!!) GROUP BY expl_id ORDER BY Propri\�taire, Localisation, Codestat, Support, Section, Statut, 1','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"locationn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Location]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlocation, location_libelle FROM docs_location ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"sectionn\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idsection, section_libelle FROM docs_section ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"codestatt\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[CodeStatistique]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idcode, codestat_libelle FROM docs_codestat ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"typdocc\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Support]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idtyp_doc, tdoc_libelle FROM docs_type ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"proprioo\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT idlender, lender_libelle FROM lenders ORDER BY 2</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"statutt\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Statut]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT idstatut, statut_libelle FROM docs_statut ORDER BY 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(339,'Liste des exemplaires d\'un propriétaire par statut / localisation / section','SELECT lender_libelle as Propri\�taire, location_libelle as Localisation, section_libelle as Section, statut_libelle as Statut, expl_cote as Cote, CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre,if(a0.author_id is not null,CONCAT(a0.author_name, \' \', a0.author_rejete),\'\') as \'Auteur principal\', ed_name As Editeur, n1.year as \"Ann\�e d\'\�dition\", expl_cb as \'Code-barres\', expl_prix as Prix from exemplaires left join lenders on expl_owner=idlender left join docs_statut on expl_statut=idstatut left join docs_location on expl_location=idlocation left join docs_section on expl_section=idsection left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id left join publishers on n1.ed1_id=ed_id left join responsability as r0 on (n1.notice_id=r0.responsability_notice and r0.responsability_type=0) left join authors as a0 on a0.author_id=r0.responsability_author where expl_owner in (!!choixproprio!!) and expl_statut in (!!choixstatut!!) and expl_location in (!!choixloca!!) and expl_section in (!!choixsection!!) order by Statut, Localisation, Section, Propri\�taire','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixproprio\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixstatut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Statut(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idstatut, statut_libelle from docs_statut order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(340,'Liste des exemplaires pour une ou plusieurs sections par propriétaire','select lender_libelle as Propri\�taire, location_libelle as Localisation, section_libelle as Section, statut_libelle as Statut, expl_cote as Cote, CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre, if(a0.author_id is not null,CONCAT(a0.author_name, \' \', a0.author_rejete),\'\') as \'Auteur principal\', ed_name as Editeur, n1.year as \"Ann\�e d\'\�dition\", expl_cb as \"Code-barres\", expl_prix as Prix from exemplaires left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id left join docs_location on expl_location=idlocation left join docs_section on expl_section=idsection left join publishers on n1.ed1_id=ed_id left join responsability as r0 on (n1.notice_id=r0.responsability_notice and r0.responsability_type=0) left join authors as a0 on a0.author_id=r0.responsability_author left join docs_statut on expl_statut=idstatut left join lenders on expl_owner=idlender where idsection in (!!sections!!) and expl_owner=!!preteur!! order by section_libelle, expl_cote, expl_cb','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"sections\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idsection, section_libelle from docs_section</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"preteur\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propriétaire :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by idlender</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\">Choisissez un prÃªteur</UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(341,'Liste des exemplaires par statut','select lender_libelle as Propri\�taire, location_libelle as Localisation, section_libelle as Section, statut_libelle as Statut, expl_cote as Cote, CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre, if(a0.author_id is not null,CONCAT(a0.author_name, \' \', a0.author_rejete),\'\') as \'Auteur principal\', ed_name as Editeur, n1.year as \"Ann\�e d\'\�dition\", expl_cb as \"Code-barres\", expl_prix as Prix from exemplaires left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id left join docs_location on expl_location=idlocation left join docs_section on expl_section=idsection left join publishers on n1.ed1_id=ed_id left join responsability as r0 on (n1.notice_id=r0.responsability_notice and r0.responsability_type=0) left join authors as a0 on a0.author_id=r0.responsability_author left join docs_statut on expl_statut=idstatut left join lenders on expl_owner=idlender where expl_statut=!!param1!! order by expl_cote','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Statut :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idstatut,statut_libelle from docs_statut</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\">Choisissez un statut</UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',16,0,''),(342,'Nombre d\'exemplaires par propriétaire, section','select lender_libelle as Propri\�taire, section_libelle as Section, count(*) as Nombre from exemplaires, lenders, docs_section where expl_owner=idlender and idsection=expl_section group by lender_libelle, section_libelle order by 1,2','','1','',16,0,''),(343,'Liste des emprunteurs avec nom prénom et ville','Select empr_nom as Nom, empr_prenom as Pr\�nom, empr_ville as Ville from empr order by 3,1,2','','1','',17,0,''),(344,'Liste des lecteurs par type d\'abonnement','Select empr_nom AS Nom, empr_prenom AS \'Pr\�nom\', empr_ville AS Ville from empr WHERE type_abt=!!type_abonnement!! ORDER BY 1,2,3','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"type_abonnement\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[type d\'abonnement :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[SELECT id_type_abt, type_abt_libelle FROM type_abts ORDER BY 2]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',17,0,''),(345,'Liste des lecteurs par catégories','select libelle as Cat\�gorie, empr_nom as Nom, empr_prenom as Pr\�nom, empr_year as \"Ann\�e de naissance\" from empr, empr_categ where id_categ_empr=empr_categ order by libelle, empr_nom, empr_prenom','','1','',17,0,''),(347,'Liste des lecteurs avec multiples informations','SELECT empr_nom as Nom, empr_prenom as Pr\�nom, empr_adr1 as \"Adresse (ligne 1)\", empr_adr2 as \"Adresse (ligne 2)\", empr_cp as \"Code Postal\", empr_ville as Ville, empr_pays as Pays, empr_year as \"Ann\�e de naissance\", empr_pays as Pays, empr_mail as Mail, empr_tel1 as \"T\�l\�phone\", empr_tel2 as \"Autre t\�l\�phone\", empr_prof as Profession, empr_sexe as Sexe, empr_date_adhesion as \"Date adh\�sion\", empr_date_expiration as \"Date expiration\", empr_msg as Message, type_abt_libelle as \"Type d\'abonnement\" FROM empr join type_abts on type_abt=id_type_abt order by 1,2','','1','',17,0,''),(348,'Liste des lecteurs par sexe','select concat(\'<a href=./circ.php?categ=pret&form_cb=\',empr_cb,\'>\',empr_cb,\'</a>\') as \'Code-barres\', empr_nom as Nom, empr_prenom as Pr\�nom, location_libelle as Localisation, CASE when (empr_sexe=1) then \'Homme\' when (empr_sexe=2) then \'Femme\' else \'N/A\' END as Sexe from empr left join docs_location on empr_location=idlocation order by Sexe, location_libelle, empr_nom','','1','',17,0,''),(349,'Liste des lecteurs par tranche d\'âge','SELECT id_empr, empr_nom AS Nom, empr_prenom AS \"Pr\�nom\", empr_year AS \"Ann\�e de naissance\" FROM empr WHERE empr_year >=!!naiss1!! AND empr_year <=!!naiss2!! ORDER BY 4,2','les années renseignées sont comprises dans la recherche','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"naiss1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[année de départ :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"naiss2\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[année de fin :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>4</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',17,0,''),(350,'Liste de lecteurs par ville','SELECT empr_nom as Nom, empr_prenom as Pr\�nom, empr_ville as Ville FROM empr WHERE empr_ville=\"!!villle!!\" ORDER BY 1,2','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"villle\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Ville]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>20</SIZE>\r\n <MAXSIZE>20</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',17,0,''),(351,'Liste des transactions par emprunteur','select empr_prenom as \"Pr\�nom\", empr_nom as \"Nom\" , case type_compte_id when \'1\' then \"Abonnement\" when \'2\' then \"Amende\" when \'3\' then \"Pr\�t\" end as \"Type de compte\", date_format(date_enrgt, \'%d-%m-%Y\') as \"Date\", case when sens=\'1\' then \'Cr\�dit\' else \'D\�bit\' end as \"D\�bit/Cr\�dit\", (montant*sens) as \"Montant\", commentaire as \"Commentaires\" from transactions, comptes, empr where compte_id=id_compte and id_empr=proprio_id and if(\'!!empr!!\'=\'0\', \'1\', id_empr=\'!!empr!!\') and if(!!typcom!!=\'0\', \'1\', type_compte_id=!!typcom!!) and date_format(date_enrgt, \'%Y%m%d\') >= date_format(\'!!date_debut!!\', \'%Y%m%d\') and date_format(date_enrgt, \'%Y%m%d\') <= date_format(\'!!date_fin!!\', \'%Y%m%d\') order by empr_nom, empr_prenom, type_compte_id, date_enrgt desc','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"typcom\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Type de compte]]></ALIAS>\n  <TYPE>list</TYPE>\n<OPTIONS FOR=\"list\">\r\n <MULTIPLE>no</MULTIPLE>\r\n <ITEMS>\r\n  <ITEM VALUE=\"1\"><![CDATA[Abonnement]]></ITEM>\r\n  <ITEM VALUE=\"2\"><![CDATA[Amende]]></ITEM>\r\n  <ITEM VALUE=\"3\"><![CDATA[Prêt]]></ITEM>\r\n </ITEMS>\r\n <UNSELECT_ITEM VALUE=\"0\"><![CDATA[Tous]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"empr\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Emprunteur]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_empr, concat(empr_nom,\' \',empr_prenom) from empr order by empr_nom</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"0\">Tous</UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"date_debut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date début]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n <FIELD NAME=\"date_fin\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Date fin]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n</FIELDS>',17,0,''),(352,'Liste des documents jamais prêtés','SELECT expl_id as object_id, \'EXPL\' as object_type, concat(\"LIVRE \",tit1) as Titre FROM notices join exemplaires on expl_notice=notice_id LEFT JOIN pret_archive ON arc_expl_notice = notice_id where arc_expl_id IS NULL AND expl_id IS NOT NULL UNION SELECT expl_id as object_id, \'EXPL\' as object_type, concat(\"PERIO \",tit1, \" Num\�ro : \",bulletin_numero) as Titre FROM (bulletins INNER JOIN notices ON bulletins.bulletin_notice = notices.notice_id) INNER JOIN exemplaires on expl_bulletin=bulletin_id LEFT JOIN pret_archive ON expl_id = arc_expl_id WHERE pret_archive.arc_id Is Null','','1','',19,0,''),(353,'Liste des documents les moins empruntés','SELECT year(arc_debut) AS Ann\�e, tit1 AS Titre, COUNT(*) AS nb_fois FROM pret_archive, notices WHERE arc_expl_notice=notice_id AND year(arc_debut)=\'!!param_annee!!\' GROUP BY arc_expl_notice ORDER BY nb_fois','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param_annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[année de calcul :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',19,0,''),(354,'Liste des documents les plus empruntés','SELECT year(arc_debut) AS Ann\�e, tit1 AS Titre, COUNT(*) AS nb_fois FROM pret_archive, notices WHERE arc_expl_notice=notice_id AND year(arc_debut)=\'!!param_annee!!\' GROUP BY arc_expl_notice ORDER BY nb_fois DESC','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param_annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[année de calcul :]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',19,0,''),(355,'Liste des prêts en cours par localisation','select expl_cb as \"Code-barres\", if(expl_notice>0,if(n1.tit4=\"\",n1.tit1,concat(n1.tit1,\" : \",n1.tit4)),concat(nperio.tit1,\" / \",bulletin_numero)) as Titre, concat(author_name,\", \",author_rejete) as Auteur, concat(empr_cb,\" : \",empr_nom,\", \",empr_prenom) as Emprunteur, DATE_FORMAT(pret_date, \"%d/%m/%Y\") as \"Date de pr\�t\", DATE_FORMAT(pret_retour, \"%d/%m/%Y\") as \"Date de retour pr\�vu\" from pret left join exemplaires on pret_idexpl=expl_id left join notices n1 on expl_notice=n1.notice_id left join responsability on responsability_notice=n1.notice_id and responsability_type=0  left join authors on author_id=responsability_author left join bulletins on expl_bulletin=bulletin_id left join notices nperio on bulletin_notice=nperio.notice_id left join empr on id_empr=pret_idempr where empr_location in (!!localisation!!) order by pret_retour ASC, empr_nom ASC, empr_prenom ASC','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"localisation\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[localisation]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\n <MULTIPLE>yes</MULTIPLE>\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\n</OPTIONS>\n </FIELD>\n</FIELDS>',19,0,''),(356,'Liste des prêts en cours par localisation et section','select concat(\'<a href=./circ.php?categ=visu_ex&form_cb_expl=\',expl_cb,\'>\',expl_cb,\'</a>\') as \"Code-barre\",expl_cote as Cote, concat(if(notices_m.notice_id is not null,concat(\'<a href=./catalog.php?categ=isbd&id=\',notices_m.notice_id,\'>\'),concat(\'<a href=./catalog.php?categ=serials&sub=bulletinage&action=view&bul_id=\',bulletin_id,\'>\')),ifnull(notices_m.tit1,notices_s.tit1),\' \',ifnull(bulletin_numero,\'\'),\' \',ifnull(mention_date,\'\'),\'</a>\') as Titre, section_libelle as Section, location_libelle as Localisation, concat(\'<a href=./circ.php?categ=pret&form_cb=\',empr_cb,\'>\',empr_nom, \', \',empr_prenom,\'</a>\') as Emprunteur, date_format(pret_date,\"%d-%m-%Y\") as Sortie, date_format(pret_retour,\"%d-%m-%Y\") as Retour FROM (((exemplaires LEFT JOIN notices AS notices_m ON expl_notice = notices_m.notice_id ) LEFT JOIN bulletins ON expl_bulletin = bulletins.bulletin_id) LEFT JOIN notices AS notices_s ON bulletin_notice = notices_s.notice_id) left join docs_section on expl_section=idsection left join docs_location on expl_location=idlocation left join pret on expl_id=pret_idexpl left join empr on pret_idempr=id_empr where expl_location in (!!choixloca!!) and expl_section in (!!choixsection!!) and id_empr is not null order by 6 ASC','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"choixloca\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Localisation(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlocation, location_libelle from docs_location order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"choixsection\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Section(s) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section order by 2]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',19,0,''),(357,'Attribuer pour un utilisateur les mêmes droits sur les paniers en partie catalogue que ceux d\'un autre utilisateur','UPDATE caddie\r\nSET autorisations=CONCAT(autorisations,\' \',\'!!userarattacher!!\')\r\nWHERE (autorisations=\"!!usermodele!!\" \r\nOR autorisations LIKE \"!!usermodele!! %\"  \r\nOR autorisations LIKE \"% !!usermodele!! %\" \r\nOR autorisations LIKE \"% !!usermodele!!\")\r\nAND (autorisations!=\"!!userarattacher!!\" \r\nAND autorisations NOT LIKE \"!!userarattacher!! %\"  \r\nAND autorisations NOT LIKE \"% !!userarattacher!! %\" \r\nAND autorisations NOT LIKE \"% !!userarattacher!!\" )','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"userarattacher\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Attribution des droits à l\'utilisateur (Destination) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT userid, username FROM users ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"usermodele\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Sélectionner l\'utilisateur dont les droits sont à dupliquer (Source) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT userid, username FROM users ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',2,0,''),(358,'Attribuer pour un utilisateur les mêmes droits sur les paniers en partie circulation que ceux d\'un autre utilisateur','UPDATE empr_caddie\r\nSET autorisations=CONCAT(autorisations,\' \',\'!!userarattacher!!\')\r\nWHERE (autorisations=\"!!usermodele!!\" \r\nOR autorisations LIKE \"!!usermodele!! %\"  \r\nOR autorisations LIKE \"% !!usermodele!! %\" \r\nOR autorisations LIKE \"% !!usermodele!!\")\r\nAND (autorisations!=\"!!userarattacher!!\" \r\nAND autorisations NOT LIKE \"!!userarattacher!! %\"  \r\nAND autorisations NOT LIKE \"% !!userarattacher!! %\" \r\nAND autorisations NOT LIKE \"% !!userarattacher!!\" )','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"userarattacher\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Attribution des droits à l\'utilisateur (Destination) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT userid, username FROM users ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"usermodele\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Sélectionner l\'utilisateur dont les droits sont à dupliquer (Source) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT userid, username FROM users ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',2,0,''),(359,'Attribuer pour un utilisateur les mêmes droits sur les procédures de paniers en partie catalogue que ceux d\'un autre utilisateur','UPDATE caddie_procs\r\nSET autorisations=CONCAT(autorisations,\' \',\'!!userarattacher!!\')\r\nWHERE (autorisations=\"!!usermodele!!\" \r\nOR autorisations LIKE \"!!usermodele!! %\"  \r\nOR autorisations LIKE \"% !!usermodele!! %\" \r\nOR autorisations LIKE \"% !!usermodele!!\")\r\nAND (autorisations!=\"!!userarattacher!!\" \r\nAND autorisations NOT LIKE \"!!userarattacher!! %\"  \r\nAND autorisations NOT LIKE \"% !!userarattacher!! %\" \r\nAND autorisations NOT LIKE \"% !!userarattacher!!\" )','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"userarattacher\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Attribution des droits à l\'utilisateur (Destination) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT userid, username FROM users ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"usermodele\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Sélectionner l\'utilisateur dont les droits sont à dupliquer (Source) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT userid, username FROM users ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',2,0,''),(360,'Attribuer pour un utilisateur les mêmes droits sur les procédures de paniers en partie circulation que ceux d\'un autre utilisateur','UPDATE empr_caddie_procs\r\nSET autorisations=CONCAT(autorisations,\' \',\'!!userarattacher!!\')\r\nWHERE (autorisations=\"!!usermodele!!\" \r\nOR autorisations LIKE \"!!usermodele!! %\"  \r\nOR autorisations LIKE \"% !!usermodele!! %\" \r\nOR autorisations LIKE \"% !!usermodele!!\")\r\nAND (autorisations!=\"!!userarattacher!!\" \r\nAND autorisations NOT LIKE \"!!userarattacher!! %\"  \r\nAND autorisations NOT LIKE \"% !!userarattacher!! %\" \r\nAND autorisations NOT LIKE \"% !!userarattacher!!\" )','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"userarattacher\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Attribution des droits à l\'utilisateur (Destination) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT userid, username FROM users ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"usermodele\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Sélectionner l\'utilisateur dont les droits sont à dupliquer (Source) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT userid, username FROM users ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',2,0,''),(361,'Attribuer pour un utilisateur les mêmes droits sur les statistiques que ceux d\'un autre utilisateur','UPDATE procs\r\nSET autorisations=CONCAT(autorisations,\' \',\'!!userarattacher!!\')\r\nWHERE (autorisations=\"!!usermodele!!\" \r\nOR autorisations LIKE \"!!usermodele!! %\"  \r\nOR autorisations LIKE \"% !!usermodele!! %\" \r\nOR autorisations LIKE \"% !!usermodele!!\")\r\nAND (autorisations!=\"!!userarattacher!!\" \r\nAND autorisations NOT LIKE \"!!userarattacher!! %\"  \r\nAND autorisations NOT LIKE \"% !!userarattacher!! %\" \r\nAND autorisations NOT LIKE \"% !!userarattacher!!\" )','','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"userarattacher\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Attribution des droits à l\'utilisateur (Destination) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT userid, username FROM users ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"usermodele\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Sélectionner l\'utilisateur dont les droits sont à dupliquer (Source) :]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>SELECT userid, username FROM users ORDER BY 2</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',2,0,''),(1,'Lista ejemplares / estado','select expl_cote as Cote, expl_cb as \"Code-barres\", CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre from exemplaires left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id where expl_statut=!!param1!! order by expl_cote','Lista parametrada de ejempalres por estado','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Estado]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idstatut,statut_libelle from docs_statut]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[Selecciona un estado]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',0,0,''),(2,'Recuento ejemplares / estado','select statut_libelle as Statut, count(*) as Nombre from exemplaires, docs_statut where idstatut=expl_statut group by statut_libelle order by idstatut','Número de ejemplares por estado de ejemplar','1 4 3 2',NULL,0,0,''),(3,'Recuento ejemplares / propietario / estado','select lender_libelle as Propri\�taire, statut_libelle as Statut, count(*) as Nombre from exemplaires, lenders, docs_statut where expl_owner=idlender and expl_statut=idstatut group by lender_libelle,statut_libelle order by lender_libelle,statut_libelle ','Número de ejemplares por propietario y por estado de ejemplar','1 4 3 2',NULL,0,0,''),(4,'Lista de ejemplare de un propietario / estado','select lender_libelle as Propri\�taire, statut_libelle as Statut, expl_cote as Cote, expl_cb as \"Code-barres\", CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre from exemplaires, docs_statut, lenders left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id where expl_statut=!!statut!! and expl_owner=!!Proprietaire!! and expl_statut=idstatut and expl_owner=idlender order by lender_libelle, statut_libelle, expl_cote, expl_cb ','Lista de ejemplares de un propietari por estado, signatura, código de barras, título  (práctico para hacer listas de documentos no marcados antes de una importación)','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"statut\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Estado]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idstatut, statut_libelle from docs_statut</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"Proprietaire\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propietario]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',0,0,''),(5,'Recuento ejemplares / sección','select section_libelle as Section, count(*) as Nombre from exemplaires, docs_section where idsection=expl_section group by idsection, section_libelle order by idsection','Número de ejemplares por sección','1 4 3 2',NULL,0,0,''),(6,'Lista de ejemplares para una o más secciones por propietario','select section_libelle as Section, expl_cote as Cote, expl_cb as \"Code-barres\", CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre from exemplaires, docs_section, lenders left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id where idsection in (!!sections!!) and expl_owner=!!preteur!! and expl_section=idsection and expl_owner=idlender order by section_libelle, expl_cote, expl_cb ','Lista de ejemplares de una o más secciones para un propietario','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"sections\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Sección(es)]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idsection, section_libelle from docs_section]]></QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"preteur\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propietario]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY><![CDATA[select idlender, lender_libelle from lenders order by idlender]]></QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[Escoge un propietario]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',0,0,''),(7,'Estado : Recuento ejemplares / proprietario','select lender_libelle as Propri\�taire, count(*) as Nombre from exemplaires, lenders where idlender=expl_owner group by expl_owner, lender_libelle','Núm de ejemmplares por propietario de ejemplar','1 4 3 2',NULL,0,0,''),(8,'Lista ejemplares para un propietario','select expl_cote as Cote, expl_cb as \"Code-barres\", CASE WHEN expl_notice>0 THEN concat(CASE WHEN serie_name IS NOT NULL THEN CONCAT(serie_name, \" : \") ELSE \"\" END, n1.tit1) ELSE CONCAT(n2.tit1,\" \",bulletin_numero,\" \") END as Titre from exemplaires, docs_statut, lenders left join notices n1 on expl_notice=n1.notice_id left join series on n1.tparent_id=serie_id left join bulletins on expl_bulletin=bulletin_id left join notices n2 on bulletin_notice=n2.notice_id where expl_owner=!!proprietaire!! and expl_statut=idstatut and expl_owner=idlender order by  expl_cote, expl_cb ','Lista de los ejemplares para un propietario ordenados por signatura y código de barras','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"proprietaire\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Propiétario]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select idlender, lender_libelle from lenders order by idlender</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\">Escoge un propietario</UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',0,0,''),(9,'Recuento usuarios / categoría','select libelle as Cat\�gorie, count(*) as \'Nombre lecteurs\' from empr, empr_categ where id_categ_empr=empr_categ group by libelle order by libelle','Número de usuarios por categoría','1 4 3 2',NULL,0,0,''),(10,'Lista usuarios / categorías','select libelle as Cat\�gorie, empr_nom as Nom, empr_prenom as Pr\�nom, empr_year as \"Ann\�e de naissance\" from empr, empr_categ where id_categ_empr=empr_categ order by libelle, empr_nom, empr_prenom','Lista de usuarios por categorías de usuario, usuario','1 2',NULL,0,0,''),(11,'Estadísticas : Recuento de préstamos / categorías de usuarios en un año','SELECT CASE WHEN libelle IS NULL THEN \" Cat\�gorie de lecteurs inconnue\" ELSE libelle END as Cat\�gorie, count(*) as \"Nombre de pr\�ts\" FROM pret_archive LEFT JOIN empr_categ ON id_categ_empr = arc_empr_categ where year(arc_debut) = \'!!param1!!\' group by arc_empr_categ order by Cat\�gorie','Número de préstamos por categoría de usuarios en un año','1 5 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[año]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS></OPTIONS>\n </FIELD>\n <FIELD NAME=\"mois\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[mes]]></ALIAS>\n  <TYPE>list</TYPE>\n<OPTIONS FOR=\"list\">\r\n <MULTIPLE>yes</MULTIPLE>\r\n <ITEMS>\r\n  <ITEM VALUE=\"1\"><![CDATA[Enero]]></ITEM>\r\n  <ITEM VALUE=\"2\"><![CDATA[Febrero]]></ITEM>\r\n  <ITEM VALUE=\"3\"><![CDATA[Marzo]]></ITEM>\r\n  <ITEM VALUE=\"4\"><![CDATA[Abril]]></ITEM>\r\n  <ITEM VALUE=\"5\"><![CDATA[Mayo]]></ITEM>\r\n  <ITEM VALUE=\"6\"><![CDATA[Junio]]></ITEM>\r\n  <ITEM VALUE=\"7\"><![CDATA[Julio]]></ITEM>\r\n  <ITEM VALUE=\"8\"><![CDATA[Agosto]]></ITEM>\r\n  <ITEM VALUE=\"9\"><![CDATA[Septiembre]]></ITEM>\r\n  <ITEM VALUE=\"10\"><![CDATA[Octubre]]></ITEM>\r\n  <ITEM VALUE=\"11\"><![CDATA[Noviembre]]></ITEM>\r\n  <ITEM VALUE=\"12\"><![CDATA[Diciembre]]></ITEM>\r\n </ITEMS>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',0,0,''),(12,'Estadísticas : Recuento de usuarios / edad','SELECT CASE WHEN  (!!param1!! - empr_year) <= 13 THEN \' Jusque 13 ans\' WHEN (!!param1!! - empr_year) >13 and (!!param1!! - empr_year)<=24 THEN \'14 \� 24 ans\' WHEN (!!param1!! - empr_year)>24 and (!!param1!! - empr_year)<=59 THEN \'25 \� 59 ans\' WHEN (!!param1!! - empr_year)>59 THEN \'60 ans et plus\'  ELSE \'erreur sur age\' END as \"Tranche d\'\�ge\", count(*) as Nombre from empr where empr_categ in (!!categorie!!) and (year(empr_date_expiration)=!!param1!! or year(empr_date_adhesion)=!!param1!!) group by 1','Núm. de usuarios por franjas de edad en un año','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Año de cálculo]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"categorie\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Categoría]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by libelle</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',0,0,''),(13,'Estadísticas : Recuento de usuarios / sexo / edad','SELECT case when empr_sexe=\'1\' then \'Hommes\' when empr_sexe=\'2\' then \'Femmes\' else \'erreur sur sexe\' end as Sexe, CASE WHEN  (!!param1!! - empr_year) <= 13 THEN \'Jusque 13 ans\' WHEN (!!param1!! - empr_year) >13 and (!!param1!! - empr_year) <= 24 THEN \'14 \� 24 ans\' WHEN (!!param1!! - empr_year) >24 and (!!param1!! - empr_year) <= 59 THEN \'25 \� 59 ans\' WHEN (!!param1!! - empr_year) >59 THEN \'60 ans et plus\'  ELSE \'erreur sur age\' END as \"Tranche d\'\�ge\", count(*) as Nombre from empr where empr_categ in (!!categorie!!) and (year(empr_date_expiration)=!!param1!! or year(empr_date_adhesion)=!!param1!!) group by sexe, 2','Núm. de usuarios por sexo y por franja de edad para un año','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Año de cálculo]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n <FIELD NAME=\"categorie\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Categoría]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by libelle</QUERY>\r\n <MULTIPLE>no</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',0,0,''),(14,'Estadísticas : Recuento de usuarios / población / categoría','select empr_ville as Ville, count(*) as Nbre from empr where empr_categ in (!!categorie!!) and (year(empr_date_expiration)=!!annee!! or year(empr_date_adhesion)=!!annee!!) group by empr_ville order by empr_ville','Número de usuarios por población de residencia para una o más categorías','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"categorie\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Categoria]]></ALIAS>\n  <TYPE>query_list</TYPE>\n<OPTIONS FOR=\"query_list\">\r\n <QUERY>select id_categ_empr, libelle from empr_categ order by libelle</QUERY>\r\n <MULTIPLE>yes</MULTIPLE>\r\n <UNSELECT_ITEM VALUE=\"\"></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"annee\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Año de cálculo]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',0,0,''),(15,'Estadísticas : Recuento de préstamos por mes','SELECT year(arc_debut) as Ann\�e, month(arc_debut) as Mois, count(*) as \"Nombre de pr\�ts\" FROM pret_archive where year(arc_debut) = \'!!param1!!\' group by 1, 2 order by 1, 2','Número total de préstamos para un año','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Año de cálculo]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>5</SIZE>\r\n <MAXSIZE>4</MAXSIZE>\r\n</OPTIONS> \n </FIELD>\n</FIELDS>',0,0,''),(16,'Estadísticas : Recuento de préstamos / sección para un año','SELECT CASE WHEN section_libelle IS NULL THEN \" Section supprim\�e\" ELSE section_libelle END as Section, count(*) as \"Nombre de pr\�ts\" FROM pret_archive LEFT JOIN docs_section ON idsection = arc_expl_section where year(arc_debut) = \'!!param1!!\' group by arc_expl_section order by Section','Número de préstamos por sección para un año','1 4 3 2','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"param1\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[año]]></ALIAS>\n  <TYPE>text</TYPE>\n<OPTIONS FOR=\"text\">\r\n <SIZE>20</SIZE>\r\n <MAXSIZE>255</MAXSIZE>\r\n</OPTIONS>\n </FIELD>\n <FIELD NAME=\"mois\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[mes]]></ALIAS>\n  <TYPE>list</TYPE>\n<OPTIONS FOR=\"list\">\r\n <MULTIPLE>yes</MULTIPLE>\r\n <ITEMS>\r\n  <ITEM VALUE=\"1\"><![CDATA[Enero]]></ITEM>\r\n  <ITEM VALUE=\"2\"><![CDATA[Febrero]]></ITEM>\r\n  <ITEM VALUE=\"3\"><![CDATA[Marzo]]></ITEM>\r\n  <ITEM VALUE=\"4\"><![CDATA[Abril]]></ITEM>\r\n  <ITEM VALUE=\"5\"><![CDATA[Mayo]]></ITEM>\r\n  <ITEM VALUE=\"6\"><![CDATA[Junio]]></ITEM>\r\n  <ITEM VALUE=\"7\"><![CDATA[Julio]]></ITEM>\r\n  <ITEM VALUE=\"8\"><![CDATA[Août]]></ITEM>\r\n  <ITEM VALUE=\"9\"><![CDATA[Septiembre]]></ITEM>\r\n  <ITEM VALUE=\"10\"><![CDATA[Octubre]]></ITEM>\r\n  <ITEM VALUE=\"11\"><![CDATA[Noviembre]]></ITEM>\r\n  <ITEM VALUE=\"12\"><![CDATA[Diciembre]]></ITEM>\r\n </ITEMS>\r\n <UNSELECT_ITEM VALUE=\"\"><![CDATA[]]></UNSELECT_ITEM>\r\n</OPTIONS>\n </FIELD>\n</FIELDS>',0,0,''),(362,'LLIUREX_RENOV:Canvi de data de finalització de l\'abonament ','Update empr set empr_date_expiration=\'!!date!!\' where empr_date_expiration<curdate()','Acció per a renovar als usuaris que tenen caducat l\'abonament','1','<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n<FIELDS>\n <FIELD NAME=\"date\" MANDATORY=\"yes\">\n  <ALIAS><![CDATA[Seleccione la nova data de caducitat:]]></ALIAS>\n  <TYPE>date_box</TYPE>\n<OPTIONS FOR=\"date_box\"></OPTIONS>\n </FIELD>\n</FIELDS>',20,0,'');
/*!40000 ALTER TABLE `procs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_classements`
--

DROP TABLE IF EXISTS `procs_classements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs_classements` (
  `idproc_classement` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `libproc_classement` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idproc_classement`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_classements`
--

LOCK TABLES `procs_classements` WRITE;
/*!40000 ALTER TABLE `procs_classements` DISABLE KEYS */;
INSERT INTO `procs_classements` VALUES (2,'Autorisations'),(5,'Statistiques DLL'),(9,'Statistiques - lecteurs'),(14,'Statistiques - exemplaires'),(15,'Statistiques - prêts'),(16,'Listes - exemplaires'),(17,'Listes - lecteurs'),(18,'Actions - Nettoyage'),(19,'Listes - prêts'),(20,'Migration');
/*!40000 ALTER TABLE `procs_classements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_custom`
--

DROP TABLE IF EXISTS `publisher_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_custom`
--

LOCK TABLES `publisher_custom` WRITE;
/*!40000 ALTER TABLE `publisher_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_custom_lists`
--

DROP TABLE IF EXISTS `publisher_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_custom_lists` (
  `publisher_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `publisher_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `editorial_custom_champ` (`publisher_custom_champ`),
  KEY `editorial_champ_list_value` (`publisher_custom_champ`,`publisher_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_custom_lists`
--

LOCK TABLES `publisher_custom_lists` WRITE;
/*!40000 ALTER TABLE `publisher_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_custom_values`
--

DROP TABLE IF EXISTS `publisher_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_custom_values` (
  `publisher_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `publisher_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `publisher_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher_custom_text` text COLLATE utf8_unicode_ci,
  `publisher_custom_integer` int(11) DEFAULT NULL,
  `publisher_custom_date` date DEFAULT NULL,
  `publisher_custom_float` float DEFAULT NULL,
  KEY `editorial_custom_champ` (`publisher_custom_champ`),
  KEY `editorial_custom_origine` (`publisher_custom_origine`),
  KEY `i_pcv_st` (`publisher_custom_small_text`),
  KEY `i_pcv_t` (`publisher_custom_text`(255)),
  KEY `i_pcv_i` (`publisher_custom_integer`),
  KEY `i_pcv_d` (`publisher_custom_date`),
  KEY `i_pcv_f` (`publisher_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_custom_values`
--

LOCK TABLES `publisher_custom_values` WRITE;
/*!40000 ALTER TABLE `publisher_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `ed_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ed_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ed_adr1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ed_adr2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ed_cp` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ed_ville` varchar(96) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ed_pays` varchar(96) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ed_web` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `index_publisher` text COLLATE utf8_unicode_ci,
  `ed_comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ed_id`),
  KEY `ed_name` (`ed_name`),
  KEY `ed_ville` (`ed_ville`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas`
--

DROP TABLE IF EXISTS `quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas` (
  `quota_type` int(10) unsigned NOT NULL DEFAULT '0',
  `constraint_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `elements` int(10) unsigned NOT NULL DEFAULT '0',
  `value` float DEFAULT NULL,
  PRIMARY KEY (`quota_type`,`constraint_type`,`elements`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas`
--

LOCK TABLES `quotas` WRITE;
/*!40000 ALTER TABLE `quotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas_finance`
--

DROP TABLE IF EXISTS `quotas_finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas_finance` (
  `quota_type` int(10) unsigned NOT NULL DEFAULT '0',
  `constraint_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `elements` int(10) unsigned NOT NULL DEFAULT '0',
  `value` float DEFAULT NULL,
  PRIMARY KEY (`quota_type`,`constraint_type`,`elements`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas_finance`
--

LOCK TABLES `quotas_finance` WRITE;
/*!40000 ALTER TABLE `quotas_finance` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotas_finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas_opac_views`
--

DROP TABLE IF EXISTS `quotas_opac_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas_opac_views` (
  `quota_type` int(10) unsigned NOT NULL DEFAULT '0',
  `constraint_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `elements` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`quota_type`,`constraint_type`,`elements`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas_opac_views`
--

LOCK TABLES `quotas_opac_views` WRITE;
/*!40000 ALTER TABLE `quotas_opac_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotas_opac_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rapport_demandes`
--

DROP TABLE IF EXISTS `rapport_demandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rapport_demandes` (
  `id_item` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenu` text COLLATE utf8_unicode_ci NOT NULL,
  `num_note` int(10) NOT NULL DEFAULT '0',
  `num_demande` int(10) NOT NULL DEFAULT '0',
  `ordre` mediumint(3) NOT NULL DEFAULT '0',
  `type` mediumint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rapport_demandes`
--

LOCK TABLES `rapport_demandes` WRITE;
/*!40000 ALTER TABLE `rapport_demandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rapport_demandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdfstore_g2t`
--

DROP TABLE IF EXISTS `rdfstore_g2t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdfstore_g2t` (
  `g` mediumint(8) unsigned NOT NULL,
  `t` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `gt` (`g`,`t`),
  KEY `tg` (`t`,`g`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdfstore_g2t`
--

LOCK TABLES `rdfstore_g2t` WRITE;
/*!40000 ALTER TABLE `rdfstore_g2t` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdfstore_g2t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdfstore_id2val`
--

DROP TABLE IF EXISTS `rdfstore_id2val`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdfstore_id2val` (
  `id` mediumint(8) unsigned NOT NULL,
  `misc` tinyint(1) NOT NULL DEFAULT '0',
  `val` text COLLATE utf8_unicode_ci NOT NULL,
  `val_type` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`val_type`),
  KEY `v` (`val`(64))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdfstore_id2val`
--

LOCK TABLES `rdfstore_id2val` WRITE;
/*!40000 ALTER TABLE `rdfstore_id2val` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdfstore_id2val` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdfstore_index`
--

DROP TABLE IF EXISTS `rdfstore_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdfstore_index` (
  `num_triple` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_uri` text CHARACTER SET utf8 NOT NULL,
  `subject_type` text COLLATE utf8_unicode_ci NOT NULL,
  `predicat_uri` text CHARACTER SET utf8 NOT NULL,
  `num_object` int(10) unsigned NOT NULL DEFAULT '0',
  `object_val` text CHARACTER SET utf8 NOT NULL,
  `object_index` text CHARACTER SET utf8 NOT NULL,
  `object_lang` char(5) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`num_object`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdfstore_index`
--

LOCK TABLES `rdfstore_index` WRITE;
/*!40000 ALTER TABLE `rdfstore_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdfstore_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdfstore_o2val`
--

DROP TABLE IF EXISTS `rdfstore_o2val`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdfstore_o2val` (
  `id` mediumint(8) unsigned NOT NULL,
  `misc` tinyint(1) NOT NULL DEFAULT '0',
  `val_hash` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `val` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `vh` (`val_hash`),
  KEY `v` (`val`(64))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdfstore_o2val`
--

LOCK TABLES `rdfstore_o2val` WRITE;
/*!40000 ALTER TABLE `rdfstore_o2val` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdfstore_o2val` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdfstore_s2val`
--

DROP TABLE IF EXISTS `rdfstore_s2val`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdfstore_s2val` (
  `id` mediumint(8) unsigned NOT NULL,
  `misc` tinyint(1) NOT NULL DEFAULT '0',
  `val_hash` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `val` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `vh` (`val_hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdfstore_s2val`
--

LOCK TABLES `rdfstore_s2val` WRITE;
/*!40000 ALTER TABLE `rdfstore_s2val` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdfstore_s2val` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdfstore_setting`
--

DROP TABLE IF EXISTS `rdfstore_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdfstore_setting` (
  `k` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `val` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `k` (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdfstore_setting`
--

LOCK TABLES `rdfstore_setting` WRITE;
/*!40000 ALTER TABLE `rdfstore_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdfstore_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdfstore_triple`
--

DROP TABLE IF EXISTS `rdfstore_triple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdfstore_triple` (
  `t` mediumint(8) unsigned NOT NULL,
  `s` mediumint(8) unsigned NOT NULL,
  `p` mediumint(8) unsigned NOT NULL,
  `o` mediumint(8) unsigned NOT NULL,
  `o_lang_dt` mediumint(8) unsigned NOT NULL,
  `o_comp` char(35) COLLATE utf8_unicode_ci NOT NULL,
  `s_type` tinyint(1) NOT NULL DEFAULT '0',
  `o_type` tinyint(1) NOT NULL DEFAULT '0',
  `misc` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `t` (`t`),
  KEY `sp` (`s`,`p`),
  KEY `os` (`o`,`s`),
  KEY `po` (`p`,`o`),
  KEY `misc` (`misc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdfstore_triple`
--

LOCK TABLES `rdfstore_triple` WRITE;
/*!40000 ALTER TABLE `rdfstore_triple` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdfstore_triple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recouvrements`
--

DROP TABLE IF EXISTS `recouvrements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recouvrements` (
  `recouvr_id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `empr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `id_expl` int(10) unsigned NOT NULL DEFAULT '0',
  `date_rec` date NOT NULL DEFAULT '0000-00-00',
  `libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `montant` decimal(16,2) DEFAULT '0.00',
  `recouvr_type` int(2) unsigned NOT NULL DEFAULT '0',
  `date_pret` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_relance1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_relance2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_relance3` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`recouvr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recouvrements`
--

LOCK TABLES `recouvrements` WRITE;
/*!40000 ALTER TABLE `recouvrements` DISABLE KEYS */;
/*!40000 ALTER TABLE `recouvrements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resa`
--

DROP TABLE IF EXISTS `resa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resa` (
  `id_resa` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resa_idempr` int(10) unsigned NOT NULL DEFAULT '0',
  `resa_idnotice` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `resa_idbulletin` int(8) unsigned NOT NULL DEFAULT '0',
  `resa_date` datetime DEFAULT NULL,
  `resa_date_debut` date NOT NULL DEFAULT '0000-00-00',
  `resa_date_fin` date NOT NULL DEFAULT '0000-00-00',
  `resa_cb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resa_confirmee` int(1) unsigned NOT NULL DEFAULT '0',
  `resa_loc_retrait` smallint(5) unsigned NOT NULL DEFAULT '0',
  `resa_arc` int(10) unsigned NOT NULL DEFAULT '0',
  `resa_planning_id_resa` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_resa`),
  KEY `resa_date_fin` (`resa_date_fin`),
  KEY `resa_date` (`resa_date`),
  KEY `resa_cb` (`resa_cb`),
  KEY `i_idbulletin` (`resa_idbulletin`),
  KEY `i_idnotice` (`resa_idnotice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resa`
--

LOCK TABLES `resa` WRITE;
/*!40000 ALTER TABLE `resa` DISABLE KEYS */;
/*!40000 ALTER TABLE `resa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resa_archive`
--

DROP TABLE IF EXISTS `resa_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resa_archive` (
  `resarc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resarc_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `resarc_debut` date NOT NULL DEFAULT '0000-00-00',
  `resarc_fin` date NOT NULL DEFAULT '0000-00-00',
  `resarc_idnotice` int(10) unsigned NOT NULL DEFAULT '0',
  `resarc_idbulletin` int(10) unsigned NOT NULL DEFAULT '0',
  `resarc_confirmee` int(1) unsigned DEFAULT '0',
  `resarc_cb` varchar(14) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resarc_loc_retrait` smallint(5) unsigned DEFAULT '0',
  `resarc_from_opac` int(1) unsigned DEFAULT '0',
  `resarc_anulee` int(1) unsigned DEFAULT '0',
  `resarc_pretee` int(1) unsigned DEFAULT '0',
  `resarc_arcpretid` int(10) unsigned NOT NULL DEFAULT '0',
  `resarc_id_empr` int(10) unsigned NOT NULL DEFAULT '0',
  `resarc_empr_cp` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resarc_empr_ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resarc_empr_prof` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resarc_empr_year` int(4) unsigned DEFAULT '0',
  `resarc_empr_categ` smallint(5) unsigned DEFAULT '0',
  `resarc_empr_codestat` smallint(5) unsigned DEFAULT '0',
  `resarc_empr_sexe` tinyint(3) unsigned DEFAULT '0',
  `resarc_empr_location` int(6) unsigned NOT NULL DEFAULT '1',
  `resarc_expl_nb` int(5) unsigned DEFAULT '0',
  `resarc_expl_typdoc` int(5) unsigned DEFAULT '0',
  `resarc_expl_cote` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resarc_expl_statut` smallint(5) unsigned DEFAULT '0',
  `resarc_expl_location` smallint(5) unsigned DEFAULT '0',
  `resarc_expl_codestat` smallint(5) unsigned DEFAULT '0',
  `resarc_expl_owner` mediumint(8) unsigned DEFAULT '0',
  `resarc_expl_section` int(5) unsigned NOT NULL DEFAULT '0',
  `resarc_resa_planning_id_resa` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`resarc_id`),
  KEY `i_pa_idempr` (`resarc_id_empr`),
  KEY `i_pa_notice` (`resarc_idnotice`),
  KEY `i_pa_bulletin` (`resarc_idbulletin`),
  KEY `i_pa_resarc_date` (`resarc_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resa_archive`
--

LOCK TABLES `resa_archive` WRITE;
/*!40000 ALTER TABLE `resa_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `resa_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resa_loc`
--

DROP TABLE IF EXISTS `resa_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resa_loc` (
  `resa_loc` int(8) unsigned NOT NULL DEFAULT '0',
  `resa_emprloc` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`resa_loc`,`resa_emprloc`),
  KEY `i_resa_emprloc` (`resa_emprloc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resa_loc`
--

LOCK TABLES `resa_loc` WRITE;
/*!40000 ALTER TABLE `resa_loc` DISABLE KEYS */;
/*!40000 ALTER TABLE `resa_loc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resa_planning`
--

DROP TABLE IF EXISTS `resa_planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resa_planning` (
  `id_resa` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resa_idempr` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `resa_idnotice` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `resa_idbulletin` int(8) unsigned NOT NULL DEFAULT '0',
  `resa_date` datetime DEFAULT NULL,
  `resa_date_debut` date NOT NULL DEFAULT '0000-00-00',
  `resa_date_fin` date NOT NULL DEFAULT '0000-00-00',
  `resa_validee` int(1) unsigned NOT NULL DEFAULT '0',
  `resa_confirmee` int(1) unsigned NOT NULL DEFAULT '0',
  `resa_loc_retrait` int(5) unsigned NOT NULL DEFAULT '0',
  `resa_qty` int(5) unsigned NOT NULL DEFAULT '1',
  `resa_remaining_qty` int(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_resa`),
  KEY `resa_date_fin` (`resa_date_fin`),
  KEY `resa_date` (`resa_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resa_planning`
--

LOCK TABLES `resa_planning` WRITE;
/*!40000 ALTER TABLE `resa_planning` DISABLE KEYS */;
/*!40000 ALTER TABLE `resa_planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resa_ranger`
--

DROP TABLE IF EXISTS `resa_ranger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resa_ranger` (
  `resa_cb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`resa_cb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resa_ranger`
--

LOCK TABLES `resa_ranger` WRITE;
/*!40000 ALTER TABLE `resa_ranger` DISABLE KEYS */;
/*!40000 ALTER TABLE `resa_ranger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsability`
--

DROP TABLE IF EXISTS `responsability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsability` (
  `responsability_author` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `responsability_notice` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `responsability_fonction` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `responsability_type` mediumint(1) unsigned NOT NULL DEFAULT '0',
  `responsability_ordre` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`responsability_author`,`responsability_notice`,`responsability_fonction`),
  KEY `responsability_notice` (`responsability_notice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsability`
--

LOCK TABLES `responsability` WRITE;
/*!40000 ALTER TABLE `responsability` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsability_tu`
--

DROP TABLE IF EXISTS `responsability_tu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsability_tu` (
  `responsability_tu_author_num` int(10) unsigned NOT NULL DEFAULT '0',
  `responsability_tu_num` int(10) unsigned NOT NULL DEFAULT '0',
  `responsability_tu_fonction` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `responsability_tu_type` int(10) unsigned NOT NULL DEFAULT '0',
  `responsability_tu_ordre` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`responsability_tu_author_num`,`responsability_tu_num`,`responsability_tu_fonction`),
  KEY `responsability_tu_author` (`responsability_tu_author_num`),
  KEY `responsability_tu_num` (`responsability_tu_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsability_tu`
--

LOCK TABLES `responsability_tu` WRITE;
/*!40000 ALTER TABLE `responsability_tu` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsability_tu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rss_content`
--

DROP TABLE IF EXISTS `rss_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rss_content` (
  `rss_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rss_content` longblob NOT NULL,
  `rss_content_parse` longblob NOT NULL,
  `rss_last` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rss_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rss_content`
--

LOCK TABLES `rss_content` WRITE;
/*!40000 ALTER TABLE `rss_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `rss_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rss_flux`
--

DROP TABLE IF EXISTS `rss_flux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rss_flux` (
  `id_rss_flux` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `nom_rss_flux` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_rss_flux` blob NOT NULL,
  `descr_rss_flux` blob NOT NULL,
  `lang_rss_flux` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fr',
  `copy_rss_flux` blob NOT NULL,
  `editor_rss_flux` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `webmaster_rss_flux` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ttl_rss_flux` int(9) unsigned NOT NULL DEFAULT '60',
  `img_url_rss_flux` blob NOT NULL,
  `img_title_rss_flux` blob NOT NULL,
  `img_link_rss_flux` blob NOT NULL,
  `format_flux` blob NOT NULL,
  `rss_flux_content` longblob NOT NULL,
  `rss_flux_last` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `export_court_flux` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tpl_rss_flux` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rss_flux`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rss_flux`
--

LOCK TABLES `rss_flux` WRITE;
/*!40000 ALTER TABLE `rss_flux` DISABLE KEYS */;
/*!40000 ALTER TABLE `rss_flux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rss_flux_content`
--

DROP TABLE IF EXISTS `rss_flux_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rss_flux_content` (
  `num_rss_flux` int(9) unsigned NOT NULL DEFAULT '0',
  `type_contenant` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BAN',
  `num_contenant` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_rss_flux`,`type_contenant`,`num_contenant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rss_flux_content`
--

LOCK TABLES `rss_flux_content` WRITE;
/*!40000 ALTER TABLE `rss_flux_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `rss_flux_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubriques`
--

DROP TABLE IF EXISTS `rubriques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubriques` (
  `id_rubrique` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `num_budget` int(8) unsigned NOT NULL DEFAULT '0',
  `num_parent` int(8) unsigned NOT NULL DEFAULT '0',
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `commentaires` text COLLATE utf8_unicode_ci NOT NULL,
  `montant` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  `num_cp_compta` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `autorisations` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_rubrique`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubriques`
--

LOCK TABLES `rubriques` WRITE;
/*!40000 ALTER TABLE `rubriques` DISABLE KEYS */;
/*!40000 ALTER TABLE `rubriques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sauv_lieux`
--

DROP TABLE IF EXISTS `sauv_lieux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sauv_lieux` (
  `sauv_lieu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sauv_lieu_nom` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sauv_lieu_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sauv_lieu_protocol` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'file',
  `sauv_lieu_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sauv_lieu_login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sauv_lieu_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sauv_lieu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sauv_lieux`
--

LOCK TABLES `sauv_lieux` WRITE;
/*!40000 ALTER TABLE `sauv_lieux` DISABLE KEYS */;
/*!40000 ALTER TABLE `sauv_lieux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sauv_log`
--

DROP TABLE IF EXISTS `sauv_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sauv_log` (
  `sauv_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sauv_log_start_date` date DEFAULT NULL,
  `sauv_log_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sauv_log_succeed` int(11) DEFAULT '0',
  `sauv_log_messages` mediumtext COLLATE utf8_unicode_ci,
  `sauv_log_userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sauv_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sauv_log`
--

LOCK TABLES `sauv_log` WRITE;
/*!40000 ALTER TABLE `sauv_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sauv_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sauv_sauvegardes`
--

DROP TABLE IF EXISTS `sauv_sauvegardes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sauv_sauvegardes` (
  `sauv_sauvegarde_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sauv_sauvegarde_nom` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sauv_sauvegarde_file_prefix` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sauv_sauvegarde_tables` mediumtext COLLATE utf8_unicode_ci,
  `sauv_sauvegarde_lieux` mediumtext COLLATE utf8_unicode_ci,
  `sauv_sauvegarde_users` mediumtext COLLATE utf8_unicode_ci,
  `sauv_sauvegarde_compress` int(11) DEFAULT '0',
  `sauv_sauvegarde_compress_command` mediumtext COLLATE utf8_unicode_ci,
  `sauv_sauvegarde_crypt` int(11) DEFAULT '0',
  `sauv_sauvegarde_key1` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sauv_sauvegarde_key2` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sauv_sauvegarde_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sauv_sauvegardes`
--

LOCK TABLES `sauv_sauvegardes` WRITE;
/*!40000 ALTER TABLE `sauv_sauvegardes` DISABLE KEYS */;
INSERT INTO `sauv_sauvegardes` VALUES (1,'todo','bibli','7','','1,3',0,'internal::',0,'','');
/*!40000 ALTER TABLE `sauv_sauvegardes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sauv_tables`
--

DROP TABLE IF EXISTS `sauv_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sauv_tables` (
  `sauv_table_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sauv_table_nom` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sauv_table_tables` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`sauv_table_id`),
  UNIQUE KEY `sauv_table_nom` (`sauv_table_nom`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sauv_tables`
--

LOCK TABLES `sauv_tables` WRITE;
/*!40000 ALTER TABLE `sauv_tables` DISABLE KEYS */;
INSERT INTO `sauv_tables` VALUES (1,'Biblio','analysis,bulletins,docs_codestat,docs_location,docs_section,docs_statut,docs_type,exemplaires,notices,etagere_caddie,notices_custom,notices_custom_lists,notices_custom_values'),(2,'Autoridades','authors,categories,collections,noeuds,publishers,responsability,series,sub_collections,thesaurus,voir_aussi'),(3,'Ninguna utilidad','error_log,import_marc,old_categories,old_notices_categories,sessions'),(4,'Z3950','z_attr,z_bib,z_notices,z_query'),(5,'Usuarios','empr,empr_categ,empr_codestat,empr_custom,empr_custom_lists,empr_custom_values,empr_groupe,expl_custom_values,groupe,pret,pret_archive,resa'),(6,'Aplicación','categories,lenders,parametres,procs,sauv_lieux,sauv_log,sauv_sauvegardes,sauv_tables,users,explnum,indexint,notices_categories,origine_notice,quotas,etagere,resa_ranger,admin_session,opac_sessions,audit,notice_statut,ouvertures'),(7,'TODO','actes,admin_session,analysis,audit,authors,bannette_abon,bannette_contenu,bannette_equation,bannette_exports,bannettes,budgets,bulletins,caddie,caddie_content,caddie_procs,categories,classements,collections,comptes,coordonnees,docs_codestat,docs_location,docs_section,docs_statut,docs_type,docsloc_section,empr,empr_categ,empr_codestat,empr_custom,empr_custom_lists,empr_custom_values,empr_groupe,entites,equations,error_log,etagere,etagere_caddie,exemplaires,exercices,expl_custom,expl_custom_lists,expl_custom_values,explnum,frais,groupe,import_marc,indexint,lenders,liens_actes,lignes_actes,noeuds,notice_statut,notices,notices_categories,notices_custom,notices_custom_lists,notices_custom_values,notices_global_index,offres_remises,opac_sessions,origine_notice,ouvertures,paiements,parametres,pret,pret_archive,procs,publishers,quotas,quotas_finance,recouvrements,resa,resa_ranger,responsability,rss_content,rss_flux,rss_flux_content,rubriques,sauv_lieux,sauv_log,sauv_sauvegardes,sauv_tables,series,sessions,sub_collections,suggestions,suggestions_origine,thesaurus,transactions,tva_achats,type_abts,type_comptes,types_produits,users,voir_aussi,z_attr,z_bib,z_notices,z_query'),(9,'Cestas','caddie_procs,caddie,caddie_content'),(10,'DSI','bannette_abon,bannette_contenu,bannette_equation,bannettes,classements,equations,rss_content,rss_flux,rss_flux_content'),(11,'Finanzas','comptes,quotas_finance,recouvrements,transactions,type_abts,type_comptes');
/*!40000 ALTER TABLE `sauv_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_cache`
--

DROP TABLE IF EXISTS `search_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_cache` (
  `object_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delete_on_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_cache`
--

LOCK TABLES `search_cache` WRITE;
/*!40000 ALTER TABLE `search_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_perso`
--

DROP TABLE IF EXISTS `search_perso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_perso` (
  `search_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `num_user` int(8) unsigned NOT NULL DEFAULT '0',
  `search_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `search_shortname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `search_query` text COLLATE utf8_unicode_ci NOT NULL,
  `search_human` text COLLATE utf8_unicode_ci NOT NULL,
  `search_directlink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `autorisations` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`search_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_perso`
--

LOCK TABLES `search_perso` WRITE;
/*!40000 ALTER TABLE `search_perso` DISABLE KEYS */;
INSERT INTO `search_perso` VALUES (1,1,'Contrôle import et pointage BDP','BDP','a:4:{s:6:\"SEARCH\";a:3:{i:0;s:4:\"f_50\";i:1;s:4:\"f_16\";i:2;s:4:\"f_30\";}i:0;a:5:{s:6:\"SEARCH\";s:4:\"f_50\";s:2:\"OP\";s:2:\"EQ\";s:5:\"FIELD\";a:1:{i:0;s:0:\"\";}s:5:\"INTER\";N;s:8:\"FIELDVAR\";N;}i:1;a:5:{s:6:\"SEARCH\";s:4:\"f_16\";s:2:\"OP\";s:2:\"EQ\";s:5:\"FIELD\";N;s:5:\"INTER\";s:3:\"and\";s:8:\"FIELDVAR\";N;}i:2;a:5:{s:6:\"SEARCH\";s:4:\"f_30\";s:2:\"OP\";s:2:\"EQ\";s:5:\"FIELD\";N;s:5:\"INTER\";s:3:\"and\";s:8:\"FIELDVAR\";N;}}',' <i><strong>Date de cr&eacute;ation</strong> = ()</i> <strong>Et</strong> <i><strong>Localisation</strong> = ()</i> <strong>Et</strong> <i><strong>Statut</strong> = ()</i> ',1,'1');
/*!40000 ALTER TABLE `search_perso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_persopac`
--

DROP TABLE IF EXISTS `search_persopac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_persopac` (
  `search_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `num_empr` int(8) unsigned NOT NULL DEFAULT '0',
  `search_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `search_shortname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `search_query` text COLLATE utf8_unicode_ci NOT NULL,
  `search_human` text COLLATE utf8_unicode_ci NOT NULL,
  `search_directlink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `search_limitsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_persopac`
--

LOCK TABLES `search_persopac` WRITE;
/*!40000 ALTER TABLE `search_persopac` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_persopac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_persopac_empr_categ`
--

DROP TABLE IF EXISTS `search_persopac_empr_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_persopac_empr_categ` (
  `id_categ_empr` int(11) NOT NULL DEFAULT '0',
  `id_search_persopac` int(11) NOT NULL DEFAULT '0',
  KEY `i_id_s_persopac` (`id_search_persopac`),
  KEY `i_id_categ_empr` (`id_categ_empr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_persopac_empr_categ`
--

LOCK TABLES `search_persopac_empr_categ` WRITE;
/*!40000 ALTER TABLE `search_persopac_empr_categ` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_persopac_empr_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialcirc`
--

DROP TABLE IF EXISTS `serialcirc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialcirc` (
  `id_serialcirc` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_serialcirc_abt` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_type` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_virtual` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_duration` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_checked` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_retard_mode` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_allow_resa` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_allow_copy` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_allow_send_ask` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_allow_subscription` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_duration_before_send` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_expl_statut_circ` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_expl_statut_circ_after` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_state` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_tpl` text COLLATE utf8_unicode_ci NOT NULL,
  `serialcirc_piedpage` text COLLATE utf8_unicode_ci NOT NULL,
  `serialcirc_no_ret` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_sort_diff` text COLLATE utf8_unicode_ci NOT NULL,
  `serialcirc_simple` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_serialcirc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialcirc`
--

LOCK TABLES `serialcirc` WRITE;
/*!40000 ALTER TABLE `serialcirc` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialcirc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialcirc_ask`
--

DROP TABLE IF EXISTS `serialcirc_ask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialcirc_ask` (
  `id_serialcirc_ask` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_serialcirc_ask_perio` int(10) unsigned NOT NULL DEFAULT '0',
  `num_serialcirc_ask_serialcirc` int(10) unsigned NOT NULL DEFAULT '0',
  `num_serialcirc_ask_empr` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_ask_type` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_ask_statut` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_ask_date` date NOT NULL DEFAULT '0000-00-00',
  `serialcirc_ask_comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_serialcirc_ask`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialcirc_ask`
--

LOCK TABLES `serialcirc_ask` WRITE;
/*!40000 ALTER TABLE `serialcirc_ask` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialcirc_ask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialcirc_circ`
--

DROP TABLE IF EXISTS `serialcirc_circ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialcirc_circ` (
  `id_serialcirc_circ` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_serialcirc_circ_diff` int(10) unsigned NOT NULL DEFAULT '0',
  `num_serialcirc_circ_expl` int(10) unsigned NOT NULL DEFAULT '0',
  `num_serialcirc_circ_empr` int(10) unsigned NOT NULL DEFAULT '0',
  `num_serialcirc_circ_serialcirc` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_circ_order` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_circ_subscription` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_circ_hold_asked` int(11) NOT NULL DEFAULT '0',
  `serialcirc_circ_ret_asked` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_circ_trans_asked` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_circ_trans_doc_asked` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_circ_expected_date` datetime DEFAULT NULL,
  `serialcirc_circ_pointed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_serialcirc_circ`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialcirc_circ`
--

LOCK TABLES `serialcirc_circ` WRITE;
/*!40000 ALTER TABLE `serialcirc_circ` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialcirc_circ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialcirc_copy`
--

DROP TABLE IF EXISTS `serialcirc_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialcirc_copy` (
  `id_serialcirc_copy` int(11) NOT NULL AUTO_INCREMENT,
  `num_serialcirc_copy_empr` int(11) NOT NULL DEFAULT '0',
  `num_serialcirc_copy_bulletin` int(11) NOT NULL DEFAULT '0',
  `serialcirc_copy_analysis` text COLLATE utf8_unicode_ci,
  `serialcirc_copy_date` date NOT NULL DEFAULT '0000-00-00',
  `serialcirc_copy_state` int(11) NOT NULL DEFAULT '0',
  `serialcirc_copy_comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_serialcirc_copy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialcirc_copy`
--

LOCK TABLES `serialcirc_copy` WRITE;
/*!40000 ALTER TABLE `serialcirc_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialcirc_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialcirc_diff`
--

DROP TABLE IF EXISTS `serialcirc_diff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialcirc_diff` (
  `id_serialcirc_diff` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_serialcirc_diff_serialcirc` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_diff_empr_type` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_diff_type_diff` int(10) unsigned NOT NULL DEFAULT '0',
  `num_serialcirc_diff_empr` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_diff_group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `serialcirc_diff_duration` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_diff_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_serialcirc_diff`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialcirc_diff`
--

LOCK TABLES `serialcirc_diff` WRITE;
/*!40000 ALTER TABLE `serialcirc_diff` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialcirc_diff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialcirc_expl`
--

DROP TABLE IF EXISTS `serialcirc_expl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialcirc_expl` (
  `id_serialcirc_expl` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_serialcirc_expl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `num_serialcirc_expl_serialcirc` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_expl_bulletine_date` date NOT NULL DEFAULT '0000-00-00',
  `serialcirc_expl_state_circ` int(10) unsigned NOT NULL DEFAULT '0',
  `num_serialcirc_expl_serialcirc_diff` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_expl_ret_asked` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_expl_trans_asked` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_expl_trans_doc_asked` int(10) unsigned NOT NULL DEFAULT '0',
  `num_serialcirc_expl_current_empr` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_expl_start_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id_serialcirc_expl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialcirc_expl`
--

LOCK TABLES `serialcirc_expl` WRITE;
/*!40000 ALTER TABLE `serialcirc_expl` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialcirc_expl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialcirc_group`
--

DROP TABLE IF EXISTS `serialcirc_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialcirc_group` (
  `id_serialcirc_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_serialcirc_group_diff` int(10) unsigned NOT NULL DEFAULT '0',
  `num_serialcirc_group_empr` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_group_responsable` int(10) unsigned NOT NULL DEFAULT '0',
  `serialcirc_group_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_serialcirc_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialcirc_group`
--

LOCK TABLES `serialcirc_group` WRITE;
/*!40000 ALTER TABLE `serialcirc_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialcirc_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialcirc_tpl`
--

DROP TABLE IF EXISTS `serialcirc_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialcirc_tpl` (
  `serialcirctpl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serialcirctpl_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `serialcirctpl_comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `serialcirctpl_tpl` text COLLATE utf8_unicode_ci NOT NULL,
  `serialcirctpl_piedpage` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`serialcirctpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialcirc_tpl`
--

LOCK TABLES `serialcirc_tpl` WRITE;
/*!40000 ALTER TABLE `serialcirc_tpl` DISABLE KEYS */;
INSERT INTO `serialcirc_tpl` VALUES (1,'Template PMB','','a:3:{i:0;a:3:{s:4:\"type\";s:4:\"name\";s:2:\"id\";s:1:\"0\";s:5:\"label\";N;}i:1;a:3:{s:4:\"type\";s:5:\"ville\";s:2:\"id\";s:1:\"0\";s:5:\"label\";N;}i:2;a:3:{s:4:\"type\";s:5:\"libre\";s:2:\"id\";s:1:\"0\";s:5:\"label\";s:9:\"SIGNATURE\";}}','');
/*!40000 ALTER TABLE `serialcirc_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serie_custom`
--

DROP TABLE IF EXISTS `serie_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serie_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serie_custom`
--

LOCK TABLES `serie_custom` WRITE;
/*!40000 ALTER TABLE `serie_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `serie_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serie_custom_lists`
--

DROP TABLE IF EXISTS `serie_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serie_custom_lists` (
  `serie_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `serie_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serie_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `editorial_custom_champ` (`serie_custom_champ`),
  KEY `editorial_champ_list_value` (`serie_custom_champ`,`serie_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serie_custom_lists`
--

LOCK TABLES `serie_custom_lists` WRITE;
/*!40000 ALTER TABLE `serie_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `serie_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serie_custom_values`
--

DROP TABLE IF EXISTS `serie_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serie_custom_values` (
  `serie_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `serie_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `serie_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serie_custom_text` text COLLATE utf8_unicode_ci,
  `serie_custom_integer` int(11) DEFAULT NULL,
  `serie_custom_date` date DEFAULT NULL,
  `serie_custom_float` float DEFAULT NULL,
  KEY `editorial_custom_champ` (`serie_custom_champ`),
  KEY `editorial_custom_origine` (`serie_custom_origine`),
  KEY `i_scv_st` (`serie_custom_small_text`),
  KEY `i_scv_t` (`serie_custom_text`(255)),
  KEY `i_scv_i` (`serie_custom_integer`),
  KEY `i_scv_d` (`serie_custom_date`),
  KEY `i_scv_f` (`serie_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serie_custom_values`
--

LOCK TABLES `serie_custom_values` WRITE;
/*!40000 ALTER TABLE `serie_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `serie_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `serie_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `serie_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `serie_index` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`serie_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `SESSID` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `IP` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SESSstart` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LastOn` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SESSNAME` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notifications` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shorturls`
--

DROP TABLE IF EXISTS `shorturls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shorturls` (
  `id_shorturl` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shorturl_hash` varchar(255) NOT NULL DEFAULT '',
  `shorturl_last_access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shorturl_context` text NOT NULL,
  `shorturl_type` varchar(255) NOT NULL DEFAULT '',
  `shorturl_action` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_shorturl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shorturls`
--

LOCK TABLES `shorturls` WRITE;
/*!40000 ALTER TABLE `shorturls` DISABLE KEYS */;
/*!40000 ALTER TABLE `shorturls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skos_fields_global_index`
--

DROP TABLE IF EXISTS `skos_fields_global_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skos_fields_global_index` (
  `id_item` int(10) unsigned NOT NULL DEFAULT '0',
  `code_champ` int(3) unsigned NOT NULL DEFAULT '0',
  `code_ss_champ` int(3) unsigned NOT NULL DEFAULT '0',
  `ordre` int(4) unsigned NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `pond` int(4) unsigned NOT NULL DEFAULT '100',
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authority_num` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_item`,`code_champ`,`code_ss_champ`,`lang`,`ordre`),
  KEY `i_value` (`value`(300)),
  KEY `i_code_champ_code_ss_champ` (`code_champ`,`code_ss_champ`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skos_fields_global_index`
--

LOCK TABLES `skos_fields_global_index` WRITE;
/*!40000 ALTER TABLE `skos_fields_global_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `skos_fields_global_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skos_words_global_index`
--

DROP TABLE IF EXISTS `skos_words_global_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skos_words_global_index` (
  `id_item` int(10) unsigned NOT NULL DEFAULT '0',
  `code_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `code_ss_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `num_word` int(10) unsigned NOT NULL DEFAULT '0',
  `pond` int(10) unsigned NOT NULL DEFAULT '100',
  `position` int(10) unsigned NOT NULL DEFAULT '1',
  `field_position` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_item`,`code_champ`,`num_word`,`position`,`code_ss_champ`),
  KEY `code_champ` (`code_champ`),
  KEY `i_id_mot` (`num_word`,`id_item`),
  KEY `i_code_champ_code_ss_champ_num_word` (`code_champ`,`code_ss_champ`,`num_word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skos_words_global_index`
--

LOCK TABLES `skos_words_global_index` WRITE;
/*!40000 ALTER TABLE `skos_words_global_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `skos_words_global_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_sync`
--

DROP TABLE IF EXISTS `source_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_sync` (
  `source_id` int(10) unsigned NOT NULL DEFAULT '0',
  `nrecu` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ntotal` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `percent` int(10) unsigned NOT NULL DEFAULT '0',
  `env` text COLLATE utf8_unicode_ci NOT NULL,
  `cancel` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_sync`
--

LOCK TABLES `source_sync` WRITE;
/*!40000 ALTER TABLE `source_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sources_enrichment`
--

DROP TABLE IF EXISTS `sources_enrichment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources_enrichment` (
  `source_enrichment_num` int(11) NOT NULL DEFAULT '0',
  `source_enrichment_typnotice` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `source_enrichment_typdoc` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `source_enrichment_params` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`source_enrichment_num`,`source_enrichment_typnotice`,`source_enrichment_typdoc`),
  KEY `i_s_enrichment_typnoti` (`source_enrichment_typnotice`),
  KEY `i_s_enrichment_typdoc` (`source_enrichment_typdoc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sources_enrichment`
--

LOCK TABLES `sources_enrichment` WRITE;
/*!40000 ALTER TABLE `sources_enrichment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sources_enrichment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statopac`
--

DROP TABLE IF EXISTS `statopac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statopac` (
  `id_log` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `date_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url_demandee` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url_referente` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `get_log` blob NOT NULL,
  `post_log` blob NOT NULL,
  `num_session` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `server_log` blob NOT NULL,
  `empr_carac` blob NOT NULL,
  `empr_doc` blob NOT NULL,
  `empr_expl` blob NOT NULL,
  `nb_result` blob NOT NULL,
  `gen_stat` blob NOT NULL,
  PRIMARY KEY (`id_log`),
  KEY `sopac_date_log` (`date_log`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statopac`
--

LOCK TABLES `statopac` WRITE;
/*!40000 ALTER TABLE `statopac` DISABLE KEYS */;
/*!40000 ALTER TABLE `statopac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statopac_request`
--

DROP TABLE IF EXISTS `statopac_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statopac_request` (
  `idproc` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `requete` blob NOT NULL,
  `comment` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `parameters` text COLLATE utf8_unicode_ci NOT NULL,
  `num_vue` mediumint(8) NOT NULL DEFAULT '0',
  `autorisations` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idproc`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statopac_request`
--

LOCK TABLES `statopac_request` WRITE;
/*!40000 ALTER TABLE `statopac_request` DISABLE KEYS */;
INSERT INTO `statopac_request` VALUES (1,'Nombre de visites par date','select date as Date, count(distinct(id_session)) as \'Nombre de sessions distinctes\' from VUE() group by date order by date asc','Distingue les sessions','',1,''),(2,'Nombre de visites par date (adresses IP)','select date as Date, adresse_IP as \'Adresse IP\', count(distinct(id_session)) as \'Nombre de visites\' from VUE() group by date, adresse_IP','Distingue les adresses IP','',1,''),(3,'Mots saisis','select mots_saisis as \'Mots saisis\', count(*) as \'Nombre de fois\' from VUE() group by mots_saisis','Liste les différents mots saisis en recherche.','',2,''),(4,'Exports','select page_subtype_text, count(id_ligne) as nb_export from VUE() where page_subtype=803 group by num_session','Nombre d\'exports lancés depuis l\'OPAC','',3,''),(5,'Impressions de paniers','select page_subtype_text, count(id_ligne) as Nombre from VUE() where page_subtype=802 group by num_session','Impressions de paniers lancées depuis l\'OPAC','',3,''),(6,'Première page affichée','select page_subtype_text, count(id_ligne) as \'Nombre de fois\' from VUE() where url_origine=\'\' group by 1 order by 2 desc','Première page affichée (quand un lecteur arrive sur l\'OPAC) trié par fréquence','',3,''),(7,'DSI','select count(distinct(num_session)) as Nombre from VUE() where page_subtype in (\'706\',\'707\',\'708\')','Nombre de lecteurs utilisant la DSI dans l\'OPAC','',4,''),(8,'Mots les plus cherchés','select mots_saisis, count(id_ligne) as \'Nombre de fois\' from VUE() where mots_saisis!=\'\' and mots_saisis is not null group by mots_saisis order by 2 desc','Affiche les mots les plus saisis dans l\'OPAC','',2,''),(9,'Recherche multi-critères','select multi_label, multi_content, multi_title, count(1) as Nombre from VUE() where multi_label!=\'\' or multi_content!=\'\' group by multi_label, multi_content order by Nombre desc','Recherches multi-critères triées par fréquence','',2,''),(10,'Recherches réussies ou non','select mots_saisis, multi_content, multi_title, if(nb_result,nb_result,\'aucun r\�sultat\') as R\�sultats from VUE() where page_type in (\'2\',\'3\',\'4\') and (mots_saisis!=\'\' or multi_content!=\'\') order by R\�sultats asc','Affiche les recherches et précise si elle a affiché des résultats ou non','',2,''),(11,'Types de recherche','select case when page_subtype=101 then \'Recherche simple\' when page_subtype=102 then \'Recherche multi-crit\�res\' when page_subtype=103 then \'Recherche par termes\' when page_subtype=104 then \'Recherche externe\' when page_subtype=105 then \'Recherche par tags\' when page_subtype=106 then \'Recherche pr\�d\�finie\' when page_subtype=107 then \"Recherche sur la page d\'accueil\" else page_subtype end as Recherche, count(id_ligne) as Nombre from VUE() where page_type=\'1\' and page_subtype!=\'803\' group by 1 order by 2 desc','Affiche les types de recherches réalisées dans l\'OPAC triés par fréquence','',2,''),(12,'Consultations des infopages','select title_infopage as Infopage, count(distinct id_ligne) as \"Nombre d\'affichages\" from VUE(), infopages where Infopage like \'%/opac/index.php?lvl=infopages&pagesid=%\' and id_infopage=substring_index(Infopage,\'pagesid=\',-1) group by 1','','',5,''),(13,'Fréquentation des sections','select section_libelle as Section, count(distinct id_ligne) as \'Nombre de visites dans cette section\' from VUE(), docs_section where url_asked like \'%lvl=section_see&location=%\' and idsection=substring_index(url_asked,\'&id=\',-1) group by 1','','',1,'');
/*!40000 ALTER TABLE `statopac_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statopac_vues`
--

DROP TABLE IF EXISTS `statopac_vues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statopac_vues` (
  `id_vue` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `date_consolidation` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nom_vue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `date_debut_log` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_fin_log` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_vue`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statopac_vues`
--

LOCK TABLES `statopac_vues` WRITE;
/*!40000 ALTER TABLE `statopac_vues` DISABLE KEYS */;
INSERT INTO `statopac_vues` VALUES (1,'2011-06-15 10:06:24','Statistiques visites','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'2011-06-15 10:06:24','Recherches','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'2011-06-15 10:06:24','Navigation','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'2011-06-15 10:06:24','Lecteurs','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'2011-06-15 10:06:24','Infopages','','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `statopac_vues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statopac_vues_col`
--

DROP TABLE IF EXISTS `statopac_vues_col`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statopac_vues_col` (
  `id_col` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `nom_col` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expression` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_vue` mediumint(8) NOT NULL DEFAULT '0',
  `ordre` mediumint(8) NOT NULL DEFAULT '0',
  `filtre` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maj_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_col`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statopac_vues_col`
--

LOCK TABLES `statopac_vues_col` WRITE;
/*!40000 ALTER TABLE `statopac_vues_col` DISABLE KEYS */;
INSERT INTO `statopac_vues_col` VALUES (1,'id_session','#num_session();',1,1,'','small_text',0),(2,'date','#date();',1,2,'','date',0),(3,'adresse_IP','#adresse_ip();',1,3,'','small_text',0),(4,'date','#date();',2,1,'','date',0),(5,'mots_saisis','#mots_saisis();',2,2,'','small_text',0),(6,'num_session','#num_session();',3,1,'','small_text',0),(7,'timestamp','#timestamp();',3,2,'','datetime',0),(8,'date','#date();',3,3,'','date',0),(9,'url_target','#url_asked();',3,4,'','text',0),(10,'url_origine','#url_ori();',3,5,'','text',0),(11,'page_subtype','#sous_type_page();',3,6,'','integer',0),(12,'page_subtype_text','#sous_type_page_lib();',3,7,'','small_text',0),(13,'page_type','#type_page();',3,8,'','integer',0),(14,'page_type_text','#type_page_lib();',3,9,'','small_text',0),(15,'location','#empr_location();',3,10,'','small_text',0),(16,'location','#empr_location();',4,1,'','small_text',0),(17,'page_subtype','#sous_type_page();',4,2,'','integer',0),(18,'pages_subtype_txt','#sous_type_page_lib();',4,3,'','small_text',0),(19,'date','#date();',4,4,'','date',0),(20,'num_session','#num_session();',4,5,'','small_text',0),(21,'age','#empr_age();',4,6,'','integer',0),(22,'groupe','#empr_groupe();',4,7,'','small_text',0),(23,'code statistique','#empr_codestat();',4,8,'','small_text',0),(24,'statut','#empr_statut();',4,9,'','small_text',0),(25,'ville','#empr_ville();',4,10,'','small_text',0),(26,'page_subtype','#sous_type_page();',2,3,'','integer',0),(27,'pages_subtype_txt','#sous_type_page_txt();',2,4,'','small_text',0),(28,'page_type','#type_page();',2,5,'','integer',0),(29,'nb_result','#nb_total();',2,6,'','integer',0),(30,'multi_label','#multi_libelle();',2,7,'','small_text',0),(31,'multi_content','#multi_contenu();',2,8,'','small_text',0),(32,'multi_title','#multi_intitule();',2,9,'','small_text',0),(33,'Infopage','#url_asked();',5,1,'','small_text',0),(34,'url_asked','#url_asked();',1,4,'','small_text',0);
/*!40000 ALTER TABLE `statopac_vues_col` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storages`
--

DROP TABLE IF EXISTS `storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storages` (
  `id_storage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `storage_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `storage_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `storage_params` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_storage`),
  KEY `i_storage_class` (`storage_class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storages`
--

LOCK TABLES `storages` WRITE;
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_collections`
--

DROP TABLE IF EXISTS `sub_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_collections` (
  `sub_coll_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sub_coll_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sub_coll_parent` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `sub_coll_issn` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `index_sub_coll` text COLLATE utf8_unicode_ci,
  `subcollection_web` text COLLATE utf8_unicode_ci NOT NULL,
  `subcollection_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `authority_import_denied` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sub_coll_id`),
  KEY `sub_coll_name` (`sub_coll_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_collections`
--

LOCK TABLES `sub_collections` WRITE;
/*!40000 ALTER TABLE `sub_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcollection_custom`
--

DROP TABLE IF EXISTS `subcollection_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcollection_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcollection_custom`
--

LOCK TABLES `subcollection_custom` WRITE;
/*!40000 ALTER TABLE `subcollection_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcollection_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcollection_custom_lists`
--

DROP TABLE IF EXISTS `subcollection_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcollection_custom_lists` (
  `subcollection_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `subcollection_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subcollection_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `editorial_custom_champ` (`subcollection_custom_champ`),
  KEY `editorial_champ_list_value` (`subcollection_custom_champ`,`subcollection_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcollection_custom_lists`
--

LOCK TABLES `subcollection_custom_lists` WRITE;
/*!40000 ALTER TABLE `subcollection_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcollection_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcollection_custom_values`
--

DROP TABLE IF EXISTS `subcollection_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcollection_custom_values` (
  `subcollection_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `subcollection_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `subcollection_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subcollection_custom_text` text COLLATE utf8_unicode_ci,
  `subcollection_custom_integer` int(11) DEFAULT NULL,
  `subcollection_custom_date` date DEFAULT NULL,
  `subcollection_custom_float` float DEFAULT NULL,
  KEY `editorial_custom_champ` (`subcollection_custom_champ`),
  KEY `editorial_custom_origine` (`subcollection_custom_origine`),
  KEY `i_scv_st` (`subcollection_custom_small_text`),
  KEY `i_scv_t` (`subcollection_custom_text`(255)),
  KEY `i_scv_i` (`subcollection_custom_integer`),
  KEY `i_scv_d` (`subcollection_custom_date`),
  KEY `i_scv_f` (`subcollection_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcollection_custom_values`
--

LOCK TABLES `subcollection_custom_values` WRITE;
/*!40000 ALTER TABLE `subcollection_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcollection_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestions`
--

DROP TABLE IF EXISTS `suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestions` (
  `id_suggestion` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `titre` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `editeur` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `auteur` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prix` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  `commentaires` text COLLATE utf8_unicode_ci,
  `commentaires_gestion` text COLLATE utf8_unicode_ci,
  `statut` int(3) unsigned NOT NULL DEFAULT '0',
  `num_produit` int(8) NOT NULL DEFAULT '0',
  `num_entite` int(5) NOT NULL DEFAULT '0',
  `index_suggestion` text COLLATE utf8_unicode_ci NOT NULL,
  `nb` int(5) unsigned NOT NULL DEFAULT '1',
  `date_creation` date NOT NULL DEFAULT '0000-00-00',
  `date_decision` date NOT NULL DEFAULT '0000-00-00',
  `num_rubrique` int(8) unsigned NOT NULL DEFAULT '0',
  `num_fournisseur` int(5) unsigned NOT NULL DEFAULT '0',
  `num_notice` int(8) unsigned NOT NULL DEFAULT '0',
  `url_suggestion` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_categ` int(12) NOT NULL DEFAULT '1',
  `sugg_location` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sugg_source` int(8) NOT NULL DEFAULT '0',
  `date_publication` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notice_unimarc` blob NOT NULL,
  PRIMARY KEY (`id_suggestion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions`
--

LOCK TABLES `suggestions` WRITE;
/*!40000 ALTER TABLE `suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestions_categ`
--

DROP TABLE IF EXISTS `suggestions_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestions_categ` (
  `id_categ` int(12) NOT NULL AUTO_INCREMENT,
  `libelle_categ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_categ`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions_categ`
--

LOCK TABLES `suggestions_categ` WRITE;
/*!40000 ALTER TABLE `suggestions_categ` DISABLE KEYS */;
INSERT INTO `suggestions_categ` VALUES (1,'catégorie par défaut');
/*!40000 ALTER TABLE `suggestions_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestions_origine`
--

DROP TABLE IF EXISTS `suggestions_origine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestions_origine` (
  `origine` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_suggestion` int(12) unsigned NOT NULL DEFAULT '0',
  `type_origine` int(3) unsigned NOT NULL DEFAULT '0',
  `date_suggestion` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`origine`,`num_suggestion`,`type_origine`),
  KEY `i_origine` (`origine`,`type_origine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions_origine`
--

LOCK TABLES `suggestions_origine` WRITE;
/*!40000 ALTER TABLE `suggestions_origine` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestions_origine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestions_source`
--

DROP TABLE IF EXISTS `suggestions_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestions_source` (
  `id_source` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_source` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions_source`
--

LOCK TABLES `suggestions_source` WRITE;
/*!40000 ALTER TABLE `suggestions_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestions_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sur_location`
--

DROP TABLE IF EXISTS `sur_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sur_location` (
  `surloc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `surloc_libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_pic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_visible_opac` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `surloc_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_adr1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_adr2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_cp` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_town` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_state` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_country` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_website` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_logo` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surloc_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `surloc_num_infopage` int(6) unsigned NOT NULL DEFAULT '0',
  `surloc_css_style` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`surloc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sur_location`
--

LOCK TABLES `sur_location` WRITE;
/*!40000 ALTER TABLE `sur_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `sur_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taches`
--

DROP TABLE IF EXISTS `taches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taches` (
  `id_tache` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num_planificateur` int(11) DEFAULT NULL,
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msg_statut` blob,
  `commande` int(8) NOT NULL DEFAULT '0',
  `next_state` int(8) NOT NULL DEFAULT '0',
  `msg_commande` blob,
  `indicat_progress` int(3) DEFAULT NULL,
  `rapport` text COLLATE utf8_unicode_ci,
  `id_process` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_tache`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taches`
--

LOCK TABLES `taches` WRITE;
/*!40000 ALTER TABLE `taches` DISABLE KEYS */;
/*!40000 ALTER TABLE `taches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taches_docnum`
--

DROP TABLE IF EXISTS `taches_docnum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taches_docnum` (
  `id_tache_docnum` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tache_docnum_nomfichier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tache_docnum_mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tache_docnum_data` mediumblob NOT NULL,
  `tache_docnum_extfichier` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tache_docnum_repertoire` int(8) DEFAULT NULL,
  `tache_docnum_path` text COLLATE utf8_unicode_ci NOT NULL,
  `num_tache` int(11) NOT NULL,
  PRIMARY KEY (`id_tache_docnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taches_docnum`
--

LOCK TABLES `taches_docnum` WRITE;
/*!40000 ALTER TABLE `taches_docnum` DISABLE KEYS */;
/*!40000 ALTER TABLE `taches_docnum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taches_type`
--

DROP TABLE IF EXISTS `taches_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taches_type` (
  `id_type_tache` int(11) unsigned NOT NULL,
  `parameters` text COLLATE utf8_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL DEFAULT '5',
  `histo_day` int(11) NOT NULL DEFAULT '7',
  `histo_number` int(11) NOT NULL DEFAULT '3',
  `restart_on_failure` int(1) unsigned NOT NULL DEFAULT '0',
  `alert_mail_on_failure` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_type_tache`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taches_type`
--

LOCK TABLES `taches_type` WRITE;
/*!40000 ALTER TABLE `taches_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `taches_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id_tag` mediumint(8) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_notice` mediumint(8) NOT NULL DEFAULT '0',
  `user_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dateajout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thesaurus`
--

DROP TABLE IF EXISTS `thesaurus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thesaurus` (
  `id_thesaurus` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_thesaurus` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `langue_defaut` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fr_FR',
  `active` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `opac_active` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `num_noeud_racine` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_thesaurus`),
  UNIQUE KEY `libelle_thesaurus` (`libelle_thesaurus`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thesaurus`
--

LOCK TABLES `thesaurus` WRITE;
/*!40000 ALTER TABLE `thesaurus` DISABLE KEYS */;
INSERT INTO `thesaurus` VALUES (1,'Tesauro nº 1','es_ES','1','1',1);
/*!40000 ALTER TABLE `thesaurus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titres_uniformes`
--

DROP TABLE IF EXISTS `titres_uniformes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titres_uniformes` (
  `tu_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `tu_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tu_tonalite` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tu_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `index_tu` text COLLATE utf8_unicode_ci NOT NULL,
  `tu_import_denied` int(10) unsigned NOT NULL DEFAULT '0',
  `tu_num_author` bigint(11) unsigned NOT NULL DEFAULT '0',
  `tu_forme` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tu_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tu_date_date` date NOT NULL DEFAULT '0000-00-00',
  `tu_sujet` text COLLATE utf8_unicode_ci NOT NULL,
  `tu_lieu` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tu_histoire` text COLLATE utf8_unicode_ci,
  `tu_caracteristique` text COLLATE utf8_unicode_ci,
  `tu_public` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tu_contexte` text COLLATE utf8_unicode_ci,
  `tu_coordonnees` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tu_equinoxe` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tu_completude` int(2) unsigned NOT NULL DEFAULT '0',
  `tu_tonalite_marclist` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tu_forme_marclist` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titres_uniformes`
--

LOCK TABLES `titres_uniformes` WRITE;
/*!40000 ALTER TABLE `titres_uniformes` DISABLE KEYS */;
/*!40000 ALTER TABLE `titres_uniformes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacash`
--

DROP TABLE IF EXISTS `transacash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transacash` (
  `transacash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transacash_empr_num` int(10) unsigned NOT NULL DEFAULT '0',
  `transacash_desk_num` int(10) unsigned NOT NULL DEFAULT '0',
  `transacash_user_num` int(10) unsigned NOT NULL DEFAULT '0',
  `transacash_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transacash_sold` float NOT NULL DEFAULT '0',
  `transacash_collected` float NOT NULL DEFAULT '0',
  `transacash_rendering` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`transacash_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacash`
--

LOCK TABLES `transacash` WRITE;
/*!40000 ALTER TABLE `transacash` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id_transaction` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `compte_id` int(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `machine` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_enrgt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_prevue` date DEFAULT NULL,
  `date_effective` date DEFAULT NULL,
  `montant` decimal(16,2) NOT NULL DEFAULT '0.00',
  `sens` int(1) NOT NULL DEFAULT '0',
  `realisee` int(1) NOT NULL DEFAULT '0',
  `commentaire` text COLLATE utf8_unicode_ci,
  `encaissement` int(1) NOT NULL DEFAULT '0',
  `transactype_num` int(10) unsigned NOT NULL DEFAULT '0',
  `cashdesk_num` int(10) unsigned NOT NULL DEFAULT '0',
  `transacash_num` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_transaction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactype`
--

DROP TABLE IF EXISTS `transactype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactype` (
  `transactype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transactype_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transactype_quick_allowed` int(10) unsigned NOT NULL DEFAULT '0',
  `transactype_unit_price` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`transactype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactype`
--

LOCK TABLES `transactype` WRITE;
/*!40000 ALTER TABLE `transactype` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferts`
--

DROP TABLE IF EXISTS `transferts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transferts` (
  `id_transfert` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_notice` int(10) unsigned NOT NULL DEFAULT '0',
  `num_bulletin` int(10) unsigned NOT NULL DEFAULT '0',
  `date_creation` date NOT NULL,
  `type_transfert` int(5) unsigned NOT NULL DEFAULT '0',
  `etat_transfert` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `origine` int(5) unsigned NOT NULL DEFAULT '0',
  `origine_comp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `source` smallint(5) unsigned DEFAULT NULL,
  `destinations` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_retour` date DEFAULT NULL,
  `motif` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_transfert`),
  KEY `etat_transfert` (`etat_transfert`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferts`
--

LOCK TABLES `transferts` WRITE;
/*!40000 ALTER TABLE `transferts` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferts_demande`
--

DROP TABLE IF EXISTS `transferts_demande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transferts_demande` (
  `id_transfert_demande` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_transfert` int(10) unsigned NOT NULL DEFAULT '0',
  `date_creation` date NOT NULL,
  `sens_transfert` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `num_location_source` smallint(5) unsigned NOT NULL DEFAULT '0',
  `num_location_dest` smallint(5) unsigned NOT NULL DEFAULT '0',
  `num_expl` int(10) unsigned NOT NULL DEFAULT '0',
  `etat_demande` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_visualisee` date DEFAULT NULL,
  `date_envoyee` date DEFAULT NULL,
  `date_reception` date DEFAULT NULL,
  `motif_refus` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `statut_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `section_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `resa_trans` int(8) unsigned NOT NULL DEFAULT '0',
  `resa_arc_trans` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_transfert_demande`),
  KEY `num_transfert` (`num_transfert`),
  KEY `num_location_source` (`num_location_source`),
  KEY `num_location_dest` (`num_location_dest`),
  KEY `num_expl` (`num_expl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferts_demande`
--

LOCK TABLES `transferts_demande` WRITE;
/*!40000 ALTER TABLE `transferts_demande` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferts_demande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferts_source`
--

DROP TABLE IF EXISTS `transferts_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transferts_source` (
  `trans_source_numexpl` int(10) unsigned NOT NULL DEFAULT '0',
  `trans_source_numloc` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_source_numexpl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferts_source`
--

LOCK TABLES `transferts_source` WRITE;
/*!40000 ALTER TABLE `transferts_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferts_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translation`
--

DROP TABLE IF EXISTS `translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translation` (
  `trans_table` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `trans_field` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `trans_lang` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `trans_num` int(8) unsigned NOT NULL DEFAULT '0',
  `trans_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`trans_table`,`trans_field`,`trans_lang`,`trans_num`),
  KEY `i_lang` (`trans_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation`
--

LOCK TABLES `translation` WRITE;
/*!40000 ALTER TABLE `translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tris`
--

DROP TABLE IF EXISTS `tris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tris` (
  `id_tri` int(4) NOT NULL AUTO_INCREMENT,
  `tri_par` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nom_tri` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tri_reference` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'notices',
  PRIMARY KEY (`id_tri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tris`
--

LOCK TABLES `tris` WRITE;
/*!40000 ALTER TABLE `tris` DISABLE KEYS */;
/*!40000 ALTER TABLE `tris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tu_custom`
--

DROP TABLE IF EXISTS `tu_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tu_custom` (
  `idchamp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_type` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `datatype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` text COLLATE utf8_unicode_ci,
  `multiple` int(11) NOT NULL DEFAULT '0',
  `obligatoire` int(11) NOT NULL DEFAULT '0',
  `ordre` int(11) DEFAULT NULL,
  `search` int(1) unsigned NOT NULL DEFAULT '0',
  `export` int(1) unsigned NOT NULL DEFAULT '0',
  `exclusion_obligatoire` int(1) unsigned NOT NULL DEFAULT '0',
  `pond` int(11) NOT NULL DEFAULT '100',
  `opac_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idchamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tu_custom`
--

LOCK TABLES `tu_custom` WRITE;
/*!40000 ALTER TABLE `tu_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `tu_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tu_custom_lists`
--

DROP TABLE IF EXISTS `tu_custom_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tu_custom_lists` (
  `tu_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `tu_custom_list_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tu_custom_list_lib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  KEY `editorial_custom_champ` (`tu_custom_champ`),
  KEY `editorial_champ_list_value` (`tu_custom_champ`,`tu_custom_list_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tu_custom_lists`
--

LOCK TABLES `tu_custom_lists` WRITE;
/*!40000 ALTER TABLE `tu_custom_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `tu_custom_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tu_custom_values`
--

DROP TABLE IF EXISTS `tu_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tu_custom_values` (
  `tu_custom_champ` int(10) unsigned NOT NULL DEFAULT '0',
  `tu_custom_origine` int(10) unsigned NOT NULL DEFAULT '0',
  `tu_custom_small_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tu_custom_text` text COLLATE utf8_unicode_ci,
  `tu_custom_integer` int(11) DEFAULT NULL,
  `tu_custom_date` date DEFAULT NULL,
  `tu_custom_float` float DEFAULT NULL,
  KEY `editorial_custom_champ` (`tu_custom_champ`),
  KEY `editorial_custom_origine` (`tu_custom_origine`),
  KEY `i_tcv_st` (`tu_custom_small_text`),
  KEY `i_tcv_t` (`tu_custom_text`(255)),
  KEY `i_tcv_i` (`tu_custom_integer`),
  KEY `i_tcv_d` (`tu_custom_date`),
  KEY `i_tcv_f` (`tu_custom_float`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tu_custom_values`
--

LOCK TABLES `tu_custom_values` WRITE;
/*!40000 ALTER TABLE `tu_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `tu_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tu_distrib`
--

DROP TABLE IF EXISTS `tu_distrib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tu_distrib` (
  `distrib_num_tu` int(9) unsigned NOT NULL DEFAULT '0',
  `distrib_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `distrib_ordre` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`distrib_num_tu`,`distrib_ordre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tu_distrib`
--

LOCK TABLES `tu_distrib` WRITE;
/*!40000 ALTER TABLE `tu_distrib` DISABLE KEYS */;
/*!40000 ALTER TABLE `tu_distrib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tu_ref`
--

DROP TABLE IF EXISTS `tu_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tu_ref` (
  `ref_num_tu` int(9) unsigned NOT NULL DEFAULT '0',
  `ref_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ref_ordre` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ref_num_tu`,`ref_ordre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tu_ref`
--

LOCK TABLES `tu_ref` WRITE;
/*!40000 ALTER TABLE `tu_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `tu_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tu_subdiv`
--

DROP TABLE IF EXISTS `tu_subdiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tu_subdiv` (
  `subdiv_num_tu` int(9) unsigned NOT NULL DEFAULT '0',
  `subdiv_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subdiv_ordre` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subdiv_num_tu`,`subdiv_ordre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tu_subdiv`
--

LOCK TABLES `tu_subdiv` WRITE;
/*!40000 ALTER TABLE `tu_subdiv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tu_subdiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tva_achats`
--

DROP TABLE IF EXISTS `tva_achats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tva_achats` (
  `id_tva` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `taux_tva` float(4,2) unsigned NOT NULL DEFAULT '0.00',
  `num_cp_compta` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tva`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tva_achats`
--

LOCK TABLES `tva_achats` WRITE;
/*!40000 ALTER TABLE `tva_achats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tva_achats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_abts`
--

DROP TABLE IF EXISTS `type_abts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_abts` (
  `id_type_abt` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_abt_libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prepay` int(1) unsigned NOT NULL DEFAULT '0',
  `prepay_deflt_mnt` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tarif` decimal(16,2) NOT NULL DEFAULT '0.00',
  `commentaire` text COLLATE utf8_unicode_ci NOT NULL,
  `caution` decimal(16,2) NOT NULL DEFAULT '0.00',
  `localisations` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_type_abt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_abts`
--

LOCK TABLES `type_abts` WRITE;
/*!40000 ALTER TABLE `type_abts` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_abts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_comptes`
--

DROP TABLE IF EXISTS `type_comptes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_comptes` (
  `id_type_compte` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_acces` int(8) unsigned NOT NULL DEFAULT '0',
  `acces_id` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type_compte`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_comptes`
--

LOCK TABLES `type_comptes` WRITE;
/*!40000 ALTER TABLE `type_comptes` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_comptes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_produits`
--

DROP TABLE IF EXISTS `types_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_produits` (
  `id_produit` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_cp_compta` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `num_tva_achat` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_produit`),
  KEY `libelle` (`libelle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_produits`
--

LOCK TABLES `types_produits` WRITE;
/*!40000 ALTER TABLE `types_produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `types_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_repertoire`
--

DROP TABLE IF EXISTS `upload_repertoire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_repertoire` (
  `repertoire_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `repertoire_nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repertoire_url` text COLLATE utf8_unicode_ci NOT NULL,
  `repertoire_path` text COLLATE utf8_unicode_ci NOT NULL,
  `repertoire_navigation` int(1) NOT NULL DEFAULT '0',
  `repertoire_hachage` int(1) NOT NULL DEFAULT '0',
  `repertoire_subfolder` int(8) NOT NULL DEFAULT '0',
  `repertoire_utf8` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`repertoire_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_repertoire`
--

LOCK TABLES `upload_repertoire` WRITE;
/*!40000 ALTER TABLE `upload_repertoire` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_repertoire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(5) NOT NULL AUTO_INCREMENT,
  `create_dt` date NOT NULL DEFAULT '0000-00-00',
  `last_updated_dt` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_digest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prenom` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rights` int(8) unsigned NOT NULL DEFAULT '0',
  `user_lang` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fr_FR',
  `nb_per_page_search` int(10) unsigned NOT NULL DEFAULT '4',
  `nb_per_page_select` int(10) unsigned NOT NULL DEFAULT '10',
  `nb_per_page_gestion` int(10) unsigned NOT NULL DEFAULT '20',
  `param_popup_ticket` smallint(1) unsigned NOT NULL DEFAULT '0',
  `param_sounds` smallint(1) unsigned NOT NULL DEFAULT '1',
  `param_rfid_activate` int(1) NOT NULL DEFAULT '1',
  `param_licence` int(1) unsigned NOT NULL DEFAULT '0',
  `deflt_notice_statut` int(6) unsigned NOT NULL DEFAULT '1',
  `deflt_integration_notice_statut` int(6) NOT NULL DEFAULT '1',
  `xmlta_indexation_lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deflt_docs_type` int(6) unsigned NOT NULL DEFAULT '1',
  `deflt_lenders` int(6) unsigned NOT NULL DEFAULT '0',
  `deflt_styles` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `deflt_docs_statut` int(6) unsigned DEFAULT '0',
  `deflt_docs_codestat` int(6) unsigned DEFAULT '0',
  `value_deflt_lang` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'fre',
  `value_deflt_fonction` varchar(20) COLLATE utf8_unicode_ci DEFAULT '070',
  `value_deflt_relation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `value_deflt_relation_serial` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_deflt_relation_bulletin` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_deflt_relation_analysis` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deflt_docs_location` int(6) unsigned DEFAULT '0',
  `deflt_collstate_location` int(6) unsigned DEFAULT '0',
  `deflt_bulletinage_location` int(6) unsigned NOT NULL DEFAULT '0',
  `deflt_resas_location` int(6) unsigned DEFAULT '0',
  `deflt_docs_section` int(6) unsigned DEFAULT '0',
  `value_deflt_module` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'circu',
  `user_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `user_alert_resamail` int(1) unsigned NOT NULL DEFAULT '0',
  `user_alert_demandesmail` int(1) unsigned NOT NULL DEFAULT '0',
  `user_alert_subscribemail` int(1) unsigned NOT NULL DEFAULT '0',
  `deflt2docs_location` int(6) unsigned NOT NULL DEFAULT '0',
  `deflt_empr_statut` bigint(20) unsigned NOT NULL DEFAULT '1',
  `deflt_thesaurus` int(3) unsigned NOT NULL DEFAULT '1',
  `deflt_concept_scheme` int(3) NOT NULL DEFAULT '-1',
  `deflt_import_thesaurus` int(11) NOT NULL DEFAULT '1',
  `value_prefix_cote` tinyblob NOT NULL,
  `xmlta_doctype` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `xmlta_doctype_serial` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlta_doctype_bulletin` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlta_doctype_analysis` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `speci_coordonnees_etab` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `value_email_bcc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_deflt_antivol` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `explr_invisible` text COLLATE utf8_unicode_ci,
  `explr_visible_mod` text COLLATE utf8_unicode_ci,
  `explr_visible_unmod` text COLLATE utf8_unicode_ci,
  `deflt3bibli` int(5) unsigned NOT NULL DEFAULT '0',
  `deflt3exercice` int(8) unsigned NOT NULL DEFAULT '0',
  `deflt3rubrique` int(8) unsigned NOT NULL DEFAULT '0',
  `deflt3dev_statut` int(3) NOT NULL DEFAULT '-1',
  `deflt3cde_statut` int(3) NOT NULL DEFAULT '-1',
  `deflt3liv_statut` int(3) NOT NULL DEFAULT '-1',
  `deflt3fac_statut` int(3) NOT NULL DEFAULT '-1',
  `deflt3sug_statut` int(3) NOT NULL DEFAULT '-1',
  `environnement` mediumblob NOT NULL,
  `param_allloc` int(1) unsigned NOT NULL DEFAULT '0',
  `grp_num` int(10) unsigned DEFAULT '0',
  `deflt_arch_statut` int(6) unsigned NOT NULL DEFAULT '0',
  `deflt_arch_emplacement` int(6) unsigned NOT NULL DEFAULT '0',
  `deflt_arch_type` int(6) unsigned NOT NULL DEFAULT '0',
  `deflt_upload_repertoire` int(8) NOT NULL DEFAULT '0',
  `deflt3lgstatdev` int(3) NOT NULL DEFAULT '1',
  `deflt3lgstatcde` int(3) NOT NULL DEFAULT '1',
  `deflt3receptsugstat` int(3) NOT NULL DEFAULT '32',
  `deflt_short_loan_activate` int(1) unsigned NOT NULL DEFAULT '0',
  `deflt_cashdesk` int(11) NOT NULL DEFAULT '0',
  `deflt_explnum_statut` int(6) unsigned NOT NULL DEFAULT '1',
  `user_alert_suggmail` int(1) unsigned NOT NULL DEFAULT '0',
  `deflt_notice_replace_keep_categories` int(1) NOT NULL DEFAULT '0',
  `deflt_notice_is_new` int(1) unsigned NOT NULL DEFAULT '0',
  `deflt_agnostic_warehouse` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2002-07-28','2014-03-14','admin','*4ACFE3202A5FF5CF467898FC58AAB1D615029441','028262ca7d82187e983fa4a9937891e2','Super User','',133375,'es_ES',20,10,20,0,1,1,1,1,1,'',1,2,'enjoy',1,12,'spa','070','a-up','a-up','a-up','a-up',1,0,1,0,10,'admin','pmb@sigb.net',1,0,0,1,1,1,0,1,'','a','a','0','0','','','0','0','0','0',0,0,0,-1,-1,-1,-1,-1,'',0,0,1,1,1,0,1,1,32,0,0,1,0,0,0,0),(2,'2004-01-21','2005-08-10','circ','*32C97A536D5B9EE7B026D62958A8F14C92C9D1D3','','Becario','',1,'es_ES',10,10,20,0,1,1,1,1,1,'',1,1,'vert_et_parme',1,10,'spa','070','a-up','a-up','a-up','a-up',1,0,1,0,26,'circu','',0,0,0,1,1,1,0,1,'','a','','','','','','0',NULL,NULL,NULL,0,0,0,-1,-1,-1,-1,-1,'',0,0,0,0,0,0,1,1,32,0,0,1,0,0,0,0),(3,'2004-01-21','2005-08-10','cat','*FD98809C60DD51B6B380DB17B72F9A9E2FE1928F','','Bibliotecario auxiliar','',7,'es_ES',10,10,20,0,1,1,1,1,1,'',1,1,'default',1,10,'spa','070','a-up','a-up','a-up','a-up',1,0,1,0,26,'catal','',0,0,0,1,1,1,0,1,'','a','','','','','','0',NULL,NULL,NULL,0,0,0,-1,-1,-1,-1,-1,'',0,0,0,0,0,0,1,1,32,0,0,1,0,0,0,0),(4,'2004-01-21','2005-08-10','bib','*09EC8C1768A5648B27E281FECD36C0BE342B7217','','Bibliotecario','',23,'es_ES',10,10,20,0,1,1,1,1,1,'',1,1,'default',13,12,'spa','070','a-up','a-up','a-up','a-up',7,0,7,0,26,'circu','',0,0,0,1,1,1,0,1,'','a','','','','','','0',NULL,NULL,NULL,0,0,0,-1,-1,-1,-1,-1,'',0,0,0,0,0,0,1,1,32,0,0,1,0,0,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `grp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grp_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`grp_id`),
  KEY `i_users_groups_grp_name` (`grp_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedette`
--

DROP TABLE IF EXISTS `vedette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vedette` (
  `id_vedette` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `grammar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'rameau',
  PRIMARY KEY (`id_vedette`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedette`
--

LOCK TABLES `vedette` WRITE;
/*!40000 ALTER TABLE `vedette` DISABLE KEYS */;
/*!40000 ALTER TABLE `vedette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedette_link`
--

DROP TABLE IF EXISTS `vedette_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vedette_link` (
  `num_vedette` int(10) unsigned NOT NULL,
  `num_object` int(10) unsigned NOT NULL,
  `type_object` int(10) unsigned NOT NULL,
  PRIMARY KEY (`num_vedette`,`num_object`,`type_object`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedette_link`
--

LOCK TABLES `vedette_link` WRITE;
/*!40000 ALTER TABLE `vedette_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `vedette_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedette_object`
--

DROP TABLE IF EXISTS `vedette_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vedette_object` (
  `object_type` int(3) unsigned NOT NULL DEFAULT '0',
  `object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `num_vedette` int(11) unsigned NOT NULL DEFAULT '0',
  `subdivision` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_type`,`object_id`,`num_vedette`,`subdivision`,`position`),
  KEY `i_vedette_object_object` (`object_type`,`object_id`),
  KEY `i_vedette_object_vedette` (`num_vedette`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedette_object`
--

LOCK TABLES `vedette_object` WRITE;
/*!40000 ALTER TABLE `vedette_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `vedette_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visionneuse_params`
--

DROP TABLE IF EXISTS `visionneuse_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visionneuse_params` (
  `visionneuse_params_id` int(11) NOT NULL AUTO_INCREMENT,
  `visionneuse_params_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visionneuse_params_parameters` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`visionneuse_params_id`),
  UNIQUE KEY `visionneuse_params_class` (`visionneuse_params_class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visionneuse_params`
--

LOCK TABLES `visionneuse_params` WRITE;
/*!40000 ALTER TABLE `visionneuse_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `visionneuse_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voir_aussi`
--

DROP TABLE IF EXISTS `voir_aussi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voir_aussi` (
  `num_noeud_orig` int(9) unsigned NOT NULL DEFAULT '0',
  `num_noeud_dest` int(9) unsigned NOT NULL DEFAULT '0',
  `langue` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_voir_aussi` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`num_noeud_orig`,`num_noeud_dest`,`langue`),
  KEY `num_noeud_dest` (`num_noeud_dest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voir_aussi`
--

LOCK TABLES `voir_aussi` WRITE;
/*!40000 ALTER TABLE `voir_aussi` DISABLE KEYS */;
/*!40000 ALTER TABLE `voir_aussi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `words` (
  `id_word` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `double_metaphone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stem` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_word`),
  UNIQUE KEY `i_word_lang` (`word`,`lang`),
  KEY `i_stem_lang` (`stem`,`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_attr`
--

DROP TABLE IF EXISTS `z_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_attr` (
  `attr_bib_id` int(6) unsigned NOT NULL DEFAULT '0',
  `attr_libelle` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attr_attr` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`attr_bib_id`,`attr_libelle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_attr`
--

LOCK TABLES `z_attr` WRITE;
/*!40000 ALTER TABLE `z_attr` DISABLE KEYS */;
INSERT INTO `z_attr` VALUES (2,'sujet','21'),(2,'titre','4'),(2,'auteur','1003'),(2,'isbn','7'),(3,'sujet','21'),(3,'titre','4'),(3,'isbn','7'),(3,'auteur','1003'),(5,'auteur','1004'),(5,'titre','4'),(5,'isbn','7'),(5,'sujet','21'),(7,'isbn','7'),(7,'auteur','1003'),(7,'titre','4'),(7,'sujet','21'),(8,'auteur','1'),(8,'titre','4'),(8,'isbn','7'),(8,'sujet','21'),(8,'mots','1016'),(10,'auteur','1003'),(10,'titre','4'),(10,'isbn','7'),(10,'sujet','21'),(12,'sujet','21'),(12,'auteur','1003'),(12,'titre','4'),(12,'isbn','7'),(11,'sujet','21'),(11,'auteur','1003'),(11,'isbn','7'),(11,'titre','4'),(15,'auteur','1003'),(15,'titre','4'),(15,'isbn','7'),(15,'sujet','21'),(17,'sujet','21'),(17,'auteur','1003'),(17,'isbn','7'),(17,'titre','4'),(21,'sujet','21'),(21,'auteur','1003'),(21,'isbn','7'),(21,'titre','4');
/*!40000 ALTER TABLE `z_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_bib`
--

DROP TABLE IF EXISTS `z_bib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_bib` (
  `bib_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `bib_nom` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_user` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `auth_pass` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sutrs_lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fichier_func` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`bib_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_bib`
--

LOCK TABLES `z_bib` WRITE;
/*!40000 ALTER TABLE `z_bib` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_bib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_notices`
--

DROP TABLE IF EXISTS `z_notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_notices` (
  `znotices_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `znotices_query_id` int(11) DEFAULT NULL,
  `znotices_bib_id` int(6) unsigned DEFAULT '0',
  `isbd` text COLLATE utf8_unicode_ci,
  `isbn` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auteur` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `z_marc` longblob NOT NULL,
  PRIMARY KEY (`znotices_id`),
  KEY `idx_z_notices_idq` (`znotices_query_id`),
  KEY `idx_z_notices_isbn` (`isbn`),
  KEY `idx_z_notices_titre` (`titre`),
  KEY `idx_z_notices_auteur` (`auteur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_notices`
--

LOCK TABLES `z_notices` WRITE;
/*!40000 ALTER TABLE `z_notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_query`
--

DROP TABLE IF EXISTS `z_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_query` (
  `zquery_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `search_attr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zquery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`zquery_id`),
  KEY `zquery_date` (`zquery_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_query`
--

LOCK TABLES `z_query` WRITE;
/*!40000 ALTER TABLE `z_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_query` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-08 13:05:43
