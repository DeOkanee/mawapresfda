<?php
$servername = "localhost";
$username = "root";  // Sesuaikan dengan username MySQL Anda
$password = "";      // Sesuaikan dengan password MySQL Anda
$dbname = "sertifikat_mahasiswa_akademik";

// Koneksi ke database utama
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Fungsi untuk memilih schema (tahun)
function select_schema($conn, $year) {
    $schema_name = "sertifikat_mahasiswa_akademik" . $year;
    $conn->query("USE $schema_name");
}

// Fungsi untuk mendapatkan koneksi ke schema tertentu
function get_connection($year) {
    global $servername, $username, $password, $dbname;
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    if ($conn->connect_error) {
        die("Koneksi gagal: " . $conn->connect_error);
    }
    
    select_schema($conn, $year);
    
    return $conn;
}

// Contoh penggunaan:
// $conn_2023 = get_connection('23');
// $conn_2024 = get_connection('24');
?>