<!--upload.php-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Data Prestasi 2023</title>
    <link rel="stylesheet" href="../css/upload-php.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
      rel="icon"
      href="https://res.cloudinary.com/dr8dzahhw/image/upload/v1724736625/rclimerx96mykamipbrg.png"
      type="image/x-icon"
    />
</head>
<body>
<?php
require_once "config_2023.php";

$tahun_akademik = 2023;
$conn = createConnection();
if (!$conn) {
    die("Connection failed: " . $conn->connect_error);
}

$target_dir = "../uploads/";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nim = trim($_POST['nim']);
    $nama = trim($_POST['nama']);
    $prodi = trim($_POST['prodi']);
    $jenis_prestasi = trim($_POST['jenis_prestasi']);
    $peringkat = trim($_POST['peringkat']);

    if (empty($nim) || empty($nama) || empty($prodi) || empty($jenis_prestasi) || empty($peringkat)) {
        echo '<div class="alert alert-danger">Semua field harus diisi.</div>';
        exit;
    }

    $file_name = basename($_FILES["sertifikat"]["name"]);
$file_extension = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
$new_file_name = $nim . "_" . time() . "." . $file_extension;
$target_file = $target_dir . $new_file_name;
$uploadOk = 1;

if ($file_extension != 'pdf') {
    $check = getimagesize($_FILES["sertifikat"]["tmp_name"]);
    if ($check === false) {
        echo '<div class="alert alert-danger">File bukan gambar yang valid.</div>';
        $uploadOk = 0;
    }
}

if ($_FILES["sertifikat"]["size"] > 5000000) {
    echo '<div class="alert alert-danger">Maaf, file terlalu besar. Maksimum ukuran file adalah 5 MB.</div>';
    $uploadOk = 0;
}

if (!in_array($file_extension, ["jpg", "jpeg", "png", "gif", "pdf"])) {
    echo '<div class="alert alert-danger">Maaf, hanya file JPG, JPEG, PNG, GIF, & PDF yang diizinkan.</div>';
    $uploadOk = 0;
}


    if ($uploadOk == 1) {
        if (move_uploaded_file($_FILES["sertifikat"]["tmp_name"], $target_file)) {
            $sql_mahasiswa = "INSERT INTO mahasiswa_2023 (nim, nama, prodi) VALUES (?, ?, ?)";
            $stmt_mahasiswa = $conn->prepare($sql_mahasiswa);
            if ($stmt_mahasiswa === false) {
                echo '<div class="alert alert-danger">Error prepare: ' . $conn->error . '</div>';
                exit;
            }
            $stmt_mahasiswa->bind_param("sss", $nim, $nama, $prodi);

            if ($stmt_mahasiswa->execute()) {
                $mahasiswa_id = $stmt_mahasiswa->insert_id;

                $sql_prestasi = "INSERT INTO prestasi_2023 (mahasiswa_id, jenis_prestasi, peringkat) VALUES (?, ?, ?)";
                $stmt_prestasi = $conn->prepare($sql_prestasi);
                if ($stmt_prestasi === false) {
                    echo '<div class="alert alert-danger">Error prepare prestasi: ' . $conn->error . '</div>';
                    exit;
                }
                $stmt_prestasi->bind_param("iss", $mahasiswa_id, $jenis_prestasi, $peringkat);

                if ($stmt_prestasi->execute()) {
                    $prestasi_id = $stmt_prestasi->insert_id;

                    $sql_sertifikat = "INSERT INTO sertifikat_2023 (prestasi_id, file_path) VALUES (?, ?)";
                    $stmt_sertifikat = $conn->prepare($sql_sertifikat);
                    if ($stmt_sertifikat === false) {
                        echo '<div class="alert alert-danger">Error prepare sertifikat: ' . $conn->error . '</div>';
                        exit;
                    }
                    $stmt_sertifikat->bind_param("is", $prestasi_id, $target_file);

                    if ($stmt_sertifikat->execute()) {
                        echo '<div class="alert alert-success">Data berhasil diupload untuk tahun akademik ' . $tahun_akademik . '.</div>';
                        echo '<div class="upload-container">';
                        echo '<a href="../akademik-2023.html" class="btn btn-primary">Lihat Data</a>';
                        echo '</div>';
                    } else {
                        echo '<div class="alert alert-danger">Terjadi kesalahan saat menyimpan data sertifikat.</div>';
                    }
                } else {
                    echo '<div class="alert alert-danger">Terjadi kesalahan saat menyimpan data prestasi.</div>';
                }
            } else {
                echo '<div class="alert alert-danger">Terjadi kesalahan saat menyimpan data mahasiswa.</div>';
            }
        } else {
            echo '<div class="alert alert-danger">Maaf, terjadi error saat mengupload file.</div>';
        }
    }
}

closeConnection($conn);
?>
<script src="../js/nim-handler.js"></script>
<script src="../js/Download.js"></script>
</body>
</html>
