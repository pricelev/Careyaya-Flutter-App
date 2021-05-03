import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BorderlessInput extends StatelessWidget {
  final String name;
  final String hintText;
  final Icon icon;
  final String Function(String) validator;
  final bool enableSuggestions;
  final bool obscureText;

  BorderlessInput(
      {@required this.name,
      this.hintText: '',
      this.icon,
      this.validator,
      this.enableSuggestions: true,
      this.obscureText: false});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      autocorrect: false,
      style: TextStyle(
        color: Colors.black,
      ),
      enableSuggestions: enableSuggestions,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.black,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        icon: icon,
        // errorText:
      ),
      validator: validator,
    );
  }
}
