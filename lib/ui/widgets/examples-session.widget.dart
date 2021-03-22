import 'package:flutter/material.dart';

class ExampleSession extends StatelessWidget {

  String status;
  DateTime date;
  String sessionID;
  TimeOfDay startTime;
  TimeOfDay endTime;
  String location;
  double rate;
  int paymentMethod;

  ExampleSession(this.status, this.date, this.sessionID, this.startTime, this.endTime, this.location, this.rate, this.paymentMethod);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
