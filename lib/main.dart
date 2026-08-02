import 'package:flutter/material.dart';
import 'package:student_contact_directory/screens/main_screen.dart';
import 'package:student_contact_directory/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile App',
      theme: theme,
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
