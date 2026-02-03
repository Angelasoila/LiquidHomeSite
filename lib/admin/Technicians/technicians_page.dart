import 'package:flutter/material.dart';
import '../Dashboard/admin_sidebar.dart';
import '../Dashboard/admin_topbar.dart';
import 'datamodel.dart';

class TechniciansPage extends StatelessWidget {
  const TechniciansPage({super.key});

  @override
  Widget build(BuildContext context) {
    final technicians = [
      Technician(
        name: 'Peter Mwangi',
        email: 'peter@liquid.com',
        phone: '+254700111222',
        active: true,
        assignedJobs: 5,
      ),
      Technician(
        name: 'Lucy Wambui',
        email: 'lucy@liquid.com',
        phone: '+254700333444',
        active: false,
        assignedJobs: 0,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Row(
        children: [
          const AdminSidebar(),
          Expanded(
            child: Column(
              children: [
                const AdminTopBar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _header(context),
                        const SizedBox(height: 16),
                        _techniciansTable(context, technicians),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Technicians',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            showAddTechnicianDialog(context);
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Technician'),
        ),
      ],
    );
  }

  Widget _techniciansTable(
      BuildContext context, List<Technician> technicians) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Phone')),
            DataColumn(label: Text('Assigned Jobs')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Actions')),
          ],
          rows: technicians.map((tech) {
            return DataRow(cells: [
              DataCell(Text(tech.name)),
              DataCell(Text(tech.email)),
              DataCell(Text(tech.phone)),
              DataCell(Text(tech.assignedJobs.toString())),
              DataCell(_statusChip(tech.active)),
              DataCell(
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('View'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Enable / Disable
                      },
                      child: Text(
                        tech.active ? 'Disable' : 'Enable',
                        style: TextStyle(
                          color: tech.active
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }

  Widget _statusChip(bool active) {
    return Chip(
      label: Text(active ? 'Active' : 'Disabled'),
      backgroundColor:
          active ? Colors.green.withOpacity(0.15) : Colors.red.withOpacity(0.15),
      labelStyle: TextStyle(
        color: active ? Colors.green : Colors.red,
      ),
    );
  }
}
