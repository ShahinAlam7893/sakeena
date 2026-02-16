import 'package:flutter/material.dart';
import 'package:sakeena/features/teachers/submission/domain/entities/assignment_submission.dart';
import '../../domain/entities/quiz_submission.dart';   
import '../../domain/entities/assignment_group.dart';

class SubmissionProvider extends ChangeNotifier {
  // ── Assignments ───────────────────────────────────────
  List<AssignmentGroup> _assignmentGroups = [];
  List<AssignmentGroup> get assignmentGroups => _assignmentGroups;

  // ── Quizzes ───────────────────────────────────────────
  List<QuizSubmission> _quizSubmissions = [];
  List<QuizSubmission> get quizSubmissions => _quizSubmissions;

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadAllSubmissions() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 1200));

    // Demo data - replace with real repository later
    _assignmentGroups = [
      AssignmentGroup(
        title: "01. Build a Custom Hook",
        submissions: [
          Submission(
            id: 'as1',
            status: SubmissionStatus.graded,
            studentName: 'Ahmed Hassan',
            studentEmail: 'ahmedh@email.com',
            submittedAt: DateTime(2026, 1, 12, 16, 45),
            score: 45,
            maxScore: 50,
            fileCount: 2,
          ),
          Submission(
            id: 'as2',
            status: SubmissionStatus.pending,
            studentName: 'Ahmed Hassan',
            studentEmail: 'ahmedh@email.com',
            submittedAt: DateTime(2026, 1, 12, 16, 45),
            score: 0,
            maxScore: 50,
            fileCount: 2,
          ),
        ],
      ),
      // ... more groups
    ];

    _quizSubmissions = [
      QuizSubmission(
        id: 'q1',
        quizTitle: "Advanced React Patterns",
        studentName: 'Emily Rodriguez',
        studentEmail: 'emily.r@email.com',
        submittedAt: DateTime(2026, 1, 14, 10, 30),
        timeSpentMinutes: 18,
        score: 20,
        maxScore: 30,
        questions: [
          QuizQuestionReview(
            questionText: "What does useState return?",
            pointsPossible: 10,
            pointsEarned: 10,
            studentAnswer: "Option 2",
            result: QuestionResult.correct,
          ),
          QuizQuestionReview(
            questionText: "When does useEffect run by default?",
            pointsPossible: 10,
            pointsEarned: 10,
            studentAnswer: "Option 2",
            result: QuestionResult.correct,
          ),
          QuizQuestionReview(
            questionText: "Which hook is used for side effects?",
            pointsPossible: 10,
            pointsEarned: 0,
            studentAnswer: "Option 3",
            correctAnswer: "Option 1",
            result: QuestionResult.incorrect,
          ),
        ],
      ),
      QuizSubmission(
        id: 'q2',
        quizTitle: "Advanced React Patterns",
        studentName: 'Emily Rodriguez',
        studentEmail: 'emily.r@email.com',
        submittedAt: DateTime(2026, 1, 14, 11, 15),
        timeSpentMinutes: 12,
        score: 20,
        maxScore: 20,
        questions: [
          // all correct example
          QuizQuestionReview(questionText: "...", pointsPossible: 10, pointsEarned: 10, studentAnswer: "...", result: QuestionResult.correct),
          QuizQuestionReview(questionText: "...", pointsPossible: 10, pointsEarned: 10, studentAnswer: "...", result: QuestionResult.correct),
        ],
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }

  // Grade update method (only assignments for now)
  void updateAssignmentGrade(String submissionId, int newScore) {
    for (var group in _assignmentGroups) {
      final idx = group.submissions.indexWhere((s) => s.id == submissionId);
      if (idx != -1) {
        final old = group.submissions[idx];
        group.submissions[idx] = Submission(
          id: old.id,
          status: SubmissionStatus.graded,
          studentName: old.studentName,
          studentEmail: old.studentEmail,
          submittedAt: old.submittedAt,
          score: newScore,
          maxScore: old.maxScore,
          fileCount: old.fileCount,
        );
        notifyListeners();
        return;
      }
    }
  }
}