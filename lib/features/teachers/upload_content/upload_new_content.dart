import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/core/app_theme.dart'; 
import 'package:sakeena/route/teachers_routes.dart';
import 'package:sakeena/widgets/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';
import 'package:sakeena/widgets/custom_text_field.dart'; 

class UploadNewContentPage extends StatelessWidget {
  const UploadNewContentPage({super.key});

  static const Color primaryTeal = Color(0xFF2D7A7B);
  static const Color accentGold = Color(0xFFD49726);
  static const Color lightGrayBg = Color(0xFFF3F4F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back, color: primaryTeal),
                ),
                Text(
                  "Upload Content",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primaryTeal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            const Text(
              "Add materials, videos, and resources for your courses",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),

            // Toggle buttons
            // _ToggleButtons(),
            SizedBox(height: 28.h),

            // Upload Image Section
            Text("Upload Image", style: _sectionTitleStyle),
            SizedBox(height: 12.h),
            _UploadImageArea(),
            SizedBox(height: 32.h),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Cancel",
                    onPressed: () => Navigator.pop(context),
                    isOutlined: true,
                    height: 52.h,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomButton(
                    text: "Upload Content",
                    onPressed: () {
                      // TODO: handle upload
                    },
                    isGradient: true,
                    height: 52.h,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 36.h),

            // Blog Title
            _LabeledField(
              label: "Blog Title",
              child: CustomTextField(
                hintText: "Enter a compelling title...",
                maxLength: 100,
              ),
            ),
            SizedBox(height: 24.h),

            // Excerpt
            _LabeledField(
              label: "Excerpt",
              child: CustomTextField(
                hintText:
                    "Write a brief summary (this will appear in blog previews)...",
                // maxLines: 4,
                maxLength: 300,
              ),
            ),
            SizedBox(height: 32.h),

            // // Publishing Options
            // Text("Publishing Options", style: _sectionTitleStyle),
            // SizedBox(height: 16.h),
            // _PublishingOptionRow("Read Time", "5 min read"),
            // _PublishingOptionRow(
            //   "Publish Date",
            //   "Select date",
            //   isSelectable: true,
            // ),
            // SizedBox(height: 32.h),

            // Tags
            Text("Tags", style: _sectionTitleStyle),
            SizedBox(height: 12.h),
            _TagsRow(),
            SizedBox(height: 32.h),

            // Author Information
            Text("Author Information", style: _sectionTitleStyle),
            SizedBox(height: 16.h),
            _AuthorCard(),
            SizedBox(height: 40.h),

            Text("Blog Content", style: _sectionTitleStyle),
            SizedBox(height: 12.h),
            _MediaAddButtons(),
            SizedBox(height: 16.h),

            // ── Multi-line Blog Content Editor ──
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextField(
                maxLines: null,
                minLines: 10,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: "Start writing your blog content here...",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 15.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.w),
                ),
                style: TextStyle(
                  fontSize: 15.sp,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Additional Media
            // Text("Additional Media", style: _sectionTitleStyle),
            // SizedBox(height: 12.h),
            // _MediaAddButtons(isAdditional: true),
            // SizedBox(height: 40.h),

            // Final Publish Button
            CustomButton(
              text: "Publish",
              onPressed: () {
                // TODO: publish logic
              },
              isGradient: true,
              height: 56.h,
              width: double.infinity,
              textColor: Colors.white,
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }

  // ──────────────────────────────────────────────
  // Small helper widgets
  // ──────────────────────────────────────────────

  Widget _ToggleButtons() => Row(
    children: [
      Expanded(
        child: CustomButton(
          text: "My Content",
          onPressed: () {
            TeachersRoutes.uploadContent;
          },
          isOutlined: true,
          height: 48.h,
        ),
      ),
      SizedBox(width: 12.w),
      Expanded(
        child: CustomButton(
          text: "Upload New Content",
          onPressed: () {
            TeachersRoutes.uploadNewContent;
          },
          isGradient: true,
          height: 48.h,
          textColor: Colors.white,
        ),
      ),
    ],
  );

  Widget _UploadImageArea() => Container(
    height: 220.h,
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: Colors.grey.shade300, width: 2),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_outlined, size: 64.sp, color: Colors.grey.shade400),
          SizedBox(height: 12.h),
          Text(
            "Click to upload cover image",
            style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade700),
          ),
          SizedBox(height: 4.h),
          Text(
            "Recommended: 1200×630px, JPG or PNG",
            style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade500),
          ),
        ],
      ),
    ),
  );

  Widget _LabeledField({required String label, required Widget child}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: _sectionTitleStyle),
          SizedBox(height: 8.h),
          child,
        ],
      );

  Widget _PublishingOptionRow(
    String label,
    String value, {
    bool isSelectable = false,
  }) => Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelectable ? Colors.white : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              color: isSelectable ? Colors.black87 : Colors.grey.shade700,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _TagsRow() => Wrap(
    spacing: 8.w,
    runSpacing: 8.h,
    children: [
      _TagChip("Islamic Spirituality"),
      _TagChip("Mental Health"),
      _TagChip("Mindfulness"),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Add a tag...", style: TextStyle(color: Colors.grey)),
            SizedBox(width: 4),
            Icon(Icons.add_circle_outline, size: 18, color: Colors.grey),
          ],
        ),
      ),
    ],
  );

  Widget _TagChip(String text) => Chip(
    label: Text(
      text,
      style: TextStyle(fontSize: 13.sp, color: primaryTeal),
    ),
    backgroundColor: primaryTeal.withOpacity(0.1),
    padding: EdgeInsets.symmetric(horizontal: 12.w),
    deleteIcon: const Icon(Icons.close, size: 18),
    onDeleted: () {},
  );

  Widget _AuthorCard() => Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: Colors.teal.shade50.withOpacity(0.4),
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: primaryTeal,
          child: Text(
            "SA",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dr. Fatima Ara",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              "Islamic Psychology Expert",
              style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade700),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _MediaAddButtons({bool isAdditional = false}) => Row(
    children: [
      Expanded(
        child: _MediaButton(icon: Icons.image_outlined, label: "Add Image"),
      ),
      SizedBox(width: 12.w),
      Expanded(
        child: _MediaButton(icon: Icons.videocam_outlined, label: "Add Video"),
      ),
    ],
  );

  Widget _MediaButton({required IconData icon, required String label}) =>
      OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 20.sp, color: primaryTeal),
        label: Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: primaryTeal),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: primaryTeal),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
      );

  // Helpers
  TextStyle get _sectionTitleStyle => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );
}
