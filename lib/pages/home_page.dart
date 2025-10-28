import 'package:flutter/material.dart';
import '../data/dummy_data.dart'; // Mengimpor data terpusat
import 'recipe_list_page.dart';
import 'recipe_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar sekarang diatur oleh Tema global di main.dart
      // Kita hanya perlu menambahkan judul
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selamat Datang',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
            Text('Mau masak apa hari ini?',
                style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              // Placeholder untuk foto profil
              child: Icon(Icons.person_outline),
              backgroundColor: Colors.grey[200],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Agar halaman bisa di-scroll jika kontennya panjang
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16), // Beri jarak dari AppBar
            // 1. Search Bar (Dummy)
            _buildSearchBar(),

            // 2. Judul Sesi (Kategori)
            _buildSectionTitle('Kategori'),

            // 3. List Kategori (Horizontal ListView)
            _buildCategories(),

            // 4. Judul Sesi (Resep Populer)
            _buildSectionTitle('Resep Populer'),

            // 5. List Resep Populer (Horizontal ListView)
            _buildPopularRecipes(),

            SizedBox(height: 24), // Beri jarak di bawah
          ],
        ),
      ),
    );
  }

  // =================================================================
  // == WIDGET HELPERS ==
  // =================================================================

  /// Widget untuk Search Bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari resep masakan...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        readOnly: true, // Hanya dummy, tidak fungsional
        onTap: () {
          // Aksi saat search bar di-tap (misal: buka halaman pencarian)
        },
      ),
    );
  }

  /// Widget untuk Judul Sesi (e.g., "Kategori", "Resep Populer")
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Widget untuk List Kategori (Horizontal) - VERSI PERBAIKAN GUI
  Widget _buildCategories() {
    return Container(
      height: 120, // Tentukan tinggi untuk ListView horizontal
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        itemCount: dummyCategories.length,
        itemBuilder: (ctx, index) {
          final category = dummyCategories[index];

          // Gunakan InkWell yang dibungkus Container
          return Container(
            width: 90, // Lebar tetap untuk setiap item
            child: InkWell(
              onTap: () {
                // Implementasi Navigasi
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeListPage(
                      categoryId: category.id,
                      categoryName: category.name,
                    ),
                  ),
                );
              },
              // Beri bentuk bulat pada efek ripple
              borderRadius: BorderRadius.circular(12.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // === GANTI BAGIAN INI KEMBALI KE ICON ===
                    CircleAvatar(
                      radius: 30, // Ukuran lingkaran
                      // Ambil warna dari Tema utama aplikasi Anda
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Icon(
                        category.icon, // <-- Panggil Ikon
                        size: 30,
                        // Ambil warna ikon dari Tema
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    // === AKHIR DARI PERUBAHAN ===

                    SizedBox(height: 8),
                    Text(
                      category.name,
                      textAlign: TextAlign.center,
                      maxLines: 1, // Pastikan 1 baris
                      overflow: TextOverflow.ellipsis, // Jika teks kepanjangan
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Widget untuk List Resep Populer (Horizontal) - VERSI PERBAIKAN GUI
  Widget _buildPopularRecipes() {
    // Ambil beberapa resep dari data terpusat
    // (Anda bisa membuat list khusus 'populer' di dummy_data.dart jika mau)
    final popularRecipes = allRecipes.take(4).toList();

    return Container(
      height: 240, // Tentukan tinggi untuk ListView horizontal
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        itemCount: popularRecipes.length,
        itemBuilder: (ctx, index) {
          final recipe = popularRecipes[index];

          // Menggunakan Card + InkWell untuk GUI dan fungsionalitas klik
          return Container(
            width: 170, // Tentukan lebar untuk setiap card
            margin: EdgeInsets.all(4.0),
            // Card di-wrap InkWell di dalamnya
            child: Card(
              clipBehavior: Clip.antiAlias, // Agar gambar terpotong rapi
              elevation: 3,
              child: InkWell(
                onTap: () {
                  // Implementasi Navigasi
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipeDetailPage(recipeId: recipe.id),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar Resep
                    Image.asset(
                      recipe.imageUrl, // Gunakan Image.asset
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      // Error builder jika gambar gagal dimuat
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 140,
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: Icon(Icons.broken_image, color: Colors.grey),
                      ),
                    ),
                    // Judul Resep
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        recipe.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Durasi Masak
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.timer_outlined,
                              size: 16, color: Colors.grey[600]),
                          SizedBox(width: 4),
                          Text(
                            recipe.duration,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}