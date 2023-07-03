import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String labelText;
  final _textController = TextEditingController();
  TextFieldWidget(
      {
        super.key, 
        required this.labelText, 
        
        });

  @override
  State<TextFieldWidget> createState() => _TextfieldWidgetState();

  
}

class _TextfieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._textController,
      decoration: InputDecoration(
          // labelText: "Name",
          labelText: widget.labelText,
          border: OutlineInputBorder()),
      keyboardType: TextInputType.name,
    );
  }
}
