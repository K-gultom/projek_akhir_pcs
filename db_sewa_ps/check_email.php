<?php

// Establish database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_sewa_ps";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get email parameter from request
$email = $_POST['email'];

// Prepare SQL statement to check if email exists
$stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

// Check if email exists
if ($result->num_rows > 0) {
    echo "exists";
} else {
    echo "not_exists";
}

// Close database connection
$stmt->close();
$conn->close();

?>
