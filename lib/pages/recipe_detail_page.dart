import 'package:flutter/material.dart';
import '../data/dummy_data.dart'; // <-- Impor data terpusat
import '../models/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final String recipeId;

  const RecipeDetailPage({Key? key, required this.recipeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Cari resep yang sesuai di dalam list data dummy
    final Recipe recipe =
    allRecipes.firstWhere((recipe) => recipe.id == recipeId);

    return Scaffold(
      // Kita gunakan CustomScrollView agar bisa menggabungkan
      // AppBar yang fleksibel (SliverAppBar) dengan konten (SliverList)
      body: CustomScrollView(
        slivers: [
          // AppBar yang bisa membesar dan mengecil
          SliverAppBar(
            expandedHeight: 300.0, // Tinggi maksimum AppBar saat di-scroll ke atas
            pinned: true, // AppBar tetap terlihat (pinned) saat di-scroll
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                recipe.title,
                style: TextStyle(shadows: [
                  Shadow(color: Colors.black54, blurRadius: 4.0, offset: Offset(2.0, 2.0))
                ]),
              ),
              background: Image.network(
                recipe.imageUrl,
                fit: BoxFit.cover,
                // Tambahkan error builder
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: Icon(Icons.broken_image, color: Colors.grey, size: 100),
                ),
              ),
            ),
          ),

          // Konten halaman (deskripsi, bahan, langkah)
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Widget helper untuk Judul Sesi
                _buildSectionTitle(context, 'Deskripsi'),

                // Widget untuk Deskripsi
                _buildDescription(context, recipe.description),

                // Widget helper untuk Judul Sesi
                _buildSectionTitle(context, 'Bahan-Bahan'),

                // Widget untuk Daftar Bahan
                _buildIngredientList(context, recipe.ingredients),

                // Widget helper untuk Judul Sesi
                _buildSectionTitle(context, 'Langkah-Langkah'),

                // Widget untuk Daftar Langkah
                _buildStepList(context, recipe.steps),

                // Beri jarak di bagian bawah
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =================================================================
  // == WIDGET HELPERS ==
  // =================================================================

  /// Widget untuk Judul Sesi (e.g., "Deskripsi", "Bahan-Bahan")
  Widget _buildSectionTitle(BuildContext context, String title) {
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

  /// Widget untuk menampilkan teks deskripsi
  Widget _buildDescription(BuildContext context, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        description,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
        textAlign: TextAlign.justify,
      ),
    );
  }

  /// Widget untuk menampilkan daftar bahan-bahan
  Widget _buildIngredientList(BuildContext context, List<String> ingredients) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.transparent, // Tidak perlu warna latar
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ingredients.map((ingredient) {
          // Menggunakan Row dengan Icon untuk setiap item
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline,
                    size: 18, color: Colors.blue.shade700),
                SizedBox(width: 10),
                Expanded(
                  child: Text(ingredient, style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Widget untuk menampilkan daftar langkah-langkah
  Widget _buildStepList(BuildContext context, List<String> steps) {
    // Menggunakan Column dan map, BUKAN ListView
    // untuk menghindari error render di dalam CustomScrollView
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: List.generate(steps.length, (index) {
          // Menggunakan ListTile untuk penomoran otomatis
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              child: Text('${index + 1}'),
              radius: 16,
            ),
            title: Text(steps[index], textAlign: TextAlign.justify,),
          );
        }),
      ),
    );
  }
}