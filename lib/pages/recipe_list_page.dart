import 'package:flutter/material.dart';
import '../models/recipe.dart';
import 'recipe_detail_page.dart';
import '../data/dummy_data.dart';

class RecipeListPage extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const RecipeListPage({
    Key? key,
    required this.categoryId,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  // =================================================================
  // == DATA DUMMY ==
  // Kita definisikan SEMUA resep di sini.
  // Di aplikasi nyata, ini akan di-fetch dari API berdasarkan kategori.
  // =================================================================

  // Variabel untuk menampung resep yang sudah difilter
  late List<Recipe> _filteredRecipes;

  @override
  void initState() {
    super.initState();
    // Proses filter data dilakukan satu kali saat halaman pertama kali dibuka
    _filteredRecipes = allRecipes
        .where((recipe) => recipe.categoryId == widget.categoryId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName), // [cf: 36] Judul dari kategori
      ),
      body:
      // Cek apakah ada resep yang ditemukan setelah difilter
      _filteredRecipes.isEmpty
          ? Center(
        // Tampilkan pesan jika tidak ada resep
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.no_food, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Belum ada resep untuk kategori ini.',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
        ),
      )
          :
      // Jika ada resep, tampilkan dalam ListView
      ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: _filteredRecipes.length,
        itemBuilder: (ctx, index) {
          final recipe = _filteredRecipes[index];
          return _buildRecipeCard(recipe);
        },
      ),
    );
  }

  // =================================================================
  // == WIDGET HELPERS ==
  // =================================================================

  /// Widget untuk membangun Card setiap resep
  /// Mirip dengan contoh di soal [cf: 44-64]
  Widget _buildRecipeCard(Recipe recipe) {
    return GestureDetector(
      // Implementasi Navigasi
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailPage(recipeId: recipe.id),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 3,
        child: Row(
          // Menggunakan Row untuk gambar di kiri dan teks di kanan
          children: [
            // Gambar Resep
            Image.network(
              recipe.imageUrl,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120,
                height: 100,
                color: Colors.grey[200],
                child: Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),

            // Teks (Judul dan Durasi)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.timer_outlined,
                            size: 18, color: Colors.grey[600]),
                        SizedBox(width: 4),
                        Text(
                          recipe.duration,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Ikon Panah (menandakan bisa diklik)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.chevron_right, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}