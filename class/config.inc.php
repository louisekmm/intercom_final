<?php
/**
	*	Arquivo de configuração
 *
 *	@author Otávio Tralli <otavio@tralli.org>
 *	@version v 1.0
*/
session_start();
$env = (isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '');

$lang = (isset($_COOKIE['lang']) ? $_COOKIE['lang'] : 'pt');

define('PROJECT_NAME', 'intercom');
define('ADMIN_FOLDER', '');
define('PROJECT_PREFIX', '');

$acts = "login,index,admin,config,staticstring,entidade,grupo_envio,dimensao,semana,todos,admin_tipo,acompanhamento,entidade_agrupamento,entidade_classificacao,entidade_pessoa,cadastro,formulario,formulario_pergunta,api.php,api_bot.php,api_eventos.php,404";
$actss = explode(',', $acts);

$barra = explode('/', $_SERVER['REQUEST_URI']);

if($barra[1] != ''){
	if((!in_array($barra[1], $actss)) && (!isset($_SESSION['log']))){
		$_SESSION['bd'] = $barra[1];
		$dbname = $barra[1];
		//echo $dbname;
		//echo "ola";
	}else if(isset($_SESSION['bd'])) {
		$dbname = $_SESSION['bd'];
		//echo "ola1";
		//echo $dbname;
	}else{
		//echo "ola2";
		//echo $dbname;
	}
}
else{
	if(!isset($_SESSION['log'])) {
		$dbname = 'intercom';
		$_SESSION['bd'] = 'intercom';
		//echo "ola8";
		//echo $dbname;
	}
	else if(isset($_SESSION['bd'])) {
		$dbname = $_SESSION['bd'];
		//echo "ola4";
		//echo $dbname;
	}else{
		//echo "ola5";
		//echo $dbname;
	}
}


set_time_limit(0);
switch($env) {
	/* servidor local de teste */
	case 'nex':
	case 'localhost':
		$host = 'localhost';
		$dbname = 'intercom';
		$config = array(
			'db_dsn' => 'mysql:host='.$host.';dbname='.$dbname.';charset=utf8',
			'db_user' => 'root',
			'db_pwd' => ''
		);
		

		define('SANDBOX', true);
		define('SANDBOX_LOCAL', true);
		error_reporting(-1);
		ini_set("display_errors",1);
		$base_path = 'intercom';
		$url = 'http://localhost/'.$base_path;
	break;
	
	/* produção */
	default:
		$host = 'intercommgov-db.mysql.database.azure.com';
		//$dbname = 'modelo';
		$config = array(
				'db_dsn' => 'mysql:host='.$host.';dbname='.$dbname.';charset=utf8',
				'db_user' => 'intercom@intercommgov-db',
				'db_pwd' => 'mgovadm1!'
			);
	

		if (isset($_GET['debugX'])) {
			error_reporting(-1);
			ini_set("display_errors",1);
			define('DEBUG_SQL', true);
		} else {
			ini_set("display_errors",0);
			error_reporting(0);
		}
		define('SANDBOX', false);
		$base_path = '';
		$url = 'http://intercom.mgovbrasil.com.br'.$base_path;
	break;
}
//$pagseguro_token = 'CD23A11FBC2849859B7AB2D7B53F8F9C';
date_default_timezone_set('America/Sao_Paulo');

define('URL', (string) $url);


include_once 'functions.inc.php';