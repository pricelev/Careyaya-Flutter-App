import 'package:careyaya/ui/widgets/forms/caregiver_application/scheduler.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SchedulingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Scheduler(
        day: "Sunday",
      ),
      Scheduler(
        day: "Monday",
      ),
      Scheduler(
        day: "Tuesday",
      ),
      Scheduler(
        day: "Wednesday",
      ),
      Scheduler(
        day: "Thursday",
      ),
      Scheduler(
        day: "Friday",
      ),
      Scheduler(
        day: "Saturday",
      ),
      FormBuilderCheckbox(
          name: 'schedulingFlexibility',
          initialValue: false,
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                text:
                    'I would like to be included as a Joygiver with flexible hours, who will be offered higher pay opportunities in emergency situations.',
                style: TextStyle(color: Colors.black),
              ),
            ]),
          )),
    ]);
  }
}
