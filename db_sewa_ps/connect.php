<?php
$connect=new mysqli("localhost","root","","db_sewa_ps");
if($connect)
{
    echo"sukses";
}else
{
    echo"gagal";
}
?>
