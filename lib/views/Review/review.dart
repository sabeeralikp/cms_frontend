import 'package:cms/views/Review/requested.dart';
import 'package:cms/views/users/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

class reviewPage extends StatefulWidget {
  const reviewPage({super.key});

  @override
  State<reviewPage> createState() => _reviewPageState();
}

class _reviewPageState extends State<reviewPage> {
  bool Q1 = false;
  bool Q2 = false;
  bool Q3 = false;
  bool Q4 = false;
  bool Q5 = false;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text('Paper Details'),
            Card(
              child: TextField(
                controller: TextEditingController(text: "Name"),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            Card(
              child: TextField(
                controller: TextEditingController(text: "Paper Details"),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            Card(
              child: ListTile(
                title: Text('Q1'),
                trailing: Switch(
                  thumbIcon: thumbIcon,
                  // This bool value toggles the switch.
                  value: Q1,
                  activeColor: Colors.green,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      Q1 = value;
                    });
                  },
                ),
                subtitle: TextField(
                  decoration: InputDecoration(
                      labelText: 'Remarks', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              child: ListTile(
                title: Text('Q2'),
                trailing: Switch(
                  thumbIcon: thumbIcon,
                  // This bool value toggles the switch.
                  value: Q2,
                  activeColor: Colors.green,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      Q2 = value;
                    });
                  },
                ),
                subtitle: TextField(
                  decoration: InputDecoration(
                      labelText: 'Remarks', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              child: ListTile(
                title: Text('Q3'),
                trailing: Switch(
                  thumbIcon: thumbIcon,
                  // This bool value toggles the switch.
                  value: Q3,
                  activeColor: Colors.green,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      Q3 = value;
                    });
                  },
                ),
                subtitle: TextField(
                  decoration: InputDecoration(
                      labelText: 'Remarks', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              child: ListTile(
                title: Text('Q4'),
                trailing: Switch(
                  thumbIcon: thumbIcon,
                  // This bool value toggles the switch.
                  value: Q4,
                  activeColor: Colors.green,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      Q4 = value;
                    });
                  },
                ),
                subtitle: TextField(
                  decoration: InputDecoration(
                      labelText: 'Remarks', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              child: ListTile(
                title: Text('Q5'),
                trailing: Switch(
                  thumbIcon: thumbIcon,
                  // This bool value toggles the switch.
                  value: Q5,
                  activeColor: Colors.green,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      Q5 = value;
                    });
                  },
                ),
                subtitle: TextField(
                  decoration: InputDecoration(
                      labelText: 'Remarks', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              child: ListTile(
                title: Text('Overall Remarks'),
                subtitle: TextField(
                  decoration: InputDecoration(
                      labelText: 'Remarks', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // SingleChoice(),

            CustomSlidingSegmentedControl<int>(
              initialValue: 2,
              children: {
                1: Text('Accept With\n Minor Changes',
                     textAlign: TextAlign.center,
                    ),
                2: Text('Accept With \nMajor Changes',
                    textAlign: TextAlign.center,
                    ),
                3: Text('Reject',
                    textAlign: TextAlign.center,
                    ),
              },
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              thumbDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  ),
                ],
              ),
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInToLinear,
              onValueChanged: (v) {
                print(v);
              },
            ),SizedBox(height: 10.0,),

            TextButton.icon(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              label: Text('Send'),
              icon: Icon(Icons.send_rounded),
            ),SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}