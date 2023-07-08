import 'dart:developer';
import 'package:cms/routes/route.dart';
import 'package:cms/views/auth/signin.dart';
import 'package:cms/views/auth/verification.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:cms/views/auth/signin.dart';
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
  bool passwordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController user_name = TextEditingController();
  final TextEditingController first_name = TextEditingController();
  final TextEditingController last_name = TextEditingController();

  FocusNode UserName = FocusNode();
  FocusNode FirstName = FocusNode();
  FocusNode LastName = FocusNode();
  FocusNode eMail = FocusNode();
  FocusNode password = FocusNode();
  FocusNode cnfrm = FocusNode();

  Response? response;
  final dio = Dio(baseOptions);
  // final ApiSignup _apiService = ApiSignup();

  @override
  void initState() {
    super.initState();
    // _dio = Dio();
  }

  @override
  void dispose() {
    emailController.dispose();
    _passwordController.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  void signUp() async {
    final email = emailController.text;
    final password = _passwordController.text;

    //   try {
    //     final response = await _apiService._registerUser(email, password);
    //     print(response);
    //     // Process the response here
    //     // e.g., check status code, parse JSON response, etc.
    //   } catch (error) {
    //     // Handle error
    //     print('Error signing in: $error');
    //   }
  }

  Future<void> _registerUser() async {
    try {
      response = await dio.post(
        '${baseURL}registration/',
        data: {
          'email': emailController.text,
          'password': _passwordController.text,
          'username': user_name.text,
          'first_name': first_name.text,
          'last_name': last_name.text
        },
      );
      if (response!.statusCode == 200 || response!.statusCode == 201) {
        // Navigator.of(context).pushNamed(RouteProvider.validate);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => verificationPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response!.data),
          duration: const Duration(milliseconds: 1500),
          width: 280.0, // Width of the SnackBar.
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0, // Inner padding for SnackBar content.
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));
        log("User already exists");
      }
      log(response!.statusCode.toString());
    } catch (error) {
      // Handle any errors that occurred during the registration process
      print('Error occurred: $error');
    }
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // print('Signed in successfully');

      // email_Controller.clear();
      // _passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text('Register'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey, // Customize the text color
                    ),
                  ),

                  Text('Please register email and password'),
                  SizedBox(
                    height: 50.0,
                  ),
                  // SizedBox(height: 16.0),

                  // User Name
                  TextFieldWidget(
                    labelText: 'User Name',
                    textController: user_name,
                    FocusNode: UserName,
                    nextField: FirstName,
                  ),
                  SizedBox(height: 16.0),

                  // F.Name
                  TextFieldWidget(
                    labelText: 'First Name',
                    textController: first_name,
                    FocusNode: FirstName,
                    nextField: LastName,
                  ),
                  SizedBox(height: 16.0),

                  // L.Name
                  TextFieldWidget(
                    labelText: 'Last Name',
                    textController: last_name,
                    FocusNode: LastName,
                    nextField: eMail,
                  ),
                  SizedBox(height: 16.0),

                  // Email
                  EmailWidget(
                    emailController: emailController,
                    FocusNode: eMail,
                    nextField: password,
                  ),
                  SizedBox(height: 16.0),

                  // Password
                  PasswordWidget(
                    passwordController: _passwordController,
                    FocusNode: password,
                    nextField: cnfrm,
                  ),
                  SizedBox(height: 16.0),

                  // cnfrm pwd
                  TextFormField(
                    controller: _confirmpassword,
                    focusNode: cnfrm,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      alignLabelWithHint: false,
                      
                      border: OutlineInputBorder(),
                      // errorText: widget.passwordError,
                    ),
                    obscureText: !passwordVisible,
                  ),
                  SizedBox(height: 16.0),
                  // Button
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: ElevatedButton(
                      onPressed: () {
                        validateForm();
                        _registerUser();
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),

                  // Already Registered
                  TextButton(
                    onPressed: () {
                      log('Already registered');
                      // Navigator.of(context).pushNamed(RouteProvider.signUp);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signInPage()),
                      );
                    },
                    child: const Text('Already Registered? Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
