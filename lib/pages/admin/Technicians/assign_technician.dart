import 'package:flutter/material.dart';
class AssignTechnicianDialog extends StatefulWidget {
  const AssignTechnicianDialog({super.key});

  @override
  State<AssignTechnicianDialog> createState() =>
      _AssignTechnicianDialogState();
}

class _AssignTechnicianDialogState extends State<AssignTechnicianDialog> {
  String? selectedTechnician;
  DateTime? selectedDate;
  final TextEditingController notesController = TextEditingController();

  final List<String> technicians = [
    'Peter Mwangi',
    'James Otieno',
    'Lucy Wambui',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Assign Installation',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      content: SizedBox(
        width: 450,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _readOnlyField('Customer', 'Angela Soila'),
              const SizedBox(height: 12),
              _readOnlyField('Location', 'Kilimani'),
              const SizedBox(height: 20),

              // Technician Dropdown
              const Text('Assign Technician'),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                initialValue: selectedTechnician,
                hint: const Text('Select technician'),
                items: technicians
                    .map(
                      (tech) => DropdownMenuItem(
                        value: tech,
                        child: Text(tech),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedTechnician = value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // Schedule Date
              const Text('Scheduled Date'),
              const SizedBox(height: 6),
              InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 30),
                    ),
                  );
                  if (date != null) {
                    setState(() => selectedDate = date);
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  child: Text(
                    selectedDate == null
                        ? 'Select date'
                        : selectedDate!.toLocal().toString().split(' ')[0],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Notes
              const Text('Notes (optional)'),
              const SizedBox(height: 6),
              TextField(
                controller: notesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Special instructions...',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: selectedTechnician == null || selectedDate == null
              ? null
              : () {
                  // TODO: Firebase assignment logic
                  Navigator.pop(context);
                },
          child: const Text('Assign Installation'),
        ),
      ],
    );
  }

  Widget _readOnlyField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        InputDecorator(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          child: Text(value),
        ),
      ],
    );
  }
}
