<?php
// +-------------------------------------------------+
//  2002-2004 PMB Services / www.sigb.net pmb@sigb.net et contributeurs (voir www.sigb.net)
// +-------------------------------------------------+
// $Id: alter_vLlxPandora.inc.php, migración BD a v5.19 (Lliurex 16.05 Xenial desde v.5.10 (Lliurex 14.05 Trusty)


if (stristr($_SERVER['REQUEST_URI'], ".inc.php")) die("no access");

settype ($action,"string");

mysql_query("set names latin1 ", $dbh);
switch ($version_pmb_bdd) {
	case "vLlxPandora":
//  case "v5.10":
		// 10 actualizaciones desde trusty (v5.10) a xenial (v5.19)
		$increment=100/10;
		$action=$increment;
        echo "<table ><tr><th>".$msg['admin_misc_action']."</th><th>".$msg['admin_misc_resultat']."</th></tr>";
		// +-------------------------------------------------+

		//AR - ajout de type de contenu générique pour les articles et rubriques...
		if(!pmb_mysql_num_rows(pmb_mysql_query("select id_editorial_type from cms_editorial_types where editorial_type_element  ='article_generic'"))){
			$rqt = "insert into cms_editorial_types set editorial_type_element = 'article_generic', editorial_type_label ='CP pour Article'";
			echo traite_rqt($rqt,"insert into cms_editorial_types set editorial_type_element = 'article_generic'") ;
			$rqt = "insert into cms_editorial_types set editorial_type_element = 'section_generic', editorial_type_label ='CP pour Rubrique'";
			echo traite_rqt($rqt,"insert into cms_editorial_types set editorial_type_element = 'section_generic'") ;
		}

		//DG - Ajout du champ index_libelle dans la table frais
		$rqt = "ALTER TABLE frais ADD index_libelle TEXT";
		echo traite_rqt($rqt,"alter table frais add index_libelle");

		//DG - Paramètres pour les lettres de retard par groupe
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pdflettreretard' and sstype_param='1before_list_group' "))==0){
			$rqt = "select valeur_param,comment_param from parametres where type_param= 'pdflettreretard' and sstype_param='1before_list' ";
			$res = pmb_mysql_query($rqt);
			$value_param = pmb_mysql_result($res,0,0);
			$comment_param = pmb_mysql_result($res,0,1);
			$rqt = "INSERT INTO parametres (type_param, sstype_param, valeur_param,comment_param) VALUES ('pdflettreretard', '1before_list_group', '".addslashes($value_param)."', '".addslashes($comment_param)."') " ;
			echo traite_rqt($rqt,"insert pdflettreretard,1before_list_group into parametres");
		}
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pdflettreretard' and sstype_param='1after_list_group' "))==0){
			$rqt = "select valeur_param,comment_param from parametres where type_param= 'pdflettreretard' and sstype_param='1after_list' ";
			$res = pmb_mysql_query($rqt);
			$value_param = pmb_mysql_result($res,0,0);
			$comment_param = pmb_mysql_result($res,0,1);
			$rqt = "INSERT INTO parametres (type_param, sstype_param, valeur_param,comment_param) VALUES ('pdflettreretard', '1after_list_group', '".addslashes($value_param)."', '".addslashes($comment_param)."') " ;
			echo traite_rqt($rqt,"insert pdflettreretard,1after_list_group into parametres");
		}
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pdflettreretard' and sstype_param='1fdp_group' "))==0){
			$rqt = "select valeur_param,comment_param from parametres where type_param= 'pdflettreretard' and sstype_param='1fdp' ";
			$res = pmb_mysql_query($rqt);
			$value_param = pmb_mysql_result($res,0,0);
			$comment_param = pmb_mysql_result($res,0,1);
			$rqt = "INSERT INTO parametres (type_param, sstype_param, valeur_param,comment_param) VALUES ('pdflettreretard', '1fdp_group', '".addslashes($value_param)."', '".addslashes($comment_param)."') " ;
			echo traite_rqt($rqt,"insert pdflettreretard,1fdp_group into parametres");
		}
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pdflettreretard' and sstype_param='1madame_monsieur_group' "))==0){
			$rqt = "select valeur_param,comment_param from parametres where type_param= 'pdflettreretard' and sstype_param='1madame_monsieur' ";
			$res = pmb_mysql_query($rqt);
			$value_param = pmb_mysql_result($res,0,0);
			$comment_param = pmb_mysql_result($res,0,1);
			$rqt = "INSERT INTO parametres (type_param, sstype_param, valeur_param,comment_param) VALUES ('pdflettreretard', '1madame_monsieur_group', '".addslashes($value_param)."', '".addslashes($comment_param)."') " ;
			echo traite_rqt($rqt,"insert pdflettreretard,1madame_monsieur_group into parametres");
		}

		//DG - Impression du nom du groupe sur la lettre de rappel
		$rqt = "ALTER TABLE groupe ADD lettre_rappel_show_nomgroup INT( 1 ) UNSIGNED DEFAULT 0 NOT NULL ";
		echo traite_rqt($rqt,"ALTER TABLE groupe ADD lettre_rappel_show_nomgroup default 0");
		$rqt = "update groupe set lettre_rappel_show_nomgroup=lettre_rappel ";
		echo traite_rqt($rqt,"update groupe set lettre_rappel_show_nomgroup=lettre_rappel");

		//AR - Ajout des extensions de formulaire pour les types de contenus
		$rqt = "alter table cms_editorial_types add editorial_type_extension text not null";
		echo traite_rqt($rqt,"alter table cms_editorial_types add editorial_type_extension");

		//AR - Ajout de la table de stockages des infos des extension
		$rqt = "create table cms_modules_extensions_datas (
			id_extension_datas int(10) not null auto_increment primary key,
			extension_datas_module varchar(255) not null default '',
			extension_datas_type varchar(255) not null default '',
			extension_datas_type_element varchar(255) not null default '',
			extension_datas_num_element int(10) not null default 0,
			extension_datas_datas blob
		)";
		echo traite_rqt($rqt,"create table cms_modules_extensions_datas");

		//NG - Ordre des facettes
		$rqt = "alter table facettes add facette_order int not null default 1";
		echo traite_rqt($rqt,"alter table facettes add facette_order");
		//NG - limit_plus des facettes
		$rqt = "alter table facettes add facette_limit_plus int not null default 0";
		echo traite_rqt($rqt,"alter table facettes add facette_limit_plus");

		//MB - Modification de l'identifiant 28 en 1 pour le trie car il est présent en double dans sort.xml
		$rqt = "update parametres set valeur_param=REPLACE(valeur_param, '_28', '_1') WHERE type_param='opac' AND sstype_param='default_sort' AND valeur_param REGEXP '_28[^0-9]|_28$'";
		echo traite_rqt($rqt,"update param opac_default_sort");

		//NG pb de placement de main_hors_footer et footer
		$rqt = "update cms_build set build_parent='main' where build_obj='main_header' or build_obj='main_hors_footer' or build_obj='footer' ";
		echo traite_rqt($rqt,"update cms_build set build_parent");

		//NG pb de placement des zones du contener
		$rqt = "update cms_build set build_child_before='', build_child_after='intro' where build_obj='main' ";
		echo traite_rqt($rqt,"update cms_build where build_obj='main'");
		$rqt = "update cms_build set build_child_before='main', build_child_after='bandeau' where build_obj='intro' ";
		echo traite_rqt($rqt,"update cms_build where build_obj='intro'");
		$rqt = "update cms_build set build_child_before='intro', build_child_after='bandeau_2' where build_obj='bandeau' ";
		echo traite_rqt($rqt,"update cms_build  where build_obj='bandeau'");
		$rqt = "update cms_build set build_child_before='bandeau', build_child_after='' where build_obj='bandeau_2' ";
		echo traite_rqt($rqt,"update cms_build where build_obj='bandeau_2' ");

		// +-------------------------------------------------+
		echo "</table>";
		$rqt = "update parametres set valeur_param='".$action."' where type_param='pmb' and sstype_param='bdd_version' " ;
		$res = pmb_mysql_query($rqt, $dbh) ;
		echo "<strong><font color='#FF0000'>".$msg[1807]." ".number_format($action, 2, ',', '.')."%</font></strong><br />";
		$action=$action+$increment;
		
		//echo form_relance ("v5.11");
		//break;
//case "v5.11":
		echo "<table ><tr><th>".$msg['admin_misc_action']."</th><th>".$msg['admin_misc_resultat']."</th></tr>";
		// +-------------------------------------------------+

		//NG Ajout param opac_show_bandeau_2
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='show_bandeau_2' "))==0){
			$rqt = "select valeur_param from parametres where type_param= 'opac' and sstype_param='show_bandeaugauche' ";
			$res = pmb_mysql_query($rqt);
			$value_param = pmb_mysql_result($res,0,0);
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'opac', 'show_bandeau_2', '".addslashes($value_param)."', 'Affichage du bandeau_2 ? \n 0 : Non\n 1 : Oui', 'f_modules', 0) " ;
			echo traite_rqt($rqt,"insert opac_show_bandeau_2=opac_show_bandeaugauche into parametres");
		}

		if (pmb_mysql_result(pmb_mysql_query("select count(*) from notices"),0,0) > 15000){
			$rqt = "truncate table notices_mots_global_index";
			echo traite_rqt($rqt,"truncate table notices_mots_global_index");

			// Info de réindexation
			$rqt = " select 1 " ;
			echo traite_rqt($rqt,"<b><a href='".$base_path."/admin.php?categ=netbase' target=_blank>VOUS DEVEZ REINDEXER (APRES ETAPES DE MISE A JOUR) / YOU MUST REINDEX (STEPS AFTER UPDATE) : Admin > Outils > Nettoyage de base</a></b> ") ;
		}
		//NG ajout de field_position dans notices_mots_global_index
		$rqt = "alter table notices_mots_global_index add field_position int not null default 1";
		echo traite_rqt($rqt,"alter table notices_mots_global_index add field_position");

		//abacarisse en attente
		if (pmb_mysql_num_rows(pmb_mysql_query("select id_param from parametres where type_param= 'opac' and sstype_param='param_social_network' "))==0){
			//Ajout du paramètre de configuration de l'api addThis
			$rqt = "INSERT INTO parametres (type_param ,sstype_param ,valeur_param ,comment_param ,section_param ,gestion) VALUES ('opac', 'param_social_network',
			'{
			\"token\":\"ra-4d9b1e202c30dea1\",
			\"version\":\"300\",
			\"buttons\":[
			{
			\"attributes\":{
			\"class\":\"addthis_button_facebook_like\",
			\"fb:like:layout\":\"button_count\"
			}
			},
			{
			\"attributes\":{
			\"class\":\"addthis_button_tweet\"
			}
			},
			{
			\"attributes\":{
			\"class\":\"addthis_counter addthis_button_compact\"
			}
			}
			],
			\"toolBoxParams\":{
			\"class\":\"addthis_toolbox addthis_default_style\"
			},
			\"addthis_share\":{

			},
			\"addthis_config\":{
			\"data_track_clickback\":\"true\",
			\"ui_click\":\"true\"
			}
			}
			', 'Tableau de paramètrage de l\'API de gestion des interconnexions aux réseaux sociaux.
			Au format JSON.
			Exemple :
			{
			\"token\":\"ra-4d9b1e202c30dea1\",
			\"version\":\"300\",
			\"buttons\":[
			{
			\"attributes\":{
			\"class\":\"addthis_button_preferred_1\"
			}
			},
			{
			\"attributes\":{
			\"class\":\"addthis_button_preferred_2\"
			}
			},
			{
			\"attributes\":{
			\"class\":\"addthis_button_preferred_3\"
			}
			},
			{
			\"attributes\":{
			\"class\":\"addthis_button_preferred_4\"
			}
			},
			{
			\"attributes\":{
			\"class\":\"addthis_button_compact\"
			}
			},
			{
			\"attributes\":{
			\"class\":\"addthis_counter addthis_bubble_style\"
			}
			}
			],
			\"toolBoxParams\":{
			\"class\":\"addthis_toolbox addthis_default_style addthis_32x32_style\"
			},
			\"addthis_share\":{

			},
			\"addthis_config\":{
			\"data_track_addressbar\":true
			}
			}', 'e_aff_notice', '0'
			)";
			echo traite_rqt($rqt,"insert opac_param_social_network into parametres");
		}

		// DG
		//ajout du champ groupe_lecteurs dans la table bannettes
		$rqt = "ALTER TABLE bannettes ADD groupe_lecteurs INT(8) UNSIGNED NOT NULL default 0";
		echo traite_rqt($rqt,"alter table bannettes add groupe_lecteurs");

		// JP
		$rqt = "update parametres set comment_param='Tri par défaut des recherches OPAC. Deux possibilités :\n- un seul tri par défaut de la forme c_num_6\n- plusieurs tris par défaut de la forme c_num_6|Libelle;d_text_7|Libelle 2;c_num_5|Libelle 3\n\nc pour croissant, d pour décroissant\nnum ou text pour numérique ou texte\nidentifiant du champ (voir fichier xml sort.xml)\nlibellé du tri si plusieurs' WHERE type_param='opac' AND sstype_param='default_sort'";
		echo traite_rqt($rqt,"update comment for param opac_default_sort");

		// Transfert: statut non pretable pour les expl en demande de transfert
		if (pmb_mysql_num_rows(pmb_mysql_query("SELECT 1 FROM parametres WHERE type_param= 'transferts' and sstype_param='pret_demande_statut' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, gestion, comment_param)
			VALUES (0, 'transferts', 'pret_demande_statut', '0', '1', 'Appliquer ce statut avant la validation') ";
			echo traite_rqt($rqt,"INSERT transferts_pret_demande_statut INTO parametres") ;
		}

		// descriptors in DSI
		$rqt = "create table if not exists bannettes_descriptors(
			num_bannette int not null default 0,
			num_noeud int not null default 0,
			bannette_descriptor_order int not null default 0,
			primary key (num_bannette,num_noeud)
		)";
		echo traite_rqt($rqt,"create table bannettes_descriptors") ;

		//ajout du champ bannette_mail dans bannette_abon
		$rqt = "ALTER TABLE bannette_abon ADD bannette_mail varchar(255) not null default '' ";
		echo traite_rqt($rqt,"alter table bannette_abon add bannette_mail");

		//AR - on a vu un cas ou ca se passe mal dans la 5.10, par précaution, on répète!
		if(!pmb_mysql_num_rows(pmb_mysql_query("select id_editorial_type from cms_editorial_types where editorial_type_element  ='article_generic'"))){
			$rqt = "insert into cms_editorial_types set editorial_type_element = 'article_generic', editorial_type_label ='CP pour Article'";
			echo traite_rqt($rqt,"insert into cms_editorial_types set editorial_type_element = 'article_generic'") ;
		}
		if(!pmb_mysql_num_rows(pmb_mysql_query("select id_editorial_type from cms_editorial_types where editorial_type_element  ='section_generic'"))){
			$rqt = "insert into cms_editorial_types set editorial_type_element = 'section_generic', editorial_type_label ='CP pour Rubrique'";
			echo traite_rqt($rqt,"insert into cms_editorial_types set editorial_type_element = 'section_generic'") ;
		}

		//DG - Augmentation de la taille du champ mention_date de la table bulletins
		$rqt = "ALTER TABLE bulletins MODIFY mention_date varchar(255) not null default ''";
		echo traite_rqt($rqt,"alter table bulletins modify mention_date");

		//DG - parametre pour l'affichage des notices de bulletins dans la navigation a2z
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='perio_a2z_show_bulletin_notice' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'opac', 'perio_a2z_show_bulletin_notice', '0', 'Affichage de la notice de bulletin dans le navigateur de périodiques', 'c_recherche',0) ";
			echo traite_rqt($rqt, "insert opac_perio_a2z_show_bulletin_notice=0 into parametres");
		}

		//DG - ajout d'un commentaire de gestion pour les suggestions
		$rqt = "ALTER TABLE suggestions ADD commentaires_gestion TEXT AFTER commentaires";
		echo traite_rqt($rqt,"alter table suggestions add commentaires_gestion");

		//NG - Champs perso author
		$rqt = "create table if not exists author_custom (
			idchamp int(10) unsigned NOT NULL auto_increment,
			num_type int unsigned not null default 0,
			name varchar(255) NOT NULL default '',
			titre varchar(255) default NULL,
			type varchar(10) NOT NULL default 'text',
			datatype varchar(10) NOT NULL default '',
			options text,
			multiple int(11) NOT NULL default 0,
			obligatoire int(11) NOT NULL default 0,
			ordre int(11) default NULL,
			search INT(1) unsigned NOT NULL DEFAULT 0,
			export INT(1) unsigned NOT NULL DEFAULT 0,
			exclusion_obligatoire INT(1) unsigned NOT NULL DEFAULT 0,
			pond int not null default 100,
			opac_sort INT NOT NULL DEFAULT 0,
			PRIMARY KEY  (idchamp)) ";
		echo traite_rqt($rqt,"create table author_custom ");

		$rqt = "create table if not exists author_custom_lists (
			author_custom_champ int(10) unsigned NOT NULL default 0,
			author_custom_list_value varchar(255) default NULL,
			author_custom_list_lib varchar(255) default NULL,
			ordre int(11) default NULL,
			KEY editorial_custom_champ (author_custom_champ),
			KEY editorial_champ_list_value (author_custom_champ,author_custom_list_value)) " ;
		echo traite_rqt($rqt,"create table if not exists author_custom_lists ");

		$rqt = "create table if not exists author_custom_values (
			author_custom_champ int(10) unsigned NOT NULL default 0,
			author_custom_origine int(10) unsigned NOT NULL default 0,
			author_custom_small_text varchar(255) default NULL,
			author_custom_text text,
			author_custom_integer int(11) default NULL,
			author_custom_date date default NULL,
			author_custom_float float default NULL,
			KEY editorial_custom_champ (author_custom_champ),
			KEY editorial_custom_origine (author_custom_origine)) " ;
		echo traite_rqt($rqt,"create table if not exists author_custom_values ");

		//NG - Champs perso categ
		$rqt = "create table if not exists categ_custom (
			idchamp int(10) unsigned NOT NULL auto_increment,
			num_type int unsigned not null default 0,
			name varchar(255) NOT NULL default '',
			titre varchar(255) default NULL,
			type varchar(10) NOT NULL default 'text',
			datatype varchar(10) NOT NULL default '',
			options text,
			multiple int(11) NOT NULL default 0,
			obligatoire int(11) NOT NULL default 0,
			ordre int(11) default NULL,
			search INT(1) unsigned NOT NULL DEFAULT 0,
			export INT(1) unsigned NOT NULL DEFAULT 0,
			exclusion_obligatoire INT(1) unsigned NOT NULL DEFAULT 0,
			pond int not null default 100,
			opac_sort INT NOT NULL DEFAULT 0,
			PRIMARY KEY  (idchamp)) ";
		echo traite_rqt($rqt,"create table categ_custom ");

		$rqt = "create table if not exists categ_custom_lists (
			categ_custom_champ int(10) unsigned NOT NULL default 0,
			categ_custom_list_value varchar(255) default NULL,
			categ_custom_list_lib varchar(255) default NULL,
			ordre int(11) default NULL,
			KEY editorial_custom_champ (categ_custom_champ),
			KEY editorial_champ_list_value (categ_custom_champ,categ_custom_list_value)) " ;
		echo traite_rqt($rqt,"create table if not exists categ_custom_lists ");

		$rqt = "create table if not exists categ_custom_values (
			categ_custom_champ int(10) unsigned NOT NULL default 0,
			categ_custom_origine int(10) unsigned NOT NULL default 0,
			categ_custom_small_text varchar(255) default NULL,
			categ_custom_text text,
			categ_custom_integer int(11) default NULL,
			categ_custom_date date default NULL,
			categ_custom_float float default NULL,
			KEY editorial_custom_champ (categ_custom_champ),
			KEY editorial_custom_origine (categ_custom_origine)) " ;
		echo traite_rqt($rqt,"create table if not exists categ_custom_values ");

		//NG - Champs perso publisher
		$rqt = "create table if not exists publisher_custom (
			idchamp int(10) unsigned NOT NULL auto_increment,
			num_type int unsigned not null default 0,
			name varchar(255) NOT NULL default '',
			titre varchar(255) default NULL,
			type varchar(10) NOT NULL default 'text',
			datatype varchar(10) NOT NULL default '',
			options text,
			multiple int(11) NOT NULL default 0,
			obligatoire int(11) NOT NULL default 0,
			ordre int(11) default NULL,
			search INT(1) unsigned NOT NULL DEFAULT 0,
			export INT(1) unsigned NOT NULL DEFAULT 0,
			exclusion_obligatoire INT(1) unsigned NOT NULL DEFAULT 0,
			pond int not null default 100,
			opac_sort INT NOT NULL DEFAULT 0,
			PRIMARY KEY  (idchamp)) ";
		echo traite_rqt($rqt,"create table publisher_custom ");

		$rqt = "create table if not exists publisher_custom_lists (
			publisher_custom_champ int(10) unsigned NOT NULL default 0,
			publisher_custom_list_value varchar(255) default NULL,
			publisher_custom_list_lib varchar(255) default NULL,
			ordre int(11) default NULL,
			KEY editorial_custom_champ (publisher_custom_champ),
			KEY editorial_champ_list_value (publisher_custom_champ,publisher_custom_list_value)) " ;
		echo traite_rqt($rqt,"create table if not exists publisher_custom_lists ");

		$rqt = "create table if not exists publisher_custom_values (
			publisher_custom_champ int(10) unsigned NOT NULL default 0,
			publisher_custom_origine int(10) unsigned NOT NULL default 0,
			publisher_custom_small_text varchar(255) default NULL,
			publisher_custom_text text,
			publisher_custom_integer int(11) default NULL,
			publisher_custom_date date default NULL,
			publisher_custom_float float default NULL,
			KEY editorial_custom_champ (publisher_custom_champ),
			KEY editorial_custom_origine (publisher_custom_origine)) " ;
		echo traite_rqt($rqt,"create table if not exists publisher_custom_values ");

		//NG - Champs perso collection
		$rqt = "create table if not exists collection_custom (
			idchamp int(10) unsigned NOT NULL auto_increment,
			num_type int unsigned not null default 0,
			name varchar(255) NOT NULL default '',
			titre varchar(255) default NULL,
			type varchar(10) NOT NULL default 'text',
			datatype varchar(10) NOT NULL default '',
			options text,
			multiple int(11) NOT NULL default 0,
			obligatoire int(11) NOT NULL default 0,
			ordre int(11) default NULL,
			search INT(1) unsigned NOT NULL DEFAULT 0,
			export INT(1) unsigned NOT NULL DEFAULT 0,
			exclusion_obligatoire INT(1) unsigned NOT NULL DEFAULT 0,
			pond int not null default 100,
			opac_sort INT NOT NULL DEFAULT 0,
			PRIMARY KEY  (idchamp)) ";
		echo traite_rqt($rqt,"create table collection_custom ");

		$rqt = "create table if not exists collection_custom_lists (
			collection_custom_champ int(10) unsigned NOT NULL default 0,
			collection_custom_list_value varchar(255) default NULL,
			collection_custom_list_lib varchar(255) default NULL,
			ordre int(11) default NULL,
			KEY editorial_custom_champ (collection_custom_champ),
			KEY editorial_champ_list_value (collection_custom_champ,collection_custom_list_value)) " ;
		echo traite_rqt($rqt,"create table if not exists collection_custom_lists ");

		$rqt = "create table if not exists collection_custom_values (
			collection_custom_champ int(10) unsigned NOT NULL default 0,
			collection_custom_origine int(10) unsigned NOT NULL default 0,
			collection_custom_small_text varchar(255) default NULL,
			collection_custom_text text,
			collection_custom_integer int(11) default NULL,
			collection_custom_date date default NULL,
			collection_custom_float float default NULL,
			KEY editorial_custom_champ (collection_custom_champ),
			KEY editorial_custom_origine (collection_custom_origine)) " ;
		echo traite_rqt($rqt,"create table if not exists collection_custom_values ");

		//NG - Champs perso subcollection
		$rqt = "create table if not exists subcollection_custom (
			idchamp int(10) unsigned NOT NULL auto_increment,
			num_type int unsigned not null default 0,
			name varchar(255) NOT NULL default '',
			titre varchar(255) default NULL,
			type varchar(10) NOT NULL default 'text',
			datatype varchar(10) NOT NULL default '',
			options text,
			multiple int(11) NOT NULL default 0,
			obligatoire int(11) NOT NULL default 0,
			ordre int(11) default NULL,
			search INT(1) unsigned NOT NULL DEFAULT 0,
			export INT(1) unsigned NOT NULL DEFAULT 0,
			exclusion_obligatoire INT(1) unsigned NOT NULL DEFAULT 0,
			pond int not null default 100,
			opac_sort INT NOT NULL DEFAULT 0,
			PRIMARY KEY  (idchamp)) ";
		echo traite_rqt($rqt,"create table subcollection_custom ");

		$rqt = "create table if not exists subcollection_custom_lists (
			subcollection_custom_champ int(10) unsigned NOT NULL default 0,
			subcollection_custom_list_value varchar(255) default NULL,
			subcollection_custom_list_lib varchar(255) default NULL,
			ordre int(11) default NULL,
			KEY editorial_custom_champ (subcollection_custom_champ),
			KEY editorial_champ_list_value (subcollection_custom_champ,subcollection_custom_list_value)) " ;
		echo traite_rqt($rqt,"create table if not exists subcollection_custom_lists ");

		$rqt = "create table if not exists subcollection_custom_values (
			subcollection_custom_champ int(10) unsigned NOT NULL default 0,
			subcollection_custom_origine int(10) unsigned NOT NULL default 0,
			subcollection_custom_small_text varchar(255) default NULL,
			subcollection_custom_text text,
			subcollection_custom_integer int(11) default NULL,
			subcollection_custom_date date default NULL,
			subcollection_custom_float float default NULL,
			KEY editorial_custom_champ (subcollection_custom_champ),
			KEY editorial_custom_origine (subcollection_custom_origine)) " ;
		echo traite_rqt($rqt,"create table if not exists subcollection_custom_values ");

		//NG - Champs perso serie
		$rqt = "create table if not exists serie_custom (
			idchamp int(10) unsigned NOT NULL auto_increment,
			num_type int unsigned not null default 0,
			name varchar(255) NOT NULL default '',
			titre varchar(255) default NULL,
			type varchar(10) NOT NULL default 'text',
			datatype varchar(10) NOT NULL default '',
			options text,
			multiple int(11) NOT NULL default 0,
			obligatoire int(11) NOT NULL default 0,
			ordre int(11) default NULL,
			search INT(1) unsigned NOT NULL DEFAULT 0,
			export INT(1) unsigned NOT NULL DEFAULT 0,
			exclusion_obligatoire INT(1) unsigned NOT NULL DEFAULT 0,
			pond int not null default 100,
			opac_sort INT NOT NULL DEFAULT 0,
			PRIMARY KEY  (idchamp)) ";
		echo traite_rqt($rqt,"create table serie_custom ");

		$rqt = "create table if not exists serie_custom_lists (
			serie_custom_champ int(10) unsigned NOT NULL default 0,
			serie_custom_list_value varchar(255) default NULL,
			serie_custom_list_lib varchar(255) default NULL,
			ordre int(11) default NULL,
			KEY editorial_custom_champ (serie_custom_champ),
			KEY editorial_champ_list_value (serie_custom_champ,serie_custom_list_value)) " ;
		echo traite_rqt($rqt,"create table if not exists serie_custom_lists ");

		$rqt = "create table if not exists serie_custom_values (
			serie_custom_champ int(10) unsigned NOT NULL default 0,
			serie_custom_origine int(10) unsigned NOT NULL default 0,
			serie_custom_small_text varchar(255) default NULL,
			serie_custom_text text,
			serie_custom_integer int(11) default NULL,
			serie_custom_date date default NULL,
			serie_custom_float float default NULL,
			KEY editorial_custom_champ (serie_custom_champ),
			KEY editorial_custom_origine (serie_custom_origine)) " ;
		echo traite_rqt($rqt,"create table if not exists serie_custom_values ");

		//NG - Champs perso tu
		$rqt = "create table if not exists tu_custom (
			idchamp int(10) unsigned NOT NULL auto_increment,
			num_type int unsigned not null default 0,
			name varchar(255) NOT NULL default '',
			titre varchar(255) default NULL,
			type varchar(10) NOT NULL default 'text',
			datatype varchar(10) NOT NULL default '',
			options text,
			multiple int(11) NOT NULL default 0,
			obligatoire int(11) NOT NULL default 0,
			ordre int(11) default NULL,
			search INT(1) unsigned NOT NULL DEFAULT 0,
			export INT(1) unsigned NOT NULL DEFAULT 0,
			exclusion_obligatoire INT(1) unsigned NOT NULL DEFAULT 0,
			pond int not null default 100,
			opac_sort INT NOT NULL DEFAULT 0,
			PRIMARY KEY  (idchamp)) ";
		echo traite_rqt($rqt,"create table tu_custom ");

		$rqt = "create table if not exists tu_custom_lists (
			tu_custom_champ int(10) unsigned NOT NULL default 0,
			tu_custom_list_value varchar(255) default NULL,
			tu_custom_list_lib varchar(255) default NULL,
			ordre int(11) default NULL,
			KEY editorial_custom_champ (tu_custom_champ),
			KEY editorial_champ_list_value (tu_custom_champ,tu_custom_list_value)) " ;
		echo traite_rqt($rqt,"create table if not exists tu_custom_lists ");

		$rqt = "create table if not exists tu_custom_values (
			tu_custom_champ int(10) unsigned NOT NULL default 0,
			tu_custom_origine int(10) unsigned NOT NULL default 0,
			tu_custom_small_text varchar(255) default NULL,
			tu_custom_text text,
			tu_custom_integer int(11) default NULL,
			tu_custom_date date default NULL,
			tu_custom_float float default NULL,
			KEY editorial_custom_champ (tu_custom_champ),
			KEY editorial_custom_origine (tu_custom_origine)) " ;
		echo traite_rqt($rqt,"create table if not exists tu_custom_values ");

		//NG - Champs perso indexint
		$rqt = "create table if not exists indexint_custom (
			idchamp int(10) unsigned NOT NULL auto_increment,
			num_type int unsigned not null default 0,
			name varchar(255) NOT NULL default '',
			titre varchar(255) default NULL,
			type varchar(10) NOT NULL default 'text',
			datatype varchar(10) NOT NULL default '',
			options text,
			multiple int(11) NOT NULL default 0,
			obligatoire int(11) NOT NULL default 0,
			ordre int(11) default NULL,
			search INT(1) unsigned NOT NULL DEFAULT 0,
			export INT(1) unsigned NOT NULL DEFAULT 0,
			exclusion_obligatoire INT(1) unsigned NOT NULL DEFAULT 0,
			pond int not null default 100,
			opac_sort INT NOT NULL DEFAULT 0,
			PRIMARY KEY  (idchamp)) ";
		echo traite_rqt($rqt,"create table indexint_custom ");

		$rqt = "create table if not exists indexint_custom_lists (
			indexint_custom_champ int(10) unsigned NOT NULL default 0,
			indexint_custom_list_value varchar(255) default NULL,
			indexint_custom_list_lib varchar(255) default NULL,
			ordre int(11) default NULL,
			KEY editorial_custom_champ (indexint_custom_champ),
			KEY editorial_champ_list_value (indexint_custom_champ,indexint_custom_list_value)) " ;
		echo traite_rqt($rqt,"create table if not exists indexint_custom_lists ");

		$rqt = "create table if not exists indexint_custom_values (
			indexint_custom_champ int(10) unsigned NOT NULL default 0,
			indexint_custom_origine int(10) unsigned NOT NULL default 0,
			indexint_custom_small_text varchar(255) default NULL,
			indexint_custom_text text,
			indexint_custom_integer int(11) default NULL,
			indexint_custom_date date default NULL,
			indexint_custom_float float default NULL,
			KEY editorial_custom_champ (indexint_custom_champ),
			KEY editorial_custom_origine (indexint_custom_origine)) " ;
		echo traite_rqt($rqt,"create table if not exists indexint_custom_values ");

		// +-------------------------------------------------+
		echo "</table>";
		$rqt = "update parametres set valeur_param='".$action."' where type_param='pmb' and sstype_param='bdd_version' " ;
		$res = pmb_mysql_query($rqt, $dbh) ;
		echo "<strong><font color='#FF0000'>".$msg[1807]." ".number_format($action, 2, ',', '.')."%</font></strong><br />";
		$action=$action+$increment;
		//echo form_relance ("v5.12");
		//break;

//case "v5.12":
		echo "<table ><tr><th>".$msg['admin_misc_action']."</th><th>".$msg['admin_misc_resultat']."</th></tr>";
		// +-------------------------------------------------+

		//DG - parametre pour forcer l'exécution des procédures
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='procs_force_execution' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
		VALUES (0, 'pmb', 'procs_force_execution', '0', 'Permettre le forçage de l\'exécution des procédures', '',0) ";
			echo traite_rqt($rqt, "insert pmb_procs_force_execution=0 into parametres");
			$rqt = "update users set rights=rights+131072 where rights<131072 and userid=1 ";
			echo traite_rqt($rqt, "update users add editions forcing rights where super user ");
		}

		//NG - ajout facette en dsi
		$rqt = "ALTER TABLE bannettes ADD group_type int unsigned NOT NULL default 0 AFTER notice_tpl";
		echo traite_rqt($rqt,"alter table bannettes add group_type");

		$rqt = "CREATE TABLE if not exists bannette_facettes (
			num_ban_facette int unsigned NOT NULL default 0,
			ban_facette_critere int(5) not null default 0,
			ban_facette_ss_critere int(5) not null default 0,
			ban_facette_order int(1) not null default 0,
			KEY bannette_facettes_key (num_ban_facette,ban_facette_critere,ban_facette_ss_critere)) " ;
		echo traite_rqt($rqt,"CREATE TABLE bannette_facettes");

		//DB - L'authentification Digest impose une valeur, ce qui n'est pas le cas avec une authentification externe
		$rqt= "alter table empr add empr_digest varchar(255) not null default '' after empr_password";
		echo traite_rqt($rqt,"alter table empr add empr_digest");

		//AB
		$rqt = "UPDATE users SET value_deflt_relation=CONCAT(value_deflt_relation,'-up') WHERE value_deflt_relation!='' AND value_deflt_relation NOT LIKE '%-%'";
		echo traite_rqt($rqt, 'UPDATE users SET value_deflt_relation=CONCAT(value_deflt_relation,"-up")');

		// +-------------------------------------------------+
		echo "</table>";
		$rqt = "update parametres set valeur_param='".$action."' where type_param='pmb' and sstype_param='bdd_version' " ;
		$res = pmb_mysql_query($rqt, $dbh) ;
		echo "<strong><font color='#FF0000'>".$msg[1807]." ".number_format($action, 2, ',', '.')."%</font></strong><br />";
		$action=$action+$increment;
		//echo form_relance ("v5.13");
		//break;

//case "v5.13":
		echo "<table ><tr><th>".$msg['admin_misc_action']."</th><th>".$msg['admin_misc_resultat']."</th></tr>";
		// +-------------------------------------------------+

		//AB parametre OPAC pour activer ou non le drag and drop si notice_depliable != 2
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='draggable' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
				VALUES (0, 'opac', 'draggable', '1', 'Permet d\'activer le glisser déposer dans le panier pour l\'affichage des notices à l\'OPAC', 'e_aff_notice',0) ";
			echo traite_rqt($rqt, "insert opac_draggable=1 into parametres");
		}

		//DG - Modification de la longueur du champ description de la table opac_liste_lecture
		$rqt = "ALTER TABLE opac_liste_lecture MODIFY description TEXT ";
		echo traite_rqt($rqt,"alter table opac_liste_lecture modify description");

		//DB - Ajout d'un champ timestamp dans la table acces_user_2
		@pmb_mysql_query("describe acces_usr_2",$dbh);
		if (!pmb_mysql_error($dbh)) {
			$rqt = "ALTER IGNORE TABLE acces_usr_2 ADD updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ";
			echo traite_rqt($rqt,"alter table acces_usr_2 add field updated");
		}

		// +-------------------------------------------------+
		echo "</table>";
		$rqt = "update parametres set valeur_param='".$action."' where type_param='pmb' and sstype_param='bdd_version' " ;
		$res = pmb_mysql_query($rqt, $dbh) ;
		echo "<strong><font color='#FF0000'>".$msg[1807]." ".number_format($action, 2, ',', '.')."%</font></strong><br />";
		$action=$action+$increment;
		//echo form_relance ("v5.14");
		//break;

//	case "v5.14": 
		
		echo "<table ><tr><th>".$msg['admin_misc_action']."</th><th>".$msg['admin_misc_resultat']."</th></tr>";
		// +-------------------------------------------------+
		// MB - Indexer la colonne num_renvoi_voir de la table noeuds
		$rqt = "ALTER TABLE noeuds DROP INDEX i_num_renvoi_voir";
		echo traite_rqt($rqt,"ALTER TABLE noeuds DROP INDEX i_num_renvoi_voir");
		$rqt = "ALTER TABLE noeuds ADD INDEX i_num_renvoi_voir (num_renvoi_voir)";
		echo traite_rqt($rqt,"ALTER TABLE noeuds ADD INDEX i_num_renvoi_voir (num_renvoi_voir)");

		$rqt="update parametres set comment_param='Liste des id de template de notice pour ajouter des onglets personnalisés en affichage de notice\nExemple: 1,3,ISBD,PUBLIC\nLe paramètre notices_format doit être à 0 pour placer ISBD et PUBLIC' where type_param='opac' and sstype_param='notices_format_onglets' ";
		echo traite_rqt($rqt,"update opac notices_format_onglets comments in parametres") ;

		$rqt = "update parametres set comment_param='0 : mode normal de recherche\n1 : Affiche directement le résultat de la recherche tous les champs sans passer par la présentation du niveau 1 de recherche \n2 : Affiche directement le résultat de la recherche tous les champs sans passer par la présentation du niveau 1 de recherche sans faire de recherche intermédaire'  where type_param='opac' and sstype_param='autolevel2' ";
		echo traite_rqt($rqt,"update opac_autolevel comments in parametres");


		//Création des tables pour le portfolio
		$rqt = "create table cms_collections (
			id_collection int unsigned not null auto_increment primary key,
			collection_title varchar(255) not null default '',
			collection_description text not null,
			collection_num_parent int not null default 0,
			collection_num_storage int not null default 0,
			index i_cms_collection_title(collection_title)
		)";
		echo traite_rqt($rqt,"create table cms_collections") ;
		$rqt = "create table cms_documents (
			id_document int unsigned not null auto_increment primary key,
			document_title varchar(255) not null default '',
			document_description text not null,
			document_filename varchar(255) not null default '',
			document_mimetype varchar(100) not null default '',
			document_filesize int not null default 0,
			document_vignette mediumblob not null default '',
			document_url text not null,
			document_path varchar(255) not null default '',
			document_create_date date not null default '0000-00-00',
			document_num_storage int not null default 0,
			document_type_object varchar(255) not null default '',
			document_num_object int not null default 0,
			index i_cms_document_title(document_title)
		)";
		echo traite_rqt($rqt,"create table cms_documents") ;
		$rqt = "create table storages (
			id_storage int unsigned not null auto_increment primary key,
			storage_name varchar(255) not null default '',
			storage_class varchar(255) not null default '',
			storage_params text not null,
			index i_storage_class(storage_class)
		)";
		echo traite_rqt($rqt,"create table storages") ;
		$rqt = "create table cms_documents_links (
			document_link_type_object varchar(255) not null default '',
			document_link_num_object int not null default 0,
			document_link_num_document int not null default 0,
			primary key(document_link_type_object,document_link_num_object,document_link_num_document)
		)";
		echo traite_rqt($rqt,"create table cms_documents_links") ;

		// FT - Ajout des paramètres pour forcer les tags meta pour les moteurs de recherche
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='meta_description' "))==0){
			$rqt="insert into parametres(type_param,sstype_param,valeur_param,comment_param,section_param,gestion) values('opac','meta_description','','Contenu du meta tag description pour les moteurs de recherche','b_aff_general',0)";
			echo traite_rqt($rqt,"INSERT INTO parametres opac_meta_description");
		}
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='meta_keywords' "))==0){
			$rqt="insert into parametres(type_param,sstype_param,valeur_param,comment_param,section_param,gestion) values('opac','meta_keywords','','Contenu du meta tag keywords pour les moteurs de recherche','b_aff_general',0)";
			echo traite_rqt($rqt,"INSERT INTO parametres opac_meta_keywords");
		}
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='meta_author' "))==0){
			$rqt="insert into parametres(type_param,sstype_param,valeur_param,comment_param,section_param,gestion) values('opac','meta_author','','Contenu du meta tag author pour les moteurs de recherche','b_aff_general',0)";
			echo traite_rqt($rqt,"INSERT INTO parametres opac_meta_author");
		}

		//DG - autoriser le code HTML dans les cotes exemplaires
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='html_allow_expl_cote' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'pmb', 'html_allow_expl_cote', '0', 'Autoriser le code HTML dans les cotes exemplaires ? \n 0 : non \n 1', '',0) ";
			echo traite_rqt($rqt, "insert pmb_html_allow_expl_cote=0 into parametres");
		}

		//maj valeurs possibles pour empr_sort_rows
		$rqt = "update parametres set comment_param='Colonnes qui seront disponibles pour le tri des emprunteurs. Les colonnes possibles sont : \n n: nom+prénom \n b: code-barres \n c: catégories \n g: groupes \n l: localisation \n s: statut \n cp: code postal \n v: ville \n y: année de naissance \n ab: type d\'abonnement \n #n : id des champs personnalisés' where type_param= 'empr' and sstype_param='sort_rows' ";
		echo traite_rqt($rqt,"update empr_sort_rows into parametres");

		//DB - création table index pour le magasin rdf
		$rqt = "create table rdfstore_index (
					num_triple int(10) unsigned not null default 0,
					subject_uri text not null ,
					predicat_uri text not null ,
					num_object int(10) unsigned not null default 0 primary key,
					object_val text not null ,
					object_index text not null ,
					object_lang char(5) not null default ''
		) default charset=utf8 ";
		echo traite_rqt($rqt,"create table rdfstore_index");

		// MB - Création d'une table de cache pour les cadres du portail pour accélérer l'affichage
		$rqt = "DROP TABLE IF EXISTS cms_cache_cadres";
		echo traite_rqt($rqt,"DROP TABLE IF EXISTS cms_cache_cadres");
		$rqt = "CREATE TABLE  cms_cache_cadres (
			cache_cadre_hash VARCHAR( 32 ) NOT NULL,
			cache_cadre_type_content VARCHAR(30) NOT NULL,
			cache_cadre_create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
			cache_cadre_content MEDIUMTEXT NOT NULL,
			PRIMARY KEY (  cache_cadre_hash, cache_cadre_type_content )
		);";
		echo traite_rqt($rqt,"CREATE TABLE  cms_cache_cadres");

		$rqt = "ALTER TABLE rdfstore_index ADD subject_type TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL AFTER  subject_uri";
		echo traite_rqt($rqt,"alter table rdfstore_index add subject_type");

		// Info de réindexation
		$rqt = " select 1 " ;
		echo traite_rqt($rqt,"<b><a href='".$base_path."/admin.php?categ=netbase' target=_blank>VOUS DEVEZ REINDEXER (APRES ETAPES DE MISE A JOUR) / YOU MUST REINDEX (STEPS AFTER UPDATE) : Admin > Outils > Nettoyage de base > Réindexer le magasin RDF</a></b> ") ;

		// AP - Ajout de l'ordre dans les rubriques et les articles
		$rqt = "ALTER TABLE cms_sections ADD section_order INT UNSIGNED default 0";
		echo traite_rqt($rqt,"alter table cms_sections add section_order");

		$rqt = "ALTER TABLE cms_articles ADD article_order INT UNSIGNED default 0";
		echo traite_rqt($rqt,"alter table cms_articles add article_order");

		//DG - CSS add on en gestion
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='default_style_addon' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'pmb', 'default_style_addon', '', 'Ajout de styles CSS aux feuilles déjà incluses ?\n Ne mettre que le code CSS, exemple:  body {background-color: #FF0000;}', '',0) ";
			echo traite_rqt($rqt, "insert pmb_default_style_addon into parametres");
		}

		// NG - circulation sans retour
		$rqt = "ALTER TABLE serialcirc ADD serialcirc_no_ret INT UNSIGNED not null default 0";
		echo traite_rqt($rqt,"alter table serialcirc add serialcirc_no_ret");

		// NG - personnalisation d'impression de la liste de circulation des périodiques
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='serialcirc_subst' "))==0){
			$rqt="insert into parametres(type_param,sstype_param,valeur_param,comment_param,section_param,gestion) values('pmb','serialcirc_subst','','Nom du fichier permettant de personnaliser l\'impression de la liste de circulation des périodiques','',0)";
			echo traite_rqt($rqt,"INSERT INTO parametres pmb_serialcirc_subst");
		}

		//MB - Augmenter la taille du libellé de groupe
		$rqt = "ALTER TABLE groupe CHANGE libelle_groupe libelle_groupe VARCHAR(255) NOT NULL";
		echo traite_rqt($rqt,"alter table groupe");

		//AR - Ajout d'un type de cache pour un cadre
		$rqt = "alter table cms_cadres add cadre_modcache varchar(255) not null default 'get_post_view'";
		echo traite_rqt($rqt,"alter table cms_cadres add cadre_modcache");

		//DG - Type de relation par défaut en création de périodique
		$rqt = "ALTER TABLE users ADD value_deflt_relation_serial VARCHAR( 20 ) NOT NULL DEFAULT '' AFTER value_deflt_relation";
		echo traite_rqt($rqt,"ALTER TABLE users ADD default value_deflt_relation_serial after value_deflt_relation");

		//DG - Type de relation par défaut en création de bulletin
		$rqt = "ALTER TABLE users ADD value_deflt_relation_bulletin VARCHAR( 20 ) NOT NULL DEFAULT '' AFTER value_deflt_relation_serial";
		echo traite_rqt($rqt,"ALTER TABLE users ADD default value_deflt_relation_bulletin after value_deflt_relation_serial");

		//DG - Type de relation par défaut en création d'article
		$rqt = "ALTER TABLE users ADD value_deflt_relation_analysis VARCHAR( 20 ) NOT NULL DEFAULT '' AFTER value_deflt_relation_bulletin";
		echo traite_rqt($rqt,"ALTER TABLE users ADD default value_deflt_relation_analysis after value_deflt_relation_bulletin");

		//DG - Mise à jour des valeurs en fonction du type de relation par défaut en création de notice, si la valeur est vide !
		if ($res = pmb_mysql_query("select userid, value_deflt_relation,value_deflt_relation_serial,value_deflt_relation_bulletin,value_deflt_relation_analysis from users")){
			while ( $row = pmb_mysql_fetch_object($res)) {
				if ($row->value_deflt_relation_serial == '') pmb_mysql_query("update users set value_deflt_relation_serial='".$row->value_deflt_relation."' where userid=".$row->userid);
				if ($row->value_deflt_relation_bulletin == '') pmb_mysql_query("update users set value_deflt_relation_bulletin='".$row->value_deflt_relation."' where userid=".$row->userid);
				if ($row->value_deflt_relation_analysis == '') pmb_mysql_query("update users set value_deflt_relation_analysis='".$row->value_deflt_relation."' where userid=".$row->userid);
			}
		}

		//DG - Activer le prêt court par défaut
		$rqt = "ALTER TABLE users ADD deflt_short_loan_activate INT(1) UNSIGNED DEFAULT 0 NOT NULL ";
		echo traite_rqt($rqt, "ALTER TABLE users ADD deflt_short_loan_activate");

		//DG - Alerter l'utilisateur par mail des nouvelles inscriptions en OPAC ?
		$rqt = "ALTER TABLE users ADD user_alert_subscribemail INT(1) UNSIGNED NOT NULL DEFAULT 0 after user_alert_demandesmail";
		echo traite_rqt($rqt,"ALTER TABLE users add user_alert_subscribemail default 0");

		//DB - Modification commentaire autolevel
		$rqt = "update parametres set comment_param='0 : mode normal de recherche.\n1 : Affiche le résultat de la recherche tous les champs après calcul du niveau 1 de recherche.\n2 : Affiche directement le résultat de la recherche tous les champs sans passer par le calcul du niveau 1 de recherche.' where type_param= 'opac' and sstype_param='autolevel2' ";
		echo traite_rqt($rqt,"update parameter comment for opac_autolevel2");

		//AR - Ajout du paramètres pour la durée de validité du cache des cadres du potail
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'cms' and sstype_param='cache_ttl' "))==0){
			$rqt = "insert into parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'cms', 'cache_ttl', '1800', 'durée de vie du cache des cadres du portail (en secondes)', '',0) ";
			echo traite_rqt($rqt, "insert cms_caches_ttl into parametres");
		}

		//DG - Périodicité : Jour du mois
		$rqt = "ALTER TABLE planificateur ADD perio_jour_mois VARCHAR( 128 ) DEFAULT '*' AFTER perio_minute";
		echo traite_rqt($rqt,"ALTER TABLE planificateur ADD perio_jour_mois DEFAULT * after perio_minute");

		//DG - Replanifier la tâche en cas d'échec
		$rqt = "alter table taches_type add restart_on_failure int(1) UNSIGNED DEFAULT 0 NOT NULL";
		echo traite_rqt($rqt,"alter table taches_type add restart_on_failure");

		//DG - Alerte mail en cas d'échec de la tâche
		$rqt = "alter table taches_type add alert_mail_on_failure VARCHAR(255) DEFAULT ''";
		echo traite_rqt($rqt,"alter table taches_type add alert_mail_on_failure");

		//DG - Préremplissage de la vignette des dépouillements
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='serial_thumbnail_url_article' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'pmb', 'serial_thumbnail_url_article', '0', 'Préremplissage de l\'url de la vignette des dépouillements avec l\'url de la vignette de la notice mère en catalogage des périodiques ? \n 0 : Non \n 1 : Oui', '',0) ";
			echo traite_rqt($rqt, "insert pmb_serial_thumbnail_url_article=0 into parametres");
		}

		//DG - Délai en millisecondes entre les mails envoyés lors d'un envoi groupé
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='mail_delay' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES(0,'pmb','mail_delay','0','Temps d\'attente en millisecondes entre chaque mail envoyé lors d\'un envoi groupé. \n 0 : Pas d\'attente', '',0)" ;
			echo traite_rqt($rqt,"insert pmb_mail_delay=0 into parametres") ;
		}

		//DG - Timeout cURL sur la vérifications des liens
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='curl_timeout' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES(0,'pmb','curl_timeout','5','Timeout cURL (en secondes) pour la vérification des liens', '',1)" ;
			echo traite_rqt($rqt,"insert pmb_curl_timeout=0 into parametres") ;
		}

		//DG - Autoriser la prolongation groupée pour tous les membres
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'empr' and sstype_param='allow_prolong_members_group' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'empr', 'allow_prolong_members_group', '0', 'Autoriser la prolongation groupée des adhésions des membres d\'un groupe ? \n 0 : Non \n 1 : Oui', '',0) ";
			echo traite_rqt($rqt, "insert empr_allow_prolong_members_group=0 into parametres");
		}


		//DB - ajout d'un index stem+lang sur la table words
		$rqt = "alter table words add index i_stem_lang(stem, lang)";
		echo traite_rqt($rqt, "alter table words add index i_stem_lang");

		//NG - Autoindex
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'thesaurus' and sstype_param='auto_index_notice_fields' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'thesaurus', 'auto_index_notice_fields', '', 'Liste des champs de notice à utiliser pour l\'indexation automatique, séparés par une virgule.\nLes noms des champs sont les identifiants des champs listés dans le fichier XML pmb/notice/notice.xml\nExemple: tit1,n_resume', 'categories',0) ";
			echo traite_rqt($rqt, "insert thesaurus_auto_index_notice_fields='' into parametres");
		}

		//NG - Autoindex: surchage du parametrage de la recherche
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'thesaurus' and sstype_param='auto_index_search_param' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'thesaurus', 'auto_index_search_param', '', 'Surchage des paramètres de recherche de l\'indexation automatique.\n\nSyntaxe: param=valeur;\n\nListe des paramètres:\nautoindex_max_up_distance,\nautoindex_max_down_distance,\nautoindex_stem_ratio,\nautoindex_see_also_ratio,\nautoindex_max_down_ratio,\nautoindex_max_up_ratio,\nautoindex_deep_ratio,\nautoindex_distance_ratio,\nmax_relevant_words,\nmax_relevant_terms', 'categories',0) ";
			echo traite_rqt($rqt, "insert thesaurus_auto_index_search_param='' into parametres");
		}

		//DG - Choix par défaut pour la prolongation des lecteurs
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'empr' and sstype_param='abonnement_default_debit' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param) VALUES (0, 'empr', 'abonnement_default_debit', '0', 'Choix par défaut pour la prolongation des lecteurs. \n 0 : Ne pas débiter l\'abonnement \n 1 : Débiter l\'abonnement sans la caution \n 2 : Débiter l\'abonnement et la caution') " ;
			echo traite_rqt($rqt,"insert empr_abonnement_default_debit = 0 into parametres");
		}

		//NG - Ajout indexation_lang dans la table notices
		$rqt = "ALTER TABLE notices ADD indexation_lang VARCHAR( 20 ) NOT NULL DEFAULT '' ";
		echo traite_rqt($rqt,"ALTER TABLE notices ADD indexation_lang VARCHAR( 20 ) NOT NULL DEFAULT '' ");

		$rqt = "alter table users add xmlta_indexation_lang varchar(10) NOT NULL DEFAULT '' after deflt_integration_notice_statut";
		echo traite_rqt($rqt,"alter table users add xmlta_indexation_lang");

		//NG - Ajout ico_notice
		$rqt = "ALTER TABLE connectors_sources ADD ico_notice VARCHAR( 255 ) NOT NULL DEFAULT '' ";
		echo traite_rqt($rqt,"ALTER TABLE connectors_sources ADD ico_notice VARCHAR( 255 ) NOT NULL DEFAULT '' ");

		//NG - liste des sources externes d'enrichissements à intégrer dans le a2z
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='perio_a2z_enrichissements' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'opac', 'perio_a2z_enrichissements', '0', 'Affichage de sources externes d\'enrichissement dans le navigateur de périodiques.\nListe des couples (séparé par une virgule) Id de connecteur, Id de source externe d\'enrichissement, séparé par un point virgule\nExemple:\n6,4;6,5', 'c_recherche',0) ";
			echo traite_rqt($rqt, "insert opac_perio_a2z_enrichissements=0 into parametres");
		}

		//DG - Modification taille du champ empr_msg de la table empr
		$rqt = "ALTER TABLE empr MODIFY empr_msg TEXT null " ;
		echo traite_rqt($rqt,"alter table empr modify empr_msg");

		//DG - Identifiant du template de notice par défaut en impression de panier
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='print_template_default' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'opac', 'print_template_default', '0', 'En impression de panier, identifiant du template de notice utilisé par défaut. Si vide ou à 0, le template classique est utilisé', 'a_general', 0)";
			echo traite_rqt($rqt,"insert opac_print_template_default='0' into parametres");
		}

		//DG - Paramètre pour afficher le permalink de la notice dans le detail de la notice
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='show_permalink' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'pmb', 'show_permalink', '0', 'Afficher le lien permanent de l\'OPAC en gestion ? \n 0 : Non.\n 1 : Oui.', '',0) ";
			echo traite_rqt($rqt, "insert pmb_show_permalink=0 into parameters");
		}

		//AB - Ajout du champ pour choix d'un template d'export pour les flux RSS
		$rqt = "ALTER TABLE rss_flux ADD tpl_rss_flux INT(11) UNSIGNED NOT NULL DEFAULT 0";
		echo traite_rqt($rqt,"ALTER TABLE rss_flux ADD tpl_rss_flux INT(11) UNSIGNED NOT NULL DEFAULT 0 ");

		//DG - Parametre pour afficher ou non l'emprunteur précédent dans la fiche exemplaire
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='expl_show_lastempr' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'pmb', 'expl_show_lastempr', '1', 'Afficher l\'emprunteur précédent sur la fiche exemplaire ? \n 0 : Non.\n 1 : Oui.', '',0) ";
			echo traite_rqt($rqt, "insert pmb_expl_show_lastempr=1 into parameters");
		}

		// NG - Gestion de caisses
		$rqt = "CREATE TABLE cashdesk (
			cashdesk_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
			cashdesk_name VARCHAR(255) NOT NULL DEFAULT '',
			cashdesk_autorisations VARCHAR(255) NOT NULL DEFAULT '',
			cashdesk_transactypes VARCHAR(255) NOT NULL DEFAULT '',
			cashdesk_cashbox INT UNSIGNED NOT NULL default 0
			)";
		echo traite_rqt($rqt,"CREATE TABLE cashdesk");

		$rqt = "CREATE TABLE cashdesk_locations (
			cashdesk_loc_cashdesk_num  INT UNSIGNED NOT NULL default 0,
			cashdesk_loc_num  INT UNSIGNED NOT NULL default 0,
			PRIMARY KEY(cashdesk_loc_cashdesk_num,cashdesk_loc_num)
			)";
		echo traite_rqt($rqt,"CREATE TABLE cashdesk_locations");

		$rqt = "CREATE TABLE cashdesk_sections (
			cashdesk_section_cashdesk_num  INT UNSIGNED NOT NULL default 0,
			cashdesk_section_num  INT UNSIGNED NOT NULL default 0,
			PRIMARY KEY(cashdesk_section_cashdesk_num,cashdesk_section_num)
			)";
		echo traite_rqt($rqt,"CREATE TABLE cashdesk_sections");

		// NG - Gestion de type de transactions
		$rqt = "CREATE TABLE  transactype (
			transactype_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
			transactype_name VARCHAR(255) NOT NULL DEFAULT '',
			transactype_quick_allowed INT UNSIGNED NOT NULL default 0,
			transactype_unit_price FLOAT NOT NULL default 0
			)";
		echo traite_rqt($rqt,"CREATE TABLE transactype");

		// NG - Mémorisation du payement des transactions
		$rqt = "CREATE TABLE transacash (
			transacash_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
			transacash_empr_num INT UNSIGNED NOT NULL default 0,
			transacash_desk_num INT UNSIGNED NOT NULL default 0,
			transacash_user_num INT UNSIGNED NOT NULL default 0,
			transacash_date datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
			transacash_sold FLOAT NOT NULL default 0,
			transacash_collected FLOAT NOT NULL default 0,
			transacash_rendering FLOAT NOT NULL default 0
			)";
		echo traite_rqt($rqt,"CREATE TABLE transacash");

		// NG - Activer la gestion de caisses en gestion financière
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='gestion_financiere_caisses' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'pmb', 'gestion_financiere_caisses', '0', 'Activer la gestion de caisses en gestion financière? \n 0 : Non.\n 1 : Oui.', '',0) ";
			echo traite_rqt($rqt, "insert pmb_gestion_financiere_caisses=0 into parameters");
		}

		$rqt = "ALTER TABLE transactions ADD transactype_num INT UNSIGNED NOT NULL DEFAULT 0";
		echo traite_rqt($rqt,"ALTER TABLE transactions ADD transactype_num INT UNSIGNED NOT NULL DEFAULT 0 ");

		$rqt = "ALTER TABLE transactions ADD cashdesk_num INT UNSIGNED NOT NULL DEFAULT 0";
		echo traite_rqt($rqt,"ALTER TABLE transactions ADD cashdesk_num INT UNSIGNED NOT NULL DEFAULT 0 ");

		$rqt = "ALTER TABLE transactions ADD transacash_num INT UNSIGNED NOT NULL DEFAULT 0";
		echo traite_rqt($rqt,"ALTER TABLE transactions ADD transacash_num INT UNSIGNED NOT NULL DEFAULT 0 ");

		$rqt = "alter table users add deflt_cashdesk int NOT NULL DEFAULT 0 ";
		echo traite_rqt($rqt,"alter table users add deflt_cashdesk");

		$rqt= "alter table sessions add notifications text";
		echo traite_rqt($rqt,"alter table sessions add notifications");

		// AP - Ajout du paramètre de segmentation des documents numériques
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='diarization_docnum' "))==0){
			$rqt="insert into parametres(type_param,sstype_param,valeur_param,comment_param,section_param,gestion) values('pmb','diarization_docnum',0,'Activer la segmentation des documents numériques vidéo ou audio 0 : non activée 1 : activée','',0)";
			echo traite_rqt($rqt,"INSERT INTO parametres diarization_docnum");
		}

		// AP - Ajout de la table explnum_speakers
		$rqt = "CREATE TABLE explnum_speakers (
			explnum_speaker_id int unsigned not null auto_increment primary key,
			explnum_speaker_explnum_num int unsigned not null default 0,
			explnum_speaker_speaker_num varchar(10) not null default '',
			explnum_speaker_gender varchar(1) default '',
			explnum_speaker_author int unsigned not null default 0
			)";
		echo traite_rqt($rqt,"CREATE TABLE explnum_speakers");
		$rqt = "alter table explnum_speakers drop index i_ensk_explnum_num";
		echo traite_rqt($rqt,"alter table explnum_speakers drop index i_ensk_explnum_num");
		$rqt = "alter table explnum_speakers add index i_ensk_explnum_num(explnum_speaker_explnum_num)";
		echo traite_rqt($rqt,"alter table explnum_speakers add index i_ensk_explnum_num");
		$rqt = "alter table explnum_speakers drop index i_ensk_author";
		echo traite_rqt($rqt,"alter table explnum_speakers drop index i_ensk_author");
		$rqt = "alter table explnum_speakers add index i_ensk_author(explnum_speaker_author)";
		echo traite_rqt($rqt,"alter table explnum_speakers add index i_ensk_author");


		// AP - Ajout de la table explnum_segments
		$rqt = "CREATE TABLE  explnum_segments (
			explnum_segment_id int unsigned not null auto_increment primary key,
			explnum_segment_explnum_num int unsigned not null default 0,
			explnum_segment_speaker_num int unsigned not null default 0,
			explnum_segment_start double not null default 0,
			explnum_segment_duration double not null default 0,
			explnum_segment_end double not null default 0
			)";
		echo traite_rqt($rqt,"CREATE TABLE explnum_segments");
		$rqt = "alter table explnum_segments drop index i_ensg_explnum_num";
		echo traite_rqt($rqt,"alter table explnum_segments drop index i_ensg_explnum_num");
		$rqt = "alter table explnum_segments add index i_ensg_explnum_num(explnum_segment_explnum_num)";
		echo traite_rqt($rqt,"alter table explnum_segments add index i_ensg_explnum_num");
		$rqt = "alter table explnum_segments drop index i_ensg_speaker";
		echo traite_rqt($rqt,"alter table explnum_segments drop index i_ensg_speaker");
		$rqt = "alter table explnum_segments add index i_ensg_speaker(explnum_segment_speaker_num)";
		echo traite_rqt($rqt,"alter table explnum_segments add index i_ensg_speaker");

		//DG - Modification de l'emplacement du paramètre bannette_notices_template dans la zone DSI
		$rqt = "update parametres set type_param='dsi',section_param='' where type_param='opac' and sstype_param='bannette_notices_template' ";
		echo traite_rqt($rqt,"update parametres set bannette_notices_template");

		//DG - Retour à la précédente forme de tri
		$rqt = "update parametres set comment_param='Tri par défaut des recherches OPAC.\nDe la forme, c_num_6 (c pour croissant, d pour décroissant, puis num ou text pour numérique ou texte et enfin l\'identifiant du champ (voir fichier xml sort.xml))' WHERE type_param='opac' AND sstype_param='default_sort'";
		echo traite_rqt($rqt,"update comment for param opac_default_sort");

		//DG - Mode d'application d'un tri - Liste de tris pré-enregistrés
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='default_sort_list' "))==0){
	 		$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'opac', 'default_sort_list', '0 d_num_6,c_text_28;d_text_7', 'Afficher la liste déroulante de sélection d\'un tri ? \n 0 : Non \n 1 : Oui \nFaire suivre d\'un espace pour l\'ajout de plusieurs tris sous la forme : c_num_6|Libelle;d_text_7|Libelle 2;c_num_5|Libelle 3\n\nc pour croissant, d pour décroissant\nnum ou text pour numérique ou texte\nidentifiant du champ (voir fichier xml sort.xml)\nlibellé du tri (optionnel)','d_aff_recherche',0) " ;
	 		echo traite_rqt($rqt,"insert opac_default_sort_list = 0 d_num_6,c_text_28;d_text_7 into parametres");
	 	}

	 	//DG - Afficher le libellé du tri appliqué par défaut en résultat de recherche
	 	if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='default_sort_display' "))==0){
	 		$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'opac', 'default_sort_display', '0', 'Afficher le libellé du tri appliqué par défaut en résultat de recherche ? \n 0 : Non \n 1 : Oui','d_aff_recherche',0) " ;
	 		echo traite_rqt($rqt,"insert opac_default_sort_display = 0 into parametres");
	 	}

		// NG - Affichage des bannettes privées en page d'accueil de l'Opac
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='show_bannettes' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES(0,'opac','show_bannettes','0','Affichage des bannettes en page d\'accueil OPAC.\n 0 : Non.\n 1 : Oui.','f_modules',0)" ;
			echo traite_rqt($rqt,"insert opac_show_bannettes into parametres") ;
		}

		// AB - Affichage des facettes en AJAX
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='facettes_ajax' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES(0,'opac','facettes_ajax','1','Charger les facettes en ajax\n0 : non\n1 : oui','c_recherche',0)" ;
			echo traite_rqt($rqt,"insert opac_facettes_ajax into parametres") ;
		}

		// DB - Modification index sur table notices_mots_global_index
		set_time_limit(0);
		pmb_mysql_query("set wait_timeout=28800", $dbh);
		if (pmb_mysql_result(pmb_mysql_query("select count(*) from notices"),0,0) > 15000){
			$rqt = "truncate table notices_fields_global_index";
			echo traite_rqt($rqt,"truncate table notices_fields_global_index");

			$rqt = "truncate table notices_mots_global_index";
			echo traite_rqt($rqt,"truncate table notices_mots_global_index");

			// Info de réindexation
			$rqt = " select 1 " ;
			echo traite_rqt($rqt,"<b><a href='".$base_path."/admin.php?categ=netbase' target=_blank>VOUS DEVEZ REINDEXER (APRES ETAPES DE MISE A JOUR) / YOU MUST REINDEX (STEPS AFTER UPDATE) : Admin > Outils > Nettoyage de base</a></b> ") ;
		}
		$rqt = 'alter table notices_mots_global_index drop primary key';
		echo traite_rqt($rqt, 'alter table notices_mots_global_index drop primary key');
		$rqt = 'alter table notices_mots_global_index add primary key (id_notice, code_champ, num_word, position, code_ss_champ)';
		echo traite_rqt($rqt, 'alter table notices_mots_global_index add primary key');

		//AB
		$rqt = "ALTER TABLE cms_build drop INDEX cms_build_index";
		echo traite_rqt($rqt,"alter cms_build drop index cms_build_index ");
		$rqt = "ALTER TABLE cms_build ADD INDEX cms_build_index (build_version_num , build_obj)";
		echo traite_rqt($rqt,"alter cms_build add index cms_build_index ON build_version_num , build_obj");

		// AR - Paramètres pour ne pas prendre en compte les mots vides en tous les champs à l'OPAC
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='search_all_keep_empty_words' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES(0,'opac','search_all_keep_empty_words','1','Conserver les mots vides pour les autorités dans la recherche tous les champs\n0 : non\n1 : oui','c_recherche',0)" ;
			echo traite_rqt($rqt,"insert opac_search_all_keep_empty_words into parametres") ;
		}

		// NG - Paramètre pour activer le piège en prêt si l'emprunteur a déjà emprunté l'exemplaire
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='pret_already_loaned' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES(0,'pmb','pret_already_loaned','0','Activer le piège en prêt si le document a déjà été emprunté par le lecteur. Nécessite l\'activation de l\'archivage des prêts\n0 : non\n1 : oui','',0)" ;
			echo traite_rqt($rqt,"insert pmb_pret_already_loaned into parametres") ;
		}

		//DB - Ajout d'index
		set_time_limit(0);
		pmb_mysql_query("set wait_timeout=28800", $dbh);

		$rqt = "alter table abts_abts drop index i_date_fin";
		echo traite_rqt($rqt,"alter table abts_abts drop index i_date_fin");
		$rqt = "alter table abts_abts add index i_date_fin (date_fin)";
		echo traite_rqt($rqt,"alter table abts_abts add index i_date_fin");

		$rqt = "alter table cms_editorial_types drop index i_editorial_type_element";
		echo traite_rqt($rqt,"alter table cms_editorial_types drop index i_editorial_type_element");
		$rqt = "alter table cms_editorial_types add index i_editorial_type_element (editorial_type_element)";
		echo traite_rqt($rqt,"alter table cms_editorial_types add index i_editorial_type_element");

		$rqt = "alter table cms_editorial_custom drop index i_num_type";
		echo traite_rqt($rqt,"alter table cms_editorial_custom drop index i_num_type");
		$rqt = "alter table cms_editorial_custom add index i_num_type (num_type)";
		echo traite_rqt($rqt,"alter table cms_editorial_custom add index i_num_type");

		$rqt = "alter table cms_build drop index i_build_parent_build_version_num";
		echo traite_rqt($rqt,"alter table cms_build drop index i_build_parent_build_version_num");
		$rqt = "alter table cms_build add index i_build_parent_build_version_num (build_parent,build_version_num)";
		echo traite_rqt($rqt,"alter table cms_build add index i_build_parent_build_version_num");

		$rqt = "alter table cms_build drop index i_build_type_build_version_num";
		echo traite_rqt($rqt,"alter table cms_build drop index i_build_type_build_version_num");
		$rqt = "alter table cms_build add index i_build_parent_build_version_num (build_type,build_version_num)";
		echo traite_rqt($rqt,"alter table cms_build add index i_build_type_build_version_num");

		$rqt = "alter table cms_build drop index i_build_obj_build_version_num";
		echo traite_rqt($rqt,"alter table cms_build drop index i_build_obj_build_version_num");
		$rqt = "alter table cms_build add index i_build_obj_build_version_num (build_obj,build_version_num)";
		echo traite_rqt($rqt,"alter table cms_build add index i_build_obj_build_version_num");

		$rqt = "alter table notices_fields_global_index drop index i_code_champ_code_ss_champ";
		echo traite_rqt($rqt,"alter table notices_fields_global_index drop index i_code_champ_code_ss_champ");
		$rqt = "alter table notices_fields_global_index add index i_code_champ_code_ss_champ (code_champ,code_ss_champ)";
		echo traite_rqt($rqt,"alter table notices_fields_global_index add index i_code_champ_code_ss_champ");

		$rqt = "alter table notices_mots_global_index drop index i_code_champ_code_ss_champ_num_word";
		echo traite_rqt($rqt,"alter table notices_mots_global_index drop index i_code_champ_code_ss_champ_num_word");
		$rqt = "alter table notices_mots_global_index add index i_code_champ_code_ss_champ_num_word (code_champ,code_ss_champ,num_word)";
		echo traite_rqt($rqt,"alter table notices_mots_global_index add index i_code_champ_code_ss_champ_num_word");

		// Activation des recherches exemplaires voisins
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='allow_voisin_search' "))==0){
			$rqt="INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (NULL, 'opac', 'allow_voisin_search', '0', 'Activer la recherche des exemplaires dont la cote est proche:\n 0 : non \n 1 : oui', 'c_recherche', '0')";
			echo traite_rqt($rqt,"insert opac_allow_voisin_search='0' into parametres ");
		}

		// MHo - Paramètre pour indiquer le nombre de notices similaires à afficher à l'opac
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='nb_notices_similaires' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
			VALUES (0, 'opac', 'nb_notices_similaires', '6', 'Nombre de notices similaires affichées lors du dépliage d\'une notice.\nValeur max = 6.','e_aff_notice',0)";
			echo traite_rqt($rqt,"insert opac_nb_notices_similaires='6' into parametres");
		}
		// MHo - Paramètre pour rendre indépendant l'affichage réduit des notices similaires par rapport aux notices pliées
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='notice_reduit_format_similaire' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
			VALUES (0, 'opac', 'notice_reduit_format_similaire', '1', 'Format d\'affichage des réduits de notices similaires :\n 0 = titre+auteur principal\n 1 = titre+auteur principal+date édition\n 2 = titre+auteur principal+date édition + ISBN\n 3 = titre seul\n P 1,2,3 = tit+aut+champs persos id 1 2 3\n E 1,2,3 = tit+aut+édit+champs persos id 1 2 3\n T = tit1+tit4\n 4 = titre+titre parallèle+auteur principal\n H 1 = id d\'un template de notice','e_aff_notice',0)";
			echo traite_rqt($rqt,"insert opac_notice_reduit_format_similaire='0' into parametres");
		}

		//AR - Paramètres d'écretage des résultats de recherche
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='search_noise_limit_type' "))==0){
			$rqt="INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (NULL, 'opac', 'search_noise_limit_type', '0', 'Ecrêter les résulats de recherche en fonction de la pertinence. \n0 : Non \n1 : Retirer du résultat tout ce qui est en dessous de la moyenne - l\'écart-type\n2,ratio : Retirer du résultat tout ce qui est en dessous de la moyenne - un ratio de l\'écart-type (ex: 2,1.96)\n3,ratio : Retirer du résultat tout ce qui est dessous d\'un ratio de la pertinence max (ex: 3,0.25 élimine tout ce qui est inférieur à 25% de la plus forte pertinence)' , 'c_recherche', '0')";
			echo traite_rqt($rqt,"insert opac_search_noise_limit_type='0' into parametres ");
		}

		//AR - Prise en compte de la fréquence d'apparition d'un mot dans le fonds pour le calcul de pertinence
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='search_relevant_with_frequency' "))==0){
			$rqt="INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (NULL, 'opac', 'search_relevant_with_frequency', '0', 'Utiliser la fréquence d\'apparition des mots dans les notices pour le calcul de la pertinence.\n0 : Non \n1 : Oui' , 'c_recherche', '0')";
			echo traite_rqt($rqt,"insert opac_search_relevant_with_frequency='0' into parametres ");
		}

		//DG - Calcul de la prolongation d'adhésion à partir de la date de fin d'adhésion ou la date du jour
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'empr' and sstype_param='prolong_calc_date_adhes_depassee' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'empr', 'prolong_calc_date_adhes_depassee', '0', 'Si la date d\'adhésion est dépassée, le calcul de la prolongation se fait à partir de :\n 0 : la date de fin d\'adhésion\n 1 : la date du jour','',0) " ;
			echo traite_rqt($rqt,"insert empr_prolong_calc_date_adhes_depassee = 0 into parametres");
		}

		//DG - Modification du commentaire du paramètre pmb_notice_reduit_format pour les améliorations
		$rqt = "update parametres set comment_param = 'Format d\'affichage des réduits de notices :\n 0 = titre+auteur principal\n 1 = titre+auteur principal+date édition\n 2 = titre+auteur principal+date édition + ISBN\n 3 = titre seul\n P 1,2,3 = tit+aut+champs persos id 1 2 3\n E 1,2,3 = tit+aut+édit+champs persos id 1 2 3\n T = tit1+tit4\n 4 = titre+titre parallèle+auteur principal\n H 1 = id d\'un template de notice' where type_param='pmb' and sstype_param='notice_reduit_format'";
		echo traite_rqt($rqt,"update parametre pmb_notice_reduit_format");

		//DG - Périodicité d'envoi par défaut en création de bannette privée (en jours)
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='bannette_priv_periodicite' "))==0){
			$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'opac', 'bannette_priv_periodicite', '15', 'Périodicité d\'envoi par défaut en création de bannette privée (en jours)','l_dsi',0) " ;
			echo traite_rqt($rqt,"insert opac_bannette_priv_periodicite = 15 into parametres");
		}

		//DG - Modification du commentaire opac_notices_format
		$rqt = "update parametres set comment_param='Format d\'affichage des notices en résultat de recherche \n 0 : Utiliser le paramètre notices_format_onglets \n 1 : ISBD seul \n 2 : Public seul \n 4 : ISBD et Public \n 5 : ISBD et Public avec ISBD en premier \n 8 : Réduit (titre+auteurs) seul' where type_param='opac' and sstype_param='notices_format'" ;
		echo traite_rqt($rqt,"UPDATE parametres SET comment_param for opac_notices_format") ;


		//DB - Modifications et ajout de commentaires pour les paramètres décrivant l'autoindexation
		$rqt = "UPDATE parametres SET valeur_param=replace(valeur_param,',',';'), comment_param = 'Liste des champs de notice à utiliser pour l\'indexation automatique.\n\n";
		$rqt.= "Syntaxe: nom_champ=poids_indexation;\n\n";
		$rqt.= "Les noms des champs sont ceux précisés dans le fichier XML \"pmb/includes/notice/notice.xml\"\n";
		$rqt.= "Le poids de l\'indexation est une valeur de 0.00 à 1. (Si rien n\'est précisé, le poids est de 1)\n\n";
		$rqt.= "Exemple :\n\n";
		$rqt.= "tit1=1.00;n_resume=0.5;' ";
		$rqt.= "WHERE type_param = 'thesaurus' and sstype_param='auto_index_notice_fields' ";
		echo traite_rqt($rqt,"UPDATE parametres SET comment_param for thesaurus_auto_index_notice_fields") ;

		$rqt = "UPDATE parametres SET comment_param = 'Surchage des paramètres de recherche de l\'indexation automatique.\n";
		$rqt.= "Syntaxe: param=valeur;\n\n";
		$rqt.= "Listes des parametres:\n\n";
		$rqt.= "max_relevant_words = 20 (nombre maximum de mots et de lemmes de la notice à prendre en compte pour le calcul)\n\n";
		$rqt.= "autoindex_deep_ratio = 0.05 (ratio sur la profondeur du terme dans le thésaurus)\n";
		$rqt.= "autoindex_stem_ratio = 0.80 (ratio de pondération des lemmes / aux mots)\n\n";
		$rqt.= "autoindex_max_up_distance = 2 (distance maximum de recherche dans les termes génériques du thésaurus)\n";
		$rqt.= "autoindex_max_up_ratio = 0.01 (pondération sur les termes génériques)\n\n";
		$rqt.= "autoindex_max_down_distance = 2 (distance maximum de recherche dans les termes spécifiques du thésaurus)\n";
		$rqt.= "autoindex_max_down_ratio = 0.01 (pondération sur les termes spécifiques)\n\n";
		$rqt.= "autoindex_see_also_ratio = 0.01 (surpondération sur les termes voir aussi du thésaurus)\n\n";
		$rqt.= "autoindex_distance_type = 1 (calcul de distance de 1 à 4)\n";
		$rqt.= "autoindex_distance_ratio = 0.50 (ratio de pondération sur la distance entre les mots trouvés et les termes d\'une expression du thésaurus)\n\n";
		$rqt.= "max_relevant_terms = 10 (nombre maximum de termes retournés)' ";
		$rqt.= "WHERE type_param = 'thesaurus' and sstype_param='auto_index_search_param' ";
		echo traite_rqt($rqt,"UPDATE parametres SET comment_param for thesaurus_auto_index_search_param") ;

		// MHo - Ajout des attributs de l'oeuvre dans la table des titres uniformes
		$rqt = "ALTER TABLE titres_uniformes ADD tu_num_author BIGINT(11) UNSIGNED NOT NULL DEFAULT 0 ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_num_author");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_forme VARCHAR(255) NOT NULL DEFAULT '' ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_forme");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_date VARCHAR(50) NOT NULL DEFAULT '' ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_date");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_date_date DATE NOT NULL DEFAULT '0000-00-00' ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_date_date");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_sujet VARCHAR(255) NOT NULL DEFAULT '' ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_sujet");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_lieu VARCHAR(255) NOT NULL DEFAULT '' ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_lieu");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_histoire TEXT NULL ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_histoire");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_caracteristique TEXT NULL ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_caracteristique");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_public VARCHAR(255) NOT NULL DEFAULT '' ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_public");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_contexte TEXT NULL ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_contexte");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_coordonnees VARCHAR(255) NOT NULL DEFAULT '' ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_coordonnees");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_equinoxe VARCHAR(255) NOT NULL DEFAULT '' ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_equinoxe");
		$rqt = "ALTER TABLE titres_uniformes ADD tu_completude INT(2) UNSIGNED NOT NULL DEFAULT 0 ";
		echo traite_rqt($rqt,"alter titres_uniformes add tu_completude");

		// AR - Retrait du paramètres juste commité : Activation des recherches exemplaires voisins
		$rqt="delete from parametres where type_param= 'opac' and sstype_param='allow_voisin_search'";
		echo traite_rqt($rqt,"delete from parametres opac_allow_voisin_search");

		// AR - Modification du paramètre opac_allow_simili
		$rqt="update parametres set comment_param = 'Activer les recherches similaires sur une notice :\n0 : Non\n1 : Activer la recherche \"Dans le même rayon\" et \"Peut-être aimerez-vous\"\n2 : Activer seulement la recherche \"Dans le même rayon\"\n3 : Activer seulement la recherche \"Peut-être aimerez-vous\"', section_param = 'e_aff_notice' where type_param='opac' and sstype_param='allow_simili_search'";
		echo traite_rqt($rqt,"update parametres set opac_allow_simili_search");

		// NG - Affichage des bannettes en page d'accueil de l'Opac	selon la banette
		$rqt = "ALTER TABLE bannettes ADD bannette_opac_accueil INT UNSIGNED NOT NULL default 0 ";
		echo traite_rqt($rqt,"alter table bannettes add bannette_opac_accueil");

		// AR - DSI abonné en page d'accueil
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='show_subscribed_bannettes' "))==0){
			$rqt = "insert into parametres ( type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES('opac','show_subscribed_bannettes',0,'Affichage des bannettes auxquelles le lecteur est abonné en page d\'accueil OPAC :\n0 : Non.\n1 : Oui.','f_modules',0)" ;
			echo traite_rqt($rqt,"insert opac_show_subscribed_bannettes=0 into parametres") ;
		}

		// AR - DSI publique sélectionné en page d'accueil
		if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='show_public_bannettes' "))==0){
			$rqt = "insert into parametres ( type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES('opac','show_public_bannettes',0,'Affichage des bannettes sélectionnées en page d\'accueil OPAC :\n0 : Non.\n1 : Oui.','f_modules',0)" ;
			echo traite_rqt($rqt,"insert show_public_bannettes=0 into parametres") ;
		}

		// AR - Retrait du paramètre perio_a2z_enrichissements, on ne l'a jamais utilisé car on a finalement ramené le paramétrage par un connecteur
		$rqt="delete from parametres where type_param= 'opac' and sstype_param='perio_a2z_enrichissements'";
		echo traite_rqt($rqt,"delete from parametres opac_perio_a2z_enrichissements");

		//DG - Paramètre non utilisé
		$rqt = "delete from parametres where sstype_param='confirm_resa' and type_param='opac' " ;
		$res = pmb_mysql_query($rqt, $dbh) ;

		//DG - Paramètre non utilisé
		$rqt = "delete from parametres where sstype_param='authors_aut_rec_per_page' and type_param='opac' " ;
		$res = pmb_mysql_query($rqt, $dbh) ;

		// +-------------------------------------------------+
		echo "</table>";
		$rqt = "update parametres set valeur_param='".$action."' where type_param='pmb' and sstype_param='bdd_version' " ;
		$res = pmb_mysql_query($rqt, $dbh) ;
		echo "<strong><font color='#FF0000'>".$msg[1807]." ".number_format($action, 2, ',', '.')."%</font></strong><br />";
		$action=$action+$increment;
		//echo form_relance ("v5.15");

	//break;
	//case "v.5.15":	
		echo "<table ><tr><th>".$msg['admin_misc_action']."</th><th>".$msg['admin_misc_resultat']."</th></tr>";
			// +-------------------------------------------------+
			// AB - Paramètre de modification du workflow d'une demande
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'demandes' and sstype_param='init_workflow' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
				VALUES('demandes','init_workflow',0,'Initialisation du workflow de la demande.\n 0 : Validation avant tout\n 1 : Validation avant tout et attribution au validateur\n 2 : Attribution avant tout','',0)";
				echo traite_rqt($rqt,"insert demandes_init_workflow=0 into parametres") ;
			}

			// MHo - Paramètre pour automatiser ou non la création de notice lors de l'enregistrement d'une demande
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'demandes' and sstype_param='notice_auto' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES (0, 'demandes', 'notice_auto', '0', 'Création automatique de la notice de demande :\n0 : Non\n1 : Oui','',0)";
				echo traite_rqt($rqt,"insert demandes_notice_auto='0' into parametres");
			}

			// MHo - Paramètre pour la création par défaut d'une action lors de la validation d'une demande
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'demandes' and sstype_param='default_action' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES (0, 'demandes', 'default_action', '1', 'Création par défaut d\'une action lors de la validation de la demande :\n0 : Non\n1 : Oui','',0)";
				echo traite_rqt($rqt,"insert demandes_default_action='1' into parametres");
			}

			// MHo - Ajout d'une colonne "origine" de l'utilisateur dans la table audit : 0 = gestion, 1 = opac
			$rqt = "ALTER TABLE audit ADD type_user INT(1) UNSIGNED NOT NULL DEFAULT 0 ";
			echo traite_rqt($rqt,"alter audit add type_user");

			// AR - Ajout d'une colonne pour stocker les actions autorisées par type de demande
			$rqt = "alter table demandes_type add allowed_actions text not null";
			echo traite_rqt($rqt,"alter table demandes_type add allowed_actions");

			//DG - Optimisation
			$rqt = "show fields from notices_fields_global_index";
			$res = pmb_mysql_query($rqt);
			$exists = false;
			if(pmb_mysql_num_rows($res)){
				while($row = pmb_mysql_fetch_object($res)){
					if($row->Field == "authority_num"){
						$exists = true;
						break;
					}
				}
			}
			if(!$exists){
				if (pmb_mysql_result(pmb_mysql_query("select count(*) from notices"),0,0) > 15000){
					$rqt = "truncate table notices_fields_global_index";
					echo traite_rqt($rqt,"truncate table notices_fields_global_index");

					// Info de réindexation
					$rqt = " select 1 " ;
					echo traite_rqt($rqt,"<b><a href='".$base_path."/admin.php?categ=netbase' target=_blank>VOUS DEVEZ REINDEXER (APRES ETAPES DE MISE A JOUR) / YOU MUST REINDEX (STEPS AFTER UPDATE) : Admin > Outils > Nettoyage de base</a></b> ") ;
				}

				// JP - Synchronisation RDF
				$rqt = "ALTER TABLE notices_fields_global_index ADD authority_num VARCHAR(50) NOT NULL DEFAULT '0'";
				echo traite_rqt($rqt,"alter table notices_fields_global_index add authority_num");
			}

			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='synchro_rdf' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
						VALUES (0, 'pmb', 'synchro_rdf', '0', 'Activer la synchronisation rdf\n 0 : non \n 1 : oui (l\'activation de ce paramètre nécessite une ré-indexation)','',0) " ;
				echo traite_rqt($rqt,"insert pmb_synchro_rdf = 0 into parametres");
			}

			// AB Modification de la valeur par défaut du parametre init_workflow
			$rqt="UPDATE parametres SET valeur_param='1' WHERE type_param='demandes' AND sstype_param='init_workflow'";
			echo traite_rqt($rqt,"update parametres set demandes_init_workflow=1");
			// AB Changement du type de champ pour date_note
			$rqt = "ALTER TABLE demandes_notes CHANGE date_note date_note DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00'";
			echo traite_rqt($rqt,"alter demandes_notes CHANGE date_note");
			// MHo - Ajout d'une colonne "notes_read_gestion" pour indiquer si une note a été lue en gestion ou pas : 0 = lue, 1 = non lue
			$rqt = "ALTER TABLE demandes_notes ADD notes_read_gestion INT(1) UNSIGNED NOT NULL DEFAULT 0 ";
			echo traite_rqt($rqt,"alter demandes_notes add note_read_gestion");
			// MHo - Ajout d'une colonne "actions_read_gestion" pour indiquer si une action a été lue en gestion ou pas : 0 = lue, 1 = non lue
			$rqt = "ALTER TABLE demandes_actions ADD actions_read_gestion INT(1) UNSIGNED NOT NULL DEFAULT 0 ";
			echo traite_rqt($rqt,"alter demandes_actions add actions_read_gestion");
			// MHo - Ajout d'une colonne "dmde_read_gestion" pour indiquer si une demande contient des éléments nouveaux (actions, notes) ou pas : 0 = lue, 1 = non lue
			$rqt = "ALTER TABLE demandes ADD dmde_read_gestion INT(1) UNSIGNED NOT NULL DEFAULT 0 ";
			echo traite_rqt($rqt,"alter demandes add dmde_read_gestion");

			// MHo - Ajout d'une colonne "reponse_finale" contenant la réponse finale qui sera intégrée à la faq
			$rqt = "ALTER TABLE demandes ADD reponse_finale TEXT NULL";
			echo traite_rqt($rqt,"alter demandes add reponse_finale");

			// DG - Le super user doit avoir accès à tous les établissements
			$rqt = "UPDATE entites SET autorisations=CONCAT(' 1', autorisations) WHERE type_entite='1' AND autorisations NOT LIKE '% 1 %'";
			echo traite_rqt($rqt, 'UPDATE entites SET autorisations=CONCAT(" 1",autorisations) for super user');

			// AR - Module FAQ - Paramètre d'activation
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'faq' and sstype_param='active' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'faq', 'active', '0', 'Module \'FAQ\' activé.\n 0 : Non.\n 1 : Oui.', '',0) ";
				echo traite_rqt($rqt, "insert faq_active=0 into parameters");
			}

			// AR - Création de la table des types pour la FAQ
			$rqt = " CREATE TABLE faq_types(
				id_type int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
				libelle_type varchar(255) NOT NULL default '',
	        	PRIMARY KEY  (id_type) )";
			echo traite_rqt($rqt,"CREATE TABLE faq_types") ;

			// AR - Création de la table des thèmes pour la FAQ
			$rqt = " CREATE TABLE faq_themes(
				id_theme int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
				libelle_theme varchar(255) NOT NULL default '',
	    	    PRIMARY KEY  (id_theme))";
			echo traite_rqt($rqt,"CREATE TABLE faq_themes") ;

			// AR - Création de la table pour la FAQ
			$rqt = "create table faq_questions(
				id_faq_question int(10) unsigned not null auto_increment primary key,
				faq_question_num_type int(10) unsigned not null default 0,
				faq_question_num_theme int(10) unsigned not null default 0,
				faq_question_num_demande int(10) unsigned not null default 0,
				faq_question_question text not null,
				faq_question_question_userdate varchar(255) not null default '',
				faq_question_question_date datetime not null default '0000-00-00 00:00:00',
				faq_question_answer text not null,
				faq_question_answer_userdate varchar(255) not null default '',
				faq_question_answer_date datetime not null default '0000-00-00 00:00:00')";
			echo traite_rqt($rqt,"create table faq_questions");

			// AR - Création de la table de descripteurs pour la FAQ
			$rqt = "create table faq_questions_categories(
				num_faq_question int(10) unsigned not null default 0,
				num_categ int(10) unsigned not null default 0,
				index i_faq_categ(num_faq_question,num_categ))";
			echo traite_rqt($rqt,"create table faq_categories");

			// AR - Ajout de l'ordre dans la table de descripteurs pour la FAQ
			$rqt = "alter table faq_questions_categories add categ_order int(10) unsigned not null default 0";
			echo traite_rqt($rqt,"alter table faq_questions_categories add categ_order");

			// AR - Ajout d'un statut pour les questions de la FAQ (statut de publication 0/1)
			$rqt = "alter table faq_questions add faq_question_statut int(10) unsigned not null default 0";
			echo traite_rqt($rqt,"alter table faq_questions add faq_question_statut");

			// AR indexons correctement la FAQ - Table de mots
			$rqt = "create table if not exists faq_questions_words_global_index(
				id_faq_question int unsigned not null default 0,
				code_champ int unsigned not null default 0,
				code_ss_champ int unsigned not null default 0,
				num_word int unsigned not null default 0,
				pond int unsigned not null default 100,
				position int unsigned not null default 1,
				field_position int unsigned not null default 1,
				primary key (id_faq_question,code_champ,num_word,position,code_ss_champ),
				index code_champ(code_champ),
				index i_id_mot(num_word,id_faq_question),
				index i_code_champ_code_ss_champ_num_word(code_champ,code_ss_champ,num_word))";
			echo traite_rqt($rqt,"create table faq_questions_words_global_index");

			// AR indexons correctement la FAQ - Table de champs
			$rqt = "create table if not exists faq_questions_fields_global_index(
				id_faq_question int unsigned not null default 0,
				code_champ int(3) unsigned not null default 0,
				code_ss_champ int(3) unsigned not null default 0,
				ordre int(4) unsigned not null default 0,
				value text not null,
				pond int(4) unsigned not null default 100,
				lang varchar(10) not null default '',
				authority_num varchar(50) not null default 0,
				primary key(id_faq_question,code_champ,code_ss_champ,lang,ordre),
				index i_value(value(300)),
				index i_code_champ_code_ss_champ(code_champ,code_ss_champ))";
			echo traite_rqt($rqt,"create table faq_questions_fields_global_index ");

			// MHo - Renommage de la colonne "action_read" en "action_read_opac" : 0 = lue, 1 = non lue
			$rqt = "ALTER TABLE demandes_actions CHANGE actions_read actions_read_opac INT not null default 0";
			echo traite_rqt($rqt,"alter demandes_actions change actions_read actions_read_opac");

			// MHo - Ajout d'une colonne "dmde_read_opac" pour alerter à l'opac en cas d'éléments nouveaux (actions, notes) ou pas : 0 = lue, 1 = non lue
			$rqt = "ALTER TABLE demandes ADD dmde_read_opac INT(1) UNSIGNED NOT NULL DEFAULT 0 ";
			echo traite_rqt($rqt,"alter demandes add dmde_read_opac");

			// MHo - Ajout d'une colonne "notes_read_opac" pour alerter à l'opac en cas de nouveauté : 0 = lue, 1 = non lue
			$rqt = "ALTER TABLE demandes_notes ADD notes_read_opac INT(1) UNSIGNED NOT NULL DEFAULT 0 ";
			echo traite_rqt($rqt,"alter demandes_notes add notes_read_opac");

			// DB -Ajout d'une fonction spécifique pour génération de code-barres lecteurs
			$rqt = "update parametres set comment_param='Numéro de carte de lecteur automatique ?\n 0: Non (si utilisation de cartes pré-imprimées)\n";
			$rqt.= " 1: Oui, entièrement numérique\n 2,a,b,c: Oui, avec préfixe: a=longueur du préfixe, b=nombre de chiffres de la partie numérique, c=préfixe fixé (facultatif)\n";
			$rqt.= " 3,fonction: fonction de génération spécifique dans fichier nommé de la même façon, à placer dans pmb/circ/empr' ";
			$rqt.= " where type_param='pmb' and sstype_param='num_carte_auto'";
			echo traite_rqt($rqt,"update parametre pmb_num_carte_auto ");

			// AB On augmente la taille des champs pour le num demandeur ....
			$rqt = "ALTER TABLE demandes CHANGE num_demandeur num_demandeur INT( 10 ) UNSIGNED NOT NULL DEFAULT 0";
			echo traite_rqt($rqt,"alter demandes change num_demandeur");
			$rqt = "ALTER TABLE demandes_actions CHANGE actions_num_user actions_num_user INT( 10 ) UNSIGNED NOT NULL DEFAULT 0";
			echo traite_rqt($rqt,"alter demandes_actions change actions_num_user");
			$rqt = "ALTER TABLE demandes_notes CHANGE notes_num_user notes_num_user INT( 10 ) UNSIGNED NOT NULL DEFAULT 0";
			echo traite_rqt($rqt,"alter demandes_notes change notes_num_user");

			//DB - Génération code-barres pour les inscritions Web
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='websubscribe_num_carte_auto' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) ";
				$rqt.= "VALUES (NULL, 'opac', 'websubscribe_num_carte_auto', '', 'Numéro de carte de lecteur automatique ?\n 2,a,b,c: Oui avec préfixe: a=longueur du préfixe, b=nombre de chiffres de la partie numérique, c=préfixe fixé (facultatif)\n 3,fonction: fonction de génération spécifique dans fichier nommé de la même façon, à placer dans pmb/opac_css/circ/empr', 'f_modules', '0')" ;
				echo traite_rqt($rqt,"insert opac_websubscribe_num_carte_auto into parametres") ;
			}

			// AB
			$rqt = "CREATE TABLE IF NOT EXISTS onto_uri (
					uri_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
					uri VARCHAR(255) NOT NULL UNIQUE DEFAULT '' )";
			echo traite_rqt($rqt,"create table onto_uri") ;

			//DB - Génération de cartes lecteurs sur imprimante ticket
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pdfcartelecteur' and sstype_param='printer_card_handler' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'pdfcartelecteur', 'printer_card_handler', '', 'Gestionnaire d\'impression :\n\n 1 = script \"print_cb.php\"\n 2 = applet jzebra\n 3 = requête ajax','',0)";
				echo traite_rqt($rqt,"insert pmb_printer_card_handler into parametres");
			}
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pdfcartelecteur' and sstype_param='printer_card_name' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'pdfcartelecteur', 'printer_card_name', '', 'Nom de l\'imprimante.','',0)";
				echo traite_rqt($rqt,"insert pmb_printer_card_options into parametres");
			}
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pdfcartelecteur' and sstype_param='printer_card_url' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'pdfcartelecteur', 'printer_card_url', '', 'Adresse de l\'imprimante.','',0)";
				echo traite_rqt($rqt,"insert pmb_printer_card_url into parametres");
			}

			// NG - Vignette de la notice
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='notice_img_folder_id' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) ";
				$rqt.= "VALUES (NULL, 'pmb', 'notice_img_folder_id', '0', 'Identifiant du répertoire d\'upload des vignettes de notices', '', '0')" ;
				echo traite_rqt($rqt,"insert pmb_notice_img_folder_id into parametres") ;
			}

			//AR - On ajoute une colonne pour l'inscription en ligne à l'OPAC (pour conserver ce que l'on faisait)
			$rqt = "alter table empr add empr_subscription_action text";
			echo traite_rqt($rqt,"alter table empr add empr_subscription_action");

			//AR - Modification du paramètre opac_websubscribe_show
			$rqt = "update parametres set comment_param = 'Afficher la possibilité de s\'inscrire en ligne ?\n0: Non\n1: Oui\n2: Oui + proposition s\'incription sur les réservations/abonnements' where type_param='opac' and sstype_param = 'websubscribe_show'";
			echo traite_rqt($rqt,"update parametres opac_websubscribe_show");

			//AB parametre du template d'affichage des notices pour le comparateur.
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='compare_notice_template' "))==0){
				$rqt = "INSERT INTO parametres (type_param,sstype_param,valeur_param,comment_param,section_param,gestion) VALUES ('pmb','compare_notice_template',0,'Choix du template d\'affichage des notices en mode comparaison.','',1)";
				echo traite_rqt($rqt,"insert pmb_compare_notice_template into parametres");
			}

			//AB comparateur.
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='compare_notice_nb' "))==0){
				$rqt = "INSERT INTO parametres (type_param,sstype_param,valeur_param,comment_param,section_param,gestion) VALUES ('pmb','compare_notice_nb',5,'Nombre de notices à afficher et à raffraichir en mode comparaison.','',1)";
				echo traite_rqt($rqt,"insert pmb_compare_notice_nb into parametres");
			}

			//AB parametre du template d'affichage des notices pour le comparateur.
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='compare_notice_active' "))==0){
				$rqt = "INSERT INTO parametres (type_param,sstype_param,valeur_param,comment_param,section_param,gestion) VALUES ('opac','compare_notice_active',1,'Activer le comparateur de notices','c_recherche',0)";
				echo traite_rqt($rqt,"insert opac_compare_notice_active into parametres");
			}
			// NG - Transfert: mémorisation de la loc d'origine des exemplaires en transfert
			$rqt = "CREATE TABLE if not exists transferts_source (
				trans_source_numexpl INT UNSIGNED NOT NULL default 0 ,
				trans_source_numloc INT UNSIGNED NOT NULL default 0 ,
				PRIMARY KEY(trans_source_numexpl))";
			echo traite_rqt($rqt,"CREATE TABLE transferts_source ") ;

			// NG - Ajout dans les archives de prêt les localisations du pret et de la loc d'origine de l'exemplaire
			$rqt = "alter table pret_archive add arc_expl_location_retour INT UNSIGNED NOT NULL default 0 AFTER arc_expl_location";
			echo traite_rqt($rqt,"alter table pret_archive add arc_expl_location_retour");
			$rqt = "alter table pret_archive add arc_expl_location_origine INT UNSIGNED NOT NULL default 0 AFTER arc_expl_location";
			echo traite_rqt($rqt,"alter table pret_archive add arc_expl_location_origine");

			//DG - Augmentation de la taille du champ pour les équations
			$rqt = "ALTER TABLE equations MODIFY nom_equation TEXT NOT NULL";
			echo traite_rqt($rqt,"ALTER TABLE equations MODIFY nom_equation TEXT");

			// +-------------------------------------------------+
			echo "</table>";
			$rqt = "update parametres set valeur_param='".$action."' where type_param='pmb' and sstype_param='bdd_version' " ;
			$res = pmb_mysql_query($rqt, $dbh) ;
			echo "<strong><font color='#FF0000'>".$msg[1807]." ".number_format($action, 2, ',', '.')."%</font></strong><br />";
			$action=$action+$increment;
		//	echo form_relance ("v5.16");
		//	break;

//case "v5.16":
			echo "<table ><tr><th>".$msg['admin_misc_action']."</th><th>".$msg['admin_misc_resultat']."</th></tr>";
			// +-------------------------------------------------+

			// AR indexons correctement SKOS - Table de mots
			$rqt = "create table if not exists skos_words_global_index(
				id_item int unsigned not null default 0,
				code_champ int unsigned not null default 0,
				code_ss_champ int unsigned not null default 0,
				num_word int unsigned not null default 0,
				pond int unsigned not null default 100,
				position int unsigned not null default 1,
				field_position int unsigned not null default 1,
				primary key (id_item,code_champ,num_word,position,code_ss_champ),
				index code_champ(code_champ),
				index i_id_mot(num_word,id_item),
				index i_code_champ_code_ss_champ_num_word(code_champ,code_ss_champ,num_word))";
			echo traite_rqt($rqt,"create table skos_words_global_index");

			// AR indexons correctement  SKOS - Table de champs
			$rqt = "create table if not exists skos_fields_global_index(
				id_item int unsigned not null default 0,
				code_champ int(3) unsigned not null default 0,
				code_ss_champ int(3) unsigned not null default 0,
				ordre int(4) unsigned not null default 0,
				value text not null,
				pond int(4) unsigned not null default 100,
				lang varchar(10) not null default '',
				authority_num varchar(50) not null default 0,
				primary key(id_item,code_champ,code_ss_champ,lang,ordre),
				index i_value(value(300)),
				index i_code_champ_code_ss_champ(code_champ,code_ss_champ))";
			echo traite_rqt($rqt,"create table skos_fields_global_index ");

			//AB table de construction d'une vedette composée
			$rqt = "CREATE TABLE IF NOT EXISTS vedette_object (
						object_type int(3) unsigned NOT NULL DEFAULT 0,
						object_id int(11) unsigned NOT NULL DEFAULT 0,
						num_vedette int(11) unsigned NOT NULL DEFAULT 0,
						subdivision varchar(50) NOT NULL default '',
						position int(3) unsigned NOT NULL DEFAULT 0,
						PRIMARY KEY (object_type, object_id, num_vedette, subdivision, position),
						INDEX i_vedette_object_object (object_type,object_id),
						INDEX i_vedette_object_vedette (num_vedette)
					) ";
			echo traite_rqt($rqt,"CREATE TABLE vedette_object") ;

			//AB table des identifiants de vedettes
			$rqt = "CREATE TABLE IF NOT EXISTS vedette (
						id_vedette int(11) unsigned NOT NULL AUTO_INCREMENT,
						label varchar(255) NOT NULL default '',
						PRIMARY KEY (id_vedette)
					) ";
			echo traite_rqt($rqt,"CREATE TABLE vedette") ;

			//AP ajout de la table index_concept
			$rqt = "CREATE TABLE IF NOT EXISTS index_concept (
					num_object INT UNSIGNED NOT NULL ,
					type_object INT UNSIGNED NOT NULL ,
					num_concept INT UNSIGNED NOT NULL ,
					order_concept INT UNSIGNED NOT NULL default 0 ,
					PRIMARY KEY(num_object, type_object, num_concept))";
			echo traite_rqt($rqt,"create table index_concept");

			//AP création de la table de lien entre vedettes et autorités
			$rqt = "CREATE TABLE if not exists vedette_link (
				num_vedette INT UNSIGNED NOT NULL ,
				num_object INT UNSIGNED NOT NULL ,
				type_object INT UNSIGNED NOT NULL ,
				PRIMARY KEY (num_vedette, num_object, type_object))";
			echo traite_rqt($rqt,"create table vedette_link");

			// AP script de vérification de saisie des autorités
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='autorites_verif_js' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
						VALUES ( 'pmb', 'autorites_verif_js', '', 'Script de vérification de saisie des autorités','', 0)";
				echo traite_rqt($rqt,"insert autorites_verif_js into parametres");
			}

			//AB paramètre pour masquer/afficher la reservation par panier
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='resa_cart' "))==0){
				$rqt = "INSERT INTO parametres (type_param,sstype_param,valeur_param,comment_param,section_param,gestion) VALUES ('opac','resa_cart',1,'Paramètre pour masquer/afficher la reservation par panier\n0 : Non \n1 : Oui','a_general',0)";
				echo traite_rqt($rqt,"insert opac_resa_cart into parametres");
			}

			// AR - Report du paramètre activant le stemming en gestion
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='search_stemming_active' "))==0){
				$rqt = "insert into parametres ( type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES('pmb','search_stemming_active',0,'Activer le stemming dans la recherche\n0 : Désactiver\n1 : Activer','search',0)" ;
				echo traite_rqt($rqt,"insert pmb_search_stemming_active=0 into parametres") ;
			}

			// AR - Report du paramètre excluant des champ dans la recherche tous les champs en gestion
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='search_exclude_fields' "))==0){
				$rqt = "insert into parametres ( type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES('pmb','search_exclude_fields','','Identifiants des champs à exclure de la recherche tous les champs (liste dispo dans le fichier includes/indexation/champ_base.xml)','search',0)" ;
				echo traite_rqt($rqt,"insert pmb_search_exclude_fields into parametres") ;
			}

			//AR - Report du paramètre d'écretage des résultats de recherche en gestion
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='search_noise_limit_type' "))==0){
				$rqt="INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (NULL, 'pmb', 'search_noise_limit_type', '0', 'Ecrêter les résulats de recherche en fonction de la pertinence. \n0 : Non \n1 : Retirer du résultat tout ce qui est en dessous de la moyenne - l\'écart-type\n2,ratio : Retirer du résultat tout ce qui est en dessous de la moyenne - un ratio de l\'écart-type (ex: 2,1.96)\n3,ratio : Retirer du résultat tout ce qui est dessous d\'un ratio de la pertinence max (ex: 3,0.25 élimine tout ce qui est inférieur à 25% de la plus forte pertinence)' , 'search', '0')";
				echo traite_rqt($rqt,"insert pmb_search_search_noise_limit_type='0' into parametres ");
			}

			//AR - Report de la prise en compte de la fréquence d'apparition d'un mot dans le fonds pour le calcul de pertinence en gestion
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='search_relevant_with_frequency' "))==0){
				$rqt="INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (NULL, 'pmb', 'search_relevant_with_frequency', '0', 'Utiliser la fréquence d\'apparition des mots dans les notices pour le calcul de la pertinence.\n0 : Non \n1 : Oui' , 'search', '0')";
				echo traite_rqt($rqt,"insert pmb_search_relevant_with_frequency='0' into parametres ");
			}

			//AR - Report du paramètre gérant la troncature À droite automatique
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='allow_term_troncat_search' "))==0){
				$rqt="INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (NULL, 'pmb', 'allow_term_troncat_search', '0', 'Troncature à droite automatique :\n0 : Non \n1 : Oui' , 'search', '0')";
				echo traite_rqt($rqt,"insert pmb_allow_term_troncat_search='0' into parametres ");
			}

			//AR - Report du paramètre gérant la durée du cache des recherches
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='search_cache_duration' "))==0){
				$rqt="INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (NULL, 'pmb', 'search_cache_duration', '0', 'Durée de validité (en secondes) du cache des recherches' , 'search', '0')";
				echo traite_rqt($rqt,"insert pmb_search_cache_duration='0' into parametres ");
			}

			//DG - En impression de panier, imprimer les exemplaires est coché par défaut
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='print_expl_default' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'pmb', 'print_expl_default', '0', 'En impression de panier, imprimer les exemplaires est coché par défaut \n 0 : Non \n 1 : Oui','',0) " ;
				echo traite_rqt($rqt,"insert pmb_print_expl_default = 0 into parametres");
			}


			//AR - Activation des concepts ou non
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'thesaurus' and sstype_param='concepts_active' "))==0){
				$rqt="INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (NULL, 'thesaurus', 'concepts_active', '0', 'Active ou non l\'utilisation des concepts:\n0 : Non\n1 : Oui', 'concepts', '0')";
				echo traite_rqt($rqt,"insert thesaurus_concepts_active='0' into parametres ");
			}

			//AP - Paramétrage de l'ordre d'affichage des concepts d'une notice
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'thesaurus' and sstype_param='concepts_affichage_ordre' "))==0){
				$rqt="INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (NULL, 'thesaurus', 'concepts_affichage_ordre', '0', 'Paramétrage de l\'ordre d\'affichage des catégories d\'une notice.\nPar ordre alphabétique: 0(par défaut)\nPar ordre de saisie: 1', 'concepts', '0')";
				echo traite_rqt($rqt,"insert concepts_affichage_ordre into parametres ");
			}

			//AP - Paramétrage du mode d'affichage des concepts d'une notice (en ligne ou pas)
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'thesaurus' and sstype_param='concepts_concept_in_line' "))==0){
				$rqt="INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (NULL, 'thesaurus', 'concepts_concept_in_line', '0', 'Affichage des catégories en ligne.\n 0 : Non.\n 1 : Oui.', 'concepts', '0')";
				echo traite_rqt($rqt,"insert concepts_concept_in_line into parametres ");
			}

			//AB Checkbox pour réafficher les notices dans chaque groupement ou pas
			$rqt = "ALTER TABLE bannettes ADD display_notice_in_every_group INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER group_pperso";
			echo traite_rqt($rqt,"alter table bannettes add display_notice_in_every_group");

			//NG - Autorités personalisées
			$rqt = "create table if not exists authperso (
				id_authperso int(10) unsigned NOT NULL auto_increment,
				authperso_name varchar(255) NOT NULL default '',
				authperso_notice_onglet_num  int unsigned not null default 0,
				authperso_isbd_script text not null,
				authperso_view_script text not null,
				authperso_opac_search int unsigned not null default 0,
				authperso_opac_multi_search int unsigned not null default 0,
				authperso_gestion_search int unsigned not null default 0,
				authperso_gestion_multi_search int unsigned not null default 0,
				authperso_comment text not null,
				PRIMARY KEY  (id_authperso)) ";
			echo traite_rqt($rqt,"create table authperso ");

			//NG - Champs perso des autorités personalisées
			$rqt = "create table if not exists authperso_custom (
				idchamp int(10) unsigned NOT NULL auto_increment,
				custom_prefixe varchar(255) NOT NULL default '',
				num_type int unsigned not null default 0,
				name varchar(255) NOT NULL default '',
				titre varchar(255) default NULL,
				type varchar(10) NOT NULL default 'text',
				datatype varchar(10) NOT NULL default '',
				options text,
				multiple int(11) NOT NULL default 0,
				obligatoire int(11) NOT NULL default 0,
				ordre int(11) default NULL,
				search INT(1) unsigned NOT NULL DEFAULT 0,
				export INT(1) unsigned NOT NULL DEFAULT 0,
				exclusion_obligatoire INT(1) unsigned NOT NULL DEFAULT 0,
				pond int not null default 100,
				opac_sort INT NOT NULL DEFAULT 0,
			PRIMARY KEY  (idchamp)) ";
			echo traite_rqt($rqt,"create table authperso_custom ");

			$rqt = "create table if not exists authperso_custom_lists (
				authperso_custom_champ int(10) unsigned NOT NULL default 0,
				authperso_custom_list_value varchar(255) default NULL,
				authperso_custom_list_lib varchar(255) default NULL,
				ordre int(11) default NULL,
				KEY editorial_custom_champ (authperso_custom_champ),
				KEY editorial_champ_list_value (authperso_custom_champ,authperso_custom_list_value)) " ;
			echo traite_rqt($rqt,"create table if not exists authperso_custom_lists ");

			$rqt = "create table if not exists authperso_custom_values (
				authperso_custom_champ int(10) unsigned NOT NULL default 0,
				authperso_custom_origine int(10) unsigned NOT NULL default 0,
				authperso_custom_small_text varchar(255) default NULL,
				authperso_custom_text text,
				authperso_custom_integer int(11) default NULL,
				authperso_custom_date date default NULL,
				authperso_custom_float float default NULL,
				KEY editorial_custom_champ (authperso_custom_champ),
				KEY editorial_custom_origine (authperso_custom_origine)) " ;
			echo traite_rqt($rqt,"create table if not exists authperso_custom_values ");

			$rqt = "create table if not exists authperso_authorities (
				id_authperso_authority int(10) unsigned NOT NULL auto_increment,
				authperso_authority_authperso_num int(10) unsigned NOT NULL default 0 ,
				authperso_infos_global text not null,
				authperso_index_infos_global text not null,
				PRIMARY KEY  (id_authperso_authority))  " ;
			echo traite_rqt($rqt,"create table if not exists authperso_authorities ");

			$rqt = "create table if not exists notices_authperso (
				notice_authperso_notice_num int(10) unsigned NOT NULL default 0,
				notice_authperso_authority_num int(10) unsigned NOT NULL default 0,
				notice_authperso_order int(10) unsigned NOT NULL default 0,
				PRIMARY KEY  (notice_authperso_notice_num,notice_authperso_authority_num))  " ;
			echo traite_rqt($rqt,"create table if not exists notices_authperso ");

			// NG : Onglet personalisé de notice
			$rqt = "create table if not exists notice_onglet (
				id_onglet int(10) unsigned NOT NULL auto_increment,
				onglet_name varchar(255) default NULL,
				PRIMARY KEY  (id_onglet)) ";
			echo traite_rqt($rqt,"create table if not exists notice_onglet ");

			//DG - Personnalisation des colonnes pour l'affichage des états des collections
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='collstate_data' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'opac', 'collstate_data', '', 'Colonne des états des collections, dans l\'ordre donné, séparé par des virgules : location_libelle,emplacement_libelle,cote,type_libelle,statut_opac_libelle,origine,state_collections,archive,lacune,surloc_libelle,note\nLes valeurs possibles sont les propriétés de la classe PHP \"pmb/opac_css/classes/collstate.class.php\".','e_aff_notice',0)";
				echo traite_rqt($rqt,"insert opac_collstate_data = 0 into parametres");
			}

			//AB ajout d'un schema SKOS par défaut
			$rqt = "ALTER TABLE users ADD deflt_concept_scheme INT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER deflt_thesaurus";
			echo traite_rqt($rqt,"alter table users add deflt_concept_scheme");

			//AB paramètre caché pour conservation de la date de dernière modification de l'ontologie
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'thesaurus' and sstype_param='ontology_filemtime' "))==0){
				$rqt = "INSERT INTO parametres (type_param,sstype_param,valeur_param,comment_param,section_param,gestion)
					VALUES ('thesaurus','ontology_filemtime',0,'Paramètre caché pour conservation de la date de dernière modification de l\'ontologie','ontologie',1)";
				echo traite_rqt($rqt,"insert thesaurus_ontology_filemtime into parametres");
			}

			// NG - Ajout du champ resa_arc_trans pour associer un transfert à une archive résa
			$rqt = "ALTER TABLE transferts_demande ADD resa_arc_trans int(8) UNSIGNED NOT NULL DEFAULT 0 ";
			echo traite_rqt($rqt,"alter table transferts_demande add resa_arc_trans ");

			// NG - Ajout champ info dans les audits
			$rqt = "ALTER TABLE audit ADD info text NOT NULL";
			echo traite_rqt($rqt,"alter table audit add info ");

			// AP modification du paramètre de schema SKOS par défaut
			$rqt = "ALTER TABLE users CHANGE deflt_concept_scheme deflt_concept_scheme INT(3) NOT NULL DEFAULT -1";
			echo traite_rqt($rqt,"alter table users change deflt_concept_scheme");

			//DG - Statuts sur les documents numériques
			$rqt = "create table if not exists explnum_statut (
				id_explnum_statut smallint(5) unsigned not null auto_increment,
				gestion_libelle varchar(255) not NULL default '',
				opac_libelle varchar(255)  not NULL default '',
				class_html VARCHAR( 255 )  not NULL default '',
				explnum_visible_opac tinyint(1) NOT NULL default 1,
				explnum_visible_opac_abon tinyint(1) NOT NULL default 0,
				explnum_consult_opac tinyint(1) NOT NULL default 1,
				explnum_consult_opac_abon tinyint(1) NOT NULL default 0,
				explnum_download_opac tinyint(1) NOT NULL default 1,
				explnum_download_opac_abon tinyint(1) NOT NULL default 0,
				primary key(id_explnum_statut))";
			echo traite_rqt($rqt,"create table explnum_statut ");

			//DG - Statut "Sans statut particulier" ajouté par défaut
			$rqt = "insert into explnum_statut SET id_explnum_statut=1, gestion_libelle='Sans statut particulier',opac_libelle='', explnum_visible_opac='1' ";
			echo traite_rqt($rqt,"insert minimum into explnum_statut");

			//DG - Ajout d'un champ statut sur les documents numériques
			$rqt = "ALTER TABLE explnum ADD explnum_docnum_statut smallint(5) UNSIGNED NOT NULL DEFAULT 1 ";
			echo traite_rqt($rqt,"alter table explnum add explnum_docnum_statut ");

			//DG - Statut de document numérique par défaut en création de document numérique
			$rqt = "ALTER TABLE users ADD deflt_explnum_statut INT(6) UNSIGNED DEFAULT 1 NOT NULL " ;
			echo traite_rqt($rqt,"ALTER users ADD deflt_explnum_statut ");

			//AR - paramétrages des droits d'accès sur les documents numériques
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'gestion_acces' and sstype_param='empr_docnum' "))==0){
			$rqt = "INSERT INTO parametres (type_param,sstype_param,valeur_param,comment_param,section_param,gestion)
					VALUES ('gestion_acces','empr_docnum',0,'Gestion des droits d\'accès des emprunteurs aux documents numériques\n0 : Non.\n1 : Oui.','',0)";
				echo traite_rqt($rqt,"insert gestion_acces_empr_docnum into parametres");
			}
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'gestion_acces' and sstype_param='empr_docnum_def' "))==0){
				$rqt = "INSERT INTO parametres (type_param,sstype_param,valeur_param,comment_param,section_param,gestion)
					VALUES ('gestion_acces','empr_docnum_def',0,'Valeur par défaut en modification de document numérique pour les droits d\'accès emprunteurs - documents numériques\n0 : Recalculer.\n1 : Choisir.','',0)";
				echo traite_rqt($rqt,"insert gestion_acces_empr_docnum_def into parametres");
			}

			// NG - Ajout param transferts_retour_action_resa
			if (pmb_mysql_num_rows(pmb_mysql_query("SELECT 1 FROM parametres WHERE type_param= 'transferts' and sstype_param='retour_action_resa' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, gestion, comment_param)
				VALUES (0, 'transferts', 'retour_action_resa', '1', '1', 'Génére un transfert pour répondre à une réservation lors du retour de l\'exemplaire\n 0: Non\n 1: Oui') ";
				echo traite_rqt($rqt,"INSERT transferts_retour_action_resa INTO parametres") ;
			}

			//DG - Logs OPAC - Exclusion possible des robots et de certaines adresses IP
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='logs_exclude_robots' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'pmb', 'logs_exclude_robots', '1', 'Exclure les robots dans les logs OPAC ?\n 0: Non\n 1: Oui. \nFaire suivre d\'une virgule pour éventuellement exclure les logs OPAC provenant de certaines adresses IP, elles-mêmes séparées par des virgules (ex : 1,127.0.0.1,192.168.0.1).','',0)";
				echo traite_rqt($rqt,"insert pmb_logs_exclude_robots = 1 into parametres");
			}

			// NG - Auteurs répétables dans les titres uniformes
			$rqt = "CREATE TABLE if not exists responsability_tu (
					responsability_tu_author_num int unsigned NOT NULL default 0,
					responsability_tu_num int unsigned NOT NULL default 0,
					responsability_tu_fonction char(4) NOT NULL default '',
					responsability_tu_type int unsigned NOT NULL default 0,
					responsability_tu_ordre smallint(2) unsigned NOT NULL default 0,
					PRIMARY KEY  (responsability_tu_author_num, responsability_tu_num, responsability_tu_fonction),
					KEY responsability_tu_author (responsability_tu_author_num),
					KEY responsability_tu_num (responsability_tu_num) )";
			echo traite_rqt($rqt,"CREATE TABLE responsability_tu ");
			// NG - migration de l'auteur de titre uniforme dans la table responsability_tu
			if ($res = pmb_mysql_query("select tu_num_author, tu_id from titres_uniformes where tu_num_author>0")){
				while ( $row = pmb_mysql_fetch_object($res)) {
					$rqt = "INSERT INTO responsability_tu set responsability_tu_author_num=".$row->tu_num_author.", responsability_tu_num= ".$row->tu_id."  ";
					pmb_mysql_query($rqt, $dbh);
				}
			}

			//NG - ajout pied de page dans la fiche de circulation
			$rqt = "ALTER TABLE serialcirc ADD serialcirc_piedpage text NOT NULL AFTER serialcirc_tpl";
			echo traite_rqt($rqt,"alter table serialcirc add serialcirc_piedpage");

			//DG - Templates de listes de circulation
			$rqt = "CREATE TABLE serialcirc_tpl (
	 				serialcirctpl_id int(10) unsigned NOT NULL auto_increment,
	  				serialcirctpl_name varchar(255) NOT NULL DEFAULT '',
					serialcirctpl_comment varchar(255) NOT NULL DEFAULT '',
					serialcirctpl_tpl text NOT NULL,
	  				PRIMARY KEY  (serialcirctpl_id))";
			echo traite_rqt($rqt,"CREATE TABLE serialcirc_tpl") ;
			$rqt = "insert into serialcirc_tpl SET serialcirctpl_id=1, serialcirctpl_name='Template PMB', serialcirctpl_comment='', serialcirctpl_tpl='a:3:{i:0;a:3:{s:4:\"type\";s:4:\"name\";s:2:\"id\";s:1:\"0\";s:5:\"label\";N;}i:1;a:3:{s:4:\"type\";s:5:\"ville\";s:2:\"id\";s:1:\"0\";s:5:\"label\";N;}i:2;a:3:{s:4:\"type\";s:5:\"libre\";s:2:\"id\";s:1:\"0\";s:5:\"label\";s:9:\"SIGNATURE\";}}' ";
			echo traite_rqt($rqt,"insert minimum into serialcirc_tpl");

			//DG - Circulation des périodiques : Tri sur les destinataires
			$rqt = "ALTER TABLE serialcirc ADD serialcirc_sort_diff text NOT NULL";
			echo traite_rqt($rqt,"alter table serialcirc add serialcirc_sort_diff");

			//NG - Templates de bannettes
			$rqt = "CREATE TABLE bannette_tpl (
					bannettetpl_id int(10) unsigned NOT NULL auto_increment,
					bannettetpl_name varchar(255) NOT NULL DEFAULT '',
					bannettetpl_comment varchar(255) NOT NULL DEFAULT '',
					bannettetpl_tpl text NOT NULL,
					PRIMARY KEY  (bannettetpl_id))";
			echo traite_rqt($rqt,"CREATE TABLE bannette_tpl") ;
			$rqt = "insert into bannette_tpl SET bannettetpl_id=1, bannettetpl_name='Template PMB', bannettetpl_comment='', bannettetpl_tpl='a:3:{i:0;a:3:{s:4:\"type\";s:4:\"name\";s:2:\"id\";s:1:\"0\";s:5:\"label\";N;}i:1;a:3:{s:4:\"type\";s:5:\"ville\";s:2:\"id\";s:1:\"0\";s:5:\"label\";N;}i:2;a:3:{s:4:\"type\";s:5:\"libre\";s:2:\"id\";s:1:\"0\";s:5:\"label\";s:9:\"SIGNATURE\";}}' ";
			echo traite_rqt($rqt,"insert minimum into bannette_tpl");

			//NG - Templates de bannettes
			$rqt = "ALTER TABLE bannettes ADD bannette_tpl_num INT(6) UNSIGNED DEFAULT 0 NOT NULL " ;
			echo traite_rqt($rqt,"ALTER bannettes ADD bannette_tpl_num ");


			// +-------------------------------------------------+
			echo "</table>";
			$rqt = "update parametres set valeur_param='".$action."' where type_param='pmb' and sstype_param='bdd_version' " ;
			$res = pmb_mysql_query($rqt, $dbh) ;
			echo "<strong><font color='#FF0000'>".$msg[1807]." ".number_format($action, 2, ',', '.')."%</font></strong><br />";
			$action=$action+$increment;
			//echo form_relance ("v5.17");
			//break;

//case "v5.17":
			echo "<table ><tr><th>".$msg['admin_misc_action']."</th><th>".$msg['admin_misc_resultat']."</th></tr>";
			// +-------------------------------------------------+

			// NG - Ajout paramètre pour activer la géolocalisation
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_activate' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_activate', '0', 'Activation de la géolocalisation:\n 0 : non \n 1 : oui','', 0)";
				echo traite_rqt($rqt,"insert pmb_map_activate into parametres");
			}

			//MB + CB - Renseigner les champs d'exemplaires transfert_location_origine et transfert_statut_origine pour les statistiques et si ils ne le sont pas déjà (lié aux améliorations pour les transferts)
			$rqt = "UPDATE exemplaires SET transfert_location_origine=expl_location, transfert_statut_origine=expl_statut, update_date=update_date WHERE transfert_location_origine=0 AND transfert_statut_origine=0 AND expl_id NOT IN (SELECT num_expl FROM transferts_demande JOIN transferts ON (num_transfert=id_transfert AND etat_transfert=0))";
			echo traite_rqt($rqt,"update exemplaires transfert_location_origine transfert_statut_origine");
			//NG - géolocalisation
			$rqt = "ALTER TABLE notices ADD map_echelle_num int(10) unsigned NOT NULL default 0" ;
			echo traite_rqt($rqt,"ALTER notices ADD map_echelle_num ");

			$rqt = "ALTER TABLE notices ADD map_projection_num int(10) unsigned NOT NULL default 0" ;
			echo traite_rqt($rqt,"ALTER notices ADD map_projection_num ");

			$rqt = "ALTER TABLE notices ADD map_ref_num int(10) unsigned NOT NULL default 0" ;
			echo traite_rqt($rqt,"ALTER notices ADD map_ref_num ");

			$rqt = "ALTER TABLE notices ADD map_equinoxe varchar(255) NOT NULL DEFAULT ''" ;
			echo traite_rqt($rqt,"ALTER notices ADD map_equinoxe ");



			//NG - géolocalisation: Memo des emprises
			$rqt = "CREATE TABLE if not exists map_emprises (
					map_emprise_id int(10) unsigned NOT NULL auto_increment,
					map_emprise_type int(10) unsigned NOT NULL default 0,
					map_emprise_obj_num int(10) unsigned NOT NULL default 0,
					map_emprise_data GEOMETRY NOT NULL,
					map_emprise_order int(10) unsigned NOT NULL default 0,
					PRIMARY KEY  (map_emprise_id))";
			echo traite_rqt($rqt,"CREATE TABLE map_emprises") ;

			//NG - géolocalisation: Echelles
			$rqt = "CREATE TABLE if not exists map_echelles (
					map_echelle_id int(10) unsigned NOT NULL auto_increment,
					map_echelle_name varchar(255) NOT NULL DEFAULT '',
					PRIMARY KEY  (map_echelle_id))";
			echo traite_rqt($rqt,"CREATE TABLE map_echelles") ;

			//NG - géolocalisation: Système de projection du document
			$rqt = "CREATE TABLE if not exists map_projections (
					map_projection_id int(10) unsigned NOT NULL auto_increment,
					map_projection_name varchar(255) NOT NULL DEFAULT '',
					PRIMARY KEY  (map_projection_id))";
			echo traite_rqt($rqt,"CREATE TABLE map_projections") ;

			//NG - géolocalisation: Systeme de référence de coord de la carte
			$rqt = "CREATE TABLE if not exists map_refs (
					map_ref_id int(10) unsigned NOT NULL auto_increment,
					map_ref_name varchar(255) NOT NULL DEFAULT '',
					PRIMARY KEY  (map_ref_id))";
			echo traite_rqt($rqt,"CREATE TABLE map_refs") ;

			// AR - Ajout paramètre pour limiter le nombre d'emprises sur une carte !
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_max_holds' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_max_holds', '250', 'Nombre d\'emprise maximum souhaité par type d\'emprise','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_max_holds into parametres");
			}

			// AR - Les paramètres de cartes sont rangés ensemble !
			$rqt = "update parametres set section_param= 'map' where type_param like 'pmb' and sstype_param like 'map_activate'";
			echo traite_rqt($rqt,"update pmb_map_max_holds");

			// AR - Définition de la couleur d'une emprise de notice
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_holds_record_color' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_holds_record_color', '#D6A40F', 'Couleur des emprises associées à des notices','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_holds_record_color into parametres");
			}

			// AR - Définition de la couleur d'une emprise d'autorité
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_holds_authority_color' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_holds_authority_color', '#D60F0F', 'Couleur des emprises associées à des autorités','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_holds_authority_color into parametres");
			}


			// AR - Définition du fond de carte
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_base_layer_type' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_base_layer_type', 'OSM', 'Fonds de carte à utiliser.\nValeurs possibles :\nOSM           => Open Street Map\nWMS           => The Web Map Server base layer type selector.\nGOOGLE        => Google\nARCGIS        =>The ESRI ARCGis base layer selector.\n','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_base_layer_type into parametres");
			}
			// AR - Définition des paramètres du fond de carte
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_base_layer_params' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_base_layer_params', '', 'Structure JSON à passer au fond de carte\nexemple :\n{\n \"name\": \"Nom du fond de carte\",\n \"url\": \"url du fond de carte\",\n \"options\":{\n  \"layers\": \"MONDE_MOD1\"\n }\n}','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_base_layer_params into parametres");
			}

			// NG - Ajout paramètre de la taille de la carte en saisie de recherche
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_size_search_edition' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_size_search_edition', '800*480', 'Taille de la carte en saisie de recherche','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_size_search_edition into parametres");
			}

			// NG - Ajout paramètre de la taille de la carte en résultat de recherche
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_size_search_result' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_size_search_result', '800*480', 'Taille de la carte en résultat de recherche','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_size_search_result into parametres");
			}
			// NG - Ajout paramètre de la taille de la carte en visualisation de notice
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_size_notice_view' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_size_notice_view', '800*480', 'Taille de la carte en visualisation de notice','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_size_notice_view into parametres");
			}

			// NG - Ajout paramètre de la taille de la carte en édition de notice
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_size_notice_edition' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_size_notice_edition', '800*480', 'Taille de la carte en édition de notice','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_size_notice_edition into parametres");
			}

			// NG - cms: Ajout des vues opac
			$rqt = "ALTER TABLE cms ADD cms_opac_view_num int(10) unsigned NOT NULL default 0" ;
			echo traite_rqt($rqt,"ALTER cms ADD cms_opac_view_num ");

			//DG - Modification taille du champ article_resume de la table cms_articles
			$rqt ="alter table cms_articles MODIFY article_resume MEDIUMTEXT NOT NULL";
			echo traite_rqt($rqt,"alter table cms_articles modify article_resume mediumtext");

			//DG - Modification taille du champ article_contenu de la table cms_articles
			$rqt ="alter table cms_articles MODIFY article_contenu MEDIUMTEXT NOT NULL";
			echo traite_rqt($rqt,"alter table cms_articles modify article_contenu mediumtext");

			//DG - Modification taille du champ section_resume de la table cms_sections
			$rqt ="alter table cms_sections MODIFY section_resume MEDIUMTEXT NOT NULL";
			echo traite_rqt($rqt,"alter table cms_sections modify section_resume mediumtext");

			//MB - Définition de la taille maximum des vignettes des notices
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='notice_img_pics_max_size' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param) VALUES (0, 'pmb', 'notice_img_pics_max_size', '150', 'Taille maximale des vignettes uploadées dans les notices, en largeur ou en hauteur')";
				echo traite_rqt($rqt,"insert pmb_notice_img_pics_max_size='150' into parametres");
			}

			//DG - Vues OPAC dans les facettes
			$rqt = "show fields from facettes";
			$res = pmb_mysql_query($rqt);
			$exists = false;
			if(pmb_mysql_num_rows($res)){
				while($row = pmb_mysql_fetch_object($res)){
					if($row->Field == "facette_opac_views_num"){
						$exists = true;
						break;
					}
				}
			}
			if(!$exists){
				$rqt = "ALTER TABLE facettes ADD facette_opac_views_num text NOT NULL";
				echo traite_rqt($rqt,"alter table facettes add facette_opac_views_num");

				$req = "select id_facette, facette_opac_views_num from facettes";
				$res = pmb_mysql_query($req,$dbh);
				if ($res) {
					$facettes = array();
					while($row = pmb_mysql_fetch_object($res)) {
						$facettes[] = $row->id_facette;
					}
					if (count($facettes)) {
						$req = "select opac_view_id, opac_view_name from opac_views";
						$myQuery = pmb_mysql_query($req, $dbh);
						if ($myQuery) {
							$views = array();
							while ($row = pmb_mysql_fetch_object($myQuery)) {
								$v = array();
								$v["id"] = $row->opac_view_id;
								$v["name"] = $row->opac_view_name;
								$views[] = $v;
							}
							$param["selected"] = $facettes;
							$param=addslashes(serialize($param));
							foreach ($views as $view) {
								//Dans le cas où une modification a été faite avant le passage de la MAJ..
								$req = "delete from opac_filters where opac_filter_view_num=".$view["id"]." and opac_filter_path='facettes'";
								$res = pmb_mysql_query($req,$dbh);
								//Insertion..
								$rqt="insert into opac_filters set opac_filter_view_num=".$view["id"].",opac_filter_path='facettes', opac_filter_param='$param' ";
								echo traite_rqt($rqt,"insert authorization facettes into opac_filters view ".$view["name"]);
							}
						}
					}
				}
			}

			// NG - Ajout paramètre pour activer la géolocalisation en Opac
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_activate' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_activate', '0', 'Activation de la géolocalisation:\n 0 : non \n 1 : oui','a_general', 0)";
				echo traite_rqt($rqt,"insert opac_map_activate into parametres");
			}

			//DB - commande psexec (planificateur sous windows)
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='psexec_cmd' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
				VALUES (0, 'pmb', 'psexec_cmd', 'psexec -d', 'Paramètres de lancement de psexec (planificateur sous windows)\r\n\nAjouter l\'option -accepteula sur les versions les plus récentes. ', '',0) ";
				echo traite_rqt($rqt, "insert pmb_psexec_cmd into parameters");
			}

			// AR - Ajout paramètre pour activer l'éditeur Dojo
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='editorial_dojo_editor' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'editorial_dojo_editor', '1', 'Activation de l\'éditeur DoJo dans le contenu éditorial:\n 0 : non \n 1 : oui','', 0)";
				echo traite_rqt($rqt,"insert pmb_editorial_dojo_editor into parametres");
			}

			// DG - Module "Surcharge de méta-données" : Groupes de méta-données par défaut
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from cms_managed_modules where managed_module_name= 'cms_module_metadatas' "))==0){
				$struct = array();
				$struct["metadatas1"] = array(
						'prefix' => "og",
						'name' => "Open Graph Protocol",
						'items' => array(
								'title' => array(
										'label' => "titre",
										'desc' => "Titre",
										'default_template' => "{{title}}"
								),
								'type' => array(
										'label' => "type",
										'desc' => "Type",
										'default_template' => "{{type}}"
								),
								'image' => array(
										'label' => "logo",
										'desc' => "Lien vers le logo",
										'default_template' => "{{logo_url}}"
								),
								'url' => array(
										'label' => "lien",
										'desc' => "Lien",
										'default_template' => "{{link}}"
								),
								'description' => array(
										'label' => "description",
										'desc' => "Résumé",
										'default_template' => "{{resume}}"
								),
								'locale' => array(
										'label' => "locale",
										'desc' => "Langue",
										'default_template' => ""
								),
								'site_name' => array(
										'label' => "site_name",
										'desc' => "Nom du site",
										'default_template' => ""
								),
						),
						'separator' => ":",
						'group_template' => "<meta property='{{key_metadata}}' content='{{value_metadata}}' />"
				);

				$struct["metadatas2"] = array(
						'prefix' => "twitter",
						'name' => "Twitter Cards",
						'items' => array(
								'title' => array(
										'label' => "titre",
										'desc' => "Titre",
										'default_template' => "{{title}}"
								),
								'card' => array(
										'label' => "card",
										'desc' => "Résumé",
										'default_template' => ""
								),
								'description' => array(
										'label' => "description",
										'desc' => "Description",
										'default_template' => "{{resume}}"
								),
								'image' => array(
										'label' => "logo",
										'desc' => "Lien vers le logo",
										'default_template' => "{{logo_url}}"
								),
								'site' => array(
										'label' => "site",
										'desc' => "Site",
										'default_template' => ""
								),
						),
						'separator' => ":",
						'group_template' => "<meta name='{{key_metadata}}' content='{{value_metadata}}' />"
				);
				$managed_datas = array();
				$managed_datas["module"]["metadatas"] = $struct;
				$managed_datas=addslashes(serialize($managed_datas));
				$rqt = "INSERT INTO cms_managed_modules ( managed_module_name, managed_module_box)
				VALUES ('cms_module_metadatas', '$managed_datas')";
				echo traite_rqt($rqt,"insert cms_module_metadatas into cms_managed_modules");
			}

			//DB Ajout vignette etageres (SDN)
			$rqt = "ALTER TABLE etagere ADD thumbnail_url MEDIUMBLOB NOT NULL " ;
			echo traite_rqt($rqt,"ALTER TABLE etagere ADD thumbnail_url ");

			// AR - Ajout paramètre pour limiter le nombre d'emprises sur une carte à l'OPAC!
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_max_holds' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_max_holds', '250', 'Nombre d\'emprise maximum souhaité par type d\'emprise','map', 0)";
				echo traite_rqt($rqt,"insert opac_map_max_holds into parametres");
			}

			// AR - Les paramètres de cartes sont rangés ensemble !
			$rqt = "update parametres set section_param= 'map', comment_param='Activation du géoréférencement' where type_param like 'opac' and sstype_param like 'map_activate'";
			echo traite_rqt($rqt,"update opac_map_activate");

			// AR - Changement de nom !
			$rqt = "update parametres set comment_param='Activation du géoréférencement' where type_param like 'pmb' and sstype_param like 'map_activate'";
			echo traite_rqt($rqt,"update pmb_map_activate");

			// AR - Définition de la couleur d'une emprise de notice à l'OPAC
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_holds_record_color' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_holds_record_color', '#D6A40F', 'Couleur des emprises associées à des notices','map', 0)";
				echo traite_rqt($rqt,"insert opac_map_holds_record_color into parametres");
			}

			// AR - Définition de la couleur d'une emprise d'autorité à l'OPAC
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_holds_authority_color' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_holds_authority_color', '#D60F0F', 'Couleur des emprises associées à des autorités','map', 0)";
				echo traite_rqt($rqt,"insert opac_map_holds_authority_color into parametres");
			}

			// AR - Ajout paramètre de la taille de la carte en saisie de recherche à l'OPAC
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_size_search_edition' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_size_search_edition', '800*480', 'Taille de la carte en saisie de recherche','map', 0)";
				echo traite_rqt($rqt,"insert opac_map_size_search_edition into parametres");
			}

			// AR - Ajout paramètre de la taille de la carte en résultat de recherche à l'OPAC
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_size_search_result' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_size_search_result', '800*480', 'Taille de la carte en résultat de recherche','map', 0)";
				echo traite_rqt($rqt,"insert opac_map_size_search_result into parametres");
			}
			// AR - Ajout paramètre de la taille de la carte en visualisation de notice à l'OPAC
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_size_notice_view' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_size_notice_view', '800*480', 'Taille de la carte en visualisation de notice','map', 0)";
				echo traite_rqt($rqt,"insert opac_map_size_notice_view into parametres");
			}

			// AR - Définition du fond de carte à l'OPAC
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_base_layer_type' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_base_layer_type', 'OSM', 'Fonds de carte à utiliser.\nValeurs possibles :\nOSM           => Open Street Map\nWMS           => The Web Map Server base layer type selector.\nGOOGLE        => Google\nARCGIS        =>The ESRI ARCGis base layer selector.\n','map', 0)";
				echo traite_rqt($rqt,"insert opac_map_base_layer_type into parametres");
			}
			// AR - Définition des paramètres du fond de carte à l'OPAC
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_base_layer_params' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_base_layer_params', '', 'Structure JSON à passer au fond de carte\nexemple :\n{\n \"name\": \"Nom du fond de carte\",\n \"url\": \"url du fond de carte\",\n \"options\":{\n  \"layers\": \"MONDE_MOD1\"\n }\n}','map', 0)";
				echo traite_rqt($rqt,"insert opac_map_base_layer_params into parametres");
			}

			// JP - Suggestions - Utilisateur : pouvoir être alerté en cas de nouvelle suggestion à l'OPAC
			$rqt = "ALTER TABLE users ADD user_alert_suggmail int(1) UNSIGNED NOT NULL DEFAULT 0";
			echo traite_rqt($rqt,"alter table users add user_alert_suggmail");

			// JP - Acquisitions - Sélection rubrique budgétaire en commande : pouvoir toutes les afficher
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'acquisition' and sstype_param='budget_show_all' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'acquisition', 'budget_show_all', '0', 'Sélection d\'une rubrique budgétaire en commande : toutes les afficher ?\n 0: Non (par pagination)\n 1: Oui.','',0)";
				echo traite_rqt($rqt,"insert budget_show_all = 0 into parametres");
			}


			// +-------------------------------------------------+
			echo "</table>";
			$rqt = "update parametres set valeur_param='".$action."' where type_param='pmb' and sstype_param='bdd_version' " ;
			$res = pmb_mysql_query($rqt, $dbh) ;
			echo "<strong><font color='#FF0000'>".$msg[1807]." ".number_format($action, 2, ',', '.')."%</font></strong><br />";
			$action=$action+$increment;
			//echo form_relance ("v5.18");
			//break;

//case "v5.18":
			echo "<table ><tr><th>".$msg['admin_misc_action']."</th><th>".$msg['admin_misc_resultat']."</th></tr>";
			// +-------------------------------------------------+

			//MB - Ajout index sur le nom des fichiers numériques pour accélérer la recherche
			$add_index=true;
			$req="SHOW INDEX FROM explnum";
			$res=pmb_mysql_query($req);
			if($res && pmb_mysql_num_rows($res)){
				while ($ligne = pmb_mysql_fetch_object($res)){
					if($ligne->Column_name == "explnum_nomfichier"){
						$add_index=false;
						break;
					}
				}
			}
			if($add_index){
				@set_time_limit(0);
				pmb_mysql_query("set wait_timeout=28800", $dbh);
				$rqt = "alter table explnum add index i_explnum_nomfichier(explnum_nomfichier(30))";
				echo traite_rqt($rqt,"alter table explnum add index i_explnum_nomfichier");
			}

			//JP - Ajout deux index sur les liens entre actes pour accélérer la recherche
			$rqt = "alter table liens_actes drop index i_num_acte";
			echo traite_rqt($rqt,"alter table liens_actes drop index i_num_acte");
			$rqt = "alter table liens_actes add index i_num_acte(num_acte)";
			echo traite_rqt($rqt,"alter table liens_actes add index i_num_acte");

			$rqt = "alter table liens_actes drop index i_num_acte_lie";
			echo traite_rqt($rqt,"alter table liens_actes drop index i_num_acte_lie");
			$rqt = "alter table liens_actes add index i_num_acte_lie(num_acte_lie)";
			echo traite_rqt($rqt,"alter table liens_actes add index i_num_acte_lie");

			//JP - Modification taille du champ mailtpl_tpl de la table mailtpl
			$rqt ="alter table mailtpl MODIFY mailtpl_tpl MEDIUMTEXT NOT NULL";
			echo traite_rqt($rqt,"alter table mailtpl modify mailtpl_tpl mediumtext");

			//JP - Nettoyage des catégories sans libellé
			$rqt ="DELETE FROM categories WHERE libelle_categorie=''";
			echo traite_rqt($rqt,"Delete categories sans libellé");

			// JP - Abonnements - nom du périodique par défaut en création d'abonnement
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='abt_label_perio' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
							VALUES (0, 'pmb', 'abt_label_perio', '0', 'Création d\'un abonnement : reprendre le nom du périodique ?\n 0: Non \n 1: Oui.','',0)";
				echo traite_rqt($rqt,"insert pmb_abt_label_perio = 0 into parametres");
			}

			// JP - Acquisitions - afficher le nom de l'abonnement dans les lignes de la commande
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'acquisition' and sstype_param='show_abt_in_cmde' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
						VALUES (0, 'acquisition', 'show_abt_in_cmde', '0', 'Afficher l\'abonnement dans les lignes de la commande ?\n 0: Non \n 1: Oui.','',0)";
				echo traite_rqt($rqt,"insert acquisition_show_abt_in_cmde = 0 into parametres");
			}

			// NG - Nomenclature: Familles
			$rqt = "CREATE TABLE if not exists nomenclature_families (
					id_family int unsigned NOT NULL auto_increment,
					family_name varchar(255) NOT NULL DEFAULT '',
					family_order int unsigned NOT NULL DEFAULT 0,
					PRIMARY KEY (id_family))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_families");

			// NG - Nomenclature: pupitres
			$rqt = "CREATE TABLE if not exists nomenclature_musicstands (
					id_musicstand int unsigned NOT NULL auto_increment,
					musicstand_name varchar(255) NOT NULL DEFAULT '',
					musicstand_famille_num int unsigned NOT NULL DEFAULT 0,
					musicstand_division int unsigned NOT NULL DEFAULT 0,
					musicstand_order int unsigned NOT NULL DEFAULT 0,
					musicstand_workshop int unsigned NOT NULL DEFAULT 0,
					PRIMARY KEY (id_musicstand))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_musicstands");

			// NG - Nomenclature: instruments
			$rqt = "CREATE TABLE if not exists nomenclature_instruments (
					id_instrument int unsigned NOT NULL auto_increment,
					instrument_code varchar(255) NOT NULL DEFAULT '',
					instrument_name varchar(255) NOT NULL DEFAULT '',
					instrument_musicstand_num int unsigned NOT NULL DEFAULT 0,
					instrument_standard int unsigned NOT NULL DEFAULT 0,
					PRIMARY KEY (id_instrument))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_instruments");

			//NG - Nomenclature: Formations
			$rqt = "CREATE TABLE if not exists nomenclature_formations (
					id_formation int unsigned NOT NULL auto_increment,
					formation_name varchar(255) NOT NULL DEFAULT '',
					formation_nature int unsigned NOT NULL DEFAULT 0,
					formation_order int unsigned NOT NULL DEFAULT 0,
					PRIMARY KEY (id_formation))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_formations");

			// NG - Nomenclature: Types
			$rqt = "CREATE TABLE if not exists nomenclature_types (
					id_type int unsigned NOT NULL auto_increment,
					type_name varchar(255) NOT NULL DEFAULT '',
					type_formation_num int unsigned NOT NULL DEFAULT 0,
					type_order int unsigned NOT NULL DEFAULT 0,
					PRIMARY KEY (id_type))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_types");

			// NG - Nomenclature: voix
			$rqt = "CREATE TABLE if not exists nomenclature_voices (
				id_voice int unsigned NOT NULL auto_increment,
				voice_code varchar(255) NOT NULL DEFAULT '',
				voice_name varchar(255) NOT NULL DEFAULT '',
				voice_order int unsigned NOT NULL DEFAULT 0,
				PRIMARY KEY (id_voice))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_voices");

			// NG - Nomenclature: Formations dans les notices
			$rqt = "CREATE TABLE if not exists nomenclature_notices_nomenclatures (
				id_notice_nomenclature int unsigned NOT NULL auto_increment,
				notice_nomenclature_num_notice int unsigned NOT NULL DEFAULT 0,
				notice_nomenclature_num_formation int unsigned NOT NULL DEFAULT 0,
				notice_nomenclature_num_type int unsigned NOT NULL DEFAULT 0,
				notice_nomenclature_label varchar(255) NOT NULL DEFAULT '',
				notice_nomenclature_abbreviation TEXT NOT NULL ,
				notice_nomenclature_notes TEXT NOT NULL,
				notice_nomenclature_order int unsigned NOT NULL DEFAULT 0,
				PRIMARY KEY (id_notice_nomenclature))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_notices_nomenclatures");

			// NG - Nomenclature: Ateliers des formations de la notice
			$rqt = "CREATE TABLE if not exists nomenclature_workshops (
				id_workshop int unsigned NOT NULL auto_increment,
				workshop_label varchar(255) NOT NULL DEFAULT '',
				workshop_num_nomenclature int unsigned NOT NULL DEFAULT 0,
				workshop_order int unsigned NOT NULL DEFAULT 0,
				PRIMARY KEY (id_workshop))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_workshops");

			// NG - Nomenclature: Instruments des ateliers de la notice
			$rqt = "CREATE TABLE if not exists nomenclature_workshops_instruments (
				id_workshop_instrument int unsigned NOT NULL auto_increment,
				workshop_instrument_num_workshop int unsigned NOT NULL DEFAULT 0,
				workshop_instrument_num_instrument int unsigned NOT NULL DEFAULT 0,
				workshop_instrument_number int unsigned NOT NULL DEFAULT 0,
				workshop_instrument_order int unsigned NOT NULL DEFAULT 0,
				PRIMARY KEY (id_workshop_instrument))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_workshops_instruments");

			// NG - Nomenclature: Instruments non standards de la formation de la notice
			$rqt = "CREATE TABLE if not exists nomenclature_exotic_instruments (
				id_exotic_instrument int unsigned NOT NULL auto_increment,
				exotic_instrument_num_nomenclature int unsigned NOT NULL DEFAULT 0,
				exotic_instrument_num_instrument int unsigned NOT NULL DEFAULT 0,
				exotic_instrument_number int unsigned NOT NULL DEFAULT 0,
				exotic_instrument_order int unsigned NOT NULL DEFAULT 0,
				PRIMARY KEY (id_exotic_instrument))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_exotic_instruments");


			// NG - Nomenclature: Instruments non standards autres de la formation de la notice
			$rqt = "CREATE TABLE if not exists nomenclature_exotic_other_instruments (
				id_exotic_other_instrument int unsigned NOT NULL auto_increment,
				exotic_other_instrument_num_exotic_instrument int unsigned NOT NULL DEFAULT 0,
				exotic_other_instrument_num_instrument int unsigned NOT NULL DEFAULT 0,
				exotic_other_instrument_order int unsigned NOT NULL DEFAULT 0,
				PRIMARY KEY (id_exotic_other_instrument))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_exotic_other_instruments");

			// NG - Nomenclature: notices filles
			$rqt = "CREATE TABLE if not exists nomenclature_children_records (
				child_record_num_record int unsigned NOT NULL DEFAULT 0,
				child_record_num_formation int unsigned NOT NULL DEFAULT 0,
				child_record_num_type int unsigned NOT NULL DEFAULT 0,
				child_record_num_musicstand int unsigned NOT NULL DEFAULT 0,
				child_record_num_instrument int unsigned NOT NULL DEFAULT 0,
				child_record_effective int unsigned NOT NULL DEFAULT 0,
				child_record_order int unsigned NOT NULL DEFAULT 0,
				child_record_other varchar(255) NOT NULL DEFAULT '',
				child_record_num_voice int unsigned NOT NULL DEFAULT 0,
				child_record_num_workshop int unsigned NOT NULL DEFAULT 0,
				PRIMARY KEY (child_record_num_record))";
			echo traite_rqt($rqt,"CREATE TABLE nomenclature_children_records");

			// NG - Ajout paramètre pour identifier le type de relation entre une notice de nomenclature et ses notices filles
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='nomenclature_record_children_link' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'nomenclature_record_children_link', '', 'Type de relation entre une notice de nomenclature et ses notices filles.','', 0)";
				echo traite_rqt($rqt,"insert pmb_nomenclature_record_children_link");
			}

			// NG - Ajout paramètre pour activer les nomenclatures
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='nomenclature_activate' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'nomenclature_activate', '0', 'Activation des nomenclatures:\n 0 : non \n 1 : oui','', 0)";
				echo traite_rqt($rqt,"insert pmb_nomenclature_activate into parametres");
			}

			//MHo - Augmentation de la taille du champ pour les titres_uniformes
			$rqt = "ALTER TABLE titres_uniformes MODIFY tu_sujet TEXT NOT NULL";
			echo traite_rqt($rqt,"ALTER TABLE titres_uniformes MODIFY tu_sujet TEXT NOT NULL");

			// MB - Affichage liste des bulletins - Modification explication du paramètre
			$rqt = "UPDATE parametres SET comment_param='Fonction d\'affichage de la liste des bulletins d\'un périodique\nValeurs possibles:\naffichage_liste_bulletins_normale (Si paramètre vide)\naffichage_liste_bulletins_tableau\naffichage_liste_bulletins_depliable' WHERE type_param= 'opac' and sstype_param='fonction_affichage_liste_bull'";
			echo traite_rqt($rqt,"UPDATE parametres opac_fonction_affichage_liste_bull");

			// VT & DG - Création des tables de veilles
			$rqt="create table if not exists docwatch_watches(
				id_watch int unsigned not null auto_increment primary key,
				watch_title varchar(255) not null default '',
				watch_owner int unsigned not null default 0,
				watch_allowed_users varchar(255) not null default '',
				watch_num_category int unsigned not null default 0,
				watch_last_date datetime,
				watch_ttl int unsigned not null default 0,
				index i_docwatch_watch_title(watch_title)
				)";
			echo traite_rqt($rqt, "create table docwatch_watches");

			$rqt="create table if not exists docwatch_datasources(
				id_datasource int unsigned not null auto_increment primary key,
				datasource_type varchar(255) not null default '',
				datasource_title varchar(255) not null default '',
				datasource_ttl int unsigned not null default 0,
				datasource_last_date datetime,
				datasource_parameters mediumtext not null,
				datasource_num_category int unsigned not null default 0,
				datasource_default_interesting int unsigned not null default 0,
				datasource_num_watch int unsigned not null default 0,
				index i_docwatch_datasource_title(datasource_title)
				)";
			echo traite_rqt($rqt, "create table docwatch_datasources");

			$rqt="create table if not exists docwatch_selectors (
				id_selector int unsigned not null auto_increment primary key,
				selector_type varchar(255) not null default '',
				selector_num_datasource int unsigned not null default 0,
				selector_parameters mediumtext not null
				)";
			echo traite_rqt($rqt, "create table docwatch_selectors");

			$rqt="create table if not exists docwatch_items(
				id_item int unsigned not null auto_increment primary key,
				item_type varchar(255) not null default '',
				item_title varchar(255) not null default '',
				item_summary mediumtext not null,
				item_content mediumtext not null,
				item_added_date datetime,
				item_publication_date datetime,
				item_hash varchar(255) not null default '',
				item_url varchar(255) not null default '',
				item_logo_url varchar(255) not null default '',
				item_status int unsigned not null default 0,
				item_interesting int unsigned not null default 0,
				item_num_article int unsigned not null default 0,
				item_num_section int unsigned not null default 0,
				item_num_notice int unsigned not null default 0,
				item_num_datasource int unsigned not null default 0,
				item_num_watch int unsigned not null default 0,
				index i_docwatch_item_type(item_type),
				index i_docwatch_item_title(item_title),
				index i_docwatch_item_num_article(item_num_article),
				index i_docwatch_item_num_section(item_num_section),
				index i_docwatch_item_num_notice(item_num_notice),
				index i_docwatch_item_num_watch(item_num_watch)
				)";
			echo traite_rqt($rqt, "create table docwatch_items");

			$rqt="create table if not exists docwatch_items_descriptors(
				num_item int unsigned not null default 0,
				num_noeud int unsigned not null default 0,
				primary key (num_item, num_noeud)
				)";
			echo traite_rqt($rqt, "create table docwatch_items_descriptors");

			$rqt="create table if not exists docwatch_categories(
				id_category int unsigned not null auto_increment primary key,
				category_title varchar(255) not null default '',
				category_num_parent int unsigned not null default 0
				)";
			echo traite_rqt($rqt, "create table docwatch_categories");

			$rqt="create table if not exists docwatch_items_tags(
				num_item int unsigned not null default 0,
				num_tag int unsigned not null default 0,
				primary key (num_item, num_tag)
				)";
			echo traite_rqt($rqt, "create table docwatch_items_tags");

			$rqt="create table if not exists docwatch_tags(
				id_tag int unsigned not null auto_increment primary key,
				tag_title varchar(255) not null default ''
				)";
			echo traite_rqt($rqt, "create table docwatch_tags");

			$rqt = "ALTER TABLE docwatch_watches ADD watch_desc text NOT NULL" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_watches ADD watch_desc ");

			$rqt = "ALTER TABLE docwatch_watches ADD watch_logo_url varchar(255) NOT NULL default ''" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_watches ADD watch_logo_url ");

			$rqt = "ALTER TABLE docwatch_watches ADD watch_record_default_type char(2) not null default 'a'" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_watches ADD watch_record_default_type ");

			$rqt = "ALTER TABLE docwatch_watches ADD watch_record_default_status int unsigned not null default 0" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_watches ADD watch_record_default_status ");

			$rqt = "ALTER TABLE docwatch_watches ADD watch_article_default_parent int unsigned not null default 0" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_watches ADD watch_article_default_parent");

			$rqt = "ALTER TABLE docwatch_watches ADD watch_article_default_content_type int unsigned not null default 0" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_watches ADD watch_article_default_content_type ");

			$rqt = "ALTER TABLE docwatch_watches ADD watch_article_default_publication_status int unsigned not null default 0" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_watches ADD watch_article_default_content_publication_status ");

			$rqt = "ALTER TABLE docwatch_watches ADD watch_section_default_parent int unsigned not null default 0" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_watches ADD watch_section_default_parent");

			$rqt = "ALTER TABLE docwatch_watches ADD watch_section_default_content_type int unsigned not null default 0" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_watches ADD watch_section_default_content_type ");

			$rqt = "ALTER TABLE docwatch_watches ADD watch_section_default_publication_status int unsigned not null default 0" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_watches ADD watch_section_default_content_publication_status ");

			// NG - Demandes: Ajout d'un paramètre permettant de saisir un email générique pour la gestion des demanades
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'demandes' and sstype_param='email_generic' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
				VALUES (0, 'demandes', 'email_generic', '',
				'Information par un email générique de l\'évolution des demandes.\n 1,adrmail@mail.fr : Envoi une copie uniquement pour toutes les nouvelles demandes\n 2,adrmail@mail.fr : Envoi une copie uniquement des mails envoyés aux personnes affectées\n 3,adrmail@mail.fr : Envoi une copie dans les 2 cas précédents\n ',
				'',0) ";
				echo traite_rqt($rqt, "insert demandes_email_generic into parameters");
			}

			// NG - Demandes: Ajout d'un paramètre permettant d'afficher le format simplifié en Opac
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='demandes_affichage_simplifie' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
				VALUES (0, 'opac', 'demandes_affichage_simplifie', '0',
				'Active le format simplifié des demandes en Opac:\n 0 : non \n 1 : oui',
				'a_general',0) ";
				echo traite_rqt($rqt, "insert opac_demandes_affichage_simplifie into parameters");
			}

			// NG - Demandes: Ajout d'un paramètre permettant d'interdire l'ajout d'une action en Opac
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='demandes_no_action' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
				VALUES (0, 'opac', 'demandes_no_action', '0',
				'Interdire l\'ajout d\'une action en Opac:\n 0 : non \n 1 : oui',
				'a_general',0) ";
				echo traite_rqt($rqt, "insert opac_demandes_no_action into parameters");
			}

			// NG - Demandes: lien entre la note générant la réponse finale d'une demande
			$rqt = "ALTER TABLE demandes ADD demande_note_num int unsigned not null default 0" ;
			echo traite_rqt($rqt,"ALTER TABLE demandes ADD demande_note_num ");

			//JP - Modification de la longueur du champ email de la table coordonnees
			$rqt = "ALTER TABLE coordonnees MODIFY email varchar(255) NOT NULL default '' ";
			echo traite_rqt($rqt,"alter table coordonnees modify email");

			// DG - Veilles : Option pour nettoyer le contenu HTML des nouveaux éléments
			$rqt = "ALTER TABLE docwatch_datasources ADD datasource_clean_html int unsigned not null default 1 after datasource_default_interesting" ;
			echo traite_rqt($rqt,"ALTER TABLE docwatch_datasources ADD datasource_clean_html ");

			// VT - Ajout paramètre pour definir le ratio minimum d'une emprise pour qu'elle s'affiche
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_hold_ratio_min' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_hold_ratio_min', '4', 'Ratio minimum d\'occupation en pourcentage d\'une emprise pour s\'afficher','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_hold_ratio_min into parametres");
			}

			// VT - Ajout paramètre pour definir le ratio maximum d'une emprise pour qu'elle s'affiche
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_hold_ratio_max' "))==0){
			$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_hold_ratio_max', '75', 'Ratio maximum d\'occupation en pourcentage d\'une emprise pour s\'afficher','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_hold_ratio_max into parametres");
			}

			// VT - Ajout paramètre pour definir le rapport de distance entre deux points pour qu'ils soit aggrégés ensembles
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='map_hold_distance' "))==0){
					$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'map_hold_distance', '10', 'Rapport de distance entre deux points pour les agréger','map', 0)";
				echo traite_rqt($rqt,"insert pmb_map_hold_distance into parametres");
			}

			// VT - Creation table de correspondance contenant les aires des différentes emprises de la base
			$rqt="create table if not exists map_hold_areas as (select map_emprise_id as id_obj, map_emprise_type as type_obj, Area(map_emprise_data) as area, Area(envelope(map_emprise_data)) as bbox_area, AsText(Centroid(envelope(map_emprise_data))) as center from map_emprises)";
			echo traite_rqt($rqt, "create table map_hold_areas");

			//VT - Verification de l'existance de la clé primaire (création si non-existante)
			if (pmb_mysql_num_rows(pmb_mysql_query("show keys from map_hold_areas where column_name = 'id_obj' "))==0){
				$rqt="alter table map_hold_areas add primary key(id_obj)";
				echo traite_rqt($rqt, "alter table map_hold_areas add primary key");
			}

			//NG - ajout pied de page dans template de la fiche de circulation
			$rqt = "ALTER TABLE serialcirc_tpl ADD serialcirctpl_piedpage text NOT NULL ";
			echo traite_rqt($rqt,"alter table serialcirc_tpl add serialcirctpl_piedpage");

			// AP - Ajout de la recherche dans les concepts
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='modules_search_concept' "))==0) {
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
				VALUES (0, 'opac', 'modules_search_concept', '0', 'Recherche dans les concepts : \n 0 : interdite, \n 1 : autorisée, \n 2 : autorisée et validée par défaut', 'c_recherche', 0) ";
				echo traite_rqt($rqt, "insert opac_modules_search_concept into parameters");
			}

			// VT - Ajout paramètre pour definir le ratio minimum d'une emprise pour qu'elle s'affiche (opac)
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_hold_ratio_min' "))==0) {
				$rqt = "INSERT INTO parametres (type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
				VALUES ('opac', 'map_hold_ratio_min', '4', 'Ratio minimum d\'occupation en pourcentage d\'une emprise pour s\'afficher', 'map', 0) ";
				echo traite_rqt($rqt, "insert opac_map_hold_ratio_min into parametres");
			}

			// VT - Ajout paramètre pour definir le ratio maximum d'une emprise pour qu'elle s'affiche (opac)
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_hold_ratio_max' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_hold_ratio_max', '75', 'Ratio maximum d\'occupation en pourcentage d\'une emprise pour s\'afficher','map', 0)";
				echo traite_rqt($rqt,"insert opac_map_hold_ratio_max into parametres");
			}

			// VT - Ajout paramètre pour definir le rapport de distance entre deux points pour qu'ils soit aggrégés ensembles (opac)
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='map_hold_distance' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'opac', 'map_hold_distance', '10', 'Rapport de distance entre deux points pour les agréger','map', 0)";
				echo traite_rqt($rqt,"insert opac_map_hold_distance into parametres");
			}

			// VT - Ajout d'un index sur la colonne map_emprise_obj_num de la table map_emprises
			$rqt="alter table map_emprises add index i_map_emprise_obj_num(map_emprise_obj_num)";
			echo traite_rqt($rqt, "alter table map_emprises add index i_map_emprise_obj_num");

			// JP - Ajout champ de classement sur étagères et paniers
			$rqt = "ALTER TABLE caddie ADD caddie_classement varchar(255) NOT NULL default ''" ;
			echo traite_rqt($rqt,"ALTER TABLE caddie ADD caddie_classement ");

			$rqt = "ALTER TABLE empr_caddie ADD empr_caddie_classement varchar(255) NOT NULL default ''" ;
			echo traite_rqt($rqt,"ALTER TABLE empr_caddie ADD empr_caddie_classement ");

			$rqt = "ALTER TABLE etagere ADD etagere_classement varchar(255) NOT NULL default ''" ;
			echo traite_rqt($rqt,"ALTER TABLE etagere ADD etagere_classement ");

			// MB - LDAP gestion de l'encodage lors de l'import
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'ldap' and sstype_param='encoding_utf8' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'ldap', 'encoding_utf8', '0', 'Les informations du LDAP sont en utf-8 ?\n 0: Non \n 1: Oui.','',0)";
				echo traite_rqt($rqt,"insert ldap_encoding_utf8 = 0 into parametres");
			}

			// +-------------------------------------------------+
			echo "</table>";
			$rqt = "update parametres set valeur_param='".$action."' where type_param='pmb' and sstype_param='bdd_version' " ;
			$res = pmb_mysql_query($rqt, $dbh) ;
			echo "<strong><font color='#FF0000'>".$msg[1807]." ".number_format($action, 2, ',', '.')."%</font></strong><br />";
			$action=$action+$increment;
			//echo form_relance ("v5.19");
			//break;

//case "v5.19":
			echo "<table ><tr><th>".$msg['admin_misc_action']."</th><th>".$msg['admin_misc_resultat']."</th></tr>";
			// +-------------------------------------------------+

			//DG - Code Javascript d'analyse d'audience
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='script_analytics' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'opac', 'script_analytics', '', 'Code Javascript d\'analyse d\'audience (Par exemple pour Google Analytics, XiTi,..).','a_general',0)";
				echo traite_rqt($rqt,"insert opac_script_analytics into parametres");
			}

			//DG - Accessibilité OPAC : Paramètre d'activation
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='accessibility' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'opac', 'accessibility', '1', 'Accessibilité activée.\n 0 : Non.\n 1 : Oui.','a_general',0)";
				echo traite_rqt($rqt,"insert opac_accessibility = 1 into parametres");
			}

			//JP - Renseigner les champs d'exemplaires transfert_location_origine et transfert_statut_origine pour les statistiques et si ils ne le sont pas déjà (ajout sur la requête en v5.17)
			$rqt = "UPDATE exemplaires SET transfert_location_origine=expl_location, update_date=update_date  WHERE transfert_location_origine=0 AND expl_id NOT IN (SELECT num_expl FROM transferts_demande JOIN transferts ON (num_transfert=id_transfert AND etat_transfert=0))";
			echo traite_rqt($rqt,"update exemplaires transfert_location_origine");

			$rqt = "UPDATE exemplaires SET transfert_statut_origine=expl_statut, update_date=update_date  WHERE transfert_statut_origine=0 AND expl_id NOT IN (SELECT num_expl FROM transferts_demande JOIN transferts ON (num_transfert=id_transfert AND etat_transfert=0))";
			echo traite_rqt($rqt,"update exemplaires transfert_statut_origine");

			// NG - Ajout paramètre indiquant la durée en jours de conservation des notices en tant que nouveauté
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='newrecord_timeshift' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
				VALUES ( 'pmb', 'newrecord_timeshift', '0', 'Nombre de jours de conservation des notices en tant que nouveauté.','', 0)";
				echo traite_rqt($rqt,"insert pmb_newrecord_timeshift");
			}

			// Création shorturls
			$rqt="create table if not exists shorturls (
				id_shorturl int unsigned not null auto_increment primary key,
				shorturl_hash varchar(255) not null default '',
				shorturl_last_access datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
				shorturl_context text not null,
				shorturl_type varchar(255) not null default '',
				shorturl_action varchar(255) not null default ''
			)";
			echo traite_rqt($rqt,"create table shorturls");

			// NG - Nouveautés
			$rqt = "ALTER TABLE notices ADD notice_is_new int unsigned not null default 0" ;
			echo traite_rqt($rqt,"ALTER TABLE notices ADD notice_is_new ");

			$rqt = "ALTER TABLE notices ADD notice_date_is_new  datetime NOT NULL DEFAULT '0000-00-00 00:00:00'" ;
			echo traite_rqt($rqt,"ALTER TABLE notices ADD notice_date_is_new ");

			// VT - Modif du paramètre map_max_holds en gestion (ajout d'un parametre en plus, update du commentaire) le tout en gardant la valeur precedente
			if (pmb_mysql_num_rows(pmb_mysql_query("select valeur_param from parametres where type_param= 'pmb' and sstype_param='map_max_holds' and valeur_param not like '%,%'"))!=0){
				$rqt="update parametres set valeur_param=concat(valeur_param,',0'), comment_param='Dans l\'ordre donné séparé par une virgule: Nombre limite d\'emprises affichées, mode de clustering \nValeurs possibles pour le mode :\n\n0 => Clustering standard avec augmentation dynamique des seuils jusqu\'a atteindre le nombre maximum d\'emprises affichées\n\n1 => Clusterisation de toutes les emprises' where type_param like 'pmb' and sstype_param like 'map_max_holds'";
				echo traite_rqt($rqt, "update parametres map_max_holds gestion");
			}

			// VT - Modif du paramètre map_max_holds en opac (ajout d'un parametre en plus, update du commentaire) le tout en gardant la valeur precedente
			if (pmb_mysql_num_rows(pmb_mysql_query("select valeur_param from parametres where type_param= 'opac' and sstype_param='map_max_holds' and valeur_param not like '%,%'"))!=0){
				$rqt="update parametres set valeur_param=concat(valeur_param,',0'), comment_param='Dans l\'ordre donné séparé par une virgule: Nombre limite d\'emprises affichées, mode de clustering \nValeurs possibles pour le mode :\n\n0 => Clustering standard avec augmentation dynamique des seuils jusqu\'a atteindre le nombre maximum d\'emprises affichées\n\n1 => Clusterisation de toutes les emprises' where type_param like 'opac' and sstype_param like 'map_max_holds'";
				echo traite_rqt($rqt, "update parametres map_max_holds opac");
			}

			// DB - Modification de la table resa_planning (ajout de previsions sur bulletins)
			$rqt = "alter table resa_planning add resa_idbulletin int(8) unsigned default '0' not null after resa_idnotice";
			echo traite_rqt($rqt,"alter resa_planning add resa_idbulletin ");

			//JP - Section origine pour les transferts
			$rqt = "ALTER TABLE exemplaires ADD transfert_section_origine SMALLINT(5) NOT NULL default '0'" ;
			echo traite_rqt($rqt,"ALTER TABLE exemplaires ADD transfert_section_origine ");

			$rqt = "UPDATE exemplaires SET transfert_section_origine=expl_section, update_date=update_date WHERE transfert_section_origine=0 AND expl_id NOT IN (SELECT num_expl FROM transferts_demande JOIN transferts ON (num_transfert=id_transfert AND etat_transfert=0))";
			echo traite_rqt($rqt,"update exemplaires transfert_section_origine");

			//AP Modification du commentaire d'opac_notices_format : Ajout des templates django
			$rqt = "update parametres set comment_param='Format d\'affichage des notices en résultat de recherche\n 0 : Utiliser le paramètre notices_format_onglets\n 1 : ISBD seul\n 2 : Public seul \n4 : ISBD et Public\n 5 : ISBD et Public avec ISBD en premier \n8 : Réduit (titre+auteurs) seul\n 9 : Templates django (Spécifier le nom du répertoire dans le paramètre notices_format_django_directory)' where type_param= 'opac' and sstype_param='notices_format' ";
			echo traite_rqt($rqt,"update opac_notices_format into parametres");

			// AP - Ajout paramètre indiquant le nom du répertoire des templates django à utiliser en affichage de notice
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='notices_format_django_directory' "))==0){
				$rqt = "INSERT INTO parametres ( type_param, sstype_param, valeur_param, comment_param,section_param,gestion)
					VALUES ( 'opac', 'notices_format_django_directory', '', 'Nom du répertoire de templates django à utiliser en affichage de notice.\nLaisser vide pour utiliser le common.','e_aff_notice', 0)";
				echo traite_rqt($rqt,"insert notices_format_django_directory into parametres");
			}

			//MB: Ajouter une PK aux tables de vue
			$res=pmb_mysql_query("SHOW TABLES LIKE 'opac_view_notices_%'");
			if($res && pmb_mysql_num_rows($res)){
				while ($r=pmb_mysql_fetch_array($res)){
					$rqt = "ALTER TABLE ".$r[0]." DROP INDEX opac_view_num_notice" ;
					echo traite_rqt($rqt,"ALTER TABLE ".$r[0]." DROP INDEX opac_view_num_notice ");

					$rqt = "ALTER TABLE ".$r[0]." DROP PRIMARY KEY";
					echo traite_rqt($rqt, "ALTER TABLE ".$r[0]." DROP PRIMARY KEY");

					$rqt = "ALTER TABLE ".$r[0]." ADD PRIMARY KEY (opac_view_num_notice)";
					echo traite_rqt($rqt, "ALTER TABLE ".$r[0]." ADD PRIMARY KEY");
				}
			}

			//DG - Paramètre OPAC : Autoriser le téléchargement des documents numériques
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='allow_download_docnums' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'opac', 'allow_download_docnums', '1', 'Autoriser le téléchargement des documents numériques.\n 0 : Non.\n 1 : Individuellement (un par un).\n 2 : Archive ZIP.','a_general',0)";
				echo traite_rqt($rqt,"insert opac_allow_download_docnums = 1 into parametres");
			}

			//AB - Le nom du fichier de paramétrage du selecteur d'affichage de notice
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='notices_display_modes' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'opac', 'notices_display_modes', '', 'Nom du fichier xml de paramétrage du choix du mode d\'affichage des notices à l\'OPAC.\nPar défaut : display_modes_exemple.xml dans /opac_css/includes/records/','d_aff_recherche',0)";
				echo traite_rqt($rqt,"insert opac_notices_display_modes='' into parametres");
			}

			//DG - Lien pour en savoir plus sur l'utilisation des cookies et des traceurs
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='url_more_about_cookies' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'opac', 'url_more_about_cookies', '', 'Lien pour en savoir plus sur l\'utilisation des cookies et des traceurs','a_general',0)";
				echo traite_rqt($rqt,"insert opac_url_more_about_cookies into parametres");
			}

			//DG - MAJ du template de bannettes par défaut (identifiant 1)
			$rqt = "UPDATE bannette_tpl SET bannettetpl_tpl='{{info.header}}\r\n<br /><br />\r\n<div class=\"summary\">\r\n{% for sommaire in sommaires %}\r\n<a href=\"#[{{sommaire.level}}]\">\r\n{{sommaire.level}} - {{sommaire.title}}\r\n</a>\r\n<br />\r\n{% endfor %}\r\n</div>\r\n<hr>\r\n{% for sommaire in sommaires %}\r\n<a name=\"[{{sommaire.level}}]\" />\r\n<h1>{{sommaire.level}} - {{sommaire.title}}</h1>\r\n{% for record in sommaire.records %}\r\n{{record.render}}\r\n<hr>\r\n{% endfor %}\r\n<br />\r\n{% endfor %}\r\n{{info.footer}}'
					WHERE bannettetpl_id=1";
			echo traite_rqt($rqt,"ALTER minimum into bannette_tpl");

			// DB - Modification de la table resa_planning (prévisions localisées)
			$rqt = "alter table resa_planning add resa_loc_retrait int(5) unsigned not null default 0 ";
			echo traite_rqt($rqt,"alter resa_planning add resa_loc_retrait ");

			// JP - Ajout champ demande abonnement sur périodique
			$rqt = "ALTER TABLE notices ADD opac_serialcirc_demande TINYINT UNSIGNED NOT NULL DEFAULT 1";
			echo traite_rqt($rqt,"ALTER TABLE notices ADD opac_serialcirc_demande") ;

			// JP - Ajout champ de classement sur infopages
			$rqt = "ALTER TABLE infopages ADD infopage_classement varchar(255) NOT NULL default ''" ;
			echo traite_rqt($rqt,"ALTER TABLE infopages ADD infopage_classement ");

			// JP - Ajout autorisations sur recherches prédéfinies gestion
			$rqt = "ALTER TABLE search_perso ADD autorisations MEDIUMTEXT NULL DEFAULT NULL ";
			echo traite_rqt($rqt,"ALTER TABLE search_perso ADD autorisations") ;

			$rqt = "UPDATE search_perso SET autorisations=num_user ";
			echo traite_rqt($rqt,"UPDATE autorisations INTO search_perso");

			//VT - Paramètre OPAC : Definition du chemin des templates d'autorités en OPAC
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='authorities_templates_folder' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'opac', 'authorities_templates_folder', './includes/templates/authorities/common', 'Repertoire des templates utilisés pour l\'affichage des autorités en OPAC','',1)";
				echo traite_rqt($rqt,"insert opac_authorities_templates_folder = ./includes/templates/authorities/common into parametres");
			}

			// JP - template par défaut pour les bannettes privées
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'dsi' and sstype_param='private_bannette_notices_template' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
			VALUES (0, 'dsi', 'private_bannette_notices_template', '0', 'Id du template de notice utilisé par défaut en diffusion de bannettes privées. Si vide ou à 0, le template classique est utilisé.', '', 0)";
				echo traite_rqt($rqt, "insert private_bannette_notices_template into parameters");
			}

			// JP - ajout index manquants sur tables de champs persos
			$rqt = "ALTER TABLE author_custom_values DROP INDEX i_acv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_acv_st");
			$rqt = "ALTER TABLE author_custom_values ADD INDEX i_acv_st(author_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE author_custom_values ADD INDEX i_acv_st");

			$rqt = "ALTER TABLE author_custom_values DROP INDEX i_acv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_acv_t");
			$rqt = "ALTER TABLE author_custom_values ADD INDEX i_acv_t(author_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE author_custom_values ADD INDEX i_acv_t");

			$rqt = "ALTER TABLE author_custom_values DROP INDEX i_acv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_acv_i");
			$rqt = "ALTER TABLE author_custom_values ADD INDEX i_acv_i(author_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE author_custom_values ADD INDEX i_acv_i");

			$rqt = "ALTER TABLE author_custom_values DROP INDEX i_acv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_acv_d");
			$rqt = "ALTER TABLE author_custom_values ADD INDEX i_acv_d(author_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE author_custom_values ADD INDEX i_acv_d");

			$rqt = "ALTER TABLE author_custom_values DROP INDEX i_acv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_acv_f");
			$rqt = "ALTER TABLE author_custom_values ADD INDEX i_acv_f(author_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE author_custom_values ADD INDEX i_acv_f");

			$rqt = "ALTER TABLE authperso_custom_values DROP INDEX i_acv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_acv_st");
			$rqt = "ALTER TABLE authperso_custom_values ADD INDEX i_acv_st(authperso_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE authperso_custom_values ADD INDEX i_acv_st");

			$rqt = "ALTER TABLE authperso_custom_values DROP INDEX i_acv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_acv_t");
			$rqt = "ALTER TABLE authperso_custom_values ADD INDEX i_acv_t(authperso_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE authperso_custom_values ADD INDEX i_acv_t");

			$rqt = "ALTER TABLE authperso_custom_values DROP INDEX i_acv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_acv_i");
			$rqt = "ALTER TABLE authperso_custom_values ADD INDEX i_acv_i(authperso_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE authperso_custom_values ADD INDEX i_acv_i");

			$rqt = "ALTER TABLE authperso_custom_values DROP INDEX i_acv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_acv_d");
			$rqt = "ALTER TABLE authperso_custom_values ADD INDEX i_acv_d(authperso_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE authperso_custom_values ADD INDEX i_acv_d");

			$rqt = "ALTER TABLE authperso_custom_values DROP INDEX i_acv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_acv_f");
			$rqt = "ALTER TABLE authperso_custom_values ADD INDEX i_acv_f(authperso_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE authperso_custom_values ADD INDEX i_acv_f");

			$rqt = "ALTER TABLE categ_custom_values DROP INDEX i_ccv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_st");
			$rqt = "ALTER TABLE categ_custom_values ADD INDEX i_ccv_st(categ_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE categ_custom_values ADD INDEX i_ccv_st");

			$rqt = "ALTER TABLE categ_custom_values DROP INDEX i_ccv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_t");
			$rqt = "ALTER TABLE categ_custom_values ADD INDEX i_ccv_t(categ_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE categ_custom_values ADD INDEX i_ccv_t");

			$rqt = "ALTER TABLE categ_custom_values DROP INDEX i_ccv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_i");
			$rqt = "ALTER TABLE categ_custom_values ADD INDEX i_ccv_i(categ_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE categ_custom_values ADD INDEX i_ccv_i");

			$rqt = "ALTER TABLE categ_custom_values DROP INDEX i_ccv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_d");
			$rqt = "ALTER TABLE categ_custom_values ADD INDEX i_ccv_d(categ_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE categ_custom_values ADD INDEX i_ccv_d");

			$rqt = "ALTER TABLE categ_custom_values DROP INDEX i_ccv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_f");
			$rqt = "ALTER TABLE categ_custom_values ADD INDEX i_ccv_f(categ_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE categ_custom_values ADD INDEX i_ccv_f");

			$rqt = "ALTER TABLE cms_editorial_custom_values DROP INDEX i_ccv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_st");
			$rqt = "ALTER TABLE cms_editorial_custom_values ADD INDEX i_ccv_st(cms_editorial_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE cms_editorial_custom_values ADD INDEX i_ccv_st");

			$rqt = "ALTER TABLE cms_editorial_custom_values DROP INDEX i_ccv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_t");
			$rqt = "ALTER TABLE cms_editorial_custom_values ADD INDEX i_ccv_t(cms_editorial_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE cms_editorial_custom_values ADD INDEX i_ccv_t");

			$rqt = "ALTER TABLE cms_editorial_custom_values DROP INDEX i_ccv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_i");
			$rqt = "ALTER TABLE cms_editorial_custom_values ADD INDEX i_ccv_i(cms_editorial_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE cms_editorial_custom_values ADD INDEX i_ccv_i");

			$rqt = "ALTER TABLE cms_editorial_custom_values DROP INDEX i_ccv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_d");
			$rqt = "ALTER TABLE cms_editorial_custom_values ADD INDEX i_ccv_d(cms_editorial_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE cms_editorial_custom_values ADD INDEX i_ccv_d");

			$rqt = "ALTER TABLE cms_editorial_custom_values DROP INDEX i_ccv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_f");
			$rqt = "ALTER TABLE cms_editorial_custom_values ADD INDEX i_ccv_f(cms_editorial_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE cms_editorial_custom_values ADD INDEX i_ccv_f");

			$rqt = "ALTER TABLE collection_custom_values DROP INDEX i_ccv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_st");
			$rqt = "ALTER TABLE collection_custom_values ADD INDEX i_ccv_st(collection_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE collection_custom_values ADD INDEX i_ccv_st");

			$rqt = "ALTER TABLE collection_custom_values DROP INDEX i_ccv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_t");
			$rqt = "ALTER TABLE collection_custom_values ADD INDEX i_ccv_t(collection_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE collection_custom_values ADD INDEX i_ccv_t");

			$rqt = "ALTER TABLE collection_custom_values DROP INDEX i_ccv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_i");
			$rqt = "ALTER TABLE collection_custom_values ADD INDEX i_ccv_i(collection_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE collection_custom_values ADD INDEX i_ccv_i");

			$rqt = "ALTER TABLE collection_custom_values DROP INDEX i_ccv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_d");
			$rqt = "ALTER TABLE collection_custom_values ADD INDEX i_ccv_d(collection_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE collection_custom_values ADD INDEX i_ccv_d");

			$rqt = "ALTER TABLE collection_custom_values DROP INDEX i_ccv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_ccv_f");
			$rqt = "ALTER TABLE collection_custom_values ADD INDEX i_ccv_f(collection_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE collection_custom_values ADD INDEX i_ccv_f");

			$rqt = "ALTER TABLE gestfic0_custom_values DROP INDEX i_gcv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_gcv_st");
			$rqt = "ALTER TABLE gestfic0_custom_values ADD INDEX i_gcv_st(gestfic0_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE gestfic0_custom_values ADD INDEX i_gcv_st");

			$rqt = "ALTER TABLE gestfic0_custom_values DROP INDEX i_gcv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_gcv_t");
			$rqt = "ALTER TABLE gestfic0_custom_values ADD INDEX i_gcv_t(gestfic0_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE gestfic0_custom_values ADD INDEX i_gcv_t");

			$rqt = "ALTER TABLE gestfic0_custom_values DROP INDEX i_gcv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_gcv_i");
			$rqt = "ALTER TABLE gestfic0_custom_values ADD INDEX i_gcv_i(gestfic0_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE gestfic0_custom_values ADD INDEX i_gcv_i");

			$rqt = "ALTER TABLE gestfic0_custom_values DROP INDEX i_gcv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_gcv_d");
			$rqt = "ALTER TABLE gestfic0_custom_values ADD INDEX i_gcv_d(gestfic0_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE gestfic0_custom_values ADD INDEX i_gcv_d");

			$rqt = "ALTER TABLE gestfic0_custom_values DROP INDEX i_gcv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_gcv_f");
			$rqt = "ALTER TABLE gestfic0_custom_values ADD INDEX i_gcv_f(gestfic0_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE gestfic0_custom_values ADD INDEX i_gcv_f");

			$rqt = "ALTER TABLE indexint_custom_values DROP INDEX i_icv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_icv_st");
			$rqt = "ALTER TABLE indexint_custom_values ADD INDEX i_icv_st(indexint_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE indexint_custom_values ADD INDEX i_icv_st");

			$rqt = "ALTER TABLE indexint_custom_values DROP INDEX i_icv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_icv_t");
			$rqt = "ALTER TABLE indexint_custom_values ADD INDEX i_icv_t(indexint_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE indexint_custom_values ADD INDEX i_icv_t");

			$rqt = "ALTER TABLE indexint_custom_values DROP INDEX i_icv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_icv_i");
			$rqt = "ALTER TABLE indexint_custom_values ADD INDEX i_icv_i(indexint_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE indexint_custom_values ADD INDEX i_icv_i");

			$rqt = "ALTER TABLE indexint_custom_values DROP INDEX i_icv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_icv_d");
			$rqt = "ALTER TABLE indexint_custom_values ADD INDEX i_icv_d(indexint_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE indexint_custom_values ADD INDEX i_icv_d");

			$rqt = "ALTER TABLE indexint_custom_values DROP INDEX i_icv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_icv_f");
			$rqt = "ALTER TABLE indexint_custom_values ADD INDEX i_icv_f(indexint_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE indexint_custom_values ADD INDEX i_icv_f");

			$rqt = "ALTER TABLE publisher_custom_values DROP INDEX i_pcv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_pcv_st");
			$rqt = "ALTER TABLE publisher_custom_values ADD INDEX i_pcv_st(publisher_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE publisher_custom_values ADD INDEX i_pcv_st");

			$rqt = "ALTER TABLE publisher_custom_values DROP INDEX i_pcv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_pcv_t");
			$rqt = "ALTER TABLE publisher_custom_values ADD INDEX i_pcv_t(publisher_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE publisher_custom_values ADD INDEX i_pcv_t");

			$rqt = "ALTER TABLE publisher_custom_values DROP INDEX i_pcv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_pcv_i");
			$rqt = "ALTER TABLE publisher_custom_values ADD INDEX i_pcv_i(publisher_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE publisher_custom_values ADD INDEX i_pcv_i");

			$rqt = "ALTER TABLE publisher_custom_values DROP INDEX i_pcv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_pcv_d");
			$rqt = "ALTER TABLE publisher_custom_values ADD INDEX i_pcv_d(publisher_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE publisher_custom_values ADD INDEX i_pcv_d");

			$rqt = "ALTER TABLE publisher_custom_values DROP INDEX i_pcv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_pcv_f");
			$rqt = "ALTER TABLE publisher_custom_values ADD INDEX i_pcv_f(publisher_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE publisher_custom_values ADD INDEX i_pcv_f");

			$rqt = "ALTER TABLE serie_custom_values DROP INDEX i_scv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_scv_st");
			$rqt = "ALTER TABLE serie_custom_values ADD INDEX i_scv_st(serie_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE serie_custom_values ADD INDEX i_scv_st");

			$rqt = "ALTER TABLE serie_custom_values DROP INDEX i_scv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_scv_t");
			$rqt = "ALTER TABLE serie_custom_values ADD INDEX i_scv_t(serie_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE serie_custom_values ADD INDEX i_scv_t");

			$rqt = "ALTER TABLE serie_custom_values DROP INDEX i_scv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_scv_i");
			$rqt = "ALTER TABLE serie_custom_values ADD INDEX i_scv_i(serie_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE serie_custom_values ADD INDEX i_scv_i");

			$rqt = "ALTER TABLE serie_custom_values DROP INDEX i_scv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_scv_d");
			$rqt = "ALTER TABLE serie_custom_values ADD INDEX i_scv_d(serie_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE serie_custom_values ADD INDEX i_scv_d");

			$rqt = "ALTER TABLE serie_custom_values DROP INDEX i_scv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_scv_f");
			$rqt = "ALTER TABLE serie_custom_values ADD INDEX i_scv_f(serie_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE serie_custom_values ADD INDEX i_scv_f");

			$rqt = "ALTER TABLE subcollection_custom_values DROP INDEX i_scv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_scv_st");
			$rqt = "ALTER TABLE subcollection_custom_values ADD INDEX i_scv_st(subcollection_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE subcollection_custom_values ADD INDEX i_scv_st");

			$rqt = "ALTER TABLE subcollection_custom_values DROP INDEX i_scv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_scv_t");
			$rqt = "ALTER TABLE subcollection_custom_values ADD INDEX i_scv_t(subcollection_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE subcollection_custom_values ADD INDEX i_scv_t");

			$rqt = "ALTER TABLE subcollection_custom_values DROP INDEX i_scv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_scv_i");
			$rqt = "ALTER TABLE subcollection_custom_values ADD INDEX i_scv_i(subcollection_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE subcollection_custom_values ADD INDEX i_scv_i");

			$rqt = "ALTER TABLE subcollection_custom_values DROP INDEX i_scv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_scv_d");
			$rqt = "ALTER TABLE subcollection_custom_values ADD INDEX i_scv_d(subcollection_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE subcollection_custom_values ADD INDEX i_scv_d");

			$rqt = "ALTER TABLE subcollection_custom_values DROP INDEX i_scv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_scv_f");
			$rqt = "ALTER TABLE subcollection_custom_values ADD INDEX i_scv_f(subcollection_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE subcollection_custom_values ADD INDEX i_scv_f");

			$rqt = "ALTER TABLE tu_custom_values DROP INDEX i_tcv_st " ;
			echo traite_rqt($rqt,"DROP INDEX i_tcv_st");
			$rqt = "ALTER TABLE tu_custom_values ADD INDEX i_tcv_st(tu_custom_small_text)" ;
			echo traite_rqt($rqt,"ALTER TABLE tu_custom_values ADD INDEX i_tcv_st");

			$rqt = "ALTER TABLE tu_custom_values DROP INDEX i_tcv_t " ;
			echo traite_rqt($rqt,"DROP INDEX i_tcv_t");
			$rqt = "ALTER TABLE tu_custom_values ADD INDEX i_tcv_t(tu_custom_text(255))" ;
			echo traite_rqt($rqt,"ALTER TABLE tu_custom_values ADD INDEX i_tcv_t");

			$rqt = "ALTER TABLE tu_custom_values DROP INDEX i_tcv_i " ;
			echo traite_rqt($rqt,"DROP INDEX i_tcv_i");
			$rqt = "ALTER TABLE tu_custom_values ADD INDEX i_tcv_i(tu_custom_integer)" ;
			echo traite_rqt($rqt,"ALTER TABLE tu_custom_values ADD INDEX i_tcv_i");

			$rqt = "ALTER TABLE tu_custom_values DROP INDEX i_tcv_d " ;
			echo traite_rqt($rqt,"DROP INDEX i_tcv_d");
			$rqt = "ALTER TABLE tu_custom_values ADD INDEX i_tcv_d(tu_custom_date)" ;
			echo traite_rqt($rqt,"ALTER TABLE tu_custom_values ADD INDEX i_tcv_d");

			$rqt = "ALTER TABLE tu_custom_values DROP INDEX i_tcv_f " ;
			echo traite_rqt($rqt,"DROP INDEX i_tcv_f");
			$rqt = "ALTER TABLE tu_custom_values ADD INDEX i_tcv_f(tu_custom_float)" ;
			echo traite_rqt($rqt,"ALTER TABLE tu_custom_values ADD INDEX i_tcv_f");


			//AR - Paramètre Portail : Activer la mise en cache des images
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'cms' and sstype_param='active_image_cache' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'cms', 'active_image_cache', '0', 'Activer la mise en cache des vignettes du contenu éditorial.\n 0: non \n 1:Oui \nAttention, si l\'OPAC ne se trouve pas sur le même serveur que la gestion, la purge du cache ne peut pas se faire automatiquement','',0)";
				echo traite_rqt($rqt,"insert cms_active_image_cache into parametres");
			}

			// MHo - Correction des messages des parametres sur l'ordre d'affichage et le mode d'affichage des concepts d'une notice (remplacement de "categorie" par "concept")
			$rqt="UPDATE parametres SET comment_param='Paramétrage de l\'ordre d\'affichage des concepts d\'une notice.\nPar ordre alphabétique: 0(par défaut)\nPar ordre de saisie: 1'
				WHERE type_param='thesaurus' AND sstype_param='concepts_affichage_ordre' AND section_param='concepts'";
			echo traite_rqt($rqt,"update comment_param de concepts_affichage_ordre into parametres ");

			$rqt="UPDATE parametres SET comment_param='Affichage des concepts en ligne.\n 0 : Non.\n 1 : Oui.'
				WHERE type_param='thesaurus' AND sstype_param='concepts_concept_in_line' AND section_param='concepts'";
			echo traite_rqt($rqt,"update comment_param de concepts_concept_in_line into parametres ");

			//DG - Flag pour savoir si le mot de passe est déjà encrypté
			$rqt= "alter table empr add empr_password_is_encrypted int(1) not null default 0 after empr_password";
			echo traite_rqt($rqt,"alter table empr add empr_password_is_encrypted");

			//DG - Phrase pour le hashage des mots de passe emprunteurs (paramètre invisible)
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='empr_password_salt' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'opac', 'empr_password_salt', '', 'Phrase pour le hashage des mots de passe emprunteurs','a_general',1)";
				echo traite_rqt($rqt,"insert opac_empr_password_salt into parametres");
			}

			//DG - Info d'encodage des mots de passe lecteurs pour la connexion à l'Opac
			$res=pmb_mysql_query("SELECT count(*) FROM empr");
			if($res && pmb_mysql_result($res,0,0)){
				$rqt = " select 1 " ;
				echo traite_rqt($rqt,"<b><a href='".$base_path."/admin.php?categ=netbase' target=_blank>VOUS DEVEZ ENCODER LES MOTS DE PASSE LECTEURS (APRES ETAPES DE MISE A JOUR) / YOU MUST ENCODE PASSWORD READERS (STEPS AFTER UPDATE) : Admin > Outils > Nettoyage de base</a></b> ") ;
			}

			// JP - Parametre affichage des dates de creation et modification notices
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='notices_show_dates' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion) VALUES (0, 'pmb', 'notices_show_dates', '0', 'Afficher les dates des notices ? \n 0 : Aucune date.\n 1 : Date de création et modification.', '',0) ";
				echo traite_rqt($rqt, "insert expl_show_dates=0 into parameters");
			}

			// AR - Paramètre pour activer la compression des CSS
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'opac' and sstype_param='compress_css' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'opac', 'compress_css', '0', 'Activer la compilation et la compression des feuilles de styles.\n0: Non\n1: Oui','a_general',0)";
				echo traite_rqt($rqt,"insert opac_compress_css into parametres");
			}

			//VT - Ajout d'un champ tonalité marclist dans la table titres_uniformes
			$rqt = "ALTER TABLE titres_uniformes ADD tu_tonalite_marclist VARCHAR(5) NOT NULL DEFAULT '' ";
			echo traite_rqt($rqt,"alter titres_uniformes add tu_tonalite_marclist");

			//VT - Ajout d'un champ forme marclist dans la table titres_uniformes
			$rqt = "ALTER TABLE titres_uniformes ADD tu_forme_marclist VARCHAR(5) NOT NULL DEFAULT '' ";
			echo traite_rqt($rqt,"alter titres_uniformes add tu_forme_marclist");

			// DB - Modification de la table resa_planning (quantité prévisions)
			$rqt = "alter table resa_planning add resa_qty int(5) unsigned not null default 1";
			echo traite_rqt($rqt,"alter resa_planning add resa_qty");
			$rqt = "alter table resa_planning add resa_remaining_qty int(5) unsigned not null default 1";
			echo traite_rqt($rqt,"alter resa_planning add resa_remaining_qty");
			// DB - Modification de la table resa (lien vers prévisions)
			$rqt = "alter table resa add resa_planning_id_resa int(8) unsigned not null default 0";
			echo traite_rqt($rqt,"alter resa add resa_planning_id_resa");

			// DB - Delai d'alerte pour le transfert des previsions en reservations
			if (pmb_mysql_num_rows(pmb_mysql_query("select 1 from parametres where type_param= 'pmb' and sstype_param='resa_planning_toresa' "))==0){
				$rqt = "INSERT INTO parametres (id_param, type_param, sstype_param, valeur_param, comment_param, section_param, gestion)
					VALUES (0, 'pmb', 'resa_planning_toresa', '10', 'Délai d\'alerte pour le transfert des prévisions en réservations (en jours). ' ,'',0)";
				echo traite_rqt($rqt,"insert resa_planning_toresa into parametres");
			}
			
			//JP - Nettoyage vues en erreur suite ajout index unique
			$res=mysql_query("SHOW TABLES LIKE 'opac_view_notices_%'");
			if($res && mysql_num_rows($res)){
				while ($r=mysql_fetch_array($res)){
					$rqt = "TRUNCATE TABLE ".$r[0] ;
					echo traite_rqt($rqt,"TRUNCATE TABLE ".$r[0]);
			
					$rqt = "ALTER TABLE ".$r[0]." DROP INDEX opac_view_num_notice" ;
					echo traite_rqt($rqt,"ALTER TABLE ".$r[0]." DROP INDEX opac_view_num_notice ");
			
					$rqt = "ALTER TABLE ".$r[0]." DROP PRIMARY KEY";
					echo traite_rqt($rqt, "ALTER TABLE ".$r[0]." DROP PRIMARY KEY");
			
					$rqt = "ALTER TABLE ".$r[0]." ADD PRIMARY KEY (opac_view_num_notice)";
					echo traite_rqt($rqt, "ALTER TABLE ".$r[0]." ADD PRIMARY KEY");
				}
			
				$rqt = " select 1 " ;
				echo traite_rqt($rqt,"<b><a href='".$base_path."/admin.php?categ=opac&sub=opac_view&section=list' target=_blank>VOUS DEVEZ RECALCULER LES VUES OPAC (APRES ETAPES DE MISE A JOUR) / YOU MUST RECALCULATE OPAC VIEWS (STEPS AFTER UPDATE) : Admin > Vues Opac > Générer les recherches</a></b> ") ;
			}
			
			//JP - nettoyage table authorities_sources
			$rqt = "DELETE FROM authorities_sources WHERE num_authority=0";
			echo traite_rqt($rqt,"DELETE FROM authorities_sources num_authority vide");
			
			//JP - accès rapide pour les paniers de notices
			$rqt = "ALTER TABLE caddie ADD acces_rapide INT NOT NULL default 0";
			echo traite_rqt($rqt,"ALTER TABLE caddie ADD acces_rapide");
			
			//JP - modification index notices_mots_global_index
			$rqt = "truncate table notices_mots_global_index";
			echo traite_rqt($rqt,"truncate table notices_mots_global_index");
				
			$rqt ="alter table notices_mots_global_index drop primary key";
			echo traite_rqt($rqt,"alter table notices_mots_global_index drop primary key");
			$rqt ="alter table notices_mots_global_index add primary key (id_notice,code_champ,code_ss_champ,num_word,position,field_position)";
			echo traite_rqt($rqt,"alter table notices_mots_global_index add primary key");
			// Info de réindexation
			$rqt = " select 1 " ;
			echo traite_rqt($rqt,"<b><a href='".$base_path."/admin.php?categ=netbase' target=_blank>VOUS DEVEZ REINDEXER (APRES ETAPES DE MISE A JOUR) / YOU MUST REINDEX (STEPS AFTER UPDATE) : Admin > Outils > Nettoyage de base</a></b> ") ;
				
			//DG - Proposer la conservation de catégories en remplacement de notice
			$rqt= "alter table users add deflt_notice_replace_keep_categories int(1) not null default 0";
			echo traite_rqt($rqt,"alter table users add deflt_notice_replace_keep_categories");
			
			//DG - Champs perso pret
			$rqt = "create table if not exists pret_custom (
				idchamp int(10) unsigned NOT NULL auto_increment,
				name varchar(255) NOT NULL default '',
				titre varchar(255) default NULL,
				type varchar(10) NOT NULL default 'text',
				datatype varchar(10) NOT NULL default '',
				options text,
				multiple int(11) NOT NULL default 0,
				obligatoire int(11) NOT NULL default 0,
				ordre int(11) default NULL,
				search INT(1) unsigned NOT NULL DEFAULT 0,
				export INT(1) unsigned NOT NULL DEFAULT 0,
				filters INT(1) unsigned NOT NULL DEFAULT 0,
				exclusion_obligatoire INT(1) unsigned NOT NULL DEFAULT 0,
				pond int not null default 100,
				opac_sort INT NOT NULL DEFAULT 0,
				PRIMARY KEY  (idchamp)) ";
			echo traite_rqt($rqt,"create table pret_custom ");
			
			$rqt = "create table if not exists pret_custom_lists (
				pret_custom_champ int(10) unsigned NOT NULL default 0,
				pret_custom_list_value varchar(255) default NULL,
				pret_custom_list_lib varchar(255) default NULL,
				ordre int(11) default NULL,
				KEY i_pret_custom_champ (pret_custom_champ),
				KEY i_pret_champ_list_value (pret_custom_champ,pret_custom_list_value)) " ;
			echo traite_rqt($rqt,"create table if not exists pret_custom_lists ");
			
			$rqt = "create table if not exists pret_custom_values (
				pret_custom_champ int(10) unsigned NOT NULL default 0,
				pret_custom_origine int(10) unsigned NOT NULL default 0,
				pret_custom_small_text varchar(255) default NULL,
				pret_custom_text text,
				pret_custom_integer int(11) default NULL,
				pret_custom_date date default NULL,
				pret_custom_float float default NULL,
				KEY i_pret_custom_champ (pret_custom_champ),
				KEY i_pret_custom_origine (pret_custom_origine)) " ;
			echo traite_rqt($rqt,"create table if not exists pret_custom_values ");
				
			//DG - maj valeurs possibles pour empr_sort_rows
			if (mysql_num_rows(mysql_query("select 1 from parametres where type_param= 'empr' and sstype_param='sort_rows'  and (valeur_param like '%#e%' or valeur_param like '%#p%') "))==0){
				$rqt = "update parametres set valeur_param=replace(valeur_param,'#','#e'), comment_param='Colonnes qui seront disponibles pour le tri des emprunteurs. Les colonnes possibles sont : \n n: nom+prénom \n b: code-barres \n c: catégories \n g: groupes \n l: localisation \n s: statut \n cp: code postal \n v: ville \n y: année de naissance \n ab: type d\'abonnement \n #e[n] : [n] = id des champs personnalisés lecteurs \n #p[n] : [n] = id des champs personnalisés prêts' where type_param= 'empr' and sstype_param='sort_rows' ";
				echo traite_rqt($rqt,"update empr_sort_rows into parametres");
			}
				
			//DG - maj valeurs possibles pour empr_filter_rows
			if (mysql_num_rows(mysql_query("select 1 from parametres where type_param= 'empr' and sstype_param='filter_rows' and (valeur_param like '%#e%' or valeur_param like '%#p%') "))==0){
				$rqt = "update parametres set valeur_param=replace(valeur_param,'#','#e'), comment_param='Colonnes disponibles pour filtrer la liste des emprunteurs : \n v: ville\n l: localisation\n c: catégorie\n s: statut\n g: groupe\n y: année de naissance\n cp: code postal\n cs : code statistique\n ab : type d\'abonnement \n #e[n] : [n] = id des champs personnalisés lecteurs \n #p[n] : [n] = id des champs personnalisés prêts' where type_param= 'empr' and sstype_param='filter_rows' ";
				echo traite_rqt($rqt,"update empr_filter_rows into parametres");
			}
				
			//DG - maj valeurs possibles pour empr_show_rows
			if (mysql_num_rows(mysql_query("select 1 from parametres where type_param= 'empr' and sstype_param='show_rows'  and (valeur_param like '%#e%' or valeur_param like '%#p%') "))==0){
				$rqt = "update parametres set valeur_param=replace(valeur_param,'#','#e'), comment_param='Colonnes affichées en liste de lecteurs, saisir les colonnes séparées par des virgules. Les colonnes disponibles pour l\'affichage de la liste des emprunteurs sont : \n n: nom+prénom \n a: adresse \n b: code-barre \n c: catégories \n g: groupes \n l: localisation \n s: statut \n cp: code postal \n v: ville \n y: année de naissance \n ab: type d\'abonnement \n #e[n] : [n] = id des champs personnalisés lecteurs \n 1: icône panier' where type_param= 'empr' and sstype_param='show_rows' ";
				echo traite_rqt($rqt,"update empr_show_rows into parametres");
			}
				
			// AP - Création d'une table pour la gestion de la suppression des enregistrements OAI
			$rqt = "CREATE TABLE if not exists connectors_out_oai_deleted_records (
					num_set int(11) unsigned NOT NULL DEFAULT 0,
					num_notice int(11) unsigned NOT NULL DEFAULT 0,
					deletion_date datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
					PRIMARY KEY (num_set, num_notice))";
			echo traite_rqt($rqt,"CREATE TABLE connectors_out_oai_deleted_records") ;
			
			// AP - Ajout du stockage de la grammaire d'une vedette
			$rqt = "ALTER TABLE vedette ADD grammar varchar(255) NOT NULL default 'rameau'" ;
			echo traite_rqt($rqt,"ALTER TABLE vedette ADD grammar");
			
			//JP - recalcul des isbn à cause du nouveau fomatage
			require_once($include_path."/isbn.inc.php");
			$res=pmb_mysql_query("SELECT notice_id, code FROM notices WHERE code<>'' AND niveau_biblio='m' AND code LIKE '97%'");
			if($res && pmb_mysql_num_rows($res)){
				while ($row=pmb_mysql_fetch_object($res)) {
					$code = $row->code;
					$new_code = formatISBN($code);
					if ($code!= $new_code){
						pmb_mysql_query("UPDATE notices SET code='".addslashes($new_code)."', update_date=update_date WHERE notice_id=".$row->notice_id);
					}
				}
			}
			$rqt = " select 1 " ;
			echo traite_rqt($rqt,"update notices code / ISBN check and clean") ;
				
			
			//JP - mise à jour des dates de validation des commandes
			$rqt="UPDATE actes SET date_valid=date_acte WHERE statut>1 AND date_valid='0000-00-00'";
			echo traite_rqt($rqt,"update actes date_validation ");
			
			$rqt = "update parametres set valeur_param='0' where type_param='pmb' and sstype_param='bdd_subversion' " ;
			echo traite_rqt($rqt,"update pmb_bdd_subversion=0 into parametres");
			$pmb_bdd_subversion=0;
			
			if ($pmb_subversion_database_as_it_shouldbe!=$pmb_bdd_subversion) {
				// Info de déconnexion pour passer le add-on
				$rqt = " select 1 " ;
				echo traite_rqt($rqt,"<b><a href='".$base_path."/logout.php' target=_blank>VOUS DEVEZ VOUS DECONNECTER ET VOUS RECONNECTER POUR TERMINER LA MISE A JOUR  / YOU MUST DISCONNECT AND RECONNECT YOU TO COMPLETE UPDATE</a></b> ") ;
			}
			
		
		// +-------------------------------------------------+
		echo "</table>";
		$rqt = "update parametres set valeur_param='v5.19' where type_param='pmb' and sstype_param='bdd_version' " ;
		$res = mysql_query($rqt, $dbh) ;
		echo "<strong><font color='#FF0000'>".$msg[1807]." ".number_format($action, 2, ',', '.')."%</font></strong><br />";
		$action=$action+$increment;

		// // Parcheamos la base de datos
		require("$base_path/includes/db_param.inc.php");
		$comando= "cat ".$base_path."/admin/misc/mods_vLlxNemo.sql | mysql -u ". USER_NAME ." --password=". USER_PASS ." ". DATA_BASE;
		if (system($comando, $salida)==0){
		 	echo "$msg[db_patched]";
		}
		echo "<SCRIPT>alert(\"".$msg[actualizacion_ok]."\");</SCRIPT>";
		//echo("<SCRIPT LANGUAGE='JavaScript'> window.location = \"$base_path/\"</SCRIPT>");
		break;

	default:
		include("$include_path/messages/help/$lang/alter.txt");
		break;
	}
		
