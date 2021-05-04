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
        // Removing image picker for now, will probably move to last step soon
        // ImagePickerWidget(),
        Text(
            "In 2-3 sentences, introduce yourself to people viewing your profile"),
        FormBuilderTextField(
          name: 'introDescription',
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 4,
          decoration: InputDecoration(
            filled: true,
            hintText: "Enter you answer here",
          ),
          validator: FormBuilderValidators.required(context),
        ),
        // FormBuilderChipsInput(
        //   findSuggestions: (String query) => HOBBIES
        //       .where(
        //           (hobby) => hobby.toLowerCase().contains(query.toLowerCase()))
        //       .toList(),
        //   suggestionBuilder: (context, state, lang) => ListTile(
        //     key: ObjectKey(lang),
        //     title: Text(lang),
        //     onTap: () => state.selectSuggestion(lang),
        //   ),
        //   chipBuilder: (context, state, hobby) => Chip(label: Text(hobby)),
        //   name: 'hobbies',
        //   maxChips: 5,
        //   decoration: InputDecoration(
        //     filled: true,
        //     labelText: "Hobbies",
        //     hintText: "Enter a hobby and press return",
        //   ),
        // ),
        // FormBuilderChipsInput(
        //   name: "languages",
        //   decoration: InputDecoration(
        //     filled: true,
        //     labelText: 'Select any foreign languages you speak',
        //   ),
        //   findSuggestions: (String query) => LANGUAGES
        //       .where((lang) => lang.toLowerCase().contains(query.toLowerCase()))
        //       .toList(),
        //   suggestionBuilder: (context, state, lang) => ListTile(
        //     key: ObjectKey(lang),
        //     title: Text(lang),
        //     onTap: () => state.selectSuggestion(lang),
        //   ),
        //   chipBuilder: (context, state, lang) => Chip(label: Text(lang)),
        // ),
        Text('Please select any of the following that apply.'),
        FormBuilderCheckbox(
          name: 'isComfortableWithPets',
          title: Text('I am comfortable with pets'),
        ),
        FormBuilderCheckbox(
          name: 'hasTransportation',
          title: Text('I have transportation'),
        ),
        FormBuilderCheckbox(
          name: 'drives',
          title: Text('I am willing to drive the person receiving care'),
        ),
        FormBuilderCheckbox(
          name: 'isSmoker',
          title: Text('I am a smoker'),
        ),
        Text(
            "What is the most challenging situation you've been in as a caregiver? How did you handle that?"),
        FormBuilderTextField(
            name: 'interview.challengingSituation',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 4,
            validator: FormBuilderValidators.required(context),
            decoration: InputDecoration(
                filled: true, hintText: "Enter your answer here")),
        Text(
            "What would you do if a LovedOne falls, becomes confused, and doesn’t recognize you?"),
        FormBuilderTextField(
            name: 'interview.lovedOneFalls',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 4,
            validator: FormBuilderValidators.required(context),
            decoration: InputDecoration(
                filled: true, hintText: "Enter your answer here")),
        Text(
            "Why should a careseeker hire you? What do you bring to the table?"),
        FormBuilderTextField(
            name: 'interview.hiringReason',
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 4,
            validator: FormBuilderValidators.required(context),
            decoration: InputDecoration(
                filled: true, hintText: "Enter your answer here")),
      ],
    );
  }
}
