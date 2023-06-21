<?php
$db = mysqli_connect('localhost','root','db_sewa_ps',);

$email=$_POST['email'];
$password=$_POST['password'];

$sql = "SELECT * FROM users WHERE email= '".email."' AND password ='".$password."'";
$result = mysqli_query($db,$sql);
$count= mysqli_num_rows($result);

if($count==1){
    echo json_encode("Sukses");
}else{
    echo json_encode("Error");
}

?>
