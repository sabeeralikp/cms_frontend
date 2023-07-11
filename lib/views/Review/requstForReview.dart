import 'package:cms/views/Review/requstReview.dart';
import 'package:cms/views/users/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class requsReviewPage extends StatefulWidget {
  const requsReviewPage({super.key});

  @override
  _requsReviewPageState createState() => _requsReviewPageState();
}

class _requsReviewPageState extends State<requsReviewPage> {
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
                      'Send Request to become a Reviewer',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                    SvgPicture.asset(
                      'assets/images/review.svg',
                      semanticsLabel: 'SVG Image',
                      width: 400,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => requsReviewerPage()));
                        },
                        child: Text("Request to be a reviewer")),
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
                                  builder: (context) => ProfilePage()));
                        },
                        child: Text("click here to bo back to Profile")),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
// void _launchThirdPartyApp() async {
//   final Uri url = Uri.parse('https://mail.google.com/mail/u/0/#inbox');

//   if (!await launchUrl(url)) {
//     throw Exception('Could not launch $url');
//   }
// }