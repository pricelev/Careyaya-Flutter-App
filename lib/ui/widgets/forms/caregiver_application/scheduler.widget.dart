import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';

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
  List<TimeRange> timePeriods = <TimeRange>[];
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
      this.timePeriods.add(
        TimeRange(
          fromTitle: Text('From', style: TextStyle(fontSize: 18)),
          toTitle: Text('To', style: TextStyle(fontSize: 18)),
          firstTime: TimeOfDay(hour: 5, minute: 0),
          lastTime: TimeOfDay(hour: 23, minute: 59),
          timeStep: 15,
          timeBlock: 30,
          onRangeCompleted: (range) => setState(() => print(range)),
        )
      );
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
