<?php

include_once '../../conexion/conexion.php';
$c = new Conexion();
$conn = $c->getConexion();
$id=$_POST["id"];
$nombre = $_POST["organizacion_nombre"];
$persona  = $_POST["organizacion_persona_contacto"];
$sql = "UPDATE `organizacion` SET `organizacion_nombre` = '".$nombre."', `organizacion_persona_contacto` = '".$persona."' WHERE `organizacion`.`organizacion_id` =".$id;


$result =$conn->query($sql);
$outp = array();
$outp = $result->fetch_all(MYSQLI_ASSOC);
        
echo json_encode($outp);