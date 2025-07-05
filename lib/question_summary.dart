import 'package:flutter/material.dart';
import 'package:quiz_app/summary_item.dart'; // Perbaikan: Tambahkan titik koma di akhir baris ini

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column( // Perbaikan: 'column' seharusnya 'Column' dengan huruf kapital 'C'
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ), // Perbaikan: Tutup kurung untuk Column
      ),
    );
  }
}