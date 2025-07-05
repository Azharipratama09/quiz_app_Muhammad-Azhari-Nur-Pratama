class QuizQuestion {
  final String text;
  final List<String> answers;
  final int correctAnswerIndex;

  const QuizQuestion(
    this.text,
    this.answers, {
    required this.correctAnswerIndex,
  });

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

  bool isCorrect(int answerIndex) {
    return answerIndex == correctAnswerIndex;
  }
}