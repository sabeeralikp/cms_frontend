// import 'package:cms/views/auth/signin.dart';
import 'package:cms/views/verification.dart';
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
      // home:signInPage(),
      home: verificationPage(),
    );
  }
}
