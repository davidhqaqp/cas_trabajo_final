<?php

include_once '../../conexion/conexion.php';
$c = new Conexion();
$conn = $c->getConexion();
$id=$_POST["id"];

$sql = "DELETE FROM `proceso` 
 WHERE `proceso`.`procesos_id` =".$id;

$result =$conn->query($sql);
include "proceso_select.php";