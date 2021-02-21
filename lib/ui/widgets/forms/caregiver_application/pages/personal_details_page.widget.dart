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
        decoration: InputDecoration(labelText: 'Sex'),
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
      // FormBuilderTextField(
      //   name: 'address',
      //   decoration: InputDecoration(
      //     filled: true,
      //     hintText: 'Address',
      //   ),
      //   validator: FormBuilderValidators.required(context),
      // ),
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
    ]);
    // FormBuilderTextField(
    //   name: 'availability',
    //   decoration: InputDecoration(
    //     filled: true,
    //     hintText: 'Availability',
    //   ),
    //   validator: FormBuilderValidators.required(context),
    // ),
    // FormBuilderCheckbox(
    //     name: 'schedulingFlexibility',
    //     initialValue: false,
    //     title: RichText(
    //       text: TextSpan(children: [
    //         TextSpan(
    //           text:
    //               'I would like to be included as a Joygiver with flexible hours, who will be offered higher pay opportunities in emergency situations.',
    //           style: TextStyle(color: Colors.black),
    //         ),
    //       ]),
    //     )),
    // FormBuilderDropdown(
    //   name: 'referralMethod',
    //   validator: FormBuilderValidators.required(context),
    //   items: [
    //     {
    //       'label': 'Advertisement',
    //       'value': 'advertisement',
    //     },
    //     {
    //       'label': 'Friend',
    //       'value': 'friend',
    //     },
    //     {
    //       'label': 'Other',
    //       'value': 'other',
    //     },
    //   ]
    //       .map((gender) => DropdownMenuItem(
    //             value: gender['value'],
    //             child: Text('${gender['label']}'),
    //           ))
    //       .toList(),
    //   decoration: InputDecoration(
    //     labelText: 'Referral Method',
    //   ),
    // ),
  }
}
