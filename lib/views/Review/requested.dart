import 'package:cms/views/users/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class requestedPage extends StatefulWidget {
  const requestedPage({Key? key}) : super(key: key);

  @override
  _requestedPageState createState() => _requestedPageState();
}

class _requestedPageState extends State<requestedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Text(
                  'Requested Successfully',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'An Email verification will be sent to your email after reviewing your request.',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      maxLines: null,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/Files_sent.svg',
                  semanticsLabel: 'SVG Image',
                  width: 400,
                ),
                SizedBox(height: 10.0),
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      child: Text('Click here to go back to Profile'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
