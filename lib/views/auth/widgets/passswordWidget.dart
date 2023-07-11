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
  bool passwordVisible=false; 
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
        suffixIcon: IconButton(icon: Icon(passwordVisible
                         ? Icons.visibility
                         : Icons.visibility_off), onPressed: () {  
                          setState(() {
                           passwordVisible = !passwordVisible;
                          }, );
                         },),
        alignLabelWithHint: false,
        border: OutlineInputBorder(),
        // errorText: widget.passwordError,
      ),
      obscureText: !passwordVisible,
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
