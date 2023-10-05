import 'package:flutter/material.dart';
import '/controller/conference_controller.dart';
import 'fullscreen_user.dart';

class myConference extends StatefulWidget {
  const myConference({super.key});

  @override
  _myConferenceState createState() => _myConferenceState();
}

class _myConferenceState extends State<myConference> {
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
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey.shade300,
            child: ListTile(
              title: Text(
                dataList[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
