import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cms/views/auth/signin.dart';
import 'package:cms/views/auth/widgets/TextFieldWidget.dart';
import 'package:cms/views/auth/widgets/EmailWidget.dart';
import 'package:cms/api/api.dart';
import 'package:cms/views/auth/widgets/passswordWidget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email_Controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  late Dio _dio;

  // final String? _passwordError = null;
  // final String? _confirmpasswordError = null;
  // final String? _emailError = null;

  @override
  void initState() {
    super.initState();
    // _dio = Dio();
  }

  @override
  void dispose() {
    email_Controller.dispose();
    _passwordController.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    final String email = email_Controller.text;
    final String password = _passwordController.text;

    try {
      final response = await _dio.post(
        baseURL,
        data: {'email': email, 'password': password},
      );

      // Process the response here (e.g., handle success or error messages)
      print(response.data);
    } catch (error) {
      // Handle any errors that occurred during the registration process
      print('Error occurred: $error');
    }
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // print('Email: $_email');
      // print('Password: $_password');

      print('Signed in successfully');

      email_Controller.clear();
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
              TextFieldWidget(
                labelText: 'User Name',
              ),
              SizedBox(height: 16.0),

              //F.Name
              TextFieldWidget(
                labelText: 'First Name',
              ),
              SizedBox(height: 16.0),

              //L.Name
              TextFieldWidget(
                labelText: 'Last Name',
              ),
              SizedBox(height: 16.0),

              //Email
              EmailWidget(
                emailController: email_Controller,
              ),
              SizedBox(height: 16.0),

              //Password
              PasswordWidget(
                passwordController: _passwordController,
              ),
              SizedBox(height: 16.0),

              //cnfrm pwd
              TextFormField(
                controller: _confirmpassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  // errorText: _confirmpasswordError,
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please re-enter password';
                  }
                  print(_confirmpassword.text);
                  if (_passwordController.text != _confirmpassword.text) {
                    return "Password does not match";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _confirmpassword == false;
                    // _confirmpasswordError = passwordValidator(value);
                    if (_passwordController.text == _confirmpassword.text) {
                      _confirmpassword == true;
                    }
                  });
                },
              ),
              SizedBox(height: 16.0),

              //Button
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ElevatedButton(
                  onPressed: () {
                    // _registerUser();
                    log('Sign Up clicked');
                    validateForm();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => signInPage()),
                    // );
                  },
                  child: const Text('Sign Up'),
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
}
