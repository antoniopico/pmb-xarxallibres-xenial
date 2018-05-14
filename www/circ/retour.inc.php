<?php
// +-------------------------------------------------+
// © 2002-2004 PMB Services / www.sigb.net pmb@sigb.net et contributeurs (voir www.sigb.net)
// +-------------------------------------------------+
// $Id: retour.inc.php,v 1.33 2010-07-06 10:08:48 ngantier Exp $

if (stristr($_SERVER['REQUEST_URI'], ".inc.php")) die("no access");

require_once("$class_path/emprunteur.class.php");
require_once("$class_path/serial_display.class.php");
require_once("$class_path/comptes.class.php");
require_once("$class_path/amende.class.php");
require_once("$include_path/resa.inc.php");
require_once("$class_path/expl_to_do.class.php");

// gestion des retours
if ($_GET['cb_expl']) {
	$form_cb_expl=$_GET['cb_expl'];
	$_GET['cb_expl']='';
	$confirmed=1;
} else {
	if ($pmb_confirm_retour) $confirmed=0;
		else $confirmed=1;
}	

$expl=new expl_to_do($form_cb_expl);



if($form_cb_expl) {
	$expl->do_form_retour($action_piege,$piege_resa);
}
print $expl->cb_tmpl.$expl->expl_form;

//LA SENIA
echo("<hr>");

require("$base_path/includes/db_param.inc.php");

$link2 = @mysql_connect(SQL_SERVER, USER_NAME, USER_PASS) OR die("Error MySQL");

$q ='SELECT expl_cb FROM exemplaires';
$q = 'select exemplaires.expl_cb , notices.tit1 from pret, exemplaires,empr, notices where notices.notice_id=exemplaires.expl_notice and pret.pret_idempr=empr.id_empr and pret.pret_idexpl=exemplaires.expl_id and empr.id_empr=640 order by pret.pret_date desc';

	$resultData = @mysql_query($q, $link2);
		if (@mysql_num_rows($resultData) != 0) {
			while ($rowData = mysql_fetch_array($resultData)) {	
				echo "Devuelve <a href=http://biblioteca.ieslasenia.org/circ.php?categ=retour&cb_expl=$rowData[0]>$rowData[1]</a><br>";
			}
		}
	mysql_free_result($resultData);




