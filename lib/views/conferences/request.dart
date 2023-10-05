import 'package:cms/views/users/Index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class requstPage extends StatefulWidget {
  const requstPage({super.key});

  @override
  _requstPageState createState() => _requstPageState();
}

class _requstPageState extends State<requstPage> {
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Text(
                    'Send Request to become a Host',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SvgPicture.asset(
                    'assets/images/Acceptrequest-bro.svg',
                    semanticsLabel: 'SVG Image',
                    width: 300.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // TextButton(
                  //     onPressed: () {
                  //        _launchThirdPartyApp();
                  //     },
                  //     child: Text("Send request via Email")),
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
                                    builder: (context) => IndexPage()));
                          },
                          child: Text("click here to bo back to home")),
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