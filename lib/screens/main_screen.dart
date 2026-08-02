import 'package:flutter/material.dart';
import 'package:student_contact_directory/screens/about_me.dart';
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
  List <Map<String,String>> contacts = [];

  void addContact(Map<String,String> contact){
    setState(() {
      contacts.add(contact);
    });
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
      const ContactList(),
      const Information(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Student Profile App"),
        centerTitle: true,
      ),
      drawer: _buildDrawer(context),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        //highlight which page is selected
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onNavTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person_add), label: 'Add Contact'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Contact List'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          StyledTitle("Student Contact Directory"),
          const UserAccountsDrawerHeader(
            accountName: Text('Jasper N. Gonzales'),
            accountEmail: Text('pro.japegonzales@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/id.png'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('About the Student'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutMe()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
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
