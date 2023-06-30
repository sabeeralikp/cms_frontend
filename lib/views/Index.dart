import 'package:flutter/material.dart';
import 'profile.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Container(
        color: Colors.blueGrey,
        alignment: Alignment.center,
        child: const Text(
          'Home',
          style: TextStyle(fontSize: 40),
        ),
      ),
      Container(
        color: Colors.orangeAccent,
        alignment: Alignment.center,
        child: const Text(
          'Profile',
          style: TextStyle(fontSize: 40),
        ),
      ),
    ];

    int selectedIndex = 0;

    return Scaffold(
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
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                      break;

                  default:
                }
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
                 ],
            )
          : null,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.account_circle_outlined), label: Text('Profile')),
             ], selectedIndex: selectedIndex),
          Expanded(
            child: screens[selectedIndex],
          ),
        ],
      ),
    );
  }
}
