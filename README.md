# ResepKita - Aplikasi Katalog Resep (Proyek UTS)

[cite_start]Ini adalah proyek Ujian Tengah Semester (UTS) untuk mata kuliah Mobile Programming[cite: 1]. Aplikasi ini adalah sebuah katalog resep masakan yang dirancang dan dibangun menggunakan framework Flutter.

## 1. Deskripsi (Tema dan Tujuan Aplikasi)

Aplikasi "ResepKita" berfungsi sebagai katalog resep masakan sederhana. Tema ini dipilih untuk mempraktikkan alur aplikasi yang umum (daftar kategori -> daftar item -> detail item).

[cite_start]Tujuan utama proyek ini adalah untuk merancang dan mengimplementasikan antarmuka (GUI) aplikasi mobile dengan menerapkan konsep dasar Flutter[cite: 9], meliputi:
* Penerapan *layout* dan *widget* (Row, Column, Card, ListView, GridView, SliverAppBar).
* Sistem navigasi antar halaman (`Navigator.push`) dengan pengiriman data.
* [cite_start]Pengolahan dan penampilan data *dummy* (dari file lokal) sebagai persiapan untuk integrasi API di masa depan[cite: 10, 21].

## 2. Daftar Halaman beserta Fungsinya

[cite_start]Sesuai spesifikasi, aplikasi ini memiliki 3 halaman utama yang saling terhubung[cite: 16]:

1.  **`HomePage` (Halaman Beranda)**
    * **Fungsi:** Menampilkan halaman utama aplikasi.
    * [cite_start]**Tampilan:** Berisi daftar kategori resep (Sarapan, Dessert, dll.) dalam bentuk `ListView` horizontal dan daftar "Resep Populer" menggunakan `Card`[cite: 17].

2.  **`RecipeListPage` (Halaman Daftar Resep)**
    * **Fungsi:** Menampilkan daftar resep berdasarkan kategori yang dipilih dari Halaman Beranda.
    * [cite_start]**Tampilan:** Berisi `ListView` vertikal yang menampilkan `Card` untuk setiap resep (gambar, judul, durasi)[cite: 17].

3.  **`RecipeDetailPage` (Halaman Detail Resep)**
    * **Fungsi:** Menampilkan informasi rinci dari resep yang dipilih.
    * [cite_start]**Tampilan:** Menggunakan `SliverAppBar` untuk *header* gambar yang dinamis, diikuti dengan deskripsi, daftar bahan, dan langkah-langkah pembuatan resep[cite: 17].

## 3. Langkah-Langkah Menjalankan Aplikasi

Berikut adalah langkah-langkah untuk menjalankan proyek ini di lingkungan lokal Anda:

1.  **Clone Repositori**
    ```bash
    git clone [URL_REPOSITORI_ANDA]
    cd [NAMA_FOLDER_PROYEK]
    ```

2.  **Install Dependencies**
    Pastikan Anda memiliki Flutter SDK yang terpasang. Jalankan perintah berikut di terminal:
    ```bash
    flutter pub get
    ```

3.  **Jalankan Aplikasi**
    Hubungkan perangkat (emulator atau HP fisik) dan jalankan perintah:
    ```bash
    flutter run
    ```

## 4. Struktur Folder Proyek

[cite_start]Proyek ini disusun dengan struktur folder yang rapi untuk memudahkan pemeliharaan dan pengembangan selanjutnya[cite: 82].
