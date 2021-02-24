import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class JoygiverProfileDetailsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        // need a way of adding a profile photo
        Text("In 2-3 sentences, introduce yourself to people viewing your profile"),
        FormBuilderTextField(
          name: 'intro',
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            filled: true,
            hintText: "Enter you answer here"
          )
        ),
        FormBuilderChipsInput(
          name: 'hobbies',
          decoration: InputDecoration(
            filled: true,
            labelText: "Hobbies",
            hintText: "Enter a hobby and press return"
          )
        ),
        FormBuilderSearchableDropdown(
          name: "foreignLanguages",
          decoration: InputDecoration(
            filled: true,
            labelText: 'Select any foreign languages you speak'
          ),
          items: null
        ),
        FormBuilderCheckboxGroup(
          decoration: InputDecoration(labelText: 'Please Select any of the following that apply'),
          name: 'preferences',
          options: [
            'I am comfortable with pets',
            'I have transportation',
            'I am willing to drive the person recieving care',
            'I am a smoker',
          ].map((lang) => FormBuilderFieldOption(
            value: lang[0],
            child: Text(lang),
          ))
              .toList(growable: false),
        ),
        Text("What is the most challenging situation you've been in as a caregiver? How did you handle that?"),
        FormBuilderTextField(
            name: 'challengingSituation',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                filled: true,
                hintText: "Enter your answer here"
            )
        ),
        Text("What would you do if a LovedOne falls, becomes confused, and doesn’t recognize you?"),
        FormBuilderTextField(
            name: 'situational',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                filled: true,
                hintText: "Enter your answer here"
            )
        ),
        Text("Why should a careseeker hire you? What do you bring to the table?"),
        FormBuilderTextField(
            name: 'selfPitch',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                filled: true,
                hintText: "Enter your answer here"
            )
        ),
      ],
    );
  }
}