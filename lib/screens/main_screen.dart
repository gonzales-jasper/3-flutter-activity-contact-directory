import 'package:flutter/material.dart';

import 'package:student_contact_directory/screens/information.dart';
import 'package:student_contact_directory/screens/contact_list.dart';
import 'package:student_contact_directory/screens/add_contact.dart';
import '../shared/styled_text.dart';
import '../theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Map<String, String>> contacts = [];

  void addContact(Map<String, String> contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contact deleted successfully.')),
    );
  }

  void _onNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      AddContact(onAdd: addContact),
      ContactList(contacts: contacts, onDelete: deleteContact),
      const Information(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Student Profile App"),
        centerTitle: true,
      ),
      drawer: _buildDrawer(),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        //highlight which page is selected
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onNavTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Add Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contact List',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Information'),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Single unified header
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primaryColor),
            accountName: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Student Contact Directory',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Developed by: Jasper N. Gonzales',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(height: 5),
              ],
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/id.png'),
            ),
            accountEmail: null,
          ),

          // Navigation Items
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Add Contact'),
            selected: selectedIndex == 0,
            onTap: () {
              Navigator.pop(context);
              setState(() => selectedIndex = 0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('View Contacts'),
            selected: selectedIndex == 1,
            onTap: () {
              Navigator.pop(context);
              setState(() => selectedIndex = 1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            selected: selectedIndex == 2,
            onTap: () {
              Navigator.pop(context);
              setState(() => selectedIndex = 2);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.redAccent),
            title: const Text('Clear All Contacts'),
            onTap: () {
              Navigator.pop(context);
              _showClearAllDialog();
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              _showLogoutDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showClearAllDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Contacts'),
        content: const Text(
          'Are you sure you want to delete all contacts? This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                contacts.clear();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All contacts cleared.')),
              );
            },
            child: const Text('Clear All', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close the dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully')),
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
