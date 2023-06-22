import 'package:flutter/material.dart';

import 'conference.dart';

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
        appBar: AppBar(title: const Text('Text')),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Save Button
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),

                    //Cancel Button
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // dataList.add(Words(enteredText1: enteredText1, enteredText2: enteredText2));
                        });
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
