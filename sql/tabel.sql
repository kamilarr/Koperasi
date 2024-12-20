-- Tabel Jabatan
CREATE TABLE Jabatan (
    id_jabatan VARCHAR(50) PRIMARY KEY,
    jabatan VARCHAR(100) NOT NULL UNIQUE
);

-- Tabel Anggota
CREATE TABLE Anggota (
    id VARCHAR(50) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    no_identitas VARCHAR(50) NOT NULL UNIQUE,
    tgl_pendaftaran DATE NOT NULL,
    status_keanggotaan VARCHAR(50) NOT NULL CHECK (status_keanggotaan IN ('Aktif', 'Tidak Aktif'))
);

-- Tabel Pengurus
CREATE TABLE Pengurus (
    id_anggota VARCHAR(50) PRIMARY KEY FOREIGN KEY REFERENCES Anggota(id_anggota),
    id_jabatan VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Jabatan(id_jabatan)
);

-- Tabel Transaksi
CREATE TABLE Transaksi (
    id_transaksi VARCHAR(50) PRIMARY KEY,
    id_anggota VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Anggota(id_anggota),
    jumlah DECIMAL(18, 2) NOT NULL CHECK (jumlah >= 0),
    jenis_transaksi VARCHAR(50) NOT NULL,
    tanggal_transaksi DATE NOT NULL
);

-- Tabel Simpanan
CREATE TABLE Simpanan (
    id_simpanan VARCHAR(50) PRIMARY KEY,
    id_anggota VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Anggota(id_anggota),
    jumlah DECIMAL(18, 2) NOT NULL CHECK (jumlah >= 0),
    tgl_pembukaan DATE NOT NULL,
    jenis_simpanan VARCHAR(50) NOT NULL CHECK (jenis_simpanan IN ('Pokok', 'Wajib', 'Bebas')),
    saldo DECIMAL(18, 2) NOT NULL CHECK (saldo >= 0)
);

-- Tabel Pinjaman
CREATE TABLE Pinjaman (
    id_pinjaman VARCHAR(50) PRIMARY KEY,
    id_anggota VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Anggota(id_anggota),
    jenis_pinjaman VARCHAR(50) NOT NULL CHECK (jenis_pinjaman IN ('Usaha', 'Konsumsi')),
    saldo DECIMAL(18, 2) NOT NULL CHECK (saldo >= 0),
    bunga DECIMAL(5, 2) NOT NULL CHECK (bunga >= 0 AND bunga <= 100),
    jadwal_pembayaran DATE NOT NULL,
    status_pinjaman VARCHAR(50) NOT NULL CHECK (status_pinjaman IN ('Aktif', 'Lunas')),
    jumlah DECIMAL(18, 2) NOT NULL CHECK (jumlah >= 0)
);

-- Tabel Pinjaman Usaha
CREATE TABLE Pinjaman_Usaha (
    id_pinjaman VARCHAR(50) PRIMARY KEY FOREIGN KEY REFERENCES Pinjaman(id_pinjaman),
    id_transaksi VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Transaksi(id_transaksi),
    jenis_usaha VARCHAR(100) NOT NULL
);

-- Tabel Pinjaman Konsumsi
CREATE TABLE Pinjaman_Konsumsi (
    id_pinjaman VARCHAR(50) PRIMARY KEY FOREIGN KEY REFERENCES Pinjaman(id_pinjaman),
    id_transaksi VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Transaksi(id_transaksi),
    jenis_konsumsi VARCHAR(100) NOT NULL
);

-- Tabel SHU
CREATE TABLE SHU (
    id_shu VARCHAR(50) PRIMARY KEY,
    id_transaksi VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Transaksi(id_transaksi),
    kontribusi DECIMAL(18, 2) NOT NULL CHECK (kontribusi >= 0),
    tahun INT NOT NULL CHECK (tahun >= 1900 AND tahun <= YEAR(GETDATE()))
);

-- Tabel Simpanan Pokok
CREATE TABLE Simpanan_Pokok (
    id_simpanan VARCHAR(50) PRIMARY KEY FOREIGN KEY REFERENCES Simpanan(id_simpanan),
    id_transaksi VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Transaksi(id_transaksi),
    status VARCHAR(50) NOT NULL CHECK (status IN ('Aktif', 'Tidak Aktif'))
);

-- Tabel Simpanan Bebas
CREATE TABLE Simpanan_Bebas (
    id_simpanan VARCHAR(50) PRIMARY KEY FOREIGN KEY REFERENCES Simpanan(id_simpanan),
    id_transaksi VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Transaksi(id_transaksi),
    bunga DECIMAL(5, 2) NOT NULL CHECK (bunga >= 0 AND bunga <= 100)
);

-- Tabel Simpanan Wajib
CREATE TABLE Simpanan_Wajib (
    id_simpanan VARCHAR(50) PRIMARY KEY FOREIGN KEY REFERENCES Simpanan(id_simpanan),
    id_transaksi VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Transaksi(id_transaksi),
    bulan_pembayaran VARCHAR(50) NOT NULL CHECK (bulan_pembayaran IN (
        'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ))
);
