import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  TextFieldWidget({
    super.key,
    required this.labelText
  });

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
          // labelText: "Name",
          labelText: labelText,
          border: OutlineInputBorder()),
      keyboardType: TextInputType.name,
    );
  }
}
