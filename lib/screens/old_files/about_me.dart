import 'package:flutter/material.dart';
import 'package:student_contact_directory/shared/styled_text.dart';

import '../../theme.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle("About The Student"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              // padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset("assets/img.png"),
              ),
            ),
            SizedBox(height: 18),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.cardBackground,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StyledTitle("About Me"),
                  SizedBox(height: 10),
                  StyledText(
                    "I'm Jasper Gonzales, a second-year BSIT student who loves building software projects just as much as I love watching Interstellar. Whether I'm diving into code or just listening to music, I'm always chasing that sense of wonder and exploring new ideas.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
