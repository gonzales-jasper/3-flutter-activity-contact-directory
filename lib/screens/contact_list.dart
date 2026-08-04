import 'package:flutter/material.dart';
import 'package:student_contact_directory/theme.dart';

class ContactList extends StatelessWidget {
  const ContactList({
    super.key,
    required this.contacts,
    required this.onDelete,
  });

  final void Function(int) onDelete;
  final List<Map<String, String>> contacts;

  Color _getAvatarColor(String name) {
    final colors = [
      Colors.deepOrange,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
      Colors.blue,
      Colors.amber.shade800,
      Colors.cyan.shade700,
      Colors.green,
      Colors.deepPurple,
      Colors.redAccent,
      Colors.lightBlue,
      Colors.lime.shade800,
      Colors.brown,
      Colors.cyan,
    ];
    if (name.isEmpty) return AppColors.primaryColor;
    return colors[name.hashCode.abs() % colors.length];
  }

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

        final email = contact['email'] ?? '';
        final phone = contact['contact'] ?? '';
        final program = contact['program'] ?? '';

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          color: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: CircleAvatar(
                backgroundColor: _getAvatarColor(contact['name'] ?? ''),
                child: Text(
                  contact['name']?.isNotEmpty == true
                      ? contact['name']![0].toUpperCase()
                      : '?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                contact['name'] ?? 'No Name',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('$email\n$phone • $program'),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () => _showDeleteContactDialog(context, index),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDeleteContactDialog(BuildContext context, int index) {
    final String contactName = contacts[index]['name'] ?? '';
    final String contactNumber = contacts[index]['contact'] ?? '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Contact'),
        content: Text(
          'Are you sure you want to delete "$contactName"? This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onDelete(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$contactName is cleared.')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
