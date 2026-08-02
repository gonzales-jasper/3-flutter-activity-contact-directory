import 'package:flutter/material.dart';
import '../shared/avatar_circle.dart';
import '../shared/profile_card/info_card.dart';
import '../shared/profile_card/info_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Center(child: AvatarCircle()),
          const SizedBox(height: 20),

          InfoCard(
            title: 'Personal Information',
            titleIcon: Icons.person,
            rows: const [
              InfoRow(
                icon: Icons.badge,
                label: 'Full Name',
                value: 'Jasper N. Gonzales',
              ),
              InfoRow(
                icon: Icons.confirmation_number,
                label: 'Student Number',
                value: '2024100973',
              ),
              InfoRow(
                icon: Icons.school,
                label: 'Course',
                value: 'Bachelor of Science in Information Technology',
              ),
              InfoRow(
                icon: Icons.people,
                label: 'Year Level',
                value: '3nd Year',
              ),
            ],
          ),

          InfoCard(
            title: 'Contact Information',
            titleIcon: Icons.email,
            rows: const [
              InfoRow(
                icon: Icons.email,
                label: 'Email',
                value: 'pro.japegonzales@gmail.com',
              ),
              InfoRow(icon: Icons.phone, label: 'Phone', value: '09553864609'),
              InfoRow(
                icon: Icons.location_on,
                label: 'Address',
                value: 'Paombong, Bulacan',
              ),
            ],
          ),
          InfoCard(
            title: 'Skills And Interest',
            titleIcon: Icons.interests,
            rows: const [
              InfoRow(
                icon: Icons.code,
                label: 'Technical Skills',
                value: 'Flutter & Dart, UI/UX Design',
              ),
              InfoRow(
                icon: Icons.favorite_border,
                label: 'Interests',
                value: 'Space & Astronomy, Software Development, Music',
              ),
              InfoRow(
                icon: Icons.emoji_events_outlined,
                label: 'Aspiration',
                value: 'To become a skilled software developer',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
