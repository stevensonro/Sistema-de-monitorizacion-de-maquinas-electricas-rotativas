<?php
 //recibe datos 
$json=$_REQUEST["json_payload"];
$foto=$_REQUEST["foto"];


$datos = json_decode($json, true);


//arreglo de datos
$tiempounix = $datos[0];
$rpm = $datos[1];
$ambientales = array_slice($datos, 2,3);

$instantaneo = array_slice($datos, 5,96); 
$minimos = array_slice($datos, 101,96);
$maximos = array_slice($datos, 197,96);


$sonido = array_slice($datos, 293); 
$jsonido=json_encode($sonido);
 //credenciales

$sevidor = "localhost";
$usuario = "id245101_usuario";
$contrasena = "univalle";
$nombrebd = "id245101_bdmaquina";
 // Crear conexion 
$conn = new mysqli($sevidor, $usuario, $contrasena, $nombrebd);
// verificar conexion
if ($conn->connect_error) {
    die("Conexion fallida: " . $conn->connect_error);
} 

$sqli = "INSERT INTO `tbimagenes` ( `imagen`) VALUES ( '$foto');";


$sql = "INSERT INTO `tbambientales` ( `tiempounix`, `temperaturamaquina`, `temperaturaambiente`, `humedadrelativa`, `sonido`) VALUES ( '$tiempounix', '$ambientales[0]', '$ambientales[1]', '$ambientales[2]', '$jsonido');";

$sql2 = "INSERT INTO `tbintantaneos` ( `tiempounix`, `rpm`, `tensionl1`, `corrientel1`, `pactival1`, `preactival1`, `factorpl1`, `tensionl2`, `corrientel2`, `pactival2`, `preactival2`, `factorpl2`, `tensionl3`, `corrientel3`, `pactival3`, `preactival3`, `factorpl3`, `pactiva3f`, `pinductiva3f`, `pcapacitiva3f`, `cosenofi3f`, `factorp3f`, `frecuencia`, `tensionl12`, `tensionl23`, `tensionl31`, `distv1`, `distv2`, `distv3`, `dista1`, `dista2`, `dista3`, `paparente3f`, `maximademanda`, `corrientetrifasicamedia`, `corrientedeneutro`, `maxdemandaa2`, `maxdemandaa3`, `energiaactiva`, `energiareactivai`, `energiareactivac`, `energiaaparente`, `energiaactivag`, `energiareactivaig`, `energiareactivacg`, `energiaaparenteg`) VALUES (  '$tiempounix', '$rpm', '$instantaneo[1]', '$instantaneo[3]', '$instantaneo[5]', '$instantaneo[7]', '$instantaneo[9]', '$instantaneo[11]', '$instantaneo[13]', '$instantaneo[15]', '$instantaneo[17]', '$instantaneo[19]', '$instantaneo[21]', '$instantaneo[23]', '$instantaneo[25]', '$instantaneo[27]', '$instantaneo[29]', '$instantaneo[31]', '$instantaneo[33]', '$instantaneo[35]', '$instantaneo[37]', '$instantaneo[39]', '$instantaneo[41]', '$instantaneo[43]', '$instantaneo[45]', '$instantaneo[47]', '$instantaneo[49]', '$instantaneo[51]', '$instantaneo[53]', '$instantaneo[55]', '$instantaneo[57]', '$instantaneo[59]', '$instantaneo[67]', '$instantaneo[69]', '$instantaneo[71]', '$instantaneo[73]', '$instantaneo[83]', '$instantaneo[85]','$instantaneo[61]', '$instantaneo[63]', '$instantaneo[65]', '$instantaneo[87]', '$instantaneo[89]', '$instantaneo[91]', '$instantaneo[93]', '$instantaneo[95]');";

$sql3 = "INSERT INTO `tbminimos` ( `tiempounix`, `tensionl1`, `corrientel1`, `pactival1`, `preactival1`, `factorpl1`, `tensionl2`, `corrientel2`, `pactival2`, `preactival2`, `factorpl2`, `tensionl3`, `corrientel3`, `pactival3`, `preactival3`, `factorpl3`, `pactiva3f`, `pinductiva3f`, `pcapacitiva3f`, `cosenofi3f`, `factorp3f`, `frecuencia`, `tensionl12`, `tensionl23`, `tensionl31`, `distv1`, `distv2`, `distv3`, `dista1`, `dista2`, `dista3`, `paparente3f`, `maximademanda`, `corrientetrifasicamedia`, `corrientedeneutro`, `maxdemandaa2`, `maxdemandaa3`, `energiaactiva`, `energiareactivai`, `energiareactivac`, `energiaaparente`, `energiaactivag`, `energiareactivaig`, `energiareactivacg`, `energiaaparenteg`) VALUES (  '$tiempounix', '$minimos[1]', '$minimos[3]', '$minimos[5]', '$minimos[7]', '$minimos[9]', '$minimos[11]', '$minimos[13]', '$minimos[15]', '$minimos[17]', '$minimos[19]', '$minimos[21]', '$minimos[23]', '$minimos[25]', '$minimos[27]', '$minimos[29]', '$minimos[31]', '$minimos[33]', '$minimos[35]', '$minimos[37]', '$minimos[39]', '$minimos[41]', '$minimos[43]', '$minimos[45]', '$minimos[47]', '$minimos[49]', '$minimos[51]', '$minimos[53]', '$minimos[55]', '$minimos[57]', '$minimos[59]', '$minimos[67]', '$minimos[69]', '$minimos[71]', '$minimos[73]', '$minimos[83]', '$minimos[85]','$minimos[61]', '$minimos[63]', '$minimos[65]', '$minimos[87]', '$minimos[89]', '$minimos[91]', '$minimos[93]', '$minimos[95]');";

$sql4 = "INSERT INTO `tbmaximos` ( `tiempounix`, `tensionl1`, `corrientel1`, `pactival1`, `preactival1`, `factorpl1`, `tensionl2`, `corrientel2`, `pactival2`, `preactival2`, `factorpl2`, `tensionl3`, `corrientel3`, `pactival3`, `preactival3`, `factorpl3`, `pactiva3f`, `pinductiva3f`, `pcapacitiva3f`, `cosenofi3f`, `factorp3f`, `frecuencia`, `tensionl12`, `tensionl23`, `tensionl31`, `distv1`, `distv2`, `distv3`, `dista1`, `dista2`, `dista3`, `paparente3f`, `maximademanda`, `corrientetrifasicamedia`, `corrientedeneutro`, `maxdemandaa2`, `maxdemandaa3`, `energiaactiva`, `energiareactivai`, `energiareactivac`, `energiaaparente`, `energiaactivag`, `energiareactivaig`, `energiareactivacg`, `energiaaparenteg`) VALUES (  '$tiempounix', '$maximos[1]', '$maximos[3]', '$maximos[5]', '$maximos[7]', '$maximos[9]', '$maximos[11]', '$maximos[13]', '$maximos[15]', '$maximos[17]', '$maximos[19]', '$maximos[21]', '$maximos[23]', '$maximos[25]', '$maximos[27]', '$maximos[29]', '$maximos[31]', '$maximos[33]', '$maximos[35]', '$maximos[37]', '$maximos[39]', '$maximos[41]', '$maximos[43]', '$maximos[45]', '$maximos[47]', '$maximos[49]', '$maximos[51]', '$maximos[53]', '$maximos[55]', '$maximos[57]', '$maximos[59]', '$maximos[67]', '$maximos[69]', '$maximos[71]', '$maximos[73]', '$maximos[83]', '$maximos[85]','$maximos[61]', '$maximos[63]', '$maximos[65]', '$maximos[87]', '$maximos[89]', '$maximos[91]', '$maximos[93]', '$maximos[95]');";


$conn->query($sql2);
$conn->query($sql3);
$conn->query($sql4);
$conn->query($sql);

if ($conn->query($sqli) === TRUE) {
    echo 'datos recibidos';
} else {
    echo "Error: " . $sqli . "<br>" . $conn->error;
}
$conn->close();
?>