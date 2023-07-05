<?php
header('Content-Type: application/json');


$host = "localhost";
$username = "root";
$password = "";
$database = "db_sewa_ps";

$connection = new mysqli($host, $username, $password, $database);

if ($connection->connect_errno) {
    $response = array(
        'status' => 'error',
        'message' => 'Koneksi gagal: ' . $connection->connect_error
    );
    echo json_encode($response);
    exit;
}


$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if (!empty($email) && !empty($password)) {
  
    $email = $connection->real_escape_string($email);
    $password = $connection->real_escape_string($password);

    $query = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";
    $result = $connection->query($query);

    if ($result && $result->num_rows > 0) {
        // Berhasil login
        $response = array(
            'status' => 'success',
            'message' => 'Login berhasil!'
        );
    } else {
        // Gagal login
        $response = array(
            'status' => 'error',
            'message' => 'Email atau password salah!'
        );
    }
} else {
    // Parameter tidak lengkap
    $response = array(
        'status' => 'error',
        'message' => 'Email dan password harus diisi!'
    );
}


$connection->close();

echo json_encode($response);
?>
