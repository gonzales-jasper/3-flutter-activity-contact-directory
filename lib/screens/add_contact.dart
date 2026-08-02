import 'package:flutter/material.dart';
import 'package:student_contact_directory/shared/styled_text.dart';
import 'package:student_contact_directory/shared/textfield_card.dart';
import 'package:student_contact_directory/theme.dart';

import '../shared/card.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key, required this.onAdd});

  final Function(Map<String,String>) onAdd;

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final programController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldCard(
              tfController: nameController,
              keyboardTypes: TextInputType.text,
                labelTexts: 'Full Name',
                prefixIcon:  Icons.person,
            ),
            const SizedBox(height: 18),

            TextFieldCard(
              tfController: emailController,
              keyboardTypes: TextInputType.emailAddress,
              labelTexts: 'Email Address',
              prefixIcon:  Icons.email,
            ),
            const SizedBox(height: 18),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Contact Number',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: programController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Program',
                prefixIcon: Icon(Icons.school),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(
                    color: AppColors.scaffoldBackground,  // the border's color
                    width: 1,                   // how thick the border line is
                  ),
                ),
              ),
              onPressed:(){}/* _submitContact*/,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Add Contact'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}