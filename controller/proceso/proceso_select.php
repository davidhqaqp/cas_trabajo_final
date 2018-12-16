<?php

include_once '../../conexion/conexion.php';

$c = new Conexion();
$conn = $c->getConexion();
$estandar_id = $_POST["estandar_id"];
$estandar_id=1;
$sql = "SELECT * FROM `proceso` WHERE estandar_id=".$estandar_id;
$result =$conn->query($sql);
$outp = array();
$outp = $result->fetch_all(MYSQLI_ASSOC);
        
echo json_encode($outp);