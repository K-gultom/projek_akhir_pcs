import 'package:flutter/material.dart';

class Bottom_navbar extends StatelessWidget {
  const Bottom_navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'Riwayat Order',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.logout),
      label: 'Logout',
    ),
  ],
  onTap: (int index) {
    // Handle navigation based on index
    if (index == 0) {
      // Navigate to Home screen
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      // Navigate to Riwayat Order screen
      Navigator.pushNamed(context, '/riwayat_order');
    } else if (index == 2) {
      // Perform logout
      Navigator.pushReplacementNamed(context, '/login');
      // Or you can use Navigator.pushNamedAndRemoveUntil to remove all the routes and navigate to login screen
      // Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  },
),
    );

  }
}