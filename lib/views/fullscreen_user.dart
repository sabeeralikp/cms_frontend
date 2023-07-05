import 'package:flutter/material.dart';

import '/views/conference_admin.dart';

class FullScreenUser extends StatefulWidget {
  const FullScreenUser({super.key});

  @override
  _FullScreenUserState createState() => _FullScreenUserState();
}

class _FullScreenUserState extends State<FullScreenUser> {
  String enteredText1 = '';
  String enteredText2 = '';
  String enteredText3 = '';
  TextEditingController papertitle = TextEditingController();
  TextEditingController shortdescription = TextEditingController();
  TextEditingController instructions = TextEditingController();

  // Future<List> senddata() async {
  //   final response = await http.post("THE API GOES HERE" as Uri, body: {
  //     "Title": papertitle.text,
  //     "Description": shortdescription.text,
  //     "Instructions": instructions.text
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Text'),
          actions: [
          new TextButton(
              onPressed: () {
                //TODO: Handle save
              },
              child: new Text('Save',
                      )
                      ),
        ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                TextField(
                  controller: instructions,
                  onChanged: (value) {
                    enteredText3 = value;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Instructions to Notice',
                    border: const OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                  minLines: 5,
                  maxLines: null,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: papertitle,
                  onChanged: (value) {
                    enteredText1 = value;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter title',
                    border: const OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: shortdescription,
                  onChanged: (value) {
                    enteredText2 = value;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter description',
                    border: const OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  // controller: ,
                  onChanged: (value) {
                    enteredText1 = value;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter title',
                    border: const OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ));
  }
}