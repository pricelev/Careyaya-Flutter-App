import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ReferenceDetailsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Reference #1"),
      FormBuilderTextField(
        name: 'references.1.name',
        decoration: InputDecoration(
          filled: true,
          hintText: 'Reference Name',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(context),
          (val) {
            if (val.contains('1') ||
                val.contains('2') ||
                val.contains('3') ||
                val.contains('4') ||
                val.contains('5') ||
                val.contains('6') ||
                val.contains('7') ||
                val.contains('8') ||
                val.contains('9') ||
                val.contains('0') ||
                val.contains('~') ||
                val.contains('`') ||
                val.contains('!') ||
                val.contains('@') ||
                val.contains('#') ||
                val.contains('%') ||
                val.contains('^') ||
                val.contains('&') ||
                val.contains('*') ||
                val.contains('(') ||
                val.contains(')') ||
                val.contains('-') ||
                val.contains('_') ||
                val.contains('+') ||
                val.contains('=') ||
                val.contains('[') ||
                val.contains(']') ||
                val.contains('{') ||
                val.contains('}') ||
                val.contains('"') ||
                val.contains(':') ||
                val.contains(';') ||
                val.contains('<') ||
                val.contains(',') ||
                val.contains('>') ||
                val.contains('?') ||
                val.contains('/') ||
                val.contains('|')) {
              return 'value contains special characters or letters';
            }
            return null;
          }
        ]),
      ),
      FormBuilderDropdown(
        name: 'references.1.relationship',
        decoration: InputDecoration(
          filled: true,
          hintText: 'Select your relationship',
        ),
        validator: FormBuilderValidators.compose(
            [FormBuilderValidators.required(context)]),
        items: ['Employer', 'Personal']
            .map((relationship) => DropdownMenuItem(
                  value: relationship.toLowerCase(),
                  child: Text(relationship),
                ))
            .toList(),
      ),
      FormBuilderTextField(
        name: 'references.1.phone',
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          filled: true,
          hintText: 'Reference Phone Number',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.numeric(context),
          FormBuilderValidators.required(context)
        ]),
      ),
      FormBuilderTextField(
        name: 'references.1.email',
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          hintText: 'Reference Email',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.email(context),
        ]),
      ),
      Text("Reference #2"),
      FormBuilderTextField(
        name: 'references.2.name',
        decoration: InputDecoration(
          filled: true,
          hintText: 'Reference Name',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(context),
          (val) {
            if (val.contains('1') ||
                val.contains('2') ||
                val.contains('3') ||
                val.contains('4') ||
                val.contains('5') ||
                val.contains('6') ||
                val.contains('7') ||
                val.contains('8') ||
                val.contains('9') ||
                val.contains('0') ||
                val.contains('~') ||
                val.contains('`') ||
                val.contains('!') ||
                val.contains('@') ||
                val.contains('#') ||
                val.contains('%') ||
                val.contains('^') ||
                val.contains('&') ||
                val.contains('*') ||
                val.contains('(') ||
                val.contains(')') ||
                val.contains('-') ||
                val.contains('_') ||
                val.contains('+') ||
                val.contains('=') ||
                val.contains('[') ||
                val.contains(']') ||
                val.contains('{') ||
                val.contains('}') ||
                val.contains('"') ||
                val.contains(':') ||
                val.contains(';') ||
                val.contains('<') ||
                val.contains(',') ||
                val.contains('>') ||
                val.contains('?') ||
                val.contains('/') ||
                val.contains('|')) {
              return 'value contains special characters or letters';
            }
            return null;
          }
        ]),
      ),
      FormBuilderDropdown(
        name: 'references.2.relationship',
        decoration: InputDecoration(
          filled: true,
          hintText: 'Select your relationship',
        ),
        validator: FormBuilderValidators.compose(
            [FormBuilderValidators.required(context)]),
        items: ['Employer', 'Personal']
            .map((relationship) => DropdownMenuItem(
                  value: relationship.toLowerCase(),
                  child: Text(relationship),
                ))
            .toList(),
      ),
      FormBuilderTextField(
        name: 'references.2.phone',
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          filled: true,
          hintText: 'Reference Phone Number',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.numeric(context),
          FormBuilderValidators.required(context)
        ]),
      ),
      FormBuilderTextField(
        name: 'references.2.email',
        decoration: InputDecoration(
          filled: true,
          hintText: 'Reference Email',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.email(context),
        ]),
      ),
    ]);
  }
}
