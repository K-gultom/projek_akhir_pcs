<?php
// Ambil nilai dari Flutter
$id_produk = $_POST['id_produk'];
$nama_customer = $_POST['nama_customer'];
$lama_sewa = $_POST['lama_sewa'];
$jaminan = $_POST['jaminan'];
$total_harga = $_POST['total_harga'];

// Konfigurasi koneksi database MySQL
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'db_sewa_ps';

// Membuat koneksi ke database
$conn = new mysqli($host, $username, $password, $database);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi ke database gagal: " . $conn->connect_error);
}

// Menyiapkan pernyataan SQL untuk menyimpan pesanan ke database
$sql = "INSERT INTO pesanan (id_produk, nama_customer, lama_sewa, jaminan, total_harga)
        VALUES ('$id_produk', '$nama_customer', '$lama_sewa', '$jaminan', '$total_harga')";

// Menjalankan pernyataan SQL
if ($conn->query($sql) === TRUE) {
    echo "Pesanan berhasil disimpan ke database.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Menutup koneksi ke database
$conn->close();
?>
