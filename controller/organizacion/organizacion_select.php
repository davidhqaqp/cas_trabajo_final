<?php

include_once '../../conexion/conexion.php';

$c = new Conexion();
$conn = $c->getConexion();
$sql = "SELECT * FROM `organizacion` WHERE organizacion_estado=1";
$result =$conn->query($sql);
$outp = array();
$outp = $result->fetch_all(MYSQLI_ASSOC);
        
echo json_encode($outp);