<?php
include 'koneksi.php';

$sql = "SELECT 
            n.id_nilai, s.nis, s.nama AS nama_siswa, 
            k.nama_kelas AS kelas, m.nama_mapel AS nama_mapel, 
            m.kkm, n.nilai_tugas, n.nilai_uts, n.nilai_uas, 
            n.nilai_akhir, n.deskripsi, n.semester, n.tahun_ajaran 
        FROM nilai_istifafakha n 
        JOIN siswa_istifafakha s ON n.nis = s.nis 
        JOIN kelas_istifafakha k ON s.id_kelas = k.id_kelas 
        JOIN mapel_istifafaka m ON n.id_mapel = m.id_mapel 
        ORDER BY n.id_nilai ASC;";

$result = $koneksi->query($sql);
$data_siswa = $result->fetch_assoc();
mysqli_data_seek($result, 0);
?>
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

    .red {
        color: #d9534f;
        font-weight: bold;
    }
</style>

<h2 style="margin:0; letter-spacing: 2px;">SMK Negeri 2 CIMAHI <br> HASIL CAPAIAN KOMPETENSI SISWA</h2> <br><br>
<table class="table-data">
    <thead>
        <tr>
            <th width="5%">ID Nilai</th>
            <th width="5%">NIS</th>
            <th width="15%">Nama Siswa</th>
            <th width="7%">Kelas</th>
            <th width="10%">Mata Pelajaran</th>
            <th width="5%">KKM</th>
            <th width="5%">Tugas</th>
            <th width="5%">UTS</th>
            <th width="5%">UAS</th>
            <th width="8%">Nilai Akhir</th>
            <th>Deskripsi</th>
            <th width="8%">Semester</th>
            <th width="8%">Tahun Pelajaran</th>
            <th width="9%" class="btn-aksi">Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $no = 1;
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $is_remedial = ($row['nilai_akhir'] < $row['kkm']) ? "red" : "";
                echo "<tr>";
                echo "<td class='text-center'>" . $row['id_nilai'] . "</td>";
                echo "<td class='text-center'>" . $row['nis'] . "</td>";
                echo "<td class='text-center'>" . $row['nama_siswa'] . "</td>";
                echo "<td class='text-center'>" . $row['kelas'] . "</td>";
                echo "<td>" . $row['nama_mapel'] . "</td>";
                echo "<td class='text-center'>" . $row['kkm'] . "</td>";
                echo "<td class='text-center'>" . $row['nilai_tugas'] . "</td>";
                echo "<td class='text-center'>" . $row['nilai_uts'] . "</td>";
                echo "<td class='text-center'>" . $row['nilai_uas'] . "</td>";
                echo "<td class='text-center bold $is_remedial'>" . $row['nilai_akhir'] . "</td>";
                echo "<td <td class='text-centerstyle='font-size:12px;'>" . $row['deskripsi'] . "</td>";
                echo "<td class='text-center'>" . $row['semester'] . "</td>";
                echo "<td class='text-center'>" . $row['tahun_ajaran'] . "</td>";
                echo "<td>
                        <a href='editdata_istifafakha.php?id=" . $row['id_nilai'] . "' class='btn'>Edit</a>
                        <a href='hapusdata_istifafakha.php?id=" . $row['id_nilai'] . "' class='btn' onclick='return confirm(\"Yakin hapus?\")'>Hapus</a>
                        <a href='cetak_istifafakha.php?nis=" . $row['nis'] . "&smt=" . $row['semester'] . "&tp=" . $row['tahun_ajaran'] . "' class='btn'>Cetak</a>
                        </td>";
                echo "</tr>";
            }
        }
        ?>
    </tbody>
</table>
<a href='tambahdata_istifafakha.php' class='btn'>Tambah Nilai</a> <br>
<a href='tambahsiswa_istifafakha.php' class='btn'>Tambah Data Siswa</a>
<a href='siswadata_istifafakha.php' class='btn'>Data Siswa</a>
