<?php

include_once '../../conexion/conexion.php';
$c = new Conexion();
$conn = $c->getConexion();
$nombre = $_POST["estandar_nombre"];

$sql = "INSERT INTO `estandar` (`estandar_nombre`)
		VALUES ('".$nombre ."')";

$result =$conn->query($sql);
$outp = array();
include "estandar_select.php";