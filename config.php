<?php
// Database connection configuration
$db_host = "localhost";  
$db_name = "fbb";  
$db_user = "root";  
$db_pass = "";  

// Create database connection
try {
    $conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Database Connection Error: " . $e->getMessage());
}
?>