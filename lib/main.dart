import 'package:cms/views/Index.dart';
import 'package:cms/views/forgot_password.dart';
import 'package:cms/views/profile.dart';
import 'package:cms/views/signin.dart';
import 'package:cms/views/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conference Management System',
      theme: ThemeData(primarySwatch: Colors.blueGrey, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home:signInPage(),
    );
  }
}
