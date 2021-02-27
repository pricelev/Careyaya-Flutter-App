import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/time_selector.widget.dart';

class SchedulingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Sunday"),
        TimeSelector(0, "sunday"),
        Text("Monday"),
        TimeSelector(0, "monday"),
        Text("Tuesday"),
        TimeSelector(0, "tuesday"),
        Text("Wednesday"),
        TimeSelector(0, "Wednesday"),
        Text("Thursday"),
        TimeSelector(0, "thursday"),
        Text("Friday"),
        TimeSelector(0, "friday"),
        Text("Saturday"),
        TimeSelector(0, "saturday"),
      ]
    );
  }
}