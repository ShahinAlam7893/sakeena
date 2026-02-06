// ============ DATA MODELS ============
import 'package:sakeena/features/guest/course/course_details_screen.dart';
import 'package:sakeena/model/course_details_model.dart';
import 'package:sakeena/model/course_module_model.dart';
import 'package:sakeena/model/course_review_model.dart';
import 'package:sakeena/model/instructior_data_model.dart';
import 'package:sakeena/model/quiz_question_model.dart';

// ============ ENUMS ============
enum CourseStatus { upcoming, live, recorded }

enum EnrollmentStatus { notEnrolled, enrolled, completed }

class CourseData {
  final String title;
  final String imageAsset;
  final String price;
  final CourseStatus courseStatus;
  final EnrollmentStatus enrollmentStatus;
  final String description;
  final List<String> outcomes;
  final List<CourseModule> modules;
  final CourseDetails courseDetails;
  final InstructorData instructor;
  final List<String> requirements;
  final List<Review> reviews;

  const CourseData({
    required this.title,
    required this.imageAsset,
    required this.price,
    required this.courseStatus,
    required this.enrollmentStatus,
    required this.description,
    required this.outcomes,
    required this.modules,
    required this.courseDetails,
    required this.instructor,
    required this.requirements,
    this.reviews = const [],
  });

  factory CourseData.mock() => CourseData(
    title: 'Mindfulness in Islam',
    imageAsset: 'assets/images/quran_recite_image.png',
    price: '\$99',
    courseStatus: CourseStatus.live,
    enrollmentStatus: EnrollmentStatus.notEnrolled,
    description:
        'This comprehensive healing program integrates Islamic spiritual practices with modern-based psychological approaches. Through 5 carefully designed modules over 6 weeks (40 Days), you will learn tools and insights to overcome stress, build emotional resilience, and cultivate lasting behavior change.',
    outcomes: const [
      'Understanding anxiety from both Islamic and psychological perspectives',
      'Integrate dhikr and mindfulness techniques for anxiety relief',
      'Apply cognitive behavioral strategies noted in Islamic teachings',
      'Build lasting emotional resilience through faith practices',
      'Recognizing triggers and developing coping mechanisms',
    ],
    modules: const [
      CourseModule(
        title: 'Module 1: Understanding Anxiety',
        duration: '4 lessons • 52 min',
        lessons: [
          CourseLessonItem(
            title: 'Introduction to the Course',
            duration: '0:00',
          ),
          CourseLessonItem(title: 'What is Anxiety?', duration: '12:43'),
          CourseLessonItem(
            title: 'Islamic Perspective on Anxiety',
            duration: '15:00',
          ),
          CourseLessonItem(
            title: 'Types of Anxiety Disorders',
            duration: '11:32',
          ),
        ],
        quiz: [
          QuizQuestion(
            question: 'Islamic Family Counseling is primarily based on:',
            options: [
              'Western psychology only',
              'Quran and Sunnah with modern counseling tools',
              'Only Hadith without context',
              'Personal opinions of scholars',
            ],
            correctIndex: 1,
          ),
          QuizQuestion(
            question: 'Main goal of Islamic family counseling?',
            options: [
              'Wealth accumulation',
              'Family harmony & Allah\'s pleasure',
              'Individual success only',
              'Avoiding family altogether',
            ],
            correctIndex: 1,
          ),
          // You can add more realistic questions here later
        ],
        assignmentDescription:
            'Write a short reflection (300–500 words) on how anxiety is viewed in Islamic teachings compared to modern psychology. Upload PDF or DOCX.',
      ),
      CourseModule(
        title: 'Module 2: Dhikr & Mindfulness',
        duration: '4 lessons • 48 min',
        lessons: [
          CourseLessonItem(title: 'Introduction to Dhikr', duration: '10:15'),
          CourseLessonItem(title: 'Mindfulness Practices', duration: '12:30'),
          CourseLessonItem(
            title: 'Combining Dhikr and Mindfulness',
            duration: '25:15',
          ),
        ],
        quiz: [
          QuizQuestion(
            question: 'What is the Arabic term for remembrance of Allah?',
            options: ['Salah', 'Dhikr', 'Tawakkul', 'Sabr'],
            correctIndex: 1,
          ),
          QuizQuestion(
            question:
                'Which practice combines awareness of the present moment with Islamic remembrance?',
            options: ['Mindful Dhikr', 'Fasting', 'Hajj', 'Zakat'],
            correctIndex: 0,
          ),
          // Add more as needed
        ],
        assignmentDescription:
            'Describe in 400–600 words how you can incorporate dhikr into your daily routine to manage stress. Include at least 3 specific dhikr examples.',
      ),
      CourseModule(
        title: 'Module 3: Cognitive Approaches',
        duration: '4 lessons • 56 min',
        lessons: [
          CourseLessonItem(
            title: 'Cognitive Behavioral Therapy Basics',
            duration: '18:00',
          ),
          CourseLessonItem(
            title: 'Identifying Negative Thoughts',
            duration: '15:30',
          ),
          // ... add more lessons if needed
        ],
        quiz: [
          QuizQuestion(
            question: 'What does CBT primarily aim to change?',
            options: [
              'Behaviors only',
              'Thoughts and beliefs',
              'Physical health',
              'Environment',
            ],
            correctIndex: 1,
          ),
        ],
        assignmentDescription: null,
      ),
      CourseModule(
        title: 'Module 4: Tawakkul & Trust',
        duration: '5 lessons • 62 min',
        lessons: [
          CourseLessonItem(title: 'Understanding Tawakkul', duration: '20:00'),
          CourseLessonItem(title: 'Building Trust in Allah', duration: '18:45'),
          // ... more lessons
        ],
        quiz: null,
        assignmentDescription: null,
      ),
      CourseModule(
        title: 'Module 5: Building Resilience',
        duration: '3 lessons • 54 min',
        lessons: [
          CourseLessonItem(
            title: 'Creating Resilience Plans',
            duration: '22:00',
          ),
          CourseLessonItem(title: 'Long-term Strategies', duration: '20:30'),
        ],
        quiz: null,
        assignmentDescription: null,
      ),
    ],
    courseDetails: const CourseDetails(
      level: 'Beginner',
      duration: '3 weeks',
      lessons: 12,
      modules: 5,
    ),
    instructor: const InstructorData(
      name: 'Dr. Sarah Johnson',
      title: 'Islamic Psychology Specialist',
      bio:
          'Content will always be kept fresh! Our team will be helping guide the course forward.',
      studentCount: 12450,
      courseCount: 24,
    ),
    requirements: const [
      'Open mind and willingness to learn',
      'Basic understanding of Islam',
      'Notebook for exercises',
      'Commitment to daily practice',
    ],
    reviews: const [
      Review(
        name: 'Fatima Ahmed',
        rating: 5,
        date: 'Jan 2024',
        comment:
            'This course completely changed my perspective on managing anxiety. The combination of Islamic teachings and modern psychology is brilliant. Highly recommended!',
      ),
      Review(
        name: 'Omar Hassan',
        rating: 5,
        date: 'Jan 2024',
        comment:
            'MashAllah, an excellent course. Dr. Sarah explains complex concepts in such an accessible way. The practical exercises have been life-changing.',
      ),
      Review(
        name: 'Aisha Ibrahim',
        rating: 5,
        date: 'Dec 2023',
        comment:
            'I appreciated the balance between spiritual and scientific approaches. The dhikr practices have become part of my daily routine now.',
      ),
      Review(
        name: 'Yusuf Ali',
        rating: 4,
        date: 'Dec 2023',
        comment:
            'Very informative and well-structured. Some lessons could be a bit shorter, but overall excellent content.',
      ),
    ],
  );
}
