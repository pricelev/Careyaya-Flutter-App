import 'package:careyaya/models/sessions/session.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExampleSessions {
  List<SessionModel> generateSessions() {
    List<SessionModel> sessions = new List<SessionModel>();
    for (var i = 0; i < 3; i++) {
      sessions.add(
        new SessionModel(
          id: "abc123",
          values: {
            'joygiverId': 'RyD7HIrMrUYgavB1QgKdH9b7ZE42',
            'advocateId': '4oDbGXOrYQS5sRLFe7LcXC8Zz6I3',
            'lovedOneId': 'lovedOneID',
            'address': {
              'description': "2914 Somerset Drive, Charlotte, NC, USA",
              'state': "North Carolina",
              'longitude': null,
              'latitude': null,
              'city': "Charlotte",
              'line1': "2914 Somerset Drive",
              'placeId': "ChIJ5RetIKefVogR63y72aQrvJo",
              'zip': "28209",
            },
            'distance': 2.336977054004613,
            'timeSlots': List.from([
              1616428800000,
              1616430600000,
              1616432400000,
              1616434200000,
              1616436000000,
              1616437800000,
              1616439600000,
              1616441400000,
              1616443200000
            ]),
            'startTimestamp': new Timestamp(0, 0),
            'endTimestamp': new Timestamp(0, 0),
            'hourlyRate': 2000,
            'hoursCount': 4.5,
            'totalCost': 9000,
            'createdBy': "4oDbGXOrYQS5sRLFe7LcXC8Zz6I3",
            'accepted': false,
            'acceptedAt': null,
            'rejected': false,
            'rejectedAt': null,
            'reviewedByAdvocate': false,
            'reviewedByAdvocateAt': null,
            'completed': false,
            'completedAt': null,
            'canceled': false,
            'canceledAt': null,
            'canceledBy': null,
            'reviewedByJoygiver': false,
            'reviewedByJoygiverAt': null,
            'disputed': false,
            'disputedAt': null,
            'expired': false,
            'expiresAt': null,
            'stripeCustomerId': 'cus_J3S3kDrMvjdq68',
            'stripePaymentIntentHoldCaptured': false,
            'stripeAccountId': 'acct_1IRMNU2Ejk5gTAwe',
            'stripePaymentIntentId': 'pi_1IW5UuFusU4ws83pwdrJwPzn',
            'stripePaymentMethodId': 'pm_1IW5RJFusU4ws83prfYCknwr',
            'stripeTransferId': null
          },
        ),
      );
    }
    return sessions;
  }
}
