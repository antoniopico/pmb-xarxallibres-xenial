-- Modificamos duración de los carnets a 10 anyos

UPDATE empr_categ SET duree_adhesion = '3650';


-- En nuevas instalaciones

-- Introducimos nuevos servidores z3950

DROP TABLE IF EXISTS `z_bib_bak`;
CREATE TABLE IF NOT EXISTS `z_bib_bak` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

INSERT INTO `z_bib_bak` VALUES (null,'Universidad de Córdoba','CATALOG','medina.uco.es','210','INNOPAC','USMARC','','','',''),
(null,'Biblioteca Nacional','CATALOG','sigb.bne.es','2200','Unicorn','USMARC','','','',''),
(null,'Biblioteca Valenciana','CATALOG','bv.gva.es','2102','ABSYSE','IBERMARC','','','',''),
(null,'Biblioteca de Castilla y León','CATALOG','z3950.bcl.jcyl.es','210','AbsysBCL','USMARC','','','',''),
(null,'Biblioteca Pública de Avila','CATALOG','bpavila.bcl.jycl.es','210','AbsysE','USMARC','','','',''),
(null,'Biblioteca Pública de Burgos','CATALOG','bpburgos.bcl.jycl.es','210','AbsysE','USMARC','','','',''),
(null,'Biblioteca Pública de León','CATALOG','bpleon.bcl.jycl.es','210','AbsysE','USMARC','','','',''),
(null,'Biblioteca Pública de Palencia','CATALOG','bppal.bcl.jycl.es','210','AbsysE','USMARC','','','',''),
(null,'Biblioteca Pública de Salamanca','CATALOG','bpsalamanca.bcl.jcyl.es','210','AbsysE','USMARC','','','',''),
(null,'Biblioteca Pública de Segovia','CATALOG','bpsegovia.bcl.jycl.es','210','AbsysE','USMARC','','','',''),
(null,'Biblioteca Pública de Soria','CATALOG','bpsoria.bcl.jycl.es','210','AbsysE','USMARC','','','',''),
(null,'Biblioteca Pública de Zaragoza','CATALOG','codos.aragob.es','5500','ABSYSE','USMARC','','','',''),
(null,'Biblioteca Central de La Rioja','CATALOG','bcr1.larioja.org','210','AbsysE','USMARC','','','',''),
(null,'Congreso de los Diputados','CATALOG','www.congreso.es','2100','absysbcd','USMARC','','','',''),
(null,'REBECA','CATALOG','catalogos.mecd.es','220','ABNET_REBECA','ISO 8859-1','','','',''),
(null,'REBIUN','CATALOG','rebiun.crue.org','210','ABSYSREBIUN','USMARC','','','',''),
(null,'Biblioteca Virtual Miguel de Cervantes','CATALOG','z.cervantesvirtual.com','2100','bimicesa','USMARC','','','',''),
(null,'Universidad de Alcalá de Henares','CATALOG','biblio.uah.es','2200','unicorn','USMARC','','','',''),
(null,'Universidad de Alicante','CATALOG','gaudi.ua.es','2200','unicorn','USMARC','','','',''),
(null,'Universidad Autónoma de Madrid','CATALOG','biblos.uam.es','2200','unicorn','USMARC','','','',''),
(null,'Universidad Carlos III de Madrid','CATALOG','biblioteca.uc3m.es','2200','unicorn','USMARC','','','',''),
(null,'Universidad Complutense de Madrid','CATALOG','cisne.sim.ucm.es','210','INNOPAC','USMARC','cisne','','',''),
(null,'Universidad de las Islas Baleares','CATALOG','llull.uib.es','210','INNOPAC','USMARC','','','',''),
(null,'Universidad de Jaén','CATALOG','venzala.ujaen.es','210','ABSYSE','USMARC','','','',''),
(null,'Universidad de La Laguna','CATALOG','193.145.120.49','210','ABSYSE','USMARC','','','',''),
(null,'Universidad de La Rioja','CATALOG','merly.unirioja.es','9000','ABSYSE','USMARC','','','',''),
(null,'Universidad Politécnica de Madrid','CATALOG','marte.biblioteca.upm.es','2200','unicorn','USMARC','','','',''),
(null,'Universidad Rey Juan Carlos','CATALOG','centauro.urjc.es','2200','unicorn','USMARC','','','',''),
(null,'Universidad de Valencia','CATALOG','mvs.ci.uv.es','3003','xxdefault','USMARC','','','',''),
(null,'Universidad de Zaragoza','CATALOG','cuarzo.unizar.es','210','LIBERTAS','USMARC','libtest','catalog','',''),
(null,'Library Of Congress','CATALOG','z3950.loc.gov','7090','Voyager','USMARC','','','',''),
(null,'Universidad Pública de Navarra','CATALOG','brocar.unavarra.es','9999','libros','USMARC','','','',''),
(null,'Universidad de Burgos','CATALOG','ubucat.ubu.es','210','INNOPAC','USMARC','','','',''),
(null,'Red de Bibliotecas del CSIC','CATALOG','aleph.csic.es','9909','MAD01','USMARC','','','',''),
(null,'Universidad de Sevilla','CATALOG','fama.us.es','210','INNOPAC','USMARC','','','',''),
(null,'Universidad de Castilla-La Mancha','CATALOG','z3950.uclm.es','210','ABNET_DB','USMARC','','','',''),
(null,'Catálogo colectivo de las Bibliotecas de Castilla y León','CATALOG','z3950.bcl.jcyl.es','210','AbsysCCCL','USMARC','','','',''),
(null,'UNED','CATALOG','biblio15.uned.es','2200','unicorn','USMARC','','','','');

INSERT INTO `z_bib` (`bib_nom`, `search_type`, `url`, `port`, `base`, `format`, `auth_user`, `auth_pass`, `sutrs_lang`, `fichier_func`)
SELECT DISTINCT A.bib_nom, A.search_type, A.url, A.port, A.base, A.format, A.auth_user, A.auth_pass, A.sutrs_lang, A.fichier_func
FROM `z_bib_bak` A
LEFT JOIN `z_bib` B
ON A.bib_nom = B.bib_nom
WHERE B.bib_nom IS NULL;


DROP TABLE IF EXISTS `z_bib_bak`;