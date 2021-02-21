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
          validator: FormBuilderValidators.required(context),
        ),
        FormBuilderTextField(
          name: 'experienceDescription',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Experience Description',
          ),
          validator: FormBuilderValidators.required(context),
        ),
        // Need number formatter / mask
        FormBuilderTextField(
          name: 'hourlyRate',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Hourly Rate',
          ),
          validator: FormBuilderValidators.required(context),
        ),
      ],
    );
  }
}
