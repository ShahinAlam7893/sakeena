import 'package:sakeena/features/teachers/submission/domain/entities/assignment_submission.dart';

class AssignmentGroup {
  final String title; // e.g. "01. Build a Custom Hook"
  final List<Submission> submissions;

  AssignmentGroup({
    required this.title,
    required this.submissions,
  });
}