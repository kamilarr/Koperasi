-- Data Koperasi Simpan Pinjam
DELETE FROM TRANSAKSI;
DELETE FROM SIMPANAN_WAJIB;
DELETE FROM SIMPANAN_POKOK;
DELETE FROM SIMPANAN_BEBAS;
DELETE FROM SIMPANAN;
DELETE FROM SHU;
DELETE FROM PINJAMAN_USAHA;
DELETE FROM PINJAMAN_KONSUMTIF;
DELETE FROM PINJAMAN;
DELETE FROM PENGURUS;
DELETE FROM JABATAN;
DELETE FROM ANGGOTA;

-- Anggota
INSERT INTO Anggota (id_anggota, nama, alamat, no_identitas, tgl_pendaftaran, status_keanggotaan) VALUES
('A01', 'Budi Santoso', 'Jl. Melati No.1', '123456789', '2024-01-10', 'Aktif'),
('A02', 'Siti Aminah', 'Jl. Anggrek No.2', '987654321', '2024-01-10', 'Aktif'),
('A03', 'Rina Ayu', 'Jl. Mawar No.3', '567891234', '2024-01-10', 'Aktif'),
('A04', 'Ahmad Fauzi', 'Jl. Tulip No.4', '234567890', '2024-01-11', 'Aktif'),
('A05', 'Dewi Lestari', 'Jl. Kenanga No.5', '345678901', '2024-01-11', 'Aktif'),
('A06', 'Yusuf Alwi', 'Jl. Dahlia No.6', '456789012', '2024-01-11', 'Aktif'),
('A07', 'Maya Sari', 'Jl. Kamboja No.7', '567890123', '2024-01-12', 'Aktif'),
('A08', 'Rahmat Hidayat', 'Jl. Cempaka No.8', '678901234', '2024-01-12', 'Aktif'),
('A09', 'Laila Nur', 'Jl. Flamboyan No.9', '789012345', '2024-01-12', 'Aktif'),
('A10', 'Fadhil Ilham', 'Jl. Teratai No.10', '890123456', '2024-01-12', 'Aktif'),
('A11', 'Nina Astuti', 'Jl. Sakura No.11', '901234567', '2024-01-12', 'Tidak Aktif'),
('A12', 'Andi Wijaya', 'Jl. Krisan No.12', '12345678', '2024-01-13', 'Aktif'),
('A13', 'Ratna Kusuma', 'Jl. Lili No.13', '123450987', '2024-01-13', 'Aktif'),
('A14', 'Fauzan Ramadhan', 'Jl. Puspa No.14', '234560876', '2024-01-15', 'Aktif'),
('A15', 'Diana Permata', 'Jl. Seruni No.15', '345670765', '2024-01-15', 'Aktif');

-- Jabatan
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

-- Pengurus
INSERT INTO Pengurus (id_anggota, id_jabatan) VALUES
('A01', 'J01'),
('A02', 'J02'),
('A03', 'J03'),
('A04', 'J04'),
('A05', 'J05'),
('A06', 'J06'),
('A07', 'J07'),
('A08', 'J08'),
('A09', 'J09'),
('A10', 'J10');

-- Simpanan
INSERT INTO Simpanan (id_simpanan, id_anggota, Jumlah, Tgl_Pembukaan, Jenis_Simpanan, Saldo) VALUES
('S01', 'A01', 10000000.00, '2024-01-10', 'Pokok', 10000000.00),
('S02', 'A02', 10000000.00, '2024-01-10', 'Pokok', 10000000.00),
('S03', 'A03', 10000000.00, '2024-01-10', 'Pokok', 10000000.00),
('S04', 'A04', 10000000.00, '2024-01-11', 'Pokok', 10000000.00),
('S05', 'A05', 10000000.00, '2024-01-11', 'Pokok', 10000000.00),
('S06', 'A06', 10000000.00, '2024-01-11', 'Pokok', 10000000.00),
('S07', 'A07', 10000000.00, '2024-01-12', 'Pokok', 10000000.00),
('S08', 'A08', 10000000.00, '2024-01-12', 'Pokok', 10000000.00),
('S09', 'A09', 10000000.00, '2024-01-12', 'Pokok', 10000000.00),
('S10', 'A10', 10000000.00, '2024-01-12', 'Pokok', 10000000.00),
('S11', 'A11', 10000000.00, '2024-01-12', 'Pokok', 10000000.00),
('S12', 'A12', 10000000.00, '2024-01-13', 'Pokok', 10000000.00),
('S13', 'A13', 10000000.00, '2024-01-13', 'Pokok', 10000000.00),
('S14', 'A14', 10000000.00, '2024-01-15', 'Pokok', 10000000.00),
('S15', 'A15', 10000000.00, '2024-01-15', 'Pokok', 10000000.00),
('S16', 'A02', 1000000.00, '2023-02-10', 'Wajib', 1000000.00),
('S17', 'A14', 1000000.00, '2024-02-10', 'Wajib', 1000000.00),
('S18', 'A15', 1200000.00, '2024-03-10', 'Bebas', 1200000.00),
('S19', 'A03', 150000.00, '2024-03-10', 'Bebas', 150000.00),
('S20', 'A05', 1000000.00, '2024-05-10', 'Wajib', 1000000.00),
('S21', 'A06', 50000.00, '2024-06-10', 'Bebas', 50000.00),
('S22', 'A08', 1000000.00, '2024-08-10', 'Wajib', 1000000.00),
('S23', 'A09', 450000.00, '2024-09-10', 'Bebas', 450000.00),
('S24', 'A11', 1000000.00, '2024-11-10', 'Wajib', 1000000.00),
('S25', 'A12', 300000.00, '2024-12-10', 'Bebas', 300000.00);

-- Simpanan Pokok
INSERT INTO Simpanan_Pokok (id_simpanan, id_transaksi, Status) VALUES
('S01', 'T01', 'Aktif'),
('S02', 'T02', 'Aktif'),
('S03', 'T03', 'Aktif'),
('S04', 'T04', 'Aktif'),
('S05', 'T05', 'Aktif'),
('S06', 'T06', 'Aktif'),
('S07', 'T07', 'Aktif'),
('S08', 'T08', 'Aktif'),
('S09', 'T09', 'Aktif'),
('S10', 'T10', 'Aktif'),
('S11', 'T11', 'Aktif'),
('S12', 'T12', 'Aktif'),
('S13', 'T13', 'Aktif'),
('S14', 'T14', 'Aktif'),
('S15', 'T15', 'Aktif');

-- Simpanan Wajib
INSERT INTO Simpanan_Bebas (id_simpanan, id_transaksi, Bunga)
VALUES
('S18', 'T23', 0.1),
('S19', 'T25', 0.1),
('S09', 'T31', 0.1),
('S23', 'T37', 0.1),
('S25', 'T40', 0.1);

-- Simpanan Bebas
INSERT INTO Simpanan_Wajib (id_simpanan, id_transaksi, Bulan_Pembayaran)
VALUES
('S16', 'T20', 'Februari'),
('S17', 'T21', 'Januari'),
('S20', 'T29', 'Februari'),
('S22', 'T34', 'Februari'),
('S24', 'T39', 'Februari');

-- Pinjaman
INSERT INTO Pinjaman (id_pinjaman, id_anggota, jenis_pinjaman, saldo, bunga, jadwal_pembayaran, status_pinjaman, jumlah)
VALUES
('P01', 'A01', 'Usaha', 5000000.00, 2.00, '2024-01-30', 'Aktif', 5000000.00),
('P02', 'A12', 'Konsumsi', 4000000.00, 2.00, '2023-01-30', 'Aktif', 4000000.00),
('P03', 'A13', 'Usaha', 9000000.00, 2.00, '2024-01-30', 'Aktif', 9000000.00),
('P04', 'A11', 'Usaha', 6000000.00, 2.00, '2023-02-01', 'Aktif', 6000000.00),
('P05', 'A14', 'Konsumsi', 3000000.00, 2.00, '2024-02-15', 'Aktif', 3000000.00),
('P06', 'A02', 'Konsumsi', 2000000.00, 2.00, '2024-02-28', 'Aktif', 2000000.00),
('P07', 'A15', 'Usaha', 2000000.00, 2.00, '2024-03-15', 'Aktif', 2000000.00),
('P08', 'A03', 'Usaha', 7500000.00, 2.00, '2024-03-25', 'Lunas', 7500000.00),
('P09', 'A04', 'Konsumsi', 3000000.00, 2.00, '2024-04-22', 'Aktif', 3000000.00),
('P10', 'A05', 'Usaha', 10000000.00, 2.00, '2024-05-10', 'Aktif', 10000000.00),
('P11', 'A06', 'Konsumsi', 4500000.00, 2.00, '2024-06-15', 'Aktif', 4500000.00),
('P12', 'A07', 'Usaha', 8500000.00, 2.00, '2024-07-18', 'Lunas', 8500000.00),
('P13', 'A08', 'Konsumsi', 7000000.00, 2.00, '2024-08-20', 'Aktif', 7000000.00),
('P14', 'A09', 'Usaha', 6000000.00, 2.00, '2024-09-05', 'Aktif', 6000000.00),
('P15', 'A10', 'Konsumsi', 5500000.00, 2.00, '2024-10-09', 'Lunas', 5500000.00);

-- Pinjaman Usaha
INSERT INTO Pinjaman_Usaha (id_pinjaman, id_transaksi, Jenis_Usaha)
VALUES
('P01', 'T16', 'Toko Kelontong'),
('P03', 'T20', 'Pertanian'),
('P04', 'T22', 'Warung Makan'),
('P07', 'T26', 'Peternakan'),
('P08', 'T27', 'Kios Sembako'),
('P10', 'T30', 'Toko Skincare'),
('P12', 'T33', 'Investasi Saham'),
('P14', 'T36', 'Warung Makan');

-- Pinjaman Konsumtif
INSERT INTO Pinjaman_Konsumtif (id_pinjaman, id_transaksi, Jenis_Konsumsi)
VALUES
('P02', 'T17', 'Biaya Pendidikan'),
('P05', 'T22', 'Kebutuhan Rumah Tangga'),
('P06', 'T23', 'Biaya Pernikahan'),
('P09', 'T28', 'Pembelian Elektronik'),
('P11', 'T32', 'Renovasi Rumah'),
('P13', 'T35', 'Pembelian Elektronik'),
('P15', 'T38', 'Biaya Pendidikan');

-- SHU
INSERT INTO SHU (id_shu, id_transaksi, Kontribusi, Tahun)
VALUES
('SHU01', 'T44', 25000.00, 2024),
('SHU02', 'T45', 20000.00, 2024),
('SHU03', 'T46', 45000.00, 2024),
('SHU04', 'T47', 30000.00, 2024),
('SHU05', 'T48', 15000.00, 2024),
('SHU06', 'T49', 10000.00, 2024),
('SHU07', 'T50', 10000.00, 2024),
('SHU08', 'T51', 37500.00, 2024),
('SHU09', 'T52', 15000.00, 2024),
('SHU10', 'T53', 50000.00, 2024),
('SHU11', 'T54', 22500.00, 2024),
('SHU12', 'T55', 42500.00, 2024),
('SHU13', 'T56', 35000.00, 2024),
('SHU14', 'T57', 30000.00, 2024),
('SHU15', 'T58', 27500.00, 2024);

-- Transaksi
INSERT INTO Transaksi (id_transaksi, id_anggota, Jumlah, Jenis_Transaksi, Tanggal_Transaksi)
VALUES
('T01', 'A01', 1000000.00, 'Simpanan Pokok', '2024-01-10'),
('T02', 'A02', 1000000.00, 'Simpanan Pokok', '2024-01-10'),
('T03', 'A03', 1000000.00, 'Simpanan Pokok', '2024-01-10'),
('T04', 'A04', 1000000.00, 'Simpanan Pokok', '2024-01-11'),
('T05', 'A05', 1000000.00, 'Simpanan Pokok', '2024-01-11'),
('T06', 'A06', 500000.00, 'Simpanan Pokok', '2024-01-11'),
('T07', 'A07', 500000.00, 'Simpanan Pokok', '2024-01-12'),
('T08', 'A08', 500000.00, 'Simpanan Pokok', '2024-01-12'),
('T09', 'A09', 500000.00, 'Simpanan Pokok', '2024-01-12'),
('T10', 'A10', 500000.00, 'Simpanan Pokok', '2024-01-12'),
('T11', 'A11', 750000.00, 'Simpanan Pokok', '2024-01-12'),
('T12', 'A12', 1500000.00, 'Simpanan Pokok', '2024-01-13'),
('T13', 'A13', 1200000.00, 'Simpanan Pokok', '2024-01-13'),
('T14', 'A14', 2000000.00, 'Simpanan Pokok', '2024-01-15'),
('T15', 'A15', 500000.00, 'Simpanan Pokok', '2024-01-15'),
('T16', 'A01', 5000000.00, 'Pinjaman Usaha', '2024-01-30'),
('T17', 'A12', 4000000.00, 'Pinjaman Konsumtif', '2024-01-30'),
('T18', 'A13', 9000000.00, 'Pinjaman Usaha', '2024-01-30'),
('T19', 'A11', 6000000.00, 'Pinjaman Usaha', '2024-02-01'),
('T20', 'A02', 1000000.00, 'Simpanan Wajib', '2024-02-10'),
('T21', 'A14', 1000000.00, 'Simpanan Wajib', '2024-02-10'),
('T22', 'A14', 3000000.00, 'Pinjaman Konsumtif', '2024-02-15'),
('T23', 'A02', 2000000.00, 'Pinjaman Konsumtif', '2024-02-28'),
('T24', 'A15', 1200000.00, 'Simpanan Bebas', '2024-03-10'),
('T25', 'A03', 150000.00, 'Simpanan Bebas', '2024-03-10'),
('T26', 'A15', 2000000.00, 'Pinjaman Usaha', '2024-03-15'),
('T27', 'A03', 7500000.00, 'Pinjaman Usaha', '2024-03-25'),
('T28', 'A04', 3000000.00, 'Pinjaman Konsumtif', '2024-04-22'),
('T29', 'A05', 1000000.00, 'Simpanan Wajib', '2024-05-10'),
('T30', 'A05', 10000000.00, 'Pinjaman Usaha', '2024-05-10'),
('T31', 'A06', 50000.00, 'Simpanan Bebas', '2024-06-10'),
('T32', 'A06', 4500000.00, 'Pinjaman Konsumtif', '2024-06-15'),
('T33', 'A07', 8500000.00, 'Pinjaman Usaha', '2024-07-18'),
('T34', 'A08', 1000000.00, 'Simpanan Wajib', '2024-08-10'),
('T35', 'A08', 7000000.00, 'Pinjaman Konsumtif', '2024-08-20'),
('T36', 'A09', 6000000.00, 'Pinjaman Usaha', '2024-09-05'),
('T37', 'A09', 450000.00, 'Simpanan Bebas', '2024-09-10'),
('T38', 'A10', 5500000.00, 'Pinjaman Konsumtif', '2024-10-09'),
('T39', 'A11', 1000000.00, 'Simpanan Wajib', '2024-11-10'),
('T40', 'A12', 300000.00, 'Simpanan Bebas', '2024-12-10'),
('T41', 'A01', 150000.00, 'Angsuran', '2024-12-11'),
('T42', 'A01', 150000.00, 'Angsuran', '2024-12-11'),
('T43', 'A01', 150000.00, 'Angsuran', '2024-12-12'),
('T44', 'A01', 25000.00, 'SHU', '2025-01-08'),
('T45', 'A12', 20000.00, 'SHU', '2025-01-08'),
('T46', 'A13', 45000.00, 'SHU', '2025-01-08'),
('T47', 'A11', 30000.00, 'SHU', '2025-01-08'),
('T48', 'A14', 15000.00, 'SHU', '2025-01-08'),
('T49', 'A02', 10000.00, 'SHU', '2025-01-08'),
('T50', 'A15', 10000.00, 'SHU', '2025-01-08'),
('T51', 'A03', 37500.00, 'SHU', '2025-01-08'),
('T52', 'A04', 15000.00, 'SHU', '2025-01-08'),
('T53', 'A05', 50000.00, 'SHU', '2025-01-08'),
('T54', 'A06', 22500.00, 'SHU', '2025-01-08'),
('T55', 'A07', 42500.00, 'SHU', '2025-01-08'),
('T56', 'A08', 35000.00, 'SHU', '2025-01-08'),
('T57', 'A09', 30000.00, 'SHU', '2025-01-08'),
('T58', 'A10', 27500.00, 'SHU', '2025-01-08');
