<?php
$connection = new mysqli("localhost","root", "", "db_sewa_ps");
$nama_produk = $_POST['nama_produk'];
$harga = $_POST['harga'];



$result =mysqli_query($connection, "insert into produk set nama_produk='$nama_produk', harga='$harga'");

if($result){
    echo json_encode([
        'message' => 'Berhasil Mendaftar'
    ]);
}else{
    echo json_encode([
        'message' => 'Gagal Mendaftar'
    ]);
}