import 'package:flutter/material.dart';
import '../../controller/conference_controller.dart';
import 'fullscreen_admin.dart';

class Conference_admin extends StatefulWidget {
  const Conference_admin({super.key});

  @override
  _Conference_adminState createState() => _Conference_adminState();
}

class Words {
  String enteredText1 = '';
  String enteredText2 = '';

  Words({required this.enteredText1, required this.enteredText2});
}

class _Conference_adminState extends State<Conference_admin> {
  // List<Words> dataList = [];
  static List<String> dataList = ['Conference1', 'Conference2'];
   final List<ConferenceController> ConferenceData = List.generate(
      dataList.length,
      (index) => ConferenceController(
          dataList[index], '${dataList[index]}Description.....'));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hosted Conferences"),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey.shade300,
            child: ListTile(
              title: Text(
                dataList[index],/*.enteredText1*/
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.delete),
              subtitle: Text(
                dataList[index],/*.enteredText2*/
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FullScreen_admin(), fullscreenDialog: true)),
        child: const Icon(Icons.add),
      ),
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
