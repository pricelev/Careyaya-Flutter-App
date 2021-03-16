import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdentityDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderDateTimePicker(
          name: 'birthdate',
          inputType: InputType.date,
          format: DateFormat('dd-MM-yyyy'),
          decoration: InputDecoration(
            filled: true,
            hintText: 'Birthdate'
          ),
          validator: FormBuilderValidators.required(context),
        ),
        FormBuilderTextField(
          name: 'ssn',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            hintText: 'xxx-xx-xxxx',
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
            FormBuilderValidators.numeric(context, errorText: 'Please do not use letters or special characters'),
            FormBuilderValidators.minLength(context, 9, errorText: 'A SSN has 9 digits'),
            FormBuilderValidators.maxLength(context, 9, errorText: 'A SSN has 9 digits'),
          ]),
        ),
        FormBuilderTextField(
          name: 'driversLicenseNumber',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Drivers License Number',
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
            FormBuilderValidators.minLength(context, 4, errorText: 'A Drivers License number has from 4-15 letters and numbers'),
            FormBuilderValidators.maxLength(context, 15, errorText: 'A Drivers License number has from 4-15 letters and numbers'),
                (val){
                  if(val.contains('~') || val.contains('`') || val.contains('!') || val.contains('@') || val.contains('#') ||
                  val.contains('%') || val.contains('^') || val.contains('&') || val.contains('*') || val.contains('(') || val.contains(')') || val.contains('-') || val.contains('_') ||
                  val.contains('+') || val.contains('=') || val.contains('[') || val.contains(']') || val.contains('{') || val.contains('}') || val.contains('"') || val.contains(':') ||
                  val.contains(';') || val.contains('<') || val.contains(',') || val.contains('>') || val.contains('?') || val.contains('/') || val.contains('|'))
                  {
                    return 'value contains special characters';
                  }
              return null;
            }
          ]),
        )
      ]
    );
  }
}