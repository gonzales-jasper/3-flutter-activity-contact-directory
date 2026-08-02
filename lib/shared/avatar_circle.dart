import 'package:flutter/material.dart';

import '../theme.dart';

class AvatarCircle extends StatelessWidget {
  const AvatarCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor.withValues(alpha: 0.5),
        ),
        child: CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage('assets/id.png'),
        ),
      ),
    );
  }
}
