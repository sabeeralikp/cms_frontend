import 'package:cms/views/conferences/conferenceSettings.dart';
import 'package:cms/views/conferences/request.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import '../../api/api.dart';
// import '../../models/User.dart';
import 'conference_admin.dart';

class FullScreen_admin extends StatefulWidget {
  @override
  _FullScreen_adminState createState() => _FullScreen_adminState();
}

class _FullScreen_adminState extends State<FullScreen_admin> {

  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController instructions = new TextEditingController();
  TextEditingController shortName = new TextEditingController();
  TextEditingController track = new TextEditingController();
  TextEditingController website = new TextEditingController();



  // Future<List> senddata() async {
  //   final response = await http.post("THE API GOES HERE" as Uri, body: {
  //     "Title": title.text,

  //     "Description": description.text,
  //     "Instructions": instructions.text
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Conference'),
          actions: <Widget>[
            new TextButton(
              onPressed: () {
                // createConference();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => requstPage()));
              },
              child: new Text(
                'Save',
              ),
            ),
            Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ConferenceSettings()));
              },
              child: Icon(Icons.info_outline),
            ),
          )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                TextField(
                  controller: title,
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter title',
                    border: OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: shortName,
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Short Name',
                    border: OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: track,
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Track',
                    border: OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: description,
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: website,
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Conference Website',
                    border: OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: instructions,
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Instructions to Notice',
                    border: OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                  minLines: 5,
                  maxLines: null,
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ));
  }

  //List<dynamic> DataMethod() => List(Words(enteredText1: enteredText1, enteredText2: enteredText2));
}
