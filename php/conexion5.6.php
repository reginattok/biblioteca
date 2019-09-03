<?php

//include_once('config.php');
/*
/////////////////////////////////////////////
// Funcion conectar -> conecta con la base de datos
function conectar(){
	$handle = @mysqli_connect(DB_HOST,DB_USER,DB_PASS);
	if(!$handle){
		$errorNro = @mysqli_errno();
		$errorMsg = "No existe conexi�n con la Base de Datos.".@mysqli_error();
		switch($errorNro){
			case 2005:
				$errorMsg = "No existe conexi�n con la Base de Datos, no se puede encontrar el Servidor MySQL";
				break;
			case 1045:
				$errorMsg = "No existe conexi�n con la Base de Datos, el usuario es incorrecto";
				break;
		}
		return $errorMsg;
	}
	if(!@mysqli_select_db(DB_NAME, $handle)){
		$errorNro = @mysqli_errno();
		$errorMsg = "No existe conexi�n con la Base de Datos.".@mysqli_error();
		switch($errorNro){
			case 1044:
				$errorMsg = "No existe conexi�n con la Base de Datos, usuario sin permisos";
				break;
		}
		return $errorMsg;
	}
	@mysqli_query($handle,"SET NAMES 'utf8'");
	return $handle;
}
//------------------

//------------------
function db_start_trans($handle) {
	$ok = mysqli_query($handle,"SET AUTOCOMMIT=0");
	$ok2 = mysqli_query($handle,"BEGIN");
	if(!$ok || !$ok2){
		return false;
	}
}
function db_commit($handle) {
	$ok = mysqli_query($handle,"COMMIT");
	$ok2 = mysqli_query($handle,"SET AUTOCOMMIT=1");
	if(!$ok || !$ok2){
		return false;
	}
}
function db_rollback($handle) {
	$ok = mysql_query($handle,"ROLLBACK");
	$ok2 = mysql_query($handle,"SET AUTOCOMMIT=1");
	if(!$ok || !$ok2){
		return false;
	}
}
//-------------------
$con = conectar();*/

$con = mysqli_connect("localhost","root","","biblioteca2019");

?>
