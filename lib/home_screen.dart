// home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Tambahkan parameter yang diperlukan di sini
  // Nama parameter harus cocok dengan apa yang kamu gunakan saat memanggil HomeScreen
  const HomeScreen({
    super.key,
    required void Function() startQuiz, // Tambahkan ini
    required void Function() profile,    // Tambahkan ini (jika kamu juga mem-passing 'profile')
  }) : _startQuiz = startQuiz, _profile = profile; // Inisialisasi

  // Simpan fungsi sebagai properti privat
  final void Function() _startQuiz;
  final void Function() _profile; // Jika kamu juga mem-passing 'profile'

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Contoh penggunaan gambar (gantilah dengan aset gambar kamu)
          Image.asset(
            'assets/images/quiz-logo.png', // Sesuaikan path gambar kamu
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // const Opacity( // Alternatif jika ingin menggunakan Opacity
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 80),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: _startQuiz, // Panggil fungsi startQuiz
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
          OutlinedButton.icon( // Tambahkan tombol untuk profil
            onPressed: _profile, // Panggil fungsi profil
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.person),
            label: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}