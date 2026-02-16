enum QuestionResult { correct, incorrect }

class QuizQuestionReview {
  final String questionText;
  final int pointsPossible;
  final int pointsEarned;
  final String studentAnswer;
  final String? correctAnswer;
  final QuestionResult result;

  QuizQuestionReview({
    required this.questionText,
    required this.pointsPossible,
    required this.pointsEarned,
    required this.studentAnswer,
    this.correctAnswer,
    required this.result,
  });

  bool get isCorrect => result == QuestionResult.correct;
}

class QuizSubmission {
  final String id;
  final String quizTitle;
  final String studentName;
  final String studentEmail;
  final DateTime submittedAt;
  final int timeSpentMinutes;
  final int score;
  final int maxScore;
  final List<QuizQuestionReview> questions;

  QuizSubmission({
    required this.id,
    required this.quizTitle,
    required this.studentName,
    required this.studentEmail,
    required this.submittedAt,
    required this.timeSpentMinutes,
    required this.score,
    required this.maxScore,
    required this.questions,
  });

  double get percentage => maxScore > 0 ? (score / maxScore) * 100 : 0.0;

  bool get passed => percentage >= 70; // example threshold - adjust as needed
}