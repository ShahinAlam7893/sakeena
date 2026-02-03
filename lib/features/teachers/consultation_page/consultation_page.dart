import 'package:flutter/material.dart';
import 'package:sakeena/features/teachers/common/custom_app_bar.dart';
import 'package:sakeena/widgets/custom_button.dart';

class ConsultationManagementScreen extends StatefulWidget {
  const ConsultationManagementScreen({super.key});

  @override
  State<ConsultationManagementScreen> createState() =>
      _ConsultationManagementScreenState();
}

class _ConsultationManagementScreenState
    extends State<ConsultationManagementScreen> {
  bool isBooked = true;
  bool isAvailbale = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              _header(),
              const SizedBox(height: 16),
              _statsGrid(),
              const SizedBox(height: 16),
              _tabs(
                context,
                () {
                  setState(() {
                    isBooked = true;
                    isAvailbale = false;
                  });
                },
                () {
                  setState(() {
                    isAvailbale = true;
                    isBooked = false;
                  });
                },
                isAvailbale,
                isBooked,
              ),
              const SizedBox(height: 16),
              isBooked
                  ? Column(
                      children: [
                        SessionCard.pending(),
                        SessionCard.joinable(),
                        SessionCard.confirmation(),
                      ],
                    )
                  : AvailabilityCard(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _header() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        "Consultation Management",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 4),
      Text(
        "Create comprehensive course content for students",
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );
}

Widget _statsGrid() {
  return Column(
    children: [
      StatCard(
        title: "Booked Sessions",
        value: "12",
        icon: Icons.chat_bubble_outline,
        color: Colors.blue,
      ),
      const SizedBox(height: 12),
      StatCard(
        title: "This Week",
        value: "3",
        icon: Icons.calendar_today,
        color: Colors.green,
      ),
      const SizedBox(height: 12),
      StatCard(
        title: "Hourly Rate",
        value: "\$35",
        subtitle: "Set by admin",
        icon: Icons.access_time,
        color: Colors.orange,
      ),
    ],
  );
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null)
                  Text(subtitle!, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
          ),
        ],
      ),
    );
  }
}

Widget _tabs(
  BuildContext context,
  Function() onTap,
  Function() onTap2,
  bool isAvaile,
  bool isBooked,
) {
  return Row(
    children: [
      Expanded(
        child: CustomButton(
          text: "Book Sessions",
          onPressed: () {
            onTap();
          },
          isGradient: isBooked == true && isAvaile == false ? true : false,
          isOutlined: isBooked == true && isAvaile == false ? false : true,
          textColor: isBooked == true && isAvaile == false
              ? Colors.white
              : Colors.black,
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: CustomButton(
          text: "My Availability",
          onPressed: () {
            onTap2();
          },
          isGradient: isBooked == false && isAvaile == true ? true : false,
          isOutlined: isBooked == false && isAvaile == true ? false : true,
          textColor: isBooked == false && isAvaile == true
              ? Colors.white
              : Colors.black,
        ),
      ),
    ],
  );
}

class SessionCard extends StatelessWidget {
  final Widget action;

  const SessionCard({super.key, required this.action});

  // 🔸 Pending session
  factory SessionCard.pending() => SessionCard(
    action: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        CancelChip("Cancel", Colors.red),
        StatusChip("Pending", Color(0xffD08700)),
        JoinButton(),
      ],
    ),
  );

  factory SessionCard.joinable() => const SessionCard(action: JoinButton());

  factory SessionCard.confirmation() => SessionCard(
    action: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        StatusChip("Confirmed", Color(0xff00A63E)),
        CancelChip("Cancel", Colors.red),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📅 Calendar Icon Box
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xffE6F2F2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calendar_month_outlined,
              color: Color(0xff2E8B8B),
              size: 22,
            ),
          ),

          const SizedBox(width: 12),

          // 📄 Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sarah Johnson",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Jan 9, 2026  •  10:00 AM",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 12),

                // 🔘 Action buttons (LEFT aligned)
                action,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  final String label;
  final Color color;

  const StatusChip(this.label, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        side: BorderSide(color: color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          color:
              label.toLowerCase() == "pending" ||
                  label.toLowerCase() == "confirmed"
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}

class CancelChip extends StatelessWidget {
  final String label;
  final Color color;

  const CancelChip(this.label, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {},
      child: Text(label, style: TextStyle(color: color)),
    );
  }
}

class JoinButton extends StatelessWidget {
  const JoinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff00A63E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {},
      icon: const Icon(Icons.video_call, color: Colors.white),
      label: const Text("Join Session", style: TextStyle(color: Colors.white)),
    );
  }
}

class AvailabilityCard extends StatelessWidget {
  const AvailabilityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffFFFDF8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE6EAE8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Header
          Row(
            children: const [
              Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: Color(0xff5F9EA0),
              ),
              SizedBox(width: 8),
              Text(
                "Availability",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5F9EA0),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 🔹 Availability Items
          AvailabilityItem(date: "05 January, Monday", time: "09:00 - 09:30"),
          AvailabilityItem(
            date: "07 January, Wednesday",
            time: "09:00 - 09:30",
          ),
          AvailabilityItem(date: "10 January, Monday", time: "09:00 - 09:30"),
          AvailabilityItem(
            date: "15 January, Wednesday",
            time: "09:00 - 09:30",
          ),
        ],
      ),
    );
  }
}

// ===================== ITEM =====================

class AvailabilityItem extends StatelessWidget {
  final String date;
  final String time;

  const AvailabilityItem({super.key, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xffE6EAE8)),
      ),
      child: Row(
        children: [
          // 📅 Icon Box
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xffF1F6F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calendar_month_outlined,
              color: Color(0xff5F9EA0),
            ),
          ),

          const SizedBox(width: 12),

          // 📄 Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),

          // 🔘 Reschedule Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            onPressed: () {
              showDialog(context: context, builder: (_) => RescheduleDialog());
            },
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff2E8B8B), Color(0xff1F6F6F)],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Text(
                  "Reschedule",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RescheduleDialog extends StatelessWidget {
  const RescheduleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.videocam_outlined,
                        color: Color(0xFF2D7A7B),
                        size: 28,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Reschedule New Session',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D7A7B),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.grey),
                  ),
                ],
              ),
              const Divider(height: 32),

              // Reason Section
              _buildLabel("Reschedule Reason:", isRequired: true),
              _buildInputField(hint: "Busy for...."),
              const SizedBox(height: 4),
              const Text(
                "Give your live session a descriptive title",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 20),

              // Date and Time Row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(
                          "Date",
                          isRequired: true,
                          icon: Icons.calendar_today_outlined,
                        ),
                        _buildInputField(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(
                          "Start Time",
                          isRequired: true,
                          icon: Icons.access_time,
                        ),
                        _buildInputField(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(
                          "End Time",
                          isRequired: true,
                          icon: Icons.access_time,
                        ),
                        _buildInputField(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Zoom Link Section
              _buildLabel("Zoom Meeting Link", icon: Icons.videocam_outlined),
              _buildInputField(hint: "https://zoom.us/j/1234567890"),
              const SizedBox(height: 4),
              const Text(
                "Create a Zoom meeting and paste the link here. Students will use this to join.",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 32),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: StadiumBorder(),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: StadiumBorder(),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Send Schedule",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to build labels with optional red asterisk and icons
  Widget _buildLabel(String text, {bool isRequired = false, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: const Color(0xFF2D7A7B)),
            const SizedBox(width: 6),
          ],
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 10,
              ),
              children: [
                TextSpan(text: text),
                if (isRequired)
                  const TextSpan(
                    text: " *",
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build the stylized gray input fields
  Widget _buildInputField({String? hint}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
