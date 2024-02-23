// import 'package:cms/models/User.dart';
// import 'package:dio/dio.dart';
// import 'package:cms/views/conferences/conferenceSettings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import '../../controller/conference_controller.dart';
import 'fullscreen_admin.dart';
// import 'package:cms/api/api_conference.dart';

class Conference_admin extends StatefulWidget {
  const Conference_admin({super.key});

  @override
  _Conference_adminState createState() => _Conference_adminState();
}

// class Words {
//   String enteredText1 = '';
//   String enteredText2 = '';

//   Words({required this.enteredText1, required this.enteredText2});
// }

class _Conference_adminState extends State<Conference_admin> {
  // List<Words> dataList = [];
  // static List<String> dataList = ['Conference1', 'Conference2'];
  // final List<ConferenceController> ConferenceData = List.generate(
  //     dataList.length,
  //     (index) => ConferenceController(
  //         dataList[index], '${dataList[index]}Description.....'));

  var jsonList;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio()
          .get('https://protocoderspoint.com/jsondata/superheros.json');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data["superheros"] as List;
        });
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hosted Conferences"),
        actions: <Widget>[
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) =>  ConferenceSettings()));
          //     },
          //     child: Icon(Icons.info_outline),
          //   ),
          // )
        ],
      ),
      body: ListView.builder(
        itemCount: jsonList == null ? 0 : jsonList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.grey.shade300,
            child: ListTile(
              title: Text(
                jsonList[index]['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.delete),
              subtitle: Text(
                jsonList[index]['power'],
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
