import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TimeSelector extends StatelessWidget {

  final String day;
  final int id;

  TimeSelector(this.day, this.id);

  @override
  Widget build(BuildContext context) {
    return Row( children: [
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
      ]);
  }
}