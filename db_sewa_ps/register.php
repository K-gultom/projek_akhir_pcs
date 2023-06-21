<?php
$connection = new mysqli("localhost","root", "", "db_sewa_ps");
$name = $_POST['name'];
$email = $_POST['email'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$password = $_POST['password'];


$result =mysqli_query($connection, "insert into users set name='$name', email='$email', address='$address', phone='$phone',password='$password'");

if($result){
    echo json_encode([
        'message' => 'Berhasil Mendaftar'
    ]);
}else{
    echo json_encode([
        'message' => 'Gagal Mendaftar'
    ]);
}