import 'dart:developer';
import 'package:cms/views/Index.dart';
import 'package:cms/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:cms/views/signin.dart';

class editScreen extends StatefulWidget {
  @override
  _editScreenState createState() => _editScreenState();
}

class _editScreenState extends State<editScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  late String? _passwordError = null;

  late String _password;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Password: $_password');

      _passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              //User Name
              TextField(
                decoration: InputDecoration(
                    labelText: 'User Name', border: OutlineInputBorder()),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16.0),

              //F.Name
              TextField(
                decoration: InputDecoration(
                    labelText: 'First Name', border: OutlineInputBorder()),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16.0),

              //L.Name
              TextField(
                decoration: InputDecoration(
                    labelText: 'Last Name', border: OutlineInputBorder()),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16.0),

              //Password
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  errorText: _passwordError,
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                    return 'Password must contain at least one special character';
                  }
                  if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  if (!value.contains(RegExp(r'[a-z]'))) {
                    return 'Password must contain at least one lowercase letter';
                  }
                  if (!value.contains(RegExp(r'[0-9]'))) {
                    return 'Password must contain at least one digit';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
                onChanged: (value) {
                  setState(() {

              // Set the validation status
                  });
                },
              ),
              SizedBox(height: 16.0),

              //cnfrm pwd
              TextFormField(
                // controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  errorText: _passwordError,
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),

              //Button
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ElevatedButton(
                  onPressed: () {
                    log('Saved');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }
}