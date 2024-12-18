-- Tabel Jabatan
CREATE TABLE Jabatan (
    id_jabatan VARCHAR(50) PRIMARY KEY,
    jabatan VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Jabatan (id_jabatan, jabatan) VALUES
('J01', 'Ketua'),
('J02', 'Sekretaris'),
('J03', 'Bendahara'),
('J04', 'Pengawas'),
('J05', 'Anggota Pengurus'),
('J06', 'Staf Administrasi'),
('J07', 'Staf Keuangan'),
('J08', 'Staf Operasional'),
('J09', 'Koordinator Lapangan'),
('J10', 'Pengelola IT'),
('J11', 'Penasihat'),
('J12', 'Divisi Pemasaran'),
('J13', 'Divisi Hukum'),
('J14', 'Divisi Pelatihan'),
('J15', 'Divisi Pengembangan Usaha');