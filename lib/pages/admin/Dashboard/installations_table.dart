import 'package:flutter/material.dart';

class InstallationsTable extends StatelessWidget {
  const InstallationsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 24),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Installations',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            DataTable(
              columns: const [
                DataColumn(label: Text('Customer Name')),
                DataColumn(label: Text('Location')),
                DataColumn(label: Text('Package')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Technician')),
                DataColumn(label: Text('Actions')),
              ],
              rows: List.generate(5, (index) {
                return DataRow(
                  cells: [
                    const DataCell(Text('Angela Soila')),
                    const DataCell(Text('Kilimani')),
                    const DataCell(Text('20Mbps')),
                    DataCell(_statusChip('Pending')),
                    const DataCell(Text('-')),
                    DataCell(
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Assign'),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusChip(String status) {
    Color color;
    switch (status) {
      case 'Installed':
        color = Colors.green;
        break;
      case 'Assigned':
        color = Colors.blue;
        break;
      default:
        color = Colors.orange;
    }

    return Chip(
      label: Text(status),
      backgroundColor: color.withOpacity(0.15),
      labelStyle: TextStyle(color: color),
    );
  }
}
