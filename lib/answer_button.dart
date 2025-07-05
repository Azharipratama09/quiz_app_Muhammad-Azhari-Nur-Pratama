import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // Konstruktor untuk AnswerButton
  const AnswerButton({
    super.key, 
    required this.text,  // Teks untuk ditampilkan pada tombol
    required this.onTap, // Fungsi yang dipanggil ketika tombol ditekan
  });

  // Variabel untuk teks tombol dan fungsi callback saat tombol ditekan
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,  // Menangani event ketika tombol ditekan
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40), // Padding untuk tombol
        backgroundColor: const Color.fromARGB(255, 44, 13, 93), // Warna latar belakang tombol
        foregroundColor: Colors.white, // Warna teks tombol
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,  // Penataan teks di tengah tombol
      ), // Text
    ); // ElevatedButton
  }
}