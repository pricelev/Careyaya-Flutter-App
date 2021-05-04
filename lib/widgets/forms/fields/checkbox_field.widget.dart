import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckboxFieldOption extends StatelessWidget {
  final String value;
  final String label;

  CheckboxFieldOption({@required this.value, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CheckboxField extends StatelessWidget {
  final String fieldName;
  final String fieldTitle;
  final List<CheckboxFieldOption> fieldOptions;

  CheckboxField(this.fieldName, this.fieldTitle, this.fieldOptions);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(this.fieldTitle),
        FormBuilderCheckboxGroup(
          name: this.fieldName,
          options: this
              .fieldOptions
              .map<FormBuilderFieldOption>((option) => FormBuilderFieldOption(
                  value: option.value, child: Text(option.label)))
              .toList(growable: false),
        ),
      ],
    );
  }
}
