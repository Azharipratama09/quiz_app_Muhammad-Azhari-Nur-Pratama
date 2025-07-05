import 'package:flutter/material.dart';
import 'package:quiz_app/datas/questions.dart';
import 'package:quiz_app/question_summary.dart'; // Pastikan path ini benar

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswers,
    required this.onRestart,
  });

  final List<String> choosenAnswers;
  final void Function() onRestart; // Perbaikan: Ubah dynamic menjadi void Function()

  // Perbaikan 1: Hapus getter ini karena kita punya fungsi getSummaryData()
  // get summaryData => null;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    // Perbaikan 2: Hapus deklarasi ulang onRestart di sini
    // final void Function() onRestart;

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData(); // Menggunakan fungsi getSummaryData()
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions correctly !',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox( // Perbaikan: Tambahkan const
              height: 30,
            ),
            const Text(
              'list of answer and question',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox( // Perbaikan: Tambahkan const
              height: 30,
            ),
            QuestionsSummary(summaryData), // Perbaikan 3: Tambahkan koma di sini dan gunakan summaryData yang sudah diambil
            const SizedBox( // Perbaikan: Tambahkan const
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh), // Menambahkan ikon refresh
              label: const Text('Restart Quiz'), // Perbaikan 4: Menambahkan label teks
            ),
          ],
        ),
      ),
    );
  }
}