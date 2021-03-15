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
        validator: FormBuilderValidators.required(context),
      ),
      FormBuilderTextField(
        name: 'lastName',
        decoration: InputDecoration(
          filled: true,
          hintText: 'Last name',
        ),
        validator: FormBuilderValidators.required(context),
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
        validator: FormBuilderValidators.required(context),
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
