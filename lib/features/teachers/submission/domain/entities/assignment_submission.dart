import 'dart:ui';

import 'package:flutter/material.dart';

enum SubmissionStatus { graded, pending }

class Submission {
  final String id;
  final SubmissionStatus status;
  final String studentName;
  final String studentEmail;
  final DateTime submittedAt;
  final int score;
  final int maxScore;
  final int fileCount;

  Submission({
    required this.id,
    required this.status,
    required this.studentName,
    required this.studentEmail,
    required this.submittedAt,
    required this.score,
    required this.maxScore,
    required this.fileCount,
  });

  double get percentage => maxScore > 0 ? (score / maxScore) * 100 : 0.0;

  String get statusText => status == SubmissionStatus.graded ? 'Graded' : 'Pending Review';

  Color get statusColor => status == SubmissionStatus.graded ? Colors.green : Colors.orange;
}