import 'package:cms/views/Index.dart';
import 'package:cms/views/edit.dart';
import 'package:cms/views/auth/signin.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 80,
            // backgroundImage: AssetImage('lib/assets/images/icons8-user-circle-48.png'),
          ),
          SizedBox(height: 20),
          Text(
            'Name',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Role',
            style: TextStyle(fontSize: 22, color: Colors.grey),
          ),
          SizedBox(height: 20),

          TextButton(
            onPressed:(){
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context)=> editScreen()));
          } , child: 
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('edit'),
                    SizedBox(width: 5,),
                    Icon(Icons.edit)
                  ],
                )
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Card(
              elevation: 5,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  subtitle: Text('Subtitle'),
                ),
              ])),
          SizedBox(height: 10),
          Card(
              elevation: 5,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.info_rounded),
                  title: Text('About Us'),
                ),
                const ListTile(
                  leading: Icon(Icons.contact_mail_rounded),
                  title: Text('Contact Us'),
                ),
                const ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete this Account'),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap:() {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context)=>signInPage() ));
                  }, 
                ),
              ]))
        ],
      ),

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
