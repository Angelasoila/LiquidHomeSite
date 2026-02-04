import 'package:flutter/material.dart';

class DashboardCards extends StatelessWidget {
  const DashboardCards({super.key});

  Widget _card(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _card('Total Installations', '120', Colors.blue),
        _card('Pending', '35', Colors.orange),
        _card('Assigned', '50', Colors.indigo),
        _card('Installed Today', '12', Colors.green),
      ],
    );
  }
}
