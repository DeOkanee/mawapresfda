<?php
require_once 'config_2024.php';

function sendJsonResponse($message, $status = 400) {
    header('Content-Type: application/json');
    http_response_code($status);
    echo json_encode(['message' => $message]);
    exit;
}

$conn = createConnection();
if (!$conn) {
    sendJsonResponse("Database connection failed", 500);
}

if (!isset($_GET['id']) || !filter_var($_GET['id'], FILTER_VALIDATE_INT)) {
    sendJsonResponse("Invalid sertifikat ID");
}

$id = (int)$_GET['id'];
$sql = "SELECT file_path FROM sertifikat_2024 WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    sendJsonResponse("Sertifikat not found", 404);
}

$row = $result->fetch_assoc();
$file_path = "../uploads/" . basename($row['file_path']);

if (!file_exists($file_path)) {
    sendJsonResponse("File not found", 404);
}

$finfo = finfo_open(FILEINFO_MIME_TYPE);
$mime_type = finfo_file($finfo, $file_path);
finfo_close($finfo);

header('Content-Type: ' . $mime_type);
header('Content-Disposition: attachment; filename="' . basename($file_path) . '"');
header('Content-Length: ' . filesize($file_path));

readfile($file_path);

closeConnection($conn);
exit;
?>