import 'package:careyaya/ui/widgets/forms/fields/AddressSearchAutocomplete.widget.dart';
import 'package:careyaya/ui/widgets/forms/fields/email_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PersonalDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FormBuilderTextField(
        name: 'firstName',
        decoration: InputDecoration(
          filled: true,
          hintText: 'First name',
        ),
        validator:  FormBuilderValidators.compose([
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
      FormBuilderTextField(
        name: 'lastName',
        decoration: InputDecoration(
          filled: true,
          hintText: 'Last name',
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
      FormBuilderRadioGroup(
        decoration: InputDecoration(
          labelText: 'Sex',
        ),
        name: 'sex',
        options: [
          'Male',
          'Female',
        ]
            .map((lang) => FormBuilderFieldOption(
                  value: lang[0],
                  child: Text(lang),
                ))
            .toList(growable: false),
        validator: FormBuilderValidators.required(context),
      ),
      EmailField(),
      AddressSearchAutocompleteWidget(),
      // Need number formatter / mask
      FormBuilderTextField(
        name: 'phoneNumber',
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          hintText: 'Phone number',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(context),
          FormBuilderValidators.numeric(context, errorText: 'Please do not use letters or special characters'),
          FormBuilderValidators.minLength(context, 10, errorText: 'Please use area code and seven digit phone number'),
          FormBuilderValidators.maxLength(context, 10, errorText: 'Please use area code and seven digit phone number'),
        ]),
      ),
      FormBuilderDropdown(
        name: 'referralMethod',
        validator: FormBuilderValidators.required(context),
        items: [
          {
            'label': 'Advertisement',
            'value': 'advertisement',
          },
          {
            'label': 'Friend',
            'value': 'friend',
          },
          {
            'label': 'Indeed',
            'value': 'indeed',
          },
          {
            'label': 'Other',
            'value': 'other',
          },
        ]
            .map((referralMethod) => DropdownMenuItem(
                  value: referralMethod['value'],
                  child: Text('${referralMethod['label']}'),
                ))
            .toList(),
        decoration: InputDecoration(
          labelText: 'Referral Method',
          filled: true,
        ),
      ),
    ]);
  }
}
