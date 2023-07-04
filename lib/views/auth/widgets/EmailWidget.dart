import 'package:flutter/material.dart';
import 'package:cms/views/auth/widgets/emailValidator.dart';

class EmailWidget extends StatefulWidget {
  final TextEditingController emailController;
  // final String emailError;
  final FocusNode;
  final nextField;

  EmailWidget(
      {
      // required this.emailError,
      required this.emailController,
      required this.FocusNode,
      required this.nextField,
      });

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.FocusNode,
      controller: widget.emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        // errorText: widget.emailError,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(widget.nextField);
      },
      onChanged: (value) {
        setState(() {
          // widget.emailError = emailValidator(value);
          // Set the validation status
        });
      },
      validator: emailValidator,
      onSaved: (value) {
        //_email = value!;
      },
    );
  }
}


// TextFormField EmailWidget() {

//     final TextEditingController _emailController = TextEditingController();
//     late String? _emailError = null;
//     //late String _email;

    // return TextFormField(
    //           controller: _emailController,
    //           decoration: InputDecoration(
    //               labelText: 'Email',
    //               errorText: _emailError,
    //               border: OutlineInputBorder()),
    //           keyboardType: TextInputType.emailAddress,
    //           onChanged: (value) {
    //             setState(() {
    //               _emailError = emailValidator(value);
    //               // Set the validation status
    //             });
    //           },
    //           validator: emailValidator,
    //           onSaved: (value) {
    //             //_email = value!;
    //           },
    //         );
//   }