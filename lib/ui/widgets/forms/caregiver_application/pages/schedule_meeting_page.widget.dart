import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ScheduleMeetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderDateTimePicker(
          name: 'meetingDateTime',
          inputType: InputType.date,
          format: DateFormat('dd-MM-yyyy HH:MM'),
          decoration: InputDecoration(
              filled: true,
              hintText: 'Select a time to meet with us'
          ),
          validator: FormBuilderValidators.required(context),
        ),
      ]
    );
  }
}