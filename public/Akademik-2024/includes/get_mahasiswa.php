<?php
header('Content-Type: application/json');

// Suppress warnings and notices
error_reporting(E_ERROR | E_PARSE);

require_once 'config_2024.php';

$conn = createConnection();
if (!$conn) {
    echo json_encode(['error' => 'Database connection failed']);
    exit;
}

$sql = "SELECT m.id, m.nim, m.nama, m.prodi, p.jenis_prestasi, p.peringkat, s.id as sertifikat_id 
        FROM mahasiswa_2024 m 
        JOIN prestasi_2024 p ON m.id = p.mahasiswa_id 
        JOIN sertifikat_2024 s ON p.id = s.prestasi_id";

$result = $conn->query($sql);

$data = array();
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
} else {
    echo json_encode(['error' => 'Query error: ' . $conn->error]);
    exit;
}

echo json_encode($data);

closeConnection($conn);
?>