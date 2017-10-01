<?php 

$server = "localhost";
$user = "id245101_usuario";
$pass = "univalle";
$bd = "id245101_bdmaquina";


$conexion = mysqli_connect($server, $user, $pass,$bd) 
or die("Ha sucedido un error inesperado en la conexion de la base de datos");


$sql = "SELECT * FROM tbintantaneos ORDER BY id DESC LIMIT 0,1";
mysqli_set_charset($conexion, "utf8"); //formato de datos utf8

if(!$result = mysqli_query($conexion, $sql)) die();


$res = mysqli_fetch_row($result);


$close = mysqli_close($conexion) 
or die("Ha sucedido un error inesperado en la desconexion de la base de datos");
 

$json_string = json_encode($res);

echo $_GET['callback'] . '(' . $json_string . ')';




?>