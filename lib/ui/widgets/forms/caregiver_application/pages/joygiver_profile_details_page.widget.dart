import 'package:careyaya/ui/widgets/forms/fields/image_picker.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
            name: 'hobbies',
            decoration: InputDecoration(
                filled: true,
                labelText: "Hobbies",
                hintText: "Enter a hobby and press return")),
        FormBuilderDropdown(
          name: "foreignLanguages",
          decoration: InputDecoration(
              filled: true,
              labelText: 'Select any foreign languages you speak'),
          items: [
            'Afrikaans',
            'Arabic',
            'Bengali',
            'Bulgarian',
            'Catalan',
            'Cantonese',
            'Croatian',
            'Czech',
            'Danish',
            'Dutch',
            'Lithuanian',
            'Malay',
            'Malayalam',
            'Panjabi',
            'Tamil',
            'English',
            'Finnish',
            'French',
            'German',
            'Greek',
            'Hebrew',
            'Hindi',
            'Hungarian',
            'Indonesian',
            'Italian',
            'Japanese',
            'Javanese',
            'Korean',
            'Norwegian',
            'Polish',
            'Portuguese',
            'Romanian',
            'Russian',
            'Serbian',
            'Slovak',
            'Slovene',
            'Spanish',
            'Swedish',
            'Telugu',
            'Thai',
            'Turkish',
            'Ukrainian',
            'Vietnamese',
            'Welsh',
            'Sign language',
            'Algerian',
            'Aramaic',
            'Armenian',
            'Berber',
            'Burmese',
            'Bosnian',
            'Brazilian',
            'Bulgarian',
            'Cypriot',
            'Corsica',
            'Creole',
            'Scottish',
            'Egyptian',
            'Esperanto',
            'Estonian',
            'Finn',
            'Flemish',
            'Georgian',
            'Hawaiian',
            'Indonesian',
            'Inuit',
            'Irish',
            'Icelandic',
            'Latin',
            'Mandarin',
            'Nepalese',
            'Sanskrit',
            'Tagalog',
            'Tahitian',
            'Tibetan',
            'Tsigan',
            'Wu'
          ]
              .map((language) => DropdownMenuItem(
                    value: language,
                    child: Text('$language'),
                  ))
              .toList(),
        ),

        FormBuilderCheckboxGroup(
          decoration: InputDecoration(
              labelText: 'Please Select any of the following that apply'),
          name: 'preferences',
          options: [
            'I am comfortable with pets',
            'I have transportation',
            'I am willing to drive the person recieving care',
            'I am a smoker',
          ]
              .map((lang) => FormBuilderFieldOption(
                    value: lang[0],
                    child: Text(lang),
                  ))
              .toList(growable: false),
        ),
        Text(
            "What is the most challenging situation you've been in as a caregiver? How did you handle that?"),
        FormBuilderTextField(
            name: 'challengingSituation',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                filled: true, hintText: "Enter your answer here")),
        Text(
            "What would you do if a LovedOne falls, becomes confused, and doesn’t recognize you?"),
        FormBuilderTextField(
            name: 'situational',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                filled: true, hintText: "Enter your answer here")),
        Text(
            "Why should a careseeker hire you? What do you bring to the table?"),
        FormBuilderTextField(
            name: 'selfPitch',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                filled: true, hintText: "Enter your answer here")),
      ],
    );
  }
}
