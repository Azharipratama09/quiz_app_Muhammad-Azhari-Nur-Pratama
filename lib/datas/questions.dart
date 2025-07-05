import 'package:quiz_app/models/quiz_question.dart';

// Daftar pertanyaan quiz dengan format yang benar
final List<QuizQuestion> questions = [
  QuizQuestion(
    'Disebut apa blok penyusun utama UI Flutter?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
    correctAnswerIndex: 0, // Index jawaban benar (Widgets)
  ),
  QuizQuestion(
    'Bagaimana UI Flutter di "build"?',
    [
      'Dengan menggabungkan widget dalam kode',
      'Dengan menggabungkan widget dalam visual editor',
      'Dengan mendefinisikan widget dalam config file',
      'Dengan menggunakan XCode untuk iOS dan Android Studio untuk Android',
    ],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    'Apa tujuan dari sebuah StatefulWidget?',
    [
      'Merubah UI saat data berubah',
      'Merubah data saat UI berubah',
      'Menabaikan perubahan data',
      'Merender UI dan tidak bergantung pada data',
    ],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    'Widget mana yang sebaiknya digunakan lebih sering?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Keduanya sama-sama bagus',
      'Bukan salah satu dari keduanya',
    ],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    'Apa yang terjadi jika mengubah data dalam StatelessWidget?',
    [
      'UI tidak diperbarui',
      'UI diperbarui',
      'StatefulWidget terdekat diperbarui',
      'Semua StatefulWidgets turunan diperbarui',
    ],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    'Bagaimana memperbarui data di dalam StatefulWidget?',
    [
      'Dengan memanggil setState()',
      'Dengan memanggil updateData()',
      'Dengan memanggil updateUI()',
      'Dengan memanggil updateState()',
    ],
    correctAnswerIndex: 0,
  ),
];