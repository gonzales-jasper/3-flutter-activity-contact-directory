import 'package:flutter/material.dart';
import 'package:student_contact_directory/theme.dart';

import 'card_with_images.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {
        'icon': Icons.check_circle,
        'iconColor': Colors.green,
        'title': 'Applied CustomTheme and Colors',
        'desc':
            'Established a consistent dark theme palette and custom typography across the application.',
      },
      {
        'icon': Icons.code,
        'iconColor': Colors.blue,
        'title': 'Integrated Local Asset Images',
        'desc':
            'Added and styled local student ID and project preview assets using ClipRRect.',
      },
      {
        'icon': Icons.widgets,
        'iconColor': Colors.orange,
        'title': 'Practiced UI Widgets',
        'desc': 'Explored and practiced common Flutter widgets.',
      },
      {
        'icon': Icons.person,
        'iconColor': Colors.purple,
        'title': 'Designed Student Profile',
        'desc': 'Created the UI for the student profile application.',
      },
      {
        'icon': Icons.upload_file,
        'iconColor': Colors.teal,
        'title': 'Submitted Laboratory Activity',
        'desc': 'Submitted the laboratory activity documents.',
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (var activity in activities)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Icon(
                activity['icon'] as IconData,
                color: activity['iconColor'] as Color,
              ),
              title: Text(activity['title'] as String),
              subtitle: Text(activity['desc'] as String),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),

        //with image
        CardWithImages(
          image: "assets/student_counter.png",
          title: "Student Counter App",
          description: "My First Flutter Activity",
        ),
        CardWithImages(
          image: "assets/student_profile.png",
          title: "Student Profile App",
          description: "My Second Flutter Activity: With Navigation and Drawer",
        ),
      ],
    );
  }
}
