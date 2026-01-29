SELECT
    s.*,
    k.nama_kelas,
    k.wali_kelas,
    n.tahun_ajaran
FROM
    siswa_fadlans
JOIN kelas_fadlank ON
    s.id_kelas = k.id_kelas
JOIN nilai_fadlann ON
    s.nis = n.nis
WHERE
    s.nis = '$nis'
LIMIT 1;