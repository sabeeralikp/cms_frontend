import 'package:cms/views/Index.dart';
import 'package:cms/views/auth/signin.dart';
import 'package:cms/views/auth/signup.dart';
import 'package:cms/views/verification.dart';
import 'package:flutter/material.dart';

class RouteProvider {
  static const String home = "";
  static const String validate = "/validate";
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const IndexPage());

      case validate:
        return MaterialPageRoute(builder: (context) => verificationPage());

      case signIn:
        return MaterialPageRoute(builder: (context) => signInPage());

      case signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());

      default:
        return MaterialPageRoute(builder: (context) => const IndexPage());
    }
  }
}
