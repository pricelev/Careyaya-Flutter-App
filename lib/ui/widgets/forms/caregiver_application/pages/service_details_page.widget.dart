import 'package:careyaya/ui/widgets/forms/fields/checkbox_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ServiceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CheckboxField(
          'tasks',
          "i. Please check all of the following tasks you're able to help with.",
          [
            'Companionship',
            'Listening to music with the LovedOne',
            'Helping the LovedOne check email and send texts',
            'Meal preparation',
            'Groceries & shopping',
            'Housekeeping',
            'Dressing',
            'Oral Hygiene',
            'Medication reminders',
            'Helping the LovedOne stay safe (i.e. fall prevention)'
          ]),
      CheckboxField(
          'certifications',
          "ii. Which of the following do you have prior experience or training with?",
          [
            'MedTech',
            'CNA',
            'PCA',
            'HHA',
            'ACA',
            'CPR',
            'Other',
          ]),
      // Need an upload field
      Text("iv. Which sexes are you willing to care for?"),
      FormBuilderRadioGroup(
        name: 'preferredSexes',
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
      Text(
          "v. What’s the furthest you’re willing to drive for a care session?"),
      FormBuilderDropdown(
        name: 'maximumSessionDistance',
        items: [20, 40, 60, 80]
            .map((distance) => DropdownMenuItem(
                  value: distance,
                  child: Text('$distance' + ' miles'),
                ))
            .toList(),
        validator: FormBuilderValidators.required(context),
      ),
      CheckboxField(
          'covidHandlingMethods',
          "vi. Please select all of the following ways you’re handling COVID risks.",
          [
            'I wear a mask when in public.',
            'I wash my hands frequently.',
            'I social distance from others.',
            'I limit interactions with people outside my household.',
            'I get tested once a week, and can upload results as needed.',
            'I am vaccinated.',
            'I have had a positive COVID test more than 14 days ago, within the past 3 months.',
          ]),
    ]);
  }
}
