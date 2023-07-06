import 'package:cms/views/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class verificationPage extends StatefulWidget {
  const verificationPage({super.key});

  @override
  State<verificationPage> createState() => _verificationPageState();
}

class _verificationPageState extends State<verificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Verify your account in your inbox',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SvgPicture.asset(
                    'assets/images/Emails-bro.svg',
                    semanticsLabel: 'SVG Image',
                    width: 400,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                      onPressed: () {
                        _launchThirdPartyApp();
                      },
                      child: Text("Please verify your account in you Inbox")),
                ],
              )
            ],
          ),
          Positioned(
                left: 0,
                bottom: 10,
                right: 0,
                child: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signInPage()));
                          },
                          child: Text("Verified? SignIn")),
                    ],
                  ),
                ),
              ),

        ],
      )
    );
  }
}

void _launchThirdPartyApp() async {
  final Uri url = Uri.parse('https://mail.google.com/mail/u/0/#inbox');

  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
