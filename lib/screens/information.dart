import 'package:flutter/material.dart';
import '../theme.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          shadowColor: Colors.black.withOpacity(0.5),
          color: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- ABOUT SECTION ---
                _buildSectionHeader(icon: Icons.info, title: 'About This App'),
                const SizedBox(height: 8),
                const Text(
                  'The Student Contact Directory is a Flutter application that helps manage student contacts easily. '
                  'You can add, view, and delete contacts, and keep your list organized.',
                  style: TextStyle(height: 1.4, color: AppColors.textColor),
                ),
                Divider(height: 32, color: AppColors.cardAccent),

                // --- WIDGETS USED SECTION ---
                _buildSectionHeader(icon: Icons.widgets, title: 'Widgets Used'),
                const SizedBox(height: 8),
                _buildBulletPoint('Scaffold'),
                _buildBulletPoint('AppBar'),
                _buildBulletPoint('TextField'),
                _buildBulletPoint('ListView & Card'),
                _buildBulletPoint('Drawer'),
                _buildBulletPoint('AlertDialog'),
                _buildBulletPoint('BottomNavigationBar'),
                _buildBulletPoint('CircleAvatar & Icons'),
                Divider(height: 32, color: AppColors.cardAccent),

                // --- DEVELOPER SECTION ---
                _buildSectionHeader(icon: Icons.person, title: 'Developer'),
                const SizedBox(height: 8),
                const Text(
                  'Jasper N. Gonzales',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.titleColor,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'BSIT - 3GG1',
                  style: TextStyle(color: AppColors.textColor),
                ),
                Divider(height: 32, color: AppColors.cardAccent),

                // --- VERSION SECTION ---
                _buildSectionHeader(
                  icon: Icons.verified_user,
                  title: 'Version',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Version 1.0.0',
                  style: TextStyle(color: AppColors.textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for clean headers with icons
  Widget _buildSectionHeader({required IconData icon, required String title}) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 22),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  // Helper widget for bullet list items
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16, color: AppColors.primaryColor),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: AppColors.textColor),
            ),
          ),
        ],
      ),
    );
  }
}
