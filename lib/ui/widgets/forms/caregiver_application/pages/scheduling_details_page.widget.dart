import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SchedulingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderTextField(
          name: 'weeklySchedule',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Tell us your weekly availability'
          ),
          validator: FormBuilderValidators.required(context)
        )
      ]
    );
  }
}