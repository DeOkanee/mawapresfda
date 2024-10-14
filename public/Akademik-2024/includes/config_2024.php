<?php
function createConnection() {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "sertifikat_mahasiswa_akademik";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        return false;
    }
    return $conn;
}

function closeConnection($conn) {
    $conn->close();
}
?>