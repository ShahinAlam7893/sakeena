import 'package:sakeena/features/guest/course/course_details_screen.dart';
import 'package:sakeena/model/quiz_question_model.dart';

class CourseModule {
  final String title;
  final String duration;
  final List<CourseLessonItem> lessons;
  final List<QuizQuestion>? quiz;
  final String? assignmentDescription;

  const CourseModule({
    required this.title,
    required this.duration,
    required this.lessons,
    this.quiz,
    this.assignmentDescription,
  });
}
