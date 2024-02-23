import 'package:flutter/material.dart';

class ConferenceSettings extends StatefulWidget {
  const ConferenceSettings({Key? key}) : super(key: key);

  @override
  _ConferenceSettingsState createState() => _ConferenceSettingsState();
}

class _ConferenceSettingsState extends State<ConferenceSettings> {
  bool allowAuthorsToSubmit = false;
  bool notifyAuthors = false;
  // bool _isEditingText = false;
  TextEditingController? _editingController;
  String initialText = "Initial Text";

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text('Allow authors to submit'),
                  trailing: Switch(
                  // This bool value toggles the switch.
                  value: allowAuthorsToSubmit,
                  activeColor: Colors.green[900],
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      allowAuthorsToSubmit = value;
                    });
                  },
                ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Notify Authors'),
                  trailing: Switch(
                  // This bool value toggles the switch.
                  value: notifyAuthors,
                  activeColor: Colors.green[900],
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      notifyAuthors = value;
                    });
                  },
                ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Contact Email'),
                  subtitle: TextField(
                    controller: TextEditingController(text: "example@abc.com"),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
