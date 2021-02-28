import 'package:flutter/material.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/time_selector.widget.dart';

/*class Scheduler extends StatelessWidget {

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
}*/

class Scheduler extends StatefulWidget {

  final String day;

  const Scheduler(this.day);

  @override
  _SchedulerState createState() => _SchedulerState();
}

class _SchedulerState extends State<Scheduler> {

  int numPeriods = 1;
  List<TimeSelector> timePeriods = <TimeSelector>[];

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      Text(widget.day),
      ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: this.timePeriods.length,
          itemBuilder: (context, index) {
            return this.timePeriods[index];
          }
      ),
      ElevatedButton(onPressed: _handleAddTimePress, child: Text("+")),
      SizedBox(height: 10),
    ]);
  }

  _handleAddTimePress() {
      setState(() {
        this.timePeriods.add(TimeSelector(this.widget.day.toLowerCase(), this.numPeriods));
        this.numPeriods = this.numPeriods + 1;
      });
  }
}
