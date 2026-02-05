import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeena/core/app_theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundImage: AssetImage('assets/images/teacher_image.png'),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alex Thompson',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'alex.thompson@email.com',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    _badge('Premium Member', Colors.purple),
                    SizedBox(width: 6.w),
                    // _badge('2 Courses', Colors.orange),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _badge(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 10.sp, color: color),
      ),
    );
  }
}


class ProfileHeaderTeacher extends StatefulWidget {
  final String initials; // still used for avatar fallback
  final VoidCallback onUploadPhoto;
  final String initialFullName;
  final String initialTitle;
  final String initialEmail;
  final String initialLocation;

  // You can pass initial values from parent / bloc / provider / firebase
  const ProfileHeaderTeacher({
    super.key,
    required this.initials,
    required this.onUploadPhoto,
    required this.initialFullName,
    required this.initialTitle,
    required this.initialEmail,
    required this.initialLocation,
  });

  @override
  State<ProfileHeaderTeacher> createState() => _ProfileHeaderTeacherState();
}

class _ProfileHeaderTeacherState extends State<ProfileHeaderTeacher> {
  late TextEditingController _nameController;
  late TextEditingController _titleController;
  late TextEditingController _emailController;
  late TextEditingController _locationController;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialFullName);
    _titleController = TextEditingController(text: widget.initialTitle);
    _emailController = TextEditingController(text: widget.initialEmail);
    _locationController = TextEditingController(text: widget.initialLocation);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _titleController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    if (_isEditing) {
      // ── SAVE logic here ────────────────────────────────
      // You can call a bloc event, repository method, etc.
      final updatedData = {
        'fullName': _nameController.text.trim(),
        'title': _titleController.text.trim(),
        'email': _emailController.text.trim(),
        'location': _locationController.text.trim(),
      };

      // Example:
      // context.read<ProfileBloc>().add(UpdateProfileEvent(updatedData));
      // await profileRepo.updateTeacherProfile(updatedData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated')),
      );
    }

    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),

        // Profile Avatar (unchanged)
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              widget.initials,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),

        SizedBox(height: 16.h),

        // Edit Profile / Save Button
        GestureDetector(
          onTap: _toggleEditMode,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              _isEditing ? 'Save Changes' : 'Edit Profile',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),

        if (_isEditing) ...[
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () {
              // Reset to original values and exit edit mode
              setState(() {
                _nameController.text = widget.initialFullName;
                _titleController.text = widget.initialTitle;
                _emailController.text = widget.initialEmail;
                _locationController.text = widget.initialLocation;
                _isEditing = false;
              });
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade700,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],

        SizedBox(height: 8.h),
        Text(
          'Professional photo recommended (JPG, PNG - Max. 5MB)',
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.grey.shade500,
          ),
        ),

        SizedBox(height: 20.h),

        // ── Full Name / Title ───────────────────────────────────────
        _buildEditableField(
          label: 'Full Name / Title',
          controller: _nameController,
          isEditing: _isEditing,
        ),

        SizedBox(height: 12.h),

        // ── Public Email ────────────────────────────────────────────
        _buildEditableField(
          label: 'Public Email',
          controller: _emailController,
          isEditing: _isEditing,
        ),

        SizedBox(height: 12.h),

        // ── Location ────────────────────────────────────────────────
        _buildEditableField(
          label: 'Location',
          controller: _locationController,
          isEditing: _isEditing,
        ),
      ],
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required bool isEditing,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 4.h),

          if (isEditing)
            TextField(
              controller: controller,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
              ),
            )
          else
            Text(
              controller.text.isEmpty ? 'Not set' : controller.text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }
}