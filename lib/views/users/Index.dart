import 'package:cms/views/conferences/conference_admin.dart';
import 'package:cms/views/conferences/conference_user.dart';
// import 'package:cms/views/conferences/fullscreen_user.dart';
import 'package:cms/views/conferences/myConference.dart';
// import 'package:cms/views/conferences/request.dart';
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

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
        automaticallyImplyLeading: false,
        
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text:'New Conference',
              ),
              Tab(
                text:'My Conferences',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Conference_User(),
            myConference()
          ],
        ),


        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(

        onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Conference_admin(),)),
        label: Text('Hosted Conferences'),
        icon: Icon(Icons.add),
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => IndexPage()));
                    break;

                  case 1:
                    Navigator.pushReplacement(context,
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
      ),
    );
  }
}