<?php
// +-------------------------------------------------+
// � 2002-2012 PMB Services / www.sigb.net pmb@sigb.net et contributeurs (voir www.sigb.net)
// +-------------------------------------------------+
// $Id: cms_module_metadatas_datasource_metadatas_article.class.php,v 1.2 2015-06-08 09:12:09 arenou Exp $

if (stristr($_SERVER['REQUEST_URI'], ".class.php")) die("no access");

class cms_module_metadatas_datasource_metadatas_article extends cms_module_metadatas_datasource_metadatas_generic{
	
	public function __construct($id=0){
		parent::__construct($id);
	}
	
	/*
	 * On d�fini les s�lecteurs utilisable pour cette source de donn�e
	*/
	public function get_available_selectors(){
		return array(
				"cms_module_common_selector_article",
				"cms_module_common_selector_env_var",
				"cms_module_common_selector_global_var"
		);
	}
			
	/*
	 * R�cup�ration des donn�es de la source...
	 */
	public function get_datas(){
		//on commence par r�cup�rer l'identifiant retourn� par le s�lecteur...
		$selector = $this->get_selected_selector();
		if($selector){
			$article_ids = $this->filter_datas("articles",array($selector->get_value()));
			if($article_ids[0]){
				$group_metadatas = parent::get_group_metadatas();
				
				$datas = array();
				$article = cms_provider::get_instance("article",$article_ids[0]);
				$datas = $article->format_datas();
				$datas["details"] = $datas;
				$datas = array_merge($datas,parent::get_datas());
				$datas['link'] = $this->get_constructed_link("article",$article_ids[0]);
				$datas['logo_url'] = $datas["logo"]["big"];
				foreach ($group_metadatas as $i=>$metadatas) {
					if (is_array($metadatas["metadatas"])) {
						foreach ($metadatas["metadatas"] as $key=>$value) {
							try {
								$group_metadatas[$i]["metadatas"][$key] = H2o::parseString($value)->render($datas);
							}catch(Exception $e){
							}
						}
					}
				}
				return $group_metadatas;
			}
		}
		return false;
	}
	
	public function get_format_data_structure(){
		$datas = cms_article::get_format_data_structure();
		$datas[] = array(
				'var' => "link",
				'desc'=> $this->msg['cms_module_metadatas_datasource_metadatas_article_link_desc']
		);
		
		$format_datas = array(
				array(
						'var' => "details",
						'desc' => $this->msg['cms_module_metadatas_datasource_metadatas_article_article_desc'],
						'children' => $this->prefix_var_tree($datas,"details")
				)
		);
		$format_datas = array_merge(parent::get_format_data_structure(),$format_datas);
		return $format_datas;
	}
}