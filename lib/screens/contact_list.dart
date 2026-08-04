import 'package:flutter/material.dart';
import 'package:student_contact_directory/theme.dart';

class ContactList extends StatelessWidget {
  const ContactList({
    super.key,
    required this.contacts,
    required this.onDelete,
  });

  final Function(int) onDelete;
  final List<Map<String, String>> contacts;

  @override
  Widget build(BuildContext context) {
    if (contacts.isEmpty) {
      return const Center(child: Text('No contacts have been added.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            title: Text(contact['name'] ?? ''),
            subtitle: Text(
              '${contact['email']}\n${contact['contact']} • ${contact['program']}',
            ),
            isThreeLine: true,
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onDelete(index),
            ),
          ),
        );
      },
    );
  }
}
