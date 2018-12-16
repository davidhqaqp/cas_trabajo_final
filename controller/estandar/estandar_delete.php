<?php

include_once '../../conexion/conexion.php';
$c = new Conexion();
$conn = $c->getConexion();
$id=$_POST["id"];

$sql = "UPDATE `estandar` SET `estandar_estadoregistro` = 0
 WHERE `estandar`.`estandar_id` =".$id;


$result =$conn->query($sql);
include "estandar_select.php";