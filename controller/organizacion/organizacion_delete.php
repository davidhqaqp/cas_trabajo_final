<?php

include_once '../../conexion/conexion.php';
$c = new Conexion();
$conn = $c->getConexion();
$id=$_POST["id"];

$sql = "UPDATE `organizacion` SET `organizacion_estado` = 0
 WHERE `organizacion`.`organizacion_id` =".$id;


$result =$conn->query($sql);
$outp = array();
$outp = $result->fetch_all(MYSQLI_ASSOC);
        
echo json_encode($outp);