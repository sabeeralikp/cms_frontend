import 'dart:developer';
import 'package:cms/views/Index.dart';
import 'package:flutter/material.dart';
import 'package:cms/views/signin.dart';

void main() {
  runApp(signup());
}

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late String? _passwordError = null;

  late String? _emailError = null;

  late String _email;
  late String _password;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Email: $_email');
      print('Password: $_password');

      print('Signed in successfully');

      _emailController.clear();
      _passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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

              //Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: _emailError,
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _emailError = _validateEmail(value);
// Set the validation status
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (_isValidEmail(value) != null) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
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
                  labelText: 'Password',
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
                    log('Sign Up clicked');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IndexPage()),
                    );
                  },
                  child: const Text('Sign in'),
                ),
              ),

              //Already Registered
              TextButton(
                  onPressed: () {
                    log('login');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signInPage()),
                    );
                  },
                  child: const Text('Already Registered? Sign In')),
            ],
          ),
        ),
      ),
    );
  }

  //Email Validation
  String? _isValidEmail(String value) {
    // Use a regular expression pattern to validate email addresses
    final pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }
}
