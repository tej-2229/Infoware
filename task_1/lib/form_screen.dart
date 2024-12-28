import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('User Form'), centerTitle: true, backgroundColor: const Color(0xFFB3E5FC)),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFFE1F5FE), Color(0xFFE1F5FE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) => value == null || value.isEmpty ? 'Name is required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) =>
                        value == null || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value) ? 'Enter a valid email' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Phone'),
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        value == null || value.length != 10 ? 'Enter a valid 10-digit phone number' : null,
                  ),
                  DropdownButtonFormField(
                    items: ['Male', 'Female', 'Other']
                        .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
                        .toList(),
                    decoration: const InputDecoration(labelText: 'Gender'),
                    onChanged: (value) {},
                    validator: (value) => value == null ? 'Select a gender' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Country'),
                    validator: (value) => value == null || value.isEmpty ? 'Country is required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'State'),
                    validator: (value) => value == null || value.isEmpty ? 'State is required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'City'),
                    validator: (value) => value == null || value.isEmpty ? 'City is required' : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form submitted successfully!')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
