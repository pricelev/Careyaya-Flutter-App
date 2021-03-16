import 'package:careyaya/constants/forms/hobbies.dart';
import 'package:careyaya/constants/forms/languages.dart';
import 'package:careyaya/ui/widgets/forms/fields/image_picker.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_form_builder/flutter_form_builder.dart';

Future<String> loadHobbies() async {
  return await rootBundle.loadString('assets/config.json');
}

class JoygiverProfileDetailsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        // need a way of adding a profile photo
        ImagePickerWidget(),
        Text(
            "In 2-3 sentences, introduce yourself to people viewing your profile"),
        FormBuilderTextField(
            name: 'introDescription',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                filled: true, hintText: "Enter you answer here")),
        FormBuilderChipsInput(
          findSuggestions: (String query) => HOBBIES
              .where(
                  (hobby) => hobby.toLowerCase().contains(query.toLowerCase()))
              .toList(),
          suggestionBuilder: (context, state, lang) => ListTile(
            key: ObjectKey(lang),
            title: Text(lang),
            onTap: () => state.selectSuggestion(lang),
          ),
          chipBuilder: (context, state, hobby) => Chip(label: Text(hobby)),
          name: 'hobbies',
          maxChips: 5,
          decoration: InputDecoration(
            filled: true,
            labelText: "Hobbies",
            hintText: "Enter a hobby and press return",
          ),
        ),
        FormBuilderChipsInput(
          name: "languages",
          decoration: InputDecoration(
            filled: true,
            labelText: 'Select any foreign languages you speak',
          ),
          findSuggestions: (String query) => LANGUAGES
              .where((lang) => lang.toLowerCase().contains(query.toLowerCase()))
              .toList(),
          suggestionBuilder: (context, state, lang) => ListTile(
            key: ObjectKey(lang),
            title: Text(lang),
            onTap: () => state.selectSuggestion(lang),
          ),
          chipBuilder: (context, state, lang) => Chip(label: Text(lang)),
          // .map((language) => DropdownMenuItem(
          //       value: {
          //         'englishName': language,
          //       },
          //       child: Text(language),
          //     ))
          // .toList(),
        ),

        FormBuilderCheckboxGroup(
          decoration: InputDecoration(
              labelText: 'Please Select any of the following that apply'),
          name: 'preferences',
          options: [
            {
              'value': 'isComfortableWithPets',
              'label': 'I am comfortable with pets',
            },
            {
              'value': 'hasTransportation',
              'label': 'I have transportation',
            },
            {
              'value': 'drives',
              'label': 'I am willing to drive the person receiving care',
            },
            {
              'value': 'isSmoker',
              'label': 'I am a smoker',
            },
          ]
              .map((lang) => FormBuilderFieldOption(
                    value: lang['value'],
                    child: Text(lang['label']),
                  ))
              .toList(growable: false),
        ),
        Text(
            "What is the most challenging situation you've been in as a caregiver? How did you handle that?"),
        FormBuilderTextField(
            name: 'interview.challengingSituation',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                filled: true, hintText: "Enter your answer here")),
        Text(
            "What would you do if a LovedOne falls, becomes confused, and doesn’t recognize you?"),
        FormBuilderTextField(
            name: 'interview.lovedOneFalls',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                filled: true, hintText: "Enter your answer here")),
        Text(
            "Why should a careseeker hire you? What do you bring to the table?"),
        FormBuilderTextField(
            name: 'interview.hiringReason',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                filled: true, hintText: "Enter your answer here")),
      ],
    );
  }
}
