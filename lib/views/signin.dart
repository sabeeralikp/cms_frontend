import 'dart:developer';
import 'package:cms/views/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cms/views/Index.dart';
import 'package:cms/views/signup.dart';

class signInPage extends StatefulWidget {
  final TextEditingController passwordTextController = TextEditingController();

  signInPage({super.key});

  @override
  signInPageState createState() => signInPageState();
}

//Header
class signInPageState extends State<signInPage> {
  String _errorMessage = '';
  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sigin In'),
      ),

      //Body
      body:
          //Head
          Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _signInKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
                onChanged: (val) {
                  validateEmail(val);
                },
              ),
              SizedBox(height: 16.0),

              //Password
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder()),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This Field cannot be Empty';
                  }
                  return null;
                },
                onChanged: (val) {},
              ),
              SizedBox(height: 16.0),

              //Password Validation
              // Padding(
              //   padding: const EdgeInsets.all(15),
              //   child: PasswordFieldValidator(
              //     minLength: 8,
              //     uppercaseCharCount: 1,
              //     lowercaseCharCount: 1,
              //     numericCharCount: 3,
              //     specialCharCount: 1,
              //     defaultColor: Colors.black,
              //     successColor: Colors.green,
              //     failureColor: Colors.red,
              //     controller: widget.passwordTextController,
              //   ),
              // ),

              //Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    print("Sign in Clicked");
                    if (_signInKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IndexPage()),
                      );
                    }
                  },
                  child: const Text('Sign in'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),

              //Forgot Password
              TextButton(
                  onPressed: () {
                    log('Forgot Password');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()));
                  },
                  child: const Text('Forgot Password')),

              //Register
              TextButton(
                  onPressed: () {
                    print("Sign Up clicked");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: const Text('Dont have an account? Sign up')),
            ],
          ),
        ),
      ),
    );
  }

  //Email Validation
  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}