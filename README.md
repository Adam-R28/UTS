# ResepKita - Aplikasi Katalog Resep (Proyek UTS)

Ini adalah proyek Ujian Tengah Semester (UTS) untuk mata kuliah Mobile Programming. Aplikasi ini adalah sebuah katalog resep masakan yang dirancang dan dibangun menggunakan framework Flutter.

## 1. Deskripsi (Tema dan Tujuan Aplikasi)

Aplikasi "ResepKita" berfungsi sebagai katalog resep masakan sederhana. Tema ini dipilih untuk mempraktikkan alur aplikasi yang umum (daftar kategori -> daftar item -> detail item).

Tujuan utama proyek ini adalah untuk merancang dan mengimplementasikan antarmuka (GUI) aplikasi mobile dengan menerapkan konsep dasar Flutter, meliputi:
* Penerapan *layout* dan *widget* (Row, Column, Card, ListView, GridView, SliverAppBar).
* Sistem navigasi antar halaman (`Navigator.push`) dengan pengiriman data.
* Pengolahan dan penampilan data *dummy* (dari file lokal) sebagai persiapan untuk integrasi API di masa depan.

## 2. Daftar Halaman beserta Fungsinya

Sesuai spesifikasi, aplikasi ini memiliki 3 halaman utama yang saling terhubung:

1.  **`HomePage` (Halaman Beranda)**
    * **Fungsi:** Menampilkan halaman utama aplikasi.
    * **Tampilan:** Berisi daftar kategori resep (Sarapan, Dessert, dll.) dalam bentuk `ListView` horizontal dan daftar "Resep Populer" menggunakan `Card`.

2.  **`RecipeListPage` (Halaman Daftar Resep)**
    * **Fungsi:** Menampilkan daftar resep berdasarkan kategori yang dipilih dari Halaman Beranda.
    * **Tampilan:** Berisi `ListView` vertikal yang menampilkan `Card` untuk setiap resep (gambar, judul, durasi).

3.  **`RecipeDetailPage` (Halaman Detail Resep)**
    * **Fungsi:** Menampilkan informasi rinci dari resep yang dipilih.
    * **Tampilan:** Menggunakan `SliverAppBar` untuk *header* gambar yang dinamis, diikuti dengan deskripsi, daftar bahan, dan langkah-langkah pembuatan resep.

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

Proyek ini disusun dengan struktur folder yang rapi untuk memudahkan pemeliharaan dan pengembangan selanjutnya.
