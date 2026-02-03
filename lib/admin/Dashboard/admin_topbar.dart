import 'package:flutter/material.dart';
class AdminTopBar extends StatelessWidget {
  const AdminTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Admin Dashboard',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          CircleAvatar(
            child: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
