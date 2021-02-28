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
  ElevatedButton removeTimePeriodBttn;

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      Text(widget.day),
      ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: this.timePeriods.length,
          itemBuilder: (context, index) {
            return Column(children: [
              SizedBox(height: 10),
              this.timePeriods[index],
              SizedBox(height: 10),
            ]);
          }
      ),
      Row(children: [
        Expanded(child: ElevatedButton(onPressed: _handleAddTimePress, child: Text("+"))),
        Expanded(child: ElevatedButton(onPressed: _handleRemoveTimePress, child: Text("-")))
      ]),
      SizedBox(height: 10),
    ]);
  }

  _handleAddTimePress() {
    setState(() {
      this.timePeriods.add(TimeSelector(this.widget.day.toLowerCase(), this.numPeriods));
      this.numPeriods = this.numPeriods + 1;
    });
  }

  _handleRemoveTimePress() {
    setState(() {
      if (this.numPeriods > 1) {
        this.timePeriods.removeLast();
        this.numPeriods = this.numPeriods - 1;
      }
    });
  }
}
