import 'package:careyaya/models/address.model.dart';
import 'package:careyaya/models/session.model.dart';

class ExampleSessions {
  
  List<SessionModel> generateSessions() {
    List<SessionModel> sessions = new List<SessionModel>();
    sessions.add(new SessionModel(
        sessionID: '0',
        accepted: false, 
        address: new Address(
            description: '2914 Somerset Drive, Charlotte, NC, USA',
            state: 'North Carolina',
            longitude: null,
            latitude: null,
            city: 'Charlotte',
            line1: '2914 Somerset Drive',
            placeId: 'ChIJ5RetIKefVogR63y72aQrvJo',
            zip: '28209'),
        hourlyRate: 2000, 
        totalCost: 9000, 
        startTime: new DateTime(2021, 3, 17, 12),
        endTime: new DateTime(2021, 3, 17, 4, 30),
        hoursCount: 4.5,
        joygiverID: 'RyD7HIrMrUYgavB1QgKdH9b7ZE42',
        lovedOneFirstName: "Betty",
        lovedOneLastName: "White"));
    sessions.add(new SessionModel(
        sessionID: '1',
        accepted: false,
        address: new Address(
            description: '2915 Somerset Drive, Charlotte, NC, USA',
            state: 'North Carolina',
            longitude: null,
            latitude: null,
            city: 'Charlotte',
            line1: '2915 Somerset Drive',
            placeId: 'ChIJ5RetIKefVogR63y72aQrvJo',
            zip: '28209'),
        hourlyRate: 1000,
        totalCost: 4500,
        startTime: new DateTime(2021, 3, 17, 12),
        endTime: new DateTime(2021, 3, 17, 4, 30),
        hoursCount: 4.5,
        joygiverID: 'RyD7HIrMrUYgavB1QgKdH9b7ZE42',
        lovedOneFirstName: "Tom",
        lovedOneLastName: "Cruise"));
    sessions.add(new SessionModel(
        sessionID: '2',
        accepted: false,
        address: new Address(
            description: '2916 Somerset Drive, Charlotte, NC, USA',
            state: 'North Carolina',
            longitude: null,
            latitude: null,
            city: 'Charlotte',
            line1: '2916 Somerset Drive',
            placeId: 'ChIJ5RetIKefVogR63y72aQrvJo',
            zip: '28209'),
        hourlyRate: 4000,
        totalCost: 18000,
        startTime: new DateTime(2021, 3, 17, 12),
        endTime: new DateTime(2021, 3, 17, 4, 30),
        hoursCount: 4.5,
        joygiverID: 'RyD7HIrMrUYgavB1QgKdH9b7ZE42',
        lovedOneFirstName: "Tom",
        lovedOneLastName: "Hanks"));
    return sessions;
  }
}