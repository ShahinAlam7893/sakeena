import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/core/app_theme.dart';

import '../../../main.dart';

class CreateCourseScreen extends StatefulWidget {
  final bool isEditing;
  final Map<String, dynamic>? courseData;

  const CreateCourseScreen({
    super.key,
    this.isEditing = false,
    this.courseData,
  });

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  late TextEditingController courseTitleController;
  late TextEditingController instructorController;
  late TextEditingController categoryController;
  late TextEditingController statusController;
  late TextEditingController priceController;
  late TextEditingController durationController;
  late TextEditingController totalLessonsController;
  late TextEditingController ratingController;

  @override
  void initState() {
    super.initState();
    courseTitleController = TextEditingController(
      text: widget.courseData?['courseTitle'] ?? '',
    );
    instructorController = TextEditingController(
      text: widget.courseData?['instructor'] ?? '',
    );
    categoryController = TextEditingController(
      text: widget.courseData?['category'] ?? '',
    );
    statusController = TextEditingController(
      text: widget.courseData?['status'] ?? 'Draft',
    );
    priceController = TextEditingController(
      text: widget.courseData?['price'] ?? '',
    );
    durationController = TextEditingController(
      text: widget.courseData?['duration'] ?? '',
    );
    totalLessonsController = TextEditingController(
      text: widget.courseData?['totalLessons']?.toString() ?? '',
    );
    ratingController = TextEditingController(
      text: widget.courseData?['rating']?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    courseTitleController.dispose();
    instructorController.dispose();
    categoryController.dispose();
    statusController.dispose();
    priceController.dispose();
    durationController.dispose();
    totalLessonsController.dispose();
    ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: AppTheme.primaryColor,
            size: 24.sp,
          ),
        ),
        title: Text(
          widget.isEditing ? 'Edit Course' : 'Create New Course',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Title
              _InputField(
                label: 'Course Title',
                controller: courseTitleController,
                hintText: 'Enter course title',
              ),
              SizedBox(height: 20.h),
              // Instructor
              _InputField(
                label: 'Instructor',
                controller: instructorController,
                hintText: 'Enter instructor name',
              ),
              SizedBox(height: 20.h),
              // Category
              _InputField(
                label: 'Category',
                controller: categoryController,
                hintText: 'Enter category',
              ),
              SizedBox(height: 20.h),
              // Status
              _DropdownField(
                label: 'Status',
                value: statusController.text,
                items: ['Draft', 'Live', 'Upcoming', 'Archived'],
                onChanged: (value) {
                  if (value != null) {
                    statusController.text = value;
                    setState(() {});
                  }
                },
              ),
              SizedBox(height: 20.h),
              // Price
              _InputField(
                label: 'Price',
                controller: priceController,
                hintText: 'Enter price',
                keyboardType: TextInputType.number,
                prefixText: '\$',
              ),
              SizedBox(height: 20.h),
              // Duration
              _InputField(
                label: 'Duration',
                controller: durationController,
                hintText: 'e.g., 12 Weeks',
              ),
              SizedBox(height: 20.h),
              // Total Lessons
              _InputField(
                label: 'Total Lessons',
                controller: totalLessonsController,
                hintText: 'Enter number of lessons',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.h),
              // Rating
              _InputField(
                label: 'Rating',
                controller: ratingController,
                hintText: 'e.g., 4.8',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 40.h),
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        side: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.5.w,
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      child: Text(
                        widget.isEditing ? 'Update Course' : 'Create Course',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSave() {
    // Validate fields
    if (courseTitleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter course title')),
      );
      return;
    }

    if (instructorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter instructor name')),
      );
      return;
    }

    // Handle save logic
    final courseData = {
      'courseTitle': courseTitleController.text,
      'instructor': instructorController.text,
      'category': categoryController.text,
      'status': statusController.text,
      'price': priceController.text,
      'duration': durationController.text,
      'totalLessons': totalLessonsController.text,
      'rating': ratingController.text,
    };

    Navigator.pop(context, courseData);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.isEditing ? 'Course updated successfully' : 'Course created successfully',
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? prefixText;

  const _InputField({
    required this.label,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixText: prefixText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppTheme.primaryColor,
                width: 2.w,
              ),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            hintStyle: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ],
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _DropdownField({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: value.isEmpty ? items.first : value,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppTheme.primaryColor,
                width: 2.w,
              ),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
        ),
      ],
    );
  }
}
