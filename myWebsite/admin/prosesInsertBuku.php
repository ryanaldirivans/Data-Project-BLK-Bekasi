<?php 
require_once "koneksi.php";
$nama = $_POST['namaBuku'];
$penerbit = $_POST['namaPenerbit'];
$penulis = $_POST['namaPenulis'];
$tahun = ($_POST['tahunTerbit']);

$sql = "INSERT INTO tb_buku VALUES(null,'$nama','$penerbit','$penulis','$tahun')";

if($conn->query($sql) === TRUE){
	echo "<script>alert('Data berhasil disimpan')</script>";
	echo "<script>window.location.assign('index.php?p=DataBuku')</script>";
}else{
	echo "<script>alert('Data gagal disimpan $conn->error')</script>";
	echo "<script>window.location.assign('index.php?p=DataBuku')</script>";
}

?>