<?php

include_once '../../conexion/conexion.php';
$c = new Conexion();
$conn = $c->getConexion();
$id=$_POST["id"];
$nombre = $_POST["proceso_nombre"];
$especificacion  = $_POST["proceso_especificacion"];

$sql = "UPDATE `proceso` SET `proceso_nombre` = '".$nombre."', `proceso_especificacion` = '".$especificacion."' WHERE `proceso`.`proceso_id` = ".$id;


$result =$conn->query($sql);
include "proceso_select.php";