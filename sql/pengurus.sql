-- TABLE Pengurus
CREATE TABLE Pengurus (
    id_anggota VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Anggota(id),
    id_jabatan VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Jabatan(id_jabatan)
);

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