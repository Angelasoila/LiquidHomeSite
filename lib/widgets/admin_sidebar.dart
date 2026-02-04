import 'package:flutter/material.dart';

class AdminSidebar extends StatelessWidget {
  const AdminSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Liquid Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _navItem(Icons.dashboard, 'Dashboard'),
          _navItem(Icons.wifi, 'Installations'),
          _navItem(Icons.people, 'Technicians'),
          _navItem(Icons.bar_chart, 'Reports'),
          const Spacer(),
          _navItem(Icons.logout, 'Logout'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(color: Colors.white70)),
      onTap: () {},
    );
  }
}
