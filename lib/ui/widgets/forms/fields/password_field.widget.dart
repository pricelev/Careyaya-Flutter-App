import 'package:careyaya/ui/widgets/forms/fields/borderless_input.widget.dart';
import 'package:careyaya/ui/widgets/forms/fields/field_container.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PasswordField extends StatelessWidget {
  // String _emailError;
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
        paddingX: 20,
        child: BorderlessInput(
          name: 'password',
          hintText: 'Password',
          icon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          enableSuggestions: false,
          obscureText: true, // Provide a way to toggle
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
          ]),
        ));
  }
}
