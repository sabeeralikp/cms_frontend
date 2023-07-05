import 'package:cms/views/conference_user.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('NewsLetter'),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Conference_User()),
                    );
                  },
                  child: const Text('Conferences'))
            ],
          )
        ],
      ),

      //Bottom Navigation
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              currentIndex: selectedIndex,
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.red,
              onTap: (int index) {
                setState(() {
                  selectedIndex = index;
                });

                switch (index) {
                  case 0:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IndexPage()));
                    break;

                  case 1:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                    break;

                  default:
                }
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: 'Profile'),
              ],
            )
          : null,
    );
  }
}