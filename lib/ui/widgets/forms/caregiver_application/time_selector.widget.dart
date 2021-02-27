import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TimeSelector extends StatelessWidget {

  final int id;
  final String day;

  TimeSelector(this.id, this.day);

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      SizedBox(height: 10),
      Row( children: [
        Expanded(
          child: FormBuilderTextField(
            name: this.day + "_" + this.id.toString() + "_start",
            decoration: InputDecoration(
                filled: true,
                hintText: "Start"
            ),
          ),
        ),
        Expanded(
          child: FormBuilderDropdown(
            name: this.day + "selector0",
            items: ['AM', 'PM']
                .map((time) => DropdownMenuItem(
              value: time,
              child: Text('$time'),
            )).toList(),
          ),
        ),
        Expanded(
          child: FormBuilderTextField(
            name: this.day + "_" + this.id.toString() + "_end",
            decoration: InputDecoration(
                filled: true,
                hintText: "End"
            ),
          ),
        ),
        Expanded(
          child: FormBuilderDropdown(
            name: this.day + "selector1",
            items: ['AM', 'PM']
                .map((time) => DropdownMenuItem(
              value: time,
              child: Text('$time'),
            )).toList(),
          ),
        ),
      ]),
      SizedBox(height: 10),
    ]);
  }
}