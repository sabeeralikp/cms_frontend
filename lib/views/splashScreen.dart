import 'package:cms/views/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay before navigating to the next screen
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the desired screen using Navigator
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => signInPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
     // Set the color and orientation of the system status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade600,
      body: Stack(
        children: [
          Container(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageFiles(iconurl: 'assets/images/bgremoved_logo.png'),
                  Text(
                    'C M S',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Customize the text color
                    ),
                  )
                ],
              )
            ],
            ),
          ),
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                        'Powered and maintained by',
                        style: TextStyle(fontSize: 12, color: Colors.grey[350]),
                      ),
                      Image.asset('assets/images/icfooss_logo1.png',
                      height: 30,
                      )
                      ]
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ImageFiles extends StatelessWidget {
  final String iconurl;
  const ImageFiles({super.key, required this.iconurl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconurl,
          width: 200,
          height: 100,
        ),
      ],
    );
  }
}
