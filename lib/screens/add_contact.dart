import 'package:flutter/material.dart';
import 'package:student_contact_directory/shared/styled_text.dart';
import 'package:student_contact_directory/theme.dart';

import '../shared/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StyledTitleLarge("Welcome!"),
          StyledTitle("Jasper N. Gonzales"),
          Text(
            "BSIT 3GG1",
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          StyledText(
            "Hi! Outside of coding, I'm a space enthusiast, as i'm a huge fan of Interstellar and black hole fun facts. Also, I'm Taylor Swift fan. I currently love building with Flutter because its default design and intuitive frameworks make development a breeze!",
          ),
          const SizedBox(height: 20),

          //container
          StyledCard(
            icon: Icons.edit_note,
            iconColor: AppColors.primaryColor,
            title: 'My Goal',
            subtitle:
                'To become a software developer and build solutions that make a difference.',
          ),
          SizedBox(height: 10),

          //second container
          StyledCard(
            icon: Icons.star,
            iconColor: AppColors.secondaryColor,
            title: 'Favorite Movie Line',
            subtitle: "It's Impossible--No, it's Necessary.",
          ),
        ],
      ),
    );
  }
}
