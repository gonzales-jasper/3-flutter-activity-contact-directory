import 'package:flutter/material.dart';
import 'package:student_contact_directory/shared/textfield_card.dart';
import 'package:student_contact_directory/theme.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key, required this.onAdd});

  final Function(Map<String, String>) onAdd;

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
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 18),

            TextFieldCard(
              tfController: emailController,
              keyboardTypes: TextInputType.emailAddress,
              labelTexts: 'Email Address',
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 18),
            TextFieldCard(
              tfController: contactController,
              keyboardTypes: TextInputType.phone,
              labelTexts: 'Contact Number',
              prefixIcon: Icons.phone,
            ),
            const SizedBox(height: 18),
            TextFieldCard(
              tfController: programController,
              keyboardTypes: TextInputType.text,
              labelTexts: 'Program',
              prefixIcon: Icons.school,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _submitContact,
              child: const Text(
                'Add Contact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitContact() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final contact = contactController.text.trim();
    final program = programController.text.trim();

    if (name.isEmpty || email.isEmpty || contact.isEmpty || program.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    if (!email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(contact) || contact.length != 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid contact number.')),
      );
      return;
    }

    widget.onAdd({
      'name': name,
      'email': email,
      'contact': contact,
      'program': program,
    });

    nameController.clear();
    emailController.clear();
    contactController.clear();
    programController.clear();

    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contact added successfully!')),
    );
  }
}
