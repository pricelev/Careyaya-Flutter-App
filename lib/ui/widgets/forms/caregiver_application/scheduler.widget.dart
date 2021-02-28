import 'package:flutter/material.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/time_selector.widget.dart';

class Scheduler extends StatelessWidget {

  final String day;

  Scheduler(this.day);

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      Text(this.day),
      SizedBox(height: 10),
      TimeSelector(this.day.toLowerCase(), 0),
      SizedBox(height: 10),
      ElevatedButton(onPressed: null, child: Text("+")),
      SizedBox(height: 10),
    ]);
  }
}