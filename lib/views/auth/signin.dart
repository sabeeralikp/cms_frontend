import 'dart:developer';
import 'package:cms/views/auth/widgets/TextFieldWidget.dart';
import 'package:cms/views/auth/widgets/passswordWidget.dart';
import 'package:cms/views/users/forgot_password.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cms/views/users/Index.dart';
import 'package:cms/views/auth/signup.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../api/api_siginin.dart';
// import '../../routes/route.dart';

class signInPage extends StatefulWidget {
  signInPage({super.key});

  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordTextController = TextEditingController();

  // final ApiService _apiService = ApiService();

  // void signIn() async {
  //   final email = emailController.text;
  //   final password = passwordTextController.text;

  //   try {
  //     final response = await _apiService.signIn(email, password);
  //     print(response);
  //     // Process the response here
  //     // e.g., check status code, parse JSON response, etc.
  //   } catch (error) {
  //     // Handle error
  //     print('Error signing in: $error');
  //   }
  // }

  final secureStorage = FlutterSecureStorage();

  @override
  signInPageState createState() => signInPageState();


}

//Header
class signInPageState extends State<signInPage> {
  String _errorMessage = '';
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FocusNode userName = FocusNode();
  FocusNode password = FocusNode();

  // final ApiService _apiService = ApiService();

  // void signIn() async {
  //   final email = userNameController.text;
  //   final password = passwordController.text;

  //   try {
  //     final response = await _apiService.signIn(email, password);
  //     print(response);
  //     // Process the response here
  //     // e.g., check status code, parse JSON response, etc.
  //   } catch (error) {
  //     // Handle error
  //     print('Error signing in: $error');
  //   }

  final Dio _dio = Dio();
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final username = userNameController.text;
    final password = passwordController.text;

    

    try {
      // Make login API request
      final response = await _dio.post(
        'http://192.168.32.118/api/token/',
        data: {'username': username, 'password': password},
        
      );

      final FlutterSecureStorage _secureStorage = FlutterSecureStorage();


      // Store access token securely
      final accessToken = response.data['access_token'];
      await _secureStorage.write(key: 'access_token', value: accessToken);

      // Navigate to the home screen
      Navigator.push(context, MaterialPageRoute(builder: (context)=>IndexPage()));
    } catch (error) {
      // Handle login failure
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid username or password.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //title: const Text('Sigin In'),
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
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey, // Customize the text color
                ),
              ),

              Text('Sign in with your registered email and password'),
              SizedBox(
                height: 50.0,
              ),
              //Email
             TextFieldWidget(
                    labelText: 'User Name',
                    textController: userNameController,
                    FocusNode: userName,
                    nextField: password,
                  ),
                  SizedBox(height: 16.0),

              //Password

              PasswordWidget(
                passwordController: passwordController,
                FocusNode: password,
                nextField: null,
              ),
              // TextFormField(
              //   keyboardType: TextInputType.visiblePassword,
              //   decoration: const InputDecoration(
              //       labelText: 'Password', border: OutlineInputBorder()),
              //   obscureText: true,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'This Field cannot be Empty';
              //     }
              //     return null;
              //   },
              //   onChanged: (val) {},
              // ),
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
                  onPressed: _login,
                  // () {
                  //   // signIn();
                  //   if (_signInKey.currentState!.validate()) {
                  //     // Navigator.of(context).pushNamed(RouteProvider.home);
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => IndexPage()),
                  //     );
                  //     print("Sign in Clicked");
                  //   }
                  // },
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
                    // Navigator.of(context).pushNamed(RouteProvider.forgot);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()));
                  },
                  child: const Text('Forgot Password')),

              //Register
              TextButton(
                  //  _signIn();
                  onPressed: () {
                    print("Sign Up clicked");
                    // Navigator.of(context).pushNamed(RouteProvider.signUp);
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
