import 'package:file_picker/file_picker.dart';
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

  PlatformFile? file;
  Future<void> picksinglefile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = result.files.first;
      file == null ? false : OpenAppFile.open(file!.path.toString());
    }
  }

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
                child: new Text(
                  'Save',
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                Text('Instructions to Notice',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
                Text(
                    "Tutorials subsmissions track. We are excited to invite submissions for the Tutorials track at the NeurIPS 2021 climate change workshop. Tutorials will be presented in the form of executable notebooks (e.g. Jupyter, Colab), and should demonstrate a step-by-step code walkthrough of how ML methods or tools (such as libraries, packages, services, datasets, or frameworks) can be used to address climate change. Submissions will be reviewed based on their potential impact and overall usability by the climate change and AI research communities. More information: https://www.climatechange.ai/events/neurips2022"),
                // TextField(
                //   controller: instructions,
                //   onChanged: (value) {
                //     enteredText3 = value;
                //   },
                //   keyboardType: TextInputType.name,
                //   decoration: InputDecoration(
                //     labelText: 'Instructions to Notice',
                //     border: const OutlineInputBorder(),
                //     focusedBorder: myFocusBoder(),
                //   ),
                //   minLines: 5,
                //   maxLines: null,
                // ),
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

                Container(
                 width: 1000,
                child: ElevatedButton.icon(
                  onPressed: picksinglefile, 
                  icon: const Icon(Icons.insert_drive_file_outlined),
                  label: Text('Pick File'),
                  
                  ),)
              ],
            ),
          ),
        ));
  }
}

class OpenAppFile {
  void openAppWithSelectedFile(String filePath) {
    // Use the filePath to open the app or perform any desired operations.
    print('Opening app with selected file: $filePath');
    // Add your custom code here to open the app using the selected file.
  }
  
  static open(String string) {}
}
