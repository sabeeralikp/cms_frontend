import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'conference.dart';

class FullScreen extends StatefulWidget {
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  String enteredText1 = '';
  String enteredText2 = '';
  String enteredText3 = '';
  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController instructions = new TextEditingController();

  // Future<List> senddata() async {
  //   final response = await http.post("THE API GOES HERE" as Uri, body: {
  //     "Title": title.text,
      
  //     "Description": description.text,
  //     "Instructions": instructions.text
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('New Conference')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                TextField(
                  controller: title,
                  onChanged: (value) {
                    enteredText1 = value;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter title',
                    border: OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: description,
                  onChanged: (value) {
                    enteredText2 = value;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter description',
                    border: OutlineInputBorder(),
                    focusedBorder: myFocusBoder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: instructions,
                  onChanged: (value) {
                    enteredText3 = value;
                  },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //Save Button
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),

                    //Cancel Button
                    TextButton(
                      onPressed: () {
                        setState(() {
                         // DataMethod();
                        });
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  //List<dynamic> DataMethod() => List(Words(enteredText1: enteredText1, enteredText2: enteredText2));
}
