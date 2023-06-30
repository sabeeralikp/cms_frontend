import 'package:flutter/material.dart';
import '/controller/conference_controller.dart';
import 'fullscreen_user.dart';

class Conference_User extends StatefulWidget {
  const Conference_User({super.key});

  @override
  _ConferenceUserState createState() => _ConferenceUserState();
}

class _ConferenceUserState extends State<Conference_User> {
  static List<String> dataList = ['Conference1', 'Conference2'];

  final List<ConferenceController> ConferenceData = List.generate(
      dataList.length,
      (index) => ConferenceController(
          dataList[index], '${dataList[index]}Description.....'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conference"),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey,
            child: ListTile(
              title: Text(
                dataList[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // trailing: Icon(Icons.delete),
              subtitle: Text(
                dataList[index],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FullScreenUser(),
                    fullscreenDialog: true));
              },
            ),
          );
        },
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _showDialog,
      //   child: Icon(Icons.add),
      // ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // shape: RoundedRectangleBorder(

            //   borderRadius: BorderRadius.all(radius),
            //   ),
            title: const Text('New Note'),
            actions: [
              TextField(
                onChanged: (value) {
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Enter title',
                  enabledBorder: myInputBoder(),
                  focusedBorder: myFocusBoder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  // enteredText2 = value;
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Enter description',
                  enabledBorder: myInputBoder(),
                  focusedBorder: myFocusBoder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  // enteredText3 = value;
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Instructions to Notice',
                  enabledBorder: myInputBoder(),
                  focusedBorder: myFocusBoder(),
                ),
                minLines: 5,
                maxLines: null,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Save Button
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),

                  //Cancel Button
                  TextButton(
                    onPressed: () {
                      setState(() {
                        // dataList.add(Words(
                        //     enteredText1: enteredText1,
                        //     enteredText2: enteredText2));
                      });
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}

OutlineInputBorder myInputBoder() {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.elliptical(10, 5)),
    borderSide: BorderSide(
      color: Colors.grey.shade300,
      width: 3,
    ),
  );
}

OutlineInputBorder myFocusBoder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2,
    ),
  );
}
