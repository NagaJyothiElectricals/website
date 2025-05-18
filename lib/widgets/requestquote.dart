// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestQuoteForm extends StatefulWidget {
  const RequestQuoteForm({super.key});

  @override
  State<RequestQuoteForm> createState() => _RequestQuoteFormState();
}

class _RequestQuoteFormState extends State<RequestQuoteForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _detailsController = TextEditingController();

  String _projectType = 'Industrial Electrical Installation';
  DateTime? _startDate;

  final List<String> _projectTypes = [
    'Industrial Electrical Installation',
    'Pharma Plant Setup',
    'HT/LT Panel Installation',
    'Lighting & Cabling Work',
    'Maintenance Services',
    'Others',
  ];

  Future<void> _selectStartDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final subject = Uri.encodeComponent('Quote Request - $_projectType');
      final body = Uri.encodeComponent('''
Full Name: ${_nameController.text}\n
Company Name: ${_companyController.text}\n
Email: ${_emailController.text}\n
Phone: ${_phoneController.text}\n
Location: ${_locationController.text}\n
Project Type: $_projectType\n
Start Date: ${_startDate != null ? _startDate!.toLocal().toString().split(' ')[0] : 'Not specified'}\n
Additional Info:
${_detailsController.text}
''');

      final emailUrl =
          'mailto:info@nagajyothielectricals.com?subject=$subject&body=$body';

      if (await canLaunchUrl(Uri.parse(emailUrl))) {
        await launchUrl(Uri.parse(emailUrl));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch email client')),
        );
      }

      Navigator.of(context).pop(); // Close dialog after sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Request a Quote",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'Please enter your name'
                          : null,
            ),
            TextFormField(
              controller: _companyController,
              decoration: const InputDecoration(labelText: 'Company Name'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email Address'),
              validator:
                  (value) =>
                      value != null && value.contains('@')
                          ? null
                          : 'Enter a valid email',
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              validator:
                  (value) =>
                      value != null && value.length >= 10
                          ? null
                          : 'Enter a valid phone number',
            ),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location of Work'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _projectType.trim(),
              decoration: const InputDecoration(labelText: 'Project Type'),
              items:
                  _projectTypes.map((type) {
                    return DropdownMenuItem(value: type, child: Text(type));
                  }).toList(),
              onChanged: (val) {
                setState(() {
                  _projectType = val!;
                });
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _startDate == null
                        ? 'No Start Date Selected'
                        : 'Start Date: ${_startDate!.toLocal().toString().split(' ')[0]}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectStartDate(context),
                  child: const Text('Select Start Date'),
                ),
              ],
            ),
            TextFormField(
              controller: _detailsController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Additional Information',
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit Request'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
