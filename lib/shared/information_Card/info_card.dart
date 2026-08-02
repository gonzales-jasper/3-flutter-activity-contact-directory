import 'package:flutter/material.dart';
import 'package:student_contact_directory/shared/styled_text.dart';
import 'package:student_contact_directory/theme.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final IconData titleIcon;
  final List<Widget> rows;

  const InfoCard({
    super.key,
    required this.title,
    required this.titleIcon,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(titleIcon, color: AppColors.primaryColor, size: 22),
              const SizedBox(width: 8),
              StyledHeading(title),
            ],
          ),
          const Divider(height: 20, thickness: 1.2, color: Colors.white12),

          for (int i = 0; i < rows.length; i++) ...[
            rows[i],
            if (i != rows.length - 1)
              const Divider(height: 1, thickness: 1.2, color: Colors.white12),
          ],
        ],
      ),
    );
  }
}
