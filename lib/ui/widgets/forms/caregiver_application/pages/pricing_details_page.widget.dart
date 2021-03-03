import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PricingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderTextField(
          name: 'yearsExperience',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Years Experience',
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.numeric(context),
            FormBuilderValidators.required(context)
          ]),
        ),
        FormBuilderTextField(
          name: 'experienceDescription',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Experience Description (max 200 char)',
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
            FormBuilderValidators.maxLength(context, 200)
          ]),
        ),
        // Need number formatter / mask
        FormBuilderTextField(
          name: 'hourlyRate',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Hourly Rate',
          ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.numeric(context),
              FormBuilderValidators.required(context)
            ]),
        ),
      ],
    );
  }
}
