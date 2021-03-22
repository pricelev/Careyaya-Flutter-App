import 'package:careyaya/ui/widgets/examples-session.widget.dart';
import 'package:flutter/material.dart';

class SessionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ExampleSession example = new ExampleSession("Requested", new DateTime(2021, 3, 22), "abc123", new TimeOfDay(hour: 12, minute: 00), new TimeOfDay(hour: 16, minute: 30), "2914 Somerset Dr, Charlotte, NC, USA", 20.00, 4242);
    return Column(children: [
      Row(children: [
        Column(children: [
          Text("Requested Session"),
          Text(example.sessionID),
        ],),
        Text(example.date.toString()),
      ],),
      Divider(),
      Row(children: [
        Column(children: [
          SizedBox(height: 50),
          Text("Status"),
          SizedBox(height: 20),
          Text("Time"),
          SizedBox(height: 10),
          Text("Location"),
          SizedBox(height: 10),
          Text("Rate"),
          SizedBox(height: 10),
          Text("Total Cost"),
          SizedBox(height: 10),
          Text("Payment Method"),
        ],
        crossAxisAlignment: CrossAxisAlignment.end,),
        SizedBox(width: 50),
        Column(children: [
          Chip(label: Text(example.status)),
          Text(example.startTime.toString() + " -> " + example.endTime.toString()),
          SizedBox(height: 10),
          Text(example.location),
          SizedBox(height: 10),
          Text(example.rate.toString()),
          SizedBox(height: 10),
          Text(((toDouble(example.endTime) - toDouble(example.startTime))*example.rate).toString()),
          SizedBox(height: 10),
          Text(example.paymentMethod.toString()),
        ]),
      ],),
    ],);
  }

  double toDouble(TimeOfDay time) {
    return (time.hour + (time.minute/60.0));
  }
}

