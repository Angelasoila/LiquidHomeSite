import 'package:flutter/material.dart';
class AddTechnicianDialog extends StatefulWidget {
  const AddTechnicianDialog({super.key});

  @override
  State<AddTechnicianDialog> createState() => _AddTechnicianDialogState();
}

class _AddTechnicianDialogState extends State<AddTechnicianDialog> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Technician'),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _field('Full Name', nameController),
            const SizedBox(height: 12),
            _field('Email', emailController),
            const SizedBox(height: 12),
            _field('Phone', phoneController),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Firebase create technician
            Navigator.pop(context);
          },
          child: const Text('Add Technician'),
        ),
      ],
    );
  }

  Widget _field(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
