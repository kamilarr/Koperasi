-- Tabel Anggota 
CREATE TABLE Anggota (
    id VARCHAR(50) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    no_identitas VARCHAR(50) NOT NULL UNIQUE,
    tgl_pendaftaran DATE NOT NULL,
    status_keanggotaan VARCHAR(50) NOT NULL CHECK (status_keanggotaan IN ('Aktif', 'Tidak Aktif'))
);

INSERT INTO Anggota (id, nama, alamat, no_identitas, tgl_pendaftaran, status_keanggotaan)
VALUES 
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

