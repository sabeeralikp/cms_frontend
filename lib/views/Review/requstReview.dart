import 'package:cms/views/review/requested.dart';
// import 'package:cms/views/users/profile.dart';
import 'package:flutter/material.dart';

class requsReviewerPage extends StatefulWidget {
  const requsReviewerPage({super.key});

  @override
  State<requsReviewerPage> createState() => _requsReviewerPageState();
}

class _requsReviewerPageState extends State<requsReviewerPage> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FocusNode userName = FocusNode();
  FocusNode password = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Apply to be a Reviewer',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey, // Customize the text color
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: TextEditingController(text: "User Name"),
                  decoration: InputDecoration(
                      border: InputBorder.none),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: TextEditingController(text: "Name"),
                  decoration: InputDecoration(
                      border: InputBorder.none),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: TextEditingController(text: "Email"),
                  decoration: InputDecoration(
                     border: InputBorder.none),
                ),
                SizedBox(
                  height: 10.0,
                ),
                // TextFormField(
                //   controller: TextEditingController(text: "User Name"),
                //   decoration: InputDecoration(
                //       border: InputBorder.none),
                // ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Designation",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Institution",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Reserch Area",
                    border: OutlineInputBorder(),
                  ),
                ),SizedBox(height: 20.0,),

                TextButton.icon(
                  
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => requestedPage()));
                    },
                    label: Text('Send'),
                    icon: Icon(Icons.send_rounded),
                    )
              ],
            ),
          )),
        ));
  }
}
