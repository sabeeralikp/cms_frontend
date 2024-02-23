import 'package:cms/views/review/requstForReview.dart';
import 'package:cms/views/users/Index.dart';
import 'package:cms/views/users/edit.dart';
import 'package:cms/views/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // clear all stored preferences or session data

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) =>
              signInPage()), // navigate back to the login screen
      (Route<dynamic> route) =>
          false, // remove all existing routes from the navigation stack
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 1;

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey, // Customize the text color
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 80,
                      // backgroundImage: AssetImage('lib/assets/images/icons8-user-circle-48.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Name',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Role',
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editScreen()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('edit'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.edit)
                          ],
                        )),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                    Card(
                        elevation: 5,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.verified),
                                title: Text('Review'),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>requsReviewPage()
                                  ));
                                },
                                // subtitle: Text('Subtitle'),
                              ),
                              const ListTile(
                                leading: Icon(Icons.notifications),
                                title: Text('Notification'),
                                subtitle:
                                    Text('Notification Tone, Vibrate,...'),
                              ),
                              const ListTile(
                                leading: Icon(Icons.abc_outlined),
                                title: Text('App Language'),
                                // subtitle: Text('Subtitle'),
                              ),
                            ])),
                    SizedBox(height: 10),
                    Card(
                        elevation: 5,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
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
                            ])),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                        elevation: 5,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.logout),
                                title: Text('Logout'),
                                onTap: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('LogOut'),
                                      content: const Text(
                                          'Do you Really want to logout?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => _logout(),
                                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signInPage())),
                                          child: const Text('Logout'),
                                        ),
                                      ],
                                    ),
                                  );
                                  // Navigator.push(
                                  // context, MaterialPageRoute(
                                  // builder: (context)=>signInPage() ));
                                },
                              ),
                            ])),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )))),

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