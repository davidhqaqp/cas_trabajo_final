<?php

include_once '../../conexion/conexion.php';
$c = new Conexion();
$conn = $c->getConexion();
$nombre = $_POST["proceso_nombre"];
$especificacion  = $_POST["proceso_especificacion"];
$idestandar = $_POST["estandar_id"];
if(isset($_POST["FK_proceso_id"])){
	$proceso = NULL;
}else{
	$proceso = $_POST["FK_proceso_id"];
}

$sql = "INSERT INTO `proceso` (`proceso_nombre`, `proceso_especificacion`, `FK_proceso_id`, `estandar_id`) VALUES ('".$nombre."', '".$especificacion."', ".$proceso.",".$idestandar.")";

$result =$conn->query($sql);

include "proceso_select.php";