import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';

class SessionGenerator {
  SessionGenerator._();

  static SessionModel generateSession() {
    final faker = new Faker();

    final streetAddress = faker.address.streetAddress();
    final address = '$streetAddress, Chapel Hill, NC, USA';

    final hourlyRate = faker.randomGenerator.integer(2000, min: 1100);
    final hoursCount = faker.randomGenerator.integer(8, min: 3);

    final joygiverId = faker.guid.guid();
    final advocateId = faker.guid.guid();
    final lovedOneId = faker.guid.guid();

    return new SessionModel(
      id: faker.guid.guid(),
      values: {
        'joygiverId': joygiverId,
        'advocateId': advocateId,
        'lovedOneId': lovedOneId,
        'address': {
          'description': address,
          'state': "North Carolina",
          'longitude': -78.685220,
          'latitude': 35.707170,
          'city': "Chapel Hill",
          'line1': streetAddress,
          'placeId':
              faker.guid.guid(), // Potentially want to use real place IDs
          'zip': faker.address.zipCode(),
        },
        'distance': faker.randomGenerator.integer(10, min: 1),
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
        'hourlyRate': hourlyRate,
        'hoursCount': hoursCount,
        'totalCost': hourlyRate * hoursCount,
        'createdBy': advocateId,
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
        'stripeCustomerId': 'cus_${faker.guid.guid()}',
        'stripePaymentIntentHoldCaptured': false,
        'stripeAccountId': 'acct_${faker.guid.guid()}',
        'stripePaymentIntentId': 'pi_${faker.guid.guid()}',
        'stripePaymentMethodId': 'pm_${faker.guid.guid()}',
        'stripeTransferId': null
      },
    );
  }
}
