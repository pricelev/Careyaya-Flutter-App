import 'package:careyaya/ui/widgets/forms/fields/address_search_autocomplete.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PersonalDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FormBuilderTextField(
        name: 'name.first',
        decoration: InputDecoration(
          filled: true,
          hintText: 'Legal first name',
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
      FormBuilderTextField(
        name: 'name.last',
        decoration: InputDecoration(
          filled: true,
          hintText: 'Legal last name',
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
      FormBuilderRadioGroup(
        decoration: InputDecoration(
          labelText: 'Sex',
        ),
        name: 'sex',
        options: [
          {
            'label': 'Female',
            'value': 'F',
          },
          {
            'label': 'Male',
            'value': 'M',
          }
        ]
            .map((sex) => FormBuilderFieldOption(
                  value: sex['value'],
                  child: Text(sex['label']),
                ))
            .toList(growable: false),
        validator: FormBuilderValidators.required(context),
      ),
      // FormBuilderTextField(
      //   name: 'email',
      //   keyboardType: TextInputType.emailAddress,
      //   decoration: InputDecoration(
      //     filled: true,
      //     hintText: 'Email',
      //   ),
      //   validator: FormBuilderValidators.compose([
      //     FormBuilderValidators.required(context),
      //     FormBuilderValidators.email(context),
      //   ]),
      // ),
      // Need number formatter / mask
      FormBuilderTextField(
        name: 'phoneNumber',
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          filled: true,
          hintText: 'Phone number',
        ),
        inputFormatters: [
          MaskTextInputFormatter(mask: '+1 (###) ### ####'),
        ],
        valueTransformer: (String value) =>
            value.replaceAll(RegExp("\\D"), "").substring(1),
        // onChanged: (String value) => {phoneController.text = value},
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(context),
          FormBuilderValidators.minLength(context, 17,
              errorText: 'Please use area code and seven digit phone number'),
        ]),
      ),
      AddressSearchAutocompleteWidget(),
      FormBuilderTextField(
        name: 'address.line2',
        decoration: InputDecoration(
          filled: true,
          hintText: 'Address Line 2 / Apt # (Optional)',
        ),
      ),
    ]);
  }
}
