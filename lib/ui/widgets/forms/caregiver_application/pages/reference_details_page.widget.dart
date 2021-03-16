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
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
                (val){
              if(val.contains('1') || val.contains('2')  || val.contains('3')  || val.contains('4')  || val.contains('5')  || val.contains('6')  || val.contains('7') ||
                  val.contains('8') || val.contains('9') || val.contains('0') || val.contains('~') || val.contains('`') || val.contains('!') || val.contains('@') || val.contains('#') ||
                  val.contains('%') || val.contains('^') || val.contains('&') || val.contains('*') || val.contains('(') || val.contains(')') || val.contains('-') || val.contains('_') ||
                  val.contains('+') || val.contains('=') || val.contains('[') || val.contains(']') || val.contains('{') || val.contains('}') || val.contains('"') || val.contains(':') ||
                  val.contains(';') || val.contains('<') || val.contains(',') || val.contains('>') || val.contains('?') || val.contains('/') || val.contains('|')){
                return 'value contains special characters or letters';
              }
              return null;
            }
          ]),
        ),
        FormBuilderDropdown(
          name: 'reference1Relationship',
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
          name: 'reference1PhoneNumber',
          keyboardType: TextInputType.number,
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
          name: 'reference1Email',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Reference Email',
          ),
          validator: FormBuilderValidators.compose([
        FormBuilderValidators.email(context),
        FormBuilderValidators.required(context)
      ]),
        ),
        Text("Reference #2"),
        FormBuilderTextField(
          name: 'reference2Name',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Reference Name',
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
                (val){
              if(val.contains('1') || val.contains('2')  || val.contains('3')  || val.contains('4')  || val.contains('5')  || val.contains('6')  || val.contains('7') ||
                  val.contains('8') || val.contains('9') || val.contains('0') || val.contains('~') || val.contains('`') || val.contains('!') || val.contains('@') || val.contains('#') ||
                  val.contains('%') || val.contains('^') || val.contains('&') || val.contains('*') || val.contains('(') || val.contains(')') || val.contains('-') || val.contains('_') ||
                  val.contains('+') || val.contains('=') || val.contains('[') || val.contains(']') || val.contains('{') || val.contains('}') || val.contains('"') || val.contains(':') ||
                  val.contains(';') || val.contains('<') || val.contains(',') || val.contains('>') || val.contains('?') || val.contains('/') || val.contains('|')){
                return 'value contains special characters or letters';
              }
              return null;
            }
          ]),
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
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.numeric(context),
            FormBuilderValidators.required(context)
          ]),
        ),
        FormBuilderTextField(
          name: 'reference2Email',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Reference Email',
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.email(context),
            FormBuilderValidators.required(context)
          ]),
        ),
      ]
    );
  }
}