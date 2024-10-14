function fetchMahasiswaData() {
    return fetch('includes/get_mahasiswa.php')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .catch(error => {
            console.error('Error fetching mahasiswa data:', error);
            return [];
        });
}

function loadMahasiswa() {
    const tableBody = document.querySelector("#mahasiswaTable tbody");
    if (!tableBody) {
        console.error("Table body not found. Make sure the table exists with id 'mahasiswaTable'.");
        return;
    }
    tableBody.innerHTML = ''; // Clear existing rows

    fetchMahasiswaData().then(mahasiswaData => {
        if (mahasiswaData.error) {
            console.error("Error from server:", mahasiswaData.error);
            return;
        }
        mahasiswaData.forEach((mahasiswa, index) => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td class="No"> ${index + 1}</td>
                <td class="Nama">${mahasiswa.nama}</td>
                <td>${mahasiswa.prodi}</td>
                <td>${mahasiswa.jenis_prestasi}</td>
                <td>${mahasiswa.peringkat}</td>
                <td><button onclick="showDownloadForm('${mahasiswa.nim}', '${mahasiswa.sertifikat_id}', '${mahasiswa.nama}', '${mahasiswa.jenis_prestasi}')">Download</button></td>
            `;
            tableBody.appendChild(row);
        });
    });
}

document.addEventListener('DOMContentLoaded', loadMahasiswa);