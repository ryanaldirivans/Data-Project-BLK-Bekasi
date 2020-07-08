<?php 
define('phi', 3.14);
$radius=$_POST['r'];
$kel=2 *phi*$radius;
$luas=0.5*phi*$radius;
echo $kel.$luas;

?>