import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/scheduler.widget.dart';

class SchedulingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Scheduler("Sunday"),
        Scheduler("Monday"),
        Scheduler("Tuesday"),
        Scheduler("Wednesday"),
        Scheduler("Thursday"),
        Scheduler("Friday"),
        Scheduler("Saturday"),
      ]
    );
  }
}