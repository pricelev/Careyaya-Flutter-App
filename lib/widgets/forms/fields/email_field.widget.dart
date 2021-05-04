import 'package:careyaya/widgets/forms/fields/borderless_input.widget.dart';
import 'package:careyaya/widgets/forms/fields/field_container.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EmailField extends StatelessWidget {
  // String _emailError;
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
        paddingX: 20,
        child: BorderlessInput(
          name: 'email',
          hintText: 'Email',
          icon: const Icon(
            Icons.email,
            color: Colors.black,
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
            FormBuilderValidators.email(context),
          ]),
        ));
  }
}
