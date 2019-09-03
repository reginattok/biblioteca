<?php
include_once(dirname(__FILE__).'/config.php');

/////////////////////////////////////////////
// Funcion conectar -> conecta con la base de datos
function conectar(){
	$handle = @mysql_connect(DB_HOST,DB_USER,DB_PASS);
	if(!$handle){
		$errorNro = @mysql_errno();
		$errorMsg = "No existe conexión con la Base de Datos.".@mysql_error();
		switch($errorNro){
			case 2005: 
				$errorMsg = "No existe conexión con la Base de Datos, no se puede encontrar el Servidor MySQL"; 
				break;
			case 1045: 
				$errorMsg = "No existe conexión con la Base de Datos, el usuario es incorrecto"; 
				break;
		}	
		return $errorMsg;
	}
	if(!@mysql_select_db(DB_NAME, $handle)){
		$errorNro = @mysql_errno();
		$errorMsg = "No existe conexión con la Base de Datos.".@mysql_error();
		switch($errorNro){
			case 1044: 
				$errorMsg = "No existe conexión con la Base de Datos, usuario sin permisos"; 
				break;
		}	
		return $errorMsg;
	}
	@mysql_query("SET NAMES 'utf8'", $handle);
	return $handle;
}
//------------------

//------------------
function db_start_trans($handle) {
	$ok = mysql_query("SET AUTOCOMMIT=0", $handle);
	$ok2 = mysql_query("BEGIN", $handle);
	if(!$ok || !$ok2){
		return false;
	}
}
function db_commit($handle) {
	$ok = mysql_query("COMMIT", $handle);
	$ok2 = mysql_query("SET AUTOCOMMIT=1", $handle);
	if(!$ok || !$ok2){
		return false;
	}
}
function db_rollback($handle) {
	$ok = mysql_query("ROLLBACK", $handle);
	$ok2 = mysql_query("SET AUTOCOMMIT=1", $handle);
	if(!$ok || !$ok2){
		return false;
	}
}
//-------------------

$conex = conectar();
?>