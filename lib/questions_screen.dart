import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart'; // Impor AnswerButton
import 'package:quiz_app/datas/questions.dart'; // Impor data pertanyaan

class QuestionsScreen extends StatefulWidget {
  // Hanya satu deklarasi untuk onSelectAnswer di konstruktor dan sebagai final variable.
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer, // Pastikan ini adalah satu-satunya parameter untuk fungsi callback
  });

  // Deklarasi final variable untuk fungsi callback
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer); // Menggunakan onSelectAnswer dari widget
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex]; // Mengambil pertanyaan

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 215, 196, 249),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50), // Spacer antara pertanyaan dan jawaban
            ...currentQuestion.answers.map(
              (item) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  child: AnswerButton(
                    text: item, // Mengirimkan teks jawaban ke AnswerButton
                    onTap: () {
                      answerQuestion(item); // Fungsi untuk melanjutkan ke pertanyaan berikutnya
                    },
                  ),
                );
              },
            ).toList(), // Mengubah map menjadi list
          ],
        ),
      ),
    );
  }
}