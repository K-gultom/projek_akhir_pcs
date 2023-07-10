<?php
$connection = new mysqli("localhost", "root", "", "db_sewa_ps");

// Mengambil data pesanan beserta nama produk
$query = "SELECT p.*, pr.nama_produk, pr.harga
          FROM pesanan p
          JOIN produk pr ON p.id_produk = pr.id";

$data = mysqli_query($connection, $query);

$data = mysqli_fetch_all($data, MYSQLI_ASSOC);

echo json_encode($data);
?>