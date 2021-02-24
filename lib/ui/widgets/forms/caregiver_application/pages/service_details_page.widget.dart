import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ServiceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("i. Please check all of the following tasks you're able to help with."),
        FormBuilderCheckboxGroup(
          name: 'tasks',
          options: [
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
          ].map((lang) => FormBuilderFieldOption(
            value: lang[0],
            child: Text(lang),
          ))
              .toList(growable: false),
        ),
        Text("ii. Which of the following do you have prior experience or training with?"),
        FormBuilderCheckboxGroup(
          name: 'experienceSelection',
          options: [
            'Mobility',
            'Toileting',
            'Bathing',
            'Feeding',
          ].map((lang) => FormBuilderFieldOption(
            value: lang[0],
            child: Text(lang),
          ))
              .toList(growable: false),
        ),
        Text("iii. Please select and upload any certifications you have."),
        FormBuilderCheckboxGroup(
          name: 'certifications',
          options: [
            'MedTech',
            'CNA',
            'PCA',
            'HHA',
            'ACA',
            'CPR',
            'Other',
          ].map((lang) => FormBuilderFieldOption(
            value: lang[0],
            child: Text(lang),
          ))
              .toList(growable: false),
        ),
        // Upload certfications functionality
        Text("iv. Which sexes are you willing to care for?"),
        FormBuilderRadioGroup(
          name: 'sexPreference',
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
        Text("v. What’s the furthest you’re willing to drive for a care session?"),
        FormBuilderDropdown(
          name: 'maxDistance',
          items: ['20', '40', '60', 'More than 60']
            .map((distance) => DropdownMenuItem(
            value: distance,
            child: Text('$distance' + ' miles'),
          )).toList(),
        ),
        Text("vi. Please select all of the following ways you’re handling COVID risks."),
        FormBuilderCheckboxGroup(
          name: 'covidPrevention',
          options: [
            'I wear a mask when in public.',
            'I wash my hands frequently.',
            'I social distance from others.',
            'I limit interactions with people outside my household.',
            'I get tested once a week, and can upload results as needed.',
            'I am vaccinated.',
            'I have had a positive COVID test more than 14 days ago, within the past 3 months.',
          ].map((lang) => FormBuilderFieldOption(
            value: lang[0],
            child: Text(lang),
          ))
              .toList(growable: false),
        ),
      ]
    );
  }
}