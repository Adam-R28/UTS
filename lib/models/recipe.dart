// lib/models/recipe.dart

class Recipe {
  final String id;
  final String categoryId;
  final String title;
  final String duration;
  final String imageUrl;
  final String description;       // <-- TAMBAHKAN INI
  final List<String> ingredients; // <-- TAMBAHKAN INI
  final List<String> steps;       // <-- TAMBAHKAN INI

  Recipe({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.duration,
    required this.imageUrl,
    required this.description,   // <-- TAMBAHKAN INI
    required this.ingredients, // <-- TAMBAHKAN INI
    required this.steps,       // <-- TAMBAHKAN INI
  });
}