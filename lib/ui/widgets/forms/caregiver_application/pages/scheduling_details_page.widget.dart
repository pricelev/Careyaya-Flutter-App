import 'package:careyaya/ui/widgets/forms/caregiver_application/scheduler.widget.dart';
import 'package:flutter/material.dart';

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
    ]);
  }
}
