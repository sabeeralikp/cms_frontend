import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String labelText;
  final TextEditingController textController;
  final FocusNode;
  final nextField;

  TextFieldWidget({
    super.key,
    required this.labelText,
    required this.FocusNode,
    required this.textController,
    required this.nextField,
  });

  @override
  State<TextFieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        focusNode: widget.FocusNode,
        controller: widget.textController,
        decoration: InputDecoration(
            labelText: widget.labelText, border: OutlineInputBorder()),
        keyboardType: TextInputType.name,
        onSubmitted: (value) {
          FocusScope.of(context).requestFocus(widget.nextField);
        });
  }
}
