<?php

include_once '../../conexion/conexion.php';
$c = new Conexion();
$conn = $c->getConexion();
$nombre = $_POST["organizacion_nombre"];
$persona  = $_POST["organizacion_persona_contacto"];
$sql = "INSERT INTO `organizacion` (`organizacion_nombre`, `organizacion_persona_contacto`)
		VALUES ('".$nombre ."', '".$persona ."')";

$result =$conn->query($sql);
$outp = array();
$outp = $result->fetch_all(MYSQLI_ASSOC);
        
echo json_encode($outp);