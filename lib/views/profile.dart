import 'package:cms/views/Index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const profile());
}

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(title: '',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}

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
        title: Text('Profile Page'),
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
          Text(
            'edit',
            style: TextStyle(fontSize: 15, color: Colors.blue.shade900, decoration: TextDecoration.underline ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),

          Card(
            elevation: 5,
            child: 
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    subtitle: Text('Subtitle'),
                  ),

                ]
              )
            ),
            SizedBox(height: 10),
            
            
            Card(
            elevation: 5,
            child: 
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  const ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete this Account'),
                  ),
                
                  const ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                  ),

                ]
              )
            )

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
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => IndexPage()));
                      break;

                    case 1:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
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
        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     if (MediaQuery.of(context).size.width >= 640)
        //       NavigationRail(destinations: const [
        //         NavigationRailDestination(
        //             icon: Icon(Icons.home), label: Text('Home')),
        //         NavigationRailDestination(
        //             icon: Icon(Icons.home), label: Text('Profile')),
        //       ], selectedIndex: selectedIndex),
        //     Expanded(
        //       child: screens[selectedIndex],
        //     ),
        //   ],
        // ),
      );
    }
  }
