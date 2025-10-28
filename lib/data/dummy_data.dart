import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/recipe.dart';

// PINDAHKAN DATA DARI home_page.dart
final List<Category> dummyCategories = [
  Category(id: 'c1', name: 'Sarapan', icon: Icons.free_breakfast),
  Category(id: 'c2', name: 'Makan Siang', icon: Icons.restaurant),
  Category(id: 'c3', name: 'Dessert', icon: Icons.cake),
  Category(id: 'c4', name: 'Minuman', icon: Icons.local_drink),
  Category(id: 'c5', name: 'Cepat Saji', icon: Icons.fastfood),
];

// PINDAHKAN DATA DARI recipe_list_page.dart DAN LENGKAPI
final List<Recipe> allRecipes = [
  // Data untuk Kategori Sarapan (c1)
  Recipe(
    id: 'r1',
    categoryId: 'c1',
    title: 'Nasi Goreng Kampung',
    duration: '15 Min',
    imageUrl: 'https'
        '://images.unsplash.com/photo-1512058564366-185109023979?w=400',
    description:
    'Nasi goreng kampung adalah varian nasi goreng klasik yang '
        'menggunakan bumbu sederhana seperti bawang, cabai, dan terasi.',
    ingredients: [
      '1 piring nasi putih',
      '2 siung bawang putih, cincang',
      '3 siung bawang merah, iris',
      '1 butir telur',
      '1 sdm kecap manis',
      'Garam dan lada secukupnya'
    ],
    steps: [
      'Panaskan sedikit minyak di wajan.',
      'Tumis bawang putih dan bawang merah hingga harum.',
      'Masukkan telur dan orak-arik hingga matang.',
      'Masukkan nasi, aduk rata.',
      'Tambahkan kecap manis, garam, dan lada. Aduk hingga '
          'semua bumbu merata dan nasi sedikit kering.',
      'Sajikan selagi hangat.'
    ],
  ),
  Recipe(
    id: 'r4',
    categoryId: 'c1',
    title: 'Bubur Ayam Spesial',
    duration: '20 Min',
    imageUrl: 'https://images.unsplash.com/photo-1552561548-3c0fecb5b38a?w=400',
    description: 'Bubur ayam hangat dengan suwiran ayam, cakwe, dan bawang goreng.',
    ingredients: ['1 mangkok bubur nasi', '100gr dada ayam, rebus, suwir', '1 sdm kecap asin', 'Cakwe, iris', 'Bawang goreng'],
    steps: ['Siapkan bubur di mangkok.', 'Taburi dengan ayam suwir, cakwe, dan bawang goreng.', 'Siram dengan kecap asin.'],
  ),

  // Data untuk Kategori Makan Siang (c2)
  Recipe(
      id: 'r2',
      categoryId: 'c2',
      title: 'Ayam Bakar Madu',
      duration: '45 Min',
      imageUrl: 'https'
          '://images.unsplash.com/photo-1598511757835-03f713c6b0f1?w=400',
      description: 'Ayam bakar dengan bumbu madu yang manis, gurih, dan sedikit pedas.',
      ingredients: ['1/2 ekor ayam', '3 sdm madu', '2 sdm kecap manis', 'Bumbu halus (bawang, jahe, kunyit)'],
      steps: ['Ungkep ayam dengan bumbu halus hingga empuk.', 'Olesi ayam dengan campuran madu dan kecap manis.', 'Bakar ayam di atas bara atau teflon hingga matang dan bumbu meresap.']
  ),

  // ... (Tambahkan data resep lainnya di sini dengan format yang sama)
];