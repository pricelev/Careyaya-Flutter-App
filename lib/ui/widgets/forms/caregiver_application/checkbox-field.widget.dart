import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckboxField extends StatelessWidget {

  final String fieldName;
  final String fieldTitle;
  final fieldOptions;

  CheckboxField(this.fieldName, this.fieldTitle, this.fieldOptions);

  @override
  Widget build(BuildContext context) {

    return Wrap(
      children: [
        Text(this.fieldTitle),
        FormBuilderCheckboxGroup(
            name: this.fieldName,
            options: this.fieldOptions.map<FormBuilderFieldOption>((option) => FormBuilderFieldOption(value: option[0], child: Text(option))).toList(growable: false),
        )
      ],
    );

  }




}