import 'package:flutter/material.dart';
import 'package:quiz_app/profile.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/datas/questions.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen'; // Menyimpan layar aktif
  List<String> selectedAnswer = [];

  // Fungsi untuk mengubah layar dari 'start-screen' ke 'questions-screen'
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // Fungsi untuk memilih jawaban dan melanjutkan ke layar hasil jika semua pertanyaan telah dijawab
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  // Fungsi untuk mereset kuis
  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen'; // Memastikan kembali ke layar pertanyaan
    });
  }

  void profilScreen() {
    setState(() {
      selectedAnswer = []; // Reset jawaban jika ingin memulai dari awal setelah kembali dari profil
      activeScreen = 'profile-screen';
    });
  }

  // Fungsi untuk kembali ke layar beranda (digunakan oleh Profile screen)
  void goHomeFromProfile() {
    setState(() {
      activeScreen = 'start-screen'; // Atau 'home-screen' jika itu nama layar beranda kamu
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen(
      startQuiz: switchScreen, // Mengirim referensi fungsi switchScreen
      profile: profilScreen,   // Mengirim referensi fungsi profilScreen
    );

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    if (activeScreen == 'profile-screen') {
      // Memberikan argumen 'onGoHome' yang diperlukan oleh Profile
      screenWidget = Profile(
        onGoHome: goHomeFromProfile, // Mengirim referensi fungsi untuk kembali ke Home
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Color.fromARGB(255, 148, 59, 219)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}