import 'package:cms/views/auth/widgets/passwordValidator.dart';
import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  final TextEditingController passwordController;
  final FocusNode;
  final nextField;
  // final String passwordError;

  PasswordWidget({
    required this.passwordController,
    required this.FocusNode,
    required this.nextField,
    // required this.passwordError,
  });

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      focusNode: widget.FocusNode,
       onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(widget.nextField);
        },
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
        // errorText: widget.passwordError,
      ),
      obscureText: true,
      validator: passwordValidator,
      onChanged: (value) {
        setState(() {
          // widget.passwordError = passwordValidator(value);
          // Set the validation status
        });
      },
    );
  }
}


// TextFormField passwordWidget()  {
//     return TextFormField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//                 errorText: _passwordError,
//               ),
//               obscureText: true,
//               validator: passwordValidator,
//               onSaved: (value) {
//                 _password = value!;
//               },
//               onChanged: (value) {
//                 setState(() {
//                   _passwordError = passwordValidator(value);
//                   // Set the validation status
//                 });
//               },
//             );
//   }