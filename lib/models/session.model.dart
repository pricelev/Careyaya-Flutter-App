import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:careyaya/models/address.model.dart';

class SessionModel {

  final String sessionID;
  final bool accepted;
  final Address address;
  final int hourlyRate;
  final int totalCost;
  final DateTime startTime;
  final DateTime endTime;
  final double hoursCount;
  final String joygiverID;
  final String lovedOneFirstName;
  final String lovedOneLastName;

  const SessionModel({
    @required this.sessionID,
    @required this.accepted,
    @required this.address,
    @required this.hourlyRate,
    @required this.totalCost,
    @required this.startTime,
    @required this.endTime,
    @required this.hoursCount,
    @required this.joygiverID,
    @required this.lovedOneFirstName,
    @required this.lovedOneLastName,
  });



}