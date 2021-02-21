import 'package:careyaya/ui/widgets/forms/caregiver_application/caregiver_application_form.widget.dart';
import 'package:flutter/material.dart';

class ApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CaregiverApplicationForm(),
      ),
    );
  }
}
