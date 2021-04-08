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
            CheckboxFieldOption(
              value: 'companionship',
              label: 'Companionship',
            ),
            CheckboxFieldOption(
              value: 'music',
              label: 'Listening to music with the LovedOne',
            ),
            CheckboxFieldOption(
              value: 'tech',
              label: 'Helping the LovedOne check email and send texts',
            ),
            CheckboxFieldOption(
              value: 'meals',
              label: 'Meal preparation',
            ),
            CheckboxFieldOption(
              value: 'groceries',
              label: 'Groceries & shopping',
            ),
            CheckboxFieldOption(
              value: 'housekeeping',
              label: 'Housekeeping',
            ),
            CheckboxFieldOption(
              value: 'dressing',
              label: 'Dressing',
            ),
            CheckboxFieldOption(
              value: 'oral',
              label: 'Oral Hygiene',
            ),
            CheckboxFieldOption(
              value: 'medications',
              label: 'Medication reminders',
            ),
            CheckboxFieldOption(
                value: 'safety',
                label: 'Helping the LovedOne stay safe (i.e. fall prevention)'),
          ]),
      CheckboxField(
          'skills',
          "ii. Which of the following do you have prior experience or training with?",
          [
            CheckboxFieldOption(
              value: 'mobility',
              label: 'Mobility',
            ),
            CheckboxFieldOption(
              value: 'toileting',
              label: 'Toileting',
            ),
            CheckboxFieldOption(
              value: 'bathing',
              label: 'Bathing',
            ),
            CheckboxFieldOption(
              value: 'feeding',
              label: 'Feeding',
            ),
          ]),
      CheckboxField(
          'certifications', "ii. Please select any certifications you have.", [
        CheckboxFieldOption(
          value: 'MedTech',
          label: 'MedTech',
        ),
        CheckboxFieldOption(
          value: 'CNA',
          label: 'CNA',
        ),
        CheckboxFieldOption(
          value: 'PCA',
          label: 'PCA',
        ),
        CheckboxFieldOption(
          value: 'HHA',
          label: 'HHA',
        ),
        CheckboxFieldOption(
          value: 'ACA',
          label: 'ACA',
        ),
        CheckboxFieldOption(
          value: 'CPR',
          label: 'CPR',
        ),
        CheckboxFieldOption(
          value: 'Other',
          label: 'Other',
        ),
      ]),
      // Need an upload field
      CheckboxField(
        'preferredSexes',
        "iii. Which sexes are you willing to care for?",
        [
          CheckboxFieldOption(
            value: 'M',
            label: 'Male',
          ),
          CheckboxFieldOption(
            value: 'F',
            label: 'Female',
          ),
        ],
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
            CheckboxFieldOption(
              value: 'mask',
              label: 'I wear a mask when in public.',
            ),
            CheckboxFieldOption(
              value: 'hands',
              label: 'I wash my hands frequently.',
            ),
            CheckboxFieldOption(
              value: 'distance',
              label: 'I social distance from others.',
            ),
            CheckboxFieldOption(
              value: 'limit',
              label: 'I limit interactions with people outside my household.',
            ),
            CheckboxFieldOption(
              value: 'tests',
              label:
                  'I get tested once a week, and can upload results as needed.',
            ),
            CheckboxFieldOption(
              value: 'vaccination',
              label: 'I am vaccinated.',
            ),
            CheckboxFieldOption(
              value: 'antibodies',
              label:
                  'I have had a positive COVID test more than 14 days ago, within the past 3 months.',
            ),
          ]),
    ]);
  }
}
