import 'package:careyaya/screens/joygiver_application/local_widgets/joygiver_application_form.widget.dart';
import 'package:flutter/material.dart';

class ApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: CaregiverApplicationForm(),
      ),
    );
  }
}
