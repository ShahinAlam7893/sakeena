import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/route/go_route.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage>
    with SingleTickerProviderStateMixin {
  late final Map<String, TextEditingController> controllers = {
    'fullName': TextEditingController(text: 'Student Name'),
    'email': TextEditingController(text: 'student@example.com'),
    'phone': TextEditingController(text: '+1 234 567 8900'),
    'location': TextEditingController(text: 'New York, USA'),
    'currentPassword': TextEditingController(),
    'newPassword': TextEditingController(),
    'confirmPassword': TextEditingController(),
  };

  late final Map<String, bool> passwordVisibility = {
    'current': false,
    'new': false,
    'confirm': false,
  };

  bool isEditing = false;

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileAvatar(),
            SizedBox(height: 24.h),
            _buildProfileForm(),
            SizedBox(height: 24.h),
            _buildChangePasswordSection(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundImage: const AssetImage(
                  'assets/images/profile_image.jpg',
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 36.w,
                    height: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF5B72EE),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'JPG, PNG or GIF (max. 2MB)',
            style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile Information',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                _buildEditableField(
                  'fullName',
                  'Full Name',
                  Icons.person_outline,
                ),
                SizedBox(height: 12.h),
                _buildEditableField(
                  'email',
                  'Email Address',
                  Icons.email_outlined,
                ),
                SizedBox(height: 12.h),
                _buildEditableField(
                  'phone',
                  'Phone Number',
                  Icons.phone_outlined,
                ),
                SizedBox(height: 12.h),
                _buildEditableField(
                  'location',
                  'Location',
                  Icons.location_on_outlined,
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  text: isEditing ? 'Save Changes' : 'Edit Profile',
                  onPressed: () => setState(() => isEditing = !isEditing),
                  isGradient: true,
                  width: double.infinity,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangePasswordSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lock_outline, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                'Change Password',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                _buildPasswordField(
                  'currentPassword',
                  'Current Password',
                  'current',
                ),
                SizedBox(height: 16.h),
                _buildPasswordField('newPassword', 'New Password', 'new'),
                SizedBox(height: 16.h),
                _buildPasswordField(
                  'confirmPassword',
                  'Confirm New Password',
                  'confirm',
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  text: 'Update Password',
                  onPressed: _validateAndUpdatePassword,
                  isGradient: true,
                  width: double.infinity,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Actions',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: _showLogoutDialog,
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          size: 18.sp,
                          color: Colors.red.shade600,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: _showDeleteAccountDialog,
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_forever_outlined,
                          size: 18.sp,
                          color: Colors.red.shade600,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Delete account',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField(String key, String label, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: isEditing ? Colors.white : Colors.grey.shade50,
            border: Border.all(
              color: isEditing ? const Color(0xFF5B72EE) : Colors.grey.shade200,
              width: isEditing ? 1.5 : 1,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),

          child: TextField(
            controller: controllers[key],
            enabled: isEditing,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, size: 18.sp, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
            ),
            style: TextStyle(fontSize: 13.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(String key, String label, String visibilityKey) {
    final isVisible = passwordVisibility[visibilityKey] ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: TextField(
            controller: controllers[key],
            obscureText: !isVisible,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outline,
                size: 18.sp,
                color: Colors.grey,
              ),
              suffixIcon: GestureDetector(
                onTap: () => setState(
                  () => passwordVisibility[visibilityKey] = !isVisible,
                ),
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  size: 18.sp,
                  color: Colors.grey,
                ),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
            ),
            style: TextStyle(fontSize: 13.sp),
          ),
        ),
      ],
    );
  }

  void _validateAndUpdatePassword() {
    final current = controllers['currentPassword']!.text;
    final newPwd = controllers['newPassword']!.text;
    final confirm = controllers['confirmPassword']!.text;

    if (current.isEmpty || newPwd.isEmpty || confirm.isEmpty) {
      _showSnackBar('All fields are required', Colors.red);
      return;
    }
    if (newPwd.length < 6) {
      _showSnackBar('Password must be at least 6 characters', Colors.red);
      return;
    }
    if (newPwd != confirm) {
      _showSnackBar('Passwords do not match', Colors.red);
      return;
    }

    _showSnackBar('Password updated successfully!', Colors.green);
    controllers['currentPassword']!.clear();
    controllers['newPassword']!.clear();
    controllers['confirmPassword']!.clear();
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => context.go(AppRoutes.login),
            child: Text('Logout', style: TextStyle(color: Colors.red.shade600)),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to Delete account?\nThis action will delete your all data permanently!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => context.go(AppRoutes.signup),
            child: Text('Delete', style: TextStyle(color: Colors.red.shade600)),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
