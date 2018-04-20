<?php
// +-------------------------------------------------+
// � 2002-2004 PMB Services / www.sigb.net pmb@sigb.net et contributeurs (voir www.sigb.net)
// +-------------------------------------------------+
// $Id: etageres.class.php,v 1.3 2015-04-03 11:16:27 jpermanne Exp $

if (stristr($_SERVER['REQUEST_URI'], ".class.php")) die("no access");

global $class_path,$base_path,$include_path;
require_once($class_path."/etagere.class.php");

class etageres {    
   function etageres($id_vue,$local_msg) {
    	$this->id_vue=$id_vue;
    	$this->path="etageres";
    	$this->msg=$local_msg;
    	$this->fetch_data();    	   	
    }
    
    function fetch_data() {
 		global $dbh;
			
		$this->selected_list=array();
		$req="SELECT * FROM opac_filters where opac_filter_view_num=".$this->id_vue." and  opac_filter_path='".$this->path."' ";
		$myQuery = pmb_mysql_query($req, $dbh);
		if(pmb_mysql_num_rows($myQuery)){
			$r=pmb_mysql_fetch_object($myQuery);
			$param=unserialize($r->opac_filter_param);
			$this->selected_list=$param["selected"];
		}	
		$this->liste_item=array();
		$liste_item=etagere::get_etagere_list();
		$i=0;
		foreach($liste_item as $valeur){
			$this->liste_item[$i]=new stdClass();
			$this->liste_item[$i]->id=$valeur['idetagere'];
			$this->liste_item[$i]->name=$valeur['name'];
			$this->liste_item[$i]->comment=$valeur['comment'];
			if(in_array($valeur['idetagere'],$this->selected_list))	$this->liste_item[$i]->selected=1;
			else $this->liste_item[$i]->selected=0;	
			$i++;						
		}
		
    }
       
	function get_all_elements(){	
		return $this->ids;
	}
    	
	function get_elements(){		
		return $this->all_ids;
	}		
	
	function get_form(){
		global $msg;
		global $tpl_liste_item_tableau,$tpl_liste_item_tableau_ligne;
		
		global $class_path,$base_path,$include_path;

		require_once($base_path."/admin/opac/opac_view/filters/etageres/etageres.tpl.php");
		
		// liste des lien de recherche directe
		$liste="";
		// pour toute les recherche de l'utilisateur
		for($i=0;$i<count($this->liste_item);$i++) {
			if ($i % 2) $pair_impair = "even"; else $pair_impair = "odd";			
	        $td_javascript=" ";
	        $tr_surbrillance = "onmouseover=\"this.className='surbrillance'\" onmouseout=\"this.className='".$pair_impair."'\" ";
	
	        $line = str_replace('!!td_javascript!!',$td_javascript , $tpl_liste_item_tableau_ligne);
	        $line = str_replace('!!tr_surbrillance!!',$tr_surbrillance , $line);
	        $line = str_replace('!!pair_impair!!',$pair_impair , $line);
	
			$line =str_replace('!!id!!', $this->liste_item[$i]->id, $line);
			if($this->liste_item[$i]->selected) $checked="checked";else $checked="";			
			$line =str_replace('!!selected!!', $checked, $line);
			$line = str_replace('!!name!!', $this->liste_item[$i]->name, $line);
			$line = str_replace('!!comment!!', $this->liste_item[$i]->comment, $line);	
			
			$liste.=$line;
		}
		$tpl_liste_item_tableau = str_replace('!!lignes_tableau!!',$liste , $tpl_liste_item_tableau);
		return $forms_search.$tpl_liste_item_tableau;
	}	
	
	function save_form(){
 		global $dbh;

		$req="delete FROM opac_filters where opac_filter_view_num=".$this->id_vue." and  opac_filter_path='".$this->path."' ";
		$myQuery = pmb_mysql_query($req, $dbh);
		
		$param=array();
		$selected_list=array();
		for($i=0;$i<count($this->liste_item);$i++) {
			eval("global \$etageres_selected_".$this->liste_item[$i]->id.";
			\$selected= \$etageres_selected_".$this->liste_item[$i]->id.";");
			if($selected){
				$selected_list[]=$this->liste_item[$i]->id;
			}
		}
		$param["selected"]=$selected_list;
		$param=addslashes(serialize($param));		
		$req="insert into opac_filters set opac_filter_view_num=".$this->id_vue." ,  opac_filter_path='".$this->path."', opac_filter_param='$param' ";
		$myQuery = pmb_mysql_query($req, $dbh);
	}	
}