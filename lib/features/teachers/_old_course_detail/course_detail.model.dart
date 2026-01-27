class CourseDetailModelOld {
  final String courseTitle;
  final String instructor;
  final String category;
  final String status;
  final String price;
  final String duration;
  final int totalLessons;
  final double rating;
  final int totalEnrolled;
  final List<Map<String, String>> students;

  CourseDetailModelOld({
    required this.courseTitle,
    required this.instructor,
    required this.category,
    required this.status,
    required this.price,
    required this.duration,
    required this.totalLessons,
    required this.rating,
    required this.totalEnrolled,
    required this.students,
  });
}
