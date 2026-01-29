<?php
include 'koneksi.php';

$sql = "SELECT s.*, k.nama_kelas 
        FROM siswa_istifafakha s 
        JOIN kelas_istifafakha k ON s.id_kelas = k.id_kelas 
        ORDER BY k.nama_kelas ASC, s.nama ASC";

$result = $koneksi->query($sql);
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <title>Daftar Siswa - E-Raport</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            margin: 20px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 30px;
            border-bottom: 3px solid #007bff;
            display: inline-block;
            width: 100%;
            padding-bottom: 10px;
        }

        p {
            text-align: center;
            margin-bottom: 20px;
        }

        .table-info {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            border: none !important;
        }

        .table-info td {
            padding: 5px;
            border: none !important;
            vertical-align: top;
        }

        .table-data {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .table-data th,
        .table-data td {
            border: 1px solid #444;
            padding: 10px 8px;
        }

        .text-center {
            text-align: center;
        }

        .bold {
            font-weight: bold;
        }
    </style>
</head>
<center>

    <body>

        <div class="container">
            <h2>Daftar Seluruh Siswa</h2>

            <table>
                <thead>
                    <tr>
                        <th width="5%" class="text-center">No</th>
                        <th width="12%">NIS</th>
                        <th width="25%">Nama Lengkap</th>
                        <th width="10%">Kelas</th>
                        <th width="15%">Tempat, Tgl Lahir</th>
                        <th width="20%">Alamat</th>
                        <th width="13%" class="text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no = 1;
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            $tgl_indo = date('d-m-Y', strtotime($row['tgl_lahir']));

                            echo "<tr>";
                            echo "<td class='text-center'>" . $no++ . "</td>";
                            echo "<td><strong>" . $row['nis'] . "</strong></td>";
                            echo "<td>" . $row['nama'] . "</td>";
                            echo "<td>" . $row['nama_kelas'] . "</td>";
                            echo "<td>" . $row['tempat_lahir'] . ", " . $tgl_indo . "</td>";
                            echo "<td>" . $row['alamat'] . "</td>";
                            echo "<td class='text-center'>
                            <a href='edit_siswa.php?nis=" . $row['nis'] . "' class='btn btn-edit'>Edit</a>
                            <a href='hapus_siswa.php?nis=" . $row['nis'] . "' class='btn btn-hapus' onclick=\"return confirm('Hapus siswa ini? Semua nilai terkait juga akan terhapus!')\">Hapus</a>
                          </td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='7' class='text-center'>Belum ada data siswa.</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </body><br>
    <a href="tambahdata_istifafakha.php" class="btn btn-tambah">ᯓ➤Tambah Siswa Baru</a> <br>
    <a href="output.php" class="btn">ᯓ➤Lihat Daftar Nilai</a>
</center>

</html>