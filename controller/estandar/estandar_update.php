<?php

include_once '../../conexion/conexion.php';
$c = new Conexion();
$conn = $c->getConexion();
$id=$_POST["id"];
$nombre = $_POST["estandar_nombre"];

$sql = "UPDATE `estandar` SET `estandar_nombre` = '".$nombre."'
 WHERE `estandar`.`estandar_id` =".$id;


$result =$conn->query($sql);
include "estandar_select.php";