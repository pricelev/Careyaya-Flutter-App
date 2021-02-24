import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ReferenceDetailsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Reference #1"),
        FormBuilderTextField(
          name: 'reference1Name',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Reference Name',
          ),
          validator: FormBuilderValidators.required(context),
        ),
        FormBuilderDropdown(
          name: 'reference1Relationship',
          items: ['Employer', 'Personal']
              .map((relationship) => DropdownMenuItem(
            value: relationship,
            child: Text('$relationship'),
          )).toList(),
        ),
        FormBuilderTextField(
          name: 'reference1PhoneNumber',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Reference Phone Number',
          ),
          validator: FormBuilderValidators.required(context),
        ),
        FormBuilderTextField(
          name: 'reference1Email',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Reference Email',
          ),
          validator: FormBuilderValidators.required(context),
        ),
        Text("Reference #2"),
        FormBuilderTextField(
          name: 'reference2Name',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Reference Name',
          ),
          validator: FormBuilderValidators.required(context),
        ),
        FormBuilderDropdown(
          name: 'reference2Relationship',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Select your relationship',
          ),
          items: ['Employer', 'Personal']
              .map((relationship) => DropdownMenuItem(
            value: relationship,
            child: Text('$relationship'),
          )).toList(),
        ),
        FormBuilderTextField(
          name: 'reference2PhoneNumber',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Reference Phone Number',
          ),
          validator: FormBuilderValidators.required(context),
        ),
        FormBuilderTextField(
          name: 'reference2Email',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Reference Email',
          ),
          validator: FormBuilderValidators.required(context),
        ),
      ]
    );
  }
}