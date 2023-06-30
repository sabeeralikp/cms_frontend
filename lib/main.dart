import 'package:flutter/material.dart';
import 'conference_user.dart';

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
      home: Conference_User(),
    );
  }
}
